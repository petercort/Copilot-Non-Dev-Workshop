# Lab 1 (45–60 min) — Business Analyst: Turn discovery into a build-ready feature brief

**Standalone demo focus:** In this demo, you work entirely from BA-style inputs for the Returns Portal scenario. You do not need outputs from any other lab to complete it.

**Goal:** Practice using Copilot Chat to turn raw stakeholder input into a clean, testable BA requirements package.

## Materials (open these files)

- `prompts/business-analyst.md`
- `scenario/meeting-notes.md`
- `scenario/requirements-v1.md`
- `scenario/requirements-v2.md`
- Optional fallback examples: `outputs/user-stories.md`, `outputs/doc-comparison.md`

## End-of-lab deliverable

By the end of this lab, you should have a mini BA packet containing:

- a prioritized set of user stories
- tighter acceptance criteria for at least one ambiguous area
- a v1 vs v2 change summary
- a short stakeholder summary of what is decided vs still open

## Part A (15–20 min) — Meeting notes → user stories

1. In Copilot Chat, run **BA Prompt 1: Meeting Notes → User Stories** from `prompts/business-analyst.md`.
2. Review the output and improve it with 2 follow-ups:
   - “Rewrite the acceptance criteria so each bullet is objectively testable (no vague terms).”
   - “Add missing edge cases and list assumptions you had to make.”

**Checkpoint:** You have 5–10 user stories, each with acceptance criteria, assumptions, and open questions.

## Part B (10–15 min) — Tighten one vague requirement (refinement loop)

1. Pick one story/requirement that still feels ambiguous (performance, eligibility rules, mobile, audit trail).
2. Run **BA Prompt 4: Vague Requirement → Well-Formed Story (Refinement Loop)**.
3. Answer Copilot’s clarifying questions in chat, then ask Copilot to rewrite the story + acceptance criteria.

**Checkpoint:** One story has crisp acceptance criteria, explicit thresholds, and fewer hidden assumptions for Engineering and QA.

## Part C (15–20 min) — Compare requirements v1 vs v2 (scope, delivery, and test impact)

1. Run **BA Prompt 3: Document Comparison — Requirements v1 vs v2** using `scenario/requirements-v1.md` and `scenario/requirements-v2.md`.
2. Follow up with:
   - “Which changes increase QA effort the most, and why?”
   - “List 5 questions we should ask Support/Finance/Engineering because of these changes.”

**Checkpoint:** You have a change table plus implications for scope, implementation effort, and test coverage.

## Wrap-up (5 min) — Package your BA deliverable

Ask Copilot:
- “Produce a 1-page Business Analyst summary: what changed, what’s decided, what’s still open, and what the riskiest requirement areas are.”

Optional follow-up:
- “Turn this into a stakeholder-ready BA brief with sections for scope, decisions, and open questions.”

