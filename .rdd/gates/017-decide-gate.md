# Gate Reflection: Cycle 017 (Readability & Comprehensibility) — decide → architect

**Date:** 2026-04-28
**Phase boundary:** decide → architect
**Cycle:** 017 — Readability & Comprehensibility

## Belief-mapping question composed for this gate

A belief-mapping question targeting ADR-087's Beck-port reframe — chosen because it traces directly to the practitioner's own original methodology framing (RDD as a port of Beck's time-value-of-money argument) and tests whether the calibration ADR-087 records is earned at the practitioner's commitment level rather than imposed:

> ADR-087 calibrates the Beck port from "load-bearing structural evidence" to "useful conceptual frame, not yet validated against the world." Three specific items separate the conceptual port from a verified payoff claim: the compressed-feedback-horizon claim is unverified; the reusability assumption is conditional on continuous corpus stewardship (which is itself an investment cost the Beck port does not separately account for); the cycle-as-instance reflection is the strongest available evidence the framing has not yet been tested.
>
> What would you need to believe for the original Beck-port framing — RDD's written-thought asset class produces option value comparable to tidying's option value, with practitioner-dogfooding compressing the feedback horizon enough to recoup the authoring cost across cycles — to be load-bearing structural evidence rather than the calibrated-but-unverified frame ADR-087 records it as?

The question explicitly named the alternative position (the original Beck-port framing as load-bearing) and asked the practitioner to map the belief space rather than confirm the calibration directly. This is the belief-mapping form per the Question Toolkit (ADR-055/056).

## User's response

The response unfolded across three exchanges, each substantively generative rather than confirmatory:

**First articulation:**

> Great question. The impulse is really around resisting (for sufficiently complex problems) the impulse to build very complex system in a single cycle without verifying smaller parts. Or maybe better put, the research process should emphasize smaller validations earlier because actual usage of the small prototype might reveal a lot about a small slice of the system rather than resting on assumptions until we get to "build".

**Second articulation (clarifying interaction-grounding rationale):**

> The problem I'm encountering and that Beck illustrates is related to what we learn when. We have purposefully made the research phase the heaviest phase because we know it's the most susceptible to biasing the rest of the process. Our research is good and well grounded from a search / lit-review / methods point of view. But what I'm suggesting is that an additional research method could be running tightly scoped prototyping where appropriate. Ground the research in an actual interaction. That may surface real additional questions or directions that will feed-forward.

**Third articulation (connecting to YAGNI and possibility-space explosion):**

> Yes that lands. This is part of the same thread on not overengineering solutions. My RDD experience in another project I'm working on has led to a sprawling implementation that tries to solve for things that are really in YAGNI territory. So I think part of RDD research phase needs to ground in what are we actually solving for, how can we answer those research questions with something tangible in ways that inform our essay to drive the next phase, rather than exploding the space of possibility and accounting for every case into later phases, when in reality, perhaps we can answer questions more directly with informed spikes in research. Does that make sense?

The articulations together reframe ADR-087's §3 from "validation spike as Beck-port amendment" to "tightly-scoped prototyping as a research method alongside lit-review, literature search, and research-methods review — used to ground research in actual interaction, and to act as counterforce against possibility-space explosion." The user's confirmation to amend ADR-087 in this DECIDE before close-out: "Yes."

## Pedagogical move selected

Challenge (belief-mapping). The move tested whether the Beck-port calibration ADR-087 records is earned at the practitioner's commitment level by asking what would need to be true for the original framing to be load-bearing — sidestepping the compliance dynamic that asking "do you agree with the calibration?" would create. The practitioner's response did not confirm the calibration directly; it generated a sharper rationale for the calibration's downstream consequence (validation spikes as research method), connected the rationale to a held-open future-cycle candidate (does RDD over-engineer?), and brought concrete field evidence the agent did not have at drafting time (the practitioner's experience with another RDD project producing sprawling YAGNI-territory implementation).

The challenge produced a substantive amendment to ADR-087 §3 — the gate's articulation reframed the section's purpose from Beck-port-amendment to research-method-toolkit expansion, with anti-elaboration positioning added in §3a. A fourth-pass argument audit ran on the revised ADR-087 and returned CLEAN AUDIT with two P3 precision improvements (ADR-077's primary disposition is anti-Einstellung, not anti-elaboration — noted in §3a's table; rejected alternatives entries 4 and 5 referenced the retired three-criterion trigger — updated to name the §3 reframed trigger).

## Commitment gating outputs

**Settled premises (the practitioner is building on these going into architect):**

- The cycle's eight ADRs (ADR-083 through ADR-090) are accepted with the §3 reframe in ADR-087 applied.
- The Outcome Test (ADR-083) is the methodology's admissibility criterion for human-facing artifacts, encoded at methodology-principle level with four named exception conditions and the in-place-first default.
- Pattern A (audience-tagged sections) and Pattern B (companion file at predictable path `<artifact>.agents.md`) are the methodology's pattern catalog for agent-context content placement (ADR-084). Directory-level audience separation is rejected.
- The `.rdd/` infrastructure relocation (ADR-085, partially supersedes ADR-070) is in scope; the `/rdd-conform migrate-to-rdd` operation will land at BUILD; deferred-sweep rationale is recorded for system-design.md, ORIENTATION.md, field-guide.md.
- AI-as-orienter is not adopted as a methodology pattern (ADR-086); the operational-criterion problem remains unresolved; future-cycle conditions for revisiting are documented.
- Tightly-scoped prototyping is encoded as a research method alongside lit-review, search, and methods (ADR-087 §3 as reframed at this gate). The Beck-port reframe (§1) is a calibration, not a promotion or rejection. The cycle-as-instance reflection is encoded as a standing caveat (§4).
- ADR-088 and ADR-089 land the v0.8.3 amendments to ADR-064 and ADR-067 (compound check / Three-Tier Enforcement); ADR-090 documents the In-progress phase field role-shift.
- Domain model Amendment 22 has landed with the coordinated three-touch checklist (Compound Check + Three-Tier Enforcement + Harness Layer concept updates plus the ADR-085 supersession Amendment-Log entry).
- Behavior scenarios + preservation scenarios + Cycle 017 Acceptance Criteria Table are appended to scenarios.md. Interaction specifications are appended to interaction-specs.md.
- All argument-audit passes returned clean (pass 3 + pass 4 both CLEAN AUDIT). Conformance scan findings are scoped to BUILD and ARCHITECT for remediation; methodology-debt tracking lands in cycle-status.md.

**New commitments surfaced at this gate (sharper than upstream artifacts):**

- **Tightly-scoped prototyping is a research method, not a Beck-port amendment.** The framing positions prototyping in the same family as lit-review, literature search, and research-methods review — used where appropriate. The user's articulation makes the methodology's research-method toolkit expansion explicit rather than presenting it as a remediation for a structural deficit.
- **The trigger question for prototyping is interaction-grounding + possibility-space-pruning.** Not "is our research weak?" — "would interaction-grounding surface real additional questions or directions that lit-review and methods alone cannot reach?" or "is the cycle at risk of producing speculative claims that downstream phases will over-elaborate?"
- **Tightly-scoped prototyping is a counterforce against possibility-space explosion.** The held-open MODEL Amendment 21 future-cycle candidate (*"Does RDD over-engineer?"*) is partly addressable in-cycle by this mechanism. The future-cycle critique remains worth a dedicated cycle for the broader structural posture concern, but the in-cycle mechanism is now named.
- **Field evidence from the practitioner's other RDD project** (a sprawling YAGNI-territory implementation) is concrete grounding for the rationale that the agent did not have at drafting time. The connection between RDD's research front-loading and downstream over-elaboration is empirically observed by the practitioner, not theoretical.

**Open questions (the practitioner is holding these open going into architect):**

- The five Value Tensions T1–T5 from product discovery remain open as the methodology continues to operate (initial-handoff vs ongoing-reference; outcome test vs reading-cost test; cognitive vs non-cognitive admissibility; multi-item turn bundling vs upstream decomposition; AI-as-orienter vs AI-as-prosthetic — all carried in cycle-status.md).
- The Outcome Test invariant-placement question (ADR-083 §6) — held as a future-cycle scope; encoded at methodology-principle level for v1; invariant placement waits for either a structural anchor or a Harness-Layer mechanism.
- The cycle-as-instance reflection as a standing caveat (ADR-087 §4) — encoded; the broader question of whether it should be elevated above standing-caveat status into more formal scope-of-claim language is itself a future-cycle scope.
- The "does RDD over-engineer?" future-cycle critique (MODEL Amendment 21 + ADR-087 §3a) — partly addressable in-cycle via prototyping; the broader critique of RDD's structural posture remains worth a dedicated cycle.
- The framing audit's three findings (F-P2.1 ADR-083 bolt-on signal scope vs companion files; F-P2.2 ADR-086 final non-adoption framing tone; F-P3.1 ADR-084 naming convention novelty) — surfaced at this gate; not adopted as ADR amendments; available as user judgment for ARCHITECT, BUILD, or future cycles.
- The framing audit's three alternative framings (Alt A: Tier 1 Outcome Test now; Alt B: provisional naming convention pending ecosystem alignment; Alt C: Tier 1 spike-or-rejection record) — surfaced at this gate; not adopted; available as user judgment.
- Three unfeatured truths (Truth A: Ernst & Robillard scope qualification; Truth B: "threading is wrong in principle" alternative live but absent from ADRs; Truth C: ADR-083 exception conditions are agent-composed) — surfaced at this gate; held for the cycle's downstream awareness rather than immediate ADR amendments.

**Specific commitments carried forward to architect:**

- **System-design restructuring per essay 016 §6:** F-pattern orientation lead at top; companion file at `system-design.agents.md` (Pattern B per ADR-084); load-bearing diagram retained; Outcome Test (per ADR-083) applied to any candidate orientation artifact.
- **ORIENTATION.md regeneration:** add Zero-Prior-Familiarity Reader's reading path and the corpus map with audience and purpose annotations; Section 4's "process artifacts in `.rdd/`" sentence per ADR-085's Decision §7.
- **Five feed-forward signals from the susceptibility snapshot:** (A) ADR-083's exception conditions are provisional, not authoritatively closed — ARCHITECT should treat them as starting points; (B) ADR-084's ~50% Pattern A/B threshold carries agent-proposed status into the system-design restructuring decision; (C) conformance debt scope for ARCHITECT is clearly delineated from the conformance-scan-decide-017 report; (D) budget for re-audit after cross-ADR vocabulary edits in ARCHITECT; (E) maintain provenance-check practice for any ARCHITECT ADRs (the centered-vs-infrastructure framing's faithful attribution is a corpus-quality precondition).
- **Deferred sweeps from ADR-085, ADR-088, ADR-089** discharged at ARCHITECT regeneration where applicable (system-design.md and ORIENTATION.md); field-guide.md sweep deferred to BUILD; domain-model.md Amendment 22 already landed at this DECIDE phase.
- **`/rdd-research` skill-text edit at the research → discover gate** per ADR-087 §3's encoding (BUILD scope; the prototype-or-no-prototype decision is made in research, but the skill-text mechanic lands at BUILD).
- **`/rdd-conform migrate-to-rdd` subcommand** implementation per ADR-085 §4 (BUILD scope).
- **Hook script updates** to read `.rdd/` paths post-migration (BUILD scope; the v0.8.3 advisory disposition is already implemented per the conformance scan, so only path-substitution remains).

## Disposition of upstream Grounding Reframes at this boundary

- **RESEARCH-phase Grounding Reframe Target 1 (cognitive-economy constraint):** discharged at the discover → model gate. The bolt-on / felt-additional failure-mode signal sharpened essay 016 §4.5's reading-cost framing; ADR-083 encodes the Outcome Test with in-place-first default and the bolt-on signal as the methodology's admissibility criterion.
- **RESEARCH-phase Grounding Reframe Target 2 (Beck framing):** discharged at this gate. ADR-087 §1 calibrates the Beck port (useful conceptual frame, not load-bearing structural evidence); ADR-087 §3 (as reframed at this gate) positions tightly-scoped prototyping as a research method alongside lit-review, search, and methods — grounded in the practitioner's articulation of the rationale and connected to anti-elaboration mechanisms across phases.
- **No new Grounding Reframe targets surfaced at this gate.** The susceptibility snapshot returned no Grounding Reframe with five feed-forward signals to ARCHITECT (recorded above).
