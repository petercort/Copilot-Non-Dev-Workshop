# Stakeholder Meeting Notes — Returns Portal Initiative
**Date:** 2024-11-14  
**Facilitator:** Marcus (BA)  
**Attendees:** Sarah (PM), Dev (Engineering Lead), Priya (Customer Support Rep), Marcus (BA)

---

## Raw Notes (unedited)

**Sarah (PM):** Okay so the big ask from leadership is that customers can handle their own returns without calling support. Like, end-to-end self-service. We've been getting killed on support volume — Priya, what's the number?

**Priya (Support):** Yeah so last quarter we handled almost 4,200 return-related calls. That's like 40% of total call volume. A huge chunk of those are people just asking "what's the status of my return?" — super low value, super repetitive.

**Sarah (PM):** Exactly. So if we can deflect even half of those... huge win. But leadership also wants this before the holiday season so we're looking at — what — 6 weeks? Maybe 8?

**Dev (Eng Lead):** [laughs] Eight weeks is aggressive. We'd have to scope this really tightly. What does "self-service" even mean here — are we talking a full portal with account login? Or just a link in a confirmation email?

**Sarah (PM):** I think... both? Like customers should be able to go to a URL, log in, see their orders, initiate a return, and track it. The basics.

**Priya (Support):** One thing I keep hearing from customers is they don't know what's eligible. Like they call and they're upset because they want to return something 45 days old and our policy is 30 days. It would be really nice if the system just... told them upfront if something is eligible.

**Marcus (BA):** That's a good one, I'll note that. So return eligibility validation as part of the flow.

**Dev (Eng Lead):** We'd need to integrate with the order management system to pull order history. That's an API call — it's doable but adds complexity. Also — who's handling the refund processing? Are we initiating refunds through the portal or just authorizations?

**Sarah (PM):** Just initiating. Finance still wants to review anything over... I don't know, some threshold. We should figure that out.

**Marcus (BA):** So some kind of approval workflow for high-value returns?

**Sarah (PM):** Probably, yeah. But maybe that's v2. Let's not let it block the MVP.

**Dev (Eng Lead):** What about return shipping? Are we generating labels?

**Priya (Support):** Customers definitely ask about that. Right now we email them a label separately and it's super manual.

**Sarah (PM):** Let's say label generation is a stretch goal. Not blocking MVP.

**Dev (Eng Lead):** Okay. What about items that aren't returnable — final sale, digital goods? We need rules for that.

**Priya (Support):** Yes — that's a huge source of frustration. Customers try to return things they can't and then they're angry when we say no.

**Marcus (BA):** I'll add "non-returnable item handling" to the list.

**Sarah (PM):** Also — the portal needs to be fast. Like, it needs to feel snappy. Customers shouldn't have to wait around.

**Marcus (BA):** [notes: vague performance requirement — need to define "fast"]

**Dev (Eng Lead):** We should also think about mobile. Lot of our customers are on phones.

**Sarah (PM):** Yeah, mobile-responsive at minimum.

**Marcus (BA):** Any accessibility requirements?

**Sarah (PM):** WCAG 2.1, I'd assume. We have that in most of our other products.

**Dev (Eng Lead):** One more thing — audit trail. We're going to need a record of every return request, status change, who touched it. Finance and legal will want that.

**Sarah (PM):** Good catch. Yep, that's a hard requirement.

---

## Open Questions / Action Items

- [ ] **Marcus:** Define "fast" — what's the acceptable page load / response time SLA?
- [ ] **Sarah:** Confirm refund threshold for manual approval (Finance to advise)
- [ ] **Dev:** Assess OMS integration complexity; estimate story points
- [ ] **Sarah:** Confirm holiday deadline — is it Nov 30 cutoff or Dec 15?
- [ ] **Priya:** Pull top 10 "reason for call" categories from last quarter's support data
- [ ] **Marcus:** Document non-returnable item categories from current policy doc

---

## Rough Feature List (from discussion)

1. Customer login / authentication (existing SSO?)
2. View order history
3. Initiate a return request
4. Return eligibility validation (30-day window, item type rules)
5. Return status tracking (submitted → approved → shipped → refunded)
6. Non-returnable item messaging
7. Audit trail / event log
8. Mobile-responsive UI
9. WCAG 2.1 accessibility
10. [Stretch] Shipping label generation
11. [V2] High-value return approval workflow
