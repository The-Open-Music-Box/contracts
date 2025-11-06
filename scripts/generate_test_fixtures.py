#!/usr/bin/env python3
"""
Generate test fixtures from OpenAPI specification.

This script extracts example responses from the OpenAPI spec and generates
JSON fixture files that can be used in tests to ensure realistic mocks.

Usage:
    python generate_test_fixtures.py [--check]

Options:
    --check    Check if fixtures are up-to-date (for CI)

Output:
    Generates JSON files in ../generated/fixtures/
"""

import argparse
import hashlib
import json
import sys
import yaml
from pathlib import Path
from typing import Dict, Any, List, Optional, Set
from datetime import datetime


class CircularReferenceError(Exception):
    """Raised when circular reference is detected in schema."""
    pass


class FixtureGenerator:
    """Generates test fixtures from OpenAPI specification."""

    def __init__(self, openapi_path: Path, output_dir: Path):
        self.openapi_path = openapi_path
        self.output_dir = output_dir
        self.spec: Optional[Dict[str, Any]] = None
        self._ref_stack: List[str] = []  # Track refs to detect cycles
        self._example_counter = 0  # For unique example values

    def _load_openapi(self) -> Dict[str, Any]:
        """Load OpenAPI specification from YAML file."""
        try:
            with open(self.openapi_path, 'r', encoding='utf-8') as f:
                spec = yaml.safe_load(f)

            if not isinstance(spec, dict):
                raise ValueError("OpenAPI spec must be a dictionary")

            if 'openapi' not in spec:
                raise ValueError("Invalid OpenAPI spec: missing 'openapi' field")

            return spec

        except yaml.YAMLError as e:
            raise ValueError(f"Failed to parse OpenAPI YAML: {e}")
        except FileNotFoundError:
            raise FileNotFoundError(f"OpenAPI spec not found: {self.openapi_path}")
        except Exception as e:
            raise RuntimeError(f"Unexpected error loading OpenAPI spec: {e}")

    def generate_all_fixtures(self) -> int:
        """
        Generate fixtures for all endpoints in the OpenAPI spec.

        Returns:
            Number of fixtures generated
        """
        try:
            self.spec = self._load_openapi()
        except Exception as e:
            print(f"❌ Error loading OpenAPI spec: {e}", file=sys.stderr)
            return 0

        self.output_dir.mkdir(parents=True, exist_ok=True)

        print(f"📋 Generating test fixtures from {self.openapi_path}")
        print(f"📁 Output directory: {self.output_dir}")
        print()

        fixture_count = 0
        errors: List[str] = []

        # Iterate through all paths and methods
        for path, path_item in self.spec.get('paths', {}).items():
            if not isinstance(path_item, dict):
                continue

            for method in ['get', 'post', 'put', 'patch', 'delete']:
                if method not in path_item:
                    continue

                operation = path_item[method]
                if not isinstance(operation, dict):
                    continue

                operation_id = operation.get('operationId')
                if not operation_id:
                    errors.append(f"Missing operationId for {method.upper()} {path}")
                    continue

                # Generate fixtures for success responses
                for status_code, response in operation.get('responses', {}).items():
                    if not status_code.startswith('2'):  # Only success responses
                        continue

                    try:
                        fixture = self._generate_fixture_from_response(
                            path=path,
                            method=method,
                            operation_id=operation_id,
                            status_code=status_code,
                            response=response
                        )

                        if fixture:
                            fixture_name = self._get_fixture_filename(
                                operation_id, status_code, 'success'
                            )
                            self._write_fixture(fixture_name, fixture)
                            fixture_count += 1
                            print(f"✅ Generated: {fixture_name}")
                    except Exception as e:
                        error_msg = f"Error generating fixture for {operation_id} ({status_code}): {e}"
                        errors.append(error_msg)
                        print(f"⚠️  {error_msg}", file=sys.stderr)

                # Generate fixtures for error responses
                for status_code, response in operation.get('responses', {}).items():
                    if not status_code.startswith(('4', '5')):  # Only error responses
                        continue

                    try:
                        fixture = self._generate_error_fixture(
                            path=path,
                            method=method,
                            operation_id=operation_id,
                            status_code=status_code,
                            response=response
                        )

                        if fixture:
                            fixture_name = self._get_fixture_filename(
                                operation_id, status_code, 'error'
                            )
                            self._write_fixture(fixture_name, fixture)
                            fixture_count += 1
                            print(f"✅ Generated: {fixture_name}")
                    except Exception as e:
                        error_msg = f"Error generating error fixture for {operation_id} ({status_code}): {e}"
                        errors.append(error_msg)
                        print(f"⚠️  {error_msg}", file=sys.stderr)

        print()
        if errors:
            print(f"⚠️  Generated {fixture_count} fixtures with {len(errors)} errors")
            for error in errors[:5]:  # Show first 5 errors
                print(f"   - {error}", file=sys.stderr)
            if len(errors) > 5:
                print(f"   ... and {len(errors) - 5} more errors", file=sys.stderr)
        else:
            print(f"🎉 Successfully generated {fixture_count} test fixtures")

        return fixture_count

    def _generate_fixture_from_response(
        self,
        path: str,
        method: str,
        operation_id: str,
        status_code: str,
        response: Dict[str, Any]
    ) -> Optional[Dict[str, Any]]:
        """Generate a fixture from a response definition."""
        content = response.get('content', {})
        json_content = content.get('application/json', {})

        # Handle 204 No Content responses
        if status_code == '204':
            return {
                "status": "success",
                "message": response.get('description', 'Operation completed successfully'),
                "timestamp": 1704067200.0,  # 2024-01-01 00:00:00 UTC
                "data": None
            }

        if not json_content:
            return None

        schema = json_content.get('schema', {})
        example = json_content.get('example')

        if example:
            return example

        # Generate from schema with fresh ref stack
        self._ref_stack = []
        self._example_counter = 0

        try:
            return self._generate_from_schema(schema, context=operation_id)
        except CircularReferenceError as e:
            raise ValueError(f"Circular reference detected: {e}")

    def _generate_error_fixture(
        self,
        path: str,
        method: str,
        operation_id: str,
        status_code: str,
        response: Dict[str, Any]
    ) -> Optional[Dict[str, Any]]:
        """Generate an error fixture."""
        content = response.get('content', {})
        json_content = content.get('application/json', {})

        if not json_content:
            # Generate default error response following UnifiedResponse format
            return {
                "status": "error",
                "message": response.get('description', 'An error occurred'),
                "error_type": self._get_error_type_from_status(status_code),
                "timestamp": 1704067200.0,  # 2024-01-01 00:00:00 UTC
                "request_id": "req_example_123",
                "details": None
            }

        schema = json_content.get('schema', {})
        example = json_content.get('example')

        if example:
            return example

        # Generate from schema with fresh ref stack
        self._ref_stack = []
        self._example_counter = 0

        try:
            return self._generate_from_schema(schema, context=operation_id)
        except CircularReferenceError as e:
            raise ValueError(f"Circular reference detected: {e}")

    def _generate_from_schema(
        self,
        schema: Dict[str, Any],
        context: str = ""
    ) -> Any:
        """Generate example data from a JSON schema."""
        # Handle $ref with circular reference detection
        if '$ref' in schema:
            ref = schema['$ref']

            # Check for circular reference
            if ref in self._ref_stack:
                raise CircularReferenceError(f"Circular reference: {' -> '.join(self._ref_stack + [ref])}")

            self._ref_stack.append(ref)
            try:
                ref_path = ref.split('/')
                ref_schema = self.spec
                for part in ref_path:
                    if part == '#':
                        continue
                    if not isinstance(ref_schema, dict) or part not in ref_schema:
                        raise ValueError(f"Invalid $ref: {ref}")
                    ref_schema = ref_schema[part]

                result = self._generate_from_schema(ref_schema, context)
            finally:
                self._ref_stack.pop()

            return result

        # Handle allOf (merge schemas)
        if 'allOf' in schema:
            result = {}
            for sub_schema in schema['allOf']:
                sub_result = self._generate_from_schema(sub_schema, context)
                if isinstance(sub_result, dict) and isinstance(result, dict):
                    result.update(sub_result)
            return result

        schema_type = schema.get('type', 'object')

        if schema_type == 'object':
            properties = schema.get('properties', {})
            result = {}

            for prop_name, prop_schema in properties.items():
                result[prop_name] = self._generate_value_from_schema(
                    prop_schema,
                    context=f"{context}.{prop_name}"
                )

            return result

        elif schema_type == 'array':
            items_schema = schema.get('items', {})
            # Generate realistic number of items based on context
            min_items = schema.get('minItems', 1)
            max_items = schema.get('maxItems', 3)
            num_items = min(max_items, max(min_items, 2))

            return [
                self._generate_from_schema(items_schema, f"{context}[{i}]")
                for i in range(num_items)
            ]

        else:
            return self._generate_value_from_schema(schema, context)

    def _generate_value_from_schema(
        self,
        schema: Dict[str, Any],
        context: str = ""
    ) -> Any:
        """Generate a single value from a schema."""
        # Handle $ref
        if '$ref' in schema:
            return self._generate_from_schema(schema, context)

        schema_type = schema.get('type', 'string')
        schema_format = schema.get('format')
        example = schema.get('example')

        if example is not None:
            return example

        # Check for enum
        enum = schema.get('enum')
        if enum:
            return enum[0]

        # Type-specific generation with realistic values
        if schema_type == 'string':
            return self._generate_realistic_string(schema_format, context)

        elif schema_type == 'integer':
            default = schema.get('default')
            if default is not None:
                return default
            minimum = schema.get('minimum', 0)
            maximum = schema.get('maximum', 100)
            return (minimum + maximum) // 2

        elif schema_type == 'number':
            default = schema.get('default')
            if default is not None:
                return default
            minimum = schema.get('minimum', 0.0)
            maximum = schema.get('maximum', 100.0)
            return (minimum + maximum) / 2

        elif schema_type == 'boolean':
            return schema.get('default', False)

        elif schema_type == 'array':
            items_schema = schema.get('items', {})
            return [self._generate_value_from_schema(items_schema, f"{context}[0]")]

        elif schema_type == 'object':
            return self._generate_from_schema(schema, context)

        # Handle null/nullable
        if schema.get('nullable'):
            return None

        return None

    def _generate_realistic_string(self, schema_format: Optional[str], context: str) -> str:
        """Generate realistic string values based on format and context."""
        # Format-based generation
        if schema_format == 'date-time':
            return '2024-01-01T12:00:00Z'
        elif schema_format == 'uuid':
            return 'a1b2c3d4-e5f6-4789-a012-3456789abcde'
        elif schema_format == 'uri':
            return 'https://example.com/resource'
        elif schema_format == 'email':
            return 'user@example.com'

        # Context-based realistic values
        context_lower = context.lower()

        # IDs
        if 'id' in context_lower:
            self._example_counter += 1
            if 'playlist' in context_lower:
                return f'playlist_{self._example_counter}'
            elif 'track' in context_lower:
                return f'track_{self._example_counter}'
            elif 'nfc' in context_lower or 'tag' in context_lower:
                return f'nfc_{self._example_counter:08x}'
            return f'id_{self._example_counter}'

        # Titles
        if 'title' in context_lower:
            if 'playlist' in context_lower:
                return 'My Awesome Playlist'
            elif 'track' in context_lower:
                return 'Example Song Title'
            return 'Example Title'

        # Names
        if 'name' in context_lower:
            if 'file' in context_lower:
                return 'example_file.mp3'
            return 'Example Name'

        # File paths
        if 'filename' in context_lower or 'file_path' in context_lower:
            return 'music/example_track.mp3'

        # Artists/Albums
        if 'artist' in context_lower:
            return 'Example Artist'
        if 'album' in context_lower:
            return 'Example Album'

        # Descriptions
        if 'description' in context_lower:
            return 'This is an example description'

        # Messages
        if 'message' in context_lower:
            return 'Operation completed successfully'

        # Status
        if 'status' in context_lower:
            return 'success'

        # Generic fallback
        return 'example_value'

    def _get_error_type_from_status(self, status_code: str) -> str:
        """Get error type from HTTP status code."""
        error_types = {
            '400': 'bad_request',
            '401': 'unauthorized',
            '403': 'forbidden',
            '404': 'not_found',
            '409': 'conflict',
            '422': 'validation_error',
            '429': 'rate_limit_exceeded',
            '500': 'internal_error',
            '502': 'bad_gateway',
            '503': 'service_unavailable',
        }
        return error_types.get(status_code, 'unknown_error')

    def _get_fixture_filename(
        self,
        operation_id: str,
        status_code: str,
        fixture_type: str
    ) -> str:
        """Generate a fixture filename."""
        # Clean operation_id for filename
        clean_id = operation_id.replace('/', '_').replace('{', '').replace('}', '')
        return f"{clean_id}_{status_code}_{fixture_type}.json"

    def _write_fixture(self, filename: str, data: Dict[str, Any]):
        """Write fixture to file."""
        filepath = self.output_dir / filename

        # Don't add _meta inside UnifiedResponse data
        # The fixture represents the actual API response
        with open(filepath, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=2, ensure_ascii=False)
            f.write('\n')  # Add trailing newline

    def check_fixtures_up_to_date(self) -> bool:
        """
        Check if generated fixtures match current OpenAPI spec.

        Returns:
            True if fixtures are up-to-date, False otherwise
        """
        try:
            self.spec = self._load_openapi()
        except Exception as e:
            print(f"❌ Error loading OpenAPI spec: {e}", file=sys.stderr)
            return False

        if not self.output_dir.exists():
            print("❌ Fixtures directory does not exist", file=sys.stderr)
            return False

        print(f"🔍 Checking fixtures are up-to-date...")

        # Get current fixture files
        existing_fixtures = {f.name for f in self.output_dir.glob('*.json')}

        # Generate expected fixture names
        expected_fixtures: Set[str] = set()

        for path, path_item in self.spec.get('paths', {}).items():
            if not isinstance(path_item, dict):
                continue

            for method in ['get', 'post', 'put', 'patch', 'delete']:
                if method not in path_item:
                    continue

                operation = path_item[method]
                if not isinstance(operation, dict):
                    continue

                operation_id = operation.get('operationId')
                if not operation_id:
                    continue

                # Check success responses
                for status_code in operation.get('responses', {}).keys():
                    if status_code.startswith('2'):
                        fixture_name = self._get_fixture_filename(
                            operation_id, status_code, 'success'
                        )
                        expected_fixtures.add(fixture_name)
                    elif status_code.startswith(('4', '5')):
                        fixture_name = self._get_fixture_filename(
                            operation_id, status_code, 'error'
                        )
                        expected_fixtures.add(fixture_name)

        # Compare
        missing = expected_fixtures - existing_fixtures
        extra = existing_fixtures - expected_fixtures

        if missing:
            print(f"❌ Missing fixtures:")
            for f in sorted(missing):
                print(f"   - {f}")

        if extra:
            print(f"⚠️  Extra fixtures (not in spec):")
            for f in sorted(extra):
                print(f"   - {f}")

        if missing or extra:
            print()
            print("Run `python scripts/generate_test_fixtures.py` to update fixtures")
            return False

        print("✅ All fixtures are up-to-date")
        return True


def generate_readme(output_dir: Path):
    """Generate README for fixtures directory."""
    readme_content = """# Test Fixtures

This directory contains test fixtures generated from the OpenAPI specification.

## Usage

### Python (RPI Backend)

```python
import json
from pathlib import Path

# Load fixture
fixture_path = Path(__file__).parent / "fixtures" / "getPlaylists_200_success.json"
with open(fixture_path) as f:
    mock_response = json.load(f)

# Use in test
mock_service.get_playlists = AsyncMock(return_value=mock_response)
```

### Dart (Flutter App)

```dart
import 'dart:convert';
import 'dart:io';

// Load fixture
final fixtureFile = File('test/fixtures/getPlaylists_200_success.json');
final mockResponse = jsonDecode(fixtureFile.readAsStringSync()) as Map<String, dynamic>;

// Use in test
when(mockDio.get<Map<String, dynamic>>(any))
    .thenAnswer((_) async => Response(
          data: mockResponse,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ));
```

### C++ (ESP32)

```cpp
#include <ArduinoJson.h>

// Load fixture (embed in test code or read from file)
const char* fixture = R"({
  "status": "success",
  "data": {...}
})";

StaticJsonDocument<1024> doc;
deserializeJson(doc, fixture);
```

## Regenerating Fixtures

Run the generator script from the contracts directory:

```bash
python scripts/generate_test_fixtures.py
```

## CI Validation

Check if fixtures are up-to-date (exits with error if not):

```bash
python scripts/generate_test_fixtures.py --check
```

## Fixture Naming Convention

Fixtures follow this naming pattern:

```
{operationId}_{statusCode}_{type}.json
```

Examples:
- `getPlaylists_200_success.json` - Success response for GET /playlists
- `createPlaylist_201_success.json` - Success response for POST /playlists
- `getPlaylist_404_error.json` - Error response for GET /playlists/{id}

## Important Notes

1. **Always use complete fixtures**: Don't strip fields from fixtures as this defeats the purpose
2. **Keep fixtures up-to-date**: Regenerate after OpenAPI spec changes
3. **UnifiedResponse wrapper**: All fixtures include the complete `{status, message, timestamp, data}` structure
4. **server_seq**: All state objects include the `server_seq` field for synchronization
5. **Realistic values**: Fixtures use context-aware realistic values (e.g., "My Awesome Playlist" instead of "example_string")
"""

    readme_path = output_dir / 'README.md'
    with open(readme_path, 'w', encoding='utf-8') as f:
        f.write(readme_content)


def main():
    """Main entry point."""
    parser = argparse.ArgumentParser(
        description='Generate test fixtures from OpenAPI specification'
    )
    parser.add_argument(
        '--check',
        action='store_true',
        help='Check if fixtures are up-to-date (for CI)'
    )
    args = parser.parse_args()

    # Determine script directory
    script_dir = Path(__file__).parent
    contracts_dir = script_dir.parent

    # Paths
    openapi_path = contracts_dir / 'schemas' / 'openapi.yaml'
    output_dir = contracts_dir / 'generated' / 'fixtures'

    if not openapi_path.exists():
        print(f"❌ OpenAPI spec not found: {openapi_path}", file=sys.stderr)
        return 1

    # Initialize generator
    generator = FixtureGenerator(openapi_path, output_dir)

    if args.check:
        # Check mode for CI
        up_to_date = generator.check_fixtures_up_to_date()
        return 0 if up_to_date else 1
    else:
        # Generate mode
        fixture_count = generator.generate_all_fixtures()

        if fixture_count == 0:
            print("❌ No fixtures generated", file=sys.stderr)
            return 1

        # Generate README for fixtures
        generate_readme(output_dir)
        print(f"📄 Generated README: {output_dir / 'README.md'}")

        return 0


if __name__ == '__main__':
    sys.exit(main())
