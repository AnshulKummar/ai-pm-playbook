# Contributing to AI PM Playbook

Thank you for your interest in contributing! This guide is built by and for the PM community.

## How to Contribute

### Reporting Issues
- Open an issue describing the problem or suggestion
- Include which chapter/section is affected
- For outdated Claude Code APIs, include the current correct syntax

### Submitting Changes

1. **Fork** the repository
2. **Create a branch** for your change (`git checkout -b add-new-skill`)
3. **Make your changes** following the guidelines below
4. **Test** any code/hooks before submitting
5. **Submit a PR** with a clear description

### Content Guidelines

- **Level-appropriate**: Place content in the right level (Foundations, PM Productivity, or Advanced Mastery)
- **PM-first language**: Explain engineering concepts with PM analogies before technical details
- **Credit sources**: Include attribution for any frameworks, books, or tools you reference
- **Test hooks and scripts**: All shell scripts should be tested on both macOS and Windows (Git Bash)
- **No jq dependency**: Use bash parameter expansion for JSON parsing in hooks (jq is not universally available)

### What We're Looking For

- New PM skills or commands you've found effective
- PM-to-engineering concept bridges
- Sample CLAUDE.md files from real projects (anonymised)
- Worked examples (Acts) for different PM contexts
- Translations for non-English-speaking PM communities
- Fixes for outdated Claude Code APIs or deprecated features

### Security

If you discover a security issue in any code example, hook, or script, please report it privately. See [SECURITY.md](SECURITY.md) for details. **Do not open a public issue for security vulnerabilities.**

### Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). Be respectful, constructive, and inclusive. We're all here to help PMs ship better products.

### License Agreement

By submitting a pull request, you agree that your contributions are licensed under this project's [MIT License](LICENSE).

## Questions?

Open an issue or start a discussion. We're happy to help.
