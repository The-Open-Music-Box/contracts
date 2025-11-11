# Quick Setup Guide

This guide will help you set up the contracts repository and integrate it with your satellite applications.

## Step 1: Move to Separate Repository

```bash
# Navigate to parent directory
cd /path/to/your/repos

# Move the contracts folder
mv tomb-rpi/tomb-contracts ./tomb-contracts

# Initialize as git repository
cd tomb-contracts
git init
git add .
git commit -m "Initial commit: TheOpenMusicBox API contracts"

# Add remote (replace with your actual repository URL)
git remote add origin https://github.com/theopenmusicbox/tomb-contracts.git
git push -u origin main
```

## Step 2: Install Dependencies

### For Local Development

```bash
# Install Node.js tools
npm install -g @openapitools/openapi-generator-cli
npm install -g openapi-typescript

# Install Python tools
pip install datamodel-code-generator

# Verify installation
openapi-generator-cli version
openapi-typescript --version
datamodel-codegen --version
```

### For CI/CD (GitHub Actions)

The `.github/workflows/generate-contracts.yml` file is already configured.
Just ensure your repository has GitHub Actions enabled.

## Step 3: Generate Initial Contracts

```bash
# Generate all language clients
bash scripts/generate-all.sh

# Or generate individually
bash scripts/generators/generate-dart.sh
bash scripts/generators/generate-cpp.sh
bash scripts/generators/generate-typescript.sh
bash scripts/generators/generate-python.sh
```

## Step 4: Integrate with Flutter App

### Option A: Git Submodule (Recommended)

```bash
cd /path/to/your/flutter-app

# Add as submodule
git submodule add https://github.com/theopenmusicbox/tomb-contracts.git contracts

# Initialize submodule
git submodule update --init --recursive
```

Edit `pubspec.yaml`:
```yaml
dependencies:
  tomb_contracts:
    path: ./contracts/releases/3.3.1-54739a9/dart/
```

### Option B: Direct Path Reference

Edit `pubspec.yaml`:
```yaml
dependencies:
  tomb_contracts:
    path: ../tomb-contracts/generated/dart/
```

### Usage

```dart
import 'package:tomb_contracts/tomb_contracts.dart';

final api = TombContractsApi(baseUrl: 'http://your-rpi:8000');
final status = await api.getPlayerStatus();
```

## Step 5: Integrate with C++ App

### Option A: Git Submodule

```bash
cd /path/to/your/cpp-app

# Add as submodule
git submodule add https://github.com/theopenmusicbox/tomb-contracts.git contracts
```

Edit `CMakeLists.txt`:
```cmake
add_subdirectory(contracts/releases/3.3.1-54739a9/cpp)
target_link_libraries(your_app TombContracts)
```

### Install Dependencies

**macOS:**
```bash
brew install cpprestsdk boost openssl
```

**Ubuntu/Debian:**
```bash
sudo apt-get install libcpprest-dev libboost-all-dev libssl-dev
```

**Windows:**
```powershell
vcpkg install cpprestsdk boost-system openssl
```

### Usage

```cpp
#include "TombContracts/api/PlayerApi.h"

using namespace org::openapitools::client::api;

PlayerApi playerApi("http://your-rpi:8000");
auto response = playerApi.getPlayerStatus().get();
```

## Step 6: Integrate with Web Frontend

### Option A: Git Submodule

```bash
cd /path/to/your/web-app
git submodule add https://github.com/theopenmusicbox/tomb-contracts.git contracts
```

### Usage

```typescript
import type { PlayerState, Playlist } from '../contracts/releases/3.3.1-54739a9/typescript';

async function getPlayer(): Promise<PlayerState> {
  const response = await fetch('/api/player/status');
  const json = await response.json();
  return json.data;
}
```

## Step 7: Enable GitHub Actions

1. Push contracts repo to GitHub
2. Go to repository Settings → Actions → General
3. Enable "Allow all actions and reusable workflows"
4. Commit changes to `schemas/` to trigger first generation

## Step 8: Version and Release

### Automatic Versioning

Versions are **automatically managed** by GitHub Actions:

1. **Update schema version:**
   ```bash
   # Edit schemas/openapi.yaml
   vim schemas/openapi.yaml
   # Change line 9: version: 3.3.0
   ```

2. **Commit and push:**
   ```bash
   git add schemas/openapi.yaml
   git commit -m "feat: bump to v3.3.0 - add new features"
   git push origin main
   ```

3. **GitHub Actions automatically:**
   - Reads version from `schemas/openapi.yaml`
   - Generates clients for all languages
   - Creates `releases/3.3.0-{commit-hash}/` directory
   - Tags the generation commit as `v3.3.0`
   - Pushes everything back to the repository

**Important**: Version tags point to **generation commits** (containing full client libraries), not schema commits. This ensures `git checkout v3.3.0` gives you complete, ready-to-use packages.

### Update Client Apps to Use Specific Version

**Flutter (Option 1: Git reference):**
```yaml
dependencies:
  tomb_contracts:
    git:
      url: https://github.com/theopenmusicbox/tomb-contracts.git
      ref: v3.3.1
      path: releases/3.3.1-54739a9/dart/
```

**Flutter (Option 2: Submodule):**
```bash
cd your-flutter-app/contracts
git fetch origin
git checkout v3.3.1
cd ../..
# Update pubspec.yaml path if needed
flutter pub get
```

**C++ CMakeLists.txt:**
```cmake
include(FetchContent)
FetchContent_Declare(
  tomb_contracts
  GIT_REPOSITORY https://github.com/theopenmusicbox/tomb-contracts.git
  GIT_TAG v3.3.1
)
FetchContent_MakeAvailable(tomb_contracts)
```

## Workflow Summary

### Daily Development

1. **Make contract changes:**
   ```bash
   vim schemas/openapi.yaml
   # Make your changes, optionally bump version if needed
   ```

2. **Test locally:**
   ```bash
   bash scripts/generate-all.sh
   ```

3. **Commit and push:**
   ```bash
   git add schemas/
   git commit -m "feat: add playlist export endpoint"
   git push origin main
   ```

4. **GitHub Actions automatically:**
   - Detects version from `schemas/openapi.yaml`
   - Generates all client libraries
   - Creates `releases/{version}-{commit-hash}/` directory
   - Tags the generation commit with `v{version}`
   - Pushes changes back to repository

5. **Update satellite apps:**
   ```bash
   cd flutter-app/contracts
   git fetch origin
   git checkout v3.3.1  # or desired version tag
   cd ../..
   flutter pub get
   ```

### Breaking Changes

1. **Bump major version:**
   ```bash
   # Edit version in schemas/openapi.yaml
   version: 4.0.0
   ```

2. **Document in CHANGELOG.md:**
   ```markdown
   ## [4.0.0] - 2025-XX-XX
   ### Breaking Changes
   - Renamed `playlist.name` to `playlist.title`
   ```

3. **Update all satellite apps** to handle breaking changes

## Troubleshooting

### Generation Fails

**Error:** "openapi-generator-cli: command not found"

**Fix:**
```bash
npm install -g @openapitools/openapi-generator-cli
```

### Flutter Package Not Found

**Error:** "tomb_contracts not found"

**Fix:** Check path in `pubspec.yaml`:
```bash
ls -la contracts/generated/dart/
flutter pub get
```

### C++ Compilation Errors

**Error:** "cpprestsdk not found"

**Fix:**
```bash
# macOS
brew install cpprestsdk

# Ubuntu
sudo apt-get install libcpprest-dev
```

## Next Steps

1. ✅ Repository is ready to use
2. 📝 Read `README.md` for detailed documentation
3. 💡 Check `docs/EXAMPLES.md` for code examples
4. 🔌 See `docs/SOCKETIO_EVENTS.md` for real-time events
5. 📦 Integrate with your satellite apps

## Support

- Issues: https://github.com/theopenmusicbox/tomb-contracts/issues
- Main Project: https://github.com/theopenmusicbox/tomb-rpi
