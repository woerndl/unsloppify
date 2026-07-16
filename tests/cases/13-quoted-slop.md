# Case 13: Critique that quotes a slop sentence for analysis
Context: prose
## Input
When I review AI-drafted release notes, one sentence pattern shows up again and again. A recent draft opened with "This release represents a pivotal milestone in our relentless pursuit of excellence." That single line does three things wrong at once. It inflates a routine bugfix release into a milestone. It reaches for "relentless pursuit of excellence," a phrase that means nothing and could be pasted into any company's notes. And it front-loads the significance before telling the reader what actually changed. My rule now is simple. If a sentence would survive being pasted untouched into a competitor's changelog, cut it and describe the actual change instead. At the end of the day, clear notes beat flourish every time.
## Must flag
- "At the end of the day, clear notes beat flourish every time." (template-filling, performative-register)
## Must not flag
- "This release represents a pivotal milestone in our relentless pursuit of excellence." (quoted material under criticism, precedence keeps quotes)
- "relentless pursuit of excellence," (quoted fragment being analyzed, not the author's own voice)
