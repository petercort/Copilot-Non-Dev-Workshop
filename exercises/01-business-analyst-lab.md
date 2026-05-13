# Lab 1 (45–60 min) — Business Analyst: From messy notes to testable requirements

**Goal:** Practice using Copilot Chat to turn raw stakeholder input into artifacts a delivery team can execute on.

## Materials (open these files)

- `prompts/business-analyst.md`
- `scenario/meeting-notes.md`
- `scenario/requirements-v1.md`
- `scenario/requirements-v2.md`
- Optional fallback examples: `outputs/user-stories.md`, `outputs/doc-comparison.md`

## Part A (15–20 min) — Meeting notes → user stories

1. In Copilot Chat, run **BA Prompt 1: Meeting Notes → User Stories** from `prompts/business-analyst.md`.
2. Review the output and improve it with 2 follow-ups:
   - “Rewrite the acceptance criteria so each bullet is objectively testable (no vague terms).”
   - “Add missing edge cases and list assumptions you had to make.”

**Checkpoint:** You have 5–10 user stories, each with acceptance criteria and open questions.

## Part B (10–15 min) — Tighten one vague requirement (refinement loop)

1. Pick one story/requirement that still feels ambiguous (performance, eligibility rules, mobile, audit trail).
2. Run **BA Prompt 4: Vague Requirement → Well-Formed Story (Refinement Loop)**.
3. Answer Copilot’s clarifying questions in chat, then ask Copilot to rewrite the story + acceptance criteria.

**Checkpoint:** One story has crisp acceptance criteria and explicit definitions/thresholds.

## Part C (15–20 min) — Compare requirements v1 vs v2 (scope & test impact)

1. Run **BA Prompt 3: Document Comparison — Requirements v1 vs v2** using `scenario/requirements-v1.md` and `scenario/requirements-v2.md`.
2. Follow up with:
   - “Which changes increase QA effort the most, and why?”
   - “List 5 questions we should ask Support/Finance/Engineering because of these changes.”

**Checkpoint:** You have a change table + the implications (scope, QA, technical complexity).

## Wrap-up (5 min) — Your deliverable

Ask Copilot:
- “Produce a 1-page summary I can send to stakeholders: what changed, what’s decided, what’s still open.”

