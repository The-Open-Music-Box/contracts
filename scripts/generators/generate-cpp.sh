#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
SCHEMA_FILE="$ROOT_DIR/schemas/openapi.yaml"
OUTPUT_DIR="$ROOT_DIR/generated/cpp"

echo "🎯 Generating C++ client from OpenAPI..."

# Clean output directory
rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

# Check if openapi-generator-cli is installed
if ! command -v openapi-generator-cli &> /dev/null; then
    echo "❌ openapi-generator-cli not found. Installing..."
    npm install -g @openapitools/openapi-generator-cli
fi

# Generate C++ client using cpp-restsdk (Microsoft C++ REST SDK)
openapi-generator-cli generate \
    -i "$SCHEMA_FILE" \
    -g cpp-restsdk \
    -o "$OUTPUT_DIR" \
    --additional-properties=\
packageName=TombContracts,\
packageVersion=3.0.0,\
declspec=TOMB_API,\
defaultHeaders=true

echo "✅ C++ client generated successfully at: $OUTPUT_DIR"
echo ""
echo "📦 To use in your C++ project:"
echo "   Add to CMakeLists.txt:"
echo "   add_subdirectory(../tomb-contracts/generated/cpp)"
echo "   target_link_libraries(your_target TombContracts)"
echo ""
echo "📋 Dependencies required:"
echo "   - cpprestsdk (Casablanca)"
echo "   - Boost"
echo "   - OpenSSL"
echo ""
