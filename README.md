# From Idea to Release with Copilot 🚀
**A 1-hour webinar kit for GitHub Copilot — prompt library, scenario content, and pre-generated example outputs**

This repository is a self-contained demo kit for a 60-minute webinar that follows a single feature scenario — a **Customer Self-Service Returns Portal** — from stakeholder meeting to production release. Every demo is grounded in the same artifacts, so the narrative threads together across all four acts and four personas.

---

## 📋 60-Minute Agenda

| Segment | Personas in Spotlight | Agenda Summary |
|---------|----------------------|----------------|
| **Welcome & Scene Setting** | All | Introduce the shared returns-portal scenario, explain how the four personas connect across the webinar, and set expectations for how each act builds on the same source artifacts. |
| **Act 1: Discovery & Requirements** | 👤 BA, 📊 PM/PO | The BA turns messy meeting notes and draft requirements into structured stories, comparisons, and clear acceptance criteria, while the PM/PO converts backlog and requirement inputs into priorities, roadmap framing, and kickoff-ready feature direction. |
| Bridge Moment | All | Pause to connect discovery outputs to the next act, showing how clarified requirements become inputs for technical translation and implementation planning. |
| **Act 2: Translation & Technical Bridging** | 🔧 Systems Analyst, 👤 BA | The Systems Analyst explains code and data structures in business language, surfaces technical risks, and drafts architecture decisions, while the BA continues refining vague requirements into testable, implementation-ready stories. |
| Bridge Moment | All | Reframe the refined requirements and technical context as the basis for validation, highlighting what QA and cross-functional reviewers now need to inspect. |
| **Act 3: Quality & Validation** | 🧪 QA, 🔧 Systems Analyst | QA transforms acceptance criteria and code behavior into test cases, plans, and risk-based coverage, while the Systems Analyst helps non-developers understand code changes, business impact, and where validation should focus. |
| Bridge Moment | All | Connect validation outputs to launch readiness by showing how tested functionality and clarified risks feed stakeholder communication and release materials. |
| **Act 4: Communication & Documentation** | 📊 PM/PO, All | The PM/PO turns completed work into sprint reporting, release notes, stakeholder updates, and support-ready documentation, while the broader team ties the full story together from idea to release. |
| **Q&A & Wrap-Up** | All | Recap what each persona contributed, reinforce how the shared artifacts support every act, and close with audience questions and takeaways. |

---

## 🗂️ Table of Contents

- [`scenario/`](#scenario) — Shared feature artifacts (meeting notes, requirements, code, backlog)
- [`prompts/`](#prompts) — Curated Copilot prompts organized by persona
- [`outputs/`](#outputs) — Pre-generated example outputs (fallback for live demos)

---

## 🏗️ How to Use This Repo

This repo is a **prompt library + scenario kit**. Here's how the pieces fit together:

1. **Before the webinar:** Familiarize yourself with the `scenario/` files — these are the raw inputs you'll paste into Copilot Chat during live demos.
2. **During the webinar:** Open the relevant `prompts/` file for the current act. Copy a prompt, paste the referenced scenario file content, and run it live.
3. **If a live demo stumbles:** Open the matching file in `outputs/` — these are pre-generated examples of what Copilot typically produces. Use them as a seamless fallback.
4. **After the webinar:** Share this repo with attendees as a take-home prompt library.

> **Tip:** The `outputs/` files are also great for preview screenshots or slide backgrounds during your intro.

---

## 👥 Persona Legend

| Icon | Persona | Primary Focus | Acts |
|------|---------|---------------|------|
| 👤 | **Business Analyst (BA)** | Requirements extraction, doc comparison, refinement | Act 1, Act 2 |
| 🔧 | **Systems Analyst (SA)** | Code explanation, ADR drafting, technical bridging | Act 2, Act 3 |
| 📊 | **Product Manager / PO** | Roadmap planning, stakeholder comms, release docs | Act 1, Act 4 |
| 🧪 | **QA / Test Engineer** | Test case generation, PR analysis, bug triage | Act 3 |

---

## scenario/

The shared feature scenario — a **Customer Self-Service Returns Portal** — provides all the raw inputs for demos.

| File | Description | Used In |
|------|-------------|---------|
| [`scenario/meeting-notes.md`](scenario/meeting-notes.md) | Raw stakeholder meeting transcript with multiple speakers, vague asks, and open questions | Act 1 |
| [`scenario/requirements-v1.md`](scenario/requirements-v1.md) | First-draft requirements doc (some vague, some well-formed, some missing ACs) | Act 1 |
| [`scenario/requirements-v2.md`](scenario/requirements-v2.md) | Revised requirements with reworded reqs, new req, removed req, full ACs | Act 1 |
| [`scenario/backlog-issues.md`](scenario/backlog-issues.md) | ~10 mock GitHub Issues (stories, bugs, tasks at various states) | Act 1, Act 4 |
| [`scenario/sample-code/returns-api.py`](scenario/sample-code/returns-api.py) | FastAPI app with POST/GET/PATCH endpoints and business logic | Act 2, Act 3 |
| [`scenario/sample-code/data-model.sql`](scenario/sample-code/data-model.sql) | PostgreSQL schema with constraints, indexes, and audit log | Act 2 |

---

## prompts/

Curated prompts for each persona. Each file contains 6–8 prompts with: the prompt text, what it does, and which demo/act it supports.

| File | Persona | Demos Covered |
|------|---------|---------------|
| [`prompts/business-analyst.md`](prompts/business-analyst.md) | 👤 BA | Meeting notes → user stories, doc comparison, requirement refinement |
| [`prompts/systems-analyst.md`](prompts/systems-analyst.md) | 🔧 SA | Code explanation, ADR drafting, technical bridging, PR risk assessment |
| [`prompts/product-manager.md`](prompts/product-manager.md) | 📊 PM/PO | Roadmap brief, sprint status, release notes, stakeholder email |
| [`prompts/qa-test.md`](prompts/qa-test.md) | 🧪 QA | Test case generation, Gherkin scenarios, bug triage, PR risk assessment |

---

## outputs/

Pre-generated example outputs. Use these as fallbacks during live demos or as preview assets for slides.

| File | Description | Generated From |
|------|-------------|----------------|
| [`outputs/user-stories.md`](outputs/user-stories.md) | User stories extracted from meeting notes | BA Prompt 1 + `meeting-notes.md` |
| [`outputs/test-cases.md`](outputs/test-cases.md) | Manual test cases from acceptance criteria | QA Prompt 1 + REQ-004 ACs |
| [`outputs/adr-template.md`](outputs/adr-template.md) | Architecture Decision Record: audit log design | SA Prompt 3 + design discussion |
| [`outputs/release-notes.md`](outputs/release-notes.md) | Customer-facing + internal changelog | PM Prompt 3 + requirements + backlog |
| [`outputs/doc-comparison.md`](outputs/doc-comparison.md) | Side-by-side analysis of requirements v1 vs v2 | BA Prompt 3 + both requirements docs |
| [`outputs/sprint-status.md`](outputs/sprint-status.md) | Sprint status report with blockers and metrics | PM Prompt 2 + `backlog-issues.md` |
