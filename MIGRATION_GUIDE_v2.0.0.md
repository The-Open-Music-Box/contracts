# Migration Guide: Contracts v1.x → v2.0.0

**Breaking Changes:** NFC Webhook Associations Feature
**Date:** 2025-01-27
**Affected Components:** All (Backend, Frontend, Firmware, Mobile)

---

## Table of Contents

1. [Overview](#overview)
2. [Breaking Changes Summary](#breaking-changes-summary)
3. [Client Migration Guide](#client-migration-guide)
4. [Backend Migration Guide](#backend-migration-guide)
5. [Database Migration](#database-migration)
6. [Testing Your Migration](#testing-your-migration)
7. [Rollback Procedures](#rollback-procedures)
8. [FAQ](#faq)

---

## Overview

Contracts v2.0.0 introduces **webhook support for NFC associations**, allowing NFC tags to trigger HTTP webhooks as an alternative to playlists. This is a **breaking change** because the `NFCAssociation` schema now requires an `association_type` field.

### What's New in v2.0.0

- ✅ **Webhook Associations**: NFC tags can trigger HTTP/HTTPS webhooks
- ✅ **Discriminator Pattern**: `NFCAssociation` uses `oneOf` with discriminator
- ✅ **Variable Substitution**: Template variables in webhook configs (`{{tag_id}}`, `{{timestamp}}`, etc.)
- ✅ **New Endpoint**: `POST /api/nfc/webhook/test` for testing webhooks
- ✅ **New Socket.IO Event**: `webhook_trigger_result` for real-time webhook results

### Why v2.0.0? (Major Version Bump)

This is a **breaking change** because:

1. **Required Field Added**: `association_type` is now required in all NFC association requests
2. **Schema Structure Changed**: NFCAssociation now uses discriminator pattern (`oneOf`)
3. **Validation Rules Changed**: Different required fields based on association type
4. **Socket.IO Event Modified**: `nfc_association_state` renamed field `existing_playlist` → `existing_association`

Old clients sending associations without `association_type` will receive `400 Bad Request`.

---

## Breaking Changes Summary

### 1. NFCAssociation Schema

**Before (v1.x):**
```yaml
NFCAssociation:
  type: object
  properties:
    tag_id: string
    playlist_id: string
    playlist_title: string
    created_at: string (date-time)
```

**After (v2.0.0):**
```yaml
NFCAssociationBase:
  type: object
  required: [tag_id, association_type, created_at]
  properties:
    tag_id: string
    association_type: enum [playlist, webhook]  # NEW - REQUIRED
    created_at: string (date-time)
  discriminator:
    propertyName: association_type
    mapping:
      playlist: '#/components/schemas/NFCPlaylistAssociation'
      webhook: '#/components/schemas/NFCWebhookAssociation'

NFCPlaylistAssociation:
  allOf:
    - $ref: '#/components/schemas/NFCAssociationBase'
    - properties:
        playlist_id: string (required)
        playlist_title: string

NFCWebhookAssociation:
  allOf:
    - $ref: '#/components/schemas/NFCAssociationBase'
    - properties:
        webhook_url: string (required)
        webhook_method: enum [GET, POST, PUT]
        webhook_headers: object
        webhook_body: string
        webhook_timeout_ms: integer
        last_triggered_at: string (date-time, nullable)
        trigger_count: integer
```

### 2. POST /api/nfc/associate Endpoint

**Before (v1.x):**
```json
POST /api/nfc/associate
{
  "tag_id": "04:A3:2C:1A:5D:6E:80",
  "playlist_id": "playlist-123"
}
```

**After (v2.0.0):**

**Playlist Association:**
```json
POST /api/nfc/associate
{
  "tag_id": "04:A3:2C:1A:5D:6E:80",
  "association_type": "playlist",  // REQUIRED
  "playlist_id": "playlist-123"
}
```

**Webhook Association (NEW):**
```json
POST /api/nfc/associate
{
  "tag_id": "04:A3:2C:1A:5D:6E:80",
  "association_type": "webhook",  // REQUIRED
  "webhook_url": "https://api.example.com/webhook",
  "webhook_method": "POST",
  "webhook_headers": {
    "Authorization": "Bearer token123",
    "Content-Type": "application/json"
  },
  "webhook_body": "{\"tag_id\": \"{{tag_id}}\", \"timestamp\": \"{{timestamp}}\"}",
  "webhook_timeout_ms": 5000
}
```

### 3. Socket.IO Event: nfc_association_state

**Before (v1.x):**
```json
{
  "state": "success",
  "tag_id": "04:A3:2C:1A",
  "existing_playlist": {
    "playlist_id": "playlist-123",
    "playlist_title": "My Playlist"
  }
}
```

**After (v2.0.0):**
```json
{
  "state": "success",  // NEW: Can also be "webhook_triggered"
  "tag_id": "04:A3:2C:1A",
  "association_type": "playlist",  // NEW
  "existing_association": {  // RENAMED from existing_playlist
    "type": "playlist",
    "playlist_id": "playlist-123",
    "playlist_title": "My Playlist"
  }
}
```

**For webhook associations:**
```json
{
  "state": "webhook_triggered",
  "tag_id": "04:A3:2C:1A",
  "association_type": "webhook",
  "webhook_url": "https://api.example.com/webhook",
  "webhook_response": {
    "status_code": 200,
    "success": true,
    "error": null
  },
  "existing_association": {
    "type": "webhook",
    "webhook_url": "https://api.example.com/webhook"
  }
}
```

### 4. New Socket.IO Event: webhook_trigger_result

**New in v2.0.0:**
```json
{
  "tag_id": "04:A3:2C:1A",
  "webhook_url": "https://api.example.com/webhook",
  "success": true,
  "status_code": 200,
  "response_time_ms": 342,
  "error": null,
  "timestamp": "2025-01-27T14:30:00Z",
  "server_seq": 12345
}
```

---

## Client Migration Guide

### Step 1: Update Contracts Submodule

```bash
cd your-project
git submodule update --remote contracts
# Should now be at contracts v2.0.0
```

### Step 2: Regenerate Client Libraries

**For Python Backend:**
```bash
cd contracts
npm run generate:python
# Generated files in: generated/python/
```

**For TypeScript/Vue.js Frontend:**
```bash
cd contracts
npm run generate:typescript
# Generated files in: generated/typescript/api-types.ts
```

**For Dart/Flutter:**
```bash
cd contracts
npm run generate:dart
# Generated files in: generated/dart/
```

**For C++/ESP32:**
```bash
cd contracts
npm run generate:cpp
# Generated files in: generated/cpp/
```

### Step 3: Update Your Code

#### TypeScript/JavaScript (Vue.js Frontend)

**Before (v1.x):**
```typescript
// Old code
async function associateNFCTag(tagId: string, playlistId: string) {
  await api.post('/api/nfc/associate', {
    tag_id: tagId,
    playlist_id: playlistId
  });
}

// Socket.IO handler
socket.on('nfc_association_state', (event) => {
  if (event.existing_playlist) {
    console.log('Existing playlist:', event.existing_playlist.playlist_title);
  }
});
```

**After (v2.0.0):**
```typescript
// New code - Playlist association
async function associateNFCTagWithPlaylist(tagId: string, playlistId: string) {
  await api.post('/api/nfc/associate', {
    tag_id: tagId,
    association_type: 'playlist',  // REQUIRED
    playlist_id: playlistId
  });
}

// New code - Webhook association
async function associateNFCTagWithWebhook(
  tagId: string,
  webhookUrl: string,
  options?: {
    method?: 'GET' | 'POST' | 'PUT',
    headers?: Record<string, string>,
    body?: string,
    timeout_ms?: number
  }
) {
  await api.post('/api/nfc/associate', {
    tag_id: tagId,
    association_type: 'webhook',  // REQUIRED
    webhook_url: webhookUrl,
    webhook_method: options?.method || 'POST',
    webhook_headers: options?.headers,
    webhook_body: options?.body,
    webhook_timeout_ms: options?.timeout_ms || 5000
  });
}

// Updated Socket.IO handler
socket.on('nfc_association_state', (event) => {
  if (event.existing_association) {  // RENAMED
    if (event.association_type === 'playlist') {
      console.log('Existing playlist:', event.existing_association.playlist_id);
    } else if (event.association_type === 'webhook') {
      console.log('Existing webhook:', event.existing_association.webhook_url);
    }
  }

  if (event.state === 'webhook_triggered') {  // NEW STATE
    console.log('Webhook triggered:', event.webhook_response);
  }
});

// New Socket.IO event for webhook results
socket.on('webhook_trigger_result', (result) => {
  console.log(`Webhook ${result.success ? 'succeeded' : 'failed'}`);
  console.log(`Status: ${result.status_code}`);
  console.log(`Response time: ${result.response_time_ms}ms`);
  if (result.error) {
    console.error('Error:', result.error);
  }
});
```

#### Python (Backend)

**Before (v1.x):**
```python
from dataclasses import dataclass

@dataclass
class NFCAssociation:
    tag_id: str
    playlist_id: str
    playlist_title: str
    created_at: datetime

async def associate_nfc_tag(tag_id: str, playlist_id: str):
    association = NFCAssociation(
        tag_id=tag_id,
        playlist_id=playlist_id,
        playlist_title="...",
        created_at=datetime.now()
    )
    # Save to database
```

**After (v2.0.0):**
```python
from dataclasses import dataclass
from typing import Literal, Optional
from enum import Enum

class AssociationType(str, Enum):
    PLAYLIST = "playlist"
    WEBHOOK = "webhook"

@dataclass
class WebhookConfig:
    url: str
    method: Literal["GET", "POST", "PUT"] = "POST"
    headers: Optional[dict[str, str]] = None
    body: Optional[str] = None
    timeout_ms: int = 5000
    last_triggered_at: Optional[datetime] = None
    trigger_count: int = 0

@dataclass
class NFCAssociation:
    tag_id: str
    association_type: AssociationType  # NEW - REQUIRED
    created_at: datetime

    # Playlist fields (required if type=playlist)
    playlist_id: Optional[str] = None
    playlist_title: Optional[str] = None

    # Webhook fields (required if type=webhook)
    webhook_config: Optional[WebhookConfig] = None

async def associate_nfc_tag_with_playlist(tag_id: str, playlist_id: str):
    association = NFCAssociation(
        tag_id=tag_id,
        association_type=AssociationType.PLAYLIST,  # REQUIRED
        playlist_id=playlist_id,
        playlist_title="...",
        created_at=datetime.now()
    )
    # Save to database

async def associate_nfc_tag_with_webhook(
    tag_id: str,
    webhook_url: str,
    method: str = "POST",
    headers: Optional[dict] = None,
    body: Optional[str] = None
):
    webhook_config = WebhookConfig(
        url=webhook_url,
        method=method,
        headers=headers,
        body=body
    )

    association = NFCAssociation(
        tag_id=tag_id,
        association_type=AssociationType.WEBHOOK,  # REQUIRED
        webhook_config=webhook_config,
        created_at=datetime.now()
    )
    # Save to database
```

#### Dart/Flutter

**Before (v1.x):**
```dart
class NFCAssociation {
  final String tagId;
  final String playlistId;
  final String playlistTitle;
  final DateTime createdAt;
}

Future<void> associateNFCTag(String tagId, String playlistId) async {
  await api.post('/api/nfc/associate', {
    'tag_id': tagId,
    'playlist_id': playlistId,
  });
}
```

**After (v2.0.0):**
```dart
enum AssociationType { playlist, webhook }

class WebhookConfig {
  final String url;
  final String method;
  final Map<String, String>? headers;
  final String? body;
  final int timeoutMs;
  final DateTime? lastTriggeredAt;
  final int triggerCount;
}

abstract class NFCAssociation {
  final String tagId;
  final AssociationType associationType;  // NEW - REQUIRED
  final DateTime createdAt;
}

class NFCPlaylistAssociation extends NFCAssociation {
  final String playlistId;
  final String? playlistTitle;
}

class NFCWebhookAssociation extends NFCAssociation {
  final WebhookConfig webhookConfig;
}

Future<void> associateNFCTagWithPlaylist(String tagId, String playlistId) async {
  await api.post('/api/nfc/associate', {
    'tag_id': tagId,
    'association_type': 'playlist',  // REQUIRED
    'playlist_id': playlistId,
  });
}

Future<void> associateNFCTagWithWebhook(
  String tagId,
  String webhookUrl, {
  String method = 'POST',
  Map<String, String>? headers,
  String? body,
}) async {
  await api.post('/api/nfc/associate', {
    'tag_id': tagId,
    'association_type': 'webhook',  // REQUIRED
    'webhook_url': webhookUrl,
    'webhook_method': method,
    if (headers != null) 'webhook_headers': headers,
    if (body != null) 'webhook_body': body,
  });
}
```

---

## Backend Migration Guide

### Step 1: Update Domain Models

Add `association_type` field to your NFC association entity:

```python
# Before
class NFCAssociation:
    tag_id: str
    playlist_id: str
    created_at: datetime

# After
class NFCAssociation:
    tag_id: str
    association_type: Literal["playlist", "webhook"]  # NEW
    created_at: datetime

    # Playlist fields
    playlist_id: Optional[str] = None

    # Webhook fields
    webhook_url: Optional[str] = None
    webhook_method: Optional[str] = None
    webhook_headers: Optional[dict] = None
    webhook_body: Optional[str] = None
    webhook_timeout_ms: Optional[int] = None
    last_triggered_at: Optional[datetime] = None
    trigger_count: int = 0
```

### Step 2: Update API Endpoints

**Add Backward Compatibility:**

```python
@router.post("/associate")
async def associate_nfc_tag(request: NFCAssociateRequest):
    # BACKWARD COMPATIBILITY: Infer type if not provided (v1.x clients)
    if not request.association_type:
        request.association_type = "playlist"  # Default to v1 behavior

    # Validation
    if request.association_type == "playlist":
        if not request.playlist_id:
            raise HTTPException(400, "playlist_id required for playlist associations")
    elif request.association_type == "webhook":
        if not request.webhook_url:
            raise HTTPException(400, "webhook_url required for webhook associations")

    # Create association
    association = await nfc_service.create_association(request)
    return {"success": True, "data": {"association": association}}
```

### Step 3: Implement Webhook Trigger Service

```python
import httpx
from datetime import datetime

class WebhookTriggerService:
    def __init__(self):
        self.http_client = httpx.AsyncClient(timeout=30.0)

    async def trigger_webhook(
        self,
        association: NFCAssociation,
        device_id: str
    ) -> dict:
        """Trigger webhook with variable substitution"""

        # Substitute variables
        url = self._substitute_variables(
            association.webhook_url,
            tag_id=association.tag_id,
            device_id=device_id,
            timestamp=datetime.utcnow().isoformat(),
            trigger_count=association.trigger_count
        )

        headers = {}
        if association.webhook_headers:
            for key, value in association.webhook_headers.items():
                headers[key] = self._substitute_variables(
                    value,
                    tag_id=association.tag_id,
                    device_id=device_id,
                    timestamp=datetime.utcnow().isoformat(),
                    trigger_count=association.trigger_count
                )

        body = None
        if association.webhook_body:
            body = self._substitute_variables(
                association.webhook_body,
                tag_id=association.tag_id,
                device_id=device_id,
                timestamp=datetime.utcnow().isoformat(),
                trigger_count=association.trigger_count
            )

        # Trigger webhook
        start_time = datetime.now()
        try:
            response = await self.http_client.request(
                method=association.webhook_method or "POST",
                url=url,
                headers=headers,
                content=body,
                timeout=association.webhook_timeout_ms / 1000.0
            )

            response_time_ms = int((datetime.now() - start_time).total_seconds() * 1000)

            return {
                "success": True,
                "status_code": response.status_code,
                "response_time_ms": response_time_ms,
                "error": None
            }
        except Exception as e:
            response_time_ms = int((datetime.now() - start_time).total_seconds() * 1000)
            return {
                "success": False,
                "status_code": None,
                "response_time_ms": response_time_ms,
                "error": str(e)
            }

    def _substitute_variables(self, template: str, **kwargs) -> str:
        """Replace {{variable}} with actual values"""
        result = template
        for key, value in kwargs.items():
            result = result.replace(f"{{{{{key}}}}}", str(value))
        return result
```

### Step 4: Update NFC Tag Scan Handler

```python
async def handle_nfc_tag_scan(tag_id: str):
    # Get association
    association = await nfc_repo.get_association(tag_id)

    if not association:
        return {"error": "No association found"}

    if association.association_type == "playlist":
        # Existing behavior - trigger playlist playback
        await player_service.start_playlist(association.playlist_id)
        return {"success": True, "type": "playlist"}

    elif association.association_type == "webhook":
        # NEW - trigger webhook
        result = await webhook_service.trigger_webhook(association, device_id)

        # Update trigger metadata
        association.last_triggered_at = datetime.now()
        association.trigger_count += 1
        await nfc_repo.update_association(association)

        # Emit Socket.IO event
        await socketio.emit('webhook_trigger_result', {
            "tag_id": tag_id,
            "webhook_url": association.webhook_url,
            "success": result["success"],
            "status_code": result["status_code"],
            "response_time_ms": result["response_time_ms"],
            "error": result["error"],
            "timestamp": datetime.utcnow().isoformat(),
            "server_seq": get_server_seq()
        })

        return {"success": True, "type": "webhook", "result": result}
```

---

## Database Migration

### Step 1: Create Migration Script

**Alembic migration (Python example):**

```python
"""Add webhook support to nfc_associations

Revision ID: add_webhook_associations
Revises: previous_revision
Create Date: 2025-01-27

"""
from alembic import op
import sqlalchemy as sa

def upgrade():
    # Add new columns
    op.add_column('nfc_associations', sa.Column('association_type', sa.String(20), nullable=True))
    op.add_column('nfc_associations', sa.Column('webhook_url', sa.String(500), nullable=True))
    op.add_column('nfc_associations', sa.Column('webhook_method', sa.String(10), nullable=True))
    op.add_column('nfc_associations', sa.Column('webhook_headers', sa.JSON, nullable=True))
    op.add_column('nfc_associations', sa.Column('webhook_body', sa.Text, nullable=True))
    op.add_column('nfc_associations', sa.Column('webhook_timeout_ms', sa.Integer, nullable=True))
    op.add_column('nfc_associations', sa.Column('last_triggered_at', sa.DateTime, nullable=True))
    op.add_column('nfc_associations', sa.Column('trigger_count', sa.Integer, nullable=True))

    # Migrate existing data: all existing associations are playlists
    op.execute("UPDATE nfc_associations SET association_type = 'playlist' WHERE association_type IS NULL")
    op.execute("UPDATE nfc_associations SET trigger_count = 0 WHERE trigger_count IS NULL")

    # Make association_type non-nullable
    op.alter_column('nfc_associations', 'association_type', nullable=False)

    # Add check constraint
    op.create_check_constraint(
        'check_association_type',
        'nfc_associations',
        "association_type IN ('playlist', 'webhook')"
    )

    # Add conditional constraints
    # If type=playlist, playlist_id must be non-null
    # If type=webhook, webhook_url must be non-null
    op.create_check_constraint(
        'check_playlist_fields',
        'nfc_associations',
        "(association_type = 'playlist' AND playlist_id IS NOT NULL) OR association_type != 'playlist'"
    )
    op.create_check_constraint(
        'check_webhook_fields',
        'nfc_associations',
        "(association_type = 'webhook' AND webhook_url IS NOT NULL) OR association_type != 'webhook'"
    )

def downgrade():
    # Drop constraints
    op.drop_constraint('check_webhook_fields', 'nfc_associations')
    op.drop_constraint('check_playlist_fields', 'nfc_associations')
    op.drop_constraint('check_association_type', 'nfc_associations')

    # Drop columns (playlist data preserved)
    op.drop_column('nfc_associations', 'trigger_count')
    op.drop_column('nfc_associations', 'last_triggered_at')
    op.drop_column('nfc_associations', 'webhook_timeout_ms')
    op.drop_column('nfc_associations', 'webhook_body')
    op.drop_column('nfc_associations', 'webhook_headers')
    op.drop_column('nfc_associations', 'webhook_method')
    op.drop_column('nfc_associations', 'webhook_url')
    op.drop_column('nfc_associations', 'association_type')
```

### Step 2: Test Migration on Dev Database

```bash
# Backup dev database first
pg_dump mydb > backup_dev_$(date +%Y%m%d).sql

# Run migration
alembic upgrade head

# Verify migration
psql mydb -c "SELECT association_type, COUNT(*) FROM nfc_associations GROUP BY association_type;"
# Expected: All existing = 'playlist'

# Test rollback
alembic downgrade -1

# Verify rollback
psql mydb -c "\d nfc_associations"
# Expected: No webhook columns

# Re-upgrade
alembic upgrade head
```

### Step 3: Execute on Production

```bash
# During deployment (Day 27, Week 6)
# 1. Backup production database
pg_dump openmusicbox_prod > backup_prod_$(date +%Y%m%d_%H%M%S).sql

# 2. Run migration
alembic upgrade head

# 3. Verify
psql openmusicbox_prod -c "SELECT association_type, COUNT(*) FROM nfc_associations GROUP BY association_type;"
```

---

## Testing Your Migration

### Validation Checklist

After migrating, verify:

- [ ] Contracts v2.0.0 submodule updated
- [ ] Client libraries regenerated successfully
- [ ] Code compiles without errors
- [ ] Existing playlist associations still work
- [ ] Can create new playlist associations with `association_type: "playlist"`
- [ ] Can create new webhook associations with `association_type: "webhook"`
- [ ] Socket.IO events use `existing_association` (not `existing_playlist`)
- [ ] Webhook trigger service works correctly
- [ ] Variable substitution produces correct values
- [ ] Database migration completed successfully
- [ ] All unit tests pass
- [ ] All integration tests pass

### Test Scenarios

**Scenario 1: Existing Playlist Association**
```bash
# Should still work after migration
curl -X POST http://localhost:8080/api/nfc/associate \
  -H "Content-Type: application/json" \
  -d '{
    "tag_id": "04:A3:2C:1A",
    "association_type": "playlist",
    "playlist_id": "playlist-123"
  }'
```

**Scenario 2: New Webhook Association**
```bash
# Should work with new schema
curl -X POST http://localhost:8080/api/nfc/associate \
  -H "Content-Type: application/json" \
  -d '{
    "tag_id": "04:B4:3D:2B",
    "association_type": "webhook",
    "webhook_url": "https://webhook.site/unique-id",
    "webhook_method": "POST",
    "webhook_body": "{\"tag_id\": \"{{tag_id}}\", \"timestamp\": \"{{timestamp}}\"}"
  }'
```

**Scenario 3: Test Webhook**
```bash
# Test webhook configuration
curl -X POST http://localhost:8080/api/nfc/webhook/test \
  -H "Content-Type: application/json" \
  -d '{
    "webhook_url": "https://webhook.site/unique-id",
    "webhook_method": "POST"
  }'
```

---

## Rollback Procedures

### If Contract Changes Don't Compile

```bash
# Revert to v1.x contracts
cd your-project
git submodule update contracts
git checkout contracts@v1.5.0  # or whatever your last stable version was
npm run generate  # Regenerate old clients
```

### If Database Migration Fails

**Option A: Rollback Migration**
```bash
alembic downgrade -1
# All playlist data preserved, webhook data lost
```

**Option B: Restore from Backup**
```bash
# Stop backend
systemctl stop openmusicbox-backend

# Restore database
psql openmusicbox_db < backup_prod_20250127_093000.sql

# Deploy old backend version
git checkout v0.8.0
systemctl start openmusicbox-backend
```

### If Production Issues Occur

**Severity 1 (Critical - Playlists Broken):**
1. Immediately rollback database migration
2. Deploy previous backend version
3. Notify all teams
4. Investigate root cause

**Severity 2 (High - Webhooks Not Working):**
1. Existing playlists should still work
2. Disable webhook creation in UI
3. Fix webhook service
4. Re-enable after fix

---

## FAQ

### Q: Do I need to migrate all clients at once?

**A:** No. Backend v1.0.0 is backward compatible. Old clients (v0.x) will continue to work with playlists during the transition period. The backend will infer `association_type: "playlist"` if not provided.

### Q: What happens to existing NFC associations?

**A:** All existing associations are automatically migrated to `association_type: "playlist"` during the database migration. They will continue to work exactly as before.

### Q: Can I mix v1.x and v2.0.0 clients?

**A:** Yes, temporarily. Backend v1.0.0 accepts both formats:
- v1.x clients: Send without `association_type` (defaults to playlist)
- v2.0.0 clients: Send with `association_type` (playlist or webhook)

### Q: How do I test variable substitution?

**A:** Use the webhook test endpoint:
```bash
curl -X POST http://localhost:8080/api/nfc/webhook/test \
  -d '{"webhook_url": "https://webhook.site/{{tag_id}}"}'
# Variable will be replaced with test values
```

### Q: What if a webhook times out?

**A:** The timeout is configurable (1-30 seconds, default 5 seconds). If a webhook times out:
- Error is logged
- `webhook_trigger_result` event emitted with `success: false, error: "timeout"`
- NFC association remains valid

### Q: Can I change a playlist association to a webhook?

**A:** Yes. Delete the old association and create a new one with different type:
```bash
DELETE /api/nfc/{tag_id}
POST /api/nfc/associate
{
  "tag_id": "...",
  "association_type": "webhook",
  "webhook_url": "..."
}
```

### Q: Are webhooks triggered synchronously or asynchronously?

**A:** In v1.0.0, webhooks are triggered **synchronously** (blocking). The NFC scan handler waits for the webhook to complete before returning. Future versions may add async execution.

### Q: How do I monitor webhook success rates?

**A:** Listen to the `webhook_trigger_result` Socket.IO event:
```typescript
socket.on('webhook_trigger_result', (result) => {
  console.log(`Success: ${result.success}, Status: ${result.status_code}`);
  // Log to monitoring system
});
```

---

## Additional Resources

- **Master Plan**: `PROJECT_COORDINATION_MASTER_PLAN.md`
- **Architecture Details**: `WEBHOOK_ASSOCIATIONS_MASTER_PLAN.md`
- **Implementation Guides**:
  - Contracts: `WEBHOOK_IMPLEMENTATION.md`
  - Backend: `rpi-firmware/back/WEBHOOK_BACKEND_IMPLEMENTATION.md`
  - Frontend: `rpi-firmware/front/WEBHOOK_FRONTEND_IMPLEMENTATION.md`
  - Firmware: `esp32-firmware/WEBHOOK_FIRMWARE_IMPLEMENTATION.md`
  - Mobile: `flutter_app/WEBHOOK_MOBILE_IMPLEMENTATION.md`

---

**Document Version:** 1.0
**Last Updated:** 2025-01-27
**Maintained By:** Contracts Team
**For Support:** Open an issue in the contracts repository
