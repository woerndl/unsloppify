# Case 08: Code diff comments with banners, value echoes, and assertion restatements
Context: code-comments
## Input
# ===== Initialization =====

# The upstream provider drops the socket after 5 failed handshakes in a row, so keep this value in sync with the quota listed in their onboarding guide.
max_retries = 5  # max retries is 5
retries = 0
backoff = 1.0

# Increment the retry counter by one
retries += 1
backoff = backoff * 2

# ----- Validation -----
if retries > max_retries:
    # Raise an error when retries exceed the maximum
    raise RuntimeError("too many retries")

sleep(backoff)

# Return the result
return result
## Must flag
- "# ===== Initialization =====" (template-filling)
- "# max retries is 5" (template-filling)
- "# Increment the retry counter by one" (template-filling)
- "# ----- Validation -----" (template-filling)
- "# Raise an error when retries exceed the maximum" (template-filling)
- "# Return the result" (template-filling)
## Must not flag
- "# The upstream provider drops the socket after 5 failed handshakes in a row, so keep this value in sync with the quota listed in their onboarding guide." (explains an external constraint the code cannot show)
