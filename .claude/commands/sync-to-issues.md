---
description: Sync TASKS.md P0/P1 items to GitHub Issues for Agent Orchestrator parallel execution
argument-hint: "[--dry-run] [--labels label1,label2]"
---
# Sync Backlog to GitHub Issues

Bridge between the PM governance layer (TASKS.md/BACKLOG.md) and Agent Orchestrator's
execution layer (GitHub Issues). Creates one GitHub Issue per unchecked task item.

## Steps

1. **Read TASKS.md** — find all unchecked (`- [ ]`) items under P0 and P1 sections
2. **Read BACKLOG.md** — find any items explicitly tagged `[ready]` or `[approved]`
3. **Check existing issues** — run `gh issue list` to avoid creating duplicates
   (match by task description substring — if >80% of the task title matches an open issue, skip it)
4. **For each new task**, create a GitHub Issue:
   - **Title**: The task description (cleaned of markdown formatting)
   - **Body**: Include source section (P0/P1/Backlog), any metadata (owner, date, priority),
     and a footer: `_Synced from TASKS.md by /sync-to-issues_`
   - **Labels**: Add `ao-ready` label (create it if it doesn't exist). Add any labels from --labels arg.
5. **After creating issues**, append a tracking comment to TASKS.md next to each synced item:
   `→ #123` (the issue number) so you know which items have been synced
6. **Output a summary**:
   - X issues created
   - Y items skipped (already have issues)
   - Z items skipped (already checked/done)
   - List each created issue: `#123 — [task title]`

## Rules
- Never sync items that are already checked (`- [x]`)
- Never sync items in Done, Parked, or Blocked sections
- If `--dry-run` is passed, show what would be created without creating anything
- Only sync to the repo specified in the git remote origin (never hardcode a repo)
- Use `gh issue create` — never call the GitHub API directly

## Example output
```
Synced 3 tasks to GitHub Issues:
  #45 — Implement user notification preferences API
  #46 — Add rate limiting to webhook endpoints
  #47 — Create onboarding flow for new tenants

Skipped 2 (already synced): → #41, → #42
Skipped 1 (done): [x] Setup CI pipeline
```
