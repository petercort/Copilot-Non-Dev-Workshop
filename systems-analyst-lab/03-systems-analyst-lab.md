# Lab 3 (45–60 min) — Systems Analyst: Bridge approved scope to implementation reality

**Standalone demo focus:** In this demo, you work directly from the Returns Portal requirements, API, and data model. It is self-contained and does not require outputs from the BA or PM labs.

**Goal:** Practice using Copilot Chat to explain technical artifacts in business language and produce lightweight design documentation.

## Materials (open these files)

- `prompts/systems-analyst.md`
- `scenario/sample-code/returns-api.py`
- `scenario/sample-code/data-model.sql`
- `scenario/requirements-v2.md`
- Optional fallback example: `outputs/adr-template.md`

## End-of-lab deliverable

By the end of this lab, you should have a systems-analysis packet containing:

- a plain-English explanation of the API behavior
- a business explanation of the data model
- a draft ADR for a key design decision
- a sequence view of the return-submission flow

## Part A (15–20 min) — Explain the API in plain English

1. Run **SA Prompt 1: Code → Plain-English Explanation** using `scenario/sample-code/returns-api.py`.
2. Follow up with:
   - “List business rules embedded in the code as ‘If/Then’ statements.”
   - “List what a QA/tester should verify, prioritized.”

**Checkpoint:** Stakeholder-friendly explanation plus a prioritized list of business rules and testing focus areas.

## Part B (10–15 min) — Explain the data model as business entities

1. Run **SA Prompt 2: Data Model → Business Context Explanation** using `scenario/sample-code/data-model.sql`.
2. Follow up with:
   - “List 5 questions a PM/BA should ask because of this model (retention, audit, privacy, reporting).”

**Checkpoint:** A plain-language data explanation plus business implications around auditability, reporting, and policy enforcement.

## Part C (10–15 min) — Draft an ADR for a key implementation choice

1. Run **SA Prompt 3: ADR Drafting from Technical Discussion**.
2. Follow up with:
   - “Propose 2 alternatives not mentioned and explain why they might be rejected.”

**Checkpoint:** A usable ADR draft with context, decision, alternatives, and consequences the PM/Engineering lead can review quickly.

## Part D (5–10 min) — Sequence diagram for the return flow

1. Run **SA Prompt 7: Sequence Diagram Description** using `scenario/sample-code/returns-api.py`.
2. Ask Copilot to output the Mermaid diagram and a 1-paragraph explanation.

**Checkpoint:** You can now show a mixed audience exactly how the return request moves across browser, API, external systems, and database.

## Wrap-up (5 min) — Package your systems-analysis deliverable

Ask Copilot:
- “Summarize the top implementation risks, hidden assumptions, and validation points the team should focus on before release.”

