# Business Analyst Prompts — Returns Portal Webinar
**Persona:** Business Analyst (BA)  
**Primary Goals:** Extract requirements from raw input, compare document versions, refine vague requirements into well-formed user stories, and package the results into a strong BA deliverable.  
**Acts Covered:** Act 1 (Discovery & Requirements), Act 2 (Refinement)

**Standalone demo framing:** These prompts support a self-contained BA demo inside the Returns Portal scenario. They are designed to work directly from BA inputs without depending on outputs from other persona demos.

---

## Prompt 1: Meeting Notes → User Stories
**Demo Act:** Act 1 — Discovery & Requirements  
**What it does:** Transforms a messy stakeholder meeting transcript into structured user stories with acceptance criteria and open questions flagged.

```
I have raw notes from a stakeholder discovery meeting for a new feature. 
Please analyze these notes and produce:
1. A list of user stories in the format "As a [persona], I want [goal], so that [benefit]"
2. Draft acceptance criteria for each story (use bullet points)
3. A list of open questions that need resolution before development can begin
4. Any contradictions or gaps you identified in the notes

Here are the meeting notes:
[paste contents of scenario/meeting-notes.md]
```

---

## Prompt 2: Requirement Extraction & Categorization
**Demo Act:** Act 1 — Discovery & Requirements  
**What it does:** Pulls structured requirements from unstructured notes and categorizes them by type (functional, non-functional, constraint, out-of-scope).

```
From the following stakeholder meeting notes, extract and categorize all requirements into:
- Functional requirements (what the system must do)
- Non-functional requirements (performance, security, accessibility, etc.)
- Constraints (hard limits: time, budget, policy)
- Items explicitly called out as out of scope

Format each requirement as a single, unambiguous statement starting with "The system shall..." or "The system should..." 
Flag any requirements that are too vague to be actionable.

[paste contents of scenario/meeting-notes.md]
```

---

## Prompt 3: Document Comparison — Requirements v1 vs v2
**Demo Act:** Act 1 — Discovery & Requirements  
**What it does:** Identifies changes between two versions of a requirements document and surfaces the implications of each change. This is the core "document comparison" workflow BAs use with Confluence exports.

```
I have two versions of a requirements document for the same feature. 
Please compare them and produce:
1. A summary table of every change (added, removed, modified, clarified)
2. For each change, note whether it: adds scope, reduces scope, or clarifies existing scope
3. Identify any changes that could affect QA test coverage
4. Identify any changes that could create integration or technical complexity
5. Flag any requirements in v2 that are still vague or missing acceptance criteria

--- REQUIREMENTS v1 ---
[paste contents of scenario/requirements-v1.md]

--- REQUIREMENTS v2 ---
[paste contents of scenario/requirements-v2.md]
```

---

## Prompt 4: Vague Requirement → Well-Formed Story (Refinement Loop)
**Demo Act:** Act 2 — Refinement  
**What it does:** Takes a single vague requirement and uses Copilot as a collaborator to ask clarifying questions, then rewrites it into a well-formed, testable user story.

```
I have a vague requirement that I need to refine. Please help me by:
1. Identifying what makes this requirement ambiguous or hard to test
2. Asking me 3-5 clarifying questions I should answer before we proceed
3. After I answer the questions, rewrite it as a well-formed user story with clear acceptance criteria

The vague requirement is:
"The system should be fast and responsive. Customers should not experience long load times."
```

---

## Prompt 5: Acceptance Criteria Gap Analysis
**Demo Act:** Act 1 — Discovery & Requirements  
**What it does:** Reviews a requirements document and identifies which requirements are missing acceptance criteria, then drafts suggested criteria for them.

```
Review the following requirements document and:
1. Identify all requirements that are missing acceptance criteria
2. For each one, draft 3-5 testable acceptance criteria
3. Flag any requirements where the existing acceptance criteria are too vague to be testable

[paste contents of scenario/requirements-v1.md]
```

---

## Prompt 6: Stakeholder-Friendly Requirement Summary
**Demo Act:** Act 1 — Discovery & Requirements  
**What it does:** Translates a technical requirements document into a plain-language executive summary suitable for sharing with non-technical stakeholders.

```
I need to share a summary of these requirements with non-technical stakeholders 
(VP of Customer Experience, Head of Support Operations). 
Please write a one-page plain-language summary that:
- Describes what the feature does in business terms (no jargon)
- Highlights the customer benefits
- Notes any open decisions that need executive input
- Flags any scope or timeline risks

[paste contents of scenario/requirements-v2.md]
```

---

## Prompt 7: RACI / Stakeholder Responsibility Mapping
**Demo Act:** Act 1 — Discovery & Requirements  
**What it does:** Derives a RACI matrix from requirements and meeting notes to clarify ownership across teams.

```
Based on the following meeting notes and requirements, draft a RACI matrix 
(Responsible, Accountable, Consulted, Informed) for the key decisions and deliverables 
in this feature. Infer team names from the context of the discussion.

Stakeholders mentioned: PM (Sarah), Engineering Lead (Dev), Customer Support Rep (Priya), BA (Marcus)

[paste contents of scenario/meeting-notes.md]
```
