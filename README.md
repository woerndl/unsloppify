# 👋🤖 unsloppify

![unsloppify banner](.github/banner.webp)

[![PRs welcome](https://img.shields.io/badge/PRs-welcome-brightgreen)](#contributing)
[![Tropes catalogued](https://img.shields.io/badge/tropes-39-purple)](references/tropes.md)
[![Claude Code compatible](https://img.shields.io/badge/Claude%20Code-compatible-orange?logo=anthropic&logoColor=white)](https://claude.com/claude-code)
[![Codex compatible](https://img.shields.io/badge/Codex-compatible-black?logo=openai&logoColor=white)](https://github.com/openai/codex)

An agent skill that removes AI text tells and tropes from drafts. Works with any tool that supports the [`vercel-labs/skills`](https://www.npmjs.com/package/skills) format, including Claude Code, Codex, and others.

`SKILL.md` lists the categories. The full catalogue with examples lives in `references/tropes.md`, which only loads when the agent is actually drafting or editing prose.

## Install

Requires [`skills`](https://www.npmjs.com/package/skills) (`vercel-labs/skills`).

```bash
npx skills add woerndl/unsloppify -g -a <agent>   # claude-code | codex | ...
```

Or from a local clone (if you want to edit the catalogue):

```bash
git clone https://github.com/woerndl/unsloppify.git
cd unsloppify
npx skills add . -g -a <agent>
```

Verify:

```bash
npx skills list
```

Then start a fresh Claude Code session and ask it to draft something. `unsloppify` should appear in the available-skills list and run on prose tasks.

## What it covers

Six categories, taken from @ossa-ma's gist plus additions from the gist comments:

- Word choice: magic adverbs, "delve" family, ornate nouns, "serves as" dodge, gravitas words
- Sentence structure: negative parallelism, "Not X. Not Y. Just Z.", rhetorical self-Q&A, anaphora, tricolons, "it's worth noting", superficial -ing tails, false ranges
- Paragraph structure: short punchy fragments, listicle in a trench coat, numbered phase labels
- Tone: "here's the kicker", "think of it as", "imagine a world", false vulnerability, "the truth is simple", stakes inflation, "let's break this down", vague attributions, invented concept labels, compliment sandwich, false exclusivity, clichéd idioms, fake casual quotes
- Formatting: em-dash addiction, bold-first bullets, unicode decoration
- Composition: fractal summaries, dead metaphor, historical analogy stacking, one-point dilution, content duplication, signposted conclusion, "despite its challenges"

Full examples for each are in [`references/tropes.md`](references/tropes.md).

## Contributing

This catalogue is collaborative. It grew from [@ossa-ma](https://gist.github.com/ossa-ma/f3baa9d25154c33095e22272c631f5a1)'s original gist plus tropes contributed in the comments (see [Acknowledgments](#acknowledgments)), and new models keep producing new tells. If you spot a pattern that isn't catalogued, or have a sharper example for one that is, open an issue or a PR. To try a new entry locally first, fork the repo and edit `references/tropes.md`.

## Acknowledgments

Sources: gist by [@ossa-ma](https://gist.github.com/ossa-ma/f3baa9d25154c33095e22272c631f5a1), [tropes.fyi](https://tropes.fyi) by [ossama.is](https://ossama.is). Additional tropes contributed by [@khaosdoctor](https://github.com/khaosdoctor) (False Exclusivity, Clichéd Idioms), [@felikcat](https://github.com/felikcat) (Numbered Phase Labels), and [@finrunsfar](https://github.com/finrunsfar) (Gravitas Words, Compliment Sandwich, Fake Casual Quotes) in gist comments.

## License

The original gist has no explicit license. @ossa-ma's comments encourage sharing with citation but don't grant a formal license, so credit them when redistributing the catalogue. The packaging in this repo is MIT licensed (see [`LICENSE`](LICENSE)).
