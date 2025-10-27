# Project Coordination Master Plan - NFC Webhook Associations

**Feature:** NFC Webhook Associations (Playlist OR Webhook triggers)
**Version Migration:** v0 (current) → v1 (with webhooks)
**Timeline:** 6 weeks
**Team Coordination:** Critical - All apps must remain aligned

---

## 🎯 Executive Summary

This master plan coordinates the implementation of NFC webhook associations across **5 repositories** and **6 components**, ensuring all applications remain synchronized and deployable at every stage.

**Critical Success Factors:**
1. ✅ **Contract-First Development** - All changes start with contracts
2. ✅ **Version Synchronization** - All components use same contract version
3. ✅ **Database Migration** - Clean upgrade path from v0 to v1
4. ✅ **Backward Compatibility** - Old clients continue working during rollout
5. ✅ **Atomic Deployment** - All or nothing deployment strategy

---

## 📊 Current State (Version 0)

### V0 Architecture
```
NFC Tag Scan → Playlist Lookup → Playback Trigger
              (Database: tag_id → playlist_id)
```

### V0 Data Model
```sql
nfc_associations:
  - tag_id (PK)
  - playlist_id (FK)
  - playlist_title
  - created_at
```

### V0 API Contract
```
POST /api/nfc/associate
{
  "tag_id": "04:A3:2C:1A",
  "playlist_id": "playlist-123"
}
```

### V0 Deployed Components
- ✅ RPI Backend (v0.x)
- ✅ RPI Frontend (v0.x)
- ✅ ESP32 Firmware (v0.x)
- ✅ Flutter App (v0.x)
- ✅ Contracts (v1.x)

---

## 🎯 Target State (Version 1)

### V1 Architecture
```
NFC Tag Scan → Association Lookup → Playlist Playback
                                    OR
                                  → Webhook Trigger (NEW)
              (Database: tag_id → {type, config})
```

### V1 Data Model
```sql
nfc_associations:
  - tag_id (PK)
  - association_type (NEW: 'playlist' | 'webhook')
  - playlist_id (nullable)
  - playlist_title (nullable)
  - webhook_url (NEW, nullable)
  - webhook_method (NEW, nullable)
  - webhook_headers (NEW, nullable)
  - webhook_body (NEW, nullable)
  - webhook_timeout_ms (NEW, nullable)
  - last_triggered_at (NEW, nullable)
  - trigger_count (NEW, default: 0)
  - created_at
```

### V1 API Contract
```
POST /api/nfc/associate
{
  "tag_id": "04:A3:2C:1A",
  "association_type": "playlist" | "webhook",

  // Playlist fields (required if type=playlist)
  "playlist_id": "playlist-123",

  // Webhook fields (required if type=webhook)
  "webhook_url": "https://api.example.com/webhook",
  "webhook_method": "POST",
  "webhook_body": "{\"tag_id\": \"{{tag_id}}\"}"
}
```

### V1 Target Components
- 🎯 RPI Backend (v1.0.0) - Webhook trigger service
- 🎯 RPI Frontend (v1.0.0) - Webhook configuration UI
- 🎯 ESP32 Firmware (v1.0.0) - Webhook HTTP client
- 🎯 Flutter App (v1.0.0) - Webhook association screens
- 🎯 Contracts (v2.0.0) - Breaking change: discriminator pattern

---

## 📋 Version Strategy

### Contract Versioning (Semantic Versioning)

**Current:** `v1.x.x` (playlist-only)
**Target:** `v2.0.0` (playlist + webhook)

**Why v2.0.0?**
- ✅ Breaking change: `association_type` field now required
- ✅ Schema structure change (discriminator pattern)
- ✅ New required validation rules

### Application Versioning

| Component | Current | Target | Breaking? |
|-----------|---------|--------|-----------|
| Contracts | v1.5.0 | **v2.0.0** | ✅ Yes |
| RPI Backend | v0.8.0 | **v1.0.0** | ✅ Yes (DB schema) |
| RPI Frontend | v0.8.0 | **v1.0.0** | ❌ No (additive UI) |
| ESP32 Firmware | v0.5.0 | **v1.0.0** | ✅ Yes (memory layout) |
| Flutter App | v0.3.0 | **v1.0.0** | ❌ No (additive UI) |

### Database Schema Versioning

**Current Schema Version:** `v0` (implicit)
**Target Schema Version:** `v1`

**Migration Path:**
```
v0 (current) → v1 (add webhook columns + migrate existing data)
```

**Rollback Path:**
```
v1 → v0 (drop webhook columns, no data loss for playlists)
```

---

## 🗓️ 6-Week Coordinated Timeline

### Week 1: Foundation (Contracts)
**Goal:** Establish v2.0.0 contracts as foundation

**Monday-Tuesday (Days 1-2):**
- [ ] Contracts team: Update OpenAPI schemas
- [ ] Contracts team: Update Socket.IO contracts
- [ ] Contracts team: Add variable substitution docs

**Wednesday (Day 3):**
- [ ] Contracts team: Version to v2.0.0
- [ ] Contracts team: Generate client libraries (Python, TypeScript, Dart, C++)
- [ ] All teams: Review generated clients

**Thursday (Day 4):**
- [ ] Contracts team: Run validation tests
- [ ] Contracts team: Create migration guide
- [ ] All teams: Read and approve contracts v2.0.0

**Friday (Day 5):**
- [ ] **GATE 1:** Contracts v2.0.0 approved and published
- [ ] All teams: Update submodules to contracts v2.0.0
- [ ] All teams: Verify compilation with new contracts

**Deliverables:**
- ✅ Contracts v2.0.0 published
- ✅ Generated client libraries available
- ✅ All teams have updated submodules

**Blockers:**
- ❌ Contract validation fails → Fix and retry
- ❌ Generated clients don't compile → Fix generator

---

### Week 2: Backend Foundation

**Goal:** Implement backend webhook service and database migration

**Monday-Tuesday (Days 6-7):**
- [ ] Backend team: Update domain models (NfcTag, WebhookConfig)
- [ ] Backend team: Implement WebhookTriggerService
- [ ] Backend team: Write unit tests for webhook service (>90% coverage)

**Wednesday (Day 8):**
- [ ] Backend team: Create database migration script
- [ ] Backend team: Test migration on dev database
- [ ] Backend team: Test rollback on dev database

**Thursday (Day 9):**
- [ ] Backend team: Update NfcAssociationService
- [ ] Backend team: Update API endpoints
- [ ] Backend team: Add Socket.IO webhook events

**Friday (Day 10):**
- [ ] Backend team: Integration tests
- [ ] Backend team: API endpoint tests
- [ ] **GATE 2:** Backend tests passing (>90% coverage)

**Deliverables:**
- ✅ WebhookTriggerService implemented
- ✅ Database migration tested (up + down)
- ✅ API endpoints updated and tested
- ✅ All tests passing

**Synchronization Point:**
- 🔄 Backend API must match contracts v2.0.0 exactly
- 🔄 Database migration ready for staging deployment

---

### Week 3: Firmware + Backend Completion

**Goal:** Complete backend and implement ESP32 webhook support

**Backend Team (Days 11-14):**
- [ ] Monday: Bug fixes from testing
- [ ] Tuesday: Performance optimization
- [ ] Wednesday: Security audit (URL validation, timeouts)
- [ ] Thursday: Documentation updates
- [ ] Friday: **GATE 3:** Backend ready for staging

**Firmware Team (Days 11-15):**
- [ ] Monday-Tuesday: Update NFCTag.hpp with WebhookConfig
- [ ] Tuesday-Wednesday: Implement WebhookTriggerService
- [ ] Wednesday-Thursday: Update NFCTagHandler
- [ ] Thursday: Update SD card persistence
- [ ] Friday: Unit tests and memory checks

**Deliverables:**
- ✅ Backend ready for deployment
- ✅ ESP32 firmware implements webhook triggers
- ✅ Memory usage acceptable (<50% heap)

**Synchronization Point:**
- 🔄 Firmware webhook format matches backend exactly
- 🔄 Variable substitution works identically

---

### Week 4: Frontend Implementation (Parallel)

**Goal:** Implement UI for webhook configuration in both apps

**Mobile Team (Flutter) - Days 16-20:**
- [ ] Monday: Update domain entities
- [ ] Tuesday: Create NFCAssociationTypePickerScreen
- [ ] Wednesday: Create WebhookAssociationScreen
- [ ] Thursday: Update existing NFC screens
- [ ] Friday: Widget tests + i18n

**Web Team (Vue.js) - Days 16-20:**
- [ ] Monday: Update nfcApi service
- [ ] Tuesday: Create NfcAssociationTypeDialog
- [ ] Wednesday: Create NfcWebhookAssociateDialog
- [ ] Thursday: Update existing components
- [ ] Friday: Component tests + i18n (FR + EN)

**Both Teams:**
- [ ] Friday: **GATE 4:** All UI tests passing

**Deliverables:**
- ✅ Flutter webhook UI complete
- ✅ Vue.js webhook UI complete
- ✅ All UI tests passing
- ✅ i18n complete

**Synchronization Point:**
- 🔄 Both UIs use same API endpoints
- 🔄 Both UIs show webhook associations identically
- 🔄 Both UIs handle Socket.IO events consistently

---

### Week 5: Integration Testing

**Goal:** Verify all components work together

**Monday (Day 21): Local Integration**
- [ ] Deploy backend to local dev environment
- [ ] Run database migration
- [ ] Deploy frontend to local dev
- [ ] Flash firmware to dev ESP32
- [ ] Deploy Flutter app to emulator

**Tuesday (Day 22): End-to-End Tests**
- [ ] Test: Create webhook via Flutter → Scan with ESP32 → Verify trigger
- [ ] Test: Create webhook via Vue.js → Scan with RPI → Verify trigger
- [ ] Test: Webhook timeout scenarios
- [ ] Test: Webhook error handling (4xx, 5xx)
- [ ] Test: Variable substitution with real webhooks

**Wednesday (Day 23): Staging Deployment**
- [ ] **GATE 5:** All E2E tests pass
- [ ] Deploy contracts v2.0.0 to staging
- [ ] Deploy backend v1.0.0 to staging
- [ ] Run database migration on staging
- [ ] Deploy frontend v1.0.0 to staging
- [ ] Flash firmware v1.0.0 to staging ESP32
- [ ] Deploy Flutter v1.0.0 to TestFlight/Play Beta

**Thursday (Day 24): Staging Validation**
- [ ] Smoke tests on staging
- [ ] Create test webhook associations
- [ ] Verify all components synchronized
- [ ] Load testing (10+ concurrent webhook triggers)
- [ ] Security testing

**Friday (Day 25): Bug Fixes**
- [ ] Fix any issues found in staging
- [ ] Re-test
- [ ] **GATE 6:** Staging environment stable

**Deliverables:**
- ✅ All components deployed to staging
- ✅ E2E tests passing
- ✅ No critical bugs

---

### Week 6: Deployment & Monitoring

**Goal:** Production deployment with zero downtime

**Monday (Day 26): Pre-Deployment**
- [ ] Backup production database
- [ ] Prepare rollback plan
- [ ] Schedule maintenance window (if needed)
- [ ] Final review of all changes

**Tuesday (Day 27): Production Deployment - Phase 1 (Backend)**
- [ ] 08:00: Deploy contracts v2.0.0
- [ ] 08:30: Deploy RPI backend v1.0.0 (without migration)
- [ ] 09:00: Verify backend health
- [ ] 09:30: Run database migration (v0 → v1)
- [ ] 10:00: Verify migration success
- [ ] 10:30: **CHECKPOINT:** Backend stable with backward compatibility

**Wednesday (Day 28): Production Deployment - Phase 2 (Clients)**
- [ ] 08:00: Deploy RPI frontend v1.0.0
- [ ] 09:00: Flash ESP32 firmware v1.0.0 to production devices
- [ ] 10:00: Deploy Flutter app v1.0.0 to stores
- [ ] 11:00: Verify all clients can create webhook associations
- [ ] **CHECKPOINT:** All clients deployed

**Thursday (Day 29): Monitoring & Validation**
- [ ] Monitor error rates
- [ ] Monitor webhook trigger success rates
- [ ] Monitor API response times
- [ ] Monitor database performance
- [ ] Gather user feedback

**Friday (Day 30): Post-Deployment**
- [ ] Review metrics
- [ ] Address any issues
- [ ] Update documentation
- [ ] Create retrospective report
- [ ] **GATE 7:** Production stable

**Deliverables:**
- ✅ All components in production
- ✅ Zero downtime achieved
- ✅ Monitoring dashboards active
- ✅ v1 feature live

---

## 🔄 Synchronization Checkpoints

### Checkpoint 1: Contract Alignment (End of Week 1)
**Verify:**
- [ ] All repos have contracts v2.0.0 in submodules
- [ ] All generated clients compile without errors
- [ ] All teams understand new schemas

**Go/No-Go Decision:**
- ✅ GO: All clients compile → Proceed to Week 2
- ❌ NO-GO: Compilation errors → Fix contracts, regenerate

---

### Checkpoint 2: Backend-Firmware Alignment (End of Week 3)
**Verify:**
- [ ] Backend webhook trigger format matches firmware exactly
- [ ] Variable substitution produces identical results
- [ ] Both can parse/generate same webhook configs
- [ ] Database migration tested on staging-like environment

**Test:**
```python
# Backend test
backend_result = backend.substitute_variables(
    "{{tag_id}}-{{timestamp}}",
    tag_id="04:A3:2C",
    timestamp="2025-01-27T14:30:00Z"
)

# Firmware test (via Serial)
firmware_result = firmware.substitute_variables(
    "{{tag_id}}-{{timestamp}}",
    tag_id="04:A3:2C",
    timestamp="2025-01-27T14:30:00Z"
)

assert backend_result == firmware_result
```

**Go/No-Go Decision:**
- ✅ GO: Outputs match → Proceed to frontend
- ❌ NO-GO: Outputs differ → Fix inconsistency

---

### Checkpoint 3: Frontend-Backend Alignment (End of Week 4)
**Verify:**
- [ ] Flutter calls correct API endpoints
- [ ] Vue.js calls correct API endpoints
- [ ] Both handle Socket.IO events identically
- [ ] Both display webhook associations identically

**Test:**
1. Create webhook via Flutter
2. Verify appears correctly in Vue.js
3. Create webhook via Vue.js
4. Verify appears correctly in Flutter

**Go/No-Go Decision:**
- ✅ GO: UIs synchronized → Proceed to integration
- ❌ NO-GO: UI discrepancies → Fix alignment

---

### Checkpoint 4: End-to-End Validation (Day 25)
**Verify:**
- [ ] All E2E scenarios pass
- [ ] No critical bugs
- [ ] Performance acceptable
- [ ] Security audit complete

**Critical E2E Scenarios:**
1. **Scenario A:** Flutter → RPI Backend → ESP32
   - Create webhook in Flutter
   - Scan tag with ESP32
   - Verify webhook triggered

2. **Scenario B:** Vue.js → RPI Backend → RPI Reader
   - Create webhook in Vue.js
   - Scan tag with RPI reader
   - Verify webhook triggered

3. **Scenario C:** Migration Validation
   - Existing playlist associations still work
   - Old clients (v0) can still read playlists
   - New clients (v1) can create both types

**Go/No-Go Decision:**
- ✅ GO: All scenarios pass → Proceed to production
- ❌ NO-GO: Failures → Fix and retest

---

## 🗄️ Database Migration Strategy

### Migration Execution Plan

**Step 1: Backup**
```bash
# Backup production database
pg_dump openmusicbox_db > backup_v0_$(date +%Y%m%d_%H%M%S).sql
```

**Step 2: Create Migration (Already done in Week 2)**
```python
# Migration file: add_webhook_associations.py

def upgrade():
    # Add columns
    op.add_column('nfc_associations', sa.Column('association_type', sa.String(20)))
    op.add_column('nfc_associations', sa.Column('webhook_url', sa.String(500)))
    # ... other columns

    # Migrate existing data
    op.execute("UPDATE nfc_associations SET association_type = 'playlist'")

    # Make non-nullable
    op.alter_column('nfc_associations', 'association_type', nullable=False)

def downgrade():
    # Drop columns (playlist data preserved)
    op.drop_column('nfc_associations', 'association_type')
    # ... other columns
```

**Step 3: Test Migration (Week 2)**
```bash
# On dev database
alembic upgrade head  # Test upgrade
alembic downgrade -1  # Test rollback
alembic upgrade head  # Re-upgrade
```

**Step 4: Execute on Staging (Day 23)**
```bash
# Staging database
alembic upgrade head
# Verify: Check all existing playlist associations have type='playlist'
```

**Step 5: Execute on Production (Day 27, 09:30)**
```bash
# Production database (during maintenance window if needed)
alembic upgrade head

# Verify migration
SELECT association_type, COUNT(*)
FROM nfc_associations
GROUP BY association_type;
# Expected: All existing = 'playlist', new ones may be 'webhook'
```

### Migration Verification Checklist

After migration, verify:
- [ ] All existing playlist associations preserved
- [ ] All have `association_type = 'playlist'`
- [ ] No NULL values in `association_type`
- [ ] Constraints created successfully
- [ ] Indexes still optimal
- [ ] Query performance acceptable

### Rollback Plan

If migration fails:

**Option A: Rollback Migration**
```bash
alembic downgrade -1  # Rolls back to v0 schema
# All playlist data preserved, webhook data lost
```

**Option B: Restore Backup**
```bash
# Stop backend
systemctl stop openmusicbox-backend

# Restore database
psql openmusicbox_db < backup_v0_20250127_093000.sql

# Deploy v0 backend
git checkout v0.8.0
systemctl start openmusicbox-backend
```

---

## 📦 Deployment Strategy

### Zero-Downtime Deployment

**Principle:** Backend v1.0.0 must be backward compatible with v0 clients

**How:**
1. Backend v1.0.0 accepts both v0 and v1 requests
2. If `association_type` not provided, assume `"playlist"` (v0 behavior)
3. Old clients continue working with playlists
4. New clients use webhook features

**Backend Compatibility Code:**
```python
@router.post("/associate")
async def associate_nfc_tag(request: NFCAssociateRequest):
    # Backward compatibility: infer type if not provided
    if not request.association_type:
        request.association_type = "playlist"  # v0 default

    # Validation
    if request.association_type == "playlist" and not request.playlist_id:
        raise HTTPException(400, "playlist_id required")

    # ... rest of logic
```

### Deployment Order (Critical!)

**Must follow this order:**

1. **Contracts v2.0.0** (no impact, just schemas)
2. **Backend v1.0.0** (backward compatible, accepts v0 + v1)
3. **Database Migration** (adds columns, preserves data)
4. **Frontend v1.0.0** (can use new features)
5. **Firmware v1.0.0** (can use new features)
6. **Mobile v1.0.0** (can use new features)

**Why this order?**
- Backend must be ready before clients are updated
- Database must be migrated before webhook features are used
- Clients can be updated in any order after backend is ready

---

## 🔐 Security & Validation

### URL Validation (All Components)

**Backend Validation:**
```python
def validate_webhook_url(url: str) -> bool:
    # Only http/https
    if not url.startswith(('http://', 'https://')):
        return False

    # Optional: Block local network
    parsed = urlparse(url)
    if parsed.hostname in ['localhost', '127.0.0.1']:
        return False
    if parsed.hostname.startswith('192.168.'):
        return False

    return True
```

**Frontend Validation:**
```typescript
function validateWebhookUrl(url: string): boolean {
  return /^https?:\/\/.+/.test(url);
}
```

**Firmware Validation:**
```cpp
bool validateWebhookUrl(const String& url) {
    return url.startsWith("http://") || url.startsWith("https://");
}
```

### Timeout Enforcement

**All components must enforce:**
- Minimum: 1000ms (1 second)
- Default: 5000ms (5 seconds)
- Maximum: 30000ms (30 seconds)

### Rate Limiting (Optional - Future)

Consider adding:
- Max 10 webhook triggers per minute per tag
- Max 100 webhook triggers per hour per device

---

## 📊 Monitoring & Success Metrics

### Key Metrics to Track

**Functional Metrics:**
- Webhook trigger success rate (target: >95%)
- Webhook response time (target: <500ms for fast endpoints)
- Database query performance (target: <50ms)
- API response time (target: <200ms)

**Business Metrics:**
- Number of webhook associations created
- Webhook vs playlist ratio
- Most popular webhook integrations
- User adoption rate

**Error Metrics:**
- Webhook timeout rate (target: <5%)
- Webhook error rate (4xx, 5xx) (target: <10%)
- Database migration errors (target: 0)
- Client compatibility issues (target: 0)

### Monitoring Dashboards

**Create Dashboards for:**
1. Webhook Trigger Success/Failure
2. Response Time Distribution
3. Error Rate by Component
4. Database Performance
5. User Activity (webhook creations per day)

---

## ✅ Master Checklist

### Pre-Development
- [x] Master plan created
- [x] GitHub issues created
- [x] Feature branches created
- [x] Implementation guides written
- [ ] Team kickoff meeting

### Development Phase
- [ ] Week 1: Contracts v2.0.0 complete
- [ ] Week 2: Backend foundation complete
- [ ] Week 3: Backend + Firmware complete
- [ ] Week 4: Frontend UIs complete
- [ ] Week 5: Integration tests pass
- [ ] Week 6: Production deployment

### Quality Gates
- [ ] GATE 1: Contracts approved (Day 5)
- [ ] GATE 2: Backend tests pass (Day 10)
- [ ] GATE 3: Backend ready for staging (Day 15)
- [ ] GATE 4: All UI tests pass (Day 20)
- [ ] GATE 5: E2E tests pass (Day 23)
- [ ] GATE 6: Staging stable (Day 25)
- [ ] GATE 7: Production stable (Day 30)

### Synchronization Checks
- [ ] CHECKPOINT 1: Contract alignment (Day 5)
- [ ] CHECKPOINT 2: Backend-Firmware alignment (Day 15)
- [ ] CHECKPOINT 3: Frontend-Backend alignment (Day 20)
- [ ] CHECKPOINT 4: E2E validation (Day 25)

### Deployment
- [ ] Staging deployment successful
- [ ] Production backup created
- [ ] Migration tested
- [ ] Rollback plan ready
- [ ] Production deployment successful
- [ ] Monitoring active

### Post-Deployment
- [ ] Metrics tracked
- [ ] User feedback collected
- [ ] Issues resolved
- [ ] Retrospective completed
- [ ] Documentation updated

---

## 🚨 Risk Management

### High-Risk Areas

**1. Database Migration**
- **Risk:** Migration fails, data corruption
- **Mitigation:**
  - Test on staging first
  - Create backup before migration
  - Test rollback procedure
  - Have DBA review migration script

**2. Contract Synchronization**
- **Risk:** Backend and clients out of sync
- **Mitigation:**
  - Contract-first development
  - Version checking in API
  - Integration tests before deployment
  - Staged rollout

**3. Memory Issues (ESP32)**
- **Risk:** Firmware crashes due to memory overflow
- **Mitigation:**
  - Set max webhook config size (2KB)
  - Monitor heap usage
  - Test with large configs
  - Add memory checks before saving

**4. Webhook Timeouts**
- **Risk:** Slow endpoints cause poor UX
- **Mitigation:**
  - Enforce timeout limits
  - Show response time in UI
  - Log slow webhooks
  - Consider async execution (future)

### Rollback Triggers

**Initiate rollback if:**
- Database migration fails
- >10% error rate in production
- Critical bug affecting playlists (existing feature)
- Security vulnerability discovered
- Multiple components fail to synchronize

---

## 📞 Team Communication

### Daily Standups (During Development)
- **When:** 9:00 AM daily
- **Duration:** 15 minutes
- **Format:** What did you do? What will you do? Any blockers?

### Weekly Sync (During Development)
- **When:** Friday 3:00 PM
- **Duration:** 1 hour
- **Agenda:**
  - Review week's progress
  - Verify synchronization checkpoints
  - Plan next week
  - Address blockers

### Critical Issue Protocol
- **Severity 1 (Critical):** Immediate team call
- **Severity 2 (High):** Report in team chat within 1 hour
- **Severity 3 (Medium):** Report in daily standup

### Communication Channels
- **Team Chat:** Daily updates, quick questions
- **GitHub Issues:** Bug reports, feature discussions
- **Pull Requests:** Code reviews
- **Wiki/Docs:** Architecture decisions, guides

---

## 📚 Documentation Requirements

### During Development
- [ ] Update API documentation with webhook endpoints
- [ ] Add webhook examples to README files
- [ ] Create troubleshooting guide
- [ ] Update user guides (Flutter app, RPI web)

### Post-Deployment
- [ ] Create release notes (v1.0.0)
- [ ] Update changelog
- [ ] Write blog post/announcement
- [ ] Create tutorial videos (optional)

---

## 🎓 Knowledge Transfer

### Training Sessions
- **Session 1:** Contract changes and migration strategy
- **Session 2:** Webhook configuration and testing
- **Session 3:** Troubleshooting and monitoring

### Documentation Handoff
- [ ] Implementation guides in each repo
- [ ] Master plan (this document)
- [ ] API documentation
- [ ] Architecture diagrams

---

**Document Version:** 1.0
**Last Updated:** 2025-01-27
**Maintained By:** Project Lead
**Next Review:** After each major milestone
