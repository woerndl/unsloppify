# Case 16: Docs paragraph leaning on dramatic absolutes
Context: docs
## Input
You cannot afford to skip the backup step. There is no other way to upgrade safely, and the importance of a verified dump cannot be understated. The v1 client simply cannot handle the new response format, so it will never work against the upgraded server. Run `pg_dump --format=custom` before the migration. A dropped column cannot be recovered without that dump.
## Must flag
- "You cannot afford to skip" (importance-inflation)
- "There is no other way to upgrade safely" (importance-inflation)
- "cannot be understated" (importance-inflation)
- "simply cannot handle" (importance-inflation, plain "does not handle" states it)
- "it will never work against the upgraded server" (importance-inflation, bare dramatic absolute, plain "does not work" states it)
## Must not flag
- "A dropped column cannot be recovered without that dump." (literal impossibility with its mechanism named)
- "Run `pg_dump --format=custom` before the migration." (concrete instruction)
