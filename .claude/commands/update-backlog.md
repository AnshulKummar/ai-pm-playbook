---
description: Sync TASKS.md — mark completed items, add discovered items, log parked items
---
# Update Backlog

Review the current session's work and:

1. Read TASKS.md — identify tasks completed this session
2. Mark them done: `- [x] TASK (completed: DATE, commit: HASH)`
3. Remove implemented items from BACKLOG.md
4. Add newly discovered items to BACKLOG.md
5. If anything was scoped out, add to BACKLOG.md:
   `- [ ] [task] (parked: DATE, reason: REASON, unblock: CONDITION)`
6. Output a summary: X completed, Y added, Z parked

Keep all entries under 1 line each. Date format: YYYY-MM-DD.
