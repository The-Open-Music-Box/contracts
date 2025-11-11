# TheOpenMusicBox API Contracts

**Single source of truth for API contracts across all TheOpenMusicBox client implementations.**

This repository contains the canonical API and Socket.IO contract definitions for TheOpenMusicBox, with automatic code generation for multiple programming languages.

## 📋 Purpose

TheOpenMusicBox is a Raspberry Pi-based music player system with multiple client applications:

- **Web Frontend** (TypeScript/Vue.js)
- **Flutter Mobile App** (Dart)
- **ESP32 Remote Controller** (C++)
- **Backend** (Python/FastAPI)

This contracts repository ensures **consistency** and **type safety** across all implementations by:

1. Defining API contracts in **OpenAPI 3.0** format
2. Defining Socket.IO events in **JSON Schema** format
3. Auto-generating client code for each language
4. Versioning contracts independently from implementations

## 🏗️ Repository Structure

```
tomb-contracts/
├── schemas/                      # Source of truth (edit these)
│   ├── openapi.yaml             # REST API contracts
│   └── socketio_contracts.json  # Socket.IO event contracts
├── generated/                    # Auto-generated (gitignored)
│   ├── dart/                    # Flutter/Dart client
│   ├── cpp/                     # C++ client
│   ├── typescript/              # TypeScript types
│   └── python/                  # Python models
├── releases/                     # Versioned releases (committed)
│   └── 3.3.1-54739a9/
│       ├── dart/
│       ├── cpp/
│       ├── typescript/
│       └── python/
├── scripts/
│   ├── generate-all.sh          # Generate for all languages
│   └── generators/              # Individual language generators
└── .github/workflows/            # CI/CD automation
```

## 🚀 Quick Start

### Prerequisites

Install code generation tools:

```bash
# Node.js (for OpenAPI tools)
npm install -g @openapitools/openapi-generator-cli
npm install -g openapi-typescript

# Python (for Python models)
pip install datamodel-code-generator
```

### Generate All Contracts

```bash
# Clone the repository
git clone https://github.com/theopenmusicbox/tomb-contracts.git
cd tomb-contracts

# Generate code for all languages
bash scripts/generate-all.sh
```

### Generate Individual Languages

```bash
# Flutter/Dart only
bash scripts/generators/generate-dart.sh

# C++ only
bash scripts/generators/generate-cpp.sh

# TypeScript only
bash scripts/generators/generate-typescript.sh

# Python only
bash scripts/generators/generate-python.sh
```

## 📦 Using Generated Contracts

### Flutter/Dart Application

**Option A: Git Submodule (Development)**

```bash
cd your-flutter-app
git submodule add https://github.com/theopenmusicbox/tomb-contracts.git contracts
```

Add to `pubspec.yaml`:
```yaml
dependencies:
  tomb_contracts:
    path: ./contracts/releases/3.3.1-54739a9/dart/
```

**Option B: Direct Copy (Production)**

```bash
# Copy generated Dart package to your project
cp -r contracts/releases/3.3.1-54739a9/dart/ lib/api/tomb_contracts/
```

**Usage in Dart:**
```dart
import 'package:tomb_contracts/tomb_contracts.dart';

// Create API client
final api = TombContractsApi(
  baseUrl: 'http://tomb-rpi.local:8000',
);

// Call endpoints with full type safety
final response = await api.getPlayerStatus();
PlayerState state = response.data;

print('Playing: ${state.isPlaying}');
print('Track: ${state.activeTrack?.title}');
```

### C++ Application

**Option A: Git Submodule**

```bash
cd your-cpp-app
git submodule add https://github.com/theopenmusicbox/tomb-contracts.git contracts
```

Add to `CMakeLists.txt`:
```cmake
add_subdirectory(contracts/releases/3.3.1-54739a9/cpp)
target_link_libraries(your_app TombContracts)
```

**Usage in C++:**
```cpp
#include "TombContracts/api/PlayerApi.h"

using namespace org::openapitools::client::api;

PlayerApi playerApi("http://tomb-rpi.local:8000");

// Get player status
auto response = playerApi.getPlayerStatus().get();
auto state = response.data;

std::cout << "Playing: " << state.isPlaying << std::endl;
```

**Dependencies:**
- [cpprestsdk](https://github.com/microsoft/cpprestsdk) (Casablanca)
- Boost
- OpenSSL

### TypeScript/Web Application

**Option A: Git Submodule**

```bash
cd your-web-app
git submodule add https://github.com/theopenmusicbox/tomb-contracts.git contracts
```

**Usage in TypeScript:**
```typescript
import type { PlayerState, Playlist, Track } from '../contracts/releases/3.3.1-54739a9/typescript';

// Full type safety for API responses
async function getPlayer(): Promise<PlayerState> {
  const response = await fetch('/api/player/status');
  const json = await response.json();
  return json.data; // TypeScript knows this is PlayerState
}
```

### Python/Backend

**Usage in Python:**
```python
from contracts.releases.v3_2_0.python.models import PlayerState, Playlist

# Use Pydantic models for validation
state = PlayerState(
    is_playing=True,
    position_ms=30000,
    can_prev=True,
    can_next=True,
    server_seq=123
)
```

## 🔄 Workflow

### Making Changes to Contracts

1. **Edit source schemas:**
   ```bash
   # Edit REST API contracts
   vim schemas/openapi.yaml

   # Edit Socket.IO contracts
   vim schemas/socketio_contracts.json
   ```

2. **Test generation locally:**
   ```bash
   bash scripts/generate-all.sh
   ```

3. **Commit and push:**
   ```bash
   git add schemas/
   git commit -m "feat: add new endpoint for playlists export"
   git push origin main
   ```

4. **GitHub Actions automatically:**
   - Generates code for all languages
   - Creates versioned release in `releases/3.3.1-{commit-sha}/`
   - Tags the commit
   - Pushes changes back to repo

### Versioning Strategy

We use **semantic versioning** (semver) with automatic version detection:

- **Version Source**: Versions are read from `schemas/openapi.yaml` (line 9: `version: X.Y.Z`)
- **Release Tags**: Point to generated contract commits (e.g., `v3.2.0` → commit with full client libraries)
- **Release Directories**: Named as `{version}-{commit-hash}` (e.g., `releases/3.2.0-799bea2/`)

**Current Versions:**
- OpenAPI: `v3.3.1`
- Socket.IO: `v3.1.0`

**When to bump versions:**

- **Major (v4.0.0)**: Breaking API changes (rename fields, remove endpoints)
- **Minor (v3.4.0)**: Add new endpoints or fields (backward compatible)
- **Patch (v3.3.2)**: Fix documentation or generation scripts

**How versions are managed:**

1. **Edit schema version**: Update `version` field in `schemas/openapi.yaml`
2. **Push to main**: GitHub Actions automatically detects the version
3. **Auto-generation**: Creates `releases/{version}-{commit-hash}/` directory
4. **Auto-tagging**: Tags the generation commit as `v{version}`

**Why tags point to generation commits:**

Tags like `v3.2.0` point to commits containing generated client libraries (not schema commits). This ensures that checking out a version tag gives you **complete, ready-to-use packages** for all languages (Dart, Python, C++, TypeScript).

### Updating Client Applications

**After contracts are updated:**

1. Update submodule reference:
   ```bash
   cd your-app/contracts
   git fetch origin
   git checkout v3.3.1
   cd ..
   git add contracts
   git commit -m "Update contracts to v3.3.1"
   ```

2. Regenerate if needed:
   ```bash
   cd contracts
   bash scripts/generate-all.sh
   ```

## 📖 Contract Documentation

### REST API Endpoints

Full OpenAPI documentation is available at:
- **Local**: `schemas/openapi.yaml`
- **Swagger UI**: Import `openapi.yaml` into [Swagger Editor](https://editor.swagger.io/)

### Socket.IO Events

Socket.IO contract definitions are in `schemas/socketio_contracts.json`.

**Key event categories:**
- **Connection**: `connect`, `disconnect`, `connection_status`
- **State**: `state:player`, `state:playlist`, `state:track_position`
- **Operations**: `ack:op`, `err:op`
- **Subscriptions**: `join:playlist`, `leave:playlist`
- **Real-time**: `upload:progress`, `youtube:progress`

## 🧪 Testing

### Validate Contracts

```bash
# Validate OpenAPI schema
npx @openapitools/openapi-generator-cli validate -i schemas/openapi.yaml

# Validate JSON Schema
npm install -g ajv-cli
ajv validate -s schemas/socketio_contracts.json
```

## 🔧 Troubleshooting

### Generation Fails

**Problem**: `openapi-generator-cli not found`

**Solution**:
```bash
npm install -g @openapitools/openapi-generator-cli
```

**Problem**: `datamodel-codegen not found`

**Solution**:
```bash
pip install datamodel-code-generator
```

### C++ Compilation Errors

**Problem**: Missing cpprestsdk

**Solution**:
```bash
# macOS
brew install cpprestsdk

# Ubuntu/Debian
apt-get install libcpprest-dev

# Windows
vcpkg install cpprestsdk
```

### Dart Package Issues

**Problem**: `tomb_contracts not found`

**Solution**: Ensure path is correct in `pubspec.yaml`:
```yaml
dependencies:
  tomb_contracts:
    path: ./contracts/releases/3.3.1-54739a9/dart/  # Check this path
```

## 🤝 Contributing

### Adding New Endpoints

1. Edit `schemas/openapi.yaml`:
   ```yaml
   paths:
     /api/your-new-endpoint:
       post:
         summary: Your endpoint description
         ...
   ```

2. Test generation:
   ```bash
   bash scripts/generate-all.sh
   ```

3. Submit PR with changes

### Recent API Additions (v3.3.0)

**Extended Backend Capabilities:**
- `backend_type` - Backend platform identifier (rpi | esp32 | custom)
  - Enables better debugging and platform-specific adaptations
- `position_update_interval_ms` - Recommended position update frequency (100-5000ms)
  - RPI: 500ms for high-frequency updates
  - ESP32: 1000-2000ms for reduced network load
  - Enables adaptive UI update rates in client applications
- `supports_websocket_position` - WebSocket position streaming support flag
  - Allows backends to opt out of WebSocket position streaming
  - Enables fallback to HTTP polling if needed

These fields are returned in the `/api/system/info` endpoint under `capabilities` and allow client applications (Flutter, web, etc.) to automatically adapt their behavior based on backend constraints.

### Recent API Additions (v3.2.0)

**New Player Endpoints:**
- `POST /api/player/volume` - Set playback volume (0-100)

**New Playlist Endpoints:**
- `POST /api/playlists/move-track` - Move tracks between playlists
- `POST /api/playlists/sync` - Synchronize playlist state
- `DELETE /api/playlists/{playlist_id}/tracks` - Remove multiple tracks

**New Upload Endpoints:**
- `POST /api/uploads/cleanup` - Clean up stale upload sessions

**New System Endpoints:**
- `POST /api/system/restart` - Restart the system

### Adding New Socket.IO Events

1. Edit `schemas/socketio_contracts.json`:
   ```json
   {
     "contracts": {
       "your_category": {
         "events": {
           "your:event": {
             "direction": "server_to_client",
             "payload": { ... }
           }
         }
       }
     }
   }
   ```

2. Update TypeScript types manually in `generated/typescript/`

## 📄 License

MIT License - See `LICENSE` file

## 🔗 Related Repositories

- [tomb-rpi](https://github.com/theopenmusicbox/tomb-rpi) - Main backend + web frontend
- [tomb-flutter](https://github.com/theopenmusicbox/tomb-flutter) - Flutter mobile app
- [tomb-esp32](https://github.com/theopenmusicbox/tomb-esp32) - ESP32 remote controller

## 💬 Support

For questions or issues:
- Open an issue in this repository
- Check the [main project documentation](https://github.com/theopenmusicbox/tomb-rpi)
