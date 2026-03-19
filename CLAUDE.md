# Project: AI PM Playbook

## Quick Commands
- Setup: `bash setup.sh /path/to/your-project`
- Setup with AO: `bash setup.sh /path/to/your-project --with-ao`
- Lint markdown: `npx markdownlint-cli2 "**/*.md"`

## About This Product
An open-source playbook that teaches Product Managers how to use AI code assistants effectively. It ships real `.claude/` configuration files (skills, commands, hooks, templates) — not just documentation. Target audience: PMs building PoCs, solo founders, consultants, and anyone bridging product and engineering.

## Repository Structure
- `README.md` — The playbook (16 chapters across 3 skill levels)
- `.claude/` — Working skills, commands, hooks, and settings (cloneable)
- `templates/` — Starter CLAUDE.md, TASKS.md, BACKLOG.md for new projects
- `docs/` — Architecture reference guides and ADRs (load on demand)
- `setup.sh` — One-command bootstrap that copies `.claude/` + templates into a target project

## Coding Standards
- Shell scripts: POSIX-compatible bash, no `jq` dependency (use parameter expansion)
- All hooks must output valid JSON (single object) or nothing — never multiple JSON objects
- Scripts must be marked executable: `git update-index --chmod=+x <file>`
- Branch protection: optional — see README Chapter 5 for opt-in hook

## What NOT to Do
- Prefer feature branches for non-trivial changes (optional branch protection hook available)
- Do not add `jq` as a dependency in any hook or script
- Do not hardcode file paths — use relative paths from repo root
- Do not create documentation files unless explicitly asked
- Do not modify the hipaalint project from this repo's context

## Key Patterns
- Hook scripts use `$CLAUDE_TOOL_INPUT` env var for tool input JSON
- `backlog-updater.sh` handles both Write (`content` key) and Edit (`new_string` key) tool inputs
- `skill-router.sh` matches prompt keywords and suggests relevant `/commands`
- Branch protection hook (opt-in) uses `git branch --show-current 2>/dev/null` for cross-platform compatibility
- Agent Orchestrator integration (opt-in via `--with-ao`): `sync-to-issues.md` + autonomous clarification-gate

## Governance Files
- LICENSE (MIT), NOTICE, SECURITY.md, PRIVACY.md, CODE_OF_CONDUCT.md, CONTRIBUTING.md
- `.github/` — PR template, issue templates (bug_report.yml, feature_request.yml), CODEOWNERS
