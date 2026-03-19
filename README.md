<div align="center">

# AI PM Playbook
### From Novice to Advanced — A Complete Guide for Product Managers Using AI Code Assistants

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![PM Skills](https://img.shields.io/badge/PM_Skills-65_skills_36_workflows-teal)](https://github.com/phuryn/pm-skills)

**Build real products. Think like an engineer. Ship like a PM.**

*A structured, open-source playbook for Product Managers who want to use AI code assistants effectively — from first install to production-grade workflows.*

*This guide is currently optimised for [Claude Code](https://code.claude.com) but the frameworks, skills, and workflows are applicable to any AI coding assistant.*

[🟢 Level 1: Start Here](#-level-1--foundations) • [🟡 Level 2: PM Productivity](#-level-2--pm-productivity) • [🔴 Level 3: Advanced](#-level-3--advanced-mastery) • [🛠️ PoC Playbook](#️-poc-playbook--from-idea-to-working-prototype) • [⚡ Quick Reference](#-quick-reference) • [📚 Credits](#-credits--references)

</div>

---

## 🚀 Quick Start

```bash
# 1. Clone this repo
git clone https://github.com/AnshulKummar/ai-pm-playbook.git
cd ai-pm-playbook

# 2. Bootstrap your project with the full PM governance layer
bash setup.sh /path/to/your-project

# 2b. (Optional) Include Agent Orchestrator integration for parallel agents
bash setup.sh /path/to/your-project --with-ao

# 3. Install PM Skills plugin (65 skills, 36 commands)
claude plugin marketplace add phuryn/pm-skills

# 4. Start your first structured workflow
/act [your goal here]
```

> **What you get on `git clone`:** 4 skills, 3 commands, 2 hooks, safety guards, settings.json, and project templates — all as real files, ready to use. No copy-pasting from code blocks. Add `--with-ao` for [Agent Orchestrator](https://github.com/ComposioHQ/agent-orchestrator) integration.

### Repository structure

```
ai-pm-playbook/
├── .claude/
│   ├── settings.json                    # Safety hooks + skill router wiring
│   ├── skills/
│   │   ├── clarification-gate/SKILL.md  # Ask before building
│   │   ├── honest-evaluator/SKILL.md    # No-flattery evaluation
│   │   ├── adr-creator/SKILL.md         # Architecture decisions + cost
│   │   └── instruction-auditor/SKILL.md # Self-improvement
│   ├── commands/
│   │   ├── act.md                       # /act — 5-act structured workflow
│   │   ├── evaluate.md                  # /evaluate — honest assessment
│   │   ├── update-backlog.md            # /update-backlog — sync tasks
│   │   └── sync-to-issues.md            # /sync-to-issues — AO bridge (--with-ao)
│   └── hooks/
│       ├── skill-router.sh              # Auto-suggest relevant commands
│       └── backlog-updater.sh           # Auto-log task events
├── templates/
│   ├── CLAUDE.md                        # Starter project config template
│   ├── TASKS.md                         # Task board template
│   └── BACKLOG.md                       # Backlog template
├── docs/
│   ├── architecture-for-scale.md        # B2C/B2B scale reference
│   └── architecture-patterns.md         # CQRS, Saga, CRDT patterns
├── setup.sh                             # One-command project bootstrap
├── README.md                            # This guide (16 chapters)
├── CHANGELOG.md                         # Version history
├── LICENSE                              # MIT
├── NOTICE                               # Attribution + legal disclaimer
├── SECURITY.md                          # Vulnerability reporting
├── PRIVACY.md                           # Privacy policy
├── CODE_OF_CONDUCT.md                   # Contributor Covenant v2.1
└── CONTRIBUTING.md                      # How to contribute
```

---

## 👋 Who This Is For

This guide is for **Product Managers** who want to use [Claude Code](https://code.claude.com) to:

- Write PRDs, strategy docs, and discovery artifacts faster and with more rigour
- Understand enough engineering to have better conversations with your team
- Build real features (not just prototypes) that scale
- Create automated workflows that compound over time

You do **not** need to be a developer to benefit from this guide. Every concept is explained with a PM mental model first.

---

## 🧩 What This Playbook Adds

This playbook builds on top of [Paweł Huryn's pm-skills](https://github.com/phuryn/pm-skills) (65 skills, 36 commands) by adding a **structured decision-making and governance layer** that controls *when* and *how* those skills get used.

### Custom Skills (not in pm-skills)

| Skill | What it does | Auto-invokes when... |
|-------|-------------|---------------------|
| **clarification-gate** | Asks max 5 questions before building anything; states assumptions first | User says "build", "implement", "create", "add" |
| **honest-evaluator** | Brutally honest 6-part framework: strengths, fatal flaws, hidden costs, risk heatmap, verdict | User says "should we build", "evaluate", "pros and cons" |
| **adr-creator** | Generates Architecture Decision Records with cost analysis at 4 scale tiers (MVP to 100M users) | User mentions database, infrastructure, scaling, "X or Y" |
| **instruction-auditor** | Detects anti-patterns in CLAUDE.md and skills; suggests fixes | User asks to review setup or quality is declining |

### Custom Commands (not in pm-skills)

| Command | What it does |
|---------|-------------|
| `/act [goal]` | Runs a structured **5-Act experience**: Context → Discovery → Design (pause for approval) → Implementation → Review. Chains clarification-gate + evaluate + ADR generation |
| `/evaluate [idea]` | Triggers the honest-evaluator: strengths / fatal flaws / hidden costs / BUILD NOW or DIFFERENTLY verdict |
| `/update-backlog` | Syncs TASKS.md: marks completed items, adds discovered items, logs parked items with reasons |
| `/sync-to-issues` | *(Optional — `--with-ao`)* Bridges TASKS.md → GitHub Issues for [Agent Orchestrator](https://github.com/ComposioHQ/agent-orchestrator) parallel execution |

### Custom Hooks (not in pm-skills)

| Hook | Type | What it does |
|------|------|-------------|
| **skill-router.sh** | `UserPromptSubmit` | Pattern-matches your prompt and suggests relevant commands (e.g., mentions "PRD" → suggests `/write-prd`) |
| **backlog-updater.sh** | `PostToolUse` | Auto-logs "IMPLEMENTED" and "PARKED" events to task-log.md and BACKLOG.md |
| **Safety guard** | `PreToolUse` | Blocks dangerous commands (`rm -rf`, `git push --force`, `DROP TABLE`) before they execute |

### The key idea

**pm-skills** gives you *what* to do (write a PRD, run discovery, analyse competitors). This playbook adds the *discipline layer*: clarify before building, evaluate honestly, pause before implementing, track everything, and improve the system weekly.

```
pm-skills (Paweł Huryn)          This playbook adds
─────────────────────────        ─────────────────────────
65 PM execution skills     +     Clarification gate (ask before building)
36 chained workflows       +     Honest evaluation (no flattery)
8 domain plugins           +     5-Act structured workflow
                           +     ADR with cost analysis at scale
                           +     Live backlog tracking (TASKS.md)
                           +     Smart skill router (auto-suggest)
                           +     Safety hooks (block dangerous commands)
                           +     Self-learning loops (weekly improvement)
```

---

## 🎯 Who Benefits and How

This playbook is designed for PMs, but the governance layer is valuable to anyone using AI code assistants to build real things. Here's how each persona benefits:

| Persona | Primary use case | Start here | Key value |
|---------|-----------------|------------|-----------|
| **Product Manager** | Validate ideas, write PRDs, run discovery | [Chapter 1](#chapter-1-what-is-claude-code--a-pms-lens) | Discipline layer prevents building the wrong thing |
| **PM building a PoC** | Ship a working prototype to prove a concept | [PoC Playbook](#-poc-playbook--from-idea-to-working-prototype) below | Structured path from idea to demo-ready build |
| **Solo founder / indie hacker** | Build an MVP without an engineering team | [Quick Start](#-quick-start) + [Chapter 12](#chapter-12-conversational-agent-experiences--the-acts-framework) | 5-Act framework turns vague ideas into shippable code |
| **Technical PM** | Govern AI-assisted development, make arch decisions | [Chapter 5](#chapter-5-the-core-mental-model--skills-vs-commands-vs-hooks) | Hooks + ADRs + evaluation prevent expensive mistakes |
| **Engineering Manager** | Understand PM workflows, improve PM-eng collaboration | [Chapter 10](#chapter-10-pm--engineering-concepts-bridge) | Bridge table translates PM ↔ engineering concepts |
| **Consultant / freelancer** | Build client PoCs quickly with quality guardrails | [PoC Playbook](#-poc-playbook--from-idea-to-working-prototype) | Repeatable process: clone → setup → deliver |
| **Product Designer** | Create interactive prototypes beyond Figma | [Chapter 6](#chapter-6-discovery-prds--strategy-docs) + [Chapter 12](#chapter-12-conversational-agent-experiences--the-acts-framework) | Discovery → design → working prototype in one session |

---

## 🛠️ PoC Playbook — From Idea to Working Prototype

Building a Proof of Concept is where this playbook delivers the most tangible value. A PoC is not a toy demo — it's the fastest path to answering "should we invest engineering resources in this?"

### Why PMs should build PoCs with AI code assistants

| Traditional PoC | PoC with this playbook |
|----------------|----------------------|
| Write a PRD → wait for eng sprint allocation → 2-4 weeks | `/act [idea]` → working prototype in hours |
| "Trust me, this will work" → stakeholder skepticism | Demo a working prototype → stakeholder conviction |
| Scope creep turns PoC into accidental v1 | Clarification gate scopes it; honest evaluator kills bad ideas early |
| No architecture thinking → rewrite when it gets real | ADR creator documents decisions even in a PoC |
| PoC dies in a branch, learnings lost | Backlog tracker captures what was built, parked, and discovered |

### The PoC workflow (step by step)

```
Phase 1: VALIDATE (before writing any code)
─────────────────────────────────────────────
  /evaluate [your idea]
  → Get: strengths, fatal flaws, hidden costs, BUILD/KILL verdict
  → If verdict is DO NOT BUILD, you just saved weeks

Phase 2: SCOPE (define what the PoC must prove)
─────────────────────────────────────────────
  /act [your idea]
  → Act 1: Clarification gate fires — 5 questions, assumptions stated
  → Act 2: Discovery — risks surfaced, unknowns identified
  → Act 3: Design — component plan, ADR if architectural
  → PAUSE: you approve the scope before any code is written

Phase 3: BUILD (structured implementation)
─────────────────────────────────────────────
  → Act 4: Build iteratively with checkpoints
  → Every component: IMPLEMENTED / PARKED / DISCOVERED logged
  → Safety hooks prevent accidental damage

Phase 4: CAPTURE (preserve learnings)
─────────────────────────────────────────────
  /update-backlog
  → Act 5: What worked, what didn't, what to build next
  → TASKS.md shows exactly what was delivered
  → BACKLOG.md captures everything deferred for v1
```

### PoC quick-start for each persona

<details>
<summary><strong>PM validating a feature idea</strong></summary>

```bash
# 1. Bootstrap your PoC project
mkdir my-feature-poc && cd my-feature-poc && git init
bash /path/to/ai-pm-playbook/setup.sh .

# 2. Edit CLAUDE.md with your context
# Add: what the feature does, who it's for, what success looks like

# 3. Evaluate before building
/evaluate AI-powered notification system that reduces alert fatigue by 60%

# 4. If verdict is BUILD NOW or BUILD DIFFERENTLY:
/act Build a notification system PoC that demonstrates intelligent alert
    grouping and priority scoring for a B2B SaaS dashboard

# 5. After the build session:
/update-backlog
# Share TASKS.md with your team as "here's what we proved"
```

**What you walk away with:** A working prototype + an honest evaluation + a task log showing exactly what was built and what was deferred. Enough to make a go/no-go decision with your engineering team.

</details>

<details>
<summary><strong>Solo founder building an MVP</strong></summary>

```bash
# 1. Bootstrap
mkdir my-startup && cd my-startup && git init
bash /path/to/ai-pm-playbook/setup.sh .

# 2. Start with discovery, not code
/discover [your product idea — be specific about the user problem]

# 3. Write a lightweight PRD
/write-prd [feature based on discovery output]

# 4. Pre-mortem before building
/pre-mortem [paste PRD summary]

# 5. Build with the 5-Act framework
/act Build MVP for [product]: [core user flow in one sentence]

# 6. After each major session
/update-backlog
```

**What you walk away with:** A validated idea (not just a hunch), a working MVP with architecture decisions documented, and a backlog that tells you exactly what to build next.

</details>

<details>
<summary><strong>Consultant delivering a client PoC</strong></summary>

```bash
# 1. Repeatable setup for every client project
mkdir client-poc && cd client-poc && git init
bash /path/to/ai-pm-playbook/setup.sh .

# 2. Fill CLAUDE.md with client context
# Stack constraints, compliance requirements, scale expectations

# 3. Run the structured workflow
/act [client's problem statement + success criteria]

# 4. The 5-Act framework automatically:
#    - Clarifies requirements (Act 1) — no miscommunication
#    - Surfaces risks (Act 2) — nothing surprises the client
#    - Designs before building (Act 3) — client approves scope
#    - Builds with checkpoints (Act 4) — transparent progress
#    - Documents everything (Act 5) — professional handoff

# 5. Deliverables
/update-backlog
# Hand off: working prototype + TASKS.md + BACKLOG.md + docs/adr/
```

**What you walk away with:** A professional deliverable package — working code, documented architecture decisions, a clear task log, and a backlog the client can hand to their engineering team.

</details>

### What makes a good PoC vs a bad one

| Good PoC (this playbook enforces) | Bad PoC (what happens without guardrails) |
|-----------------------------------|-------------------------------------------|
| Proves or disproves one specific hypothesis | Tries to build a mini-product |
| Scoped to 1-2 day build (clarification gate) | Scope creeps into weeks |
| Architecture decisions documented (ADR) | "We'll figure it out later" |
| Honest evaluation before building | "Everything looks great!" flattery |
| Clear record of what was built vs deferred | PoC dies, learnings lost |
| Stakeholder can see and interact with it | Slides and hand-waving |

---

## 🤖 Optional: Agent Orchestrator Integration

<details>
<summary><strong>Scale to parallel agents with Agent Orchestrator (click to expand)</strong></summary>

This playbook includes optional integration with [Agent Orchestrator](https://github.com/ComposioHQ/agent-orchestrator) (AO) — a tool that spawns parallel AI coding agents, each in its own git worktree with its own PR. Enable it with `--with-ao` during setup.

### What you get with `--with-ao`

| Feature | What it does |
|---------|-------------|
| `/sync-to-issues` | Bridges TASKS.md P0/P1 items → GitHub Issues with `ao-ready` label. Supports `--dry-run`, dedup, and tracking refs (`→ #123`) |
| **Autonomous clarification-gate** | When AO spawns a worker agent, `clarification-gate` detects the `AO_SESSION` env var and skips interactive questions — instead documenting assumptions in code comments and PR descriptions |

### The AO-ready workflow

```
1. /evaluate [idea]              → Should we build this?
2. /act [idea]                   → Structured 5-act to design it
3. /sync-to-issues               → Convert approved P0/P1 items to GitHub Issues
4. ao start                      → AO spawns agents per issue (parallel)
5. Review PRs from dashboard     → Merge what's good
6. /update-backlog               → Sync TASKS.md with what shipped
```

Steps 1-2 use your playbook (interactive, governance layer). Steps 3-5 use AO (parallel execution). Step 6 brings it back to your tracking system.

### Setup

```bash
# 1. Bootstrap with AO integration
bash setup.sh /path/to/your-project --with-ao

# 2. Install Agent Orchestrator
npm install -g @composio/ao

# 3. Preview what would be synced (dry run)
/sync-to-issues --dry-run

# 4. Sync approved tasks to GitHub Issues
/sync-to-issues

# 5. Start parallel agents
ao start
```

### Requirements

- [Agent Orchestrator](https://github.com/ComposioHQ/agent-orchestrator) (`npm install -g @composio/ao`)
- tmux (macOS/Linux) or WSL2 (Windows)
- GitHub CLI (`gh`) authenticated

> **Note:** AO integration is fully optional. The core playbook works without it. AO adds parallel execution throughput — the playbook provides decision quality governance.

</details>

---

## 📖 How to Use This Guide

This guide is structured as a **three-level progression**. Work through each level in order, or jump to what you need using the table of contents.

| Level | Who it's for | Time to complete |
|-------|-------------|-----------------|
| 🟢 **Level 1 — Foundations** | First week using Claude Code | ~2 hours |
| 🟡 **Level 2 — PM Productivity** | Regular Claude Code user | ~4 hours |
| 🔴 **Level 3 — Advanced Mastery** | Building real products at scale | Ongoing reference |

---

## 📋 Table of Contents

<details>
<summary><strong>🟢 Level 1 — Foundations (click to expand)</strong></summary>

- [Chapter 1: What is Claude Code — A PM's Lens](#chapter-1-what-is-claude-code--a-pms-lens)
- [Chapter 2: Installation & First Setup](#chapter-2-installation--first-setup)
- [Chapter 3: Your CLAUDE.md — Claude's Permanent Memory](#chapter-3-your-claudemd--claudes-permanent-memory)
- [Chapter 4: PM Skills Marketplace](#chapter-4-pm-skills-marketplace)

</details>

<details>
<summary><strong>🟡 Level 2 — PM Productivity (click to expand)</strong></summary>

- [Chapter 5: The Core Mental Model — Skills vs Commands vs Hooks](#chapter-5-the-core-mental-model--skills-vs-commands-vs-hooks)
- [Chapter 6: Discovery, PRDs & Strategy Docs](#chapter-6-discovery-prds--strategy-docs)
- [Chapter 7: Clarifying Questions — Never Build the Wrong Thing](#chapter-7-clarifying-questions--never-build-the-wrong-thing)
- [Chapter 8: Honest Evaluation — Your Brutally Honest Co-Founder](#chapter-8-honest-evaluation--your-brutally-honest-co-founder)
- [Chapter 9: Live Backlog & Todo Management](#chapter-9-live-backlog--todo-management)
- [Chapter 10: PM ↔ Engineering Concepts Bridge](#chapter-10-pm--engineering-concepts-bridge)

</details>

<details>
<summary><strong>🔴 Level 3 — Advanced Mastery (click to expand)</strong></summary>

- [Chapter 11: ADR Creation with Cost Analysis](#chapter-11-adr-creation-with-cost-analysis)
- [Chapter 12: Conversational Agent Experiences — The Acts Framework](#chapter-12-conversational-agent-experiences--the-acts-framework)
- [Chapter 13: Self-Learning Loops](#chapter-13-self-learning-loops)
- [Chapter 14: Token Optimization Strategies](#chapter-14-token-optimization-strategies)
- [Chapter 15: Auto-Improving Your Instructions](#chapter-15-auto-improving-your-instructions)
- [Chapter 16: Making This Your Default Setup](#chapter-16-making-this-your-default-setup)
- [Architecture Reference Guides](#-architecture-reference-guides) (in `docs/`)

</details>

<details>
<summary><strong>⚡ Quick Reference (click to expand)</strong></summary>

- [Situational Quick Reference Card](#situational-quick-reference-card)
- [Command Routing Decision Tree](#command-routing-decision-tree)
- [Hook Events Reference](#hook-events-reference)
- [PM Skills Commands at a Glance](#pm-skills-commands-at-a-glance)

</details>

---

# 🟢 Level 1 — Foundations

> **Goal:** Install Claude Code, set it up correctly, and run your first PM workflow within 2 hours.

---

## Chapter 1: What is Claude Code — A PM's Lens

Claude Code is a command-line tool from [Anthropic](https://www.anthropic.com) that acts as an AI pair programmer in your terminal. But for PMs, the better mental model is:

> **Claude Code is your always-available engineering co-founder who reads your entire codebase, follows your product standards, and gets better at your specific domain the more you configure it.**

It can read and write files, run commands, browse your codebase, execute tests, manage Git, and call external APIs — all through natural language.

### What Claude Code can do for PMs specifically

| PM Task | Without Claude Code | With Claude Code |
|---------|-------------------|-----------------|
| Write a PRD | 2-4 hours from template | `/write-prd [feature]` — structured 8-section PRD in minutes |
| Discovery session | Manual sticky notes, messy Figma | `/discover [idea]` — chains brainstorm → assumptions → prioritisation → experiments |
| Competitive analysis | Google + spreadsheet | `/competitive-analysis [market]` — SWOT + Porter's Five Forces + differentiation |
| Architecture decision | 2-hour eng meeting | `/evaluate + ADR` — options, cost analysis, verdict in minutes |
| Sprint planning | Jira grooming | `/sprint plan` — capacity estimation, story selection, risk identification |
| A/B test analysis | Data analyst dependency | `/analyze-test [data]` — statistical significance, ship/extend/stop recommendation |

### The key difference from ChatGPT or Claude.ai

Claude Code has **persistent memory** through `CLAUDE.md` files, **deterministic automation** through hooks, and **project-specific context** that makes every session more productive than the last. It compounds. ChatGPT does not.

---

## Chapter 2: Installation & First Setup

### Prerequisites
- **Node.js 18+** (check: `node --version`)
- A terminal (Mac: Terminal or iTerm2, Windows: WSL2)
- An [Anthropic account](https://console.anthropic.com)

### Install Claude Code

```bash
npm install -g @anthropic-ai/claude-code
```

### Recommended project structure

Every project you work with Claude Code should follow this layout:

```
your-project/
├── CLAUDE.md                    # Root context (< 200 lines) — always loaded
├── .claude/
│   ├── settings.json            # Hooks, permissions, environment config
│   ├── settings.local.json      # Your personal overrides (git-ignored)
│   ├── commands/                # Slash commands: /my-command
│   │   └── update-backlog.md
│   ├── skills/                  # Auto-invoked context providers
│   │   ├── adr-creator/SKILL.md
│   │   ├── clarification-gate/SKILL.md
│   │   ├── honest-evaluator/SKILL.md
│   │   └── instruction-auditor/SKILL.md
│   ├── agents/                  # Subagents with isolated context
│   └── hooks/                   # Shell scripts for automation
│       ├── skill-router.sh
│       └── backlog-updater.sh
├── .mcp.json                    # MCP server config (commit this)
├── docs/                        # Reference docs loaded on demand
│   ├── architecture.md
│   ├── adr/                     # Architecture Decision Records
│   └── api-patterns.md
├── TASKS.md                     # Live task board (P0/P1/Done/Parked)
├── BACKLOG.md                   # Backlog inbox
└── src/                         # Your application code
```

### Global vs Project configuration

| Location | Scope | Use for |
|----------|-------|---------|
| `~/.claude/settings.json` | All projects | Safety hooks, notifications, personal style |
| `~/.claude/CLAUDE.md` | All projects | Your personal preferences, always-on rules |
| `.claude/settings.json` | This project | Project-specific hooks, permissions |
| `CLAUDE.md` | This project | Stack, architecture, team conventions |

> **🟢 Level 1 Tip:** Start by only creating `CLAUDE.md` in your project root. You don't need hooks or agents yet. Those are Level 2 and 3 concerns.

---

## Chapter 3: Your CLAUDE.md — Claude's Permanent Memory

`CLAUDE.md` is the most important file in your setup. It loads automatically at every session start and tells Claude everything it needs to know about your project and your standards.

### The Golden Rules of CLAUDE.md

1. **Keep it under 200 lines** — a bloated CLAUDE.md hurts more than it helps
2. **Never put linting rules here** — those go in hooks (deterministic beats probabilistic)
3. **Never paste code snippets** — they go stale; use `file:line` pointers instead
4. **Never put everything** — put references to sub-docs Claude can fetch on demand

### Starter CLAUDE.md template

```markdown
# Project: [Your Product Name]

## Quick Commands
- Build: `npm run build`
- Test: `npm run test`
- Lint: `npm run lint`

## About This Product
[One paragraph: what it does, who it's for, key business context]

## Architecture
- Stack: [e.g., Next.js, TypeScript, PostgreSQL, Redis]
- State management: [e.g., Zustand client-side, Redis distributed]
- Key patterns: [e.g., Repository pattern, Event-driven, CQRS]
- Docs: see docs/ — read the relevant file for the current task

## Scale Targets
- B2C: [X] users | B2B: [X] customers
- p99 latency target: < 200ms
- Read:Write ratio: [X:1]

## Coding Standards
- TypeScript strict mode, no `any`
- Every component needs a corresponding test file
- Error handling: never swallow errors silently
- Prefer async/await over callbacks

## What NOT to do
- Do not edit the main branch directly
- Do not run `rm -rf` without explicit confirmation
- Do not hardcode API keys or secrets
```

> **Source:** CLAUDE.md best practices are documented at [code.claude.com/docs](https://code.claude.com/docs) and extensively discussed by the community at [github.com/hesreallyhim/awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code).

---

## Chapter 4: PM Skills Marketplace

**Recommended repo:** [phuryn/pm-skills](https://github.com/phuryn/pm-skills) ⭐ 55 stars — **PRIMARY RECOMMENDATION for all PMs**

This is the single most impactful thing you can install. 65 PM skills and 36 chained workflows across 8 plugins, encoding the frameworks of Teresa Torres, Marty Cagan, Alberto Savoia, and others directly into Claude.

### Install

```bash
# Claude Code CLI (two-step process)
claude plugin marketplace add phuryn/pm-skills
# Then install each plugin when prompted, or install individually:
# claude plugin install pm-product-discovery@pm-skills

# Claude Cowork (non-developers)
# Customize → Browse plugins → Personal → + → Add marketplace from GitHub → phuryn/pm-skills
```

### The 8 Plugins at a Glance

| Plugin | Skills | Key Commands |
|--------|--------|-------------|
| **pm-product-discovery** | 13 skills | `/discover`, `/brainstorm`, `/interview` |
| **pm-product-strategy** | 12 skills | `/strategy`, `/business-model`, `/pricing` |
| **pm-execution** | 15 skills | `/write-prd`, `/sprint`, `/write-stories` |
| **pm-market-research** | 7 skills | `/research-users`, `/competitive-analysis` |
| **pm-data-analytics** | 3 skills | `/write-query`, `/analyze-test`, `/analyze-cohorts` |
| **pm-go-to-market** | 6 skills | `/plan-launch`, `/battlecard`, `/growth-strategy` |
| **pm-marketing-growth** | 5 skills | `/market-product`, `/north-star` |
| **pm-toolkit** | 4 skills | `/review-resume`, `/proofread`, `/draft-nda` |

### Your first 5 commands to try

```bash
# 1. Start discovery for any new idea
/discover AI-powered onboarding flow for B2B SaaS

# 2. Write a PRD from a problem statement
/write-prd Smart notification system that reduces alert fatigue

# 3. Analyse the competitive landscape
/competitive-analysis Project management tools for agencies

# 4. Define your North Star Metric
/north-star Two-sided marketplace connecting freelancers with clients

# 5. Run a pre-mortem before any major feature
/pre-mortem [paste your PRD here]
```

> **Credit:** PM Skills Marketplace by [Paweł Huryn](https://github.com/phuryn), curated from [The Product Compass Newsletter](https://www.productcompass.pm). Frameworks by Teresa Torres (*Continuous Discovery Habits*), Marty Cagan (*INSPIRED*, *TRANSFORMED*), Alberto Savoia (*The Right It*), Dan Olsen (*The Lean Product Playbook*), Ash Maurya (*Running Lean*), Christina Wodtke (*Radical Focus*), Anthony Ulwick (*Jobs to Be Done*), Sean Ellis (*Hacking Growth*), Maja Voje (*Go-To-Market Strategist*).

---

# 🟡 Level 2 — PM Productivity

> **Goal:** Understand how Claude Code really works and use it for your daily PM workflows — discovery, PRDs, evaluation, and backlog management.

---

## Chapter 5: The Core Mental Model — Skills vs Commands vs Hooks

This is the single most important concept in advanced Claude Code usage. Getting it wrong costs hours.

```
┌─────────────────────────────────────────────────────────────────┐
│  DETERMINISTIC (always runs, no exceptions)                     │
│  ┌─────────┐                                                    │
│  │  HOOKS  │  Shell scripts. Fire at lifecycle events.          │
│  │         │  Use for: safety rules, auto-format, notifications │
│  └─────────┘                                                    │
│                                                                  │
│  PROBABILISTIC (Claude decides when to apply)                   │
│  ┌──────────┐  ┌──────────────┐  ┌──────────────┐             │
│  │  SKILLS  │  │   COMMANDS   │  │   SUBAGENTS  │             │
│  │ Auto-    │  │  User-       │  │  Isolated    │             │
│  │ invoked  │  │  triggered   │  │  context     │             │
│  │ by match │  │  /command    │  │  window      │             │
│  └──────────┘  └──────────────┘  └──────────────┘             │
└─────────────────────────────────────────────────────────────────┘
```

### The decision tree

| Ask yourself | If YES → use | If NO → use |
|-------------|-------------|------------|
| Must this ALWAYS happen, no exceptions? | **Hook** | Skill or Command |
| Is this a safety/security rule? | **Hook** (can't be overridden) | CLAUDE.md (ignored ~30% of the time) |
| Do I want to trigger this explicitly? | **Slash Command** | Skill (auto-invoked) |
| Is this a complex multi-step workflow? | **Subagent** (isolated context) | Skill (in-line) |
| Does this need external services? | **MCP server** + command | Plain skill |
| Is this reusable across many projects? | **Plugin** | Project-local skill |

> **The critical insight** (from [genaiunplugged.substack.com](https://genaiunplugged.substack.com/p/claude-code-skills-commands-hooks-agents)): "With 'never run rm -rf' in CLAUDE.md, Claude followed the instruction about 70% of the time. With the hook, it's blocked 100% of the time. For safety rules, deterministic beats probabilistic."

### Essential safety hooks to add immediately

Create `.claude/settings.json`:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [{
          "type": "command",
          "command": "echo \"$CLAUDE_TOOL_INPUT\" | grep -qE '(rm -rf|git push --force|DROP TABLE)' && echo '{\"block\": true, \"message\": \"Dangerous command blocked — confirm manually\"}' >&2 && exit 2 || exit 0"
        }]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [{ "type": "command", "command": "npm run lint --silent 2>&1 | head -20" }]
      }
    ]
  }
}
```

> **Note:** The example above shows a lint hook for illustration. The `settings.json` included in this repo uses `backlog-updater.sh` instead — see [Chapter 9](#chapter-9-live-backlog--todo-management) for details.

<details>
<summary><strong>Optional: Branch protection hook</strong></summary>

If you want to prevent edits on `main` or `master` (useful for team repos with PR workflows), add this to the `PreToolUse` array:

```json
{
  "matcher": "Edit|Write",
  "hooks": [{
    "type": "command",
    "command": "BRANCH=$(git branch --show-current 2>/dev/null); [ \"$BRANCH\" != \"main\" ] && [ \"$BRANCH\" != \"master\" ] || { echo '{\"block\": true, \"message\": \"Cannot edit protected branch directly\"}' >&2; exit 2; }"
  }]
}
```

This forces all changes through feature branches. Remove it if you prefer to commit directly.

</details>

---

## Chapter 6: Discovery, PRDs & Strategy Docs

### The complete PM workflow — from idea to stories

```
Step 1: Discovery   → /discover [problem or idea]
Step 2: Assumptions → Review prioritised assumption map
Step 3: Strategy    → /strategy [product context]
Step 4: PRD         → /write-prd [feature + context from steps 1-3]
Step 5: Pre-Mortem  → /pre-mortem [PRD output]
Step 6: Stories     → /write-stories user [from PRD outcomes]
Step 7: Backlog     → /update-backlog [sync TASKS.md]
```

### PRD Template — 8 Sections (Marty Cagan Framework)

| Section | Content | Referenceable data required |
|---------|---------|----------------------------|
| 1. Problem Statement | What user/business problem are we solving? | User research quotes, support ticket volume, churn data |
| 2. Opportunity | Why now? Market size? Strategic fit? | TAM/SAM/SOM from `/market-scan`, competitive gaps |
| 3. Success Metrics | North Star + input metrics + guardrail metrics | Baseline data + % improvement targets |
| 4. Solution Approach | What are we building? Key user flows | Wireframes, prototypes, technical spike results |
| 5. Assumptions & Risks | What must be true for this to succeed? | Prioritised assumption map from `/pre-mortem` |
| 6. Scope | In/out of scope, phased delivery plan | Sprint capacity, engineering estimates |
| 7. Dependencies | External APIs, teams, infrastructure | SLA agreements, team availability |
| 8. Launch Plan | Rollout strategy, feature flags, rollback plan | GTM strategy from `/plan-launch` |

> **Always ask before writing code:** "What would cause this to fail at 100M users?" Run `/pre-mortem` after every PRD.

> **Framework credits:** PRD structure based on Marty Cagan's outcome-focused product management from [*INSPIRED*](https://www.amazon.com/INSPIRED-Create-Tech-Products-Customers/dp/1119387507/) (Wiley, 2018) and [*TRANSFORMED*](https://www.amazon.com/dp/1119697336/) (Wiley, 2024).

---

## Chapter 7: Clarifying Questions — Never Build the Wrong Thing

One of the most expensive Claude Code mistakes is building the wrong thing at full speed. This skill creates a clarification gate before any substantial work begins.

### Create `.claude/skills/clarification-gate/SKILL.md`

```markdown
---
name: clarification-gate
description: Auto-invoke when user asks to build, implement, create, or design
  anything new. Also invoke for vague prompts like "make it better", "add auth",
  "build a dashboard". Do NOT invoke for small edits, fixes, or refactors.
---
# Clarification Gate

Before implementing anything non-trivial, ask max 5 questions grouped by category.
Only ask what is genuinely unknown — never ask what can be inferred from context.
State your current assumptions first so the user can correct them.

## Scale & Context (always ask if unknown)
- Expected users/events at launch vs. 12 months from now?
- B2C (many anonymous) or B2B (fewer, authenticated tenants)?

## Requirements Clarity (ask if ambiguous)
- What does success look like? What metric moves?
- What is explicitly OUT of scope for this iteration?
- Are there existing patterns/components to reuse?

## Constraints (ask if not in CLAUDE.md)
- Latency, cost, or compliance hard constraints?
- Preferred tech choices or ones to avoid?

## Format
Ask as numbered list. Max 5 questions. State assumptions first.
Confirm understanding before writing any code.
```

### Sample clarification exchange

```
👤 User: "Add a notifications system"

🤖 Claude: "Before I build this, my current assumptions — correct me where wrong:

  1. Scale: ~10K users at launch, growing to 1M within a year. Right?
  2. Types: email + in-app. Does this include push (mobile) or SMS?
  3. Delivery: real-time (WebSocket) or near-real-time (polling every 30s)?
  4. Preferences: per-type opt-out controls, or single on/off toggle?
  5. Out of scope: no scheduling or digest batching in v1 — confirm?

  Once confirmed, I'll write the PRD section before touching any code."
```

---

## Chapter 8: Honest Evaluation — Your Brutally Honest Co-Founder

Generic AI flatters ideas. This setup makes Claude Code tell you what will break at 10M users, why your pricing model has a flaw, and what your team isn't ready to build.

### Create `.claude/skills/honest-evaluator/SKILL.md`

```markdown
---
name: honest-evaluator
description: Auto-invoke when user asks "should we build", "what do you think about",
  "evaluate this idea", "is this a good approach", or "pros and cons".
  Also invoke when reviewing PRDs, architecture decisions, or business models.
---
# Honest Evaluator

Evaluate with brutal honesty. No hedging. No "it depends" without specifics.
Your job is to prevent expensive mistakes, not to validate ideas.

## Evaluation Framework

### 1. Strengths (specific mechanisms only — never vague claims)
   BAD: "This is scalable"
   GOOD: "Stateless design means you can add servers without data migration"

### 2. Fatal Flaws (if any — be direct)
   A fatal flaw will cause the approach to fail at the stated scale or goal.
   Example: "This won't work at 100M users because single-writer DB
   hits ceiling at ~10K writes/sec with this schema"

### 3. Hidden Costs (what hasn't been priced in)
   - Engineering time beyond the obvious
   - Infrastructure costs at scale
   - Operational burden (on-call, migrations, debugging)
   - Opportunity cost vs alternatives

### 4. Risk Heatmap (rate each: LOW / MEDIUM / HIGH / CRITICAL)
   - Technical risk | Scale risk | Cost risk | Team risk | Timeline risk

### 5. Verdict — choose one, no waffling:
   BUILD NOW | BUILD LATER | DO NOT BUILD | BUILD DIFFERENTLY

### 6. If "BUILD DIFFERENTLY": give the specific alternative with tech choices
```

### Create `.claude/commands/evaluate.md`

```markdown
# Evaluate

Perform a brutally honest evaluation of the idea, PRD, or approach described.
Follow the Honest Evaluator skill framework exactly. Do not soften the analysis.
The user depends on your honesty to avoid wasting months of engineering effort.
```

### Sample evaluation output

```
💡 Idea: "Build our own real-time messaging infrastructure using raw WebSockets"

✅ STRENGTHS
• Full control over message format and routing
• No per-message vendor costs at extreme scale (>1B messages/mo)

🚨 FATAL FLAW
WebSocket connection management at 100M concurrent users requires stateful
load balancing. This is a complex distributed systems problem your 6-person
team has not solved. Estimated 3-4 months vs. 2 weeks with a managed service.

💸 HIDDEN COSTS
• ~800 engineering hours to build reliably = $120,000 at $150/hr loaded cost
• Redis Cluster for pub/sub: $800-2,400/mo at 10K concurrent users
• Operational: expect 1-2 incidents/month; someone owns this 24/7

🔥 RISK HEATMAP
• Technical: HIGH  |  Scale: MEDIUM  |  Cost: LOW (at extreme scale)
• Timeline: CRITICAL — 3-4 months vs 2 weeks for alternatives

⚖️ VERDICT: BUILD DIFFERENTLY
Use Ably or Pusher for the first 18 months ($0-800/mo up to 3M messages/day).
Build in-house only after you've validated the product and crossed $1M ARR.
Build-vs-buy crossover: approximately 500M messages/month.
```

---

## Chapter 9: Live Backlog & Todo Management

Claude Code should actively maintain your task state as it works — not just write code. Every time it implements something, parks something, or discovers a blocker, it should update your task files automatically.

### The four backlog events Claude should track

| Event | Trigger | Claude Action |
|-------|---------|--------------|
| **IMPLEMENTED** | Feature/fix complete and tested | Mark done in TASKS.md, add commit ref |
| **PARKED** | Scope creep or dependency blocks progress | Add to BACKLOG.md with reason + unblocking condition |
| **DISCOVERED** | New requirement found mid-implementation | Add to BACKLOG.md as P2 with context |
| **BLOCKED** | External dependency prevents progress | Add to Blocked section of TASKS.md with owner + ETA |

### TASKS.md Template

```markdown
# Project Tasks

## P0 — In Progress (max 3)
- [ ] [Task description] | Owner: Claude | Started: YYYY-MM-DD

## P1 — This Sprint (max 7)
- [ ] [Task description]

## Done
- [x] [Task] (completed: YYYY-MM-DD, commit: abc1234)

## Parked / Backlog
- [ ] [Task] (parked: DATE, reason: out of scope, unblock: post-launch)

## Blocked
- [ ] [Task] (blocked by: OWNER, since: DATE, impact: HIGH)
```

### Create `.claude/commands/update-backlog.md`

```markdown
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
```

### Auto-updating hook

```bash
# .claude/hooks/backlog-updater.sh
#!/bin/bash
# No jq dependency — uses bash parameter expansion
# Handles both Write tool ("content") and Edit tool ("new_string") inputs

RAW="$CLAUDE_TOOL_INPUT"

# Try "content" (Write tool) first, then "new_string" (Edit tool)
if echo "$RAW" | grep -q '"content"'; then
  CONTENT="${RAW#*\"content\":\"}"
else
  CONTENT="${RAW#*\"new_string\":\"}"
fi
CONTENT="${CONTENT%%\"*}"

FEEDBACK=""

echo "$CONTENT" | grep -qi "IMPLEMENTED:\|DONE:" && {
  TASK=$(echo "$CONTENT" | grep -i "IMPLEMENTED:\|DONE:" | head -1)
  echo "$(date +%Y-%m-%d): $TASK" >> .claude/task-log.md
  FEEDBACK="Task logged to task-log.md"
}

echo "$CONTENT" | grep -qi "PARKED:\|PARKING:" && {
  TASK=$(echo "$CONTENT" | grep -i "PARKED:\|PARKING:" | head -1)
  echo "- [ ] $TASK (parked $(date +%Y-%m-%d))" >> BACKLOG.md
  FEEDBACK="${FEEDBACK:+$FEEDBACK; }Added parked item to BACKLOG.md"
}

[ -n "$FEEDBACK" ] && echo "{\"feedback\": \"$FEEDBACK\"}"
exit 0
```

---

## Chapter 10: PM ↔ Engineering Concepts Bridge

You don't need to write code, but you need to understand what engineers are deciding and why it matters for your PRD. These are the 10 most important engineering concepts for PMs.

| Engineering Concept | PM Equivalent | What to put in your PRD |
|---------------------|--------------|------------------------|
| **Database index** | Speed dial for data retrieval | Add to non-functionals: "All queries on [field] must be indexed" |
| **API rate limiting** | Traffic throttle | Define limits: "Max 100 requests/minute per user" |
| **Feature flags** | Controlled rollout switch | Specify rollout: "Ship to 1% → 10% → 100%; kill switch required" |
| **Event queue (async)** | Background work | Design UX around async: "User sees pending state, not spinner" |
| **Cache (Redis)** | Short-term memory | Define staleness: "Dashboard data max 5 minutes stale is acceptable" |
| **Database migration** | Schema change | Add to launch checklist: "Zero-downtime migration required" |
| **Webhook** | Outgoing notification to partner | B2B requirement: "Reliable delivery with retry + dead letter queue" |
| **p99 latency** | Worst-case for 1 in 100 users | Set SLOs: "p99 < 200ms for all user-facing APIs" |
| **N+1 query problem** | Ordering coffee, then milk, then sugar separately | Ask eng to review data models before sprint starts |
| **Horizontal scaling** | Hiring more staff vs training current staff to do more | Requirement: "Must scale by adding servers, not upgrading servers" |

> **PM Learning Prompt:** "Explain [engineering concept] using a product management analogy, then tell me what decisions I should make in my PRD based on this."

---

# 🔴 Level 3 — Advanced Mastery

> **Goal:** Master structured AI workflows, architecture decisions, self-learning loops, and systems that improve themselves over time.

---

## Chapter 11: ADR Creation with Cost Analysis

Architecture Decision Records (ADRs) are the most important artifact for teams building at scale. They turn one-time debates into permanent institutional knowledge — and Claude Code should generate one automatically for every significant design choice.

### When Claude auto-generates an ADR

| Trigger phrase | ADR type | What Claude generates |
|---------------|----------|----------------------|
| "Which database should we use..." | Technology Selection | Options, cost comparison, scale implications, verdict |
| "How should we structure multi-tenancy..." | Data Architecture | Isolation models, migration path, cost at 10K tenants |
| "Should we use microservices or monolith..." | System Architecture | Pros/cons, team size fit, operational cost |
| "How do we handle auth..." | Security Architecture | Options, attack surface, compliance, cost |
| "What's our caching strategy..." | Performance Architecture | Cache layers, invalidation strategies, infra cost |
| "How do we deploy this..." | Infrastructure | Cloud options, IaC approach, monthly cost estimate |

### Create `.claude/skills/adr-creator/SKILL.md`

```markdown
---
name: adr-creator
description: Auto-invoke when user is making an architecture decision, choosing
  between technologies, or asking "should we use X or Y". Auto-invoke for any
  prompt mentioning database, infrastructure, scaling, or cost tradeoffs.
---
# ADR Creator Skill

When generating an ADR, use this exact structure:

## ADR-[NUMBER]: [Decision Title]
**Date:** [today]  |  **Status:** Proposed / Accepted / Deprecated / Superseded
**Deciders:** [PM, Tech Lead, CTO, etc.]

### Context
[Situation forcing this decision. Include scale targets, constraints, team size.
Be specific: "We need to support 100M users with p99 < 200ms, team of 6 engineers"]

### Decision Drivers
- [ ] Performance at target scale
- [ ] Monthly infrastructure cost
- [ ] Team expertise / learning curve
- [ ] Vendor lock-in risk
- [ ] Time to implement
- [ ] Operational complexity

### Options Considered

#### Option 1: [Name]
| Criterion | Score (1-5) | Notes |
|-----------|-------------|-------|
| Performance | X | ... |
| Cost @ MVP (<1K users/mo) | $X | ... |
| Cost @ Growth (10K users/mo) | $X | ... |
| Cost @ Scale (1M users/mo) | $X | ... |
| Cost @ Target (100M users/mo) | $X | ... |
| Team expertise | X | ... |
| Lock-in risk | X | ... |

**Pros:** ...  |  **Cons:** ...

[Repeat for each option]

### Decision
[CHOSEN OPTION] because [specific reason tied to decision drivers].

### Cost Analysis Summary
| Scale | Monthly Cost | Key Cost Drivers |
|-------|-------------|-----------------|
| MVP (<1K users) | $X | ... |
| Growth (10K users) | $X | ... |
| Scale (1M users) | $X | ... |
| Target (100M users) | $X | ... |
**Break-even vs alternatives:** [e.g., cheaper than Option B above 50K users]

### Consequences
**Positive:** ...
**Negative (accepted risks):** ...
**Migration path if wrong:** [How we undo this if assumptions prove false]
```

### Sample ADR — Database Selection

```
ADR-001: Primary Database Selection
Date: 2026-03-07  |  Status: Accepted  |  Deciders: PM, Tech Lead, CTO

Context: B2C app targeting 100M users (read-heavy, 10:1 ratio). B2B module
needs multi-tenancy for 10K customers with strict isolation and audit trails.
p99 latency < 200ms. Team of 6, all comfortable with SQL.

Decision: PostgreSQL with PgBouncer + read replicas

NOT MongoDB: Query flexibility not needed, ACID required for B2B billing
NOT MySQL: RLS for multi-tenancy is less mature
NOT CockroachDB: Cost 3x at 100M scale vs self-managed Postgres

Cost: $800/mo (MVP) → $4,200/mo (1M users) → $28,000/mo (100M users)
Migration path: Schema is portable to Aurora Postgres with 2-week migration.
```

> **ADR best practices** from [adr.github.io](https://adr.github.io) and Michael Nygard's original ADR proposal at [cognitect.com/blog](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions).

---

## 📐 Architecture Reference Guides

Detailed architecture content has been moved to standalone reference docs that Claude can load on demand. This keeps the playbook focused while making architecture guidance available when you need it.

| Guide | What it covers | Load with |
|-------|---------------|-----------|
| [Architecture for Scale](docs/architecture-for-scale.md) | Vibe code vs scale decisions, B2C/B2B requirements, recommended tech stack | "Read docs/architecture-for-scale.md" |
| [Architecture Patterns](docs/architecture-patterns.md) | CQRS, Saga, CRDT, multi-tenancy patterns, pattern decision table | "Read docs/architecture-patterns.md" |

---

## Chapter 12: Conversational Agent Experiences — The Acts Framework

The most sophisticated Claude Code setup treats multi-step AI interactions as a narrative — not a one-shot prompt. Writing agent experiences as **Acts** creates structured, testable, resumable conversation flows.

### The 5 Acts

| Act | Purpose | Claude Behaviour | Output |
|-----|---------|-----------------|--------|
| **Act 1: Context** | Establish goals, constraints, current state | Asks clarifying questions (max 5, assumptions first) | Confirmed assumption list |
| **Act 2: Discovery** | Explore problem space, surface unknowns | Runs relevant skills (/discover, /evaluate, ADR) | Options, risks, recommendations |
| **Act 3: Design** | Make choices, create artefacts | Generates PRD, ADR, architecture plan | **PAUSE — wait for approval** |
| **Act 4: Implementation** | Build iteratively with checkpoints | Writes code, updates TASKS.md, asks before scope changes | Working code + updated backlog |
| **Act 5: Review** | Validate, document learnings, update system | Runs tests, suggests CLAUDE.md improvements | Session eval, updated skills |

> **Critical rule:** Never skip the Act 3 pause. Never proceed to implementation without confirmed design.

### Create `.claude/commands/act.md`

```markdown
# Structured Agent Experience

Run a structured 5-act experience for the goal described.

Act 1 — Context: Ask max 5 clarifying questions. State assumptions first.
Act 2 — Discovery: Run /evaluate + identify risks + surface unknown unknowns.
Act 3 — Design: Generate ADR (if architectural) + component/data design.
         ⏸️ PAUSE — wait for explicit user approval before Act 4.
Act 4 — Implementation: Build iteratively. After each major component:
         - Output: "✅ IMPLEMENTED: [what was built]"
         - Output: "⏸️ PARKED: [what was deferred and why]"
         - Output: "🔍 DISCOVERED: [new requirements or risks found]"
Act 5 — Review: Summarise session, run /update-backlog, suggest CLAUDE.md improvement.

Never skip the Act 3 pause. Never proceed to Act 4 without confirmed design.
```

### Complete worked example — B2B Analytics Dashboard

<details>
<summary><strong>Act 1: Context Setting</strong></summary>

```
👤 PM: "We need to build an analytics dashboard for our B2B customers."

🤖 Claude: "Before I start, let me confirm my assumptions:
  1. Each customer (tenant) sees only their own data — RLS required?
  2. Estimated customers: 50 at launch, growing to 10K over 2 years?
  3. Primary metrics: DAU, feature adoption, funnel conversion — or different?
  4. Real-time (WebSocket) or near-real-time (5-min refresh) is acceptable?
  5. Existing stack: Next.js + Postgres — stay in stack?

  I'm assuming out of scope: custom report builder, data exports, white-labelling."

👤 PM: "Yes to all. Also p99 dashboard load < 2 seconds."
```

</details>

<details>
<summary><strong>Act 2: Discovery & Analysis</strong></summary>

```
🤖 Claude: "Running /evaluate on this approach...

  ⚡ Key insight: At 10K tenants with shared Postgres, analytics queries touching
  aggregated event tables will cause tenant contention. Recommendation:
  Pre-aggregate daily stats via BullMQ background job, cache per-tenant summaries
  in Redis. This brings p99 from ~4s to ~300ms at 10K tenants.

  🚨 FATAL RISK: Without read replicas, analytics queries starve write operations
  during peak hours. Adding to ADR-003.

  ⏸️ PARKED: Custom date-range picker (adds 3 days engineering, out of scope v1)
  🔍 DISCOVERED: Need audit log for GDPR compliance — adding to backlog."
```

</details>

<details>
<summary><strong>Act 3: Design (with approval pause)</strong></summary>

```
🤖 Claude: "Generating ADR-003: Analytics Query Architecture...
  [Full ADR with cost at 50/1K/10K tenants]

  Proposed components:
  • /components/analytics/DashboardShell.tsx (tenant context)
  • /components/analytics/MetricCard.tsx (reusable, any metric)
  • /api/analytics/[tenantId]/summary.ts (auth + RLS enforced)
  • /jobs/analytics-aggregator.ts (BullMQ daily job)

  ⏸️ PAUSING — shall I proceed with this design, or adjust first?"
```

</details>

<details>
<summary><strong>Act 4: Implementation</strong></summary>

```
🤖 Claude: "Implementing in phases:

  ✅ IMPLEMENTED: DashboardShell with tenant isolation (RLS confirmed in tests)
  ✅ IMPLEMENTED: MetricCard component with skeleton loading state
  ⏸️ PARKED: Sparkline charts — recharts adds 40KB bundle, deferring to v1.1
  🔍 DISCOVERED: Missing index on events.tenant_id + created_at — adding migration

  📋 TASKS.md updated: 2 complete, 1 parked, 1 new item added."
```

</details>

<details>
<summary><strong>Act 5: Review & Learning</strong></summary>

```
🤖 Claude: "Session summary:
  ✅ Delivered: DashboardShell, MetricCard, API route, aggregation job
  📄 ADR-003 stored in docs/adr/
  📋 TASKS.md: 4 complete, 2 parked, 1 blocked (read replica — infra team)

  💡 CLAUDE.md improvement: Add rule — 'Always check for missing DB indexes
  when writing new query patterns.' I nearly missed the events table index.

  📊 Quality estimate: 9/10"
```

</details>

### Non-technical PM discovery example

<details>
<summary><strong>Full Acts for a Discovery Session (no code)</strong></summary>

```
━━━ ACT 1 ━━━
👤 PM: "I want to run a discovery session for a new AI writing assistant feature"
🤖 Claude: "Who is the primary user: professional writers, students, or knowledge
  workers? And what's the one problem they can't solve today?"

━━━ ACT 2 ━━━
🤖 Claude: "Key insight: 73% of 'writing is hard' complaints are actually
  'starting is hard' — the blank page problem. This reframes the solution space
  entirely: you need a first-draft generator, not a writing enhancer.

  Riskiest assumption: Users will trust AI drafts enough to start from them,
  rather than ignoring them and starting from scratch anyway."

━━━ ACT 3 ━━━
🤖 Claude: "Recommended experiment before building: Show 20 users an AI-generated
  first draft of something they have to write this week. Measure:
  (a) did they use it as starting point?
  (b) how much did they edit?
  (c) did they finish faster?

  This is a 1-week pretotype — no code needed.
  Shall I generate the interview script and pretotype protocol?"

━━━ ACT 5 (session close) ━━━
🤖 Claude: "Backlog updated. /write-prd queued for after experiment results.
  Next session trigger: when experiment data is back."
```

</details>

> **Concept credit:** The theatrical "Acts" framing for AI interactions draws from narrative design principles and is inspired by the structured conversation flows documented by practitioners in the [awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) community.

---

## Chapter 13: Self-Learning Loops

Self-learning loops work at three levels: **session** (what worked this session), **project** (what patterns are improving), and **system** (the instructions themselves getting better over time).

| Loop Level | Mechanism | What gets improved |
|-----------|-----------|-------------------|
| **Session** | PostToolUse hooks + error logging | Immediate error → fix → validation |
| **Project** | CLAUDE.md iteration + skill refinement | Instruction clarity, common mistakes |
| **System** | Auto-detect bad patterns → update skills | Code quality, architecture consistency |

### Session-end learning hook

Add to `.claude/settings.json`:

```json
"Stop": [{
  "hooks": [{
    "type": "command",
    "command": "echo '# Session $(date)\n## Git diff: $(git diff --stat HEAD 2>/dev/null)\n## Tests: $(npm test 2>&1 | tail -3)' >> .claude/session-log.md"
  }]
}]
```

### Weekly improvement ritual

Every Friday, run this prompt:

```
"Review .claude/session-log.md from this week.
Identify:
1. Patterns where Claude missed instructions (candidates for hooks)
2. Skills that triggered incorrectly or not at all (refine descriptions)
3. Recurring mistakes (add to CLAUDE.md or create a new skill)
Suggest 3 specific improvements with the exact change to make."
```

> **The compounding effect:** Teams that run this ritual weekly report measurable improvement in instruction-following over time, as CLAUDE.md rules get refined and edge cases get moved to deterministic hooks. See community discussion at [rosmur.github.io/claudecode-best-practices](https://rosmur.github.io/claudecode-best-practices/).

---

## Chapter 14: Token Optimization Strategies

Context window management is the primary failure mode for advanced Claude Code users. These strategies prevent quality degradation.

| Strategy | How to implement | Impact |
|----------|-----------------|--------|
| `/compact` at 50% context | Run before it auto-compacts at ~80% | Prevents quality degradation at end of long sessions |
| Modular CLAUDE.md | Root file <200 lines; sub-docs loaded on demand | 60-80% token reduction vs monolithic file |
| Skill descriptions > full content | Skills load only when description matches | Skills only consume tokens when relevant |
| `/clear` between tasks | Use when switching to unrelated work | Prevents cross-contamination |
| Reference files, not contents | Write "see docs/arch.md" not the full doc | Claude fetches on demand |
| Feature-specific subagents | Each agent gets focused context | Main context stays clean |
| Structured prompts | Use XML tags: `<context>`, `<task>`, `<constraints>` | Less ambiguity, faster parsing |

### /compact vs /clear — when to use which

```
/context  → Run first: see how full your window is
/compact  → Mid-task, need to continue: compresses history, keeps working memory
/clear    → Switching tasks entirely: full reset, no contamination
/model    → Check which model is active
/usage    → Set a weekly token budget
```

> **Community finding:** Auto-formatting hooks can consume significant tokens (160K reported across 3 rounds). Consider manual formatting between sessions rather than PostToolUse auto-format. Source: [rosmur.github.io/claudecode-best-practices](https://rosmur.github.io/claudecode-best-practices/).

---

## Chapter 15: Auto-Improving Your Instructions

### Create `.claude/skills/instruction-auditor/SKILL.md`

```markdown
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
```

### Prompt quality rubric

| Quality | Signals | Fix |
|---------|---------|-----|
| **Weak** | No context, no scale targets, no constraints | Add: stack, targets, patterns to use/avoid |
| **Medium** | Has context but missing success criteria | Add: acceptance criteria, performance targets |
| **Strong** | Context + criteria + constraints + examples | Target state — produces production-ready code |
| **Over-specified** | Step-by-step micromanagement | Trust Claude with the *how*; specify *what* and *why* |

---

## Chapter 16: Making This Your Default Setup

### Global configuration (applies to all projects)

```
~/.claude/
├── settings.json          # Global safety hooks, notifications
├── CLAUDE.md              # Personal preferences, always-on rules
└── skills/
    └── personal-style/SKILL.md   # Your communication preferences
```

### One-time global setup script

```bash
#!/bin/bash
# Run once: bash setup-claude-global.sh

# Create global skill directory
mkdir -p ~/.claude/skills/personal-style

# Install PM Skills globally
claude plugin marketplace add phuryn/pm-skills

echo "✅ Claude Code default setup complete!"
```

### Per-project bootstrap prompt

When starting any new project, run this in Claude Code:

```
"Create a .claude/ directory structure following Anthropic best practices.
Include:
- settings.json with safety hooks (block rm -rf, git push --force, DROP TABLE)
- root CLAUDE.md under 200 lines documenting [your stack and scale targets]
- skill stubs for: adr-creator, clarification-gate, honest-evaluator, instruction-auditor
- commands: update-backlog, evaluate, act
- a skill-router UserPromptSubmit hook that recommends pm-skills commands when relevant
Also create TASKS.md and BACKLOG.md with the standard template."
```

### Smart skill router hook

```bash
# .claude/hooks/skill-router.sh
#!/bin/bash
# Extract prompt without jq — use bash parameter expansion
PROMPT="$CLAUDE_TOOL_INPUT"
PROMPT="${PROMPT#*\"prompt\":\"}"
PROMPT="${PROMPT%%\"*}"
[ -z "$PROMPT" ] && exit 0

FEEDBACK=""
echo "$PROMPT" | grep -qi "PRD\|product requirements" && \
  FEEDBACK="${FEEDBACK}\n Consider: /write-prd for structured 8-section PRD"
echo "$PROMPT" | grep -qi "discover\|research\|assumption" && \
  FEEDBACK="${FEEDBACK}\n Consider: /discover — chains 4 PM skills automatically"
echo "$PROMPT" | grep -qi "architecture\|database\|scale\|infrastructure" && \
  FEEDBACK="${FEEDBACK}\n Consider: ADR — describe scale targets for cost analysis"
echo "$PROMPT" | grep -qi "deploy\|release\|launch\|ship" && \
  FEEDBACK="${FEEDBACK}\n Consider: /pre-mortem before launch"
echo "$PROMPT" | grep -qi "should we\|evaluate\|pros.*cons\|tradeoff" && \
  FEEDBACK="${FEEDBACK}\n Consider: /evaluate — brutally honest assessment"
echo "$PROMPT" | grep -qi "build\|create\|implement\|add" && \
  FEEDBACK="${FEEDBACK}\n Consider: /act — structured 5-act experience with clarification gate"

[ -n "$FEEDBACK" ] && echo "{\"feedback\": \"$FEEDBACK\"}"
exit 0
```

Wire into settings.json:
```json
"UserPromptSubmit": [{
  "hooks": [{ "type": "command", "command": ".claude/hooks/skill-router.sh", "timeout": 5 }]
}]
```

---

# ⚡ Quick Reference

## Situational Quick Reference Card

| Situation | What to do |
|-----------|-----------|
| Starting any new feature | `/act [goal]` → 5-act structured experience with clarification gate |
| Need architecture decision | `/evaluate` + ADR auto-generated by `adr-creator` skill |
| Need cost analysis | ADR template includes costs at 4 scale tiers (MVP → 100M users) |
| After completing work | `/update-backlog` — marks done, adds parked, logs discovered items |
| Idea needs validation | `/evaluate [idea]` → strengths / fatal flaws / BUILD NOW/LATER/DIFFERENTLY |
| Starting ambiguous work | `clarification-gate` fires — max 5 questions, assumptions stated first |
| Context window 50%+ full | `/compact` before auto-compact degrades quality |
| Switching to different task | `/clear` — full reset, prevents interference |
| Instruction missed repeatedly | Move from CLAUDE.md to a `PreToolUse`/`PostToolUse` hook |
| Weekly system improvement | Act 5 ritual → "suggest 3 CLAUDE.md improvements from this week" |
| Before any launch | `/pre-mortem [feature]` — Tigers / Paper Tigers / Elephants |
| Non-tech PM learning SE | "Explain [concept] as a PM analogy + what it means for my PRD" |
| Token check | `/context` → `/model` to see usage → `/usage` to set budget |
| Prompt quality low | Add: scale targets + acceptance criteria + constraints |

## Command Routing Decision Tree

```
New request from user
        │
        ▼
Is this a safety/quality rule?
   YES → Hook (PreToolUse / PostToolUse)
   NO  ↓
        ▼
Must it ALWAYS run without exception?
   YES → Hook
   NO  ↓
        ▼
Do I want to trigger it explicitly?
   YES → Slash Command (.claude/commands/)
   NO  ↓
        ▼
Is it a complex multi-step workflow?
   YES → Subagent (.claude/agents/) 
   NO  ↓
        ▼
Does it need external services?
   YES → MCP Server (.mcp.json) + Command/Agent
   NO  ↓
        ▼
→ Skill (.claude/skills/) — auto-invokes when description matches
```

## Hook Events Reference

| Event | Fires when | Best use case |
|-------|-----------|--------------|
| `PreToolUse` | Before any tool call | Block dangerous commands, enforce branch rules |
| `PostToolUse` | After any tool call | Auto-format, run tests, validate output |
| `SessionStart` | Session begins | Inject sprint context, show recent commits |
| `Notification` | Claude needs attention | Desktop alerts, Slack notifications |
| `Stop` | Claude finishes responding | Build checks, session metrics |
| `UserPromptSubmit` | User submits a prompt | Auto-recommend skills/commands |
| `ConfigChange` | Settings files change | Audit logging |
| `SubagentStart` | Subagent launches | Inject subagent context |
| `SubagentStop` | Subagent completes | Collect subagent results |

## PM Skills Commands at a Glance

| Command | What it chains | When to use |
|---------|--------------|------------|
| `/discover [idea]` | brainstorm → assumptions → prioritise → experiments | Starting any new feature or product |
| `/write-prd [feature]` | 8-section PRD (Cagan framework) | Before any engineering work |
| `/strategy [product]` | 9-section Product Strategy Canvas | Quarterly/annual planning |
| `/plan-launch [feature]` | GTM: beachhead → ICP → channels → launch plan | 4-6 weeks before launch |
| `/pre-mortem [PRD]` | Tigers / Paper Tigers / Elephants risk analysis | After PRD, before sprint |
| `/sprint plan` | Capacity estimation, story selection, risk ID | Sprint planning sessions |
| `/sprint retro` | Structured retrospective facilitation | End of each sprint |
| `/market-scan [market]` | SWOT + PESTLE + Porter's Five Forces + Ansoff | Competitive analysis |
| `/analyze-test [data]` | Statistical significance + ship/extend/stop | After any A/B experiment |
| `/north-star [product]` | North Star Metric + input metrics | Metrics alignment |
| `/write-stories user` | User stories (3C's + INVEST criteria) | Before sprint grooming |
| `/evaluate [idea]` | Honest: strengths / flaws / costs / verdict | Any idea or architecture choice |
| `/act [goal]` | Full 5-act structured experience | Any non-trivial new work |
| `/update-backlog` | Sync TASKS.md: done / parked / discovered | End of every session |

---

# 📚 Credits & References

This guide synthesises work from many practitioners and researchers. Full attribution:

### Frameworks & Methodologies

| Framework | Source | Where used in this guide |
|-----------|--------|--------------------------|
| Continuous Discovery | Teresa Torres — [*Continuous Discovery Habits*](https://www.amazon.com/dp/1736633309) (Product Talk, 2021) | `/discover`, assumption mapping, OST |
| Product Management | Marty Cagan — [*INSPIRED*](https://www.amazon.com/dp/1119387507) & [*TRANSFORMED*](https://www.amazon.com/dp/1119697336) (Wiley, 2018/2024) | PRD template, outcome-focused roadmaps |
| Pretotypes | Alberto Savoia — [*The Right It*](https://www.amazon.com/dp/0062884654) (HarperBusiness, 2019) | Experiment design, `/brainstorm experiments new` |
| Lean Product | Dan Olsen — [*The Lean Product Playbook*](https://www.amazon.com/dp/1118960874) (Wiley, 2015) | Product-market fit hierarchy |
| Strategy | Roger L. Martin — [*Playing to Win*](https://www.amazon.com/dp/B0F25SDYWV) (HBR Press, 2013) | Strategy canvas |
| Running Lean | Ash Maurya — [*Running Lean*](https://www.amazon.com/dp/B004J4XGN6) (O'Reilly, 2012) | Lean Canvas |
| Business Models | Strategyzer — [*Business Model Generation*](https://www.amazon.com/dp/0470876417) & [*Value Proposition Design*](https://www.amazon.com/dp/1118968050) | BMC, VPC |
| OKRs | Christina Wodtke — [*Radical Focus*](https://www.amazon.com/dp/0996006052) (Cucina Media, 2021) | OKR framework |
| Jobs to Be Done | Anthony Ulwick — [*Jobs to Be Done*](https://jobs-to-be-done-book.com) (Idea Bite Press, 2016) | JTBD value propositions |
| Lean Analytics | Croll & Yoskovitz — [*Lean Analytics*](https://www.amazon.com/dp/1449335675) (O'Reilly, 2013) | Metrics, North Star |
| Growth | Sean Ellis — [*Hacking Growth*](https://www.amazon.com/dp/045149721X) (Crown Business, 2017) | Growth loops |
| Go-to-Market | Maja Voje — [*Go-To-Market Strategist*](https://gtmstrategist.com) | GTM motions, beachhead |

### Tools & Repositories

| Project | Creator | Stars | What this guide uses |
|---------|---------|-------|---------------------|
| [phuryn/pm-skills](https://github.com/phuryn/pm-skills) | [Paweł Huryn](https://www.productcompass.pm) | ⭐ 55 | 65 PM skills, 36 commands, 8 plugins |
| [hesreallyhim/awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) | Community | — | Skills, hooks, commands directory |
| [shanraisshan/claude-code-best-practice](https://github.com/shanraisshan/claude-code-best-practice) | Shan Raisshan | — | Command → Agent → Skill architecture |
| [ChrisWiles/claude-code-showcase](https://github.com/ChrisWiles/claude-code-showcase) | Chris Wiles | — | Reference hooks, settings, skills |
| [ComposioHQ/agent-orchestrator](https://github.com/ComposioHQ/agent-orchestrator) | [Composio](https://composio.dev) | ⭐ 4.8K | Optional parallel agent orchestration (`--with-ao`) |

### Official Documentation

| Resource | URL |
|----------|-----|
| Claude Code Documentation | [code.claude.com/docs](https://code.claude.com/docs) |
| Claude Code Best Practices | [code.claude.com/docs/en/best-practices](https://code.claude.com/docs/en/best-practices) |
| Hooks Guide | [code.claude.com/docs/en/hooks-guide](https://code.claude.com/docs/en/hooks-guide) |
| Hooks Reference | [code.claude.com/docs/en/hooks](https://code.claude.com/docs/en/hooks) |
| Skills Guide | [code.claude.com/docs/en/skills](https://code.claude.com/docs/en/skills) |
| Anthropic Model Docs | [docs.anthropic.com](https://docs.anthropic.com) |

### Community Writing

- [genaiunplugged.substack.com](https://genaiunplugged.substack.com/p/claude-code-skills-commands-hooks-agents) — Skills, Commands, Hooks & Agents tutorial
- [alexop.dev/posts/understanding-claude-code-full-stack](https://alexop.dev/posts/understanding-claude-code-full-stack/) — Full stack MCP/Skills/Subagents guide
- [rosmur.github.io/claudecode-best-practices](https://rosmur.github.io/claudecode-best-practices/) — Community aggregated best practices
- [eesel.ai/blog/claude-code-best-practices](https://www.eesel.ai/blog/claude-code-best-practices) — 7 essential production best practices
- [youngleaders.tech](https://www.youngleaders.tech/p/claude-skills-commands-subagents-plugins) — Skills vs Commands vs Subagents vs Plugins
- ADR format: [adr.github.io](https://adr.github.io) and Michael Nygard's original post at [cognitect.com](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions)

---

## 🤝 Contributing

This is an open-source project. Contributions are welcome.

**Ways to contribute:**
- Add new PM skills or commands you've found effective
- Improve the PM ↔ Engineering bridge with new concepts
- Share sample CLAUDE.md files from real projects (anonymised)
- Add use case examples (Acts) for different PM contexts
- Translate sections for non-English-speaking PM communities
- Report outdated Claude Code APIs or deprecated features

**Contribution guidelines:**
1. Fork the repo and create a feature branch
2. Follow the existing structure (level-appropriate content, source credits)
3. Test any code/hooks before submitting
4. Include credits for any frameworks or ideas you're drawing from
5. Submit a PR with a clear description of what you've added and why

---

## 📄 License

MIT License — see [LICENSE](LICENSE) for details.

You are free to use, modify, and distribute this guide for personal and commercial use with attribution.

---

## ⚠️ Disclaimer

THIS GUIDE IS PROVIDED FOR **EDUCATIONAL AND INFORMATIONAL PURPOSES ONLY**.

- This playbook does **not** constitute professional advice of any kind, including engineering, legal, security, or product management advice.
- All code examples, shell scripts, hooks, and configurations are provided **"AS IS"** without warranty of any kind, express or implied.
- The authors and contributors are **not** responsible for any decisions, actions, or consequences arising from the use of this guide, including data loss, security incidents, or business decisions made based on the frameworks presented herein.
- Users are **solely responsible** for reviewing, testing, and validating all code before use in any environment.
- Claude Code is a product of [Anthropic](https://www.anthropic.com). This guide is an independent community resource and is **not** affiliated with, endorsed by, or sponsored by Anthropic.
- The [pm-skills](https://github.com/phuryn/pm-skills) plugin collection is maintained by Pawel Huryn. This guide references and builds upon pm-skills but is independently maintained.

See [NOTICE](NOTICE) for full attribution and legal details.

---

## 🔐 Security & Governance

| Document | Description |
|----------|-------------|
| [SECURITY.md](SECURITY.md) | Vulnerability reporting policy |
| [PRIVACY.md](PRIVACY.md) | Privacy policy |
| [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) | Community standards |
| [CONTRIBUTING.md](CONTRIBUTING.md) | How to contribute |
| [NOTICE](NOTICE) | Attribution and legal disclaimer |

---

<div align="center">

**Built for the PM community • [CHANGELOG](CHANGELOG.md) • March 2026**

*If this guide helped you, please ⭐ the repo and share it with your PM network.*

[🟢 Back to Level 1](#-level-1--foundations) • [🟡 Back to Level 2](#-level-2--pm-productivity) • [🔴 Back to Level 3](#-level-3--advanced-mastery)

</div>
