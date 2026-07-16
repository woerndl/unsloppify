# Case 03: Docs page with teacher mode, signposted conclusion, and bold-first bullets
Context: docs
## Input
# Configuring Rate Limits

Let's explore how rate limiting works in the gateway. Before we dive in, it helps to know why you would want it at all:

- **Protects your services**: Rate limits shield upstream systems from traffic spikes that would otherwise overwhelm them.
- **Improves fairness**: Every client receives a predictable share of capacity instead of a few loud callers starving the rest.
- **Reduces cost**: Requests you were going to reject anyway never reach your compute.

Now that we understand the why, let's look at the how. Set the window, limit, and burst values in the gateway config. It is worth noting that changes do not apply to in-flight requests. In summary, rate limiting is a powerful tool that keeps your services healthy and your users happy.
## Must flag
- "Let's explore how rate limiting works in the gateway." (template-filling)
- "Before we dive in" (template-filling)
- "**Protects your services**:" (template-filling)
- "Now that we understand the why, let's look at the how." (template-filling)
- "It is worth noting that" (template-filling)
- "In summary, rate limiting is a powerful tool" (template-filling, importance-inflation)
## Must not flag
- "changes do not apply to in-flight requests" (concrete technical behavior the reader needs)
