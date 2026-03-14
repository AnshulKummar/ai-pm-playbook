# Security Policy

## Scope

This repository contains **educational documentation** (a guide/playbook for Product Managers using Claude Code). It does not contain application software, services, or APIs. The security scope is limited to:

- Shell scripts and hooks included as code examples
- Configuration files (CLAUDE.md, settings.json snippets)
- Plugin/skill definitions

## Reporting a Vulnerability

If you discover a security issue in any code example, hook, or script in this repository:

1. **Do NOT open a public issue.**
2. Use [GitHub Security Advisories](https://github.com/AnshulKummar/claude-code-pm-playbook/security/advisories/new) to report privately.
3. Alternatively, contact the maintainer via [LinkedIn](https://www.linkedin.com/in/anshula42/).

### What to Include

- Description of the vulnerability
- Which file/section is affected
- Steps to reproduce
- Potential impact

### Response Timeline

| Severity | Target Response |
|----------|----------------|
| Critical | 48 hours acknowledgment, 7 days fix |
| High | 48 hours acknowledgment, 14 days fix |
| Medium/Low | Next release cycle |

## Security Considerations for Users

When using the hooks and scripts from this guide:

- **Review all scripts before running them.** Never execute shell scripts from any source without reading them first.
- **No secrets in CLAUDE.md.** Never put API keys, tokens, or credentials in CLAUDE.md or any committed file. Use environment variables.
- **Hook scripts run automatically.** Understand that hooks configured in `settings.json` execute on every matching Claude Code event. Review hook scripts carefully before enabling them.
- **Test in isolation first.** Run any hook or script manually before configuring it as an automated hook.

## Disclaimer

This guide does not constitute security advice. The authors are not responsible for any security incidents arising from the use of code examples, hooks, or configurations described in this guide. Users are solely responsible for reviewing and securing their own environments.
