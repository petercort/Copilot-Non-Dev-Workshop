# Test Cases — Customer Self-Service Returns Portal
*Pre-generated example output. Produced by: Copilot Chat using Prompt 1 from `prompts/qa-test.md` with REQ-004 acceptance criteria as input.*

---

## Test Suite: Return Eligibility Validation (REQ-004)

| Test Case ID | Description | Preconditions | Steps | Expected Result | Test Type |
|---|---|---|---|---|---|
| TC-001 | Happy path: eligible item within return window | Customer logged in; order placed 10 days ago; item is standard category | 1. Navigate to order history. 2. Open order. 3. View item. | "Start Return" CTA is displayed on the item | Positive |
| TC-002 | Item outside 30-day return window | Customer logged in; order placed 35 days ago | 1. Navigate to order history. 2. Open order. 3. View item. | Message displayed: "This item is no longer eligible for return (return window closed)" | Negative |
| TC-003 | Item placed exactly on day 30 (boundary) | Order placed exactly 30 days ago (same calendar date) | 1. Navigate to order. 2. View item. | Item is eligible; "Start Return" CTA displayed | Edge Case |
| TC-004 | Item placed on day 31 (boundary +1) | Order placed 31 days ago | 1. Navigate to order. 2. View item. | Ineligible message displayed (return window closed) | Edge Case |
| TC-005 | Final sale item not returnable | Customer logged in; order contains a final_sale category item | 1. Navigate to order history. 2. Open order. 3. View final sale item. | Message displayed: "This item is marked final sale and cannot be returned" | Negative |
| TC-006 | Digital goods item not returnable | Order contains a digital category item | 1. Navigate to order. 2. View digital item. | "This item is marked final sale and cannot be returned" message shown | Negative |
| TC-007 | Item already on pending return | Customer has an existing Submitted/Approved return for this item | 1. Navigate to same order. 2. Attempt to return the same item again. | Message displayed: "A return request for this item is already in progress" | Negative |
| TC-008 | Mix of eligible and ineligible items in same order | Order with one eligible item and one final sale item | 1. Open order. 2. View both items. | Eligible item shows "Start Return" CTA; ineligible item shows appropriate message. Both visible simultaneously. | Positive + Negative |
| TC-009 | Returns policy link shown for ineligible items | Any ineligible item (window or final sale) | 1. View ineligible item. | A link to the full returns policy page is displayed alongside the ineligibility message | Positive |
| TC-010 | Server-side eligibility re-validation (bypass attempt) | Client-side validation disabled via browser dev tools; item is outside return window | 1. Manually enable "Start Return" via dev tools. 2. Submit return request. | API returns 422 error: "Return window closed." Return is NOT created. | Security/Edge |

---

## Test Suite: Submit Return Request (REQ-004 / US-001)

| Test Case ID | Description | Preconditions | Steps | Expected Result | Test Type |
|---|---|---|---|---|---|
| TC-011 | Happy path: submit return for single eligible item | Customer logged in; eligible item in order | 1. Navigate to order. 2. Click "Start Return". 3. Select reason "Defective". 4. Submit. | Return created with status "Submitted". Confirmation screen shown with Return ID. Confirmation email sent. | Positive |
| TC-012 | Submit return with optional notes | As above | 1-3 above. 4. Enter 200 character note. 5. Submit. | Return created successfully. Notes saved to return record. | Positive |
| TC-013 | Notes field exceeds 500 character limit | Customer on return submission form | 1. Type 501 characters in notes field. 2. Attempt to submit. | Error displayed: "Notes must be 500 characters or fewer." Submission blocked. | Negative |
| TC-014 | Submit without selecting a return reason | Customer on return submission form | 1. Do not select a reason. 2. Click submit. | Validation error: "Please select a return reason." Submission blocked. | Negative |
| TC-015 | Submit return for multiple items in same order | Order with 3 eligible items | 1. Select 2 items. 2. Assign reasons to each. 3. Submit. | Single return request created containing both items. | Positive |

---

## Test Suite: Return Status Tracking (REQ-005 / US-003)

| Test Case ID | Description | Preconditions | Steps | Expected Result | Test Type |
|---|---|---|---|---|---|
| TC-016 | Customer can view all their returns on dashboard | Customer has 3 return requests (various statuses) | 1. Log in. 2. Navigate to Returns dashboard. | All 3 returns listed with: Return ID, items, date submitted, current status | Positive |
| TC-017 | Status change timestamps visible | Return has moved through 3 status changes | 1. Open return detail view. | Each status change shows the date and time it occurred | Positive |
| TC-018 | Email notification sent on Approved status | Return is transitioned to Approved by admin | 1. Admin updates status to Approved. | Customer receives email notification within 5 minutes | Positive |
| TC-019 | Email notification sent on Rejected status | Return is transitioned to Rejected | 1. Admin updates status to Rejected. | Customer receives rejection email notification | Positive |
| TC-020 | Invalid status transition is rejected | Return is in "Rejected" status | 1. Attempt to move status to "Approved" via API. | API returns 422 error: "Cannot transition from 'rejected' to 'approved'." | Negative |

---

## Test Suite: Non-Functional (Performance, Accessibility, Mobile)

| Test Case ID | Description | Preconditions | Steps | Expected Result | Test Type |
|---|---|---|---|---|---|
| TC-021 | Page load time under 2 seconds (P95) | Load test environment with 500 concurrent users | Run k6 load test scenario | P95 page load time ≤ 2.0 seconds | Performance |
| TC-022 | API response time under 500ms (P95) | Load test environment | Run k6 API load test | P95 API response time ≤ 500ms | Performance |
| TC-023 | Mobile viewport 375px — no horizontal scroll | Test device or browser emulator at 375px | Walk through return submission flow on 375px viewport | No horizontal scrolling; all elements visible and usable | Mobile |
| TC-024 | Touch targets minimum 44×44px | Mobile browser | Inspect all interactive elements | All buttons, links, and form controls meet 44×44px minimum | Accessibility |
| TC-025 | WCAG 2.1 AA automated scan passes | Axe or Lighthouse CI configured | Run automated accessibility scan on all portal pages | Zero Level A or AA violations reported | Accessibility |
