# Gate Reflection: Cycle 018 discover → model

**Date:** 2026-05-13 → 2026-05-14
**Phase boundary:** discover → model
**Cycle:** Outlines as Research Artifacts and CRESS Audit

## Belief-mapping question composed for this gate

> What would you need to believe for the form-change ADR to NOT be the right decision out of DECIDE?
>
> The grounded framing exposes the structural argument as: (1) outline form is one available instantiation of a structurally similar family, (2) the load-bearing distinguishing evidence (Loop C critical flaw) is theoretical-grounded-by-lit-review rather than empirically-tested-within-RDD, (3) the citation-comparison evidence is scoped to one prose-production method, and (4) Open Question 7 holds open the possibility that the output-side gain is offset by input-side loss in downstream agents. What would make these "yes, but DECIDE should NOT draft the form-change ADR" — versus "DECIDE should draft it with these caveats encoded explicitly"?

The question was composed against the Target 1 grounding that DISCOVER inherited from the research → discover boundary (outline form as "available instantiation" rather than "uniquely best"). The goal was to test whether the user's confidence in the form change was earned through the prior grounding work or absorbed across the gate.

## User's response

The exchange ran across multiple turns.

**Turn 1 — substantive engagement with the criterion:**

> "I think I need to see evidence that the narrative form is useful. To me, it's more important that it propagates the right information forward. If I want it to be an essay for real, I'd rather write it in my own voice from the outline (same logic as synthesis). Therefore, it's better and clearer to have a more succinct format that crystalizes the core argument in a measurable way without leaking implications in the connective tissue of the essay."

The user articulated a criterion-based answer:
1. Burden of proof shifted to narrative form ("evidence that the narrative form is useful")
2. Criterion: information propagation forward (downstream-feed-forward)
3. Principled extension of existing methodology pattern ("same logic as synthesis")
4. Mechanism named: succinct format + measurable core-argument crystallization + no implication-leak in connective tissue

The user did NOT engage CRESS scope-transfer caveat (Target 2), citation-comparison evidence scope caveat (Target 3), or Open Question 7 (Kim et al. input-side susceptibility) in this turn.

**Turn 2 — orchestrator probe on synthesis-bullet discipline:**

The orchestrator probed: should DECIDE's form-change ADR encode a structural check for SYNTHESIS bullets in outline form (analog of Cycle 10's prose-hardening-doesn't-work finding) or is discipline-as-skill-text-convention sufficient?

**Turn 3 — scope clarification:**

> "I'm talking about the synthesis RDD phase where the goal is to generate something shareable"

The user sharpened the framing: their "same logic as synthesis" reference was specifically about the SYNTHESIZE phase's shareable-essay role, not about synthesis-bullets-within-research-outlines. Narrative IS useful when the goal is *sharing* (SYNTHESIZE); narrative is NOT useful when the goal is *information propagation* (RESEARCH). The form-change ADR is therefore RESEARCH-scoped; SYNTHESIZE's existing pattern (agent outline → user writes prose for sharing) stays unchanged.

**Turn 4 — Grounding Reframe presentation:**

The susceptibility snapshot at this boundary recommended a Grounding Reframe with two targets: (1) research-vocabulary inherited into user-voice jobs and vocabulary entries; (2) the synthesis-bullet-reliability question raised, redirected, and lost. The orchestrator presented both with concrete grounding actions and "without grounding" consequences.

**Turn 5 — user response to Grounding Reframe + form-spec refinement:**

> "We don't need to do target 1. For target 2 I don't have a strong opinion yet. A thought that's come to mind is that the argument audit itself is useful. I also thing an abstract is useful as a synthesis / summary to be read at the top of this artifact... 'essay-outline-NNN'? So what I'd be interested to see is sections 1) Abstract 2) Argument-graph 3) Citation-embedded outline 4) References... or similar."

The user:
- Declined Target 1 (research vocabulary in user-voice sections accepted as-is)
- Deferred Target 2 to DECIDE without a strong opinion (synthesis-bullet question surfaced as open Value Tension)
- Refined the form proposal: four-section artifact structure (Abstract / Argument-graph / Citation-embedded outline / References), candidate name `essay-outline-NNN`

The argument-graph proposal elevates the argument structure from auditor-output to first-class artifact content. The abstract proposal addresses the "narrative useful for sharing" concern by providing a top-of-artifact synthesis surface without restoring prose body.

## Pedagogical move selected

Challenge. The belief-mapping question composed at the boundary surfaced a structural test the user's prior grounding work made answerable. The user engaged with criterion-based reasoning (turn 1), then sharpened scope (turn 3), then refined the form-spec substantively (turn 5). Two challenge moves occurred in the exchange: the initial belief-mapping question, and the Grounding Reframe presentation following the susceptibility snapshot. Both elicited substantive responses rather than agreement-or-deflection.

The orchestrator's synthesis-bullet probe (turn 2) was a Probe (referenced specific artifact content), not a Challenge. The user's scope clarification (turn 3) corrected the probe's framing — the orchestrator had conflated the SYNTHESIZE-phase shareable-essay role with synthesis-bullets-within-RESEARCH-outline discipline. The orchestrator updated the value tension to capture the user's sharpened distinction.

## Commitment gating outputs

**Settled premises (the user is building on these going into MODEL):**

- The form-change for `/rdd-research` is settled as the right move for DECIDE to encode. Burden of proof is on narrative form to demonstrate usefulness in the RESEARCH artifact role; the user finds it does not.
- Information propagation forward (downstream-feed-forward) is the load-bearing criterion. The R2 corpus check (96 ADR references trace to structured content, not prose connective tissue) is the empirical anchor.
- Narrative form is useful when the goal is *sharing* (SYNTHESIZE phase produces a shareable essay). Narrative form is NOT useful when the goal is *information propagation* (RESEARCH artifact role). Form-change is RESEARCH-scoped; SYNTHESIZE's existing pattern stays unchanged.
- The four-section artifact structure (Abstract / Argument-graph / Citation-embedded outline / References) is the user's refined form-spec going into DECIDE. Candidate name `essay-outline-NNN`. The abstract provides a shareable surface without sacrificing outline's audit substrate. The argument-graph elevates claim-warrant-evidence structure from auditor-output to first-class artifact content.
- The research-vocabulary inheritance issue in the DISCOVER artifact (Target 1 from the susceptibility snapshot) is acknowledged but not addressed in this cycle — the user accepts the current voicing.
- Cycle-as-instance reflection (ADR-087 §4) applies: this cycle's findings are research-not-validation until tested across additional cycles. Reframe inherited from the research-gate carries forward.

**Open questions (the user is holding these open going into MODEL):**

- **Synthesis-bullet discipline as convention vs. structural check.** Held for DECIDE without user preference. The form-change ADR must address whether synthesis-bullet presence is enforced structurally (e.g., audit-time verification) or left as skill-text convention. The four-section structure with explicit argument-graph as a primary section is one structural answer; an audit-time bullet-presence check is another.
- **Argument-graph format.** The four-section proposal names argument-graph as a primary section but does not specify the format (text-based dependency graph? mermaid? structured-bullet hierarchy?). DECIDE's form-spec ADR must specify.
- **Auditor integration with argument-graph.** Whether the argument-auditor consumes the explicit graph directly rather than re-deriving from prose. DECIDE's form-spec ADR must address.
- **Form-migration scope for reflections and synthesis essay.** Held as separable for DECIDE.
- **Open Question 7 (Kim et al. input-side susceptibility).** Held as downstream empirical test candidate; not a DECIDE blocker.
- **CRESS scope-transfer (Target 2 inheritance) and citation-comparison evidence scope (Target 3 inheritance).** Held as scope-of-claim caveats DECIDE must encode in any ADR that cites the convergence or the citation-comparison evidence.
- **Methodology-amendment ADR-082 second-stage bracketing.** Candidate held for DECIDE; not blocking.
- **Standing two-dimensional susceptibility evaluation rubric.** Candidate held for DECIDE; not blocking.
- **Research-vocabulary inheritance pattern (Target 1 declined for this cycle).** The pattern is not addressed in Cycle 018 — DISCOVER artifacts entering MODEL carry research-essay constructs in user-voice sections. This is a methodology-level signal that may resurface in future cycles; not addressed here.

**Specific commitments carried forward to MODEL:**

- The updated product-discovery artifact at `./docs/product-discovery.md` is the load-bearing context for MODEL's domain vocabulary extraction. The Product Vocabulary table contains ~22 new entries from Cycle 018; the Product Origin column in the domain model should attribute these to product-discovery as the source.
- The four-section artifact structure refinement is a product-level signal MODEL should be aware of as it extracts vocabulary (terms like "Abstract", "Argument-graph", "Citation-embedded outline", "essay-outline-NNN" become candidate domain concepts).
- The synthesis-bullet discipline question, the argument-graph format question, and the auditor-integration question are held for DECIDE — MODEL should extract vocabulary for these (e.g., "synthesis bullet", "structural check vs. convention", "argument-graph format") without resolving them.
- The susceptibility snapshot's specific findings (`/Users/nathangreen/Development/rdd/.rdd/audits/susceptibility-snapshot-018-discover.md`) are part of the artifact trail. The Target 1 finding (research-vocabulary in user-voice sections) is a methodology-level observation MODEL may inherit at the vocabulary-attribution level.
