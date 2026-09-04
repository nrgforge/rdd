# Gate Reflection: Cycle 020 model → decide

**Date:** 2026-09-03
**Phase boundary:** model → decide
**Cycle:** Corpus Topology and Agent-Navigable Compaction (Cycle 020)

**Operating context.** Per the practitioner's DISCOVER-gate ruling (car metaphor; Invariant 0 unchanged; gate practice recalibrated), MODEL ran in driving mode: the agent drafted, ran warrant elicitation on its own additions, presented one screen, and brought one destination-level question. Route choices were presented as overridable defaults.

## Belief-mapping question composed for this gate

Destination-level, composed against the six ADR candidates the cycle now carries:

> This cycle now carries six ADR candidates: separation, authority, note discipline, per-type schemas, gate tooling, pre-triage. That's the same shape Cycle 019 had, five ADRs applying one pattern, and it's what you called middle-of-the-road. The destination question for DECIDE is which of these is the one bold choice and which are its substrate entries or deferred. My read: separation plus pre-triage are the destination, the rest are route. Does that match where you want to end up, or is pre-triage the whole trip and the substrate a scenic detour?

## User's response

> What is "separation" here?

The agent explained substrate-and-surface separation concretely (one file doing two jobs today; two layers with one source of truth; the spike's result and its four costs; "the corpus you don't have to read, backed by the corpus the agent needs"; pre-triage as a second, different trip). Then:

> K - makes sense

## Pedagogical move selected

**Teach**, prompted by the practitioner's question. The destination split (separation plus pre-triage as destination; authority, note discipline, per-type schemas, and gate tooling as route) stands as the agent's default by non-objection. It is recorded as overridable, not as the practitioner's stated position.

## Agent-side warrant elicitation (performed before presenting)

For each consequential addition: what would need to be true for a different conceptualization to be right?

| Addition | Alternative | Would need to believe | Disposition |
|---|---|---|---|
| Substrate and Surface View as two concepts | One "corpus record" concept with multiple renderings | That the human-facing view has no design constraints of its own | Rejected: focus+context at drill-in and incompleteness signaling are independent constraints (Cockburn et al. 2008; Essay-Outline C3) |
| Adjudication Load distinct from Corpus Overwhelm / Cognitive Load | It is just cognitive load | That per-item cost and item count respond to the same remedy | Rejected: gate tooling and Surface Views reduce cost, not count (Grounding Loop 4b; resumption testimony) |
| Pivot Point defined by Invariant 0's list | Pivot = anything the practitioner cares about, route included | That route choices should surface by default | Rejected: "sometimes we care if we take the highway or the scenic route, sometimes we don't" |
| Cycle Posture as a concept | A calibration axis on ADR-091 auto/gated or on Scoped Cycle | That the distinction changes only BUILD's mode | Added, then demoted to an open question after the snapshot: one metaphor at one gate is thin warrant for a binding term; the design constraint (mechanisms specified for driving) stands without the concept |
| Calibration-with-Graduation-Trigger Pattern as a concept | Descriptive label only, no entry | That DECIDE will not reference it | Rejected: C1 compression names it |

Limitation: this check was run by the author of the additions in the author's own context. The susceptibility snapshot at this boundary is the isolated check.

## Commitment gating outputs

**Settled premises (the practitioner is building on these going into DECIDE):**
- Invariant 0 unchanged (DISCOVER ruling). The vocabulary added in MODEL is binding for DECIDE.
- Substrate-and-surface separation is the cycle's original destination: the corpus the practitioner does not have to read, backed by the corpus the agent needs. The practitioner confirmed understanding of the term after asking for it.
- Pre-triage is a second destination, addressing adjudication count, not reading cost.
- Cycle 020 mechanisms are specified for a practitioner driving RDD on a project (the practitioner's metaphor); the reflexive project's tolerance for engine inspection is not the design target. "Cycle Posture" is not a concept; the distinction is an open question.

**Open questions (the practitioner is holding these open going into DECIDE):**
- The destination split. Agent's default, corrected after the snapshot: separation (020.1) and pre-triage (020.6) are destination; note discipline (020.3), per-type schemas (020.4), and gate tooling (020.5) are route; **authority resolution (020.2) is neither**: the Essay-Outline marks it "not defaultable" (C4 constraint 4), so it must be decided explicitly at DECIDE with both options developed and the practitioner ruling. The practitioner has not stated a position on the split. DECIDE's Empirical-Grounding Filter applies to all six.
- Authority resolution (020.2); per-type schemas (020.4); convergent vs. new-problem reading (scoping 020.1); where pre-triage runs (020.6); whether the driving/building distinction needs a name at all, and if so whether as a concept or a calibration axis.
- Whether Pivot Point's criterion (Invariant 0's list) is sufficient or needs a route-level rule.

**Specific commitments carried forward to DECIDE:**
- ADR-CANDIDATEs 020.1 through 020.6 use the MODEL vocabulary: Substrate, Surface View, Substrate-and-Surface Separation, Typed Link, Note Discipline, Corpus Overwhelm, Adjudication Load, Pivot Point, Calibration-with-Graduation-Trigger Pattern; actions Pre-Triage, Derive Surface View, Author Substrate Record.
- DECIDE applies ADR-097's filter with the practitioner's "simplest useful thing" criterion, and should produce the one bold choice plus substrate entries, not six peers. The cycle's own diagnosis applies to its own ADR set.
- Pre-triage applies to DECIDE's audit output: the argument audit's findings on the ADRs reach the practitioner as pivots with the agent's belief-mapping done, framing-class findings surfaced with analysis, not raw.

## Susceptibility snapshot findings and orchestrator triage

The snapshot (`.rdd/audits/susceptibility-snapshot-020-model.md`) recommended a Grounding Reframe with three actions. Triage record:

| Finding | Disposition | What was done |
|---|---|---|
| Cycle Posture (Driving / Building) entered the domain model as a concept on one metaphor at one gate; the agent's own belief-mapping row recorded the thin basis and resolved to "held open" instead of a check-in | Resolved by agent | Concept row removed; relationship and Related Terms references removed; held as an open question with the candidates named; Amendment #29 corrected to nine concepts with the demotion recorded. The design constraint (specify for driving) stands without the concept |
| Destination/route split filed Authority Resolution (020.2) as route (overridable default) while Essay-Outline C4 marks it "not defaultable" | Resolved by agent | Reclassified: 020.2 is neither destination nor route; it must be decided explicitly at DECIDE with both options developed, and the practitioner rules. Recorded in the open questions above and in cycle-status |
| Driving mode extended into vocabulary content, which Invariant 0 reserves to the practitioner (explain the domain vocabulary); the practitioner engaged with one term of ten | Brought to practitioner as the gate's pivot | The nine concepts and three actions presented one line each in the practitioner's terms, with the invitation to rename, drop, or correct. The snapshot's suggested standing practice (a one-line "rejected and why" per consequential concept) is recorded as a candidate for DECIDE's pre-triage ADR |

## Practitioner response to the reframe

Presented with the nine concepts and three actions one line each, and invited to rename, drop, or restate:

> Those are all reasonable terms

**Recorded:** vocabulary confirmed as binding for DECIDE. Cycle Posture demotion and Authority Resolution reclassification stand as orchestrator corrections, not objected to.
