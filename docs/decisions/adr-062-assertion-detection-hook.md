# ADR-062: Assertion-Aware Observation in AID Cycle

**Status:** Proposed
**Extends:** ADR-040 (Replace Fixed-Template Gates with Attend-Interpret-Decide Cycle), ADR-057 (AID Susceptibility Extension)
**Supersedes:** Earlier design for a UserPromptSubmit pattern-matching hook (rejected during DECIDE — see Context)

## Context

Dubois et al. (2026) found that sycophancy increases monotonically with epistemic certainty conveyed by the user. Assertions with embedded conclusions at artifact-production moments are the highest-risk input — they constrain the model's output distribution toward confirming the embedded conclusion.

The user is an active co-producer of the sycophantic dynamic (DISCOVER feed-forward signal 7). Intervention at the user's input — changing the interaction form from assertion to question — addresses sycophancy at its source rather than attempting to compensate downstream.

The initial design proposed a `UserPromptSubmit` hook that pattern-matched on confidence markers ("clearly," "obviously," "the right approach is"). This was rejected during DECIDE for two reasons:

1. **Over-inclusive:** Lexical pattern matching fires on harmless confidence about implementation details ("clearly this test should pass") because the surface marker triggers the pattern.
2. **Under-inclusive:** Sophisticated embedded conclusions arrive without confidence markers ("given what the research showed, the natural architecture here is event-driven") — reasonable-sounding positions that are the *more* dangerous form precisely because they don't announce themselves.

The agent can assess the semantic nature of an assertion — distinguishing between confidence about implementation mechanics (low risk) and confidence about framing or architectural choices at artifact-production moments (high risk). This semantic assessment is the actual signal; lexical patterns are a weak proxy.

**Accepted limitation:** Moving detection from a pre-prompt hook into the AID cycle's inline observation loses Architectural Isolation — the same agent susceptible to the assertion is the one detecting it. This is an explicit, transparent tradeoff. The structural backstops (Susceptibility Snapshot at phase boundaries via ADR-057, Framing Audit via ADR-061) provide isolated evaluation that catches what inline detection misses. The limitation is named, not hidden.

## Decision

Embedded-conclusion detection is an **AID inline observation responsibility**, not a separate hook.

The AID cycle's Attend phase (ADR-040, as extended by ADR-057) adds **embedded conclusions** to its susceptibility signal repertoire:

- User assertions that embed framing, architectural, or design conclusions — regardless of whether confidence markers are present
- Assertions that narrow the solution space by presupposing an answer rather than asking a question
- Positions presented as following naturally from prior work that have not been examined through belief-mapping

When the agent detects an embedded conclusion at or near an artifact-production moment, it deploys **open-question reframing** from the question toolkit (ADR-056): "What's the open question behind [the assertion]?" This surfaces the embedded conclusion without challenging the user's competence — it reframes the assertion as a question the user can engage with.

**The detection is semantic, not lexical.** The agent assesses the nature of the assertion in context — what it implies, what it forecloses, and whether it's arriving at a moment where the conclusion would crystallize into an artifact. No pattern matching on surface features.

**The response is non-formulaic.** The open-question reframing is composed from the assertion's specific content, not from a template. "What's the open question behind 'the natural architecture here is event-driven'?" is different from "What's the open question behind 'the stakeholder model suggests three user types'?" The form is the same; the content is contextual.

**Frequency management:** The agent does not flag every confident statement. The signal is the combination of (a) an embedded conclusion about framing or design, and (b) proximity to an artifact-production moment. Mid-phase exploratory confidence during conversation is not the target.

**This is a Tier 2 context-responsive mechanism (ADR-058),** not Tier 1 unconditional. The agent exercises judgment about what constitutes a concerning assertion. The Tier 1 backstops (Susceptibility Snapshot, Framing Audit) provide unconditional structural insurance.

## Consequences

**Positive:**
- Semantic detection catches both obvious ("clearly we should") and subtle ("the natural architecture here is") embedded conclusions — eliminates the over-inclusive/under-inclusive problems of lexical matching
- Integrates with the existing AID cycle rather than adding a new mechanism — the agent already reads susceptibility signals; this adds a specific signal type
- Open-question reframing is already in the question toolkit (ADR-056) — no new instrument needed, just a new trigger
- Simpler implementation than a hook with phase-boundary detection heuristics

**Negative:**
- **Loses pre-prompt Architectural Isolation** — the agent assessing the assertion is the same agent susceptible to it. This is the accepted limitation. The agent may fail to detect an embedded conclusion precisely when the conclusion aligns with its own Content Selection bias. Mitigated: Susceptibility Snapshot (ADR-057) at phase boundaries provides isolated evaluation; Framing Audit (ADR-061) catches what crystallized from undetected assertions. The limitation is structural and cannot be fully eliminated within the inline observation model.
- The agent may under-fire (miss concerning assertions) or over-fire (flag reasonable considered positions). Mitigated: under-firing is the acceptable error direction; the Tier 1 backstops catch what is missed. Over-firing is managed by the frequency constraint (framing/design assertions near artifact-production, not all confidence).

**Neutral:**
- **The assertion-detection hook, previously under consideration as a sixth hook extending ADR-033, is not added.** ADR-033's five hooks remain unchanged. The assertion-detection function is absorbed into AID inline observation — the same detection capability, different mechanism. This is a design decision (choosing AID over hook architecture), not a status-quo observation.
- The domain model concept has been reclassified from "Assertion-Detection Hook" to "Assertion-Aware Observation" to reflect the mechanism change
- The Tier 1 backstops catch missed embedded conclusions retrospectively — after the artifact is produced, not before. The residual risk is undetected embedded conclusions that shape phase artifacts before the Susceptibility Snapshot or Framing Audit fires. This risk is accepted; users should understand that inline detection provides coverage probability, not coverage guarantee, at artifact-production moments.
