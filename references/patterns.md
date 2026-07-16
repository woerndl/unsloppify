# Slop patterns

The long tail behind the unsloppify skill. Load this only for full audits or
when a span feels wrong but no test in SKILL.md names it. Entries are grouped
by the six failure modes defined in SKILL.md. The phrase lists here are
mirrored in references/phrases.txt for scripts/scan.sh.

How to apply an entry: the phrases are examples of a class, not the class
itself. Read the description, infer the shape, and flag spans that fit it
even when no listed phrase appears. A fresh coinage that matches the
description is a hit. Statuses weight your attention: current is worth
checking, declining is a weak signal. Every hit then takes the necessity
test. Keep the flagged form only when it is genuinely necessary, the exact
word for the exact case that no plain phrase covers. Outside the mechanical
house rules a hit is not a prohibition, but necessity is the bar.

## Importance inflation

### Gravitas words
Mode: importance-inflation (performative-register)
Status: current
Adjectives and verbs that assert weight instead of showing it. The delete
test catches them: remove the word and the meaning survives, so the word was
decoration.
Phrases: crucial, essential, vital, paramount, fundamental, foundational, transformative, groundbreaking, game-changing, unparalleled, unprecedented, invaluable, indispensable
Acceptable: a real dependency you name in the same sentence ("the index is essential because every query hits it")
Source: ossa-ma, mastra, wikipedia

### Magic adverbs
Mode: importance-inflation (performative-register)
Status: current
Adverbs that perform depth or quiet drama. The sentence reads as insight
because of the adverb, not the content.
Phrases: quietly, deeply, remarkably, profoundly, arguably
Acceptable: literal manner ("the fan runs quietly")
Source: ossa-ma

### Absolute overreach
Mode: importance-inflation (false-precision)
Status: current
Uniqueness and certainty claims no one checked. If the claim were true it
would survive being stated plainly with evidence. Includes dramatic
absolutes, "cannot", "never", "always" where plain "not" or "does not"
states the fact ("this approach cannot scale" for "this approach does not
scale"). The scanner lists the fixed constructions below and surfaces bare
"cannot" and "never" in its broad-triage group, where most hits are
legitimate. Each broad hit takes the plain-not test per instance instead of
counting as a finding.
Phrases: the only way to, the only real solution, the only way forward, the single most important, the most important thing is, above all else, above everything else, more than anything else, there is no better, there is no other way, there can be no doubt, make no mistake, there's no denying, simply cannot, cannot afford to, can't go wrong, will never be the same
Acceptable: a true, shown uniqueness claim (a proof that one method terminates), a literal impossibility stated as fact ("a dropped column cannot be recovered without a backup")
Source: mastra, unslop

### Urgency and stakes inflation
Mode: importance-inflation
Status: current
Manufactured moment-of-history framing. The test: could this sentence have
been written about any topic in any year?
Phrases: cannot be overstated, cannot be understated, can't be emphasized enough, more important than ever, more critical than ever, has never been more important, has never been easier, the stakes have never been higher, the stakes are higher than ever, the stakes couldn't be higher, at a crossroads, at an inflection point, at a critical juncture, at a pivotal moment, at a defining moment, in an increasingly complex world, reshape how we think about, define the next era
Acceptable: stakes that are real, named, and quantified
Source: mastra, ossa-ma

### Hedging throat-clearing
Mode: importance-inflation (template-filling)
Status: current
A preamble that promises importance the following clause must then carry
alone. Deleting the preamble never loses information.
Phrases: it's important to note that, it is worth noting that, it should be noted that, it goes without saying, needless to say, that being said, with that said, generally speaking, one thing is clear, begs the question, raises important questions
Source: mastra, wikipedia, unslop

### Filler phrases and empty modifiers
Mode: importance-inflation (template-filling)
Status: current
Bulk that adds syllables, not facts. Includes vague quantity words where a
count or a name would fit, and endorsements that steer the reader without a
reason.
Phrases: a wide range of, a variety of, a myriad of, a plethora of, a wealth of, countless, numerous, in order to, for the purpose of, due to the fact that, the fact that, has the potential to, is capable of, when it comes to, in terms of, various approaches, worth reading, worth a look, worth exploring, worth your time
Example: "in order to" becomes "to", "various approaches" becomes "three approaches"
Acceptable: "given" and "particular" in their precise senses. "in order to" shows up in clean procedural writing too, so treat a hit as a rewrite prompt rather than a strike.
Source: mastra, unslop

### Participial significance padding
Mode: importance-inflation (false-precision)
Status: current
A trailing comma plus "-ing" clause that awards significance the sentence
did not earn. Delete the clause and check: if no checkable fact is lost, it
was padding.
Phrases: highlighting its, highlighting the, underscoring the, emphasizing the importance, reflecting broader, reflecting its, showcasing its, demonstrating its commitment, contributing to the overall, cementing its, solidifying its position, ensuring a seamless, fostering a sense of, shaping the future, marking a significant, marking a pivotal, paving the way
Example: "revenue grew 40%, underscoring the strategy's effectiveness" becomes "revenue grew 40%, mostly from the new API product"
Acceptable: an "-ing" clause stating a real, checkable consequence
Source: mastra, wikipedia, unslop, ossa-ma

### Legacy and testament puffery
Mode: importance-inflation (performative-register)
Status: current
Monument language for ordinary facts. Encyclopedic-sounding filler that
inflates a subject's standing without a source.
Phrases: stands as a testament, a testament to, serves as a reminder, enduring legacy, lasting legacy, left an indelible mark, watershed moment, cornerstone of, the hallmark of, widely regarded as, has established itself as, has emerged as a, rich cultural heritage, takes center stage
Example: "The program stands as a testament to ingenuity" becomes "The program put twelve people on the moon"
Acceptable: significance that is documented and named
Source: wikipedia, unslop, mastra

### False agency
Mode: importance-inflation (false-precision)
Status: current
Data given a voice so the writer can skip the claim. If the numbers speak,
quote them.
Phrases: the numbers speak for themselves, the results speak for themselves, the data tells a story, tells a story, paints a clear picture, paints a picture of, speaks volumes, sends a clear message
Source: unslop (adapted from hardikpandya/stop-slop)

### Unsubstantiated change appraisal
Mode: importance-inflation
Status: current
An agent or PR describes its own work with a quality adjective that supplies
no evidence. The adjective rates the change instead of stating what it does.
Common in agent reports and PR prose.
Phrases: a clean fix, a small focused change, the straightforward approach, a surgical update, a simple change, a minimal diff
Example: "a small, focused change" becomes "touches one function in parser.js and leaves the public API unchanged"
Acceptable: scope, file count, behavioral effect, or compatibility impact stated plainly
Source: original

## Manufactured drama

### Negation-then-reveal
Mode: manufactured-drama
Status: current
The point stated by first denying its opposite. One reframe can be a real
correction. Cited by all six sources. The test is clustering or a false
contrast, a reversal where X was never plausible.
Phrases: it's not just X it's Y, it's not about X it's about Y, this isn't X. it's Y, it's less about X and more about Y, what matters isn't X it's Y
Example: "This isn't caching. It's a whole new architecture." becomes "The change adds a cache."
Acceptable: one genuine correction of a specific stated misconception
Source: ossa-ma, mastra, wikipedia, unslop, hn

### Stacked negation and anaphora
Mode: manufactured-drama (template-filling)
Status: current
Repeated openings or negations as a drumbeat. Three or more parallel clause
openings is the failure, whatever the opener.
Phrases: shape only. "No X. No Y. No Z.", "Not X. Not Y. Just Z.", "It's X. It's Y. It's Z.", "Every X, every Y.", "They assume A. They assume B. They assume C.", three consecutive rhetorical questions, the clause-final ", no <noun>." tail
Example: "No config. No setup. No hassle." becomes "It needs no configuration."
Acceptable: deliberate, sparing repetition ("coffee, no sugar" is a real spec)
Source: mastra, ossa-ma, unslop

### Self-answered questions
Mode: manufactured-drama
Status: current
The writer asks a question only to answer it in the next breath. The
question exists for cadence, not inquiry. This entry holds the question
forms, the colon forms live in Dramatic labels and colon reveals.
Phrases: The result?, The catch?, The reason?, The kicker?, The problem?, The best part?, The bottom line?, Why does this matter? Because, What does this mean for, Why should you care?, What if I told you
Source: ossa-ma, mastra, unslop

### Mic-drop fragments
Mode: manufactured-drama
Status: current
Short punchy declarations dropped for effect, alone or in clipped parallel
pairs. Includes italicized function words as false emphasis. Overcorrection
warning: rewriting slop into staccato punch endings is this same tell.
Phrases: Full stop., Period., Let that sink in., Read that again., plus shape: standalone closers like "It matters.", "This works.", "That scales.", clipped pairs like "Shippers scan. Practitioners read.", "[Noun]. That's it. That's the [thing]."
Example: "The result is clean." as a standalone closer folds into the surrounding sentence
Acceptable: one short sentence occasionally. Clustering is the failure.
Source: mastra, ossa-ma, unslop, hn

### False suspense and revelation phrases
Mode: manufactured-drama
Status: current
A transition that promises a revelation the content does not deliver. The
test: does anything after the phrase surprise a reader who skipped it?
Phrases: here's the thing, here's the kicker, here's the catch, here's the deal, here's where it gets interesting, that's the beauty of it, the real secret is, what this really means is, the truth is, the reality is, let me be honest, to be honest, spoiler alert, plot twist, pro tip, hot take, unpopular opinion, the key insight is, and that's what makes it
Source: mastra, ossa-ma, unslop

### False exclusivity
Mode: manufactured-drama
Status: current
Claims of forbidden or overlooked knowledge about things that are plainly
documented.
Phrases: nobody talks about, no one talks about, what nobody tells you, what most people miss, what most people don't know, the dirty secret, the uncomfortable truth, the open secret, the elephant in the room, the hidden cost, the silent killer, doesn't get enough attention
Acceptable: only when the thing is genuinely obscure and you can show that
Source: mastra, ossa-ma

### Narrative pivots
Mode: manufactured-drama
Status: current
Cinematic turning points pasted onto ordinary events.
Phrases: something shifted, something clicked, everything changed, that changed everything, this changes everything, and then it hit me, that's when I realized, it was a turning point, a light bulb went off, the penny dropped, changed the game, flipped the script, shifted the paradigm
Source: mastra

### Dramatic labels and colon reveals
Mode: manufactured-drama (template-filling)
Status: current
A punchy label, a colon, then the actual sentence. The label adds drama, not
information. Same family: "the answer is:" reveals. This entry holds the
colon forms, the question forms live in Self-answered questions.
Phrases: The catch:, The kicker:, The upshot:, The tradeoff:, The trick:, The downside:, The bottom line:, The takeaway:, The result:, The fix:, The payoff:, the answer is, the secret is, the trick is, the key is
Acceptable: a real definition list or glossary where "Term: definition" is the format
Source: mastra, unslop

### Hollow acknowledgment
Mode: manufactured-drama (false-precision)
Status: current
Naming a problem to sound rigorous while declining to act on it in the same
clause.
Phrases: shape only. A notice-verb plus object plus "without" plus a gerund ("names the problem without solving it", "raises the question without answering it"), and "all diagnosis, no treatment"
Acceptable: genuinely deferring the resolution and saying where it goes
Source: mastra

### Asserted simplicity
Mode: manufactured-drama (false-precision)
Status: current
Claiming privileged access to the simple truth instead of demonstrating it.
Phrases: the reality is simpler, history is unambiguous, the real story is, none of them is the real story
Example: "The reality is simpler and less flattering." then prove it or cut it
Acceptable: when the simpler account follows immediately with evidence
Source: ossa-ma

### Historical analogy stacking
Mode: manufactured-drama (false-precision)
Status: current
Rapid-fire company or tech-era comparisons that borrow authority instead of
arguing.
Phrases: shape only ("Apple didn't build Uber. Facebook didn't build Spotify.")
Acceptable: one apt comparison that carries real explanatory weight
Source: ossa-ma

## Performative register

### Overused AI vocabulary
Mode: performative-register
Status: current
The single-word fingerprint list. One of these words is coincidence, a
cluster is a signature. Individual words drift by model era, so in our
sources delve and tapestry are fading while showcasing and enhance grew
later. The cluster test carries the weight, not any single word.
Phrases: delve, tapestry, multifaceted, underscores, pivotal, intricate, seamless, robust, streamline, elevate, bolster, underpins, synergy, holistic, paradigm, testament, cornerstone, catalyst, meticulous, meticulously, nuanced, myriad, plethora, burgeoning, ubiquitous, granular, actionable, impactful, empower, proactive, comprehensive, innovative, state-of-the-art, best-in-class, supercharge, unleash, democratize, resonate, resonates, garner, interplay, realm, landscape (abstract), leverage, navigate (abstract), showcase, harness, foster, aforementioned, henceforth, whereby, therein
Acceptable: precise technical senses ("robust" in statistics, "granular" for real granularity, a literal tapestry)
Source: mastra, wikipedia, unslop, ossa-ma

### Formal word substitutes
Mode: performative-register
Status: current
Latinate formality where a plain word exists. Use the plain word when it
preserves the meaning.
Phrases: utilize, facilitate, commence, terminate, ascertain, endeavour, methodology (for method), conceptualize, operationalize, elucidate, delineate
Acceptable: implement, framework, optimize and similar words with precise technical meanings, and terminate, facilitate, methodology when they keep their precise senses
Source: mastra, unslop

### Copula avoidance
Mode: performative-register (importance-inflation)
Status: current
Dodging "is" and "has" with verbs that sound more considered. The sentence
gains gravity and loses directness. Check that "is" preserves the meaning
before rewriting functions as, constitutes, or refers to, since a module can
function as an adapter without being one by design.
Phrases: serves as a, serving as the, stands as a, functions as a, operates as a, acts as a, represents a, constitutes a, boasts a, features a, offers a comprehensive, refers to (for "is")
Example: "The validator serves as a gatekeeper" becomes "The validator rejects malformed input"
Acceptable: the verb's literal sense ("the server serves requests", "the deposit serves as collateral")
Source: ossa-ma, mastra, wikipedia, unslop

### Cliche metaphors and idioms
Mode: performative-register (importance-inflation)
Status: current
Stock metaphors that once carried an image and now carry none.
Phrases: rich tapestry, intricate interplay, delicate balance, double-edged sword, tip of the iceberg, perfect storm, game-changer, paradigm shift, tipping point, at the forefront, sets the stage, only time will tell, moves the needle, move the needle, unlock the potential, unlocks new, at the end of the day, between a rock and a hard place, sheds light, strikes a balance, at the intersection of, smoking gun
Acceptable: "smoking gun" only for literal decisive evidence, and the owner still bans it as a pet peeve
Source: mastra, ossa-ma, unslop

### Performative engineering slang
Mode: performative-register
Status: current
Jargon used as flavor rather than as the precise term. The words have
meanings, and slop uses them where a plain phrase means the same. Repetition
makes the register annoying, but it does not invalidate a term that fits.
The pet peeves here are an owner house rule and ship in the ban list.
Phrases: footgun, blast radius, load-bearing, smoke test, smoke cases, cutover, cut-over, handoff, hand-off, gate off, gated on (as flavor), when it lands, once it lands, when it bites, if it bites, ships day one, the knob, flip the knob, hangs off (N knobs), fails closed (as flavor), fails open (as flavor), typed forward, persistence contract, belt and suspenders, belt-and-suspenders, battle-tested, production-ready (as flavor), wire up (as flavor), the unlock, the shape of the problem, center of gravity, drift seam, substrate, wedge (metaphor)
Example: "this API is a footgun" becomes "this API is easy to misuse"
Acceptable: the precise term where plain phrasing is ambiguous. A smoke test suite, a database cutover, a release gate, and a feature gate are the terms doing real work. "load-bearing" only for a structural dependency the reader can point to. The bans carry the escape hatch: banned unless the context genuinely requires the term.
Source: ossa-ma, hn, mastra, unslop

### Anthropomorphic justification
Mode: performative-register (importance-inflation)
Status: current
Code and components praised like employees instead of described by effect.
Phrases: earns its keep, earns its place, pays for itself, pays dividends, pulls its weight, punches above its weight, does the heavy lifting, does the real work, stands on its own, speaks for itself, deserves mention, deserves a closer look, hinges on whether, settles the question
Acceptable: "do no harm" in medical prose
Source: mastra

### Figurative verb overload
Mode: performative-register
Status: current
Ordinary verbs in figurative senses that stack into a register: things land,
sit, hold, fall, cast, ride, and run instead of happening. Each verb is fine
literally. The figurative pileup is the tell.
Phrases: shape only, gated on the complement: lands in main, once the feature lands, lands silently, carries weight, casts doubt, draws a distinction, falls short, falls by the wayside, holds true, holds promise, lends credence, rides on, runs deep, runs counter to, sits at the intersection of, sits with, sits above (for "is above"), strikes a chord
Example: "the PR lands in main" becomes "the PR is merged"
Acceptable: literal senses (a plane lands, prices fall, tests run)
Scanner: the fixed verb-complement pairs match directly, and bare "land",
"ship", and "sits" surface in the broad-triage group for the per-instance
literal-or-figurative call.
Source: mastra, hn

### Colloquial assessments
Mode: performative-register (manufactured-drama)
Status: current
Chat-native judgment idioms pasted into written artifacts.
Phrases: is the move, the right move, the obvious move, the play here, what really matters, what actually matters, what matters most, all that matters, really lands, lands flat
Acceptable: "the move" literally in chess or dance
Source: mastra

### Promotional and travel-brochure tone
Mode: performative-register (importance-inflation)
Status: current
Tourism-board and press-release language in neutral or technical registers.
Phrases: nestled, in the heart of, at the heart of, boasts, vibrant, breathtaking, bustling, picturesque, hidden gem, must-visit, world-class, second to none, natural beauty, renowned for, a hub for, a beacon of, a treasure trove of, a shining example, a masterclass in, gateway to, thoughtfully designed
Acceptable: marketing copy the user explicitly asked for, and "vibrant" as a perceptual descriptor in a color or design spec
Source: mastra, wikipedia, unslop

### Growth metaphors
Mode: performative-register (false-precision)
Status: current
The startup-as-organism register.
Phrases: nascent, fledgling, embryonic, incubate, gestate, cultivate, nurture, in its infancy, organic growth
Acceptable: literal senses in medical, nature, or agriculture writing
Source: mastra

### Strategy buzzwords
Mode: performative-register (false-precision)
Status: declining
Business-strategy vocabulary standing in for a named advantage.
Phrases: flywheel effect, growth flywheel, build a moat, competitive moat, north-star metric, our north star, first-mover advantage, land grab
Example: "this builds a moat" becomes naming the switching cost or data advantage
Acceptable: "network effects" and "first-mover advantage" as precise terms in genuine market analysis
Source: mastra

### Fake casual quotes
Mode: performative-register
Status: current
Casual words in scare quotes to perform relatability. Nobody is being
quoted.
Phrases: shape only ("go 'nope'", "what developers call 'good enough'")
Acceptable: real quotation of a real person
Source: ossa-ma

### False vulnerability
Mode: performative-register
Status: current
Polished, risk-free self-disclosure performing honesty. The admission costs
the writer nothing and is phrased for effect.
Phrases: shape only ("This is not a rant, it's a diagnosis.")
Acceptable: a real, specific, uncomfortable admission
Source: ossa-ma

### Patronizing analogy
Mode: performative-register
Status: current
An analogy the reader did not need, usually domestic or culinary.
Phrases: think of it as, think of it like, it's like a
Acceptable: an analogy genuinely clearer than the plain statement for the audience
Source: ossa-ma

### Defensive hedges
Mode: performative-register (manufactured-drama)
Status: current
Pre-defending a point against an objection nobody raised. The concession is
rhetorical wind-up, not information.
Phrases: this may seem, it might sound obvious but, admittedly, to be fair, on the surface, at first glance
Example: "This might sound obvious, but test your code." becomes "Test your code."
Acceptable: a real concession that changes the claim, and "on the surface" for a literal surface in graphics, physics, or materials writing
Source: mastra

### Elegant variation
Mode: performative-register (template-filling)
Status: current
Rotating synonyms for one referent across nearby sentences to avoid
repetition. Clarity loses. Repeating the plain name is fine.
Phrases: shape only (the company, the firm, the organization, the enterprise for one referent, or said, stated, noted, remarked cycling)
Acceptable: variety across genuinely different referents. Weight lightly, non-native writers do this too.
Source: wikipedia, unslop

### Academic excess vocabulary
Mode: performative-register (importance-inflation)
Status: current
Paper-filler phrases that perform scholarship. Soft tells, flag when
clustered.
Phrases: warrants further investigation, sheds new light, new avenues, garnered significant attention, a more nuanced understanding of, with the advent of, in recent years (opener), ever-evolving, noteworthy, revolutionize
Acceptable: standard hedged claims that carry real uncertainty stay (see guards)
Source: unslop

### Compressed noun compounds
Mode: performative-register
Status: current
Several nouns or participles packed into an improvised compound that needs
the working session to decode. Newer models produce these when told to be
brief. This is already an owner CLAUDE.md rule.
Phrases: shape only ("workspace-local validation path", "review-shaped output", "read-path ownership boundary", "genuine-need escape hatch", "caught-in-the-wild examples", "seven-value status set", "clean-state gate"), prefix coinages ("re-rank", "de-jargoned"), greppable heads: -shaped, -path, -aware, -local compounds
Example: "read-path ownership boundary" becomes "which module owns reads from the cache"
Acceptable: an established compound the audience already shares (thread-local, copy-on-write)
Source: original

## False precision

### Vague attributions
Mode: false-precision
Status: current
Authority with no locatable source, or one source dressed as many. Name the
source or drop the claim.
Phrases: experts argue, experts say, experts suggest, some experts, many experts, studies show, studies suggest, research shows, research suggests, research indicates, several studies, numerous studies, a growing body of, the evidence suggests, the data suggests, industry reports, observers have noted, critics argue, analysts predict, it is widely regarded, many believe, has been described as
Example: "studies show that X" becomes "the 2024 Stanford survey found X"
Acceptable: attributed forms ("research by the Kaiser group indicates") and possessives ("our research indicates")
Source: ossa-ma, mastra, wikipedia, unslop

### Fallback diagnoses
Mode: false-precision
Status: current
A technical diagnosis label asserted as a conclusion with no mechanism named.
The label sounds like analysis but is a guess. The test: are the two racing
operations, the leaked allocation, or the blocked resources named? A
concurrency doc that states the mechanism is using the correct term, not slop.
Phrases: race condition, memory leak, deadlock, debounce (as bare labels)
Example: "this is probably a race condition" becomes "the reader thread can observe the buffer between the length update and the payload write"
Acceptable: with nearby evidence or a stated verification step. A provisional hypothesis is fine when it comes with observations, stated uncertainty, or a reproduction plan.
Source: ossa-ma, hn

### False ranges
Mode: false-precision (template-filling)
Status: current
"From X to Y" where X and Y share no scale, so no middle exists and the
range is fake breadth.
Phrases: from X to Y (no shared scale), ranging from, spanning everything from, whether X or Y (repeated)
Example: "From innovation to cultural transformation." Nothing lies between.
Acceptable: a real spectrum with a meaningful middle ("from 0 to 100 ms")
Source: ossa-ma, unslop

### False balance
Mode: false-precision (performative-register)
Status: current
Both-sides hedging that dodges a position while sounding judicious.
Phrases: both sides of the argument, each perspective has merit, all perspectives, a balanced approach, nuanced understanding, nuanced approach, the answer is not straightforward, there is no simple answer, this is a complex issue, depends on various factors, case-by-case basis
Acceptable: genuine, specific uncertainty that is content (legal, medical, security)
Source: mastra

### Organic consequence
Mode: false-precision (manufactured-drama)
Status: current
Design decisions narrated as physics. Things fall out, emerge, and flow
naturally so nobody has to explain them.
Phrases: falls out naturally, falls straight out of, emerges naturally, emerges organically, arises naturally, flows naturally, a natural consequence, follows naturally from
Example: "the API shape falls out naturally" becomes "the API shape follows from the data model"
Acceptable: a real mathematical derivation, or a systems derivation that shows the step ("deadlock follows from circular waiting")
Source: mastra

### Knowledge-gap speculation
Mode: false-precision (process-leakage)
Status: current
Confident invention where information is missing, flagged by the disclaimer
plus "likely". The honest form states what is unknown and stops.
Phrases: while specific details are limited, not widely documented, based on available information, the subject likely, maintains a low profile
Example: "While details are scarce, the mountain likely supports diverse fauna" invents the fauna
Acceptable: an honest, sourced statement that a fact is unknown
Source: wikipedia

### Invented concept labels
Mode: false-precision
Status: current
A coined term presented as established vocabulary. Flag it only when it is
offered as established, since the reader cannot look up a term the writer
just made up. A coinage the writer explicitly introduces and defines is fine.
Phrases: shape only (domain word plus paradox, trap, creep, divide, vacuum, inversion, used as if established: "the supervision paradox", "the acceleration trap")
Acceptable: an actually defined, sourced term, or a coinage the writer introduces and defines with a clear need
Source: ossa-ma

### Generic-over-specific substitution
Mode: false-precision (importance-inflation)
Status: current
The umbrella test behind most inflation tells: a specific checkable fact
replaced by a broad important-sounding descriptor. Prefer the fact you can
name over the praise you cannot check.
Phrases: shape only
Example: "inventor of the first train-coupling device" flattened to "a revolutionary titan of industry"
Source: wikipedia

### Unsupported completion claims
Mode: false-precision
Status: current
A statement of completion or safety stronger than the evidence supports.
Current agentic models assert that work is done or verified without naming
what was checked. The test: is the command, the test scope, or the observed
result stated?
Phrases: implemented and verified, all checks pass, this is production-ready, fully tested, ready to ship, everything works
Example: "Implemented and verified." becomes "Ran the unit suite (42 tests), all green. Did not exercise the migration path."
Acceptable: a completion claim that names the command, the test scope, the observed result, or that verification was not possible
Source: original

### Bare reassurance
Mode: false-precision
Status: current
A closing line that tells the reader everything is fine without the condition
or evidence that would make it true. Common in support and coding prose. It
sounds authoritative and can hide an untested assumption.
Phrases: that's expected, this is intentional, this is safe, no action is needed, nothing to worry about, works as intended
Example: "This is safe." becomes "This is safe because the input is escaped before it reaches the query."
Acceptable: reassurance that states the condition, guarantee, or evidence behind it
Source: original

## Template filling

### Opening cliches
Mode: template-filling
Status: declining
Stock openers that could preface anything. The reader learns nothing until
the second sentence, so cut the first. Still frequent in marketing and SEO
registers, weaker as a general tell of current models.
Phrases: in today's fast-paced, in today's digital age, in today's rapidly evolving, in the realm of, in the world of, in an era where, in a world where, when it comes to, picture this, imagine a world where, imagine if, have you ever wondered, embarking on a journey, gone are the days, whether you're a, chances are, you're not alone, look no further, without further ado, we live in a world, before we dive in
Source: mastra, unslop, ossa-ma

### Signposted conclusions and wrap-up headings
Mode: template-filling
Status: current
Announcing the ending instead of ending. A short document rarely needs both
a conclusion heading and a recap.
Phrases: in conclusion, in summary, to summarize, to sum up, to conclude, in closing, all in all, when all is said and done, in the final analysis, ultimately (as opener), plus headings: Final Thoughts, Closing Thoughts, Wrapping Up, Putting It All Together, The Big Picture, The Takeaway, Final Word
Acceptable: abstracts and executive summaries that a long document genuinely needs, genre conventions in academic papers, legal submissions, and reports, and a conclusion that synthesizes rather than repeats
Source: mastra, ossa-ma, wikipedia, unslop

### Formal transitions
Mode: template-filling (performative-register)
Status: declining
Essay-connector tissue. And, but, and so carry the same load without the
starch. Declining in assistant and technical output, still common in
generated essays and SEO prose.
Phrases: moreover, furthermore, additionally (sentence-start), consequently, subsequently, nevertheless, conversely, hence, thus, notably, importantly, significantly, crucially, essentially, fundamentally (sentence-start), what's more, that is to say
Acceptable: "therefore" and "thus" in a genuine logical derivation. subsequently, conversely, moreover, and furthermore carry plain senses in formal, legal, and math prose, so flag when clustered rather than on a single hit.
Source: mastra, unslop

### Sequencing scaffolds
Mode: template-filling
Status: current
Numbered-essay skeletons: firstly-secondly-thirdly, or a listicle wearing
prose ("The first lesson... The second lesson...").
Phrases: firstly, secondly, thirdly, lastly, the first takeaway, the second lesson, the first thing to note, the third reason, the first step is (essay scaffold)
Acceptable: first and second as plain ordinals in a real sequence, or an actual numbered list
Source: mastra, ossa-ma

### Content announcements
Mode: template-filling
Status: current
Narrating what the text is about to do instead of doing it. Includes the
heading forms.
Phrases: below you'll find, here's a breakdown of, here's an overview of, here's everything you need to know, here's what you need to know, the following sections will, this guide will walk you through, plus headings: What You'll Learn, What We'll Cover, What to Expect
Source: mastra

### Formula headings
Mode: template-filling (performative-register)
Status: current
Heading templates from content marketing.
Phrases: Deep Dive, Under the Hood, Demystifying, Why It Matters, Why This Matters, A Closer Look, The Ultimate Guide, Everything You Need to Know, Mastering, Unlocking, The Power of, The Magic of, The Future of, The Art of, Revolutionizing
Acceptable: a heading that names the actual content. Audio-mastering contexts use "mastering" literally. Deep dive and under the hood stay banned as an owner house rule in any position.
Source: mastra

### Cataphoric forecasting
Mode: template-filling (manufactured-drama)
Status: current
A sentence-initial count forecasting a list, with framework nouns as the
tell. The content should present itself, not trail a promise.
Phrases: shape only. "Three pillars", "Four core principles", "Here are the four", "There are three reasons", "falls into four categories", with nouns: pillars, principles, tenets, cornerstones, levers, phases, buckets
Example: "Here are the four benefits:" becomes presenting the benefits
Acceptable: a literal count of physical things ("all three files"), and counts that establish completeness or navigation ("there are three failure cases")
Source: mastra

### Reflex triads
Mode: template-filling (manufactured-drama)
Status: current
Everything comes in threes: three adjectives, three parallel verb phrases,
three short clauses. The tell is that the triple is a reflex, not that the
list has three real items. Never change a factual count. Restructure an
ornamental triad, do not delete a real third item.
Phrases: shape only ("parses input, calls the service, formats output", "tiles, metals, and plastics" padding a thin claim)
Example: a padded ornamental triad restructures into one plain sentence
Acceptable: a real three-item list that is the actual full set, including a complete three-step process
Source: mastra, wikipedia, ossa-ma

### Metacommentary and structure narration
Mode: template-filling (process-leakage)
Status: current
The text talks about itself: what it will explain, what the key point is,
what to take away. Includes bolded callout labels.
Phrases: at its core, at its heart, the key here is, let me explain, let's unpack, let's break this down, let's dive into, let's explore, let's take a closer look, this is where X comes in, this matters because, key takeaway, key takeaways, the takeaway is, quick recap, to recap, quick overview, plus bold callouts: Key insight:, Key takeaway:, Bottom line:
Acceptable: an admonition block (Note:) where the doc system uses that convention
Source: mastra, unslop, ossa-ma

### Restatement markers
Mode: template-filling
Status: current
Saying it twice and labeling the second pass. Usually the first phrasing
should just be fixed.
Phrases: in other words, simply put, put simply, to put it another way, said differently, to put it simply, in plain English, in simpler terms, what I mean is
Acceptable: a restatement that adds real precision
Source: mastra, unslop

### Rhetorical test prompts
Mode: template-filling (manufactured-drama)
Status: current
Coaching-register imperatives that quiz the reader.
Phrases: ask yourself, the litmus test, the acid test, the question to ask is, think about it
Acceptable: a genuine named test with a stated procedure, and "acid-test ratio" as the finance term
Source: mastra, unslop

### Challenges and outlook formula
Mode: template-filling
Status: declining
The essay-closer template: concede vague challenges, pivot to a vaguely
bright future. Both halves are unfalsifiable. Mostly an essay-era and
company-profile formula, weaker in current direct output.
Phrases: despite its challenges, despite these challenges, despite these limitations, while challenges remain, challenges notwithstanding, is not without its challenges, faces several challenges, continues to thrive, continues to evolve, continues to shape, poised for growth, the future looks bright, exciting times lie ahead, one thing is certain, what remains clear is, remains to be seen, positions it as, plus headings: Challenges and Controversies, Future Outlook, Looking Ahead
Acceptable: a named challenge with sourced specifics and named next steps
Source: mastra, wikipedia, unslop

### Compliment sandwich
Mode: template-filling (performative-register)
Status: current
Softening technical feedback with a formula compliment before the actual
point.
Phrases: step in the right direction, but, solid recommendation, however, great suggestion, that said
Acceptable: a specific positive observation that affects the revision and tells the author what to preserve. Flag the formula praise, especially "Great work, but...".
Source: ossa-ma

### Restatement bloat
Mode: template-filling
Status: current
One thesis restated at every level: intro promises, sections repeat,
conclusion recaps. Also a single point diluted across many paragraphs to
feel comprehensive. Say it once, well.
Phrases: shape only
Acceptable: one genuine summary in a long document
Source: ossa-ma, wikipedia

### Bold-first bullets and boldface reflex
Mode: template-filling
Status: current
Every list item opening with a bolded lead phrase, or every key noun bolded
for emphasis. The formatting performs organization the content lacks. Flag
uniform bold labels when they repeat the sentence that follows or invent
categories that are not real.
Phrases: shape only ("**Security**: environment-based configuration ...")
Acceptable: a definition list where the term truly leads, reference docs, changelogs, and scanning-heavy pages, and house styles requiring title case
Source: ossa-ma, wikipedia

### Decorative punctuation
Mode: template-filling (performative-register)
Status: current
Em dashes as pause-asides and pivots, decorative connectors instead of
words. House rule: em dashes and semicolons are banned in this repo's
style. UTF middle dots as prose separators are banned too.
Phrases: em dash (any), middle dots as separators, arrows scattered as decoration
Acceptable: -> or → as deliberate shorthand that saves space where the connection is the point, and real notation (a keybinding path, a required separator)
Source: ossa-ma, wikipedia, hn

### Unfilled placeholders
Mode: template-filling (process-leakage)
Status: current
Template slots surviving into finished output.
Phrases: [Your Name], [link to article], [Describe the, insert X here, 2025-XX-XX
Acceptable: a real template file meant to be filled later
Source: wikipedia

### Prose structure formula
Mode: template-filling
Status: current
The five-paragraph-essay ghost: topic sentence, three supporting points,
conclusion, every paragraph the same length, consecutive paragraphs opening
with the same word.
Phrases: shape only
Acceptable: none. Vary structure with content.
Source: mastra (styleguide)

### Agent handoff over-structuring
Mode: template-filling
Status: current
A tiny change wrapped in fixed status-report sections: an outcome line, a
change list, a verification list, and a next-step offer. Current coding
agents apply the template even when one or two sentences would do.
Phrases: shape only, greppable heads: "What changed:", "Tests:", "Notes:", "Next steps:", "Summary:" stacked over a small diff
Example: a four-section report on a one-line fix becomes "Fixed the off-by-one in the loop bound."
Acceptable: substantial engineering work where each section carries real content
Source: original

### Generic benefit tails
Mode: template-filling
Status: current
A generic benefit sentence added after an implementation choice. Current
coding output appends one to nearly every decision, and it names no concrete
gain.
Phrases: this keeps the change focused, this avoids unnecessary complexity, this ensures predictable behavior, this makes the code more maintainable, this improves readability
Example: "This keeps the change focused." becomes deleting it, or naming the failure it prevents
Acceptable: a tail that names a concrete prevented failure, a measured improvement, or a maintained invariant
Source: original

### Defensive exhaustiveness
Mode: template-filling
Status: current
A direct answer buried under a matrix of unlikely exceptions, edge cases, and
"depending on" branches the reader did not ask about. The caveats protect the
writer, not the reader.
Phrases: shape only, greppable heads: "depending on", "in some cases", "it depends", "there are exceptions", stacked "if" branches after a direct answer
Example: a one-line answer followed by five "unless" clauses becomes the answer plus the one caveat that could change the decision
Acceptable: caveats that could change the reader's decision. Move remote possibilities to an optional note.
Source: original

## Process leakage

### Chat register in artifacts
Mode: process-leakage
Status: current
Assistant pleasantries and sycophancy inside a delivered artifact: a doc, a
comment, a commit message. These show that conversation bled into the
product. Sycophancy in chat replies has dropped, but pleasantries inside
generated artifacts remain frequent.
Phrases: I hope this helps, hope this was helpful, feel free to ask, feel free to reach out, don't hesitate to, let me know if you have any questions, let me know if you need anything else, happy to help, I'd be happy to, happy coding, best of luck, Great question, Excellent question, I'm glad you asked, Absolutely!, Certainly!, Of course!, You're absolutely right, you make an excellent point, I couldn't agree more, I assure you
Acceptable: none inside an artifact. Legitimate only in actual live conversation.
Source: mastra, wikipedia, unslop, hn

### Conversation residue in code and PRs
Mode: process-leakage
Status: current
Traces of the working session litter the patch. Comments argue with an
approach that is neither the previous state nor the PR state, describe the
change relative to the conversation ("now also handles Y", "per review
feedback"), or carry plan labels and stage numbers. The test: does the text
read correctly to someone who never saw the session?
Phrases: now also handles, as discussed, per the plan, per review feedback, Phase 1:, Stage 2:, Step 3: (as PR or comment labels), plus shape: comments justifying against a rejected alternative
Example: "// Now also handles empty arrays (per review)" becomes "// Empty arrays return zero."
Acceptable: genuine numbered procedures where order is the content. Changelog and release-note prose that says what a component now does is fine, so exempt those files and flag "now also handles" inside code comments.
Source: hn, ossa-ma

### Reasoning-chain artifacts
Mode: process-leakage
Status: current
The model's scratch thinking left in the output.
Phrases: let me think step by step, breaking this down, to approach this systematically, here's my thought process, working through this logically
Source: unslop

### Vague self-reference
Mode: process-leakage
Status: current
Pointing backward without a target. In long documents the reference decays
as sections move.
Phrases: as mentioned above, as mentioned earlier, as noted above, as discussed earlier, as we saw, as we'll see, as previously mentioned, recall that, as I mentioned, as I said
Acceptable: a real cross-reference to a named section ("see the install section"). "recall that" is a legitimate teaching device in proofs, and "as discussed above" is normal navigation in a long doc. Flag only when the reference cannot be resolved by a reader who never saw the drafting session.
Source: mastra

### Model self-reference residue
Mode: process-leakage
Status: declining
The model naming itself or its limits inside an artifact. "As an AI language
model" is effectively archived, and cutoff disclaimers are the surviving
form. Outright refusals are increasingly rare.
Phrases: as an AI language model, as a large language model, as of my last knowledge update, as of my knowledge cutoff, based on my training data, I don't have access to real-time
Acceptable: none in an artifact
Source: wikipedia, unslop

### Instruction compliance narration
Mode: process-leakage
Status: current
The output narrates its own compliance with a formatting, brevity, tone, or
forbidden-action instruction. The reader did not ask to be told the rule was
followed.
Phrases: per your request I kept this concise, no files were changed, I avoided em dashes as instructed, as requested I, following your instructions
Example: "Per your request, I kept this concise." becomes deleting the line
Acceptable: confirming a consequential action the user needs to know about
Source: original
