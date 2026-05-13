# Feature Backlog — Customer Self-Service Returns Portal

Mock GitHub Issues representing the current sprint/feature backlog. Use these with Copilot to practice roadmap planning, sprint summarization, and stakeholder communication.

---

## Issues

---

### #42 — Customer can initiate a return request from order history
**Labels:** `user-story` `priority:high` `sprint:1`  
**Status:** In Progress  
**Assignee:** @elena-m

**Description:**  
As a customer, I want to select items from my order history and submit a return request so that I don't have to call support.

**Acceptance Criteria:**
- [ ] Customer can select one or more items from an order
- [ ] Customer selects a return reason from the dropdown
- [ ] Optional free-text notes field (max 500 chars)
- [ ] On submission, return is created with status "Submitted"
- [ ] Customer sees confirmation screen with return ID

**Story Points:** 8

---

### #43 — Return eligibility validation (30-day window + item type rules)
**Labels:** `user-story` `priority:high` `sprint:1`  
**Status:** In Progress  
**Assignee:** @ravi-k

**Description:**  
As a customer, I want to know immediately whether an item is eligible for return so I'm not surprised when my request is rejected.

**Acceptance Criteria:**
- [ ] Items outside 30-day window show eligibility message
- [ ] Final sale and digital items flagged as non-returnable
- [ ] Items already on a pending/approved return are locked
- [ ] Server-side re-validation at submission time

**Story Points:** 5

---

### #44 — Return status tracking dashboard
**Labels:** `user-story` `priority:high` `sprint:1`  
**Status:** To Do  
**Assignee:** Unassigned

**Description:**  
As a customer, I want to view the status of all my return requests in one place so I can track progress without calling support.

**Acceptance Criteria:**
- [ ] Dashboard shows all return requests for authenticated user
- [ ] Each request shows: return ID, items, date submitted, current status
- [ ] Status change timestamps visible
- [ ] Email notification sent on: Approved, Rejected, Refund Issued

**Story Points:** 5

---

### #45 — Integrate with Order Management System (OMS) API
**Labels:** `task` `priority:high` `sprint:1` `integration`  
**Status:** In Progress  
**Assignee:** @dev-patel

**Description:**  
Connect the returns portal to the existing OMS REST API to fetch customer order history. Requires authentication token exchange and handling of paginated responses.

**Technical Notes:**
- OMS endpoint: `GET /api/v2/orders?customer_id={id}&limit=50`
- Auth: Bearer token via service account (credentials in Vault)
- Need to handle 429 rate limiting (max 100 req/min per customer)

**Story Points:** 8

---

### #46 — SSO authentication integration (Okta)
**Labels:** `task` `priority:high` `sprint:1`  
**Status:** Done  
**Assignee:** @elena-m

**Description:**  
Implement Okta SSO authentication for the returns portal. Redirect unauthenticated users to login; handle session expiry (30 min inactivity).

**Story Points:** 5

---

### #47 — Non-returnable item messaging
**Labels:** `user-story` `priority:medium` `sprint:2`  
**Status:** To Do  
**Assignee:** Unassigned

**Description:**  
As a customer, I want to understand *why* an item can't be returned so I don't feel confused or misled.

**Acceptance Criteria:**
- [ ] Inline message explains ineligibility reason (policy)
- [ ] Link to full returns policy page displayed
- [ ] Messaging doesn't obscure eligible items in same order

**Story Points:** 3

---

### #48 — BUG: Return submission fails for orders with more than 10 items
**Labels:** `bug` `priority:high` `sprint:1`  
**Status:** To Do  
**Assignee:** @ravi-k

**Description:**  
When a customer attempts to initiate a return on an order with more than 10 line items, the submission API returns a 500 error. Reproduced consistently in staging.

**Steps to Reproduce:**
1. Log in as test user `customer_bulk_orders@test.com`
2. Navigate to order #TEST-1091 (12 items)
3. Select any item and submit return
4. Observe: 500 error, no return created

**Expected:** Return created successfully  
**Actual:** 500 Internal Server Error  
**Severity:** High — affects orders placed during promotions/bundles

**Story Points:** 3

---

### #49 — Audit trail logging for return request events
**Labels:** `task` `priority:high` `sprint:2`  
**Status:** To Do  
**Assignee:** @dev-patel

**Description:**  
Implement immutable audit logging for all return request events (creation, status changes, admin actions). Required by Finance/Legal for 7-year retention.

**Technical Notes:**
- Write to `return_audit_log` table (schema in `data-model.sql`)
- Events: `CREATED`, `STATUS_CHANGED`, `ADMIN_OVERRIDE`, `REFUND_INITIATED`
- Include: actor (customer_id or admin_user_id), timestamp, old_status, new_status, metadata JSON

**Story Points:** 5

---

### #50 — Mobile-responsive UI (375px viewport)
**Labels:** `user-story` `priority:medium` `sprint:2`  
**Status:** To Do  
**Assignee:** Unassigned

**Description:**  
As a customer on a mobile device, I want to complete the full returns flow without any layout issues or horizontal scrolling.

**Acceptance Criteria:**
- [ ] All primary flows work at 375px viewport
- [ ] Touch targets ≥ 44×44px
- [ ] Forms don't break on mobile keyboard focus
- [ ] Tested on iOS Safari 15+ and Android Chrome 110+

**Story Points:** 5

---

### #51 — WCAG 2.1 AA accessibility audit and remediation
**Labels:** `task` `priority:medium` `sprint:2`  
**Status:** To Do  
**Assignee:** Unassigned

**Description:**  
Run an automated and manual accessibility audit against WCAG 2.1 AA criteria for all portal screens. Remediate any Level A or AA violations before production launch.

**Story Points:** 5

---

### #52 — Performance load test: validate SLAs under 500 concurrent users
**Labels:** `task` `priority:medium` `sprint:2`  
**Status:** To Do  
**Assignee:** @qa-team

**Description:**  
Execute load test scenarios to validate the performance SLAs defined in REQ-006:
- Page load < 2s (P95)
- API response < 500ms (P95)
- Return submission < 3s (P95)

Use k6 or Locust. Test against staging environment. Output results to CI artifact.

**Story Points:** 3
