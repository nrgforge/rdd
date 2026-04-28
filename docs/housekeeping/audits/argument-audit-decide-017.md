# Argument Audit Report

**Audited documents:**
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-083-cognitive-economy-criterion.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-084-agent-context-content-placement.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-085-rdd-infrastructure-relocation.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-086-ai-as-orienter-non-adoption.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-087-validation-spikes-in-research.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-088-adr-064-advisory-demotion.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-089-adr-067-harness-layer-revision.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-090-in-progress-phase-role-shift.md`

**Source material:**
- `/Users/nathangreen/Development/rdd/docs/essays/016-initial-handoff-and-the-audience-at-the-margin.md`
- `/Users/nathangreen/Development/rdd/docs/product-discovery.md`
- `/Users/nathangreen/Development/rdd/docs/domain-model.md` (Amendment 21 vocabulary)
- `/Users/nathangreen/Development/rdd/docs/housekeeping/audits/susceptibility-snapshot-017-discover.md`
- `/Users/nathangreen/Development/rdd/docs/housekeeping/audits/susceptibility-snapshot-017-model.md`
- `/Users/nathangreen/Development/rdd/docs/housekeeping/gates/017-research-gate.md`
- `/Users/nathangreen/Development/rdd/docs/housekeeping/gates/017-discover-gate.md`
- `/Users/nathangreen/Development/rdd/docs/housekeeping/gates/017-model-gate.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-064-compound-check-hooks.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-067-three-tier-enforcement-classification.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-070-housekeeping-migration.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-074-adr-supersession-workflow.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-058-unconditional-architectural-floor.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-069-methodology-scope-of-claim.md`

**Date:** 2026-04-27

---

## Section 1: Argument Audit

### Summary

- **Argument chains mapped:** 24 (3 per ADR on average: context → decision, alternatives rejection, consequences)
- **Issues found:** 11 (1 P1, 5 P2, 5 P3)

---

### P1 — Must Fix

**Issue 1.1 — ADR-085: Supersession header format deviates from ADR-074's required form**

- **Location:** ADR-085, "ADR-070 supersession header to apply" section
- **Claim:** ADR-085 instructs that ADR-070 receives the header: `> **Updated by ADR-085 on 2026-04-27.**` and that ADR-070's Status field updates to `Updated by ADR-085`.
- **Evidence gap:** ADR-070 has already been modified in the committed corpus — it already shows the supersession header and the status field `Updated by ADR-085`. This is consistent with ADR-074's workflow. However, ADR-085's migration table (§4, the downstream artifact sweep) lists `system-design.md`, `ORIENTATION.md`, `domain-model.md`, and `field-guide.md` as deferred sweeps — but **does not list ADR-070 itself** in the sweep table. ADR-074 Step 3 requires updating "downstream current-state artifacts." ADR-070 is not a current-state artifact (it is an ADR, subject to the supersession header, not to the downstream sweep). This is fine. The actual gap is different: ADR-085's migration mechanics (§4, step 10) specify reference updates across `docs/decisions/*.md` — meaning prior ADRs that cite `docs/housekeeping/` paths in their bodies. But ADR-064's body still contains numerous `docs/housekeeping/` path references (dispatch log path, manifest path, migration marker path) that will become stale references post-migration. ADR-085 does not acknowledge this as a deferred sweep item, even though ADR-064's body references `docs/housekeeping/dispatch-log.jsonl`, `docs/housekeeping/.migration-version`, and the housekeeping directory throughout its Decision section. Since ADR-074 requires body immutability, these paths cannot be corrected in ADR-064's body — but the advisory reading of ADR-064 post-migration would reference paths that no longer exist. ADR-085 does not address how to handle the documentation-vs-reality gap created in ADR-064's immutable body by the migration. The correct disposition (note the stale paths as a known consequence of the migration and body immutability together) is absent from Consequences.
- **Recommendation:** Add an item to ADR-085's Consequences (Negative) noting that ADR-064's immutable body retains `docs/housekeeping/` paths after migration, and that this is an expected artifact of body immutability — readers of ADR-064 post-migration should be aware the paths are historical. Optionally add a one-line note in ADR-064's supersession header (ADR-088 has one already; a companion note or a path-change addendum in the header from ADR-085 would serve). This is a must-fix because without it, the migration's consequence of making ADR-064's body historically inconsistent is invisible — which is exactly the silent-drift failure mode ADR-074 exists to prevent.

---

### P2 — Should Fix

**Issue 2.1 — ADR-083: Exception condition "documentation-fatigue signal" has underspecified trigger that risks silent drift**

- **Location:** ADR-083 §4, "Documentation-fatigue signal" exception condition
- **Claim:** "When the corpus is approaching graduation (the work has shifted from identity-forming to feature-extending; the artifacts feel like maintenance burden rather than active value), the criterion's bias toward in-place restructuring relaxes — addition of small purpose-built artifacts may be appropriate."
- **Evidence gap:** The trigger for this exception ("feels like maintenance burden") is entirely felt-phenomenological, with no structural markers. The other three named exceptions have observable criteria: audience asymmetry traces to a recognizable reader cohort; content-divergence threshold traces to the Pattern A/B judgment in ADR-084; zero-prior-familiarity cohort traces to an identifiable stakeholder group. Documentation fatigue is self-referential: the practitioner who is bored with their corpus invokes an exception to add more artifacts to that corpus. The exception as written creates a path where the bolt-on / felt-additional failure-mode signal is bypassed by claiming documentation fatigue — but the distinction between "I'm tired of fixing the docs" (not a valid exception) and "the corpus has genuinely outlived its formative phase" (a valid exception) is not articulated. The source material (essay 016 §4.5, product-discovery Value Tensions) does not mention documentation fatigue as a named driver; its provenance is listed as "traces to graduation as a methodology-amendment lens (ADR-026)" — an indirect single-ADR derivation. The exception's agent-composed status combined with its underspecified trigger creates a loophole.
- **Recommendation:** Add a distinguishing criterion for the documentation-fatigue exception. Specifically: tie it to the corpus's Scoped Cycle lifecycle status — the exception applies when the corpus has passed through at least one graduation cycle and is operating as a feature-extension corpus (per the Scoped Cycle concept in the domain model), not when the practitioner subjectively feels burdened. This makes the exception structurally observable (graduation history is recorded) rather than purely phenomenological.

**Issue 2.2 — ADR-086: "Indistinguishability at usage time" failure mode is agent-composed and underexamined**

- **Location:** ADR-086 §1, second failure mode: "Indistinguishability at usage time"
- **Claim:** "From inside an interactive session with the agent, the practitioner cannot reliably tell whether they are using the agent to build their own schemas (AI-as-orienter) or to substitute for the reading work the corpus should support (AI-as-prosthetic)."
- **Evidence gap:** The provenance check for ADR-086 explicitly notes this failure mode is "agent-composed against the practitioner-vs-agent observability question that the literature does not directly address." It is not drawn from essay 016 §4.5, which names usage drift as the failure mode but does not separately name indistinguishability at usage time as a distinct mechanism. The ADR's non-adoption decision rests on two failure modes; one is essay-grounded and one is agent-composed. If the second failure mode were removed or weakened, the non-adoption argument becomes: "usage drift is possible, but we could design structural mitigations against it" — which the Rejected alternatives section actually acknowledges when it considers "structural usage limits." The non-adoption conclusion thus depends partly on an agent-composed claim the essay does not support. The MODEL snapshot's Feed-forward B warned specifically about agent-composed material becoming load-bearing without examination.
- **Recommendation:** Either (a) mark the "indistinguishability at usage time" failure mode explicitly as agent-hypothesized, noting it has not been tested against the literature and represents a judgment call about operational fragility — which would align with ADR-069's honest scope-of-claim pattern; or (b) note in Consequences that the two failure modes have different evidence bases (one essay-grounded, one agent-composed) and that the non-adoption holds on the essay-grounded failure mode alone. The non-adoption conclusion itself is sound — the essay-grounded usage-drift failure mode is sufficient — but the argument should not lean on an unverified mechanism as if it were equally established.

**Issue 2.3 — ADR-087: Target 2 discharge is substantive on Beck-port reframe but thin on the concrete probe**

- **Location:** ADR-087 §2, spike test examples; Provenance check, Target 2 discharge claim
- **Claim:** "The Target 2 reframe is discharged. The DECIDE-deferred RESEARCH Grounding Reframe is addressed at this gate with a substantive disposition rather than a ceremonial nod."
- **Evidence gap:** The research-gate Target 2 carries a specific concrete probe: "name one specific claim in essay 016 §4.5 a spike could test against the world." ADR-087 §2 names three spike test examples, which appears to discharge this. However, the probe named §4.5 specifically, and examining the three examples against the essay text reveals a gap: the second example ("Spike test for §4.1's companion-file pattern resolving audience-conflation") cites §4.1, not §4.5 where the Target 2 probe was anchored. The first and third examples (bolt-on signal and brief on-ramp) are genuinely from §4.5. The inclusion of a §4.1 example where the probe specified §4.5 is a minor displacement — the Target 2 reframe itself (the Beck-port calibration) is discharged substantively in §1. But the concrete probe ("name one claim from §4.5") should produce §4.5-sourced spike examples only. The inclusion of §4.1 suggests the examples were composed against the essay as a whole rather than specifically against §4.5 as directed. This does not undermine the ADR's value, but the concrete discharge of the probe is slightly off-target.
- **Recommendation:** Either (a) note that the §4.1 spike example extends beyond the probe's scope and is offered as additional context rather than as probe discharge; or (b) replace the §4.1 example with a §4.5-specific spike (e.g., testing whether F-pattern orientation leads in Tier-2 documents produce measurable first-encounter comprehension improvement). This keeps the provenance chain accurate.

**Issue 2.4 — ADR-088/ADR-089 pair: "enforcement mode" semantic shift is not fully resolved between the two ADRs**

- **Location:** ADR-088 §4 (Harness Layer negative scope), Neutral section ("the semantic of 'enforcement mode' shifts"); ADR-089 §3 (amended State-C claim)
- **Claim:** ADR-088 states "the semantic of 'enforcement mode' shifts; the migration-version-marker mechanism is unchanged." ADR-089 amends the Three-Tier Classification to reflect the advisory disposition.
- **Evidence gap:** ADR-064's Advisory mode section defines "enforcement mode" as the state a corpus enters when the migration marker is present — it is the mode in which the compound check runs. ADR-088 changes what enforcement mode delivers (advisory instead of blocking) but does not explicitly amend ADR-064's advisory-mode section's language, which says: "If the marker file exists → corpus is migrated → **enforcement mode** (the compound check runs as specified in Hook 2 above)." After ADR-088, "as specified in Hook 2" refers to a blocking exit code that no longer applies. A practitioner reading ADR-064's advisory-mode section in conjunction with ADR-088's supersession header has to compose two documents to understand that "enforcement mode" now means "advisory with compound check" rather than "blocking with compound check." ADR-089 correctly amends ADR-067's taxonomy description but neither ADR-088 nor ADR-089 proposes amending ADR-064's advisory-mode subsection's "enforcement mode" terminology even though it now carries misleading semantics. Since ADR-074 prohibits body edits on accepted ADRs, the correct disposition is to name this in ADR-088's Consequences and in the ADR-088 supersession header on ADR-064 — but the supersession header currently describes the amendment at a high level without mentioning the enforcement-mode semantic shift specifically.
- **Recommendation:** Expand ADR-088's supersession header to explicitly note that the term "enforcement mode" in ADR-064's advisory-mode subsection refers to the compound-check-active state (not the blocking state), so readers composing the two documents have a navigational signal. This is the canonical use of the supersession header — surfacing what in the prior ADR's body is now historical rather than active. Alternatively, add a Neutral note in ADR-088 naming the enforcement-mode terminology gap explicitly.

**Issue 2.5 — ADR-090: Conformance audit "stale field state" finding has no recovery path**

- **Location:** ADR-090 §5 (Conformance-audit posture)
- **Claim:** "The conformance audit does still flag stale field state — a field set for a phase that has been completed (per cycle-status.md's phase status table) is a stewardship concern, but the concern is about cycle-status hygiene, not about the field's correctness role."
- **Evidence gap:** The ADR names stale field state as a finding the conformance audit emits but provides no guidance on what the practitioner should do when they see it. If the field is advisory-noise suppressor (not correctness-critical), a stale field is a cosmetic concern — but the audit surfacing it as a "stewardship concern" creates the impression it requires action. Without a stated remediation (clear the field), practitioners receiving the finding may be uncertain whether to act. The domain model Amendment 21 and ADR-078 (multi-cycle schema) are cited in passing but neither names this specific scenario. The missing guidance is small but creates a visible gap in the ADR's scope: it describes what the conformance audit finds but not what the practitioner does with the finding.
- **Recommendation:** Add one sentence to §5: "The remediation for stale field state is to remove the `**In-progress phase:**` line from the completed cycle entry. The conformance audit's finding requires no other action." This closes the loop without requiring substantive changes.

---

### P3 — Consider

**Issue 3.1 — ADR-083: The "cognitive economy" framing in the ADR title and decision text is not the same as the Outcome Test**

- **Location:** ADR-083 title, Decision preamble
- **Claim:** The ADR is titled "Cognitive-Economy Criterion as Outcome Test with In-Place-First Default" and the Decision describes adopting "the Outcome Test as the admissibility criterion."
- **Observation:** The title names "Cognitive-Economy Criterion" as the top-level concept, but the Decision actually adopts the Outcome Test as the criterion — not cognitive economy directly. Cognitive economy is the *optimization target* (§4.5 of essay 016); the Outcome Test is the *admissibility criterion* that operationalizes it. These are related but distinct: cognitive economy is a property of the corpus the practitioner is trying to maximize; the Outcome Test is the gate a candidate artifact must pass. A reader encountering the ADR title after reading only the Outcome Test decision section may wonder why "cognitive economy" is in the title when the criterion is the Outcome Test. The title could be read as claiming the ADR encodes the cognitive-economy criterion generically, when it specifically encodes the Outcome Test as the method for applying that criterion. The distinction is not wrong — it is just imprecise at the title level.
- **Recommendation:** Consider whether the title would be clearer as "Outcome Test as Admissibility Criterion — In-Place-First Default and Cognitive-Economy Framing" or similar, where the Outcome Test is named first as the decision and cognitive economy is named as its parent framing. The current title is acceptable but could create navigational confusion for future readers searching for either term.

**Issue 3.2 — ADR-084: The ~50% threshold heuristic is introduced without acknowledging that it has no source**

- **Location:** ADR-084, "Per-artifact judgment criterion for Pattern A vs. Pattern B"
- **Claim:** "Apply Pattern A when the human-facing and agent-facing material in this artifact would be sectionable without producing >50% audience-tagged volume relative to the human-facing baseline."
- **Observation:** The provenance check acknowledges this is "drafting-time synthesis applying the essay's content-divergence threshold framing to a felt indicator. Agent composition; essay-grounded." The threshold is agent-composed — no source establishes that 50% is the right inflection point. The decision section presents it without qualifying it as agent-composed, which could lead practitioners to treat it as an empirically derived threshold rather than a heuristic placeholder. The threshold is also stated as a "felt indicator" in the same sentence — felt indicators and numerical thresholds occupy different epistemic registers, and combining them in one criterion is slightly inconsistent.
- **Recommendation:** In the per-artifact judgment criterion, add a one-phrase qualification: "The ~50% indicator is agent-proposed, not empirically calibrated; practitioners should treat it as a starting point for judgment rather than a precision rule." The provenance check already notes this, but the decision text itself should signal that the number is heuristic.

**Issue 3.3 — ADR-085: The rationale for including `session/` in the relocation is thinner than for other artifacts**

- **Location:** ADR-085 §1 (migration scope table), Provenance check ("The session/ inclusion in the relocation")
- **Claim:** "The `session/` directory… also relocates from its current root-level position to `.rdd/session/`."
- **Observation:** The provenance check notes this is "drafting-time synthesis applying the same process-vs-product axis to ADR-050's session artifacts (which carry `session-artifact: true` frontmatter explicitly classifying them as infrastructure)." ADR-050's session-artifact classification is the only cited basis. Unlike the other relocated artifacts (audits, gates, cycle-status, dispatch-log), `session/` was not named in the DISCOVER or MODEL gate commitments — the gate commitments name "infrastructure artifacts (housekeeping/, session/, audit reports, dispatch logs)" but the specific inclusion of `session/` in the `.rdd/` relocation (as opposed to a separate decision) is not gate-committed. It is ADR-consistent but gate-scope questions are not explicitly addressed.
- **Recommendation:** In ADR-085 Consequences (Neutral or Positive), note explicitly that `session/` relocation is an extension of the gate commitment (the gates named housekeeping/ as the primary target; session/ is included on the same process-vs-product axis by the ADR's judgment). This makes the agent-composed extension visible rather than presenting it as if it were gate-committed.

**Issue 3.4 — ADR-088: The "anticipated remediation" problem is named but not fully addressed**

- **Location:** ADR-088, Rejected alternatives ("Demote the manifest check while retaining the compound check as blocking")
- **Claim:** Retaining the compound check as blocking is rejected because "a fabrication signal would block on every Stop until the fabrication is addressed, and the agent's remediation impulse (re-fabricating with a matching dispatch log entry would require re-dispatching, not editing the log) might produce churn."
- **Observation:** The argument that "re-dispatching would be required rather than log editing" is correct, but the ADR doesn't explain why this produces churn rather than correct behavior. Re-dispatching on a fabrication signal would actually be the right response — it would produce a genuine artifact and a matching dispatch log entry. The "churn" concern would arise if re-dispatching itself fails (e.g., subagent is unavailable), producing a loop of failed dispatches and re-fires. This scenario is more specific than "churn" implies, and the argument against the split alternative would be stronger if it named the specific failure mode (failed re-dispatch loop) rather than the general "churn" concern. The current reasoning is valid but underspecified.
- **Recommendation:** Specify: "the fabrication-signal block would cascade if re-dispatch fails (subagent unavailable, permissions error, etc.) — the agent would have no non-blocking resolution path." This makes the rejection argument more precise.

**Issue 3.5 — Cross-ADR: The downstream sweep coordination between ADR-085, ADR-088, and ADR-089 risks double-logging**

- **Location:** ADR-085 downstream sweep table, ADR-088 downstream sweep table, ADR-089 downstream sweep table
- **Claim:** All three ADRs defer `system-design.md`, `ORIENTATION.md`, `domain-model.md` (with a model amendment), and `field-guide.md` sweeps to ARCHITECT or BUILD.
- **Observation:** ADR-088 and ADR-089 both specify `domain-model.md` updates "At MODEL Amendment 22 in this cycle" — specifically updating the Compound Check concept (ADR-088) and the Three-Tier Enforcement concept (ADR-089). These are listed as separate updates in two ADRs, but both target the same domain model amendment. If both updates are applied at MODEL Amendment 22, there is a risk of incomplete coordination (one update applied and the other missed, since they are tracked separately in two ADR sweep tables). ADR-085's domain-model update (the amendment log entry recording ADR-085's supersession of ADR-070) is a third simultaneous domain-model touch that could be grouped with Amendment 22 or separate. The sweep coordination is not explicitly tracked in any single artifact.
- **Recommendation:** In cycle-status.md (per ADR-074 Step 4), record the three coordinated domain-model touches as a single Amendment 22 checklist entry: "(a) Compound Check concept update for ADR-088 advisory disposition, (b) Three-Tier Enforcement concept update for ADR-089 Harness Layer revision, (c) Amendment log entry for ADR-085 supersession of ADR-070." This reduces the risk of one touch being applied without the others and makes the coordination visible in a single place.

---

## Section 2: Framing Audit

The framing audit makes the negative space of content selection visible. The primary documents chose specific framings across eight ADRs; this section examines what those choices excluded.

### Question 1: What alternative framings did the evidence support?

**Alternative A: Encode the Outcome Test as a Tier 1 unconditional mechanism now, with a structured hook trigger**

The source material available to ADR-083 includes essay 016 §4.5's explicit statement that operationalizing the cognitive-economy test for specific candidate artifacts is "a design decision the cycle defers to DECIDE." The MODEL gate reflection note records "the Outcome Test as admissibility criterion" as a practitioner-surfaced commitment. ADR-083 defers invariant placement because the Outcome Test "does not yet have an established structural anchor." But the source material also includes ADR-067's four-step decision procedure: if the Outcome Test has a natural artifact moment at which a canonical-path file could be required (e.g., a cycle-status entry recording the exception condition when an artifact is admitted), it could be a User-Tooling Layer mechanism rather than being deferred entirely. The essay's §6 "Implications for downstream phases" suggests DECIDE should examine "whether the criterion is intended to be purely cognitive or whether non-cognitive admissibility belongs alongside it as a separately-evaluable axis" — which itself implies the criterion could be encoded structurally now, not deferred.

*What would the reader need to believe for this alternative framing to be right?* The reader would need to believe that (a) the Outcome Test's felt character does not disqualify it from structural anchoring via the User-Tooling Layer, and that (b) the requirement to record exception conditions in cycle-status constitutes a sufficient structural artifact moment for manifest-and-assertion logic. Both are arguable on the available evidence.

**Alternative B: Frame ADR-084 as a permanent named companion-file standard rather than a per-artifact judgment pattern**

Essay 016 §4.1 notes that the practitioner consensus bifurcates by content-divergence threshold, and that `llms.txt` and `AGENTS.md` are standardized naming conventions with established tooling support (Howard 2024). ADR-084 creates its own naming convention (`<artifact>.agents.md`) rather than adopting either established convention. The source material could have supported framing the companion-file pattern as an alignment with existing conventions rather than as a new project-internal naming standard. Under this alternative framing, the `<artifact>.agents.md` convention would be named as provisional (pending alignment with emerging ecosystem conventions) rather than as the methodology's permanent choice.

*What would the reader need to believe for this framing to be right?* The reader would need to believe that `llms.txt` and `AGENTS.md` conventions will stabilize enough to be worth aligning with, and that the methodology's convention-setting function is better served by ecosystem alignment than by naming autonomy.

**Alternative C: Frame ADR-087's validation-spike encoding as a Tier 1 mechanism with the research → discover gate as its structural anchor**

The research-gate reflection records a DISCOVER requirement: "DISCOVER must belief-map the cognitive-economy constraint directly." The gate itself is a structured epistemic moment where practitioner judgment is exercised. ADR-087 encodes validation spikes as optional with a "felt" trigger at the research → discover gate, but notes the trigger fires "at the research → discover gate." The gate is already a step-anchored position in skill text. Under an alternative framing, the spike-or-justified-rejection decision could be encoded as a User-Tooling Layer mechanism requiring a canonical-path decision record at the gate (similar to how gate reflection notes are required). This would make the decision visible and auditable without mandating spike execution. ADR-087's Rejected alternatives section considers and rejects "Encode validation spikes as Tier 1 unconditional with the trigger condition as the structural anchor" — but the rejection argues against mandating spike execution, not against mandating a visible decision record. These are distinguishable alternatives the rejection collapses.

*What would the reader need to believe for this framing to be right?* The reader would need to believe that requiring a visible decision record at the research → discover gate (spike-or-rejected-with-rationale) is meaningfully different from mandating spike execution, and that the former is not a "ceremonial-compliance ritual" as ADR-087's rejection argues.

---

### Question 2: What truths were available but not featured?

**Truth A: Essay 016's qualification on Ernst & Robillard (2023) scope is understated in the ADRs**

The essay is explicit and careful: the Ernst & Robillard (2023) finding that prior familiarity dominates documentation format effects was demonstrated for "applied and creative tasks" — not for orientation-level comprehension by zero-prior-exposure readers. Essay 016 §3 names this scope qualification explicitly: "Whether prior-familiarity dominance generalizes to that scenario is not directly tested by the study and remains open." Essay 016 §5 names it as the most consequential surviving research gap. But ADR-083 cites the in-place-first default and the bolt-on / felt-additional signal as evidence-supported without noting that the primary empirical anchor (Ernst & Robillard) does not directly study the exact scenario (first-encounter orientation) the ADR's recommendations address. The ADRs' confidence in the context-mismatch diagnosis is higher than the essay's own confidence warrant. This is not a distortion — the essay reaches the same conclusion directionally — but the ADRs inherit the conclusions without the epistemic caveats.

Where it appears in source material: essay 016 §3 final paragraph, §5 first paragraph. Reason for exclusion: ADRs typically inherit conclusions from essays rather than repeating the essay's uncertainty analysis. Would its inclusion change the argument? It would soften the ADR's claim authority — the in-place-first default would be presented as a well-supported directional commitment rather than as an evidence-established conclusion.

**Truth B: The "threading the needle is failing" alternative (Assumption Inversion A3) was held live but is absent from the ADRs**

Product-discovery Assumption Inversion A3 records "the threading is wrong in principle" (Nguyen et al. 2025) as a live alternative the cycle explicitly did not adopt but kept open. The discover-gate reflection confirms: "The 'threading is wrong in principle' alternative (Nguyen et al. 2025, A3 Assumption Inversion) is explicitly recorded as not adopted." ADR-083 and ADR-084 both encode in-place layering as the preferred approach — which is a form of threading — but neither acknowledges that the "threading is wrong in principle" alternative exists as a live live and named competing view the cycle's evidence did not fully close. A reader who encounters ADR-083 and ADR-084 has no path to the A3 alternative.

Where it appears in source material: product-discovery Assumption Inversion A3; discover-gate reflection commitment gating outputs. Reason for exclusion: ADRs resolve rather than enumerate. Would its inclusion change the argument? It would not reverse the decision but would make the argument's alternative-engagement more visible.

**Truth C: ADR-083's exception conditions were entirely agent-composed and not gate-examined**

The four named exception conditions in ADR-083 §4 are described in the provenance check as "agent composition; the individual conditions are driver-derived." The discover-gate and model-gate reflections do not record any examination of the exception conditions as a group. Each exception traces to individual driver findings, but the act of assembling them into a named enumeration (audience asymmetry, content-divergence threshold, documentation fatigue, zero-prior-familiarity cohort) is agent composition. This enumeration is the load-bearing structure that makes the methodology-wide default actionable — "the conditions under which deviation is permitted" is not a minor detail. The MODEL snapshot Feed-forward B specifically warned that the criterion must "distinguish between a methodology-wide default with explicitly named conditions for per-project deviation, and pure per-project judgment with no default" — but it did not call for the exception conditions to be gate-examined.

Where it appears in source material: ADR-083 provenance check; MODEL snapshot Feed-forward B. Reason for exclusion: the gate structure correctly deferred the exception-condition enumeration to DECIDE. Would its inclusion change the argument? It would make visible that the exception conditions are agent-proposed and could be added to, removed from, or reordered by practitioners who observe the methodology in use — they are not authoritatively closed.

---

### Question 3: What would change if the dominant framing were inverted?

**Inversion: In-place-first is the conservative choice, not the progressive one**

ADR-083's dominant framing positions in-place restructuring as the right default and bolt-on additions as the failure mode. The framing presents in-place restructuring as a progressive intervention (improving what exists) and addition as a conservative impulse (adding workarounds for thick docs).

Inverting this: in-place restructuring is actually the conservative choice — it preserves the current corpus structure, keeps the same artifact count, and defers the question of whether the corpus design is fundamentally adequate. Adding a brief purpose-built artifact is the more progressive choice: it concedes that the existing corpus has structural limits that cannot be fixed through restructuring alone and proposes a new solution space. Under the inverted framing:

- The bolt-on / felt-additional signal becomes a signal that the practitioner is considering genuine structural innovation, which the in-place-first default dismisses prematurely.
- The exception conditions in ADR-083 §4 become the primary cases rather than edge cases — they are the situations where the in-place-first default's conservatism is insufficient.
- What becomes weaker: the bolt-on signal's validity as a failure-mode detector. If the practitioner is feeling that an artifact "feels additional," this might indicate the corpus's type-based organization is itself the problem (not that the artifact is wrong).
- What becomes more salient: essay 016 §4.5's brief mention of "genuine zero-prior-familiarity reader cohort with no established corpus access pattern" — if first-encounter readers cannot navigate in-place improvements, in-place restructuring has structural limits.

For ADR-083 to take the inverted framing seriously, it would need to address: under what conditions does in-place restructuring fail even when applied well? The current ADR names exception conditions but does not explicitly name the failure mode of the in-place-first default itself.

---

### Framing Issues

**F-P2.1 — ADR-083: The bolt-on / felt-additional signal's scope is wider than its provenance**

- **Location:** ADR-083 §3, "Bolt-on / felt-additional as the failure-mode signal"
- **Observation:** The signal was surfaced specifically in the context of brief on-ramp documents for zero-prior-familiarity readers (the discover-gate belief-mapping response). The ADR extends the signal to all candidate human-facing artifacts. The extension is reasonable but the signal's provenance was narrow — it emerged from a specific gate challenge about a specific artifact type (on-ramps). Whether the felt-additional quality is equally reliable as a signal for companion files, visual corpus maps, or in-document orientation leads is not examined. Companion files (Pattern B in ADR-084) are explicitly additive by design — they are supposed to "feel additional" at the structural level, but they are the approved addition pattern. The ADR does not explain how to distinguish "companion file feels additional" (acceptable by ADR-084) from "on-ramp doc feels additional" (failure-mode signal per ADR-083).
- **Recommendation:** Add a brief clarification in ADR-083 §3 noting that the bolt-on signal applies to candidate human-facing artifacts in the human reading path, not to companion files (agent-facing additions), which are additive by design under ADR-084. This prevents the signal from being applied so broadly it catches the companion-file pattern itself.

**F-P2.2 — ADR-086: The essay's "candidate territory" framing for AI-as-orienter is not visible in the ADR**

- **Location:** ADR-086 Context section; essay 016 §4.5
- **Observation:** Essay 016 §4.5 describes agent-mediated orientation as "candidate territory for downstream phases" — explicitly prospective and exploratory. The ADR's non-adoption framing is structured as a resolved decision with named future-cycle conditions for revisiting. This is the right outcome but the framing shift from "candidate explored" to "non-adoption decided" is not acknowledged. The discover-gate reflection records "AI-as-orienter / AI-as-prosthetic operational separation criterion — adoption of agent-mediated orientation blocked on this; held for DECIDE." The blocking was conditional ("blocked at DECIDE on whether the operational-criterion problem can be solved"), not a predetermined non-adoption — the gate left the question open. The ADR correctly addresses the DECIDE question, but the tone shifts from the gate's exploratory posture to a more final disposition that could make future-cycle revisiting feel like overturning a settled decision rather than addressing a held question.
- **Recommendation:** This is a framing judgment for the user. The non-adoption is reasoned and sound; the question is whether presenting it as a conditional non-adoption with explicit future-cycle conditions (the current structure) is sufficient, or whether it should also note that the gate held this as an open question where adoption remained possible. The current framing is accurate but could be perceived as more final than the gate intended.

**F-P3.1 — ADR-084: The `<artifact>.agents.md` naming convention is agent-composed against conventions that are still evolving**

- **Location:** ADR-084 Provenance check; ADR-084 Pattern B definition
- **Observation:** The provenance check correctly labels the naming convention as "agent composition; essay-grounded for the convention category." The essay cites `llms.txt` (Howard 2024) and `AGENTS.md` as the established conventions, but neither of these uses the `<artifact>.agents.md` form. `llms.txt` is a root-level summary file; `AGENTS.md` is a project-level instruction file. The `<artifact>.agents.md` pattern extrapolates from these to a per-artifact companion-file convention that does not directly mirror either established form. This is reasonable extrapolation, but practitioners from the `llms.txt` or `AGENTS.md` ecosystems may not recognize `system-design.agents.md` as a conventional companion form. This is a minor framing observation — the convention is pragmatically sound — but its novelty relative to the established conventions it cites is worth acknowledging.
- **Recommendation:** Note in ADR-084 that the `<artifact>.agents.md` convention is an RDD-specific extrapolation from the `llms.txt` / `AGENTS.md` naming pattern rather than an adoption of either convention directly. This is an honest scope-of-claim note, not a correction.

---

### Cross-ADR Coherence Assessment

The eight ADRs are internally coherent on the major decision axes. Specific cross-ADR verifications:

**ADR-083 exception conditions vs. ADR-084 per-artifact threshold:** The content-divergence threshold exception in ADR-083 §4 explicitly cites "ADR-084's companion-file pattern applies as a structured exception that does not violate the in-place-first default." This is correctly coordinated — when Pattern B applies, the companion file is a named exception to in-place-first, not a bolt-on violation of it.

**ADR-085 deferred-sweep handling vs. ADR-074 fitness property:** ADR-085's deferred sweeps are each attributed to natural regeneration moments and explicitly recorded with rationale — consistent with ADR-074's fitness property requirement. The deferred-sweep rationale is recorded.

**ADR-088 and ADR-089 producing a coherent v0.8.3 picture together:** The two ADRs together update the implementing ADR (ADR-064 via ADR-088) and the classifying ADR (ADR-067 via ADR-089) consistently. Both shift from blocking to advisory and from impossibility to detectability. The amendment language in ADR-089's classification table row uses the exact formulation derived from ADR-088's amended claim. The pair is coherent.

**ADR-083 exception conditions vs. ADR-090 role shift:** ADR-090 does not interact with ADR-083's exception conditions. No coherence concern.

**ADR-086 non-adoption vs. ADR-083 Outcome Test:** ADR-086 §2 explicitly states that agent-mediated orientation as a candidate intervention "fails the test specifically because its outcome is unverifiable." This correctly applies ADR-083's Outcome Test to the AI-as-orienter question and the cross-ADR reasoning is sound.

---

### Supersession-Workflow Conformance Assessment (ADR-074)

**ADR-085 superseding ADR-070:**
- Header format: correct blockquote form with date and one-line summary. ✓
- Status field: "Updated by ADR-085" in ADR-070. ✓
- Partial vs. total: correctly marked as partial supersession (IETF Updates analog). ✓
- Body immutability: ADR-070's body is preserved. ✓
- Downstream sweep: four artifacts listed with explicit deferred rationale. ✓

**ADR-088 superseding ADR-064:**
- Header format: correct blockquote form with date and multi-point summary. ✓
- Status field: "Updated by ADR-088" in ADR-064. ✓
- Partial vs. total: correctly marked as partial supersession. ✓
- Body immutability: ADR-064's body is preserved (path references in body are now historical — see P1 issue above). ✓ / ⚠ (P1 issue)
- Downstream sweep: four artifacts listed with explicit deferred rationale and "At MODEL Amendment 22 in this cycle" for domain-model. ✓

**ADR-089 superseding ADR-067:**
- Header format: correct blockquote form with date and summary. ✓
- Status field: "Updated by ADR-089" in ADR-067. ✓
- Partial vs. total: correctly marked as partial supersession. ✓
- Body immutability: ADR-067's body is preserved. ✓
- Downstream sweep: four artifacts listed including domain-model at Amendment 22. ✓

All three supersession workflows conform to ADR-074's body-immutable / status-mutable rule and use the correct "Updated by" (not "Superseded by") header format for partial supersessions. The ADR-074 conformance check passes on format; the P1 issue is a consequence of the migration creating historical stale paths in an immutable body, not a workflow violation.

---

### MODEL Snapshot Feed-forward Discharge Assessment

**Feed-forward A (the folded-vs-standalone alternatives sentence):** Discharged in ADR-083 Rejected alternatives. The condition under which four standalone concepts would have served better is named explicitly: "if the cognitive-economy ADR's primary citations were to individual co-mechanisms each addressed by separate intervention patterns, with the unified mechanism playing no load-bearing role." The finding is that the condition is not met. Feed-forward A is substantively discharged.

**Feed-forward B (methodology-wide default with named exceptions form):** Discharged in ADR-083 §4. The ADR explicitly chooses the methodology-wide default with named exceptions over pure per-project judgment, names the distinction, and encodes exception conditions. The MODEL gate's Feed-forward B is substantively discharged. The concern about whether the exception conditions are sufficiently specified is noted in P2-Issue 2.1 above but does not reverse the discharge.

### RESEARCH Grounding Reframe Target 2 Discharge Assessment

**Target 2 (the Beck-port reframe):** Substantively discharged in ADR-087 §1. The ADR explicitly names the Beck port as "a useful conceptual frame" but "not load-bearing structural evidence," distinguishes the compressed-feedback-horizon claim as unverified, identifies the reusability assumption as conditional on continuous corpus stewardship, and names the cycle-as-instance reflection as the strongest evidence the claim is untested. This is not a ceremonial nod — it is a calibration of the frame that reduces the methodological reliance on an unverified analogy. The concrete probe requirement (name one claim from §4.5 a spike could test) is addressed in §2 with three examples, two of which are §4.5-sourced (P3-Issue 2.3 notes the §4.1 displacement). Target 2 is substantively discharged.

---

### Driver-Derivation Provenance Assessment

The provenance checks across all eight ADRs are detailed and use consistent attribution categories (user-surfaced, driver-derived, agent composition, snapshot-derived, implementation-derived). No gaps between the provenance check claims and the actual source material were found that rise above P3 level. Specific verifications:

- ADR-083's core framings (Outcome Test, in-place-first, bolt-on) are correctly attributed to the discover-gate belief-mapping response. ✓
- ADR-084's two-pattern catalog is correctly attributed to essay 016 §4.1. ✓
- ADR-085's `.rdd/` placement is correctly attributed to the discover-gate user response. ✓
- ADR-086's conceptual framing and operational-criterion barrier are correctly attributed to essay 016 §4.5. ✓
- ADR-087's Target 2 and cycle-as-instance reflection are correctly attributed to reflection 016. ✓
- ADR-088's diagnosis (blocking was never effective) is correctly attributed to the user at Pause 2. ✓
- ADR-089's diagnosis (ADR-067 amendment owed) is correctly attributed to cycle-status.md feed-forward signal. ✓
- ADR-090's role-shift diagnosis is correctly attributed to user at Pause 2. ✓

One minor observation: ADR-086's second failure mode ("indistinguishability at usage time") is correctly marked as agent-composed, but the provenance check describes it as "agent-composed against the practitioner-vs-agent observability question that the literature does not directly address" — the language "does not directly address" understates the degree to which this is a hypothesis rather than a literature gap. The literature does address agent-vs-practitioner observability in adjacent domains (decision-support literature, clinical decision aid literature) without directly settling the AI-as-orienter distinction. This is flagged at P2 level (Issue 2.2) rather than as a provenance error.
