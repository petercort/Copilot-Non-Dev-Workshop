# User Stories — Customer Self-Service Returns Portal
*Pre-generated example output. Produced by: Copilot Chat using Prompt 1 from `prompts/business-analyst.md` with `scenario/meeting-notes.md` as input.*

---

## Epic: Customer Self-Service Returns Portal

---

### US-001: Initiate a Return Request
**As a** customer who made an online purchase,  
**I want to** select items from my order history and submit a return request through a self-service portal,  
**So that** I can initiate returns without calling customer support.

**Acceptance Criteria:**
- [ ] Customer can log in and view their order history
- [ ] Customer can select one or more items from an eligible order
- [ ] Customer must provide a return reason (dropdown: Defective, Wrong Item, Changed Mind, Damaged in Shipping, Other)
- [ ] Optional free-text notes field available (max 500 characters)
- [ ] On submission, customer sees a confirmation screen with a unique return request ID
- [ ] Customer receives a confirmation email with the return request ID

**Priority:** High | **Sprint:** 1

---

### US-002: View Return Eligibility Before Submitting
**As a** customer browsing my order history,  
**I want to** see immediately whether each item is eligible for return and why,  
**So that** I'm not confused or surprised when a return request is rejected.

**Acceptance Criteria:**
- [ ] Items within the 30-day return window and eligible by type display a "Start Return" call-to-action
- [ ] Items outside the 30-day window display: *"This item is no longer eligible for return (return window closed)"*
- [ ] Final sale and digital items display: *"This item is marked final sale and cannot be returned"*
- [ ] Items already on an active return display: *"A return request for this item is already in progress"*
- [ ] A link to the full returns policy is shown alongside ineligible items
- [ ] Eligibility is re-validated server-side at time of submission (not client-side only)

**Priority:** High | **Sprint:** 1

---

### US-003: Track the Status of a Return Request
**As a** customer who has submitted a return request,  
**I want to** check the current status of my return at any time from the portal,  
**So that** I don't need to call support to find out what's happening.

**Acceptance Criteria:**
- [ ] Customer can view a list of all their return requests on the portal dashboard
- [ ] Each return shows: Return ID, items included, date submitted, current status
- [ ] Status history shows the date/time of each status change
- [ ] Valid statuses: Submitted → Under Review → Approved/Rejected → Item Received → Refund Issued
- [ ] Customer receives an email notification when status changes to Approved, Rejected, or Refund Issued

**Priority:** High | **Sprint:** 1

---

### US-004: Understand Why an Item Cannot Be Returned
**As a** customer who attempts to return a non-eligible item,  
**I want to** receive a clear explanation of why the item cannot be returned,  
**So that** I don't feel confused or misled by the experience.

**Acceptance Criteria:**
- [ ] Contextual inline message explains the specific reason for ineligibility
- [ ] Message copy matches the approved text (see US-002 acceptance criteria)
- [ ] Full returns policy link is displayed alongside the message
- [ ] Ineligible items do not block the customer from returning eligible items in the same order

**Priority:** Medium | **Sprint:** 2

---

### US-005: Access the Returns Portal on Mobile
**As a** customer using my smartphone,  
**I want to** complete the entire returns process on my mobile browser,  
**So that** I'm not forced to switch to a desktop to resolve an issue.

**Acceptance Criteria:**
- [ ] All primary flows work at 375px viewport width without horizontal scrolling
- [ ] Touch targets are a minimum of 44×44px
- [ ] Forms are usable with a mobile keyboard (no layout breakage on focus)
- [ ] Tested and functional on iOS Safari 15+ and Android Chrome 110+

**Priority:** Medium | **Sprint:** 2

---

## Open Questions Identified from Meeting Notes

| # | Question | Owner | Status |
|---|----------|-------|--------|
| 1 | What is the acceptable page load / response time SLA? | Marcus (BA) | Resolved in REQ-006 (v2) |
| 2 | What is the refund threshold for manual Finance approval? | Sarah (PM) | Resolved: $150 |
| 3 | Does SSO cover all customer segments or only registered accounts? | Dev (Eng) | Resolved: registered accounts only (MVP) |
| 4 | Should return reasons be free-text, dropdown, or both? | Marcus (BA) | Resolved: dropdown required + optional free-text |
| 5 | Is holiday deadline Nov 30 or Dec 15? | Sarah (PM) | Resolved: Dec 15 |
| 6 | What are the top 10 "reason for call" categories from Support? | Priya (Support) | Pending |

---

## Contradictions / Gaps Identified

- **Contradiction:** Sarah initially described "label generation" as part of the self-service flow, but later called it a stretch goal not blocking MVP. Needs to be communicated clearly to Engineering so it's not scoped in Sprint 1.
- **Gap:** No accessibility requirement was raised in the meeting; WCAG 2.1 AA was assumed by Sarah but never explicitly stated. Confirmed and added to NFR-001.
- **Gap:** Authentication mechanism (SSO vs password) was debated but not resolved in the meeting. Resolved as Okta SSO in v2 requirements.
