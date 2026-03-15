# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [1.1.0] - 2026-03-15

### Added
- **Actual `.claude/` files** — Skills, commands, hooks, and settings are now real files you can `git clone` and use immediately (no more copy-pasting from README code blocks)
- **`setup.sh`** — One-command bootstrap script that sets up any project with the full PM governance layer
- **`templates/`** — Ready-to-use CLAUDE.md, TASKS.md, and BACKLOG.md templates
- **`docs/`** — Architecture reference guides moved out of README for modular loading
- SECURITY.md — Vulnerability reporting policy with response SLAs
- CODE_OF_CONDUCT.md — Contributor Covenant v2.1
- NOTICE — Third-party attribution and legal disclaimer
- PRIVACY.md — Privacy policy
- `.github/PULL_REQUEST_TEMPLATE.md` — PR checklist with license agreement
- `.github/ISSUE_TEMPLATE/` — Structured bug report and feature request forms
- CHANGELOG.md — This file

### Changed
- **Repo renamed** from `claude-code-pm-playbook` to `ai-pm-playbook` (removed Anthropic branding)
- **README restructured** — Architecture-at-scale chapters (11, 13) moved to `docs/` to keep README focused on the playbook
- **Softened unsubstantiated claims** — Removed specific percentages without cited data
- CONTRIBUTING.md — Added security, code of conduct, and license agreement sections

### Removed
- Personal OS (amanaiproduct) references
- Unverified quantitative claims about instruction-following rates

## [1.0.0] - 2026-03-14

### Added
- Initial release: 18-chapter guide across 3 levels (Foundations, PM Productivity, Advanced Mastery)
- 4 custom skills: clarification-gate, honest-evaluator, adr-creator, instruction-auditor
- 3 custom commands: /act, /evaluate, /update-backlog
- 2 custom hooks: skill-router.sh, backlog-updater.sh
- "What This Playbook Adds" section showing custom additions on top of pm-skills
- Quick reference cards, decision trees, hook events reference
- Full credits and attribution table
- MIT License, CONTRIBUTING.md, .gitignore
