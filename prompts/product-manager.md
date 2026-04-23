# Product Manager / Product Owner Prompts — Returns Portal Webinar
**Persona:** Product Manager / Product Owner (PM/PO)  
**Primary Goals:** Roadmap planning, stakeholder communication, sprint reporting, release documentation, and translating backlog data into decision-ready briefs.  
**Acts Covered:** Act 1 (Roadmap & Prioritization), Act 4 (Communication & Documentation)

---

## Prompt 1: Backlog → Stakeholder-Ready Roadmap Brief
**Demo Act:** Act 1 — Discovery & Requirements  
**What it does:** Transforms a raw list of GitHub Issues into a prioritized, stakeholder-ready roadmap brief using effort and impact language. Core PM/PO workflow.

```
I have a backlog of GitHub Issues for a new feature. 
Please produce a stakeholder-ready roadmap brief that includes:
1. An executive summary (3-4 sentences) of what the feature delivers and why it matters
2. A prioritized feature breakdown grouped by sprint/phase, with effort and business impact noted
3. Key risks and dependencies that could affect the timeline
4. What success looks like — define 2-3 measurable outcomes for launch

Here are the issues:
[paste contents of scenario/backlog-issues.md]
```

---

## Prompt 2: Sprint Status Report from GitHub Issues
**Demo Act:** Act 4 — Communication & Documentation  
**What it does:** Generates a formatted sprint status report from backlog issues — surfaces what's done, in progress, blocked, and at risk. Saves 30+ min of manual reporting.

```
Generate a sprint status report from the following GitHub Issues. Format it as:

## Sprint Status Report — [Feature Name]
**Sprint:** [infer from labels]  
**Report Date:** [today]

### Summary
[2-3 sentence summary of sprint health]

### Completed This Sprint
[list done items]

### In Progress
[list with any blockers noted]

### Not Started / At Risk
[list items not yet started; flag any with missing assignees or high story points]

### Blockers & Decisions Needed
[extract any open questions or blockers from descriptions]

Here are the issues:
[paste contents of scenario/backlog-issues.md]
```

---

## Prompt 3: Release Notes Draft
**Demo Act:** Act 4 — Communication & Documentation  
**What it does:** Drafts customer-facing release notes from requirements and backlog issues. Produces both a technical changelog and a customer-friendly summary.

```
Write release notes for the Customer Self-Service Returns Portal feature. 
Produce two versions:

1. **Customer-facing version** (friendly, benefit-focused, no jargon — max 150 words)
2. **Internal/developer changelog** (technical, includes specific changes, references issue numbers)

Base these on the completed features described in the requirements and backlog below.

[paste contents of scenario/requirements-v2.md]

[paste contents of scenario/backlog-issues.md]
```

---

## Prompt 4: Stakeholder Update Email
**Demo Act:** Act 4 — Communication & Documentation  
**What it does:** Drafts a concise stakeholder update email from sprint data — keeps leadership informed without requiring the PM to write from scratch.

```
Write a concise stakeholder update email for the Customer Self-Service Returns Portal.
The audience is VP-level: Head of Customer Experience and CFO. They care about:
- Are we on track?
- What value are we delivering?
- What do they need to decide or unblock?

Tone: confident, concise, no fluff. Max 200 words. 

Sprint context:
- Sprint 1 is 70% complete
- Authentication (issue #46) is done
- Return submission (issue #42) and OMS integration (issue #45) are in progress
- Bug #48 was just discovered affecting bundle orders — fix estimated at 3 story points
- Sprint 2 is planned but not started
- Holiday deadline is December 15
```

---

## Prompt 5: Feature Brief for Engineering Kickoff
**Demo Act:** Act 1 — Discovery & Requirements  
**What it does:** Synthesizes meeting notes and requirements into a one-page feature brief that Engineering can use at a kickoff meeting — saves the PM prep time.

```
Write a one-page feature brief for the engineering team kickoff for the 
Customer Self-Service Returns Portal. Include:
- Problem statement (why we're building this)
- Goals and non-goals
- Key user flows (as a numbered list)
- Open questions that need to be answered in the kickoff
- Success metrics

Use the following inputs:

[paste contents of scenario/meeting-notes.md]

[paste contents of scenario/requirements-v2.md]
```

---

## Prompt 6: Acceptance Criteria → Definition of Done Checklist
**Demo Act:** Act 1 — Discovery & Requirements  
**What it does:** Converts acceptance criteria from requirements into a Definition of Done checklist for the development team — bridges PM/Dev workflow.

```
Based on the following requirements document, create a Definition of Done (DoD) checklist 
for the development team. Include checks for:
- Functional completeness (feature works as specified)
- Test coverage (unit, integration, and manual test cases written)
- Accessibility (WCAG 2.1 AA)
- Performance (SLAs met per REQ-006)
- Documentation (release notes, API docs)
- Security (HTTPS, no PII in logs)

[paste contents of scenario/requirements-v2.md]
```

---

## Prompt 7: Knowledge Base Article Draft
**Demo Act:** Act 4 — Communication & Documentation  
**What it does:** Drafts a customer-facing help center article from requirements — useful for Support enablement ahead of a feature launch.

```
Write a customer-facing help center article explaining how to use the 
Customer Self-Service Returns Portal. The audience is customers (not technical).
Format it as:
- Title
- Short intro paragraph
- Step-by-step guide (numbered, with what to expect at each step)
- FAQ section (at least 5 questions based on common confusion points)
- "Still need help?" section linking to support

Base the content on the following requirements:
[paste contents of scenario/requirements-v2.md]
```
