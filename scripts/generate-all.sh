#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "=================================================="
echo "🚀 TheOpenMusicBox Contracts - Generate All"
echo "=================================================="
echo ""

# Run all generators
bash "$SCRIPT_DIR/generators/generate-dart.sh"
echo ""
bash "$SCRIPT_DIR/generators/generate-cpp.sh"
echo ""
bash "$SCRIPT_DIR/generators/generate-typescript.sh"
echo ""
bash "$SCRIPT_DIR/generators/generate-python.sh"
echo ""

echo "=================================================="
echo "✅ All clients generated successfully!"
echo "=================================================="
echo ""
echo "Generated files:"
echo "  📁 generated/dart/          - Flutter/Dart client"
echo "  📁 generated/cpp/           - C++ client"
echo "  📁 generated/typescript/    - TypeScript types"
echo "  📁 generated/python/        - Python models"
echo ""
