# ADR-098: Methodology-Level Audit Gap — Named Deferrals (FF1 + FF3)

**Status:** Accepted

## Context

The Cycle 019 MODEL → DECIDE susceptibility snapshot (`susceptibility-snapshot-019-model.md`) named two methodology-level feed-forward findings the cycle must address explicitly:

- **FF1 — Practitioner-originated framing audit gap.** The methodology's specialist subagents (citation-auditor, argument-auditor, framing-auditor, research-methods-reviewer, susceptibility-snapshot-evaluator) cover agent-produced claims and phase-boundary transitions. Practitioner-originated framings at gate responses are not audited; the gate is the only check. Cycle 019's MODEL gate demonstrated the gap at scale — four practitioner-originated framings encoded into the domain model and two applied as backward propagation into the Essay-Outline, all without specialist audit coverage. The agent surfaced the susceptibility pattern three times during the gate but did not block encoding. Surfacing-without-blocking is best-effort advisory, not structural per Invariant 8.
- **FF3 — Essay-Outline amendment re-audit protocol.** The MODEL gate applied backward propagation to the RESEARCH artifact (W7.1 mechanism-vs-outcome distinction; W7.3 Distributed Remedy Architecture; §9 provenance) at the practitioner's request, without re-dispatch of specialist auditors. The R5 audit (`argument-audit-019-r5.md`) was dispatched only because the susceptibility snapshot recommended it; the methodology has no protocol for triggering narrow re-audit when in-place amendments to RESEARCH artifacts during downstream phases materially alter the artifact's evidence characterization.

The MODEL gate's operating evidence is direct: the R5 audit caught the Boundary 1 / Reverse Boundary 1 pyramid violation (P1-R5-1: Abstract C7 DECIDE-primary vs. amended W7.3 PLAY-primary) and the DECIDE-primary alternative engagement gap (F-R5-P1). Both findings vindicated the snapshot's concerns and operationalized the post-gate re-audit as the compound defense the in-gate mechanism could not provide.

The orchestrator's brief at DECIDE entry required: *"DECIDE either accepts this characterization explicitly or scopes a future-cycle methodology amendment that addresses it structurally — as a named decision, not an open question."* This ADR is the named decision.

The cycle's evidence base for FF1 + FF3 is **single-cycle direct evidence** — one MODEL gate producing four framings; one R5 audit catching one pyramid violation and one framing-engagement gap. By the Empirical-Grounding Filter (ADR-097), single-cycle direct evidence supports recognition-naming-pattern-as-methodology-vocabulary but does not yet support structural enforcement.

## Decision

The methodology **records FF1 and FF3 as recognized audit gaps** at the methodology-vocabulary level and **defers their structural amendment to a future cycle** with explicit named conditions for graduation.

### FF1 — Practitioner-originated framing audit gap

**Recognition (this cycle):**
- The gap is named in the domain model: **Practitioner-Originated Framing Absorption** as named concept (Amendment #25, Cycle 019 MODEL phase). The Cycle 019 MODEL gate is recorded as the principal demonstration instance.
- The susceptibility snapshot at phase boundaries is acknowledged as **best-effort advisory** for this class of finding, not structural per Invariant 8.
- The R5 audit pattern (post-gate narrow re-audit when the susceptibility snapshot recommends it) is the cycle's demonstrated compound defense.

**Structural amendment deferred. Graduation trigger (two-direction, per R2 audit P2-6 2026-05-22):**

**Primary trigger (harm evidence):**
- Multi-cycle evidence of practitioner-originated framing absorption at MODEL or later phases. Specifically: 2–4 cycles in which the susceptibility snapshot at a phase boundary surfaces practitioner-framing absorption AND the practitioner does not pursue the recommended grounding action, AND a downstream phase (or the cycle's BUILD output) demonstrates the absorbed framing was the failure mode the snapshot identified.

**Supplementary trigger (reliance evidence):**
- If 2–4 cycles run the recommended grounding action per the susceptibility snapshot and the action **consistently catches material findings** (P1 or structural P2 findings on the absorbed framings), this is itself evidence that the protocol is relied-upon and should be structurally anchored.

When the graduation trigger fires (in either direction), the candidate Skill-Structure Layer amendment is: a lightweight directed belief-mapping question at the artifact-encoding moment within each phase skill. A future-cycle ADR would specify the belief-mapping question's dispatch point in `/rdd-model`, `/rdd-decide`, and `/rdd-architect` skill text.

### FF3 — Essay-Outline amendment re-audit protocol

**Recognition (this cycle):**
- The gap is named in the cycle's record: backward propagation events to RESEARCH artifacts during downstream phases warrant narrow re-audit of the amended warrants. The Cycle 019 R5 audit operationally demonstrated the gap and its closure.
- The Essay-Outline §9 (R5 audit narrowing entry, 2026-05-22) records the operational demonstration as the cycle's audit-trail closure.

**Structural amendment deferred. Graduation trigger (two-direction):**

**Primary trigger (harm evidence):**
- Multi-cycle evidence of in-place amendments to RESEARCH artifacts during downstream phases. Specifically: 2–4 cycles in which the MODEL gate or a later phase applies in-place amendments to RESEARCH-phase artifact warrants, AND in which the amendments would have benefited from narrow re-audit but the cycle did not run one.

**Supplementary trigger (reliance evidence):**
- If 2–4 cycles run the narrow re-audit per the susceptibility snapshot's recommendation — i.e., the correct behavior — and the re-audit **consistently catches material findings** (P1 or structural P2 findings on backward-propagation amendments), this is itself evidence that the protocol is relied-upon and should be structurally anchored rather than advisory.

The two triggers together close the asymmetry the primary-only trigger would create (cycles running the re-audit correctly would accumulate no graduation-trigger evidence; the methodology could fail to amend even when the protocol is demonstrably reliable). The graduation trigger fires in either direction.

When the graduation trigger fires, the candidate Skill-Structure Layer amendment is: a phase-skill addition that backward propagation events trigger narrow re-audit of the amended warrants as a workflow step at phase-exit. A future-cycle ADR would specify the trigger conditions, the narrow-audit scope, and the dispatch point in the phase skill.

### Why not ship the structural amendments in Cycle 019

Per ADR-097's Empirical-Grounding Filter applied reflexively to this ADR's scope choice:

- FF1's evidence base is one MODEL gate (Cycle 019). Single-cycle evidence supports recognition-naming-pattern-as-methodology-vocabulary; it does not yet support structural enforcement. Shipping a Skill-Structure Layer amendment from single-cycle evidence would instantiate the C7 pattern this cycle's research names.
- FF3's evidence base is the same single MODEL gate (Cycle 019) and the R5 audit closure. The pattern is named once and demonstrated once; structural enforcement requires multi-cycle evidence that the pattern recurs and that the structural mechanism would catch what the in-cycle mechanisms miss.

The named-deferral with explicit graduation trigger honors the orchestrator's "named decision, not open question" requirement while staying within the cycle's evidentiary warrant.

### Three-Application F-P2 Pattern (continued)

ADR-097's rationale held the Three-Application F-P2 Pattern as the question DECIDE acknowledges explicitly. **The cycle's scope-limiting choices now total six (per R2 audit P3-3 2026-05-22):** (1) R3 framing-finding downgrade of ADR-019.4 from Skill-Structure Layer to Tier-2; (2) gate response on Target 1 (entry-side question routed to Right-Sizing Post-PLAY); (3) DISCOVER-gate Tier-2 endorsement of ADR-019.4 scope; (4) R5 narrowing of Distributed Remedy Architecture to candidate framing; (5) ADR-097's fifth-ADR carry-forward decision; (6) this ADR's FF1 + FF3 named-deferrals. The pattern's name ("Three-Application F-P2") is preserved as the cycle's vocabulary, but the count has grown beyond the original three. The cycle's stance is consistent with ADR-097's: the pattern is held, not resolved; the multi-cycle graduation triggers for ADR-097, ADR-095, and ADR-098 are the conditions under which the pattern's coherent-application vs. content-selection reading becomes assessable.

## Rejected alternatives

**A. Ship a Skill-Structure Layer amendment for FF1 (belief-mapping at artifact-encoding moments) in Cycle 019.** Rejected because the evidence base is one MODEL gate. The candidate amendment is well-formed (insert a belief-mapping question at named workflow steps in `/rdd-model`, `/rdd-decide`, `/rdd-architect`) but the evidentiary warrant for the structural commitment is below ADR-097's Empirical-Grounding Filter criterion at this evidence level. The named-deferral with graduation trigger is the evidence-supported scope.

**B. Ship a Skill-Structure Layer amendment for FF3 (Essay-Outline amendment triggers narrow re-audit) in Cycle 019.** Rejected for the same reason. The candidate amendment is well-formed (a phase-skill workflow step at phase-exit that triggers narrow re-audit when backward propagation events occurred during the phase) but the evidentiary warrant is single-cycle.

**C. Treat FF1 and FF3 as open questions in the domain model and not file an ADR.** Rejected because the orchestrator's brief explicitly required a named decision. The named-deferral is the named decision; the graduation triggers are the explicit scope for the future amendment.

**D. Bundle FF1 and FF3 with ADR-097's graduation trigger.** Rejected because FF1 and FF3 are methodology-level audit gaps distinct from ADR-097's filter-graduation trigger. ADR-097's graduation trigger is about kitchen-sink-failure-mode persistence across cycles; ADR-098's graduation triggers are about practitioner-originated framing absorption and Essay-Outline amendment frequency.

**E. Defer to a future cycle without naming graduation triggers.** Rejected because the methodology's posture is to make deferrals explicit. A deferral without named graduation conditions is operationally equivalent to "we hope this resolves itself" — a non-decision the orchestrator's brief explicitly disallowed.

## Consequences

**Positive:**
- The two methodology-level audit gaps are recorded as named recognitions, not silent open questions.
- The graduation triggers name the multi-cycle evidence conditions under which structural amendments would be filed — future cycles can measure against the triggers explicitly.
- The R5 audit pattern (post-gate narrow re-audit on susceptibility-snapshot recommendation) is named so future cycles can recognize it as a response class available when backward propagation events occur at gate conversations. **The pattern's reliability depends on the orchestrator applying the susceptibility snapshot's recommendation — it is not structurally enforced (per R2 audit P2-5 2026-05-22).** Future cycles should treat the pattern as available but not guaranteed; the Neutral consequence below names the structural limit.
- The cycle's reflexive criterion (ADR-097's Empirical-Grounding Filter) is applied to the methodology-amendment scope itself — coherent application across the cycle's scope choices.

**Negative:**
- The named-deferral is itself potentially a sixth instance of the Three-Application F-P2 Pattern (per the six-application count above). The cycle's evidence base cannot resolve whether this is coherent application or content-selection.
- The current methodology operating posture for FF1 — surfacing-without-blocking at the gate — is best-effort advisory, not Tier-1 architectural-isolation defense. The honest characterization is held explicitly; the limit is named.
- The named-deferral relies on multi-cycle evidence accruing across future cycles. If future cycles do not produce the evidence, the graduation triggers may never fire, leaving the gaps as recognized-but-deferred indefinitely.

**Neutral:**
- The R5 audit pattern as the cycle's current compound defense is a Skill-Structure Layer mechanism in spirit (the susceptibility snapshot's recommendation is the dispatch event) but is not encoded as a workflow step in any skill. It operated in Cycle 019 because the orchestrator-judgment-applied to dispatch the snapshot, present its findings, and respect the user's grounding-action choice. The mechanism's reliability depends on the orchestrator continuing to apply this judgment.

## Provenance check

- **Practitioner-Originated Framing Absorption** as named concept: domain model Amendment #25 (Cycle 019, MODEL phase).
- **Three-Application F-P2 Pattern** as named concept: domain model Amendment #25 (Cycle 019, MODEL phase).
- **MODEL → DECIDE susceptibility snapshot FF1 + FF3**: `.rdd/audits/susceptibility-snapshot-019-model.md`.
- **R5 audit operational evidence**: `.rdd/audits/argument-audit-019-r5.md`.
- **MODEL gate reflection note addendum** recording the R5 narrowing: `.rdd/gates/019-model-gate.md`.
- **Empirical-Grounding Filter reflexive application**: ADR-097.
- **Driver chain:** MODEL snapshot FF1 + FF3 + R5 audit operational evidence + orchestrator's DECIDE-brief requirement → ADR-098.

Drafting-time synthesis (not from the driver chain): the specific phrasing of the graduation triggers, the candidate Skill-Structure Layer amendments' shape, and the reflexive-application argument structure connecting ADR-098's deferral to ADR-097's filter are drafting-time synthesis.
