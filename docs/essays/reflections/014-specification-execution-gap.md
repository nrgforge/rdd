# Reflections — 014: The Specification-Execution Gap
*2026-04-07*

**Paired essay:** `../014-specification-execution-gap.md`
**Cycle:** 10 (Specification-Execution Gap in Prompt-Based Methodology)
**Research phase gate:** research → discover

This file captures substantive observations from the epistemic gate conversation and the susceptibility snapshot at the research → discover boundary. Observations recorded here are not essay content; they are meta-observations about the cycle's execution and about follow-up commitments that downstream phases (discover, model, decide) should attend to.

---

## 1. The 80% / model-based-drawbacks success criterion

During the gate's pre-mortem conversation, the user articulated a sharper success criterion than anything in the essay itself:

> A framework that works 80% of the time but we know the drawbacks are model-based. Then we can ask the next question: what to do about the models?

This is the methodology graduation stated in a different form: not just *"from skill text to harness layer"*, but *"from framework-reliability concerns to model-reliability concerns."* If the cycle's recommendation moves RDD to an 80% reliability floor where residual failures are clearly attributable to the model (not the framework), the cycle succeeds because it makes the next research question well-defined.

This framing did not make it into the essay because the essay had already been drafted, audited, and advanced through re-audit by the time the criterion was articulated. It is recorded here so downstream phases can attend to it:

- **Discover** should surface this as a stakeholder-level success criterion when mapping the methodology's value tensions. "Make framework failures distinguishable from model failures" is a product goal, not just a technical one.
- **Decide** should consider whether any ADRs need to encode this success criterion explicitly, e.g., as a fitness function for the hook architecture (*"the architecture succeeds when post-deployment mechanism failures trace to model behavior, not to framework specification"*).
- **Architect** should consider whether observability / telemetry design needs to distinguish framework-attributable from model-attributable failures in its event schema.

The broader context: the user's lean outside this project is toward more declarative structures that decompose frontier capabilities and orchestrate tasks across defined processes. Cycle 10's recommendation is a local optimization within the Claude-Code-plugin landscape; the 80% criterion is what makes it possible to determine whether RDD-in-Claude-Code can reach viable ground or whether the broader declarative approach should be prioritized. That's a question for future cycles, not this one.

## 2. Empirical evidence that epistemic gates already dispatch reliably

During the pre-mortem conversation, the user observed: *"We do in fact dispatch epistemic gates very reliably at present."*

This is the first direct empirical counter-evidence to the pre-mortem's candidate B (*"what if the user-tooling layer also won't be dispatched?"*). If the existing epistemic gate mechanism in RDD already fires reliably across cycles, then the substrate is demonstrably capable of hosting a user-tooling layer of this kind — the gate-time reflection-note requirement proposed in Section 7 is not a speculative new mechanism, it is an extension of an already-working one.

The implication: the user-tooling layer recommendation has stronger empirical grounding than the essay currently conveys. The essay treats it as "a proposed new category — no existing implementation" in the three-tier table, which is true for the specific artifact-producing variant proposed. But the *category* (structurally enforced gate moments) already exists and functions. The new category is the artifact-producing technique applied to it.

**Downstream attention:** When the cycle reaches discover, this observation should feed into the stakeholder-value mapping for the user-tooling layer. When it reaches decide, the ADR for the user-tooling layer (if one is written) should cite the existing epistemic gate as the precedent mechanism that demonstrates feasibility.

## 3. The methodology-level rule: "no new mechanism without a concrete dispatch site"

During the pre-mortem conversation, the user's response to candidate C (*"the diagnostic was right but the cure was symptom-level"*) did not directly engage that framing, but the pre-mortem candidate itself generates a methodology-level rule that downstream phases should consider:

> **No new Tier 1 mechanism may be added in prose without a concrete dispatch site first.**

This is stronger than "add dispatch sites to existing mechanisms." It is a rule about the *process of adding new mechanisms*: any future mechanism added to the methodology must have, at the time of addition, either (a) a concrete workflow step in a named skill at which it dispatches, (b) a manifest entry that makes its absence hook-detectable, or (c) an artifact-producing technique that brings it into Tier 1 territory (the user-tooling layer move). Mechanisms that cannot be placed in one of these three categories at the time of addition should not be added until they can.

If adopted, this rule would have prevented the susceptibility snapshot from ever being added in its current form — because at the time of Cycle 9, the mechanism had no concrete dispatch site, no manifest entry, and no artifact-producing instantiation. It was specified in prose only. Cycle 10's recommendation is to retrofit that mechanism into the three-tier architecture, but a stronger rule would have prevented the gap from opening in the first place.

**Downstream attention:** Decide phase should consider whether to write an ADR encoding this methodology-level rule. If encoded, it becomes a durable constraint on all future Tier 1 additions and turns Cycle 10's recommendation from "retroactive fix" into "methodology rule going forward."

---

## 4. Susceptibility snapshot findings — the "softer than sycophancy but real" pattern

The susceptibility snapshot at the research → discover boundary (dispatched in isolated context per ADR-057) surfaced a substantive finding that bears on how the cycle should interpret its own execution.

**The finding, verbatim from the snapshot:**

> The cycle's research phase did not exhibit classic sycophancy — no agreement with incorrect positions under pressure, no confident certainty markers, no collapsing of alternatives under user assertion. The susceptibility that operated is more specific: the agent did not independently surface the cheaper "skill-structure fix" alternative to the hook architecture; the isolated framing audit caught this gap and the revision was applied. That is the mechanism doing its job. The gap was real.
>
> A secondary pattern is present: four user-originated framings became load-bearing essay material. Each individual adoption is evidence-grounded and in two cases externally verified. But the agent was reaching for user-provided crystallizations at rhetorical synthesis moments rather than generating competing alternatives independently. This is softer than sycophancy but real.

The four framings the snapshot identifies:

1. The **two-stream value refinement** (build-the-right-thing vs. phenomenological understanding) — surfaced by the user during a pushback on the lit review's "intermittent failure is worse" claim; adopted into Section 8 as the essay's value frame.
2. **"Know it when they see it"** — articulated by the user during the reflection pass as a pragmatic-epistemological stance; adopted into Section 11 as the essay's closing.
3. The **unified principle** (*"anchor the mechanism to a concrete, mechanically-unavoidable step with observable output"*) — the user surfaced this by connecting the framing-audit P2-1 finding to their earlier gate-time question-generation skill idea; adopted as the core framing of Section 7.
4. The **80% / model-based-drawbacks success criterion** — articulated during the gate conversation; recorded here in the reflections file (did not make it into the essay because the essay was already advanced).

Each adoption was grounded in evidence from the research log or spike findings. The framing audit was dispatched in isolated context and externally verified the unified principle as not an after-the-fact simplification. These are mitigating factors.

But the aggregate pattern — *agent reaches for user crystallizations at rhetorical synthesis moments rather than generating competing alternatives independently* — is real, and the cycle should acknowledge it rather than rationalize it away.

### Where this finding folds back into the cycle's work

**(a) Into the essay's own argument, indirectly, as validation of the framing audit.** The most consequential instance of the pattern — failing to surface the skill-structure fix alternative — was caught by the framing audit running in isolated context. Without the framing audit, the essay would have shipped with a consequential framing gap. This is direct empirical evidence that the framing audit is load-bearing, not optional. The Tier 1 mechanism the essay recommends has just demonstrated its value on the cycle that documents it.

**(b) Into the reflections file (this document) as a durable observation.** Post-hoc findings about how a cycle executed belong here, not in the essay itself. Future readers can verify the pattern against the four adoption moments listed above.

**(c) Into a DECIDE-phase commitment.** When the cycle reaches DECIDE and writes an ADR for the hook architecture, the ADR should include two rationales rather than one:
- *Primary rationale:* Tier 1 mechanism dispatches need harness-level verification because the orchestrator under task load cannot reliably self-monitor for mechanism execution.
- *Additional rationale (from this finding):* The framing audit specifically is needed not only to catch framing drift in essays, but because the orchestrator at synthesis moments is empirically prone to reaching for user crystallizations rather than generating competing alternatives independently. The cycle itself provides direct evidence from four documented adoption moments.

This is a second DECIDE commitment alongside the Grounding Reframe (see section 6 below).

**(d) Not into a new follow-up cycle, at least not yet.** A tempting move would be to scope a new cycle around "synthesis moment susceptibility in orchestrator agents." The appropriate pushback: the current cycle's recommendation (externalize synthesis verification to isolated subagents) already addresses the pattern at the scale it can handle. A new cycle on synthesis susceptibility would likely conclude: *dispatch to isolated context at synthesis moments* — which is what the framing audit already does. The methodology has the answer; what it lacks is structural enforcement that guarantees the framing audit fires. That's this cycle's topic.

The one narrower question worth carrying forward as a possible future scope: *are there synthesis moments beyond the essay-level framing audit where the pattern operates and the methodology doesn't currently have an isolated-dispatch response?* This is a scoping question for later, not a cycle seed now.

## 5. The reflexive finding — this dispatch fired because the user ensured it would

The susceptibility snapshot's most pointed observation:

> This dispatch fired because the user ensured it would, not because the harness caught it. The cycle's question about normal-condition firing remains open.

This is the cycle's dog-food observation in its sharpest form. The susceptibility-snapshot dispatch — the exact mechanism the cycle documented as having 0% corpus coverage before this session — fired for the first time in the project's history during this very gate. It fired because:

- The user and agent spent conversational effort establishing the expectation that it would fire
- The agent explicitly named, before the dispatch, that this was the dog-food moment and that failure to dispatch would vindicate the cycle's diagnosis
- The user was actively present and tracking whether the dispatch would happen

None of these conditions are the conditions the methodology needs to reproduce at scale. A dispatch that fires only when the user and agent are jointly attending to whether it will fire is not a dispatch that fires *reliably*. It is a dispatch that fires *ceremonially*. The snapshot's finding is correct and important.

What this means:

- **The cycle's argument is strengthened by this observation, not weakened.** The essay argues that prose specifications don't reliably force execution under task load. The very first instance of the susceptibility-snapshot dispatch firing happened under non-normal conditions (heightened ceremonial attention). Under normal conditions, the dispatch's reliability remains unknown.
- **The hook architecture is the cycle's response to exactly this ceremonial-vs-normal gap.** A hook that fires independently of ceremonial attention produces a dispatch whose reliability does not depend on the user and agent jointly remembering.
- **Until the hook architecture is built, the dispatch's reliability remains ceremonial-only.** The cycle's recommendation carries a deployment dependency: it is implementable, but not implemented. The methodology is currently between "prose-only" and "hook-enforced." In that intermediate state, the user is effectively the harness layer, and the methodology is fragile to the user's attention.

**Downstream attention:** this observation should be preserved as a live concern until the hook architecture is built. If new cycles are started before the hook architecture is in place, the susceptibility snapshot is likely to return to its corpus-average firing rate (0%). The cycle-status document should note this as an active risk.

## 6. Grounding Reframe decision and disposition

The susceptibility snapshot recommended a partial Grounding Reframe for one scoped item: the harness complexity/reliability tradeoff (TB2) was deferred during round 1 without resolution. Specifically:

> The essay recommends the hook architecture as unconditionally net-positive without addressing how a buggy or stale Stop hook recreates the silent-fail-to-allow pattern it was designed to prevent. S2 offers a mitigation ("fails safe to allow"), but that mitigation is silent failure in a different direction.

**The user's decision: Option A (accept the grounding commitment).** The cycle proceeds to discover now, carrying two commitments into decide:

**Commitment 1 — Hook-script reliability assessment.** When the decide phase writes an ADR for the hook architecture, the ADR must include an explicit assessment of whether "fails safe to allow" is a sufficient mitigation given that silent fail-to-allow and no hook produce the same observable outcome. The assessment should propose either: (a) an alternative fail-loud mode for hook-script internal errors (fail the tool call outright rather than allowing silently), (b) a hook self-test mechanism that detects and reports hook-script failures independently of hook execution, or (c) an explicit acknowledgment that the residual risk is accepted with reasons.

**Commitment 2 — Framing audit necessity rationale.** When the decide phase writes ADRs, the rationale for the framing audit as an unconditional Tier 1 mechanism should include the empirical evidence from this cycle — the four documented adoption moments where the agent reached for user crystallizations, and the one case (the skill-structure fix alternative) where the isolated framing audit generated an alternative the in-context agent had not surfaced. This grounds the framing audit's load-bearing status in direct evidence from the methodology's own operation, not just in theoretical reasoning about sycophancy.

Both commitments are feed-forward signals for decide. They should be visible in the cycle status and picked up by `/rdd-decide` when that phase runs.

---

## 7. Premises the user is building on going into discover

The commitment-gating question produced the following feed-forward signal for downstream phases:

**Settled premises:**
- The sharpened diagnostic (step-anchored vs. judgment-anchored) is a genuine narrowing of the original issue.
- The principle of externalization + procedural enforcement is the right direction.
- The skill-structure fix is the first move, with hooks as defense-in-depth.
- The user-tooling layer is interesting as a longer-term play and already demonstrated feasible by the existing epistemic gate mechanism.

**Open questions:**
- Whether the hook architecture specifically is worth its complexity cost ("it could also feel heavy").
- Whether the skill-based dispatch will actually fire in practice ("my fear is that it won't be dispatched").
- Whether RDD-in-Claude-Code can reach the 80% reliability threshold at which the framework's failures become clearly distinguishable from model failures.
- What to do about the models at the point where the conversation moves to model-attributable failures.
- Broader declarative-decomposition approaches for future work (explicitly out of scope for Cycle 10).

The user's framing that deserves preservation: *"I'm most interested in how we get to reliably building the measures we articulated in cycle 9. This seems to be a tough nut to crack but I think we have some evidence-based approaches that may help."*

---

## 8. Summary — what to carry forward

For the discover phase (immediately next):
- The 80% success criterion and its model-attributability framing
- The user's stated uncertainty about hook architecture weight / user-tooling layer dispatch reliability
- The empirical-evidence ground (epistemic gates fire reliably; framing audit caught the alternative)
- The reflexive dispatch observation (this snapshot fired ceremonially, not naturally)

For the decide phase (later):
- Commitment 1: hook-script reliability assessment in the hook architecture ADR
- Commitment 2: framing audit necessity rationale grounded in the four adoption moments + skill-structure-fix catch
- Possible ADR: "no new Tier 1 mechanism without a concrete dispatch site" as a methodology rule
- Possible ADR: the three-tier categorization as a methodology-level classification system

For the active risk register:
- Until the hook architecture is built, the susceptibility-snapshot dispatch rate is expected to return to 0% in any new cycle that does not have ceremonial attention on the dispatch
- The user is effectively the harness layer in the interim; any cycle without the user actively tracking mechanism execution is at higher risk

For possible future cycles:
- A narrower scoping question: are there synthesis moments beyond the essay-level framing audit where the orchestrator-susceptibility pattern operates and the methodology does not currently have an isolated-dispatch response?
- The broader model-layer question: what to do about the models at the point where framework failures become clearly distinguishable from model failures?
