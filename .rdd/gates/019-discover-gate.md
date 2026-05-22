# Gate Reflection: Does RDD Over-Engineer? DISCOVER → MODEL

**Date:** 2026-05-20
**Phase boundary:** DISCOVER → MODEL
**Cycle:** 019 — Does RDD Over-Engineer?

## Belief-mapping question composed for this gate

> The artifact crystallizes ADR-019.4 as a Tier-2 methodology-principle level vocabulary amendment with felt-judgment as the load-bearing mechanism: the practitioner applies "is this empirically grounded?" and "is this the simplest useful thing consistent with research?" at ADR-drafting time. The susceptibility snapshot's F-R4-P3-1 finding names the structural limit: vocabulary amendments do not constrain practitioners who fail to apply the felt-trigger — *"if the practitioner is the failure mode, Tier-2 addresses the methodology without addressing the behavior."* The cross-project evidence base for this scope choice is genuinely thin (2 kitchen-sink instances across ~26 sampled ADRs from three external projects). The Tier-2 scope was downgraded from Skill-Structure Layer at R3 specifically because proposing heavy structural enforcement from thin evidence would itself instantiate the C7 pattern.
>
> **Belief-mapping question:** *What would have to be true for the Tier-2 vocabulary amendment to be insufficient — for the felt-judgment path to fail in practice and structural enforcement to become required?*
>
> Concretely: what would you need to observe in the next 2–4 cycles applying ADR-019.4 to conclude that the vocabulary (*"conditional acceptance," `adr-deferred-`*, the felt-trigger questions) is operating nominally but the kitchen-sink failure mode persists? What's the signal that would shift you toward graduating 019.4 to Skill-Structure Layer enforcement?

The question was composed against specific Essay-Outline content (C7 + ADR-019.4 Tier-2 scope choice + the R3 framing-finding rationale) and against the prior susceptibility snapshot's F-R4-P3-1 finding (Feed-Forward 4). It referenced artifact content directly, not user engagement.

## User's response

> I think our research into our other methodologies showed that RDD doesn't do kitchen-sink implementations for the most part unless research spirals, and the practitioner can have a hand. I think being aware in the framework can be helpful but likely we don't need a structural bulwark at this stage based on the evidence from what the investigation shows.

Two earlier substantive gate-conversation responses were also load-bearing for the DISCOVER phase and are recorded here for the commitment-gating record:

**On Grounding Reframe Target 1 (calibration vs. fixed-cost framing), DISCOVER opening:**

> The research is the front-loaded part of the process where the least certainty lives, so I accept that as the most open-ended space. But I do want to be able to drill down to the most important work to deliver in a cycle versus building the most comprehensive system possible. The goal (and this is also task-dependent) should be to deliver something that satisfies what we set out to do and not add scope unless we determine that scope is exciting. But I don't want RDD to add scope when we don't need it.

**On Grounding Reframe Target 2 (DECIDE vs PLAY as primary remedy location), DISCOVER opening:**

> I think Decide can be primary.

## Pedagogical move selected

**Challenge** via belief-mapping (from the Question Toolkit's primary form for the Inversion Principle). The question referenced ADR-019.4's Tier-2 scope choice and the F-R4-P3-1 structural limit directly — not user engagement.

The belief-mapping question's purpose was to surface what the implicit graduation trigger would be: the methodology cannot verify in advance whether the Tier-2 vocabulary path will work, so the question makes the observable that would trigger graduation legible rather than possible-but-unspecified. The user's response endorsed Tier-2 on cross-project-evidence grounds and asserted practitioner agency as the load-bearing element, locating the kitchen-sink failure mode at research spirals specifically.

The two Grounding Reframe responses at the DISCOVER opening (Target 1 and Target 2) were the upstream gate exchanges that set up the discover-phase artifact's value tensions, vocabulary, and inversions. Target 1's response introduced a new framing ("scope-discipline at delivery") that was encoded into the artifact across jobs, value tensions, and vocabulary; Target 2's response was brief and was encoded as resolved.

## Commitment gating outputs

**Settled premises (the user is building on these going into MODEL):**

- ADR-019.4 at Tier-2 methodology-principle level (felt-judgment-anchored vocabulary; not Skill-Structure Layer enforcement) is the operating scope for Cycle 019.
- Practitioner agency is the load-bearing element of the empirical-grounding criterion at DECIDE — the vocabulary scaffolds the felt-trigger; the practitioner applies it.
- The calibration frame holds as the operating frame for the four in-cycle ADR candidates. The live dimension within it is scope-discipline at DECIDE, not structural entry-cost.
- DECIDE is the primary remedy location for the C7 mechanism. PLAY-as-filter is the alternative the practitioner answered "not load-bearing" — recorded as resolved in the discover artifact but flagged in the susceptibility snapshot for MODEL re-examination.
- The four in-cycle ADR candidates (019.1 audit round-count; 019.2 Agent Outcome Test; 019.3 RESEARCH patch-switching; 019.4 empirical-grounding criterion at DECIDE) are the principal Cycle 019 outputs. Layer assignments: 019.1 and 019.3 Skill-Structure Layer; 019.2 and 019.4 Tier-2.
- Cycle character (auto-mode BUILD candidate): mechanical work, moderate stakes, catching-dominant stewardship locality — to be confirmed at BUILD entry.
- The nuance-preservation criterion (W7.4 elevation) is recorded as a methodology commitment, not as independent empirical support for the DECIDE-as-remedy-location claim.
- Kitchen-sink failure mode, where observed, is localized to research-driven cascades. YAGNI is structural across the three external RDD applications (zani, llm-orc, plexus).
- The implicit graduation trigger for ADR-019.4: multi-cycle evidence that the vocabulary is nominally in place but the kitchen-sink failure mode persists — observable through future Loop 6-style cross-project assessments after 2–4 cycles have applied 019.4.

**Open questions (the user is holding these open going into MODEL):**

- **(Grounding Reframe Target 1 — carry-forward from this snapshot)** The fixed-cost-per-cycle framing was not directly addressed by the scope-discipline answer; the scope-discipline framing operates within the calibration frame but is compatible with both calibration-at-DECIDE and calibration-at-entry. The entry-side question — *some cycles shouldn't use full-RDD at all* — is live or foreclosed pending the practitioner's explicit answer at MODEL opening. If live, "entry-side calibration gap" belongs in the domain model as a named concept distinct from the four in-cycle ADRs.
- **(Grounding Reframe Target 2 — carry-forward from this snapshot)** The DECIDE-vs-PLAY resolution was reached on a brief response without the strongest PLAY evidence (llm-orc Cycle 5 pulling features back, W7.2) being surfaced as counterweight. Before MODEL encodes DECIDE-primacy as domain structure, the PLAY evidence should be given a fair hearing. The question is not whether to change the answer but whether the answer survives comparative examination.
- **(Grounding Reframe Target 3 — carry-forward from this snapshot)** "Nuance preservation (commitment)" is encoded as a Product Vocabulary entry. At MODEL, it should carry constraint-only framing — a criterion any remedy must satisfy — not become a domain concept that effectively functions as evidence for the DECIDE-layer remedy.
- The three-application F-P2 pattern named by the discover susceptibility snapshot (R3 framing downgrade; gate response on Target 1; discover-gate Tier-2 endorsement — all three scope-limiting choices in a cycle investigating whether RDD over-engineers) is live as feed-forward to DECIDE. The aggregate pattern is the question DECIDE should hold explicitly, not a finding the cycle resolves.
- The practitioner-originated framing audit gap (methodology-level Feed-Forward 1 from the discover snapshot) — the methodology's audit machinery covers agent-produced claims and phase-boundary transitions but not practitioner-introduced framings at gate responses — is a candidate future-cycle methodology amendment.
- Distribution-of-cycle-types limitation (carried from RESEARCH §9): conclusions for the routine-feature-extension-cycle quadrant are not established by Cycle 019's evidence. If RDD is in practice applied predominantly to routine cycles at full machinery weight, the entry-side calibration question (held open above) becomes the load-bearing remedy site, not the four in-cycle 019.x candidates.
- Multi-cycle replication of W7.3's single-cycle anchor (auto-mode BUILD did not cause kitchen-sink in llm-orc Cycle 6 alone) — held for future cycles producing built v1 prototypes in auto mode.

**Specific commitments carried forward to MODEL:**

1. **Three Grounding Reframe targets surface at MODEL opening, BEFORE domain-vocabulary extraction begins.** Practitioner answers may shift what gets extracted as domain vocabulary (especially around entry-side calibration as a candidate domain concept, PLAY-as-remedy-location alternative weighting, and nuance-preservation as constraint-vs-evidence framing).
2. **The four in-cycle ADR candidates** with their layer assignments are settled. MODEL's domain vocabulary must support the four ADRs' drafting at DECIDE: "Calibration move," "Empirical-grounding filter," "Kitchen-sink failure mode," "Convergence-saturation signal," "Patch-switching criterion," "Agent Outcome Test," "Conditional acceptance," "`adr-deferred-` filename pattern," "Minimum useful scope," "Scope-discipline at DECIDE."
3. **Methodology voice vs. user voice in value tensions (FF4):** MODEL should treat the Cycle 019 value tension entries (ADR-019.1 through ADR-019.4, scope-of-claim entries, methodology-level observation entries) as research-forwarding material when extracting domain concepts — extract from user-voice language where present, not from research-forwarding notes.
4. **Entry-site question for domain model (FF3):** MODEL decides whether "entry-side calibration gap" belongs in *this cycle's* domain model as a named concept versus remaining only in domain-model.md:926 as an open question. The decision should be explicit, not implicit.
5. **W7.4 constraint scope (Target 3):** if "Nuance preservation" enters the domain model, it carries constraint-only framing ("any remedy must satisfy this") and explicitly does not function as evidence for any specific remedy site.
6. **Three-application F-P2 pattern (FF2):** DECIDE inherits the question of whether the systematic Tier-2 assignment at the two most consequential 019.x candidates is coherent application of one principle or a content-selection pattern producing systematically less methodology-overhead at every consequential scope choice.
7. **Reflexivity caveat carried forward:** Cycle 019's findings are research-not-validation; Loop 6 cross-project evidence is agent-conducted and carries agent-reading uncertainty. The methodology's compound defense at phase boundaries (manifest check + susceptibility snapshot + belief-mapping) is the principal mechanism by which reflexive findings get cross-examined.
