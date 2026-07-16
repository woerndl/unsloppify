# Case 10: Report with vague attributions and false ranges
Context: pr-commit
## Input
## Q3 Reliability Summary

Studies show that most outages stem from configuration errors rather than code bugs. Our incident data broadly supports this. Roughly 40 to 60 percent of the incidents this quarter were config-related, though the exact figure depends on how you count. Experts agree that observability is the key lever here. Response times improved significantly after the dashboard rollout, and error rates are down across the board. Users have reported feeling that the platform is noticeably more stable.

The on-call rotation change may also have contributed. We cannot be certain it did, but acknowledgment times did fall toward the end of the quarter.
## Must flag
- "Studies show that most outages stem from configuration errors" (false-precision)
- "Roughly 40 to 60 percent of the incidents this quarter were config-related, though the exact figure depends on how you count" (false-precision)
- "Experts agree that observability is the key lever here." (false-precision)
- "Response times improved significantly after the dashboard rollout, and error rates are down across the board." (false-precision)
- "Users have reported feeling that the platform is noticeably more stable." (false-precision)
## Must not flag
- "We cannot be certain it did" (honest uncertainty about causation, the hedge is content)
- "acknowledgment times did fall toward the end of the quarter" (concrete observed fact)
