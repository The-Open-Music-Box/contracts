# NFC Webhook Associations - Master Implementation Plan

## 🎯 Project Overview

### Goal
Extend NFC tag associations to support HTTP webhooks as an alternative to playlist playback, enabling integration with external services (IFTTT, Zapier, home automation, custom APIs).

### Current State
- NFC tags can only be associated with playlists
- Scanning a tag triggers playlist playback
- Association data: `tag_id` → `playlist_id`

### Target State
- NFC tags can be associated with playlists OR webhooks
- Scanning a tag triggers playlist playback OR HTTP webhook
- Association data: `tag_id` → `(type: playlist|webhook, config: ...)`

### Impact
This is a **MAJOR architectural change** affecting:
- ✅ 4 repositories (contracts, rpi-firmware, esp32-firmware, flutter_app)
- ✅ 6 components (contracts, RPI backend, RPI frontend, ESP32, Flutter, database)
- ✅ Database schema (migration required)
- ✅ API contracts (breaking change → v2.0.0)

---

## 📊 Data Model

### Association Type Enum
```typescript
enum NFCAssociationType {
  PLAYLIST = "playlist",
  WEBHOOK = "webhook"
}
```

### NFCAssociation (Complete Schema)
```yaml
NFCAssociation:
  required:
    - tag_id
    - association_type
    - created_at

  properties:
    # Common fields
    tag_id: string                    # NFC tag UID (e.g., "04:A3:2C:1A:5D:6E:80")
    association_type: enum            # "playlist" | "webhook"
    created_at: datetime              # ISO 8601 timestamp

    # Playlist-specific (required if type=playlist, null if type=webhook)
    playlist_id: string | null
    playlist_title: string | null

    # Webhook-specific (required if type=webhook, null if type=playlist)
    webhook_url: string | null        # HTTP(S) URL
    webhook_method: enum | null       # "GET" | "POST" | "PUT" (default: "POST")
    webhook_headers: object | null    # { "Header-Name": "value" }
    webhook_body: string | null       # Request body template
    webhook_timeout_ms: int | null    # Timeout in ms (default: 5000)

    # Webhook metadata
    last_triggered_at: datetime | null
    trigger_count: int                # Number of times triggered (default: 0)
```

### Webhook Variable Substitution
Templates support the following variables:
- `{{tag_id}}` → NFC tag identifier (e.g., "04:A3:2C:1A:5D:6E:80")
- `{{timestamp}}` → ISO 8601 UTC timestamp (e.g., "2025-01-27T14:30:00Z")
- `{{device_id}}` → Device unique identifier
- `{{trigger_count}}` → Number of times this tag has been triggered

**Example:**
```json
{
  "webhook_url": "https://api.example.com/nfc/trigger",
  "webhook_method": "POST",
  "webhook_headers": {
    "Authorization": "Bearer abc123",
    "X-Device-ID": "{{device_id}}"
  },
  "webhook_body": "{\"tag_id\": \"{{tag_id}}\", \"timestamp\": \"{{timestamp}}\", \"count\": {{trigger_count}}}"
}
```

After substitution:
```json
{
  "tag_id": "04:A3:2C:1A:5D:6E:80",
  "timestamp": "2025-01-27T14:30:00Z",
  "count": 5
}
```

---

## 🗂️ Repository Structure

### GitHub Issues
| Repository | Issue | Branch |
|------------|-------|--------|
| contracts | [#1](https://github.com/The-Open-Music-Box/contracts/issues/1) | `feature/webhook-associations-contracts` |
| rpi-firmware (backend) | [#11](https://github.com/The-Open-Music-Box/raspberrypi-firmware/issues/11) | `feature/webhook-associations-backend` |
| rpi-firmware (frontend) | [#12](https://github.com/The-Open-Music-Box/raspberrypi-firmware/issues/12) | `feature/webhook-associations-frontend` |
| esp32-firmware | [#60](https://github.com/The-Open-Music-Box/eps32-firmware/issues/60) | `feature/webhook-associations-firmware` |
| flutter_app | [#30](https://github.com/The-Open-Music-Box/flutter-app/issues/30) | `feature/webhook-associations-mobile` |

### Implementation Documents
- `contracts/WEBHOOK_IMPLEMENTATION.md` - Contracts update guide
- `rpi-firmware/back/WEBHOOK_BACKEND_IMPLEMENTATION.md` - Backend guide
- `rpi-firmware/front/WEBHOOK_FRONTEND_IMPLEMENTATION.md` - Vue.js guide
- `esp32-firmware/WEBHOOK_FIRMWARE_IMPLEMENTATION.md` - Firmware guide
- `flutter_app/WEBHOOK_MOBILE_IMPLEMENTATION.md` - Flutter guide

---

## 🗓️ Implementation Timeline

### Phase 1: Contracts Update (Week 1)
**Repository:** `contracts`
**Branch:** `feature/webhook-associations-contracts`
**Owner:** Team Lead

**Tasks:**
- [ ] Update OpenAPI schema with discriminator pattern
- [ ] Add webhook-specific schemas
- [ ] Update POST /api/nfc/associate endpoint
- [ ] Add POST /api/nfc/webhook/test endpoint
- [ ] Update Socket.IO events (nfc_association_state, webhook_trigger_result)
- [ ] Version to v2.0.0 (breaking change)
- [ ] Generate client libraries
- [ ] Update documentation

**Deliverables:**
- OpenAPI spec v2.0.0
- Socket.IO contracts with webhook events
- Generated client libraries for Python, TypeScript, Dart, C++
- Migration guide from v1.x

---

### Phase 2: RPI Backend (Week 2-3)
**Repository:** `rpi-firmware/back`
**Branch:** `feature/webhook-associations-backend`
**Owner:** Backend Developer

**Tasks:**
- [ ] Update domain models (NfcTag, AssociationType, WebhookConfig)
- [ ] Implement WebhookTriggerService with httpx
- [ ] Implement variable substitution logic
- [ ] Update NfcAssociationService for webhook detection
- [ ] Create database migration
- [ ] Update API endpoints (associate, test)
- [ ] Add Socket.IO webhook events
- [ ] Write unit tests (>90% coverage)
- [ ] Write integration tests

**Dependencies:** Phase 1 (Contracts)

**Deliverables:**
- WebhookTriggerService implementation
- Database migration script
- Updated API endpoints
- Test suite with >90% coverage
- API documentation

---

### Phase 3: ESP32 Firmware (Week 2-3, parallel with Phase 2)
**Repository:** `esp32-firmware`
**Branch:** `feature/webhook-associations-firmware`
**Owner:** Firmware Developer

**Tasks:**
- [ ] Update NFCTag.hpp with WebhookConfig
- [ ] Implement WebhookTriggerService.hpp using HTTPClient
- [ ] Implement variable substitution
- [ ] Update NFCTagHandler for webhook detection
- [ ] Update SDCardNFCAssociationRepository persistence
- [ ] Add LED feedback (green blink)
- [ ] Memory optimization
- [ ] Write unit tests
- [ ] Hardware testing

**Dependencies:** Phase 1 (Contracts)

**Deliverables:**
- WebhookTriggerService implementation
- Updated NFCTagHandler
- Persistence layer updates
- Unit tests
- Hardware test results

---

### Phase 4: Flutter App (Week 3-4)
**Repository:** `flutter_app`
**Branch:** `feature/webhook-associations-mobile`
**Owner:** Mobile Developer

**Tasks:**
- [ ] Update domain entities (NFCAssociation, WebhookConfig)
- [ ] Add use cases (TestWebhook, AssociateWebhook)
- [ ] Update NFCRepository interface
- [ ] Create NFCAssociationTypePickerScreen
- [ ] Create WebhookAssociationScreen
- [ ] Update existing NFC screens
- [ ] Add Socket.IO event handling
- [ ] Write widget tests
- [ ] Write unit tests
- [ ] Update i18n translations

**Dependencies:** Phase 1 (Contracts), Phase 2 (Backend API)

**Deliverables:**
- Association type picker UI
- Webhook configuration UI
- Updated NFC screens
- Test suite
- i18n translations

---

### Phase 5: RPI Frontend (Week 3-4, parallel with Phase 4)
**Repository:** `rpi-firmware/front`
**Branch:** `feature/webhook-associations-frontend`
**Owner:** Frontend Developer

**Tasks:**
- [ ] Update nfcApi.ts service
- [ ] Create NfcAssociationTypeDialog.vue
- [ ] Create NfcWebhookAssociateDialog.vue
- [ ] Update NfcAssociateDialog.vue
- [ ] Update playlist list components
- [ ] Add Socket.IO event handlers
- [ ] Write component tests
- [ ] Write contract tests
- [ ] Update i18n translations (FR + EN)

**Dependencies:** Phase 1 (Contracts), Phase 2 (Backend API)

**Deliverables:**
- Association type dialog
- Webhook configuration dialog
- Updated components
- Test suite
- i18n translations (FR + EN)

---

### Phase 6: Testing & Integration (Week 5)
**All repositories**
**Owner:** QA Lead

**Tasks:**
- [ ] End-to-end: Create webhook via Flutter
- [ ] End-to-end: Create webhook via RPI web
- [ ] End-to-end: Trigger webhook via ESP32 scan
- [ ] End-to-end: Trigger webhook via RPI scan
- [ ] Verify LED feedback
- [ ] Test timeout scenarios
- [ ] Test error handling
- [ ] Test variable substitution
- [ ] Load testing (concurrent triggers)
- [ ] Security testing (URL validation)

**Deliverables:**
- E2E test results
- Performance test results
- Security audit report
- Bug fixes

---

### Phase 7: Documentation & Deployment (Week 6)
**All repositories**
**Owner:** Team Lead

**Tasks:**
- [ ] Update README files
- [ ] Create webhook integration guide
- [ ] Add webhook examples (IFTTT, Zapier)
- [ ] Update API documentation
- [ ] Create migration guide
- [ ] Record demo video
- [ ] Deploy to staging
- [ ] User acceptance testing
- [ ] Deploy to production
- [ ] Monitor metrics

**Deliverables:**
- Complete documentation
- Integration examples
- Demo video
- Production deployment
- Monitoring dashboards

---

## 🔄 Workflows

### Workflow 1: Create Webhook Association (Mobile)
```
1. User opens Flutter app
2. Navigates to NFC screen
3. Taps "New Association" button
4. Sees NFCAssociationTypePickerScreen
5. Selects "Webhook" option
6. Navigates to WebhookAssociationScreen
7. Fills form:
   - URL: https://api.example.com/webhook
   - Method: POST
   - Headers: { "Authorization": "Bearer token" }
   - Body: {"tag_id": "{{tag_id}}"}
8. Taps "Test Webhook" button
   → App sends POST /api/nfc/webhook/test
   → Backend validates and sends test request
   → Shows success/failure banner
9. Taps "Scan NFC Tag" button
   → App sends POST /api/nfc/scan
   → Backend starts NFC scan session
   → Shows "Waiting for tag" dialog
10. User scans physical NFC tag
    → Backend detects tag
    → Backend sends POST /api/nfc/associate with webhook config
    → Database stores association
    → Backend broadcasts nfc_association_state event
11. App shows success message
12. Association is complete
```

### Workflow 2: Trigger Webhook (ESP32)
```
1. ESP32 is idle, listening for NFC tags
2. User taps NFC tag to PN532 reader
3. PN532NFCAdapter detects tag UID
4. NFCTagHandler.onTagDetected() called
5. SDCardNFCAssociationRepository.findByTag() lookup
6. Association found with type=WEBHOOK
7. WebhookTriggerService.trigger() called:
   - Substitute variables in URL, headers, body
   - Build HTTPClient request
   - Send HTTP request with timeout
   - Measure response time
8. LED blinks green (same as playlist)
9. WebhookTriggerService returns result (success/failure, status code)
10. Result logged to Serial
11. (Optional) Broadcast webhook result via WiFi/MQTT
```

### Workflow 3: Trigger Webhook (RPI Backend)
```
1. RPI backend running, NFC reader active
2. User taps NFC tag to reader
3. PN532NFCHardware detects tag
4. NfcApplicationService.on_tag_detected() callback
5. NfcAssociationService.process_tag_detection() called
6. Lookup tag in database (DATABASE = SSOT)
7. Association found with type=WEBHOOK
8. WebhookTriggerService.trigger_webhook() called:
   - Build variable context (tag_id, timestamp, device_id, trigger_count)
   - Substitute variables in URL, headers, body
   - Send async HTTP request with httpx
   - Handle timeout (default 5s)
9. Update tag.last_triggered_at, tag.trigger_count
10. Broadcast webhook_trigger_result Socket.IO event to all clients
11. Flutter/Vue.js apps receive event and show notification
```

---

## 🗄️ Database Schema

### Migration: Add Webhook Support
**File:** `rpi-firmware/back/app/src/infrastructure/database/migrations/add_webhook_associations.py`

```sql
-- Add new columns
ALTER TABLE nfc_associations
  ADD COLUMN association_type VARCHAR(20),
  ADD COLUMN webhook_url VARCHAR(500),
  ADD COLUMN webhook_method VARCHAR(10),
  ADD COLUMN webhook_headers JSON,
  ADD COLUMN webhook_body TEXT,
  ADD COLUMN webhook_timeout_ms INTEGER,
  ADD COLUMN last_triggered_at TIMESTAMP,
  ADD COLUMN trigger_count INTEGER DEFAULT 0;

-- Migrate existing data (all are playlists)
UPDATE nfc_associations
SET association_type = 'playlist'
WHERE association_type IS NULL;

-- Make association_type non-nullable
ALTER TABLE nfc_associations
ALTER COLUMN association_type SET NOT NULL;

-- Add constraints
ALTER TABLE nfc_associations
ADD CONSTRAINT check_playlist_fields
CHECK (association_type != 'playlist' OR playlist_id IS NOT NULL);

ALTER TABLE nfc_associations
ADD CONSTRAINT check_webhook_fields
CHECK (association_type != 'webhook' OR webhook_url IS NOT NULL);
```

### Rollback Migration
```sql
-- Remove constraints
ALTER TABLE nfc_associations
DROP CONSTRAINT check_webhook_fields;

ALTER TABLE nfc_associations
DROP CONSTRAINT check_playlist_fields;

-- Remove columns
ALTER TABLE nfc_associations
DROP COLUMN trigger_count,
DROP COLUMN last_triggered_at,
DROP COLUMN webhook_timeout_ms,
DROP COLUMN webhook_body,
DROP COLUMN webhook_headers,
DROP COLUMN webhook_method,
DROP COLUMN webhook_url,
DROP COLUMN association_type;
```

---

## 🔌 API Contracts

### POST /api/nfc/associate (Updated)
**Request:**
```json
{
  "tag_id": "04:A3:2C:1A:5D:6E:80",
  "association_type": "webhook",
  "webhook_url": "https://api.example.com/webhook",
  "webhook_method": "POST",
  "webhook_headers": {
    "Authorization": "Bearer token123"
  },
  "webhook_body": "{\"tag_id\": \"{{tag_id}}\", \"timestamp\": \"{{timestamp}}\"}",
  "webhook_timeout_ms": 5000,
  "client_op_id": "uuid-1234"
}
```

**Response:**
```json
{
  "association": {
    "tag_id": "04:A3:2C:1A:5D:6E:80",
    "association_type": "webhook",
    "webhook_url": "https://api.example.com/webhook",
    "webhook_method": "POST",
    "webhook_headers": {
      "Authorization": "Bearer token123"
    },
    "webhook_body": "{\"tag_id\": \"{{tag_id}}\", \"timestamp\": \"{{timestamp}}\"}",
    "webhook_timeout_ms": 5000,
    "created_at": "2025-01-27T14:30:00Z",
    "trigger_count": 0,
    "last_triggered_at": null
  }
}
```

### POST /api/nfc/webhook/test (New)
**Request:**
```json
{
  "webhook_url": "https://api.example.com/webhook",
  "webhook_method": "POST",
  "webhook_headers": {
    "Authorization": "Bearer token123"
  },
  "webhook_body": "{\"test\": true}",
  "webhook_timeout_ms": 5000
}
```

**Response:**
```json
{
  "success": true,
  "status_code": 200,
  "response_time_ms": 234,
  "error": null
}
```

### Socket.IO Event: webhook_trigger_result (New)
**Direction:** Server → Client
**Payload:**
```json
{
  "tag_id": "04:A3:2C:1A:5D:6E:80",
  "webhook_url": "https://api.example.com/webhook",
  "success": true,
  "status_code": 200,
  "response_time_ms": 234,
  "error": null,
  "timestamp": "2025-01-27T14:30:00Z",
  "server_seq": 12345
}
```

---

## 🔐 Security Considerations

### URL Validation
- ✅ Only http:// and https:// protocols allowed
- ✅ Reject javascript:, file:, data: schemes
- ⚠️ Consider blocking local network access (127.0.0.1, localhost, 192.168.x.x)
- ⚠️ Consider URL whitelist/blacklist

### Timeout Enforcement
- ✅ Default: 5000ms (5 seconds)
- ✅ Minimum: 1000ms (1 second)
- ✅ Maximum: 30000ms (30 seconds)
- ✅ Prevent indefinite hangs

### Error Handling
- ✅ Do not expose sensitive webhook responses in logs
- ✅ Do not expose webhook body in UI (may contain secrets)
- ✅ Sanitize error messages before showing to user
- ✅ Log webhook triggers for security audit

### Rate Limiting (Optional)
- Consider rate limiting webhook triggers per tag
- Prevent abuse (e.g., rapid scanning)
- Example: Max 10 triggers per minute per tag

### Data Privacy
- ✅ Encrypt webhook configurations in database
- ✅ Do not log webhook bodies (may contain credentials)
- ✅ Add webhook trigger audit log

---

## 🧪 Testing Strategy

### Unit Tests
**Target Coverage:** >90%

**RPI Backend:**
- `test_webhook_trigger_service.py`:
  - Test successful GET/POST/PUT requests
  - Test variable substitution (all 4 variables)
  - Test timeout handling
  - Test HTTP error handling (4xx, 5xx)
  - Test network error handling
  - Test URL validation

- `test_nfc_association_service.py`:
  - Test webhook association creation
  - Test webhook trigger on tag detection
  - Test duplicate tag detection
  - Test override mode

**ESP32 Firmware:**
- `test_webhook_trigger_service.cpp`:
  - Test variable substitution
  - Test HTTP methods
  - Test timeout
  - Test error handling

**Flutter:**
- `webhook_config_test.dart`:
  - Test validation
  - Test serialization
- `test_webhook_test.dart`:
  - Test use case

**Vue.js:**
- `NfcWebhookAssociateDialog.spec.ts`:
  - Test form validation
  - Test header management
  - Test webhook testing

### Integration Tests
**End-to-End Scenarios:**

1. **Create Webhook via Flutter → Trigger via ESP32:**
   - Open Flutter app
   - Create webhook association
   - Scan tag with ESP32
   - Verify webhook triggered (check external service logs)

2. **Create Webhook via Vue.js → Trigger via RPI:**
   - Open RPI web interface
   - Create webhook association
   - Scan tag with RPI reader
   - Verify webhook triggered
   - Verify Socket.IO event received

3. **Test Webhook Validation:**
   - Try invalid URL (javascript:alert(1))
   - Try missing required fields
   - Try timeout exceeding max
   - Verify all rejected

### Performance Tests
- Measure webhook response time (target: <500ms for fast endpoints)
- Test concurrent webhook triggers (10+ simultaneous)
- Test memory usage on ESP32 with large webhook configs
- Measure database query performance with 1000+ associations

### Security Tests
- SQL injection in webhook URL
- XSS in webhook body
- SSRF via local URLs (127.0.0.1, etc.)
- URL validation bypass attempts
- Rate limiting effectiveness

---

## 📚 Example Use Cases

### Example 1: IFTTT Integration
**Scenario:** Scan NFC tag to trigger IFTTT applet (e.g., turn on smart lights)

**Configuration:**
```json
{
  "webhook_url": "https://maker.ifttt.com/trigger/nfc_scanned/with/key/YOUR_KEY",
  "webhook_method": "POST",
  "webhook_body": "{\"value1\": \"{{tag_id}}\", \"value2\": \"{{timestamp}}\"}"
}
```

### Example 2: Zapier Integration
**Scenario:** Scan NFC tag to create Google Calendar event

**Configuration:**
```json
{
  "webhook_url": "https://hooks.zapier.com/hooks/catch/12345/abcdef/",
  "webhook_method": "POST",
  "webhook_headers": {
    "Content-Type": "application/json"
  },
  "webhook_body": "{\"tag\": \"{{tag_id}}\", \"time\": \"{{timestamp}}\"}"
}
```

### Example 3: Home Assistant Integration
**Scenario:** Scan NFC tag to toggle home automation scene

**Configuration:**
```json
{
  "webhook_url": "http://homeassistant.local:8123/api/webhook/nfc_trigger",
  "webhook_method": "POST",
  "webhook_headers": {
    "Authorization": "Bearer YOUR_LONG_LIVED_TOKEN"
  },
  "webhook_body": "{\"tag_id\": \"{{tag_id}}\", \"device\": \"{{device_id}}\"}"
}
```

### Example 4: Custom API (Attendance Tracking)
**Scenario:** Scan NFC tag to log attendance

**Configuration:**
```json
{
  "webhook_url": "https://api.mycompany.com/attendance/checkin",
  "webhook_method": "POST",
  "webhook_headers": {
    "Authorization": "Bearer secret123",
    "X-Device-ID": "{{device_id}}"
  },
  "webhook_body": "{\"employee_id\": \"{{tag_id}}\", \"timestamp\": \"{{timestamp}}\", \"location\": \"office_entrance\"}"
}
```

---

## 🚀 Deployment Checklist

### Pre-deployment
- [ ] All tests passing (unit + integration + E2E)
- [ ] Code coverage >90%
- [ ] Security audit completed
- [ ] Documentation updated
- [ ] Migration scripts tested
- [ ] Rollback plan prepared

### Staging Deployment
- [ ] Deploy contracts v2.0.0
- [ ] Deploy RPI backend with migration
- [ ] Deploy RPI frontend
- [ ] Flash ESP32 firmware
- [ ] Deploy Flutter app to TestFlight/Play Store Beta
- [ ] Run smoke tests
- [ ] Run E2E tests on staging

### Production Deployment
- [ ] Database backup
- [ ] Deploy contracts v2.0.0
- [ ] Run database migration
- [ ] Deploy RPI backend
- [ ] Deploy RPI frontend
- [ ] Flash ESP32 firmware to production devices
- [ ] Deploy Flutter app to App Store/Play Store
- [ ] Monitor error rates
- [ ] Monitor webhook trigger success rates
- [ ] Verify backward compatibility (old clients still work)

### Post-deployment
- [ ] Monitor logs for errors
- [ ] Monitor webhook trigger metrics
- [ ] Monitor API response times
- [ ] Monitor database performance
- [ ] Gather user feedback
- [ ] Fix bugs as needed

---

## 📞 Support & Resources

### Documentation
- OpenAPI Spec: `contracts/schemas/openapi.yaml`
- Socket.IO Spec: `contracts/schemas/socketio_contracts.json`
- Database Schema: `rpi-firmware/back/app/src/infrastructure/database/`
- API Docs: Generated from OpenAPI spec

### External Resources
- IFTTT Webhooks: https://ifttt.com/maker_webhooks
- Zapier Webhooks: https://zapier.com/apps/webhook/integrations
- Home Assistant Webhooks: https://www.home-assistant.io/docs/automation/trigger/#webhook-trigger
- webhook.site: https://webhook.site (for testing)

### Contact
- GitHub Issues: See repository-specific issues above
- Team Lead: [Your Name]
- Backend Developer: [Name]
- Frontend Developer: [Name]
- Mobile Developer: [Name]
- Firmware Developer: [Name]

---

**Document Version:** 1.0
**Last Updated:** 2025-01-27
**Status:** Planning Complete - Ready for Implementation
