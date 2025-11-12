#!/usr/bin/env python3
"""
Post-processing script to fix missing UnifiedResponseData imports in Dart generated code.
This addresses a bug in OpenAPI Generator's dart-dio template where files that use
UnifiedResponseData don't import unified_response_data.dart.
"""

import sys
import os
from pathlib import Path

def fix_imports_in_file(file_path: Path) -> bool:
    """
    Fix missing UnifiedResponseData import in a single file.
    Returns True if file was modified, False otherwise.
    """
    content = file_path.read_text(encoding='utf-8')

    # Check if file needs fixing:
    # 1. Uses UnifiedResponseData
    # 2. Imports unified_response.dart
    # 3. Doesn't already import unified_response_data.dart
    needs_fix = (
        'UnifiedResponseData' in content and
        "import 'package:tomb_contracts/src/model/unified_response.dart';" in content and
        "import 'package:tomb_contracts/src/model/unified_response_data.dart';" not in content
    )

    if not needs_fix:
        return False

    # Add the missing import after unified_response.dart import
    lines = content.splitlines(keepends=True)
    new_lines = []

    for line in lines:
        new_lines.append(line)
        if "import 'package:tomb_contracts/src/model/unified_response.dart';" in line:
            new_lines.append("import 'package:tomb_contracts/src/model/unified_response_data.dart';\n")

    # Write the fixed content
    file_path.write_text(''.join(new_lines), encoding='utf-8')
    return True

def main():
    dart_dir = Path(sys.argv[1] if len(sys.argv) > 1 else 'generated/dart')
    model_dir = dart_dir / 'lib' / 'src' / 'model'

    if not model_dir.exists():
        print(f"❌ Error: Model directory not found: {model_dir}")
        sys.exit(1)

    print("🔧 Fixing missing UnifiedResponseData imports in Dart code...")

    files_fixed = 0
    for dart_file in model_dir.glob('*.dart'):
        # Skip unified_response files themselves
        if dart_file.stem.startswith('unified_response'):
            continue

        if fix_imports_in_file(dart_file):
            print(f"  ✅ Fixed: {dart_file.name}")
            files_fixed += 1

    if files_fixed == 0:
        print("  ℹ️  No files needed fixing")
    else:
        print(f"  ✅ Fixed {files_fixed} files")

    print("✅ Dart import fix complete!")

if __name__ == '__main__':
    main()
