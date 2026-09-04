# Gate Reflection: Cycle 020 decide → architect

**Date:** 2026-09-03
**Phase boundary:** decide → architect
**Cycle:** Corpus Topology and Agent-Navigable Compaction (Cycle 020)

**Operating context.** Driving mode per the practitioner's DISCOVER-gate instruction and the MODEL-gate non-objection. DECIDE ran auto-mode drafting, R1 argument and framing audit, orchestrator pre-triage of the audit per the draft ADR-100 rule, one-screen presentation with one pivot and two overridable defaults, R2 re-audit dispatched on the revised set before the practitioner's ruling arrived.

## Belief-mapping question composed for this gate

Rebuttal elicitation was run by the agent on each ADR's rejected alternatives (see the ADRs' Rejected alternatives sections, R1 and R2 audits). The practitioner-facing pivot was the authority sub-decision, put with all four options developed one line each and the agent's recommendation:

> Single-source derivation needs a single source. A. Records canonical everywhere, migrate all 98 legacy ADRs now. B. Prose ADRs canonical forever, records derived; the spike ran this and it collapsed. C (recommended). Records canonical from now on; the markdown ADR becomes a generated view; legacy ADRs stay as they are, represented by a compressed index record that only changes when their status does. D. Prose for history, records for current state. Which one? If C, you'll never hand-write another 400-line ADR; you'll fill a record and read the view.

Two framing findings from the R1 audit were surfaced whole, per rule 4, with defaults:

1. The agent extended the car metaphor into a design rule and ran MODEL under it before the rule existed, on a reflexive cycle whose own DISCOVER note said it might warrant more engine visibility. Default: keep driving mode for ARCHITECT and BUILD.
2. One ADR or three. The audit noted the practitioner's own words point at one. Default: two (architecture with authority nested; pre-triage separate because its evidence is thinner and its lifecycle different).

## User's response

> C

Neither default was overridden.

## Pedagogical move selected

**Challenge** (agent-side rebuttal elicitation on rejected alternatives, per ADR-100 rule 3), with the surviving pivot put to the practitioner as a one-line ruling. Framing-class findings surfaced whole.

## Argument-audit findings and orchestrator triage (R1)

The R1 audit (`.rdd/audits/argument-audit-decide-020.md`) returned 2 argument P1, 5 P2, 3 P3; 2 framing P1, 1 framing P2. Triage record:

| Finding | Disposition | What was done |
|---|---|---|
| A-P1-1: ADR-099 adopts the alternative reading but keeps the convergent reading's scope and tier | Resolved | §Scope and tier separates scope (methodology-wide on C2, per Essay-Outline §1 META) from tier (Tier-2 architectural commitment now; Skill-Structure is the graduation target) and states Conditional Acceptance as a third axis |
| A-P1-2: pre-triage ADR labels two in-cycle gates as ADR-097 path 4 and takes unconditional Acceptance on thinner evidence than its sibling | Resolved | Status to Conditional Acceptance; grounding path 2 only; path 4 disclaimed; the in-cycle record stated in both directions |
| A-P2-1: Skill-Structure now vs. Harness at 2–4 cycles, unreconciled | Resolved | Cost/risk asymmetry stated: the record is the mechanism; hook enforcement is the higher-risk commitment |
| A-P2-2: constraints 2 and 4 lack rejected alternatives; constraint 5 is a placeholder | Resolved | Each constraint carries its rejected alternative and a "considered and rejected: separate ADR" note; constraint 5 references §Authority |
| A-P2-3: option C's legacy index reintroduces interpretive re-encoding | Resolved | ADR-074 immutability stated as the reason it does not; one-time ~98-record authoring named as a constraint-6 instance |
| A-P2-4: pre-triage ADR bundles two remedies mapped to two domain concepts | Resolved, route default recorded | Rule-to-concept mapping stated in both ADRs; split-into-two recorded as ADR-100 rejected alternative H |
| A-P2-5: pivot criterion unconfirmed yet gatekeeping | Resolved in artifact; **not surfaced** (the snapshot caught the table claiming otherwise); surfaced at the reframe below | Tiering labeled as the practitioner's metaphor; Invariant-0 mapping labeled as the agent's gloss. The first version of this row said the gloss was "put to the practitioner in the presentation." It was not. Corrected 2026-09-03 on the decide snapshot's finding |
| A-P3-1: corpus-wide "Proposed operating as accepted" status fields (ADR-058, 061, 074) | Carried forward | `/rdd-conform` item in cycle-status; ADR-074's header now discloses it |
| A-P3-2: option D thin | Resolved | Developed at comparable depth |
| A-P3-3: no canonical path for non-gate triage records | Resolved | Appended to the producing artifact under "Findings and orchestrator triage" |
| F-P1-a: driving posture agent-extended; MODEL ran reduced-visibility pre-ratification on a reflexive cycle; evidence cited one-sidedly | Surfaced whole; default offered | ADR-100 §Posture states what this cycle did; the practitioner's DISCOVER instruction treated as functional opt-in; posture for the rest of the cycle put to the practitioner. Not overridden: driving continues |
| F-P1-b: pre-triage ADR has no RESEARCH trail yet stronger status | Resolved in artifact; **not surfaced** (rule 4 violated on its first application; the snapshot caught it); surfaced at the reframe below | Conditional status; "Evidentiary character" paragraph; named grounding action (management by exception; escalation policies in human-automation teaming); rejected alternative I records adr-deferred-. The first version of this row said "Resolved and surfaced"; the presentation did not mention it |
| F-P2: one-ADR alternative never presented | Surfaced whole; default offered | Authority folded into ADR-099 as a nested sub-decision; ADR-099 rejected alternative H explains two-not-one; presented as a default. Not overridden: two ADRs |

## Commitment gating outputs

**Settled premises (the practitioner is building on these going into ARCHITECT):**
- ADR-099: Substrate-and-Surface Separation, methodology-wide in scope, Tier-2 architectural commitment now, Conditional Acceptance pending corpus-scale BUILD; six binding constraints each with its rejected alternative.
- ADR-099 §Authority: option C. Records canonical for new units; legacy units canonical in their files, indexed. ADR-074 updated accordingly.
- ADR-100: pre-triage and plain-language presentation at practitioner-facing moments; Conditional Acceptance; the triage record is the mechanism; the isolated snapshot reads it.
- Two ADRs, not one or three. *(Settled by non-objection to a stated default, not by an explicit ruling; per R2 framing P2 this is recorded as weaker than the authority ruling.)*
- Driving mode continues for ARCHITECT and BUILD of this cycle. *(Settled by non-objection to a stated default; same qualification.)*
- (Removed 2026-09-03: an earlier version of this list claimed the pivot-criterion gloss had been put to the practitioner. It had not. It is put at the reframe below.)

**Open questions (the practitioner is holding these open going into ARCHITECT):**
- Record format and which record types get schemas in this cycle (ADR-099 constraint 3; C6).
- Where the Substrate lives (centered under `docs/` or infrastructure under `.rdd/`, per ADR-085 categories) and whether the artifact hierarchy gains a fourth layer.
- The one-time cost of ~98 legacy index records (constraint 6); BUILD measures.
- ADR-100's named grounding action (targeted lit-review on triage and escalation) and when it runs.
- Convergent vs. new-problem reading remains the held caveat; ADR-099 proceeded under the alternative reading with tier narrowed.

**Specific commitments carried forward to ARCHITECT:**
- System design gains: the Substrate as an artifact category with per-type schemas; the derivation tool as a toolchain module; the triage record as a required section of the gate note; the snapshot brief amendment.
- Downstream sweep for ADR-056, ADR-066, ADR-074 updates (system-design, ORIENTATION, field-guide) deferred to BUILD; ARCHITECT notes where the sweep will land.
- Scenarios for ADR-099 (including §Authority, option C) and ADR-100 are the behavioral contract; the Cycle 020 Acceptance Criteria Table has two layer-match "no" rows for BUILD Step 5.5 and PLAY.

## Susceptibility snapshot findings and orchestrator triage

The snapshot (`.rdd/audits/susceptibility-snapshot-020-decide.md`) recommended a Grounding Reframe. Triage record:

| Finding | Disposition | What was done |
|---|---|---|
| Triage table claimed A-P2-5 (pivot-criterion gloss) was put to the practitioner; the presentation contains no such ask | Pivot (the record was wrong) | Row and settled-premises entry corrected above; the gloss put to the practitioner at the reframe as a default with override |
| F-P1-b (no RESEARCH trail behind ADR-100) dispositioned "Resolved and surfaced" but absent from the presentation; ADR-100 rule 4 violated on first application | Pivot (rule violation) | Row corrected; finding surfaced at the reframe with the ship-Conditional vs. hold-for-research choice; recorded in ADR-100 as in-cycle harm-direction evidence at the DECIDE boundary (edit queued with R2 integration) |
| "C" after a one-screen recommendation with a closing benefit line may not be earned confidence for a choice the research marked "not defaultable" | Pivot | The strongest case for option B put to the practitioner as a belief-mapping question at the reframe |
| Engagement trajectory declining across three gates (metaphor → "reasonable terms" → "C") while the mechanism producing that shape is being ratified on the first two boundaries as evidence | Surfaced | Named to the practitioner; a natural break point offered before ARCHITECT |
| Provenance-check and drafting-time-synthesis sections present and substantive in both ADRs; most R1 repairs are real | No action | Noted |

## Practitioner response to the reframe

To the belief-mapping test of option C (the strongest case for B being that prose authoring forces the practitioner's analytical engagement):

> Re: your test -- what would you think if I told you that I hadn't written a single ADR? They've all been composed by the agents in-session?

**Recorded:** B's strongest merit does not apply to this corpus; the engagement prose was supposed to force was the agent's, and a required field preserves it. C is settled on the practitioner's own fact, not on the agent's recommendation. The fact is added to ADR-099 §Authority option B.

**Agent's reading, presented to the practitioner and not confirmed (R3 framing P1):** the fact also bears on the engagement-trajectory observation, since the practitioner's contribution to decision records has always been the ruling, not authorship. The first version of this paragraph recorded that reading as if it closed the snapshot's earned-confidence and declining-engagement findings. It does not. For the authority ruling, what the record shows is that a belief-mapping question was put ("what would you need to believe for B to be right?") and the practitioner answered it substantively, with a fact that removes B's premise. By the orchestrator's own criterion (the response to a belief-mapping question is the test of earned confidence; substantive engagement with the alternative is what passes it), the test was administered and engaged for that ruling. The fact itself does not establish adequacy under Invariant 1. What can establish it is the substantive engagement with the alternative, and whether that engagement was sufficient is for the next boundary's evaluator to judge, not for this note to declare. The three-gate trend question stays open and is carried to the decide → architect snapshot's successor at the ARCHITECT boundary. The practitioner was told the reading in the presentation ("the design working, not fatigue. Fatigue is still possible") and did not rule on it.

The two defaults (pivot-criterion gloss; ship ADR-100 Conditional with the lit-review as debt) were not overridden at the time of recording.

Practitioner's framing of the direction, added after the authorship exchange:

> Right, RDD as I see it evolving here is driving a rigorous process under the hood (to continue the car metaphor). Maybe it's more like a F350 or something...

**Recorded** as the practitioner's statement of product direction for the cycle's two ADRs: the rigor stays; it moves under the hood. Added to the Solo Developer mental model in product-discovery.

## R2 and R3 audits

R2 (`.rdd/audits/argument-audit-decide-020-r2.md`): all R1 findings RESOLVED (A-P3-1 partially; ADR-058/061 status fields to `/rdd-conform`). R2 read the post-ruling files (the ruling landed before R2 opened them) and said so. New: 0 P1, 3 P2, 1 framing P2; NOT converged. Triage: nested sub-decision status pattern defined in ADR-099 §Authority and pointed to from the ADR-074 header; the ADR-074 sweep-deferral argument stated in ADR-099 (creation of content, not correction of stale text; drift window empty until BUILD); ADR-100's trigger now counts cycles, with Cycle 020 as cycle one in both directions; the two non-objection defaults marked as weaker than the ruling in the settled list above. Also integrated: the conformance scan's tier tension (ADR-100 is Tier 2 in practice until BUILD writes the step) and the decide snapshot's rule-4 violation as third-boundary harm evidence. R3 dispatched on the revised set.

R3 (`.rdd/audits/argument-audit-decide-020-r3.md`): all R2 findings RESOLVED. New: 1 argument P1 (ADR-099 used Invariant 3 as if it established the ruling's adequacy under Invariant 1; ADR-100 omitted the authorship fact), 1 framing P1 (this gate note's "Recorded" paragraph used the fact to close two open snapshot findings without putting the reframe back), 1 argument P2 (ADR-100 alt D and provenance still said two boundaries), 1 framing P2 (audit-substance claim unscoped), 1 P3 (domain-model actor). NOT converged. Triage: all five repaired in place (ADR-099 option B scoped; ADR-100 Context, alt D, provenance updated to three boundaries with the third named as D's strongest evidence; domain-model actor corrected; this note's reframe paragraph rewritten as agent's reading, presented, not confirmed, with the trend question carried open). R4 dispatched as a narrow verification round.

R4 (`.rdd/audits/argument-audit-decide-020-r4.md`): R3 findings 2 RESOLVED, 3 PARTIALLY RESOLVED. New: 1 framing P1 (this note's "earned-confidence test is closed... on the practitioner's fact" restated the non-sequitur in narrower form), 1 P3 (two leftover "two boundaries" mentions in ADR-100). NOT converged; R5 warranted per ADR-094. Triage: the earned-confidence sentence rewritten to rest on the belief-mapping question having been answered substantively (the orchestrator's stated criterion), not on the fact; the two count mentions corrected. R5 dispatched as a narrow verification round.

R5 (`.rdd/audits/argument-audit-decide-020-r5.md`): both R4 findings RESOLVED; one optional P3 (elliptical phrase, fixed above). **Convergence-Saturation Signal TRIGGERED** (P1 = 0, P2-new = 0, no new framings). The DECIDE audit sequence closes at R5, the ADR-094 ceiling.
