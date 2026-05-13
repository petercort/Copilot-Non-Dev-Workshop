# Lab 4 (45–60 min) — QA/Test: From acceptance criteria to coverage and bug triage

**Goal:** Practice using Copilot Chat to generate test artifacts, prioritize risk, and communicate bug hypotheses clearly.

## Materials (open these files)

- `prompts/qa-test.md`
- `scenario/requirements-v2.md`
- `scenario/sample-code/returns-api.py`
- Optional fallback example: `outputs/test-cases.md`

## Part A (10–15 min) — Acceptance criteria → manual test cases

1. Run **QA Prompt 1: Acceptance Criteria → Manual Test Cases** (use the AC in the prompt).
2. Follow up with:
   - “Add boundary tests for dates (exactly 30 days, 31 days) and for duplicate returns.”

**Checkpoint:** A test case table that includes happy/negative/edge coverage.

## Part B (15–20 min) — Full requirements → test plan

1. Run **QA Prompt 2: Full Requirements → Test Plan** using `scenario/requirements-v2.md`.
2. Follow up with:
   - “Add a section for non-functional coverage (accessibility, performance, security) and what evidence we need.”

**Checkpoint:** A test plan organized by requirement with risk focus.

## Part C (15–20 min) — Bug triage using code

1. Run **QA Prompt 4: Bug Report → Root Cause Hypothesis** using the bug report in the prompt and `scenario/sample-code/returns-api.py`.
2. Follow up with:
   - “Rewrite the root cause explanation for a PM (no jargon), then for an engineer (more technical).”
   - “Propose a minimal fix and the regression tests to add.”

**Checkpoint:** A clear hypothesis + reproduction + regression test ideas.

## Wrap-up (5 min) — Risk-based test pass

Ask Copilot:
- “If we only have 30 minutes to validate this feature in staging, what 7 scenarios do we run and why?”

