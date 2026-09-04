# Gate Reflection: Cycle 020 discover → model

**Date:** 2026-09-03
**Phase boundary:** discover → model
**Cycle:** Corpus Topology and Agent-Navigable Compaction (Cycle 020)

**Note on authorship.** Per the practitioner's instruction at this gate, the agent performed the belief-mapping itself and proposed the commitment-gating split below as a default the practitioner can correct. Corrections, if any, are recorded at the end.

## Belief-mapping question composed for this gate

The pre-triage inversion in product-discovery.md was agent-authored, so it was put to the test:

> The new inversion proposes that the agent pre-triage findings so fewer reach you per loop. I wrote that one, not you, so it deserves a test. What would you need to believe for pre-triage to be the wrong move, and one of these to be right instead: findings arrive as defaults you can override rather than decisions you must make; adjudication happens once per phase instead of once per loop; or loops just terminate earlier?

## User's response

> I think pre-triage is important -- the belief inversion "what would you need to believe" type questions often get surfaced to me in these reflection time moments, but what I really need is for the agent to ask itself this question. Come to me with real pivot points. What would you need to believe to think pre-triage was wrong? Most often you can do this yourself and it yields something useful. The user here (or me in this case) is not going to really know the very fine-grained detail of the process being orchestrated. But they should understand product direction, their goal, the outcome they want.

Earlier in the same session, on the shape of the pain the cycle addresses:

> I think reading-load is the main thing. Process time is ok and looping is ok if it increases capability and drives results. However what tends to happen is that loops peel back more layers of the onion that need more adjudication by the reader. So it's exhausting.

## Pedagogical move selected

**Challenge**, then, at the practitioner's direction, the agent ran the belief-mapping itself. Result:

Pre-triage would be the wrong move if any of these held:

1. *The agent cannot reliably tell a pivot from a process detail.* Triage is content selection, and content selection is the sycophancy mechanism (Cheng et al. 2026; ADR-058). This does not make pre-triage wrong; it makes two constraints mandatory. The triage must be inspectable (what was resolved, what was carried, why), and the triage of framing-class findings should happen in an isolated context or be surfaced with the analysis done rather than silently resolved. The existing framing-audit-surfacing rule stays; what changes is that surfaced findings arrive with the belief-mapping already worked and a pivot extracted.
2. *The practitioner's understanding is built by adjudicating process detail.* The practitioner's testimony says otherwise. The agent first recorded this as a scope boundary on Invariant 0; the susceptibility snapshot flagged that as extrapolation, and on re-reading Invariant 0 (authority over what was built, for whom, why: design rationale, key decisions, vocabulary, user needs) the practitioner's statement is consistent with the invariant as written and inconsistent only with gate practice as applied. This is the one real pivot and is recorded below as open, pending the practitioner's ruling.
3. *Pivots cannot be identified without the practitioner.* The agent holds the telos (research log §Step 1.5), the product-discovery jobs, and the cycle's driving question. The criterion "does this change what gets built, for whom, or why" is applicable from those. Miscalibration is the risk; the inspectable triage log is the remedy.
4. *One of the alternatives is strictly better.* Defaults-with-override is a presentation form of pre-triage, not an alternative. Once-per-phase batching lowers interrupt frequency, not count. Earlier termination lowers count and capability together, which the practitioner rejected. They are complements; pre-triage plus defaults-with-override is the likely combined shape.

## Commitment gating outputs

**Settled premises (the practitioner is building on these going into MODEL):**
- C1, C2, C3, C6 from the RESEARCH gate carry unchanged. Substrate-and-surface separation plus complementary gate-conversation tooling is the cycle's direction.
- The pain is reading and adjudication load, not process time. Loops that build capability and drive results are welcome.
- Pre-triage of loop and audit findings by the agent is wanted. The agent runs belief-mapping on itself and brings the practitioner pivot points.
- Invariant 0 stands as written. Gate practice, not the invariant, is what recalibrates: the practitioner's epistemic act is about destination (what was built, for whom, why) and, when they care, route; the engine is the agent's, inspectably. No backward propagation.

**Open questions (the practitioner is holding these open going into MODEL):**
- Convergent vs. new-problem reading of the audience-bifurcation lineage (carried from RESEARCH; DECIDE engages both).
- Kitchen-sink caveat on the Calibration-with-Graduation-Trigger Pattern and, by extension, the substrate-and-surface architecture (C7; multi-cycle observation).
- How pre-triage preserves architectural isolation: triage in an isolated context, or in the orchestrator with an inspectable log. Design question for DECIDE.
- ~~The gate's pivot, pending practitioner ruling~~ **Ruled: narrower reading (see corrections below).** The practitioner said the user "should understand product direction, their goal, the outcome they want" and will not know "the very fine-grained detail of the process being orchestrated." Narrower reading (agent recommends): gate practice under Invariants 1 and 2 has drifted toward process-level questions Invariant 0 never required; the fix is in question composition and pre-triage; no invariant amendment. Wider reading: Invariant 0 itself needs a boundary excluding process-level warrant chains; backward propagation applies (MODEL Step 3.5 detects; DECIDE Step 3.7 executes).

**Specific commitments carried forward to MODEL:**
- Candidate concepts: substrate, surface, adjudication load, pivot point, pre-triage. MODEL decides which warrant entries.
- Eight product-vocabulary rows added this session are the Product Origin anchors: five verbatim or near-verbatim user language; three carry the practitioner's underlying phrase as the term with the research coinage ("substrate"/"surface"; Shneiderman's mantra; ADR-CANDIDATE-020.5) in Notes.
- The gate-practice vs. Invariant 0 pivot is flagged for MODEL Step 3.5; which branch depends on the practitioner's ruling.
- The susceptibility snapshot for this boundary was dispatched with the FF1 pattern (practitioner-originated framing at the gate, per ADR-098) named explicitly, since the practitioner's gate response reframes the gate protocol itself.

## Susceptibility snapshot findings and orchestrator triage

The snapshot (`.rdd/audits/susceptibility-snapshot-020-discover.md`) recommended a Grounding Reframe with three actions. Triage record:

| Finding | Disposition | What was done |
|---|---|---|
| Solo Developer job carried agent mechanism vocabulary ("bounded or pre-triaged") in first person | Resolved by agent | Job restored to the practitioner's verbatim words; mechanism moved to the value tension and attributed to the agent |
| Pre-triage in three artifact locations; alternatives (overridable defaults, per-phase batching, earlier termination) absent | Resolved by agent | All four recorded in the loop-depth tension as agent-proposed complements with the comparison reasoning; practitioner's post-question endorsement of pre-triage recorded as such |
| Three vocabulary rows presented research terms under a Solo Developer label | Resolved by agent | Rows rewritten with the practitioner's underlying phrase as the term ("a graph behind a human-friendly format"; "a high-level picture that then leads to sub-system pictures"; "plain language instead of cross-referential subsection-numbering") and the research coinage in Notes; "real pivot points" added |
| Invariant 0 scoping is the agent's extrapolation | Brought to practitioner as the gate's pivot | Downgraded from settled to open; both readings written out with the agent's recommendation |
| Malformed `expected_path` entries in dispatch-log from RESEARCH session | Carried forward | Hook-side defect; noted in cycle-status for BUILD |

## Practitioner corrections to the proposed split

The practitioner asked for the invariant text, read Invariants 0 through 3, and ruled by metaphor:

> A metaphor: RDD is the car. Here, we are making RDD, so it makes sense that we're fussing over how the car is built and we want to know how it works. But when we use RDD for another task we are driving a car from point A to point B. Then to C and beyond. The car helps us because it has safety features, it handles well. Sometimes we accelerate, sometimes we go slow. All drives are different. But in each case we don't need to understand the internal machinations of the car. We need to decide where we're going. Sometimes we care if we take the highway or the scenic route, sometimes we don't. Sometimes we only care about the destination. But sometimes we learn something new that needs to change the destination. Make sense?

**Ruling recorded:** narrower reading. Invariant 0 is unchanged. The metaphor adds two things the agent had not separated:

1. **Building vs. driving.** This project is reflexive (building the car), so process-level fussing is legitimate here in a way it is not on any other project. The practitioner's non-use complaint concerns driving. The amendment's target is driving mode; the reflexive project may still warrant more engine inspection than the amendment would give a driver.
2. **A three-level pivot criterion.** Destination (product direction, goal, outcome; Invariant 0's own list) is always the driver's and is always surfaced. Route (highway vs. scenic) is sometimes cared about: present as overridable default, surface when the driver has signaled interest. Engine (the process being orchestrated) is the agent's, inspectable but not adjudicated by the driver. A pivot point is a finding that changes the destination.
