# Changelog

All notable changes to TheOpenMusicBox API contracts will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [3.3.1] - 2025-11-04

### Fixed
- **Playlist Update Response**: Changed `PUT /api/playlists/{playlist_id}` response
  - Now returns full `PlaylistDetailed` object in `data` field (consistent with ESP32 backend)
  - Previously returned only `{client_op_id: string}`
  - This fixes JSON parsing errors in Flutter app when renaming playlists
  - Ensures consistent behavior across RPI and ESP32 backends

### Migration Guide
Backends implementing v3.3.1 should:
1. Update `PUT /api/playlists/{playlist_id}` endpoint to return full playlist object after update
2. Fetch the updated playlist and return it in the `data` field of UnifiedResponse

Clients should:
1. Update to expect full `PlaylistDetailed` object in update response
2. Remove any workarounds for refetching playlist after update

## [3.3.0] - 2025-11-03

### Added
- **Backend Identification**: Added `backend_type` field to BackendCapabilities
  - Enum values: `rpi`, `esp32`, `custom`
  - Enables better debugging and platform-specific adaptations

- **Position Update Configuration**: Added `position_update_interval_ms` field
  - Allows backends to specify optimal update frequency (100-5000ms)
  - RPI typically uses 500ms, ESP32 uses 1000-2000ms
  - Enables adaptive UI update rates in Flutter app

- **WebSocket Position Support**: Added `supports_websocket_position` field
  - Allows backends to opt out of WebSocket position streaming
  - Enables fallback to HTTP polling if needed

### Changed
- Contract version bumped from 3.2.0 to 3.3.0

### Migration Guide
Backends implementing v3.3.0 should:
1. Add `backend_type` to capabilities response
2. Add `position_update_interval_ms` (recommended: 500 for RPI, 1000+ for ESP32)
3. Add `supports_websocket_position` (default: true)

Clients can safely ignore new fields (backward compatible).

## [3.2.0] - 2025-01-30

### Added
- **New Player Endpoints:**
  - `POST /api/player/volume` - Set playback volume (0-100)

- **New Playlist Endpoints:**
  - `POST /api/playlists/move-track` - Move tracks between playlists
  - `POST /api/playlists/sync` - Synchronize playlist state
  - `DELETE /api/playlists/{playlist_id}/tracks` - Remove multiple tracks

- **New Upload Endpoints:**
  - `POST /api/uploads/cleanup` - Clean up stale upload sessions

- **New System Endpoints:**
  - `POST /api/system/restart` - Restart the system

- **New Socket.IO Events:**
  - `client_ping` / `client_pong` - Health check ping/pong
  - `state:volume_changed` - Volume change notifications
  - `sync:request` / `sync:complete` / `sync:error` - State synchronization
  - `client:request_current_state` - Immediate state snapshot request
  - `stop_nfc_link` - Cancel NFC association session
  - `override_nfc_tag` - Override existing NFC association
  - `youtube:progress` / `youtube:complete` / `youtube:error` - YouTube download events

### Changed
- PlayerState schema: Clarified that `active_track` is not a full object, but individual fields (`active_track_id`, `active_track_number`, `active_track_title`)
- Updated all documentation examples to use correct field names
- Updated version references from v3.0.0 to v3.2.0 throughout documentation

### Fixed
- Corrected PlayerState examples in all documentation files
- Fixed incorrect field references in code examples (Flutter, C++, TypeScript, Python)
- Updated Socket.IO envelope structure documentation to clarify `playlist_seq` vs `server_seq`

### Documentation
- Comprehensive update of README.md with new endpoints
- Updated SETUP.md with current version references
- Corrected all code examples in EXAMPLES.md
- Enhanced SOCKETIO_EVENTS.md with missing events and clarifications

## [3.1.0] - 2025-01-15

### Added
- Socket.IO contracts version bump
- Enhanced state synchronization events
- Improved NFC association workflow

## [3.0.0] - 2025-01-09

### Added
- Initial OpenAPI 3.0 specification
- Complete REST API contracts for all endpoints
- Socket.IO event contracts in JSON Schema format
- Multi-language code generation support:
  - Dart/Flutter client
  - C++ client (cpp-restsdk)
  - TypeScript types
  - Python Pydantic models
- Automated CI/CD pipeline for contract generation
- Comprehensive documentation

### Endpoints Included
- Health check (`/api/health`)
- Player control (`/api/player/*`)
- Playlist management (`/api/playlists/*`)
- NFC association (`/api/nfc/*`)
- System information (`/api/system/*`)
- YouTube download (`/api/youtube/*`)
- Upload management (`/api/uploads/*`)

### Socket.IO Events
- Connection lifecycle events
- Player state events
- Playlist state events
- Real-time position updates
- Operation acknowledgments
- NFC session events
- Upload progress events
- YouTube download progress

---

## Future Versions

### [Unreleased]
- TBD

---

## Version Guidelines

### Major Version (Breaking Changes)
- Removing endpoints
- Renaming fields
- Changing data types
- Removing required fields

### Minor Version (Backward Compatible)
- Adding new endpoints
- Adding optional fields
- Adding new Socket.IO events

### Patch Version (Bug Fixes)
- Documentation fixes
- Schema validation fixes
- Generation script improvements
