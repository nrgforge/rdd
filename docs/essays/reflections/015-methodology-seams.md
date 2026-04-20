# Reflections: Cycle 016 — Methodology Seams

*2026-04-17*

## Expand-Outward vs. Evaluate-Inward

The essay treats RESEARCH-phase anchoring (#16) and BUILD-phase pattern reuse (#13) as the same kind of intervention at different pipeline stages. The gate conversation surfaced a sharper distinction: they are different *kinds* of evaluation that share a common vulnerability.

**RESEARCH faces outward.** Its job is to expand the solution space — bring in evidence that might challenge what's already been built, question whether the existing corpus is still the right frame. The vulnerability is that existing artifacts pull questions inward before the expansion happens. The intervention (question-isolation before artifact consultation) serves the expansion function.

**BUILD faces inward.** It works with the implementation that exists, and its job is to evaluate whether that implementation is doing the job it's supposed to. The relevant questions — "is this implementation not doing the job?" / "what are the risks of it staying this way?" — are evaluative, not expansive. The vulnerability is that a working pattern captures attention before the evaluative question gets asked.

The user connected three existing methodology philosophies as BUILD-phase evaluation lenses: Tidy First ("make the change easy then make the easy change"), stewardship checkpoints, and Hickey's simple-vs-easy distinction. All share a structure: stop before extending, evaluate whether the thing being extended is fit for the extension. The Einstellung finding explains why these lenses don't trigger spontaneously despite being in the methodology's vocabulary.

## Invariant 8 Applied to Cognitive Mechanisms

The gate conversation produced a key challenge: if the methodology already encodes these evaluation philosophies, why did Issue #13 happen?

The answer connects the Einstellung mechanism to Invariant 8 (a specified mechanism is not a working mechanism). The lenses (Tidy First, stewardship, simple-vs-easy) are specified as available cognitive resources. They are not structurally triggered at the point where they're needed. The Einstellung effect suppresses exactly the judgment that would cause the practitioner to reach for the lens — the pattern captures attention before the practitioner remembers the lens exists.

This means the design requirement changes: the lenses need to be invoked by a structural event (code being extended by analogy, pattern being reused in a new context), not by practitioner judgment about when to apply them. The judgment mechanism is what's compromised.

This is the same lesson Cycle 10 learned for Tier 1 sycophancy-resistance mechanisms: dispatch must be anchored to a structurally observable event, not to contextual judgment. The cognitive-mechanism findings extend Invariant 8's scope from "methodology mechanisms" to "practitioner cognitive resources" — both need structural triggering to fire reliably.

## Settled Premises Going Into DISCOVER

1. **Structural encoding is necessary.** Cognitive mechanisms against attention narrowing must be structurally triggered, not philosophically available. The Einstellung finding and the Issue #13 failure are the evidence.
2. **Cognitive-mechanism design is second-line defense.** Worth building because it addresses the causal root, but not the layer to rely on alone — enforcement strength determines the ordering.
3. **Expand-outward and evaluate-inward are directionally different.** RESEARCH and BUILD share a vulnerability but face different directions. Interventions should be designed for the direction, not collapsed into one.
4. **ADR immutability serves RDD's provenance function.** The living-document approach trades provenance traceability for navigational simplicity — a valid trade-off for different use cases, but not for RDD's system-design provenance chains.
5. **The seven issues are real gaps.** The research characterized them with literature grounding; downstream phases should address them.

## Open Questions Going Into DISCOVER

1. What form does structural encoding take for each issue? (Acceptance criteria table, applicability check trigger, question-isolation protocol, supersession workflow — these are proposals, not decisions.)
2. Is multi-cycle composition (#14) a prerequisite for the other structural fixes, or can they be implemented independently?
3. How should stewardship checkpoints be augmented to trigger the evaluation lenses at the right moment — without adding overhead that induces circumvention (Invariant 4)?
4. What does the amendment/supersession distinction look like concretely for RDD's ADR format?
5. Does the batch-cycle format need formal support in the multi-cycle schema, or was it a one-off experiment that the standard schema can handle adequately?
