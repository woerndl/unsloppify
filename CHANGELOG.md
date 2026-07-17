# Changelog

## 1.2.0 - 2026-07-17

Narrow the trigger to text deliverables. A Codex session loaded the skill for
a file-download task because its chat commentary counted as "text others will
read".

- `SKILL.md`: the description states when to load (text artifact is the
  deliverable or a major part of one) and when not to (chat replies, status
  updates, completion summaries around a non-text task). New "When to load"
  section with the same rule and an exit for a skill loaded in error.
- `baseline/CLAUDE-baseline.md` (v1.1): the closing line names the qualifying
  artifacts and routes conversational text to the baseline instead of the
  skill.

## 1.1.0 - 2026-07-16

Catch dramatic absolutes.

- `references/phrases.txt`: scanner patterns for dramatic "cannot", "never", and "always" constructions (cannot afford to, simply cannot, can't go wrong, there is no other way, there can be no doubt, never be the same, cannot be understated, stakes and crossroads variants), drawn from mastra's AbsoluteAssertions and UrgencyInflation lists.
- `references/phrases.txt`: a broad-triage group surfaces bare `cannot`, `never`, `gate`, `actually`, `land`, `ship`, and `sits`, with the rule that most hits are legitimate and each takes a per-instance test named in the group comment.
- `references/phrases.txt`: the list grows from 380 to 649 patterns via a full mastra ai-tells inventory, covering figurative verbs (lands silently, falls short, holds water, casts doubt, lends credence), affirmative formulas, anthropomorphic justification, hedges, narrative pivots, opening and closing cliches, transitions, filler, vague attributions, and vocabulary tells (leverage, robust, pivotal). Capitalization-dependent mastra rules stay in the model pass because the scanner matches case-insensitively.
- `references/patterns.md`: the Absolute overreach entry names the bare-absolute class, "cannot"/"never"/"always" where plain "not" states the fact, and notes it needs the model pass.
- `SKILL.md`: mode 1 bans dramatic absolutes, with a literal impossibility as the escape.
- `tests/cases/16-docs-dramatic-absolutes.md`: case covering both the scanner constructions and the bare form.

## 1.0.0 - 2026-07-16

Restructure into two tiers.

- `baseline/CLAUDE-baseline.md`: an always-on block to paste into a global CLAUDE.md or AGENTS.md.
- `SKILL.md` rewritten around six failure modes, each with a test, a ban list, an escape clause, and a rewrite example, plus per-context rules and an audit procedure.
- `references/patterns.md`: 76 entries grouped by failure mode, replaces `references/tropes.md`.
- `scripts/scan.sh` and `references/phrases.txt`: a deterministic scan against 380 phrase patterns, works with ripgrep or grep.
- `tests/`: 15 manual cases with expected findings.

Versions before 1.0.0 were unversioned drafts.
