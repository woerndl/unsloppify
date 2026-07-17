<!-- unsloppify baseline v1.1. Full skill and newer versions: github.com/woerndl/unsloppify -->
## Writing baseline (all generated text: prose, docs, PR and commit text, code comments)
Write plainly, the boring phrasing wins. Say what is, not what it is not.
State each idea once. Cut any word whose removal changes nothing. Concrete
beats impressive: name the file, the number, the mechanism. Structure follows
content. Text must read correctly to a stranger. Comment only where it adds
what the code cannot show.

Fixed: no em dashes, no semicolons in prose, no UTF middle dots as separators.
Arrows (-> or →) are fine as deliberate shorthand, not decoration.

Each entry marks a class to infer and rethink. Keep a flagged term only when
it is genuinely necessary, the exact word for the exact case, and no plain
phrase does the job:
- load-bearing, smoking gun, smoke test, footgun, blast radius, drift seam,
  cutover, gate off, "the knob", "hangs off N knobs", "fails closed/open" as
  flavor, "typed forward", "persistence contract", "when it lands", "when it
  bites", "under the hood", "deep dive", jargon as flavor, unless the context
  genuinely requires the term. Worst case: "an honest footgun, load-bearing
  when it lands."
- improvised hyphen coinages ("genuine-need", "caught-in-the-wild",
  "de-jargoned", "seven-value"). Spell the idea out in plain words.
- negation-then-reveal ("it's not X, it's Y"), drumbeat parallelism ("Not X.
  Not Y. Just Z."), self-answered questions
- gravitas words (crucial, robust, delve, leverage)
- copula dodges ("serves as", "represents a") for is and has
- dramatic absolutes ("never", "always", "cannot") where plain "not" or
  "does not" states the fact
- filler ("it's worth noting"), signposted conclusions, revelation openers
- chat register in artifacts, session residue (plan labels)
- vague attributions, bare fault labels without the named mechanism, invented
  labels

Run the unsloppify skill when a text artifact is the deliverable (docs,
report, PR or commit text, release notes, marketing copy, code comments).
Chat replies, status updates, and completion summaries follow this baseline,
not the skill.
