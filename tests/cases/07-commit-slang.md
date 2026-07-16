# Case 07: Commit message with performative slang and pet-peeve tells
Context: pr-commit
## Input
Refactor config loader to remove a footgun

The old loader silently swallowed unknown keys, which was a footgun that bit us twice last quarter. This rewrite rejects them instead. Blast radius is small: only three call sites touch the loader directly. The new validation is load-bearing for the plugin system that ships day one of the 2.0 release, so getting it right now saves a painful cutover later. If you depend on the old lenient behavior, gate it behind the compat flag.
## Must flag
- "a footgun that bit us twice last quarter" (performative-register)
- "Blast radius is small" (performative-register)
- "is load-bearing for the plugin system" (performative-register)
- "ships day one of the 2.0 release" (performative-register)
- "a painful cutover later" (performative-register)
- "gate it behind the compat flag" (performative-register)
## Must not flag
- "only three call sites touch the loader directly" (concrete count, grounded)
- "silently swallowed unknown keys" (names the concrete old behavior the change fixes)
