# Instructor-Led Demos — GitHub Copilot for Non-Developers

A set of live demos that run entirely in **Copilot Chat on github.com** — no local setup, no VS Code, no CLI tools required. Audience can follow along in a browser.

Inspired by the GitHub blog post [Not just for developers: How product and security teams can use GitHub Copilot](https://github.blog/ai-and-ml/github-copilot/not-just-for-developers-how-product-and-security-teams-can-use-github-copilot/).

## Where to run these

Two Copilot Chat surfaces on github.com:

- **Immersive chat:** [github.com/copilot](https://github.com/copilot) — full-page chat. Best for long prompts, reformatting, drafting, and brainstorming. Use `#` to attach files, repos, issues, or PRs as context.
- **In-context chat:** the Copilot icon in the top-right of any repo, file, issue, or PR. Best for "explain what I'm looking at" — the page is already in context.

> [!NOTE]
> `#` attaches context (files, repos, issues, PRs) to a prompt in immersive chat. It's the difference between a generic answer and a useful one.

---

## Demo 1 — Generating and reformatting Markdown

Generate clean, GitHub-flavored Markdown from a plain-language description — no syntax knowledge required.

**Where:** [github.com/copilot](https://github.com/copilot)

**Base prompt:**

```text
Create a README file for a GitHub repo.
Include sections for the team's objective, a link to the project's roadmap, and a team roster.
The team roster should include small versions of GitHub profile pictures using ashtom as a placeholder, plus each person's name and role.
Output as a fenced markdown code block.
```

**Iteration — GitHub-flavored:**

```text
Rewrite the README using GitHub-flavored Markdown. Use a GitHub alert (NOTE or IMPORTANT) for the roadmap callout, add relevant emojis to the section headers, and include a status badge placeholder at the top.
```

**Bonus — reformat raw notes:**

```text
Reformat the following notes into clean Markdown with headers, a bulleted list, and a table for the action items:

oct 14 standup
- jane: finishing the migration script, blocked on db creds from infra
- mark: pulled q3 numbers, will share in slack
- priya: customer call tomorrow at 10, needs the latest pricing deck
action items: jane file infra ticket today, mark post numbers by EOD, priya prep deck
```

**Takeaway:** describe the outcome, let Copilot handle the syntax.

---

## Demo 2 — Reviewing writing with Copilot

Use Copilot as a reviewer with an assigned persona to critique and rewrite a draft.

**Where:** [github.com/copilot](https://github.com/copilot)

**Base prompt:**

````text
Review the executive update below as if you were a skeptical VP. Flag vague claims, missing numbers, typos, and filler. Suggest concrete rewrites inline.

```markdown
# Q3 Platform Update

This quarter we shiped the new auth flow, witch reduced login errors by alot.
We also did some stuff with the billing service to make it faster.
Customer satisfaction went up. The team did a great job.
Next quarter we plan to do more things including improvements and other items.
```
````

**Iteration — change persona:**

```text
Now review it again as if you were a non-technical customer reading a blog. What would confuse you? What would you want to know more about?
```

**Iteration — final pass:**

```text
Apply your strongest suggestions and give me a clean rewritten version, max 150 words, in a confident voice without filler.
```

**Takeaway:** the prompt is the role. Same content, different reviewer, different feedback.

---

## Demo 3 — Spreadsheet analysis without writing code

Turn a pasted CSV into analysis, a team message, and draft issues without writing code.

**Where:** [github.com/copilot](https://github.com/copilot)

**Base prompt:**

````text
Below is a CSV of tasks. For each unique Assignee, give me:
1. A markdown table of their tasks
2. A count of how many are In Progress, Done, and Not Started
3. Their next due item based on today's date (2026-05-13)
4. Flag anyone who is overloaded (3+ In Progress)

```csv
ID,Title,Assignee,Status,DueDate
101,Update onboarding deck,jane,In Progress,2026-05-20
102,Audit vendor list,mark,Not Started,2026-05-22
103,Draft Q3 OKRs,jane,Done,2026-05-10
104,Review security findings,priya,In Progress,2026-05-18
105,Refresh pricing model,mark,In Progress,2026-05-25
106,Run customer interview,priya,Not Started,2026-05-30
107,Migrate dashboards,jane,In Progress,2026-05-15
108,Renew vendor contracts,mark,In Progress,2026-05-19
```
````

**Iteration — turn analysis into a message:**

```text
Write a short teams message that summarizes who's overloaded and what's due this week. Keep it to 5 lines and casual.
```

**Iteration — turn it into tracked work:**

```text
Draft 3 GitHub issues based on the overdue and overloaded items. For each: title, body, labels, suggested assignee.
```

**Takeaway:** raw data → analysis → comms → tracked work, all in the browser.

---

## Demo 4 — Understanding code in plain English

Explain a workflow file, line of code, or entire repo — and re-scope the explanation for a different audience.

**Where:** In-context Copilot Chat — open a file on github.com and click the Copilot icon in the top-right.

**Setup:** open any GitHub Actions workflow file in a public repo. The [`actions/stale`](https://github.com/actions/stale) repo has good example workflows.

**Base prompt (in side chat, file open):**

```text
What does this workflow file do? Explain it as if I had no prior GitHub Actions experience.
```

**Iteration — change audience:**

```text
Now rewrite that explanation for a compliance auditor who wants to know what this automation does to the repository on a daily basis and what could go wrong.
```

**One-liner — in [github.com/copilot](https://github.com/copilot):**

```text
Explain this line of code in plain English, then tell me what could go wrong with it:

if (user.isAdmin) { grantAccess(); }
```

**Bonus — point at a whole repo with `#`:**

```text
#github/docs explain at a high level what this repository contains and who would use it.
```

**Takeaway:** Copilot scales the explanation to the audience.

---

## Recap

- Demo 1 — Markdown without learning Markdown.
- Demo 2 — Reviewer with a persona.
- Demo 3 — CSV to action items without a script.
- Demo 4 — Code explained for the audience.

**Pattern:** describe the outcome, name the audience, iterate, attach context with `#`.
