---
description: Run a structured 5-act experience for any non-trivial goal
argument-hint: Describe your goal (e.g., "build a notifications system")
---
# Structured Agent Experience

Run a structured 5-act experience for the goal described.

Act 1 — Context: Ask max 5 clarifying questions. State assumptions first.
Act 2 — Discovery: Run /evaluate + identify risks + surface unknown unknowns.
Act 3 — Design: Generate ADR (if architectural) + component/data design.
         PAUSE — wait for explicit user approval before Act 4.
Act 4 — Implementation: Build iteratively. After each major component:
         - Output: "IMPLEMENTED: [what was built]"
         - Output: "PARKED: [what was deferred and why]"
         - Output: "DISCOVERED: [new requirements or risks found]"
Act 5 — Review: Summarise session, run /update-backlog, suggest CLAUDE.md improvement.

Never skip the Act 3 pause. Never proceed to Act 4 without confirmed design.
