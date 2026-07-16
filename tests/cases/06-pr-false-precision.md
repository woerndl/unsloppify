# Case 06: PR claiming a diagnosis with no mechanism, next to a real one that names its mechanism
Context: pr-commit
## Input
## Summary

Fixes a race condition in the upload handler. Users were occasionally seeing corrupted files, and this was almost certainly a race condition somewhere in the concurrency layer. Something in the buffering logic was clearly off. I also cleaned up a potential memory leak in the same file and hardened the error handling to make it more robust against edge cases.

The actual fix is in `flush()`. There was a real race condition between the reader thread and the writer flush: the reader could observe a half-written buffer because the length field was updated before the payload bytes. I added a memory barrier so the payload write becomes visible before the length update.

## Testing

Added a stress test that runs 10,000 concurrent uploads and checks each checksum.
## Must flag
- "almost certainly a race condition somewhere in the concurrency layer" (false-precision)
- "Something in the buffering logic was clearly off." (false-precision)
- "a potential memory leak in the same file" (false-precision)
- "hardened the error handling to make it more robust against edge cases" (false-precision, importance-inflation)
## Must not flag
- "a real race condition between the reader thread and the writer flush: the reader could observe a half-written buffer because the length field was updated before the payload bytes" (mechanism named, the exact interleaving is described)
- "Fixes a race condition in the upload handler" (summary of the fix that the body substantiates with a named mechanism)
- "10,000 concurrent uploads" (concrete number)
