# Document Comparison — Requirements v1.0 vs v2.0
*Pre-generated example output. Produced by: Copilot Chat using Prompt 3 from `prompts/business-analyst.md` with requirements-v1.md and requirements-v2.md as input.*

---

## Summary of Changes

| # | Requirement | Change Type | Scope Impact |
|---|-------------|-------------|--------------|
| REQ-001 | Customer Authentication | **Modified — Clarified** | No scope change; SSO provider (Okta) and session timeout (30 min) now explicit |
| REQ-002 | View Order History | **Modified — Clarified** | Minor scope addition: orders older than 12 months now accessible but return actions disabled |
| REQ-003 | Initiate a Return Request | **Removed / Merged** | Merged into REQ-004 scope; no functional loss |
| REQ-004 | Return Eligibility Validation | **Modified — Significantly Reworded** | Scope clarified and expanded: specific business rules added, three distinct ineligibility messages specified |
| REQ-005 | Return Status Tracking | **Modified — Acceptance Criteria Added** | No scope change; email notifications on status change now explicit |
| REQ-006 | System Performance | **Modified — Reworded from Vague** | Scope clarified: measurable SLAs added (2s page load, 500ms API, 3s submission P95) |
| REQ-007 | Mobile Responsiveness | **Modified — Acceptance Criteria Added** | Minor scope clarification: specific browsers and viewport (375px) now defined |
| REQ-008 | Audit Trail | **Modified — Acceptance Criteria Added** | Scope clarified: immutability requirement added; admin dashboard access specified |
| REQ-009 | Non-Returnable Item Messaging | **Added (New in v2.0)** | Scope addition: new requirement for contextual messaging and returns policy links |
| NFR-004 | No PII in logs | **Added (New in v2.0)** | Non-functional scope addition: data handling constraint |

---

## Detailed Change Analysis

---

### REQ-001 — Customer Authentication
**Change type:** Clarified  
**What changed:** v1.0 said "existing credentials." v2.0 specifies Okta SSO, adds that guest checkout is out of scope for MVP, and defines the 30-minute session timeout and the error handling behavior.

**Impact on QA test coverage:**
- Adds test cases for: SSO redirect flow, session timeout behavior, guest checkout rejection, and error message display on failed login
- Previously these were unspecified and could have been interpreted as in-scope

**Impact on Engineering:**
- Okta integration is now a named dependency — requires Okta tenant configuration before sprint 1 work can begin

---

### REQ-002 — View Order History
**Change type:** Minor scope addition  
**What changed:** v2.0 adds a new detail: orders older than 12 months are visible via "Show older orders" but return actions are disabled. v1.0 made no mention of this behavior.

**Impact on QA test coverage:**
- New test case needed: confirm that orders > 12 months old are visible but "Start Return" is absent

---

### REQ-003 — Initiate a Return Request *(Removed)*
**Change type:** Removed (merged)  
**What changed:** The standalone REQ-003 from v1.0 has been absorbed into the more detailed REQ-004 in v2.0. The content is still covered; it's a structural consolidation.

**Impact on QA:** No test cases lost — all return submission ACs now live in REQ-004. Teams should update traceability matrices to reference REQ-004.

---

### REQ-004 — Return Eligibility Validation *(Major Rewrite)*
**Change type:** Significantly reworded and expanded  
**What changed:**
- v1.0 was vague: "The system should check whether an item is eligible for return." Business rules were TBD.
- v2.0 defines three explicit ineligibility rules (30-day window, item type, duplicate return), specifies exact UI message copy for each condition, requires a "Start Return" CTA for eligible items, and mandates server-side re-validation.

**Impact on QA test coverage:**
- This is the highest-coverage delta in the document. At least 6 new test cases are now specifiable (see `outputs/test-cases.md`, TC-001 through TC-010).
- Server-side re-validation adds a security-relevant test case (bypass attempt)

**Impact on Engineering:**
- Specific message copy is now part of the requirement — copy changes after dev complete will require re-testing

---

### REQ-006 — System Performance *(Vague → Measurable)*
**Change type:** Reworded — vague to measurable  
**What changed:** v1.0: "The system should be fast and responsive." — not testable.  
v2.0: Defines three specific SLAs (P95 page load, API response, submission end-to-end) at 500 concurrent users.

**Impact on QA test coverage:**
- Load testing is now a mandatory pre-launch gate (not optional)
- Specific tooling (k6/Locust) and environment requirements implied

**⚠️ Flag:** A load test at 500 concurrent users requires a representative staging environment. If staging is under-resourced compared to production, results may not be meaningful.

---

### REQ-009 — Non-Returnable Item Messaging *(New)*
**Change type:** New requirement added  
**What changed:** Entirely new requirement not present in v1.0. Came from Priya (Support) feedback in stakeholder meeting.

**Impact on QA test coverage:**
- 2-3 new test cases needed: messaging present for each ineligibility type, policy link displayed, messaging doesn't hide eligible items in same order

**Impact on Engineering:**
- Low complexity — primarily front-end messaging and a policy link; reuses eligibility logic from REQ-004

---

## Requirements Still Missing Acceptance Criteria

As of v2.0, all requirements have acceptance criteria. ✅

---

## Recommendations

1. **Update traceability matrix** to replace REQ-003 references with REQ-004
2. **Add load test environment provisioning** to sprint 2 planning (REQ-006 blocker)
3. **Circulate message copy from REQ-004** to Customer Support for review before development begins — changing copy post-dev triggers re-test
4. **Confirm Okta tenant name/config** as a sprint 1 prerequisite (REQ-001 dependency)
