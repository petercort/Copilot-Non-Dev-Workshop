# ADR-001: Use Immutable Audit Log Table in Primary Database for Return Request Events

*Pre-generated example output. Produced by: Copilot Chat using Prompt 3 from `prompts/systems-analyst.md`.*

---

**Status:** Accepted  
**Date:** 2024-11-22  
**Deciders:** Dev Patel (Engineering Lead), Marcus Chen (BA), Sarah Okafor (PM)  
**Consulted:** Finance, Legal

---

## Context

The Customer Self-Service Returns Portal requires a complete audit trail of all return request events (creation, status changes, administrative overrides, refund initiations). This is a hard compliance requirement: Finance and Legal mandate a 7-year retention period and the ability to query historical events.

During technical design discussions, two approaches were evaluated:

1. **Embedded audit table in the primary application database** — A dedicated `return_audit_log` table in PostgreSQL with immutability enforced via database rules.
2. **Separate audit log microservice** — An event-streaming service (e.g., Kafka + Elasticsearch or a dedicated audit service) that receives events from the returns application and stores them independently.

The discussion surfaced a key tension: Engineering preferred the microservice approach for scalability and separation of concerns. Business stakeholders (Finance, PM) prioritized queryability, data co-location with operational records, and implementation simplicity for the MVP timeline.

---

## Decision

We will implement audit logging as an **immutable `return_audit_log` table in the primary PostgreSQL database** for the MVP.

Immutability will be enforced at the database level using `CREATE RULE` statements that make `UPDATE` and `DELETE` operations no-ops on the audit table. Application code will only ever INSERT into this table.

---

## Alternatives Considered

### Option 2: Separate Audit Log Microservice
**Pros:**
- Clean separation of concerns; audit system can scale independently
- Enables real-time event streaming for future use cases (analytics dashboards, alerting)
- Audit records are isolated from application database failures

**Cons:**
- Significantly higher implementation complexity for an MVP with a 6–8 week timeline
- Cross-system queries (joining operational data with audit data) require additional tooling
- Two systems to maintain, monitor, and secure
- 7-year retention enforcement is harder to audit across a distributed system

**Why rejected:** The Finance team confirmed their primary need is a queryable record alongside operational data — not a real-time stream. The added complexity would risk the holiday deadline. This can be revisited post-MVP.

### Option 3: Application-Level Soft Deletes + Update History in Main Tables
**Pros:**
- Simpler to implement (no separate table)

**Cons:**
- Mixes audit concerns with operational data model
- Harder to make truly immutable — application bugs could corrupt history
- Does not provide a clear, consistent audit event model

**Why rejected:** Doesn't meet the "immutable record" requirement from Legal.

---

## Consequences

### What becomes easier:
- Simple SQL queries join operational and audit data without cross-service calls
- 7-year retention can be managed with standard PostgreSQL partitioning or archiving
- Implementation is straightforward; no new infrastructure required for MVP
- Finance/Legal can be given read-only access to the audit table directly

### What becomes harder or requires future attention:
- If return request volume grows significantly (e.g., 10M+ events/year), audit table size may require partitioning or archiving strategy — **action item for v1.1 planning**
- Real-time event streaming (e.g., for a returns analytics dashboard) will require re-architecture if needed — defer to v2
- Engineering should monitor audit table row counts as part of quarterly database health reviews

---

## Implementation Notes

- Table schema defined in `scenario/sample-code/data-model.sql` (`return_audit_log`)
- INSERT to `return_audit_log` must occur within the same transaction as the status change — ensures consistency
- Application layer must never expose UPDATE or DELETE operations on this table
- Database-level rules (`no_update_audit`, `no_delete_audit`) serve as a safety net, not the primary control
