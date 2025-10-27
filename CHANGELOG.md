# Changelog

All notable changes to TheOpenMusicBox API contracts will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2025-01-27

### Added
- **Webhook Support for NFC Associations**: NFC tags can now trigger HTTP webhooks as an alternative to playlists
- New `NFCWebhookAssociation` schema with fields:
  - `webhook_url` (required): HTTP/HTTPS endpoint to trigger
  - `webhook_method`: GET, POST, or PUT (default: POST)
  - `webhook_headers`: Custom HTTP headers (key-value pairs)
  - `webhook_body`: Request body template with variable substitution support
  - `webhook_timeout_ms`: Timeout in milliseconds (1000-30000, default: 5000)
  - `last_triggered_at`: Timestamp of last successful trigger
  - `trigger_count`: Number of times webhook has been triggered
- New endpoint `POST /api/nfc/webhook/test`: Test webhook configuration before creating association
  - Validates webhook URL and connectivity
  - Returns status code, response time, and error details
  - Does not create an association (dry-run mode)
- **Variable Substitution** in webhook URLs, headers, and bodies:
  - `{{tag_id}}`: NFC tag UID (e.g., "04:A3:2C:1A:5D:6E:80")
  - `{{timestamp}}`: ISO 8601 timestamp of trigger event
  - `{{device_id}}`: Device identifier (RPI serial or ESP32 MAC address)
  - `{{trigger_count}}`: Number of times this association has been triggered
- New Socket.IO event `webhook_trigger_result`: Broadcast webhook trigger results to all clients
  - Includes: tag_id, webhook_url, success, status_code, response_time_ms, error, timestamp
  - Allows UI to display webhook execution feedback in real-time

### Changed
- **BREAKING**: `NFCAssociation` schema now uses discriminator pattern with `oneOf`
  - `association_type` field is now **required** ('playlist' | 'webhook')
  - Playlist associations require `playlist_id` field
  - Webhook associations require `webhook_url` field
  - Old clients sending associations without `association_type` will receive 400 Bad Request
- **BREAKING**: `POST /api/nfc/associate` request body now requires `association_type` field
  - For playlist associations: Include `association_type: "playlist"` and `playlist_id`
  - For webhook associations: Include `association_type: "webhook"` and webhook configuration fields
- Socket.IO `nfc_association_state` event updated with new fields:
  - New state value: `'webhook_triggered'` (emitted when webhook is successfully called)
  - New field: `association_type` ('playlist' | 'webhook' | null)
  - New field: `webhook_url` (string | null)
  - New object: `webhook_response` with properties:
    - `status_code`: HTTP status code returned by webhook
    - `success`: Boolean indicating if webhook call succeeded
    - `error`: Error message if webhook call failed
  - **BREAKING**: Renamed field `existing_playlist` → `existing_association`
    - Old field name removed
    - New field now contains: `{ type: 'playlist' | 'webhook', playlist_id?: string, webhook_url?: string }`

### Migration Guide
**For Client Developers** (Flutter, TypeScript, C++):
1. Regenerate client libraries from updated contracts (v2.0.0)
2. Update NFC association UI to allow users to choose between "Playlist" or "Webhook"
3. When creating playlist associations, include `association_type: "playlist"`
4. When creating webhook associations:
   - Include `association_type: "webhook"`
   - Provide `webhook_url` (required)
   - Optionally provide: `webhook_method`, `webhook_headers`, `webhook_body`, `webhook_timeout_ms`
5. Update Socket.IO event handlers:
   - Handle new `webhook_trigger_result` event
   - Update `nfc_association_state` handler to use `existing_association` instead of `existing_playlist`
6. Handle new state `'webhook_triggered'` in NFC association flows

**For Backend Developers** (Python, ESP32):
1. Update database schema to support new fields (see migration scripts in implementation guides)
2. Implement webhook trigger service using HTTP client (httpx for Python, HTTPClient for ESP32)
3. Implement variable substitution logic for webhook templates
4. Update NFC tag scan handler to:
   - Check `association_type` field
   - Trigger webhook if type is 'webhook', or play playlist if type is 'playlist'
5. Emit `webhook_trigger_result` Socket.IO event after webhook execution
6. Update `POST /api/nfc/associate` endpoint to accept and validate webhook fields

**Backward Compatibility Notes**:
- Backend v1.0.0 should accept requests without `association_type` and default to 'playlist' for gradual migration
- Old clients will continue working during rollout period
- After all clients are updated to v2.0.0, backend can enforce `association_type` requirement

For detailed implementation guides, see:
- `WEBHOOK_ASSOCIATIONS_MASTER_PLAN.md` (architecture overview)
- `WEBHOOK_IMPLEMENTATION.md` (contracts team guide)
- Repository-specific implementation guides in each repo's feature branch

---

## [3.2.0] - 2025-01-17

### Changed
- **BREAKING (Minor)**: `/api/player/volume` endpoint now returns full `PlayerState` schema instead of just `{volume: int}`
  - This ensures consistency with all other player control endpoints (`/play`, `/pause`, `/seek`, etc.)
  - Backward compatible: clients that only check the `volume` field will still work, but they now receive the full player state
  - **Flutter App Fix**: Resolves "No player data in response" error when calling POST `/api/player/volume`
  - **RPI Implementation**: Fixed to return `PlayerState` instead of merged object
  - **ESP32 Implementation**: Updated `handleVolumeSet()` to return player status via `handleGetStatus()`

### Developer Impact
- **RPI Firmware**: Update `/api/player/volume` endpoint to return status instead of `{"volume": volume, **status}`
- **ESP32 Firmware**: `handleVolumeSet()` now calls `handleGetStatus()` to return PlayerState
- **Flutter App**: No changes needed - already expects PlayerState

---

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
