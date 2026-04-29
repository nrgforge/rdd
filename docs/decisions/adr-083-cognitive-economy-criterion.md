# ADR-083: Cognitive-Economy Criterion as Outcome Test with In-Place-First Default

**Status:** Proposed

## Context

Essay 016 (Cycle 017) recalibrated the cycle's diagnosis of corpus comprehension failure away from the entry hypothesis (front-loaded density) and the constraint-removal's refinement (audience-conflation) toward Context-Mismatch as the structurally fundamental mechanism, with density-ordering, audience-conflation, and artifact-form-mismatch as separable independent co-mechanisms. §4.5 of the essay set the cycle's optimization target as cognitive economy on the human side and admitted brief purpose-built human-facing artifacts only where cognitive economy is positive — *but encoded the test in reading-cost terms* ("admissible when the addition earns back its reading cost in reduced downstream cognitive load").

The DISCOVER gate sharpened the essay's framing. The practitioner's actual operating principle is outcome-coded, not reading-cost-coded: *"does this produce direct human understanding without AI as workaround?"* Bolt-on artifacts that feel additional to the real docs are a failure-mode signal — when the impulse is to add an explainer doc, the docs themselves likely need to be improved. Outcome Test, Reading-Cost Test, and Bolt-On / Felt Additional were committed as domain vocabulary in MODEL Amendment 21.

The MODEL gate added a sharper constraint than upstream artifacts had encoded: variability across corpora is a per-project judgment, not just a per-artifact judgment. The susceptibility snapshot's Feed-forward B clarified that the actionable form of this constraint is a methodology-wide default with named exception conditions, not pure per-project judgment without a default. The gate's commitment is consistent with both forms; only the default-with-exceptions form produces actionable guidance.

The MODEL gate's susceptibility snapshot also surfaced Feed-forward A: before drafting this ADR, the cognitive-economy criterion's drafting agent should name the conditions under which four standalone concepts (density-ordering, audience-conflation, artifact-form-mismatch, and Context-Mismatch as their unifying frame) would have served the ADR better than the folded structure committed in MODEL. The single sentence appears in Rejected alternatives.

The Outcome Test's invariant-placement question is held open in MODEL as a DECIDE-deferred question. This ADR encodes the criterion at methodology-principle level rather than amending an invariant. The reasoning is documented in Rejected alternatives.

## Decision

The methodology adopts the **Outcome Test** as the admissibility criterion for human-facing artifacts, with **in-place-first** as the default intervention move and **bolt-on / felt-additional** as the failure-mode signal. The criterion is encoded as a methodology-wide default with named exception conditions, not as a methodology-wide rule and not as pure per-project judgment.

### 1. The Outcome Test

A candidate human-facing artifact is admissible when its presence in the corpus would produce **direct human understanding without AI as workaround**. The test is outcome-coded, not reading-cost-coded: an artifact passes the test if a zero-prior-familiarity reader, given the artifact and the corpus, can build the schemas needed to comprehend the corpus without routing comprehension through AI summarization. The test is felt by the practitioner at the moment a candidate human-facing artifact is proposed; it is not mechanically computable.

The Outcome Test is the practitioner's diagnostic, not a methodology audit. Its function is to interrupt the impulse to add an explainer doc by asking what direct human understanding the addition would produce that the existing corpus does not.

### 2. In-place-first as the default intervention move

When a human-reading failure is observed, the default intervention is **in-place restructuring of the existing artifact** — sharper reading paths, F-pattern orientation leads at the top of Tier 2 documents, audience-segmented section ordering, content-type-to-form matching (diagrams alongside prose where the content has spatial / topological / parallel-relational structure). The default is structural improvement of what humans already read, not addition of new human-facing artifacts.

The in-place-first default applies *before* the Outcome Test fires on a candidate addition. If the candidate addition is proposed because the existing docs feel thick or disorganized, the in-place-first default redirects the intervention to the existing docs themselves. The Outcome Test then applies only to candidate additions that survive the in-place-first redirect — material the in-place restructuring genuinely cannot carry.

### 3. Bolt-on / felt-additional as the failure-mode signal

When a candidate human-facing artifact reads as **bolt-on** — additional to the real docs, sitting alongside them as a workaround for what they should have done — the felt-additional quality is a **failure-mode signal**. The signal indicates that the existing docs need fixing, not that an additional doc is the right intervention.

The signal is felt, not mechanically detected. Practitioners reading the candidate addition alongside the existing docs notice when the addition reads as a workaround. The signal's function is to redirect the intervention from addition to in-place restructuring. The signal does not foreclose addition — it surfaces a question about whether addition is the right move.

### 4. Per-project variability — methodology-wide default with named exceptions

The criterion is encoded as a methodology-wide default with named exception conditions, not as a methodology-wide rule and not as pure per-project judgment without a default. The default is the in-place-first / Outcome-Test / bolt-on-as-signal triad documented in §1–§3.

Named exception conditions under which a corpus may deviate from the default:

- **Audience asymmetry across corpora.** When a corpus's primary readers are predominantly experts with established schemas (returning practitioners using lookup-optimized reference material), the in-place-first default's emphasis on schema-building may be inverted — orientation leads can be shorter, density-ordering concerns relax. The expertise reversal effect (Kalyuga et al. 2003) names the empirical mechanism.
- **Content-divergence threshold for human and agent contexts.** When a corpus's human-facing material and agent-facing material draw on the same facts presented differently, in-place layering serves both. When the two genuinely require different facts, ADR-084's companion-file pattern applies as a structured exception that does not violate the in-place-first default.
- **Documentation-fatigue signal at the post-graduation lifecycle position.** The trigger is **graduation status**: the corpus has one or more graduated Scoped Cycles, evidenced by the traces graduation leaves (archived scoped-cycle artifacts, cycle-status entries marking the fold-and-archive operation, native-doc folds that ADR-026 specifies). The structural condition is corpus-state-observable through these traces — not practitioner-state-observable. The felt phase transition that ADR-026 names (work shifting from identity-forming to feature-extending) is the subjective correlate of graduation status — it is how graduation presents to the practitioner, not a separate trigger. A practitioner whose corpus has not crossed the graduation threshold cannot invoke this exception, regardless of how the corpus feels to work in; the bolt-on / felt-additional failure-mode signal applies normally. Conversely, a corpus with graduation history admits the exception even if the practitioner does not subjectively register fatigue — the structural condition controls. This separation prevents the exception from operating as a permission to skip in-place work because the practitioner is bored with the corpus, while still admitting graduation-bridge addition when the corpus has structurally outgrown its formative phase.
- **Genuine zero-prior-familiarity reader cohort with no established corpus access pattern.** When the corpus is being handed to a stakeholder cohort the existing artifacts cannot reach (an external review board, a regulatory audience, a non-technical stakeholder group) and the receiving cohort has no path through the existing corpus, a brief purpose-built on-ramp may be warranted as a structured exception. The exception requires the on-ramp to remain brief, purpose-built, and targeted — a multi-page exhaustive introduction reverses the cognitive economy.

A corpus deviating from the default for any of these reasons records the exception explicitly in the cycle-status entry that produced the deviation, citing the exception condition by name. The exception is visible, not silent. Practitioners can ask "why is this corpus deviating from the default?" and find the answer.

### 5. Cognitive vs. non-cognitive admissibility (T3) — held open

Value Tension T3 names a question this ADR does not resolve: human-facing artifacts may carry non-cognitive value (relational trust-building, normative signaling of care for the reader, social demonstration of work) that does not register as cognitive load reduction. Whether non-cognitive admissibility belongs alongside the Outcome Test as a separately-evaluable axis is held as an open question. The Outcome Test as encoded here is purely cognitive-economy-coded; future cycles may extend it with a non-cognitive admissibility companion criterion if practitioner experience demonstrates the cognitive criterion alone produces wrong answers.

### 6. Encoding scope

The Outcome Test, in-place-first default, and bolt-on / felt-additional signal are encoded at **methodology-principle level**, not at invariant level. Whether the Outcome Test rises to invariant level is held as an open question. The Outcome Test is felt and judgment-applied; invariants in this corpus carry observable structural commitments (gate epistemic acts, mechanism execution anchoring). The Outcome Test does not yet have an established structural anchor — it operates at the moment a candidate human-facing artifact is proposed, which is not a step-anchored position in any current skill. Invariant placement waits for a structural anchoring of the test, which is a Tier 2 mechanism in the meantime.

## Rejected alternatives

**Reading-cost-coded admissibility test (the §4.5 framing).** Rejected. The reading-cost test produces wrong answers in cases where a small purpose-built artifact produces understanding regardless of whether it has the lower aggregate reading cost. The §4.5 framing also does not surface the bolt-on / felt-additional signal — a candidate addition can pass a reading-cost test (the addition is short enough) while failing the outcome test (the addition reads as a workaround for thick original docs). The DISCOVER gate's belief-mapping challenge surfaced this; the practitioner's outcome-coded test is the sharper instrument.

**Methodology-wide rule without exception conditions.** Rejected. A pure rule ("never add human-facing artifacts beyond the in-place corpus") forecloses legitimate exception cases the cycle's evidence supports — graduation bridges, stakeholder-cohort on-ramps, audience-asymmetric corpora. The MODEL gate's variability-across-corpora commitment explicitly required admitting per-project variation. A pure rule violates that commitment.

**Pure per-project judgment without a default.** Rejected. The MODEL gate's susceptibility snapshot Feed-forward B specifically named this form as inadequate: "the criterion must be encodable in a way that admits per-project variation rather than being a methodology-wide rule" admits both forms, but only the default-with-exceptions form produces actionable guidance. Pure judgment without a default reduces the criterion to a permission for variance without a frame for when variance is appropriate.

**Outcome Test elevated to invariant.** Rejected for v1. The Outcome Test is felt rather than mechanically computable, and its triggering moment (candidate human-facing artifact proposed) is not currently step-anchored in any skill. Invariant 8's anchoring requirement disqualifies mechanisms that cannot meet the structural anchoring requirement from being specified as unconditional. The Outcome Test currently operates as a Tier 2 cognitive mechanism (Question Toolkit's Apply Outcome Test action). Invariant placement waits for either a structural anchor (a skill step at which the Outcome Test must fire — perhaps in `/rdd-graduate` or `/rdd-conform`) or a Harness-Layer mechanism (a hook that detects candidate additions and prompts the test). Both are future-cycle scope.

**Bolt-on signal as a hard rule rather than a felt signal.** Rejected. The signal's function is to interrupt and redirect, not to forbid. Hard-rule encoding ("any artifact that reads as bolt-on is rejected") forecloses the named exception conditions in §4. Felt-signal encoding preserves practitioner judgment while making the failure-mode visible.

**Folded co-mechanism encoding alternative — four standalone concepts (density-ordering, audience-conflation, artifact-form-mismatch, context-mismatch).** Per Snapshot Feed-forward A, the condition under which four standalone concepts would have served this ADR better than the folded structure is: **if the cognitive-economy ADR's primary citations were to individual co-mechanisms each addressed by separate intervention patterns, with the unified mechanism playing no load-bearing role in the ADR's argument.** That condition is not met here — the ADR cites Context-Mismatch as the unifying diagnostic frame in §1 (the in-place-first default rests on the unified mechanism's structural fundamentality) and cites the co-mechanisms by sub-name where the intervention is mechanism-specific (audience-conflation in ADR-084's companion-file decision, density-ordering in F-pattern restructuring at ARCHITECT). The folded structure carries diagnostic load that four standalone concepts would not, and the named co-mechanisms remain individually citeable. The folded encoding stands.

## Consequences

**Positive:**

- The Outcome Test's outcome-coding (rather than reading-cost-coding) carries the practitioner's actual operating principle into the methodology, where the §4.5 framing had encoded a less-sharp version. Future cycles inherit a criterion that matches what practitioners do at the moment of artifact proposal.
- The in-place-first default redirects intervention impulses toward the existing corpus rather than toward addition. Documentation-bloat as a failure mode becomes visible at proposal time.
- The bolt-on / felt-additional signal makes the failure mode of "explainer doc as workaround for thick original docs" structurally visible. Practitioners encountering the impulse to add explainer material are prompted to consider whether the original docs need fixing instead.
- The methodology-wide default with named exceptions admits the four documented exception conditions without collapsing into pure per-project judgment. Practitioners deviating from the default record the exception condition explicitly.
- The encoding scope (methodology-principle level, not invariant) honestly reflects the criterion's current Tier-2 status. Invariant 8 is not violated by aspirational invariant claims.

**Negative:**

- The Outcome Test is felt, not mechanical. Practitioners can apply it inconsistently or self-deceive about whether a candidate addition produces direct human understanding. Mitigation: the bolt-on signal partially addresses this — the felt-additional quality is harder to self-deceive about than abstract outcome estimation.
- The named exception conditions are enumerated, not exhaustive. A corpus deviating for an unenumerated reason has no scaffolding for recording the deviation. Mitigation: the cycle that encounters such a deviation either argues the new condition into the methodology (this ADR is amended) or records the deviation as an explicit one-off with rationale in cycle-status. Future cycles that observe a recurring unenumerated condition can argue for its addition.
- Per-project variability creates a methodology-versus-corpus question: when a corpus deviates from the default citing an exception condition, the receiving methodology user (a new practitioner adopting the corpus) inherits the deviation as if it were the corpus's encoding. The deviation must be visible — recorded in cycle-status — so the receiving practitioner can see what was decided and why. The visibility is not enforcement; a corpus can silently deviate. Mitigation: the conformance audit (`/rdd-conform`) can include a future audit scope that flags deviations recorded in cycle-status as "this corpus deviates from default; see citation."
- The criterion does not currently address non-cognitive admissibility (T3). Practitioners proposing artifacts whose value is relational, normative, or social have no methodology-supported test. This is held open as a future cycle scope.

**Neutral:**

- The Outcome Test, in-place-first default, and bolt-on signal are domain vocabulary committed in MODEL Amendment 21. This ADR does not introduce new concepts; it encodes the criterion the vocabulary already names.
- The encoding does not foreclose ADR-086's separate decision on AI-as-orienter / AI-as-prosthetic. The Outcome Test applies to the artifacts a corpus produces; AI-as-orienter is a methodology-modality question about how the orientation function is performed. The two ADRs operate at different layers.
- The ADR does not specify what fires the Outcome Test in skill text. The test's structural anchoring is held as a future cycle scope (the test is currently Tier 2; structural anchoring would graduate it toward Tier 1 status).

## Provenance check

- **The Outcome Test, in-place-first default, and bolt-on / felt-additional signal:** practitioner-articulated at the discover → model gate (recorded in `.rdd/gates/017-discover-gate.md` and the discover susceptibility snapshot). Driver-derived; user-surfaced through belief-mapping at the gate.
- **The variability-across-corpora as per-project judgment:** practitioner-articulated at the model → decide gate (recorded in `.rdd/gates/017-model-gate.md`). Driver-derived; user-surfaced.
- **The methodology-wide default with named exceptions form:** specified in MODEL susceptibility snapshot Feed-forward B as the actionable form of the variability commitment. Snapshot-derived; isolated-context recommendation.
- **The four named exception conditions (audience asymmetry, content-divergence threshold, documentation-fatigue, zero-prior-familiarity reader cohort):** drafting-time synthesis. Each condition has driver support — audience asymmetry traces to Kalyuga's expertise reversal effect (essay 016 §3); content-divergence threshold traces to ADR-084's per-artifact judgment (essay 016 §4.1); documentation-fatigue traces to graduation as a methodology-amendment lens (ADR-026); zero-prior-familiarity reader cohort traces to product-discovery's Zero-Prior-Familiarity Reader stakeholder (Cycle 017 DISCOVER). The aggregation as the four exception conditions is agent composition; the individual conditions are driver-derived.
- **The encoding scope (methodology-principle, not invariant):** specified as a DECIDE-deferred open question in MODEL Amendment 21. The disposition (defer to future cycle for invariant elevation, encode at methodology-principle level here) is drafting-time synthesis applying Invariant 8's anchoring requirement to the Outcome Test's current Tier-2 status. Agent composition; principle-derived.
- **The folded-vs-standalone alternatives sentence (Snapshot Feed-forward A):** drafting-time examination of the encoding's downstream use in this ADR. The condition is named explicitly in Rejected alternatives. Agent composition responsive to the snapshot's directive.
- **The cognitive vs. non-cognitive admissibility (T3) deferral:** product-discovery Value Tension T3 carried into this ADR as held open. Driver-derived.

**Result:** Core framings (Outcome Test, in-place-first, bolt-on, per-project variability) are user-surfaced at the cycle's gates; the snapshot Feed-forwards are isolated-context recommendations; the four exception conditions are agent-composed aggregations of driver-supported individual conditions; the encoding-scope disposition is drafting-time synthesis applying Invariant 8. Snapshot Feed-forward A's directive is discharged in Rejected alternatives. No synthesis-moment framing adoption detected.
