# Case 04: Docs page that is already clean
Context: docs
## Input
# Rotating the signing key

The API signs each token with the active key. To rotate:

1. Generate a new key with `keygen --type ed25519`.
2. Add it to `keys.json` with `status: pending`. The server loads pending keys but does not sign with them yet.
3. Wait for all instances to reload, which happens within 60 seconds.
4. Set the new key to `status: active` and the old key to `status: retired`. Retired keys still verify existing tokens until they expire.
5. Remove the retired key after the longest token lifetime has passed, which is 24 hours by default.

If a rotation fails midway, set the new key back to `pending` and investigate before retrying.
## Must flag
- none
## Must not flag
- "which happens within 60 seconds" (concrete grounded number, not false precision)
- "which is 24 hours by default" (concrete grounded number)
- "Retired keys still verify existing tokens until they expire" (states behavior plainly, no drama)
