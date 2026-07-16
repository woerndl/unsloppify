# Case 09: Code comments arguing with a replaced approach and narrating changes
Context: code-comments
## Input
# We used to do this with a regex but that was too slow, so now we use a state machine.
# Switched away from the recursive version after the review, this one is iterative.
def parse(input):
    # Escaped quotes inside a quoted field must not terminate the field.
    # This now also handles escaped quotes, which the old parser missed.
    # TODO from our last chat: revisit whether we still need the lookahead here.
    return run(input)

# Previously this returned None, but we changed it to raise as we agreed.
## Must flag
- "We used to do this with a regex but that was too slow, so now we use a state machine." (process-leakage)
- "Switched away from the recursive version after the review, this one is iterative." (process-leakage)
- "This now also handles escaped quotes, which the old parser missed." (process-leakage)
- "TODO from our last chat: revisit whether we still need the lookahead here." (process-leakage)
- "Previously this returned None, but we changed it to raise as we agreed." (process-leakage)
## Must not flag
- "Escaped quotes inside a quoted field must not terminate the field." (states a current invariant the code enforces)
