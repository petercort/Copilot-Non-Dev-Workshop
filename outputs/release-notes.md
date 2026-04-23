# Release Notes — Customer Self-Service Returns Portal v1.0
*Pre-generated example output. Produced by: Copilot Chat using Prompt 3 from `prompts/product-manager.md` with requirements-v2.md and backlog-issues.md as input.*

---

## Customer-Facing Release Notes

### 🎁 Introducing: Self-Service Returns

You can now start a return directly from your account — no hold music, no wait times.

**What's new:**

- **Return from your account** — Log in, go to your order history, and start a return in under a minute.
- **See eligibility instantly** — We'll tell you right away whether an item can be returned and why — before you even start the process.
- **Track your return** — Follow your return from submission to refund in one place. We'll also send you email updates when your status changes.
- **Clear answers on final sale items** — If something isn't returnable, we'll explain why and link you to the full policy — no guessing.

To get started, [log in to your account](https://example.com/account) and navigate to **Orders → Return an Item**.

---

## Internal / Developer Changelog

**Release:** `returns-portal/v1.0.0`  
**Release Date:** 2024-12-15  
**Issues closed:** #42, #43, #44, #45, #46, #47, #49, #50, #51

---

### New Features

#### Authentication (Issue #46)
- Integrated Okta SSO for portal authentication
- Unauthenticated users redirected to Okta login; returned to portal on success
- Session tokens expire after 30 minutes of inactivity
- Scope: registered accounts only; guest checkout support deferred to v1.1

#### Return Submission (Issue #42)
- `POST /returns` endpoint: accepts customer ID, order ID, selected items, reason code, and optional notes (500 char max)
- Return reasons: Defective, Wrong Item, Changed Mind, Damaged in Shipping, Other
- On submission: return record created with status `submitted`; confirmation email sent via SendGrid

#### Return Eligibility Validation (Issue #43)
- 30-day return window enforced server-side and client-side
- Non-returnable item categories: `final_sale`, `digital`, `perishable`
- Duplicate return detection: items already on an active return are locked
- Inline messaging for each ineligibility condition (copy reviewed by Support team)
- Returns policy link displayed on all ineligible items

#### Return Status Tracking (Issue #44)
- Customer dashboard shows all return requests with status and timestamps
- Email notifications triggered on status changes: Approved, Rejected, Refund Issued
- Status transitions enforced by API (see `ALLOWED_TRANSITIONS` in `returns-api.py`)

#### OMS Integration (Issue #45)
- `GET /api/v2/orders` integration for order history retrieval
- Rate limiting handled: 100 req/min ceiling with exponential backoff
- Service account credentials managed via HashiCorp Vault

#### Non-Returnable Item Messaging (Issue #47)
- Contextual inline messages for each ineligibility reason
- Returns policy deep-link displayed alongside all ineligible items
- Ineligible items do not block display of eligible items in the same order

#### Audit Logging (Issue #49)
- Immutable `return_audit_log` table captures all return events: `CREATED`, `STATUS_CHANGED`, `ADMIN_OVERRIDE`, `REFUND_INITIATED`
- Each log entry includes: actor, timestamp, from/to status, metadata JSON
- Database-level write protection via `no_update_audit` and `no_delete_audit` rules

---

### Accessibility & Quality

- **WCAG 2.1 AA (Issue #51):** All portal screens pass automated Axe scan and manual review; zero Level A/AA violations
- **Mobile responsiveness (Issue #50):** Full flow functional at 375px viewport (iOS Safari 15+, Android Chrome 110+); all touch targets ≥ 44×44px
- **Performance (Issue #52 - Sprint 2):** P95 page load < 2s, API response < 500ms, submission end-to-end < 3s under 500 concurrent users (validated via k6 load test)

---

### Bug Fixes

- **Issue #48 — Fix:** Return submission 500 error for orders with more than 10 line items. Root cause: missing pagination handling when serializing item list to request payload. Fixed by chunking item list in the OMS client layer.

---

### Known Issues / Deferred to v1.1

| Item | Notes |
|------|-------|
| Shipping label generation | Stretch goal; not included in MVP |
| High-value return approval workflow | Deferred; threshold confirmed at $150 (Finance) |
| Guest checkout returns | Requires OMS guest lookup; scoped for v1.1 |

---

### Upgrade / Migration Notes

- New tables: `return_requests`, `return_items`, `return_audit_log` — see `scenario/sample-code/data-model.sql`
- New enum type: `return_status` — run migration in order (enum before tables)
- Environment variables required: `OMS_API_URL`, `OMS_SERVICE_TOKEN` (Vault path: `secret/returns-portal/oms`)
- No breaking changes to existing APIs
