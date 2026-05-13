# Lab 4 (45–60 min) — QA/Test: Turn requirements and implementation details into launch confidence

**Standalone demo focus:** In this demo, you work directly from the Returns Portal requirements and sample API behavior. It stands alone as a QA-focused exercise.

**Goal:** Practice using Copilot Chat to generate test artifacts, prioritize risk, and communicate bug hypotheses clearly.

## Materials (open these files)

- `prompts/qa-test.md`
- `scenario/requirements-v2.md`
- `scenario/sample-code/returns-api.py`
- Optional fallback example: `outputs/test-cases.md`

## End-of-lab outcome

By the end of this lab, you should have:

- targeted manual test cases for a critical requirement
- a broader test plan across the feature
- a bug triage analysis with likely root cause and regression tests
- a short list of highest-value staging checks before release

## Part A (10–15 min) — Acceptance criteria → manual test cases

1. Run **QA Prompt 1: Acceptance Criteria → Manual Test Cases** (use the AC in the prompt).
2. Follow up with:
   - “Add boundary tests for dates (exactly 30 days, 31 days) and for duplicate returns.”

**Checkpoint:** A test case table that includes happy-path, negative, and edge coverage for a core customer flow.

## Part B (15–20 min) — Full requirements → launch-focused test plan

1. Run **QA Prompt 2: Full Requirements → Test Plan** using `scenario/requirements-v2.md`.
2. Follow up with:
   - “Add a section for non-functional coverage (accessibility, performance, security) and what evidence we need.”

**Checkpoint:** A test plan organized by requirement with a clear view of where limited QA time should go first.

## Part C (15–20 min) — Bug triage using code and workflow context

1. Run **QA Prompt 4: Bug Report → Root Cause Hypothesis** using the bug report in the prompt and `scenario/sample-code/returns-api.py`.
2. Follow up with:
   - “Rewrite the root cause explanation for a PM (no jargon), then for an engineer (more technical).”
   - “Propose a minimal fix and the regression tests to add.”

**Checkpoint:** A clear root-cause hypothesis, reproduction framing, and regression test ideas that can go straight into defect follow-up.

## Wrap-up (5 min) — Final release-confidence view

Ask Copilot:
- “If we only have 30 minutes to validate this feature in staging, what 7 scenarios do we run and why?”

Optional follow-up:
- “Turn that into a go/no-go checklist for launch day, including what evidence Product and Engineering should provide.”

