# Systems Analyst Prompts — Returns Portal Webinar
**Persona:** Systems Analyst (SA)  
**Primary Goals:** Translate between technical and non-technical communication, explain code to stakeholders, draft Architecture Decision Records (ADRs), and bridge the gap between approved requirements and technical implementation.  
**Acts Covered:** Act 2 (Translation & Technical Bridging), Act 3 (Quality support)

**Standalone demo framing:** These prompts support a self-contained Systems Analyst demo inside the Returns Portal scenario. They work directly from the requirements, API, and data model provided in this lab.

---

## Prompt 1: Code → Plain-English Explanation
**Demo Act:** Act 2 — Translation & Technical Bridging  
**What it does:** Explains the logic of an API or data model in non-technical language suitable for business stakeholders — no coding required from the SA.

```
Explain the following Python API code to a non-technical business stakeholder. 
Your explanation should:
- Describe what each endpoint does in plain English (what a user or system can DO with it)
- Explain the business rules embedded in the code (e.g. return windows, status transitions)
- Identify any constraints or limitations that a BA or PM should be aware of
- Use zero technical jargon; replace terms like "endpoint", "payload", and "HTTP" with plain equivalents

[paste contents of scenario/sample-code/returns-api.py]
```

---

## Prompt 2: Data Model → Business Context Explanation
**Demo Act:** Act 2 — Translation & Technical Bridging  
**What it does:** Explains a database schema in terms of the business entities and relationships it represents — ideal for SA to use when communicating with stakeholders who need to understand what data exists.

```
I have a database schema for a returns portal. 
Explain this schema to a business analyst or product manager who has no SQL knowledge. 
Focus on:
- What real-world entities each table represents
- How the tables relate to each other (in plain English — no "foreign key" language)
- What information the business can report on or query from this data
- Any business rules enforced by the schema (constraints, data types, immutability)

[paste contents of scenario/sample-code/data-model.sql]
```

---

## Prompt 3: ADR Drafting from Technical Discussion
**Demo Act:** Act 2 — Translation & Technical Bridging  
**What it does:** Generates a structured Architecture Decision Record from a discussion thread or meeting notes, capturing the context, decision, alternatives considered, and consequences.

```
Based on the following technical discussion about the returns portal, draft an 
Architecture Decision Record (ADR) using the following template:

# ADR-[number]: [Short Title]
## Status: [Proposed / Accepted / Deprecated / Superseded]
## Context: (What is the issue that we're seeing that is motivating this decision?)
## Decision: (What is the change that we're proposing / have agreed to implement?)
## Alternatives Considered: (What other options were evaluated?)
## Consequences: (What becomes easier or more difficult because of this change?)

Technical discussion to analyze:
The team debated whether to store return request events in the main application database 
vs. a separate audit log service. Dev argued for a separate service for scalability; 
Marcus raised concerns about complexity and the 7-year retention requirement being harder 
to enforce across two systems. Sarah noted Finance just wants a queryable record, 
not a real-time stream. The team agreed to use an immutable audit log table in the 
primary database for MVP, revisiting for v2 if write volume requires streaming.
```

---

## Prompt 4: Requirement Refinement — Vague to Technical
**Demo Act:** Act 2 — Translation & Technical Bridging  
**What it does:** Collaborates with the SA to bridge a vague business requirement into a technically-specified story with constraints, edge cases, and implementation notes.

```
I'm a systems analyst helping bridge requirements between a business stakeholder and the engineering team.

Take this business requirement and produce a technically-enriched version:
- Add implementation notes (what system components are likely involved)
- Surface edge cases the engineering team will need to handle
- Identify integration dependencies (other systems, APIs, services)
- Suggest how you'd verify this requirement is met (test angles)

Business requirement:
"Customers shall be able to view their recent order history from within the portal."

Technical context: The application integrates with an OMS REST API 
(GET /api/v2/orders?customer_id={id}). Auth is via Okta SSO.
```

---

## Prompt 5: PR / Code Change Plain-Language Summary
**Demo Act:** Act 3 — Quality & Validation (SA support)  
**What it does:** Summarizes a pull request diff in plain English so a Systems Analyst or QA engineer can assess risk and coverage without reading raw code.

```
Explain the following code changes in plain English for a non-developer reviewer. 
For each changed area:
1. What was the old behavior?
2. What is the new behavior?
3. What is the business impact of this change?
4. What could go wrong — what should a QA engineer focus their testing on?

[paste the diff or a description of the PR changes]
```

---

## Prompt 6: Technical Risk Assessment from Requirements
**Demo Act:** Act 2 — Translation & Technical Bridging  
**What it does:** Reviews a requirements document from a technical lens and surfaces integration risks, scalability concerns, and ambiguous technical assumptions.

```
Review the following requirements document from a Systems Analyst perspective. 
Identify:
1. Requirements with hidden technical complexity that the team may be underestimating
2. Integration dependencies that need to be confirmed before sprint planning
3. Requirements that are likely to change once engineering digs in (fragile assumptions)
4. Any technical risks that should be added to the project risk register

[paste contents of scenario/requirements-v2.md]
```

---

## Prompt 7: Sequence Diagram Description
**Demo Act:** Act 2 — Translation & Technical Bridging  
**What it does:** Generates a plain-language or Mermaid-syntax sequence diagram description from an API and requirements, useful for technical design documentation.

```
Based on the following API and requirements, describe the step-by-step sequence of events 
when a customer submits a return request. Include all system actors (browser, API, OMS, database).
Then generate a Mermaid sequence diagram representing this flow.

[paste contents of scenario/sample-code/returns-api.py]

The system also calls an external OMS API to validate order ownership before accepting the return.
```
