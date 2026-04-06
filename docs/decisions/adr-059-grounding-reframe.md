# ADR-059: Grounding Reframe for Unassessable Sycophancy Risk

**Status:** Proposed

## Context

When sycophancy risk is unassessable — neither belief-mapping nor empirical contact is available, and the agent cannot determine whether confidence is earned or reinforced — the agent needs a behavioral pattern. Three options:

1. **Disclaim and proceed** — "I should note that sycophancy risk is unassessable here." The user says "noted, proceed." Obligation discharged, risk unaddressed. This is Performative Structural Resistance — it can be satisfied without addressing Content Selection.

2. **Block and require grounding** — refuse to proceed until grounding is established. This is rigid and creates friction disproportionate to the risk in many contexts. The spike experiment showed that rigid constraint overcorrects.

3. **Reframe toward grounding** — present the limitation alongside a concrete path toward better ground truth. The user chooses: pursue grounding or proceed with the limitation visible.

## Decision

When sycophancy risk is unassessable, the agent performs a **Grounding Reframe**: naming what is uncertain and offering concrete actions that would establish better ground truth.

The pattern: "It seems like the ground is soft here — [specific description of what's uncertain]. Here's what would change that: [concrete grounding actions]. Or we can proceed with this acknowledged — [what the user would be building on without grounding]."

**Concrete grounding actions** (context-dependent, drawn from the toolkit):
- Run a spike to test the assumption empirically
- Write a test that would fail if the assumption is wrong
- Consult a domain expert or external source
- Belief-map the specific assumption ("what would I need to believe for this to be wrong?")
- Review the artifact trail for prior evidence that addresses the uncertainty
- Explicitly acknowledge the decision rests on unverified ground (the user makes a conscious choice)

The last option is valid — proceeding without grounding is a legitimate decision when the cost of grounding exceeds the risk. But the user is choosing to proceed *without* grounding, not passively dismissing a disclaimer. The choice is visible and conscious.

**Acknowledged tension:** The explicit-acknowledgment option is structurally adjacent to the disclaim-and-proceed pattern this ADR rejects. The distinction is the concreteness of what is acknowledged — "I'm building on [specific unverified assumption]" names the epistemic cost more precisely than a generic disclaimer. Whether this distinction holds under time pressure or repeated use is an open empirical question. Users who reach for this option repeatedly are exhibiting a pattern the Susceptibility Snapshot should detect.

**The Grounding Reframe is the agent's response to the Earned Confidence unassessable floor state.** When the agent cannot determine whether the user's confidence is earned, the reframe creates the conditions for the user to either earn it (by engaging with a grounding action) or acknowledge it isn't earned (by proceeding knowingly).

## Consequences

**Positive:**
- Converts limitation-naming from a dischargeable obligation into an actionable fork
- Preserves user autonomy — the user decides whether to pursue grounding, not the agent
- The concrete actions are not new mechanisms — they are existing RDD practices (spikes, tests, belief-mapping) applied to the specific uncertainty
- Addresses escape hatch #3 (limitation-naming as checkbox) identified during MODEL

**Negative:**
- The user can still wave through the reframe without engaging. Mitigated: the reframe makes the *cost* of proceeding visible ("you'd be building on [unverified assumption]"), not just the *risk*
- Frequent reframes could create alert fatigue. Mitigated: the Grounding Reframe triggers when risk is unassessable, not when risk is merely present — the Tier 1 mechanisms (ADR-058) handle assessed risk

**Neutral:**
- The Grounding Reframe is a specific application of the existing Reframing pedagogical move (domain model) — applied to sycophancy risk assessment rather than problem-space narrowing
- The pattern is non-formulaic — the agent composes the specific description, the concrete actions, and the visible cost from the current context, not from a template
