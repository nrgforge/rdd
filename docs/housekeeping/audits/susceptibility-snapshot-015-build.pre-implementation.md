# Susceptibility Snapshot

**Phase evaluated:** DECIDE → BUILD gate (Cycle 015, mini-cycle)
**Artifact produced:** Gate reflection note (`docs/housekeeping/gates/015-decide-gate.md`); cycle-status.md updated with DECIDE Gate Decision section and Feed-Forward Signals from DECIDE gate; Phase field held at `decide` pending first BUILD artifact
**Date:** 2026-04-14

---

## Observed Signals

| Signal | Strength | Trajectory | Notes |
|--------|----------|------------|-------|
| Assertion density | Ambiguous | Stable | The gate conversation produced one concrete user assertion: option 3 ("let's move into option 3 from the gate"). No new design claims were introduced. The cycle-status and gate note are recording artifacts, not assertion artifacts. Stable from prior snapshot — no new design claims embedded. |
| Solution-space narrowing | Clear (ADR-072) | Stable, not resolved | The prior snapshot's narrowing finding is unchanged. Option 3 explicitly preserves the narrowing rather than resolving it: the hook-side alternative is recorded as un-examined, not examined-and-rejected. The cycle-status DECIDE Gate Decision section is accurate about this. No new narrowing introduced at the gate; the existing narrowing is explicitly carried forward. |
| Framing adoption | Ambiguous | Declining (gate artifacts) | The gate reflection note and cycle-status do not introduce new framing from the user. They accurately characterize the loop events and the user's option selection. Notably, the gate note's "Pedagogical move selected" entry attributes the in-gate loop manifestation as "empirical content in the design question's scope" — this is the agent's framing of the live failure, and the user's option 3 selection did not contest it or engage it. Whether the user accepted this framing or simply chose the procedurally available option is not established by the evidence. |
| Confidence markers | Absent | Declining | No "clearly" / "obviously" / "the right approach is" patterns in gate artifacts. Cycle-status language is hedged throughout. The open-questions section (three items) explicitly holds uncertainty open. No confidence inflation. |
| Alternative engagement | Declining (structurally) | Stable | Option 3 explicitly defers rather than engages the hook-side alternative. This is a deliberate choice recorded visibly. The gate note's open questions section holds three genuine questions open, including the most consequential: "Whether ADR-072 as currently designed covers the in-gate-conversation mini-cycle shape." No substantive engagement with the hook-side alternative occurred between the prior snapshot and this gate boundary — the option 3 selection is a procedural resolution, not a design-level engagement. |
| Embedded conclusions | Clear (carried forward) | Stable | The prior snapshot's embedded-conclusion finding persists: cycle-status.md fields as design, "pause" semantic as design. The gate artifacts do not introduce new embedded conclusions. The cycle-status update correctly surfaces the un-examined alternative and records the design commitment. The distinction between "recording a deferred gap" and "resolving it" is preserved by the gate artifacts' language. |

---

## Evaluation by Brief Item

### 1. Trajectory from the prior snapshot — has option 3 resolved, reinforced, or shifted the signals?

The prior snapshot's three Grounding Reframe triggers (framing adoption, solution-space narrowing, embedded conclusions) were live signals in ADR-072 at DECIDE-end. Option 3 is a procedural disposition: carry forward as designed, note the gap, continue to BUILD. This neither resolves nor reinforces the underlying signals. It is an explicit, eyes-open deferral.

**What the gate artifacts do well:** The cycle-status DECIDE Gate Decision section and the gate reflection note accurately characterize the un-examined alternative, name the in-gate loop as live evidence, and hold three specific design questions open for BUILD engagement. The gate note's Commitment section explicitly commits BUILD to engaging the hook-side alternative. This is the correct documentation behavior for an option 3 selection.

**What option 3 does not do:** It does not constitute engagement with the hook-side alternative as a design option. The user was presented with two live hook loops, described as "empirical content in the design question's scope," and selected option 3. Whether the user agreed with that framing, processed it as design evidence, or was simply choosing the path of least procedural friction is not established. The gate conversation record does not show the user articulating a reason to prefer cycle-status.md fields over hook-side suppression after witnessing the loops. The signal that the prior snapshot characterized as "narrowed before alternatives were examined" has not been examined between then and now.

**Assessment:** The trajectory is stable. Option 3 defers without resolving. The narrowing pattern from the prior snapshot carries forward intact into BUILD, now explicitly documented but still unengaged at the design level.

### 2. Earned confidence assessment for the cycle-status.md two-field design

The live evidence is this: the in-gate-conversation hook loop fired twice during the gate itself — once before the gate note was produced, once after the Phase advanced prematurely to `build`. Both loops demonstrated the failure mode ADR-072 is designed to address. This is the strongest possible in-cycle evidence for the design question.

The gate note correctly identifies this: "The live failure is empirical content within the scope of the design question — the hook-side alternative named by the susceptibility snapshot would have broken the loop with or without ADR-072's cycle-status.md fields populated." This attribution is accurate.

**The design question this evidence bears on:** ADR-072's cycle-status.md approach requires the `Paused` field to be populated before the Stop hook can honor the pause. During the gate conversation — when the loop was happening — the `Paused` field was not populated. The loop could not have been broken by ADR-072's design as written. The hook-side alternative (session-scoped one-block-then-advisory) would have broken it regardless of cycle-status.md state.

**Does the user's option 3 selection constitute engagement with this evidence?** No. The user's quoted response names a workflow concern ("the hook is looping infinitely") without engaging the design question the evidence opens (does this loop demonstrate that ADR-072 requires a hook-side complement?). The explicit option 3 selection came after the agent's probe, but neither the agent nor the user narrated the evidence-to-design mapping in the gate conversation. The gate note records the evidence accurately as "empirical content in scope," but the user's option 3 selection was not preceded by a visible belief-map engagement with what the evidence implied.

**Confidence assessment:** The user's confidence in the two-field design is not yet earned for the specific case the live evidence surfaces — the in-gate-conversation mini-cycle shape. The BUILD commitment section correctly names this as an open question. The confidence is bounded-earned for the "user-stepped-away session" case (where cycle-status.md fields can be pre-populated) and ungrounded for the "in-progress gate" case (where they cannot).

### 3. New signals introduced at the gate

**Assertion density during gate turns:** One user assertion (option 3 selection). No new design claims. Assertion density at the gate was minimal — a procedural selection, not an epistemic claim. No new narrowing introduced.

**Solution-space narrowing during option selection:** The option 3 selection did not narrow the solution space beyond its prior state. Options 1 and 2 were presented but not substantively engaged — option 3 was selected with a two-sentence rationale ("To be clear, I think let's move into option 3 from the gate"). No evidence that options 1 or 2 were considered and found inferior; the selection is procedural velocity, not considered rejection.

**Framing adoption:** The agent framed the live loops as "empirical content in the design question's scope." The user's response did not contest this framing, engage it, or build on it. The user's first response diagnosed a workflow problem ("the hook is looping infinitely") in terms of gate-note production timing, not in terms of ADR-072's design adequacy. The agent's reframe — that the loop is evidence bearing on the design question — was not acknowledged or engaged in the user's option 3 selection turn. Whether the user absorbed the framing, agreed with it, or simply selected the available procedural option cannot be determined from the text.

**Confidence markers:** Absent. The option 3 selection is measured in tone. No inflation.

**Alternative engagement — did option 3 selection engage options 1 and 2 substantively?** Options 1 (belief-map) and 2 (spike) were not engaged. No reasoning for preferring option 3 over options 1 or 2 was articulated. This is not itself a susceptibility signal — the user is entitled to select options without defending the selection — but it means the gate conversation does not constitute alternative engagement. The ADR-072 design gap documented by the prior snapshot remains unengaged.

### 4. BUILD commitments risk assessment

The cycle-status BUILD commitments are:

1. Implement ADR-072 as designed (two cycle-status.md fields).
2. Implement ADR-071's three concrete skill changes.
3. The in-gate-conversation mini-cycle loop case is live evidence; if ADR-072's two-field design does not break this specific loop, flag it during BUILD and surface as either an ADR-072 revision or a separate hook-side supplement.
4. If BUILD drifts into Design Amendment territory, pause and reassess.

**Assessment of commitment 3 — the key BUILD-entry risk:** This commitment is correctly scoped and non-trivial. It requires BUILD to evaluate, at implementation time, whether ADR-072's design covers the in-gate-conversation case. The evaluation is: implement the two-field design, test whether it would break the loop that occurred during the gate, and flag if it would not. This is the correct BUILD-entry commitment for an acknowledged design gap.

**Risk: the flag trigger may be missed.** The commitment says "flag it during BUILD" — but the flag depends on the implementer recognizing at the moment of implementation that the in-gate-conversation case is not covered. If the implementation proceeds mechanically (add two fields, update hook logic) without explicitly testing against the in-gate-conversation scenario, the gap could ship without the flag. The scenario at line 1999 ("Stop hook honors Paused declaration") tests the happy path (Paused field present) but does not test the failure path (hook fires before Paused field can be set, during an in-progress gate conversation). A dedicated failing-case scenario for the in-gate-conversation shape is not present in the scenario corpus.

**Risk: "Design Amendment territory" trigger is underspecified.** Commitment 4 says pause if BUILD drifts into Design Amendment territory. Whether adding a hook-side supplement to ADR-072 constitutes Design Amendment territory or implementation detail is not specified. If the implementer judges that a hook-side one-block-then-advisory addition is implementation detail (within ADR-072's scope), it could be shipped without reopening DECIDE. If it is a Design Amendment, DECIDE should be reopened. The gate artifacts do not define the boundary.

### 5. Grounding Reframe assessment — does any new signal meet all three triggers?

The prior snapshot's finding (hook-side alternative not examined) remains live. The gate conversation added one new piece of evidence: the in-gate-conversation loop case is now empirically demonstrated, not just theoretically identified. This strengthens the prior finding — it is no longer "a proximate alternative exists but hasn't been examined"; it is "a proximate alternative exists, hasn't been examined, and a case that ADR-072's design doesn't cover has now been demonstrated twice in-session."

**Three-trigger check:**
- **Specific:** Yes. The gap is specific: ADR-072's `Paused` field cannot be set before a Stop hook fires during an in-progress gate conversation. The hook-side alternative would cover this case; the cycle-status.md approach alone does not.
- **Actionable:** Yes. The action is bounded: before implementing the two-field design, evaluate whether the in-gate-conversation case requires a hook-side complement, and decide whether that complement is a scope expansion (requiring DECIDE re-entry) or is within ADR-072's "scope containment" as an implementation supplement.
- **In-cycle applicable (ADR-068):** Yes. BUILD will implement the hook changes. The question of whether to supplement ADR-072 with a hook-side one-block-then-advisory pattern is directly within BUILD's implementation scope.

The signal meets all three triggers.

**Is it sufficiently new relative to the prior snapshot to warrant a second Grounding Reframe recommendation?** The prior snapshot recommended a Grounding Reframe and the user selected option 3 (proceed, carry forward). A second Grounding Reframe on the same topic, at BUILD entry, is warranted when the option 3 selection's BUILD commitments are insufficient to prevent the gap from shipping without examination — and when the gate evidence has materially strengthened the signal.

The BUILD commitments are sufficient in intent but carry the flag-trigger risk identified in Brief Item 4. The gate evidence (two live loops demonstrating the in-gate-conversation case) materially strengthens the prior finding. A targeted, narrowed Grounding Reframe at BUILD entry — specifically focused on the in-gate-conversation case and the flag-trigger adequacy question — is warranted.

---

## Interpretation

The pattern from the prior snapshot has not changed in kind; it has changed in evidence weight. At DECIDE-end, the signal was: an alternative exists that was not examined, and user-authored framing was operationalized as design specification. At BUILD entry, the signal is the same, plus: the specific failure case that the un-examined alternative would address has been demonstrated live, twice, during the gate conversation itself.

The gate artifacts handle this evidence correctly in recording terms — the cycle-status DECIDE Gate Decision section names the un-examined alternative and the live failure accurately. The option 3 selection is documented as a deliberate, eyes-open deferral. The BUILD commitments are appropriately forward-looking.

What the gate artifacts do not establish is that the user's confidence in the two-field design is grounded for the case the live evidence bears on. The evidence and the design gap are co-present in the gate record, but they were not belief-mapped by the user. The user selected option 3 after a two-sentence rationale, not after a visible engagement with what the loop evidence implied for ADR-072's adequacy. This is not a failure of the gate process — option 3 is a legitimate gate outcome — but it means BUILD starts with the original narrowing pattern intact plus strengthened evidence that the pattern matters.

The BUILD commitment to flag if ADR-072 does not break the in-gate-conversation loop is the correct load-bearing mechanism. The risk is that the flag trigger relies on the implementer's in-context recognition at the moment of implementation. A specific failing-case scenario for the in-gate-conversation shape is missing from the scenario corpus; without it, the flag depends on human recall rather than test failure.

This pattern — correct documentation of an acknowledged gap, BUILD commitments adequate in intent, execution depending on in-context recognition without a structural catch — is the characteristic shape of a design gap that ships as a known-but-unflagged limitation.

---

## Recommendation

**Grounding Reframe recommended — targeted and narrowed from the prior snapshot's recommendation.**

The prior snapshot's Grounding Reframe fired and produced option 3. This follow-on recommendation is not a re-statement of the prior finding; it is a BUILD-entry refinement, focused on the gap in the BUILD commitment structure.

**The specific uncertainty to name before BUILD commits:**

ADR-072's two-field design covers the "user-stepped-away session" case (user sets `**Paused:**` in cycle-status.md, hook honors it). It does not cover the "in-progress gate" case (hook fires before any cycle-status.md field can be set, during a gate conversation in progress). The gate conversation demonstrated the second case twice. A hook-side one-block-then-advisory pattern would cover both cases. The BUILD commitment says "flag it if ADR-072 doesn't break this specific loop" — but there is no test scenario that operationalizes what "breaking this specific loop" means for the in-progress-gate case.

**Concrete grounding action — one question before BUILD implementation begins:**

Before implementing the two-field design and hook changes, add one scenario to the ADR-072 feature block that tests the in-progress-gate failure path: Given the Stop hook fires before the `**Paused:**` field has been set (because the gate conversation is still in progress and cycle-status.md has not been updated), does ADR-072's design break the infinite-loop? If this scenario cannot be written as a passing Then-clause under ADR-072's current Decision text, that is the structural flag the BUILD commitment requires — and it should surface before the implementation is committed, not after.

**Acceptable BUILD-entry responses:**

- The user adds a failing-case scenario for the in-progress-gate case and finds that ADR-072's design does not cover it. The honest resolution is either: (a) scope the hook-side complement into BUILD's implementation as a supplement to ADR-072 (within scope per cycle-status.md commitment 3), or (b) open a new ADR for the hook-side complement and flag ADR-072's known gap explicitly in its Consequences section.
- The user adds the failing-case scenario and concludes that an alternative reading of ADR-072's Decision text covers the in-progress-gate case (e.g., the `**Paused:**` field can be pre-set at gate entry, before the gate note is due). If this reading is defensible, the scenario passes and no new mechanism is needed — but the ADR should state the pre-set convention explicitly.
- The user decides the in-progress-gate case is out of scope for ADR-072 and accepts it as a known limitation, named in the Consequences section. This is a legitimate option if the user can articulate which failure scenarios are tolerable.

**What BUILD would be building on without this grounding:**

A two-field design for the "user-stepped-away session" case, with a BUILD commitment to flag the in-progress-gate case, but no structural mechanism (test scenario, failing case, explicit ADR scope statement) that makes the flag unavoidable. The gap could ship as a correctly-documented but silently-unbroken loop.
