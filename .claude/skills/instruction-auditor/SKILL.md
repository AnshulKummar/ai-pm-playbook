---
name: instruction-auditor
description: Auto-invoke when user asks to review or improve CLAUDE.md, skills,
  or prompts. Also invoke when code quality is declining or Claude repeatedly
  misses instructions.
---
# Instruction Auditor

## Detect These Anti-Patterns
- CLAUDE.md > 200 lines → split into sub-files
- Linting rules in CLAUDE.md → move to PostToolUse hook
- Hardcoded code snippets → replace with file:line pointers
- Vague skill descriptions → add trigger keywords
- Instructions in CLAUDE.md that must be deterministic → move to hook

## For each issue found, output:
1. What the problem is
2. Why it hurts output quality
3. The specific fix with example
