# Copilot for Non-Developer Roles 🚀
**A workshop kit for GitHub Copilot featuring standalone demos for Business Analysts, Product Managers, Systems Analysts, and QA**

This repository is a self-contained workshop kit built around a shared business scenario: a **Customer Self-Service Returns Portal**. Each lab uses the same general feature theme, but every persona demo is designed to stand on its own. That means you can run the Business Analyst, Product Manager, Systems Analyst, or QA demo independently without needing outputs from the others.

---

## 📋 Workshop Overview

| Segment | Personas in Spotlight | Agenda Summary |
|---------|----------------------|----------------|
| **Business Analyst Demo** | 👤 BA | Turn messy meeting notes and draft requirements into structured user stories, change analysis, and clearer acceptance criteria. |
| **Product Manager / PO Demo** | 📊 PM/PO | Turn backlog and approved requirements into roadmap framing, sprint reporting, launch messaging, and executive updates. |
| **Systems Analyst Demo** | 🔧 Systems Analyst | Explain code and data structures in business language, surface technical risks, and draft lightweight design artifacts. |
| **QA / Test Demo** | 🧪 QA | Convert requirements and API behavior into test cases, test plans, bug hypotheses, and risk-based validation. |
---

## 🗂️ Table of Contents

- [`business-analyst-lab/`](#business-analyst-lab) — BA lab guide, prompts, and requirements docs
- [`product-manager-lab/`](#product-manager-lab) — PM/PO lab guide, prompts, backlog, and requirements
- [`systems-analyst-lab/`](#systems-analyst-lab) — Systems Analyst lab guide, prompts, requirements, API, and SQL model
- [`qa-test-lab/`](#qa-test-lab) — QA lab guide, prompts, and requirements

---

## 🏗️ How to Use This Repo

This repo is a **role-based workshop kit**. Here's the easiest way to use it:

1. Choose the persona demo you want to run.
2. Open that lab's numbered walkthrough file first.
3. Open the matching persona prompt file and the referenced scenario artifacts in the same folder.
4. Run the prompts in Copilot Chat and use the follow-up questions in the lab guide to deepen the demo.

Each lab is self-contained, so you can present them in any order.

---

## 👥 Persona Legend

| Icon | Persona | Primary Focus | Acts |
|------|---------|---------------|------|
| 👤 | **Business Analyst (BA)** | Requirements extraction, doc comparison, refinement | Discovery, refinement |
| 📊 | **Product Manager / PO** | Roadmap planning, stakeholder communication, release framing | Planning, communication |
| 🔧 | **Systems Analyst (SA)** | Code explanation, ADR drafting, technical bridging | Translation, technical analysis |
| 🧪 | **QA / Test Engineer** | Test case generation, test planning, bug triage | Validation, risk assessment |

---

## business-analyst-lab/

Standalone BA demo for turning messy discovery inputs into a structured requirements package.

| File | Description | Used In |
|------|-------------|---------|
| [business-analyst-lab/01-business-analyst-lab.md](business-analyst-lab/01-business-analyst-lab.md) | Step-by-step BA lab guide | Primary walkthrough |
| [business-analyst-lab/business-analyst.md](business-analyst-lab/business-analyst.md) | BA prompt library | Prompt source |
| [business-analyst-lab/requirements-v1.md](business-analyst-lab/requirements-v1.md) | First-draft requirements doc | Comparison and refinement |
| [business-analyst-lab/requirements-v2.md](business-analyst-lab/requirements-v2.md) | Revised requirements doc | Comparison and stakeholder summary |

---

## product-manager-lab/

Standalone PM/PO demo for turning backlog and requirements into delivery and communication artifacts.

| File | Description | Used In |
|------|-------------|---------|
| [product-manager-lab/02-product-manager-lab.md](product-manager-lab/02-product-manager-lab.md) | Step-by-step PM lab guide | Primary walkthrough |
| [product-manager-lab/product-manager.md](product-manager-lab/product-manager.md) | PM/PO prompt library | Prompt source |
| [product-manager-lab/backlog-issues.md](product-manager-lab/backlog-issues.md) | Mock GitHub issue backlog | Roadmap, sprint status, release notes |
| [product-manager-lab/requirements-v2.md](product-manager-lab/requirements-v2.md) | Approved requirements doc | Scope validation and launch framing |

---

## systems-analyst-lab/

Standalone Systems Analyst demo for translating requirements and implementation details into business-readable technical insight.

| File | Description | Used In |
|------|-------------|---------|
| [systems-analyst-lab/03-systems-analyst-lab.md](systems-analyst-lab/03-systems-analyst-lab.md) | Step-by-step Systems Analyst lab guide | Primary walkthrough |
| [systems-analyst-lab/systems-analyst.md](systems-analyst-lab/systems-analyst.md) | Systems Analyst prompt library | Prompt source |
| [systems-analyst-lab/requirements-v2.md](systems-analyst-lab/requirements-v2.md) | Approved requirements doc | Technical risk and flow analysis |
| [systems-analyst-lab/sample-code/returns-api.py](systems-analyst-lab/sample-code/returns-api.py) | FastAPI sample implementation | Plain-English code explanation, sequence flow |
| [systems-analyst-lab/sample-code/data-model.sql](systems-analyst-lab/sample-code/data-model.sql) | PostgreSQL schema | Data-model explanation and ADR context |

---

## qa-test-lab/

Standalone QA demo for turning requirements and API behavior into test coverage and release confidence.

| File | Description | Used In |
|------|-------------|---------|
| [qa-test-lab/04-qa-test-lab.md](qa-test-lab/04-qa-test-lab.md) | Step-by-step QA lab guide | Primary walkthrough |
| [qa-test-lab/qa-test.md](qa-test-lab/qa-test.md) | QA prompt library | Prompt source |
| [qa-test-lab/requirements-v2.md](qa-test-lab/requirements-v2.md) | Approved requirements doc | Test planning |

---

## Shared Scenario Theme

All four labs use the same broad business context: a **Customer Self-Service Returns Portal**. The artifacts are tailored per persona, but the theme is intentionally consistent so you can mix and match demos without re-explaining the product each time.

---

## Suggested Starting Points

- Want a discovery-focused demo? Start with [business-analyst-lab/01-business-analyst-lab.md](business-analyst-lab/01-business-analyst-lab.md)
- Want a planning and stakeholder-communication demo? Start with [product-manager-lab/02-product-manager-lab.md](product-manager-lab/02-product-manager-lab.md)
- Want a technical translation demo without writing code? Start with [systems-analyst-lab/03-systems-analyst-lab.md](systems-analyst-lab/03-systems-analyst-lab.md)
- Want a validation and testing demo? Start with [qa-test-lab/04-qa-test-lab.md](qa-test-lab/04-qa-test-lab.md)
