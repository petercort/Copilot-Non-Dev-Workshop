# Lab 3 (45–60 min) — Systems Analyst: Translate between business and technical worlds

**Goal:** Practice using Copilot Chat to explain technical artifacts in business language and produce lightweight design documentation.

## Materials (open these files)

- `prompts/systems-analyst.md`
- `scenario/sample-code/returns-api.py`
- `scenario/sample-code/data-model.sql`
- `scenario/requirements-v2.md`
- Optional fallback example: `outputs/adr-template.md`

## Part A (15–20 min) — Explain the API in plain English

1. Run **SA Prompt 1: Code → Plain-English Explanation** using `scenario/sample-code/returns-api.py`.
2. Follow up with:
   - “List business rules embedded in the code as ‘If/Then’ statements.”
   - “List what a QA/tester should verify, prioritized.”

**Checkpoint:** Stakeholder-friendly explanation + a testing focus list.

## Part B (10–15 min) — Explain the data model as business entities

1. Run **SA Prompt 2: Data Model → Business Context Explanation** using `scenario/sample-code/data-model.sql`.
2. Follow up with:
   - “List 5 questions a PM/BA should ask because of this model (retention, audit, privacy, reporting).”

**Checkpoint:** A plain-language data explanation plus implications.

## Part C (10–15 min) — Draft an ADR

1. Run **SA Prompt 3: ADR Drafting from Technical Discussion**.
2. Follow up with:
   - “Propose 2 alternatives not mentioned and explain why they might be rejected.”

**Checkpoint:** A usable ADR draft with context/decision/alternatives/consequences.

## Part D (5–10 min) — Sequence diagram

1. Run **SA Prompt 7: Sequence Diagram Description** using `scenario/sample-code/returns-api.py`.
2. Ask Copilot to output the Mermaid diagram and a 1-paragraph explanation.

