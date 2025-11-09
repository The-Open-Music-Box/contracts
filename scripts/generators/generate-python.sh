#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
SCHEMA_FILE="$ROOT_DIR/schemas/openapi.yaml"
OUTPUT_DIR="$ROOT_DIR/generated/python"

echo "🎯 Generating Python models from OpenAPI..."

# Clean output directory
rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

# Check if datamodel-code-generator is installed
if ! command -v datamodel-codegen &> /dev/null; then
    echo "Installing datamodel-code-generator..."
    pip3 install --break-system-packages datamodel-code-generator
fi

# Generate Python Pydantic models
datamodel-codegen \
    --input "$SCHEMA_FILE" \
    --output "$OUTPUT_DIR/models.py" \
    --input-file-type openapi \
    --output-model-type pydantic_v2.BaseModel \
    --use-standard-collections \
    --use-schema-description \
    --field-constraints

# Create __init__.py
echo "from .models import *" > "$OUTPUT_DIR/__init__.py"

echo "✅ Python models generated successfully at: $OUTPUT_DIR"
echo ""
echo "📦 To use in your Python project:"
echo "   from tomb_contracts.models import PlayerState, Playlist"
echo ""
