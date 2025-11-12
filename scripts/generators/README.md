# Contract Generators

This directory contains scripts for generating client libraries from the OpenAPI specification.

## Overview

- `generate-all.sh` - Runs all generators
- `generate-dart.sh` - Generates Dart/Flutter client
- `generate-cpp.sh` - Generates C++ client
- `generate-typescript.sh` - Generates TypeScript types
- `generate-python.sh` - Generates Python models

## Dart Post-Processing

### fix-dart-imports.py

This script fixes a known issue in OpenAPI Generator's dart-dio template where generated response models that use `UnifiedResponseData` don't include the necessary import statement.

**Problem**: Files like `associate_nfc200_response.dart` implement `UnifiedResponse` and use `UnifiedResponseData` in their serialization code, but only import `unified_response.dart`. While `unified_response.dart` does import `unified_response_data.dart`, Dart requires explicit imports - transitive imports don't work.

**Solution**: The post-processor automatically adds `import 'package:tomb_contracts/src/model/unified_response_data.dart';` to all generated model files that:
1. Use `UnifiedResponseData` (in type annotations or casts)
2. Import `unified_response.dart`
3. Don't already import `unified_response_data.dart`

**Usage**: This script is automatically called by `generate-dart.sh` after code generation. To run manually:

```bash
python3 scripts/generators/fix-dart-imports.py generated/dart
```

**Related Issues**: #7 - Bug: Generated Dart code missing UnifiedResponseData imports in v3.3.1

## Troubleshooting

If you see Dart compilation errors like:
```
error • Undefined name 'UnifiedResponseData' • lib/src/model/associate_nfc200_response.dart:56:48 • undefined_identifier
```

This indicates the post-processing script didn't run. Regenerate the Dart client with:
```bash
bash scripts/generators/generate-dart.sh
```
