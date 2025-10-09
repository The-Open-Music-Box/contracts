#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
SCHEMA_FILE="$ROOT_DIR/schemas/openapi.yaml"
OUTPUT_DIR="$ROOT_DIR/generated/typescript"

echo "🎯 Generating TypeScript types from OpenAPI..."

# Clean output directory
rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

# Check if openapi-typescript is installed
if ! command -v openapi-typescript &> /dev/null; then
    echo "Installing openapi-typescript..."
    npm install -g openapi-typescript
fi

# Generate TypeScript types (type-only, no runtime client)
openapi-typescript "$SCHEMA_FILE" -o "$OUTPUT_DIR/api-types.ts"

# Copy Socket.IO contracts as TypeScript
echo "export * from './api-types';" > "$OUTPUT_DIR/index.ts"

echo "✅ TypeScript types generated successfully at: $OUTPUT_DIR"
echo ""
echo "📦 To use in your TypeScript/frontend project:"
echo "   import { PlayerState, Playlist } from '../tomb-contracts/generated/typescript';"
echo ""
