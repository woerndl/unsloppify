# 👋🤖 unsloppify

![unsloppify banner](.github/banner.webp)

[![PRs welcome](https://img.shields.io/badge/PRs-welcome-brightgreen)](#contributing)
[![Failure modes](https://img.shields.io/badge/failure%20modes-6-purple)](SKILL.md)
[![Claude Code compatible](https://img.shields.io/badge/Claude%20Code-compatible-orange?logo=anthropic&logoColor=white)](https://claude.com/claude-code)
[![Codex compatible](https://img.shields.io/badge/Codex-compatible-black?logo=openai&logoColor=white)](https://github.com/openai/codex)

Removes AI writing tells from any generated text. It has two tiers, one always on and one on demand.

The baseline is a short block you paste into your global CLAUDE.md or AGENTS.md. It stays on for every task and costs few tokens. The skill loads on demand when you draft or audit longer prose, and it runs the full pipeline: six failure-mode tests, context rules, a pattern catalogue, and a deterministic phrase scanner. Both tiers judge the writing on its own terms, so they improve prose whether a person or a model wrote it. Neither is an AI-authorship detector.

Each banned list is a set of examples for a class to recognize. Keep a flagged form only when it is genuinely necessary, the exact word for the exact case that no plain phrase covers.

## Install

Requires [`skills`](https://www.npmjs.com/package/skills) (`vercel-labs/skills`). Works with any tool that reads the skills format, including Claude Code and Codex.

Skill (the on-demand tier):

```bash
npx skills add woerndl/unsloppify -g -a <agent>   # claude-code | codex | ...
```

Or from a local clone, if you want to edit the patterns:

```bash
git clone https://github.com/woerndl/unsloppify.git
cd unsloppify
npx skills add . -g -a <agent>
```

Verify with `npx skills list`. Start a fresh session and ask the agent to draft something. `unsloppify` should appear in the available-skills list.

Baseline (the always-on tier): open `baseline/CLAUDE-baseline.md` and paste its contents into your global CLAUDE.md or AGENTS.md. Keep the version comment on the first line so future updates are easy to diff. Adjust the ban list to taste.

## The six failure modes

1. Importance inflation: asserting weight the content does not show (crucial, essential, cannot be overstated).
2. Manufactured drama: staging tension the facts do not pay off ("it isn't just X, it's Y", self-answered questions).
3. Performative register: prestige vocabulary or insider slang where a plain verb fits (delve, leverage, serves as).
4. False precision: confident labels that name nothing checkable (a bare "race condition", "studies show").
5. Template filling: openings, closings, and bold-first bullets that arrive because the form expects them.
6. Process leakage: traces of how the text was made, such as chat register or review history in a finished artifact.

Each mode has a delete-or-name test, a ban list, an escape clause, and a rewrite example in [`SKILL.md`](SKILL.md). All pattern entries are in [`references/patterns.md`](references/patterns.md), loaded only for deep audits.

## Scanner

`scripts/scan.sh` matches text against the phrase patterns in `references/phrases.txt` and prints every hit:

```bash
scripts/scan.sh README.md
cat draft.md | scripts/scan.sh
```

A single file argument prints `line:match`. With two or more files each hit gains a `file:` prefix. The script exits 0 when it finds hits and 1 when the file is clean, the reverse of most commands and the same as `grep`, so `scripts/scan.sh draft.md || echo clean` reads correctly. It uses `rg` when present and falls back to `grep -E`. It catches phrase-level tells only. Structural tells such as bold-first bullets or value-echo comments need the model's read.

## Test cases

`tests/` holds manual cases with expected findings. See [`tests/README.md`](tests/README.md) for how to run them against a fresh session before any release that changes SKILL.md, the patterns, or the phrase list.

## Contributing

The pattern collection is collaborative, and new models keep producing new tells. If you spot a pattern that is missing, or have a sharper example for one that is there, open an issue or a PR. To try a new entry locally first, fork the repo and edit `references/patterns.md`. Each new entry should:

- Name its source in the `Source:` line.
- Carry a false-positive check: an `Acceptable:` line for the context where the form is fine.
- Prefer a replacement phrasing over a flat ban.
- Add its literal phrases to `references/phrases.txt` so the scanner picks them up.
- Use no em dashes and no semicolons anywhere, per the skill's own rules.

## Sources

The patterns draw on several collections. Every source and what was taken from it:

| Source | What was taken | License | Attribution |
| --- | --- | --- | --- |
| [@ossa-ma's gist](https://gist.github.com/ossa-ma/f3baa9d25154c33095e22272c631f5a1) and [tropes.fyi](https://tropes.fyi) | The trope collection the first version grew from, some entries still trace to it | No explicit license, credit requested | Credited in `Source:` lines |
| Gist comment contributors | Individual tropes added in the gist comments | Same as the gist | [@khaosdoctor](https://github.com/khaosdoctor), [@felikcat](https://github.com/felikcat), [@finrunsfar](https://github.com/finrunsfar) |
| [mastra ai-tells](https://github.com/mastra-ai/mastra) | Phrase lists | Apache 2.0 | Attribution kept in `Source:` lines in `references/patterns.md` |
| [Wikipedia, Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing) (WP:AISIGNS) | Pattern ideas only, all descriptions rewritten, no copied prose | CC BY-SA | Source noted here |
| [theclaymethod/unslop](https://github.com/theclaymethod/unslop) | Register guards, fact preservation, the overcorrection warning. Credits [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop) for its phrase list | MIT | Credited here |
| Hacker News discussion threads | Pattern ideas, no copied prose | Discussion, no copied text | Source noted here |
| This project | Patterns observed directly while building the skill | MIT | Original entries |

## License

This repo is MIT licensed, see [`LICENSE`](LICENSE). Individual pattern entries name their sources in the `Source:` lines of `references/patterns.md`, and the sources table above lists every collection consulted.
