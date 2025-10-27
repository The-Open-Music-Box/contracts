# Contracts Repository - Webhook Associations Implementation

**Issue:** [#1](https://github.com/The-Open-Music-Box/contracts/issues/1)
**Branch:** `feature/webhook-associations-contracts`
**Estimated Time:** 1 week
**Dependencies:** None (this is the foundation)

---

## 📋 Overview

This document provides step-by-step implementation guidance for adding webhook support to the OpenAPI and Socket.IO contracts.

**Goal:** Update contracts to support NFC webhook associations alongside playlist associations.

**Impact:** Breaking change → Version to v2.0.0

---

## ✅ Checklist

### OpenAPI Schema Updates
- [ ] Update `NFCAssociation` schema with discriminator
- [ ] Create `NFCAssociationBase` schema
- [ ] Create `NFCPlaylistAssociation` schema
- [ ] Create `NFCWebhookAssociation` schema
- [ ] Update `POST /api/nfc/associate` request schema
- [ ] Add `POST /api/nfc/webhook/test` endpoint
- [ ] Update response schemas

### Socket.IO Updates
- [ ] Update `nfc_association_state` event payload
- [ ] Add `webhook_trigger_result` event

### Documentation
- [ ] Add webhook variable documentation
- [ ] Add webhook examples
- [ ] Update CHANGELOG.md
- [ ] Create migration guide

### Versioning & Distribution
- [ ] Update version to v2.0.0 in package.json
- [ ] Generate client libraries (Python, TypeScript, Dart, C++)
- [ ] Test generated clients compile
- [ ] Publish to package registry (if applicable)

---

## 📝 Step-by-Step Implementation

### Step 1: Update OpenAPI Schema

**File:** `schemas/openapi.yaml`

#### 1.1 Update Components Section

Find the `components.schemas` section and add the new schemas:

```yaml
components:
  schemas:
    # NEW: Base association schema with discriminator
    NFCAssociationBase:
      type: object
      required:
        - tag_id
        - association_type
        - created_at
      properties:
        tag_id:
          type: string
          description: "NFC tag unique identifier (UID as hex string)"
          example: "04:A3:2C:1A:5D:6E:80"
        association_type:
          type: string
          enum: [playlist, webhook]
          description: "Type of association"
        created_at:
          type: string
          format: date-time
          description: "ISO 8601 timestamp of association creation"
      discriminator:
        propertyName: association_type
        mapping:
          playlist: '#/components/schemas/NFCPlaylistAssociation'
          webhook: '#/components/schemas/NFCWebhookAssociation'

    # NEW: Playlist association
    NFCPlaylistAssociation:
      allOf:
        - $ref: '#/components/schemas/NFCAssociationBase'
        - type: object
          required:
            - playlist_id
            - playlist_title
          properties:
            playlist_id:
              type: string
              description: "Associated playlist unique identifier"
            playlist_title:
              type: string
              description: "Playlist title (cached for display)"

    # NEW: Webhook association
    NFCWebhookAssociation:
      allOf:
        - $ref: '#/components/schemas/NFCAssociationBase'
        - type: object
          required:
            - webhook_url
          properties:
            webhook_url:
              type: string
              format: uri
              description: "HTTP(S) URL to trigger"
              example: "https://api.example.com/webhook"
            webhook_method:
              type: string
              enum: [GET, POST, PUT]
              default: POST
              description: "HTTP method to use"
            webhook_headers:
              type: object
              additionalProperties:
                type: string
              description: "Custom HTTP headers"
              example:
                Authorization: "Bearer token123"
                X-Device-ID: "{{device_id}}"
            webhook_body:
              type: string
              description: "Request body template (supports variable substitution)"
              example: "{\"tag_id\": \"{{tag_id}}\", \"timestamp\": \"{{timestamp}}\"}"
            webhook_timeout_ms:
              type: integer
              minimum: 1000
              maximum: 30000
              default: 5000
              description: "Request timeout in milliseconds"
            last_triggered_at:
              type: string
              format: date-time
              nullable: true
              description: "ISO 8601 timestamp of last trigger"
            trigger_count:
              type: integer
              minimum: 0
              default: 0
              description: "Number of times this webhook has been triggered"

    # Update the old NFCAssociation to use oneOf for backward compatibility
    NFCAssociation:
      oneOf:
        - $ref: '#/components/schemas/NFCPlaylistAssociation'
        - $ref: '#/components/schemas/NFCWebhookAssociation'
      discriminator:
        propertyName: association_type
```

#### 1.2 Update POST /api/nfc/associate Request

Find the `POST /api/nfc/associate` endpoint and update the request body:

```yaml
paths:
  /api/nfc/associate:
    post:
      summary: Associate NFC tag with playlist or webhook
      description: |
        Create an association between an NFC tag and either a playlist or a webhook.

        **Playlist Association:**
        - Requires `playlist_id` field
        - Tag will trigger playlist playback when scanned

        **Webhook Association:**
        - Requires `webhook_url` field
        - Tag will trigger HTTP webhook when scanned
        - Supports variable substitution in URL, headers, and body:
          - `{{tag_id}}` - NFC tag identifier
          - `{{timestamp}}` - ISO 8601 UTC timestamp
          - `{{device_id}}` - Device unique identifier
          - `{{trigger_count}}` - Number of times triggered
      tags:
        - NFC
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              required:
                - tag_id
                - association_type
              properties:
                tag_id:
                  type: string
                  description: "NFC tag unique identifier"
                association_type:
                  type: string
                  enum: [playlist, webhook]
                  description: "Type of association to create"
                client_op_id:
                  type: string
                  description: "Optional client operation ID for tracking"

                # Playlist fields (required if association_type=playlist)
                playlist_id:
                  type: string
                  description: "Playlist ID (required for playlist associations)"

                # Webhook fields (required if association_type=webhook)
                webhook_url:
                  type: string
                  format: uri
                  description: "Webhook URL (required for webhook associations)"
                webhook_method:
                  type: string
                  enum: [GET, POST, PUT]
                  default: POST
                webhook_headers:
                  type: object
                  additionalProperties:
                    type: string
                webhook_body:
                  type: string
                webhook_timeout_ms:
                  type: integer
                  minimum: 1000
                  maximum: 30000
                  default: 5000

            examples:
              playlistAssociation:
                summary: Playlist Association
                value:
                  tag_id: "04:A3:2C:1A:5D:6E:80"
                  association_type: "playlist"
                  playlist_id: "playlist-123"
                  client_op_id: "op-uuid-1234"

              webhookAssociation:
                summary: Webhook Association
                value:
                  tag_id: "04:A3:2C:1A:5D:6E:80"
                  association_type: "webhook"
                  webhook_url: "https://api.example.com/webhook"
                  webhook_method: "POST"
                  webhook_headers:
                    Authorization: "Bearer token123"
                  webhook_body: "{\"tag_id\": \"{{tag_id}}\", \"timestamp\": \"{{timestamp}}\"}"
                  webhook_timeout_ms: 5000
                  client_op_id: "op-uuid-5678"

      responses:
        '200':
          description: Association created successfully
          content:
            application/json:
              schema:
                type: object
                properties:
                  association:
                    $ref: '#/components/schemas/NFCAssociation'

        '400':
          description: Invalid request (validation errors)
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'

        '404':
          description: Playlist not found (for playlist associations)
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
```

#### 1.3 Add POST /api/nfc/webhook/test Endpoint

Add this new endpoint after `/api/nfc/associate`:

```yaml
  /api/nfc/webhook/test:
    post:
      summary: Test webhook configuration
      description: |
        Validates webhook URL and sends a test request to verify connectivity.

        This endpoint does not create an association, it only tests the webhook.
        Use this before creating a webhook association to ensure it works.
      tags:
        - NFC
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              required:
                - webhook_url
              properties:
                webhook_url:
                  type: string
                  format: uri
                webhook_method:
                  type: string
                  enum: [GET, POST, PUT]
                  default: POST
                webhook_headers:
                  type: object
                  additionalProperties:
                    type: string
                webhook_body:
                  type: string
                webhook_timeout_ms:
                  type: integer
                  minimum: 1000
                  maximum: 30000
                  default: 5000

            example:
              webhook_url: "https://webhook.site/unique-id"
              webhook_method: "POST"
              webhook_headers:
                Content-Type: "application/json"
              webhook_body: "{\"test\": true}"
              webhook_timeout_ms: 5000

      responses:
        '200':
          description: Webhook test result
          content:
            application/json:
              schema:
                type: object
                required:
                  - success
                  - response_time_ms
                properties:
                  success:
                    type: boolean
                    description: "True if webhook responded with 2xx status"
                  status_code:
                    type: integer
                    nullable: true
                    description: "HTTP status code from webhook (null if connection failed)"
                  response_time_ms:
                    type: integer
                    description: "Time taken for request in milliseconds"
                  error:
                    type: string
                    nullable: true
                    description: "Error message if test failed"

              examples:
                success:
                  summary: Successful Test
                  value:
                    success: true
                    status_code: 200
                    response_time_ms: 234
                    error: null

                failure:
                  summary: Failed Test
                  value:
                    success: false
                    status_code: null
                    response_time_ms: 5000
                    error: "Connection timeout"

        '400':
          description: Invalid webhook configuration
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
```

---

### Step 2: Update Socket.IO Contracts

**File:** `schemas/socketio_contracts.json`

#### 2.1 Update nfc_association_state Event

Find the `nfc_association_state` event and update its payload schema:

```json
{
  "event_name": "nfc_association_state",
  "direction": "server_to_client",
  "description": "Broadcast when NFC association session state changes",
  "payload_schema": {
    "type": "object",
    "required": ["state", "server_seq"],
    "properties": {
      "state": {
        "type": "string",
        "enum": [
          "activated",
          "waiting",
          "success",
          "duplicate",
          "timeout",
          "cancelled",
          "error",
          "webhook_triggered"
        ],
        "description": "Current state of association session"
      },
      "association_type": {
        "type": "string",
        "enum": ["playlist", "webhook"],
        "nullable": true,
        "description": "Type of association being created (null for non-success states)"
      },
      "playlist_id": {
        "type": "string",
        "nullable": true,
        "description": "Playlist ID (for playlist associations)"
      },
      "tag_id": {
        "type": "string",
        "nullable": true,
        "description": "NFC tag identifier"
      },
      "webhook_url": {
        "type": "string",
        "nullable": true,
        "description": "Webhook URL (for webhook associations)"
      },
      "webhook_response": {
        "type": "object",
        "nullable": true,
        "description": "Webhook test response (if applicable)",
        "properties": {
          "status_code": {
            "type": "integer"
          },
          "success": {
            "type": "boolean"
          },
          "error": {
            "type": "string",
            "nullable": true
          }
        }
      },
      "message": {
        "type": "string",
        "nullable": true,
        "description": "Human-readable status message"
      },
      "expires_at": {
        "type": "number",
        "nullable": true,
        "description": "Unix timestamp when session expires (milliseconds)"
      },
      "existing_association": {
        "type": "object",
        "nullable": true,
        "description": "Existing association info (for duplicate state)",
        "properties": {
          "type": {
            "type": "string",
            "enum": ["playlist", "webhook"]
          },
          "playlist_id": {
            "type": "string",
            "nullable": true
          },
          "playlist_title": {
            "type": "string",
            "nullable": true
          },
          "webhook_url": {
            "type": "string",
            "nullable": true
          }
        }
      },
      "server_seq": {
        "type": "number",
        "description": "Server sequence number for event ordering"
      }
    }
  },
  "examples": [
    {
      "description": "Webhook association success",
      "payload": {
        "state": "success",
        "association_type": "webhook",
        "tag_id": "04:A3:2C:1A:5D:6E:80",
        "webhook_url": "https://api.example.com/webhook",
        "message": "Webhook association created successfully",
        "server_seq": 12345
      }
    },
    {
      "description": "Duplicate webhook detected",
      "payload": {
        "state": "duplicate",
        "tag_id": "04:A3:2C:1A:5D:6E:80",
        "message": "Tag already associated with webhook",
        "existing_association": {
          "type": "webhook",
          "webhook_url": "https://api.another.com/hook"
        },
        "server_seq": 12346
      }
    }
  ]
}
```

#### 2.2 Add webhook_trigger_result Event

Add this new event to the events array:

```json
{
  "event_name": "webhook_trigger_result",
  "direction": "server_to_client",
  "description": "Broadcast when a webhook is triggered by NFC tag scan",
  "payload_schema": {
    "type": "object",
    "required": [
      "tag_id",
      "success",
      "response_time_ms",
      "timestamp",
      "server_seq"
    ],
    "properties": {
      "tag_id": {
        "type": "string",
        "description": "NFC tag identifier that triggered the webhook"
      },
      "webhook_url": {
        "type": "string",
        "description": "Webhook URL that was triggered"
      },
      "success": {
        "type": "boolean",
        "description": "True if webhook responded with 2xx status"
      },
      "status_code": {
        "type": "integer",
        "nullable": true,
        "description": "HTTP status code (null if connection failed)"
      },
      "response_time_ms": {
        "type": "integer",
        "description": "Time taken for webhook request in milliseconds"
      },
      "error": {
        "type": "string",
        "nullable": true,
        "description": "Error message if webhook failed"
      },
      "timestamp": {
        "type": "string",
        "format": "date-time",
        "description": "ISO 8601 timestamp of trigger"
      },
      "server_seq": {
        "type": "number",
        "description": "Server sequence number for event ordering"
      }
    }
  },
  "examples": [
    {
      "description": "Successful webhook trigger",
      "payload": {
        "tag_id": "04:A3:2C:1A:5D:6E:80",
        "webhook_url": "https://api.example.com/webhook",
        "success": true,
        "status_code": 200,
        "response_time_ms": 234,
        "error": null,
        "timestamp": "2025-01-27T14:30:00Z",
        "server_seq": 12347
      }
    },
    {
      "description": "Failed webhook trigger (timeout)",
      "payload": {
        "tag_id": "04:A3:2C:1A:5D:6E:80",
        "webhook_url": "https://api.slow-endpoint.com/webhook",
        "success": false,
        "status_code": null,
        "response_time_ms": 5000,
        "error": "Connection timeout",
        "timestamp": "2025-01-27T14:31:00Z",
        "server_seq": 12348
      }
    }
  ]
}
```

---

### Step 3: Update Documentation

#### 3.1 Add Variable Substitution Documentation

Create a new file `docs/WEBHOOK_VARIABLES.md`:

```markdown
# Webhook Variable Substitution

Webhook URLs, headers, and body templates support variable substitution using the `{{variable_name}}` syntax.

## Supported Variables

| Variable | Description | Example Value |
|----------|-------------|---------------|
| `{{tag_id}}` | NFC tag unique identifier | `04:A3:2C:1A:5D:6E:80` |
| `{{timestamp}}` | ISO 8601 UTC timestamp | `2025-01-27T14:30:00Z` |
| `{{device_id}}` | Device unique identifier | `rpi-001` or `esp32-kitchen` |
| `{{trigger_count}}` | Number of times triggered | `5` |

## Usage Examples

### URL Substitution
```
https://api.example.com/nfc/{{tag_id}}/trigger
```
Becomes:
```
https://api.example.com/nfc/04:A3:2C:1A:5D:6E:80/trigger
```

### Header Substitution
```json
{
  "X-Device-ID": "{{device_id}}",
  "X-Timestamp": "{{timestamp}}"
}
```
Becomes:
```json
{
  "X-Device-ID": "rpi-001",
  "X-Timestamp": "2025-01-27T14:30:00Z"
}
```

### Body Substitution
```json
{
  "tag_id": "{{tag_id}}",
  "timestamp": "{{timestamp}}",
  "device": "{{device_id}}",
  "count": {{trigger_count}}
}
```
Becomes:
```json
{
  "tag_id": "04:A3:2C:1A:5D:6E:80",
  "timestamp": "2025-01-27T14:30:00Z",
  "device": "rpi-001",
  "count": 5
}
```

## Notes
- Variables are case-sensitive
- Unknown variables are left as-is
- Variables in JSON bodies: use `"{{var}}"` for strings, `{{var}}` for numbers
```

#### 3.2 Update CHANGELOG.md

```markdown
# Changelog

## [2.0.0] - 2025-01-27

### Added
- **BREAKING:** Webhook support for NFC associations
  - New `NFCWebhookAssociation` schema
  - New `POST /api/nfc/webhook/test` endpoint
  - New `webhook_trigger_result` Socket.IO event
  - Variable substitution support ({{tag_id}}, {{timestamp}}, {{device_id}}, {{trigger_count}})

### Changed
- **BREAKING:** `NFCAssociation` schema now uses discriminator pattern
  - `association_type` field is now required
  - Playlist associations require `playlist_id`
  - Webhook associations require `webhook_url`
- Updated `POST /api/nfc/associate` to support both association types
- Updated `nfc_association_state` Socket.IO event with webhook fields

### Migration Guide
See `docs/MIGRATION_V1_TO_V2.md` for migration instructions.

## [1.x.x] - Previous versions
...
```

#### 3.3 Create Migration Guide

Create `docs/MIGRATION_V1_TO_V2.md`:

```markdown
# Migration Guide: v1.x to v2.0

## Overview
Version 2.0 introduces webhook support for NFC associations, which requires schema changes.

## Breaking Changes

### 1. NFCAssociation Schema
**Before (v1.x):**
```json
{
  "tag_id": "04:A3:2C:1A:5D:6E:80",
  "playlist_id": "playlist-123",
  "playlist_title": "My Playlist",
  "created_at": "2025-01-27T14:30:00Z"
}
```

**After (v2.0):**
```json
{
  "tag_id": "04:A3:2C:1A:5D:6E:80",
  "association_type": "playlist",
  "playlist_id": "playlist-123",
  "playlist_title": "My Playlist",
  "created_at": "2025-01-27T14:30:00Z"
}
```

**Action Required:**
- Add `association_type: "playlist"` field to all existing associations
- Database migration will handle this automatically

### 2. POST /api/nfc/associate Request
**Before (v1.x):**
```json
{
  "tag_id": "04:A3:2C:1A:5D:6E:80",
  "playlist_id": "playlist-123"
}
```

**After (v2.0):**
```json
{
  "tag_id": "04:A3:2C:1A:5D:6E:80",
  "association_type": "playlist",
  "playlist_id": "playlist-123"
}
```

**Action Required:**
- Update API clients to include `association_type` field
- For playlist associations, set to `"playlist"`

## Backward Compatibility

### API Compatibility
- Old clients (v1.x) can continue to work if backend provides default value
- Backend should infer `association_type="playlist"` if not provided
- Socket.IO events are backward compatible (new fields are optional)

### Database Migration
The backend will run a migration script that:
1. Adds `association_type` column
2. Sets `association_type="playlist"` for all existing records
3. Makes `association_type` non-nullable

## New Features

### Webhook Associations
Create webhook associations:
```json
POST /api/nfc/associate
{
  "tag_id": "04:A3:2C:1A:5D:6E:80",
  "association_type": "webhook",
  "webhook_url": "https://api.example.com/webhook",
  "webhook_method": "POST",
  "webhook_body": "{\"tag_id\": \"{{tag_id}}\"}"
}
```

### Test Webhooks
Test webhook before creating association:
```json
POST /api/nfc/webhook/test
{
  "webhook_url": "https://api.example.com/webhook",
  "webhook_method": "POST"
}

Response:
{
  "success": true,
  "status_code": 200,
  "response_time_ms": 234
}
```

## Rollback Plan
If issues occur, rollback to v1.x:
1. Restore database backup
2. Deploy v1.x contracts
3. Deploy v1.x backend/frontend/firmware
4. Remove webhook associations from database
```

---

### Step 4: Update Version

**File:** `package.json`

```json
{
  "name": "@openmusicbox/contracts",
  "version": "2.0.0",
  "description": "OpenAPI and Socket.IO contracts for OpenMusicBox",
  ...
}
```

---

### Step 5: Generate Client Libraries

Run the code generation scripts:

```bash
# Python client
npm run generate:python

# TypeScript client
npm run generate:typescript

# Dart client (for Flutter)
npm run generate:dart

# C++ client (for ESP32)
npm run generate:cpp
```

Verify all clients compile without errors.

---

### Step 6: Testing

#### 6.1 Validate OpenAPI Spec

```bash
npm run validate:openapi
```

Should output: ✅ OpenAPI spec is valid

#### 6.2 Validate Socket.IO Spec

```bash
npm run validate:socketio
```

Should output: ✅ Socket.IO contracts are valid

#### 6.3 Test Generated Clients

**Python:**
```bash
cd generated/python
pip install -e .
python -c "from openmusicbox_client.models import NFCWebhookAssociation; print('OK')"
```

**TypeScript:**
```bash
cd generated/typescript
npm install
npm run build
```

**Dart:**
```bash
cd generated/dart
dart pub get
dart analyze
```

---

### Step 7: Documentation Review

- [ ] README.md updated with v2.0 information
- [ ] CHANGELOG.md has v2.0.0 entry
- [ ] MIGRATION_V1_TO_V2.md created
- [ ] WEBHOOK_VARIABLES.md created
- [ ] Example requests/responses added

---

## 🚀 Deployment

### 1. Commit Changes
```bash
git add .
git commit -m "feat: add webhook support to NFC associations (v2.0.0)

BREAKING CHANGE: NFCAssociation schema now requires association_type field

- Add NFCWebhookAssociation schema with webhook_url, method, headers, body
- Add POST /api/nfc/webhook/test endpoint
- Add webhook_trigger_result Socket.IO event
- Update nfc_association_state event with webhook fields
- Add variable substitution support ({{tag_id}}, {{timestamp}}, etc.)
- Version to 2.0.0"
```

### 2. Push Branch
```bash
git push origin feature/webhook-associations-contracts
```

### 3. Create Pull Request
Create PR with title: "feat: Webhook support for NFC associations (v2.0.0)"

Include in PR description:
- Link to issue #1
- Summary of changes
- Migration guide link
- Breaking changes highlighted

### 4. Review & Merge
- Request review from team
- Ensure all CI checks pass
- Merge to main branch

### 5. Tag Release
```bash
git tag -a v2.0.0 -m "Release v2.0.0: Webhook associations"
git push origin v2.0.0
```

### 6. Publish Packages
```bash
npm publish  # If publishing to npm
# OR
# Push to internal package registry
```

---

## ✅ Completion Criteria

- [ ] All OpenAPI schemas updated
- [ ] All Socket.IO events updated
- [ ] Documentation complete (README, CHANGELOG, migration guide, variables doc)
- [ ] Version bumped to 2.0.0
- [ ] Client libraries generated successfully
- [ ] All validation tests pass
- [ ] PR created and reviewed
- [ ] Changes merged to main
- [ ] Release tagged (v2.0.0)
- [ ] Packages published (if applicable)

---

## 📞 Support

If you encounter issues:
1. Check the validation output
2. Review the examples in `docs/`
3. Ask in team chat
4. Create GitHub issue

---

**Document Version:** 1.0
**Last Updated:** 2025-01-27
