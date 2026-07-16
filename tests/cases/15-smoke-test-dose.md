# Case 15: Mixed PR text with a real smoke test suite and smoke-test flavor uses
Context: pr-commit
## Input
## Summary

Adds a smoke test suite that runs on every deploy: five HTTP checks against the live endpoints, failing the pipeline if any returns non-200. See `scripts/smoke.sh`.

While wiring this up I also smoke tested the new caching layer by hand and it looks solid. This change is load-bearing for the release, so I want eyes on the retry logic before we merge.

## Details

The smoke test suite lives in CI and takes about 20 seconds. It does not replace the integration tests, it just catches the obvious breakage fast. I gave the config parser a quick smoke test in my head and it seems fine, but someone should actually verify the edge cases around empty files.
## Must flag
- "I also smoke tested the new caching layer by hand and it looks solid" (performative-register, false-precision)
- "This change is load-bearing for the release" (performative-register)
- "I gave the config parser a quick smoke test in my head and it seems fine" (performative-register, false-precision)
## Must not flag
- "Adds a smoke test suite that runs on every deploy" (a real smoke test suite, domain term for an actual set of checks)
- "The smoke test suite lives in CI and takes about 20 seconds" (a real smoke test suite, concrete and grounded)
