# QA / Test Engineer Prompts — Returns Portal Webinar
**Persona:** QA / Test Engineer  
**Primary Goals:** Generate test cases from requirements and user stories, analyze code changes for test coverage, triage bugs, and bridge the communication gap between development and QA.  
**Acts Covered:** Act 3 (Quality & Validation), Act 1 (contributing to acceptance criteria)

---

## Prompt 1: Acceptance Criteria → Manual Test Cases
**Demo Act:** Act 3 — Quality & Validation  
**What it does:** Transforms structured acceptance criteria into manual test cases (positive, negative, and edge cases) in a table format. The core QA workflow demo.

```
Generate manual test cases from the following acceptance criteria. 
For each acceptance criterion, produce:
- At least one positive/happy-path test case
- At least one negative test case
- Edge cases where applicable

Format as a markdown table with columns:
| Test Case ID | Description | Preconditions | Steps | Expected Result | Test Type |

Acceptance criteria to use (from REQ-004 — Return Eligibility Validation):
- Items outside the 30-day window display: "This item is no longer eligible for return (return window closed)"
- Final sale / digital items display: "This item is marked final sale and cannot be returned"
- Items on an existing return display: "A return request for this item is already in progress"
- Eligible items display a "Start Return" CTA
- Eligibility is re-validated server-side at submission (not just client-side)
```

---

## Prompt 2: Full Requirements → Test Plan
**Demo Act:** Act 3 — Quality & Validation  
**What it does:** Generates a structured test plan covering all requirements in a document — useful for sprint planning and estimating QA effort.

```
Create a QA test plan from the following requirements document. Include:
1. Test scope summary (what we are and aren't testing)
2. Test approach (manual vs automated recommendations per requirement)
3. Test cases organized by requirement ID
4. Risk areas (where we should focus the most testing effort and why)
5. Test environment requirements (data setup, integrations needed)

[paste contents of scenario/requirements-v2.md]
```

---

## Prompt 3: Code Explanation for Test Coverage Analysis
**Demo Act:** Act 3 — Quality & Validation  
**What it does:** Helps QA understand what an API does without reading code — then identifies what needs to be tested. Bridges the dev↔QA language gap.

```
I'm a QA engineer reviewing this API code. I don't need to understand every implementation detail,
but I need to know:
1. What does this API do? (Plain English summary of each endpoint)
2. What are the business rules baked into the code? (Things I need to write test cases for)
3. What are the error conditions I should test? (When should it fail, and how?)
4. What edge cases might break this? (Think like a tester, not a developer)
5. What data setup would I need to test this end-to-end?

[paste contents of scenario/sample-code/returns-api.py]
```

---

## Prompt 4: Bug Report → Root Cause Hypothesis
**Demo Act:** Act 3 — Quality & Validation  
**What it does:** Feeds a bug report + relevant code to Copilot and asks it to hypothesize root causes — helps QA triage bugs and communicate findings to developers.

```
I have a bug report and the relevant code. Please:
1. Identify the most likely root cause(s) based on the code
2. Explain the cause in plain language (as if explaining to a non-developer PM)
3. Suggest specific test cases that would have caught this bug
4. Recommend what a developer should look at to fix it

Bug report:
Title: Return submission fails for orders with more than 10 items
Steps: Log in → navigate to order with 12 line items → select any item → submit return
Expected: Return created successfully
Actual: 500 Internal Server Error
Environment: Staging

Relevant code:
[paste contents of scenario/sample-code/returns-api.py]
```

---

## Prompt 5: Gherkin Test Scenarios from User Stories
**Demo Act:** Act 3 — Quality & Validation  
**What it does:** Converts user stories into Gherkin (Given/When/Then) format for behavior-driven development or manual test documentation.

```
Convert the following user stories into Gherkin scenarios (Given/When/Then format).
Write at least 2 scenarios per story: one for the happy path and one for a failure/negative case.

User Stories:
1. As a customer, I want to see whether an item is eligible for return before I submit a request, 
   so I'm not surprised by a rejection.
2. As a customer, I want to track the status of my return request, 
   so I don't have to call support for updates.
3. As a customer, I want to receive an email when my return is approved or rejected, 
   so I'm kept informed without checking the portal constantly.
```

---

## Prompt 6: PR Risk Assessment for QA
**Demo Act:** Act 3 — Quality & Validation  
**What it does:** Analyzes a pull request description or diff and produces a focused QA risk assessment — tells QA what to prioritize in their test pass.

```
I'm a QA engineer about to test a new pull request. Based on the changes described below,
help me prioritize my test effort by:
1. Summarizing what changed in non-technical terms
2. Identifying the highest-risk areas (most likely to introduce regression)
3. Listing 5-7 specific test scenarios I should run before approving this PR
4. Calling out any changes that affect existing functionality I should regression test

PR Description:
This PR implements REQ-004 (return eligibility validation). 
Changes include: a new check_eligibility() function in returns-api.py, 
server-side re-validation at submission time, 
and new error messages for three ineligibility conditions 
(return window, final sale, duplicate return).
The OMS integration call was also refactored to extract item categories.
```

---

## Prompt 7: Test Case Review & Gap Analysis
**Demo Act:** Act 3 — Quality & Validation  
**What it does:** Reviews an existing set of test cases against requirements and identifies coverage gaps — useful before a sprint review or release gate.

```
Review the following test cases against the requirements document and identify:
1. Requirements with no test coverage at all
2. Requirements with only happy-path coverage (missing negative/edge cases)
3. Non-functional requirements (performance, accessibility, security) with no test cases
4. Suggested additional test cases for each gap found

Test cases:
[paste contents of outputs/test-cases.md]

Requirements:
[paste contents of scenario/requirements-v2.md]
```
