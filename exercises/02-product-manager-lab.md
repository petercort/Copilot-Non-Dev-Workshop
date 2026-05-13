# Lab 2 (40–60 min) — Product Manager/PO: From backlog to stakeholder communication

**Goal:** Practice using Copilot Chat to turn issue/backlog data into decision-ready PM artifacts.

## Materials (open these files)

- `prompts/product-manager.md`
- `scenario/backlog-issues.md`
- `scenario/requirements-v2.md`
- Optional fallback examples: `outputs/sprint-status.md`, `outputs/release-notes.md`

## Part A (15–20 min) — Backlog → roadmap brief

1. Run **PM Prompt 1: Backlog → Stakeholder-Ready Roadmap Brief** using `scenario/backlog-issues.md`.
2. Follow up with:
   - “Reframe this as 2–3 phases with clear entry/exit criteria.”
   - “List top dependencies and what proof we need to de-risk them.”

**Checkpoint:** A prioritized plan that a stakeholder can understand in <2 minutes.

## Part B (10–15 min) — Sprint status report

1. Run **PM Prompt 2: Sprint Status Report from GitHub Issues** using `scenario/backlog-issues.md`.
2. Follow up with:
   - “Make the ‘Blockers & Decisions Needed’ section explicit with an owner per item.”

**Checkpoint:** A clean status report (done / in-progress / at-risk / decisions).

## Part C (10–20 min) — Release notes (two audiences)

1. Run **PM Prompt 3: Release Notes Draft** using `scenario/requirements-v2.md` + `scenario/backlog-issues.md`.
2. Follow up with:
   - “Rewrite the customer-facing version to be shorter and more benefit-focused (max 100 words).”
   - “List what Support needs to know (top FAQs + pitfalls) in bullet points.”

**Checkpoint:** Release notes that separate customer value from internal technical detail.

## Wrap-up (5 min) — Executive update

Ask Copilot:
- “Write a 150–200 word VP-level update: on-track status, value, risks, and asks.”

