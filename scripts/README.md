# Contract Generation Scripts

This directory contains utility scripts for working with TheOpenMusicBox contract specifications.

## Scripts

### `generate_test_fixtures.py`

Generates JSON test fixtures from the OpenAPI specification for use in unit and integration tests across all platforms (Python, Dart, C++).

#### Setup

```bash
# Create virtual environment
cd scripts
python3 -m venv .venv

# Activate virtual environment
source .venv/bin/activate  # On macOS/Linux
# OR
.venv\Scripts\activate  # On Windows

# Install dependencies
pip install -r requirements.txt
```

#### Usage

**Generate all fixtures:**
```bash
python generate_test_fixtures.py
```

**Check if fixtures are up-to-date (for CI):**
```bash
python generate_test_fixtures.py --check
```

This command exits with code 0 if fixtures are up-to-date, or code 1 if they need regeneration.

#### Output

Generated fixtures are placed in `../generated/fixtures/` with the naming convention:
```
{operationId}_{statusCode}_{type}.json
```

For example:
- `getPlaylists_200_success.json`
- `createPlaylist_404_error.json`

#### Features

- ✅ **Python 3.9+ compatible** - Uses `Optional[]` type hints
- ✅ **Robust error handling** - Validates YAML, catches schema errors
- ✅ **Circular reference detection** - Prevents infinite loops in schema resolution
- ✅ **Realistic data generation** - Context-aware values (e.g., "My Awesome Playlist" for playlist titles)
- ✅ **CI integration** - `--check` mode for validating fixture freshness
- ✅ **UnifiedResponse compliant** - All fixtures follow the API envelope format

#### CI Integration

Add to your GitHub Actions workflow:

```yaml
- name: Check test fixtures are up-to-date
  run: |
    cd scripts
    python3 -m venv .venv
    source .venv/bin/activate
    pip install -r requirements.txt
    python generate_test_fixtures.py --check
```

## Requirements

- Python 3.9 or higher
- PyYAML (installed via `requirements.txt`)

## Development

When modifying scripts:

1. **Always use a virtual environment** - Don't install dependencies system-wide
2. **Update requirements.txt** - Pin versions for reproducibility
3. **Test on Python 3.9** - Ensure compatibility with minimum supported version
4. **Handle errors gracefully** - Scripts should provide clear error messages

## Troubleshooting

### ModuleNotFoundError: No module named 'yaml'

Make sure you've activated the virtual environment:
```bash
cd scripts
source .venv/bin/activate  # Creates if doesn't exist
pip install -r requirements.txt
```

### Script runs but generates empty fixtures

Check that the OpenAPI spec at `../schemas/openapi.yaml` is valid and contains response schemas.

### "Circular reference detected" errors

This indicates a circular `$ref` in your OpenAPI schema. Review the schema definitions and break the circular dependency.
