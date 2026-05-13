# Lab 2 (40–60 min) — Product Manager/PO: Turn requirements into a delivery plan and launch message

**Standalone demo focus:** In this demo, you work as a PM/PO using the Returns Portal backlog and requirements directly. It stands on its own without needing outputs from another lab.

**Goal:** Practice using Copilot Chat to turn requirements and backlog data into decision-ready PM artifacts.

## Materials (open these files)

- `prompts/product-manager.md`
- `scenario/backlog-issues.md`
- `scenario/requirements-v2.md`
- Optional fallback examples: `outputs/sprint-status.md`, `outputs/release-notes.md`

## End-of-lab deliverable

By the end of this lab, you should have a PM packet containing:

- a roadmap or phased delivery view
- a sprint status snapshot
- release notes for internal and external audiences
- an executive-ready summary of risks, dependencies, and decisions needed

## Part A (15–20 min) — Backlog + approved requirements → roadmap brief

1. Run **PM Prompt 1: Backlog → Stakeholder-Ready Roadmap Brief** using `scenario/backlog-issues.md`.
2. Follow up with:
   - “Reframe this as 2–3 phases with clear entry/exit criteria.”
   - “List top dependencies and what proof we need to de-risk them.”
   - “Cross-check this roadmap against the approved requirements and note anything not yet represented in the backlog.”

**Checkpoint:** A prioritized plan that a stakeholder can understand in <2 minutes.

## Part B (10–15 min) — Sprint status report with delivery risk

1. Run **PM Prompt 2: Sprint Status Report from GitHub Issues** using `scenario/backlog-issues.md`.
2. Follow up with:
   - “Make the ‘Blockers & Decisions Needed’ section explicit with an owner per item.”

**Checkpoint:** A clean status report with explicit delivery risk, ownership gaps, and decisions needed.

## Part C (10–20 min) — Release notes and launch framing (two audiences)

1. Run **PM Prompt 3: Release Notes Draft** using `scenario/requirements-v2.md` + `scenario/backlog-issues.md`.
2. Follow up with:
   - “Rewrite the customer-facing version to be shorter and more benefit-focused (max 100 words).”
   - “List what Support needs to know (top FAQs + pitfalls) in bullet points.”

**Checkpoint:** Release notes that separate customer value from internal technical detail and reflect what is truly launch-ready.

## Wrap-up (5 min) — Package your PM deliverable

Ask Copilot:
- “Write a 150–200 word VP-level update: on-track status, value, risks, and asks.”

Optional follow-up:
- “Create a launch-readiness summary: highest-risk flows, critical dependencies, and what must be proven before go-live.”

