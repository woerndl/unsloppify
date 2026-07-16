# Changelog

## 1.0.0 - 2026-07-16

Restructure into two tiers.

- `baseline/CLAUDE-baseline.md`: an always-on block to paste into a global CLAUDE.md or AGENTS.md.
- `SKILL.md` rewritten around six failure modes, each with a test, a ban list, an escape clause, and a rewrite example, plus per-context rules and an audit procedure.
- `references/patterns.md`: 76 entries grouped by failure mode, replaces `references/tropes.md`.
- `scripts/scan.sh` and `references/phrases.txt`: a deterministic scan against 380 phrase patterns, works with ripgrep or grep.
- `tests/`: 15 manual cases with expected findings.

Versions before 1.0.0 were unversioned drafts.
