# Gate Reflection: Does RDD Over-Engineer? RESEARCH → DISCOVER

**Date:** 2026-05-16
**Phase boundary:** RESEARCH → DISCOVER
**Cycle:** 019 — Does RDD Over-Engineer?

## Belief-mapping question composed for this gate

> The Essay-Outline's central conclusion (C1) is that the over-engineering question resolves into a *calibration question* across methodology layers — not a structural rejection. The argument-audit's F-P2 framing finding noted this conclusion sits closer to the self-justification pole: the evidence supports the conclusion, but the question is whether the research structure gave methodology-mismatch a structural advantage from the start (Branch C was the strongest existing answer going in; the calibration framing fits naturally as an extension of ADR-091 and ADR-083, which the methodology had already accepted).
>
> **Belief-mapping question:** *What would have to be true for the conclusion to be different — for the over-engineering critique to land as a structural rejection rather than a calibration question?*
>
> Concretely: what evidence (in the lit-review, in the corpus, in the cycle's actual experience) would have made you push back at the Loop 4 synthesis or at the framing-findings gate, and steer toward "RDD's structural posture itself is wrong" rather than toward "three calibration moves close the gap"?

## User's response

> The heart of it for me is in the space exploration of research questions in service to building something. A previous cycle proposed running spikes - and that impulse came from wanting to learn from building sooner in ways that would ground the research -> discover -> decide process better. If we are researching a topic that is broad but ultimately want to build a v1 prototype, how do we build the simplest useful thing that is consistent with our research versus building everything and the kitchen sink? So I'd need to see evidence that our methodology produces everything-and-the-kitchen-sink (versus YAGNI) implementations. Conversely, what is GOOD about RDD is its propensity to work with nuance.

## Pedagogical move selected

**Challenge** via belief-mapping (from the Question Toolkit's primary form for the Inversion Principle). Composed against specific Essay-Outline content (C1's central conclusion + the F-P2 framing finding) — the question referenced the artifact directly, not the user's prior engagement.

The user's response opened a research dimension the cycle's evidence did not cover, triggering the cycle's largest mid-stream revision (re-opened RESEARCH, dispatched Loop 6 with three external project investigations, added C7 + ADR-CANDIDATE-019.4). The gate's conversation continued through a second AskUserQuestion (revision-scope decision: major revision adopted) and a third (R3 framing-finding decision: ADR-019.4 downgraded to Tier-2).

## Commitment gating outputs

**Settled premises (the user is building on these going into DISCOVER):**
- The calibration pattern across methodology layers is a real and progressing pattern (ADR-091 BUILD; ADR-083 human-facing artifacts; Cycle 019 candidate ADRs).
- YAGNI discipline is structural across the three external RDD applications (zani, llm-orc, plexus) — observable in explicit "rejected/deferred" patterns and institutional innovations (llm-orc's `adr-deferred-` filename pattern; plexus's ADR-038 + ADR-024).
- The kitchen-sink failure mode, where observed, is localized to research-driven cascades lacking empirical filter (zani palette subsystem; llm-orc calibration channel).
- ADR-CANDIDATE-019.4 (empirical-grounding criterion at DECIDE) is in-cycle but encoded at Tier-2 methodology-principle level (felt-judgment-anchored, like ADR-083) — not Skill-Structure Layer enforcement. The scope choice was made in response to the R3 framing finding (self-referential risk: proposing heavy structural enforcement from 2/26 evidence would itself instantiate the C7 pattern).
- The four in-cycle ADR candidates (019.1 audit-round-count; 019.2 Agent Outcome Test; 019.3 RESEARCH patch-switching; 019.4 empirical-grounding criterion) collectively address Branches B, E, D, and A (reframed).
- Branch C (methodology-mismatch as the canonical "no" answer) is strongly supported by existing methodology (Reflection 005 + graduation lifecycle); the entry-side operationalization gap is recorded as separately-scoped.
- The user's "what is GOOD about RDD is its propensity to work with nuance" is structurally preserved by the C7 remedy (filter at DECIDE; do not compress research).

**Open questions (the user is holding these open going into DISCOVER):**
- **(Grounding Reframe Target 1)** Does the cross-project evidence foreclose the fixed-cost-per-cycle alternative framing, or does it remain live? The Essay-Outline's C1 framing (calibration question, not structural rejection) was not independently arrived at by the practitioner before Loop 6; the fixed-cost-per-cycle alternative was identified in R1's research-methods reviewer audit but never returned to. If the fixed-cost framing is live for the practitioner, it leads to different DISCOVER value tensions and different ADR candidates than C1's calibration frame does.
- **(Grounding Reframe Target 2)** Does the evidence support DECIDE as the primary remedy location for the C7 mechanism, or is PLAY the stronger lever? The W7.4 elevation of "what is GOOD about RDD is its propensity to work with nuance" performs a framing function that forecloses (without examination) the PLAY-as-filter alternative remedy location. If PLAY is the stronger lever for catching research-driven cascades before BUILD, the in-cycle ADR scope may shift.
- The "kitchen-sink-by-delegation" critique (plexus's "lean core, extend via llm-orc/specs" posture) was flagged but not investigated. Held open as a separate kitchen-sink mechanism distinct from research-driven cascade.
- Multi-cycle replication of W7.3's single-cycle anchor (auto-mode BUILD did not cause kitchen-sink in llm-orc Cycle 6 alone) — future cycles producing built v1 prototypes in auto mode would either confirm or complicate the finding.

**Specific commitments carried forward to DISCOVER:**
1. **Grounding Reframe carry-forward:** The two grounding actions above are surfaced at the DISCOVER opening, before stakeholder-map and value-tension work begins. The practitioner's answers may update Cycle 019 ADR candidates or DISCOVER's value tensions.
2. **Four in-cycle ADR candidates** to be decomposed into DISCOVER value tensions + jobs:
   - 019.1 audit-round-count calibration → value tension (verification-coverage vs round-count cost)
   - 019.2 Agent Outcome Test for agent-facing artifacts → value tension (consumption-fidelity vs corpus-accumulation)
   - 019.3 RESEARCH patch-switching criterion → value tension (research-completeness vs termination-discipline)
   - 019.4 empirical-grounding criterion at DECIDE → value tension (research-surfaced-elaboration vs empirical-grounding-filter)
3. **Branch C entry-side calibration gap** is held as a separately-scoped open question, NOT a Cycle 019 ADR candidate.
4. **Reflexivity-related observations** (gate caught what audits did not; self-referential application of C7 to ADR-019.4 scope; auto-mode BUILD counter-evidence to ADR-091's named failure mode) recorded in reflections file; DISCOVER may surface methodology-level value tensions if appropriate.
5. **The user's nuance-preservation criterion** is a commitment, not just a remark: DISCOVER's value tensions and any downstream remedy must preserve research's nuance-surfacing function. The remedies operate at DECIDE (filter) or PLAY (refutation), not at RESEARCH (compression).
