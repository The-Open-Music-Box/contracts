# TheOpenMusicBox API Contracts

**Single source of truth for API contracts across all TheOpenMusicBox client implementations.**

This repository contains the canonical API and Socket.IO contract definitions for TheOpenMusicBox, with automatic code generation for multiple programming languages.

## 🎉 Latest Release: v2.0.0 - NFC Webhook Associations

**New in v2.0.0:** NFC tags can now trigger HTTP webhooks as an alternative to playlists!

**Important:** This is a **breaking change**. See [MIGRATION_GUIDE_v2.0.0.md](MIGRATION_GUIDE_v2.0.0.md) for migration instructions.

**Quick Links:**
- 📖 [Migration Guide](MIGRATION_GUIDE_v2.0.0.md) - How to upgrade from v1.x
- 🗺️ [Master Plan](WEBHOOK_ASSOCIATIONS_MASTER_PLAN.md) - Technical architecture
- 📋 [Week 1 Summary](WEEK1_COMPLETION_SUMMARY.md) - Current status
- 📝 [CHANGELOG](CHANGELOG.md) - All changes

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
│   ├── openapi.yaml             # REST API contracts (v2.0.0)
│   └── socketio_contracts.json  # Socket.IO event contracts
├── generated/                    # Auto-generated (gitignored)
│   ├── dart/                    # Flutter/Dart client
│   ├── cpp/                     # C++ client
│   ├── typescript/              # TypeScript types
│   └── python/                  # Python models
├── releases/                     # Versioned releases (committed)
│   └── v2.0.0/
│       ├── dart/
│       ├── cpp/
│       ├── typescript/
│       └── python/
├── scripts/
│   ├── generate-all.sh          # Generate for all languages
│   └── generators/              # Individual language generators
├── docs/                         # Documentation
│   ├── MIGRATION_GUIDE_v2.0.0.md
│   ├── WEBHOOK_ASSOCIATIONS_MASTER_PLAN.md
│   ├── WEEK1_COMPLETION_SUMMARY.md
│   └── PROJECT_COORDINATION_MASTER_PLAN.md
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
    path: ./contracts/releases/v2.0.0/dart/
```

**Option B: Direct Copy (Production)**

```bash
# Copy generated Dart package to your project
cp -r contracts/releases/v2.0.0/dart/ lib/api/tomb_contracts/
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
add_subdirectory(contracts/releases/v2.0.0/cpp)
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
import type { PlayerState, Playlist, Track, NFCWebhookAssociation } from '../contracts/releases/v2.0.0/typescript';

// Full type safety for API responses
async function getPlayer(): Promise<PlayerState> {
  const response = await fetch('/api/player/status');
  const json = await response.json();
  return json.data; // TypeScript knows this is PlayerState
}

// NEW in v2.0.0: Create webhook association
async function createWebhookAssociation(tagId: string, webhookUrl: string) {
  await fetch('/api/nfc/associate', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      tag_id: tagId,
      association_type: 'webhook',
      webhook_url: webhookUrl,
      webhook_method: 'POST',
      webhook_body: JSON.stringify({ tag_id: '{{tag_id}}', timestamp: '{{timestamp}}' })
    })
  });
}
```

### Python/Backend

**Usage in Python:**
```python
from contracts.releases.v3_0_0.python.models import PlayerState, Playlist

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
   vim schemas/socketio-events.json
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
   - Creates versioned release in `releases/v3.0.0-{commit-sha}/`
   - Tags the commit
   - Pushes changes back to repo

### Versioning Strategy

We use **semantic versioning** (semver):

- `v2.0.0` - Major version (breaking changes) - **CURRENT**
- `v2.1.0` - Minor version (new features, backward compatible)
- `v2.0.1` - Patch version (bug fixes)

**When to bump versions:**

- **Major (v3.0.0)**: Breaking API changes (rename fields, remove endpoints)
- **Minor (v2.1.0)**: Add new endpoints or fields (backward compatible)
- **Patch (v2.0.1)**: Fix documentation or generation scripts

**Recent Version History:**
- `v2.0.0` (2025-01-27): **Breaking** - Added NFC webhook associations
- `v1.5.0` (2025-01-17): Added volume endpoint fix
- `v1.0.0` (2025-01-09): Initial OpenAPI specification

### Updating Client Applications

**After contracts are updated:**

1. Update submodule reference:
   ```bash
   cd your-app/contracts
   git fetch origin
   git checkout v2.0.0
   cd ..
   git add contracts
   git commit -m "Update contracts to v2.0.0"
   ```

   **⚠️ Important for v2.0.0:** See [MIGRATION_GUIDE_v2.0.0.md](MIGRATION_GUIDE_v2.0.0.md) for breaking changes!

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

**Key Endpoint Categories:**
- **Player**: `/api/player/*` - Playback control
- **Playlists**: `/api/playlists/*` - Playlist management
- **NFC**: `/api/nfc/*` - NFC associations (playlist or webhook)
- **Uploads**: `/api/uploads/*` - File upload management
- **YouTube**: `/api/youtube/*` - YouTube download
- **System**: `/api/system/*` - System information

### 🆕 NFC Webhook Associations (v2.0.0)

**New Feature:** NFC tags can now trigger HTTP webhooks!

**Create Webhook Association:**
```bash
POST /api/nfc/associate
{
  "tag_id": "04:A3:2C:1A:5D:6E:80",
  "association_type": "webhook",
  "webhook_url": "https://api.example.com/hook",
  "webhook_method": "POST",
  "webhook_body": "{\"tag\": \"{{tag_id}}\", \"time\": \"{{timestamp}}\"}"
}
```

**Variable Substitution:**
- `{{tag_id}}` - NFC tag UID
- `{{timestamp}}` - ISO 8601 timestamp
- `{{device_id}}` - Device identifier
- `{{trigger_count}}` - Number of triggers

**Test Webhook:**
```bash
POST /api/nfc/webhook/test
{
  "webhook_url": "https://webhook.site/unique-id",
  "webhook_method": "POST"
}
```

**Use Cases:**
- Trigger IFTTT applets
- Call Zapier webhooks
- Control Home Assistant
- Send notifications to Slack/Discord
- Update Google Sheets
- Custom IoT integrations

See [WEBHOOK_ASSOCIATIONS_MASTER_PLAN.md](WEBHOOK_ASSOCIATIONS_MASTER_PLAN.md) for complete details.

### Socket.IO Events

Socket.IO contract definitions are in `schemas/socketio_contracts.json`.

**Key event categories:**
- **Connection**: `connect`, `disconnect`, `connection_status`
- **State**: `state:player`, `state:playlist`, `state:track_position`
- **Operations**: `ack:op`, `err:op`
- **Subscriptions**: `join:playlist`, `leave:playlist`
- **Real-time**: `upload:progress`, `youtube:progress`
- **🆕 Webhooks**: `webhook_trigger_result` - Real-time webhook execution results

## 🧪 Testing

### Validate Contracts

```bash
# Validate OpenAPI schema
npx @openapitools/openapi-generator-cli validate -i schemas/openapi.yaml

# Validate JSON Schema
npm install -g ajv-cli
ajv validate -s schemas/socketio-events.json
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
    path: ./contracts/releases/v2.0.0/dart/  # Check this path
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

### Adding New Socket.IO Events

1. Edit `schemas/socketio-events.json`:
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
