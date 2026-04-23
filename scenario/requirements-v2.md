# Requirements Document — Customer Self-Service Returns Portal
**Version:** 2.0  
**Author:** Marcus Chen, Business Analyst  
**Reviewed by:** Sarah Okafor (PM), Dev Patel (Engineering Lead)  
**Date:** 2024-11-25  
**Status:** Approved for Development

---

## Change Summary (v1.0 → v2.0)

| Change | Description |
|--------|-------------|
| REQ-004 reworded | Eligibility validation rules made explicit and testable |
| REQ-006 reworded | Vague "fast" requirement replaced with measurable SLA |
| REQ-009 added | New requirement: Non-Returnable Item Messaging |
| REQ-003 removed | "Initiate a Return Request" merged into REQ-004 scope |
| Acceptance criteria added | REQ-001, REQ-003(merged), REQ-007 now have full ACs |

---

## Overview

This document captures the approved requirements for the Customer Self-Service Returns Portal MVP. It supersedes v1.0. Changes reflect clarifications received from the Finance team, Customer Support, and Engineering discovery.

---

## Functional Requirements

### REQ-001: Customer Authentication
Customers must authenticate via the company's existing SSO provider (Okta) before accessing the returns portal. Guest checkout orders are not supported in MVP.

*Acceptance Criteria:*
- Unauthenticated users who navigate to the portal are redirected to the SSO login page
- After successful login, users are returned to the portal landing page
- Session tokens expire after 30 minutes of inactivity
- Failed login attempts are handled by the SSO provider; the portal displays a generic error message

---

### REQ-002: View Order History
Customers shall be able to view their recent order history from within the portal.

*Acceptance Criteria:*
- Customer can see orders from the last 12 months
- Each order shows: order number, date, items, total amount, and return eligibility indicator
- Orders older than 12 months are accessible via a "Show older orders" expansion, but return actions are disabled

---

### REQ-004: Initiate and Submit a Return Request
Customers shall be able to select one or more eligible items from an order and submit a return request, including a required return reason.

*Acceptance Criteria:*
- Customer selects items to return from order detail view
- Customer must select a return reason from a predefined dropdown (options: Defective, Wrong Item, Changed Mind, Damaged in Shipping, Other)
- A free-text notes field (max 500 characters) is optional
- Upon submission, customer receives an on-screen confirmation and email with the return request ID
- Return request is created with status "Submitted"

---

### REQ-004 (Eligibility): Return Eligibility Validation
The system must validate return eligibility before allowing submission, using the following rules:

1. **Return window:** Items must be within 30 days of the original order date
2. **Item type:** Final sale items and digital goods are not eligible (flagged in the product catalog)
3. **Prior return:** Items already included in an approved or pending return are not eligible

*Acceptance Criteria:*
- Items outside the 30-day window display: *"This item is no longer eligible for return (return window closed)"*
- Final sale / digital items display: *"This item is marked final sale and cannot be returned"*
- Items on an existing return display: *"A return request for this item is already in progress"*
- Eligible items display a "Start Return" CTA
- Eligibility is re-validated server-side at submission (not just client-side)

---

### REQ-005: Return Status Tracking
Customers shall be able to view the current status of any return request they have submitted.

*Acceptance Criteria:*
- Statuses include: Submitted, Under Review, Approved, Rejected, Item Received, Refund Issued
- Status is visible from the customer's portal dashboard
- Each status change displays the date/time it occurred
- Customers receive an email notification on status change to Approved, Rejected, or Refund Issued

---

### REQ-006: System Performance
The portal must meet the following performance SLAs under normal load (up to 500 concurrent users):

| Metric | Target |
|--------|--------|
| Page load time (initial) | < 2 seconds (P95) |
| API response time | < 500ms (P95) |
| Return submission end-to-end | < 3 seconds (P95) |

*Acceptance Criteria:*
- Load test results must demonstrate the above thresholds are met prior to production deployment
- Performance degradation alerts are configured in the monitoring dashboard

---

### REQ-007: Mobile Responsiveness
The portal must be fully functional on mobile browsers (iOS Safari 15+, Android Chrome 110+) with a viewport width of 375px and above.

*Acceptance Criteria:*
- All primary user flows (view orders, initiate return, view status) are completable on a 375px viewport without horizontal scrolling
- Touch targets are a minimum of 44×44px
- Forms are usable with a mobile keyboard (no layout breakage on focus)

---

### REQ-008: Audit Trail
All return request events must be logged for compliance and reporting purposes.

*Acceptance Criteria:*
- Every status change on a return request is timestamped and attributed to a user or system actor
- Audit log is accessible to internal admin users via the admin dashboard
- Audit records are retained for a minimum of 7 years (per Finance/Legal requirement)
- Audit log entries are immutable (no update or delete operations permitted)

---

### REQ-009: Non-Returnable Item Messaging *(New in v2.0)*
When a customer views an item that is not eligible for return, the portal must clearly communicate why and provide relevant policy context.

*Acceptance Criteria:*
- Non-eligible items display a contextual inline message explaining the reason (see REQ-004 for message copy)
- A link to the full returns policy page is displayed alongside ineligible items
- The messaging does not block the customer from viewing eligible items in the same order

---

## Non-Functional Requirements

| ID | Requirement | Priority |
|----|-------------|----------|
| NFR-001 | Portal must meet WCAG 2.1 AA accessibility standards | High |
| NFR-002 | System must be available 99.5% uptime during business hours | Medium |
| NFR-003 | All customer data must be transmitted over HTTPS | High |
| NFR-004 | Return request data must be stored in the primary application database; no PII in logs | High |

---

## Out of Scope (MVP)

- Shipping label generation (stretch goal — evaluate for v1.1)
- High-value return approval workflow (v2 — threshold TBD with Finance)
- Refund processing (portal initiates request only; Finance reviews all refunds above $150)
- Guest checkout order support

---

## Resolved Questions (from v1.0)

| Question | Resolution |
|----------|------------|
| Performance SLA? | See REQ-006 |
| Refund approval threshold? | $150 (Finance confirmed 2024-11-21) |
| SSO coverage? | Registered accounts only; guest orders out of scope |
| Return reason: free-text or dropdown? | Dropdown required + optional free-text (see REQ-004) |
