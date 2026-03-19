---
name: clarification-gate
description: Auto-invoke when user asks to build, implement, create, or design
  anything new. Also invoke for vague prompts like "make it better", "add auth",
  "build a dashboard". Do NOT invoke for small edits, fixes, or refactors.
  Do NOT invoke when running as an autonomous agent (when AO_SESSION env var is set).
---
# Clarification Gate

## Autonomous Mode Detection
If the environment variable `AO_SESSION` is set, this agent is running autonomously
under Agent Orchestrator. In autonomous mode:
- Do NOT ask clarification questions (there is no human to answer)
- Instead, state your assumptions as comments in the code
- Choose the conservative option when uncertain
- Document any ambiguity in the PR description
- Proceed directly with implementation

## Interactive Mode (default)
Before implementing anything non-trivial, ask max 5 questions grouped by category.
Only ask what is genuinely unknown — never ask what can be inferred from context.
State your current assumptions first so the user can correct them.

### Scale & Context (always ask if unknown)
- Expected users/events at launch vs. 12 months from now?
- B2C (many anonymous) or B2B (fewer, authenticated tenants)?

### Requirements Clarity (ask if ambiguous)
- What does success look like? What metric moves?
- What is explicitly OUT of scope for this iteration?
- Are there existing patterns/components to reuse?

### Constraints (ask if not in CLAUDE.md)
- Latency, cost, or compliance hard constraints?
- Preferred tech choices or ones to avoid?

### Format
Ask as numbered list. Max 5 questions. State assumptions first.
Confirm understanding before writing any code.
