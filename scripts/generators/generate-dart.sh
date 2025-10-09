#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
SCHEMA_FILE="$ROOT_DIR/schemas/openapi.yaml"
OUTPUT_DIR="$ROOT_DIR/generated/dart"

echo "🎯 Generating Dart/Flutter client from OpenAPI..."

# Clean output directory
rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

# Check if openapi-generator-cli is installed
if ! command -v openapi-generator-cli &> /dev/null; then
    echo "❌ openapi-generator-cli not found. Installing..."
    npm install -g @openapitools/openapi-generator-cli
fi

# Generate Dart client using dio
openapi-generator-cli generate \
    -i "$SCHEMA_FILE" \
    -g dart-dio \
    -o "$OUTPUT_DIR" \
    --additional-properties=\
pubName=tomb_contracts,\
pubVersion=3.0.0,\
pubDescription="TheOpenMusicBox API Client for Dart/Flutter",\
pubAuthor="TheOpenMusicBox",\
pubHomepage="https://github.com/theopenmusicbox/tomb-contracts",\
dateLibrary=core,\
nullSafe=true,\
useEnumExtension=true

echo "✅ Dart client generated successfully at: $OUTPUT_DIR"
echo ""
echo "📦 To use in your Flutter project:"
echo "   Add to pubspec.yaml:"
echo "   dependencies:"
echo "     tomb_contracts:"
echo "       path: ../tomb-contracts/generated/dart"
echo ""
