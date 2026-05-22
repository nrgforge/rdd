# Argument Audit Report — Cycle 019 DECIDE

**Audited documents:**
- `docs/decisions/adr-094-audit-round-count-convergence-saturation.md` (019.1)
- `docs/decisions/adr-095-agent-outcome-test.md` (019.2)
- `docs/decisions/adr-096-research-patch-switching-criterion.md` (019.3)
- `docs/decisions/adr-097-empirical-grounding-filter-at-decide.md` (019.4)
- `docs/decisions/adr-098-methodology-audit-gap-deferrals.md` (FF1 + FF3)

**Source material:**
- `docs/essays/essay-outline-018-does-rdd-over-engineer.md` (R5 narrowed 2026-05-22)
- `docs/domain-model.md` (Amendments #25 + #26)
- `.rdd/audits/argument-audit-019-r5.md`
- `.rdd/audits/susceptibility-snapshot-019-model.md`
- `docs/product-discovery.md` (Cycle 019 update)

**Genre:** ADR set (five ADRs)
**Date:** 2026-05-22

---

## Section 1: Argument Audit

### Summary

- Argument chains mapped: 5 (one per ADR)
- Issues found: 11 (P1: 2, P2: 6, P3: 3)

### P1 — Must Fix

**P1-A: ADR-095 inherits the discriminating-criterion gap it cannot resolve and does not acknowledge this as a gap in the ADR itself's Decision section.** The Consequences section is more honest than the Decision section. Move the discriminating-criterion acknowledgment into the Decision section, parallel to ADR-097's Target 2 handling. The test fails when the consumer description is so broad it covers every artifact ("future practitioners re-reading this cycle"). The Decision should name what a trivially-passing answer looks like vs. a genuine one — the felt-trigger is whether naming this specific consumer produces an actionable distinction.

**P1-B: ADR-097's four-path foundation for the standalone-decision (Target 3) contains a circularity that the ADR does not name.** Path 4 (structural operationalization) is itself a downstream BUILD-phase activity, not a DECIDE-time filter. The standalone claim conflates "standalone at commitment-time" (no PLAY required to commit; true) with "standalone for grounding completion" (grounding may arrive at BUILD via spikes; not established at DECIDE-time in all cases). The ADR should distinguish the two senses.

### P2 — Should Fix

- **P2-1 (ADR-094):** threshold values (P1=0; P2-new≤1) are drafting-time synthesis acknowledged in Provenance, but Decision encodes them as settled methodology without naming a calibration mechanism for future cycles. Add calibration trigger to Consequences.
- **P2-2 (ADR-094):** "no new framings" criterion treats agent-vs-practitioner framing discrimination as agent-computable, but Cycle 019's R5 demonstrated this is difficult. Either define "new framing" operationally or acknowledge the criterion is practitioner-judgment-anchored.
- **P2-3 (ADR-096):** "expected observation" question carries a practitioner-judgment gap the ADR names but doesn't structurally address. Add guidance distinguishing reflexive from genuine pre-mortem answers.
- **P2-4 (ADR-097):** F-P2 Pattern section discharges the "explicit naming" requirement but doesn't commit to graduation triggers as structural. Add sentence acknowledging an outside reader's content-selection reading and commit to graduation triggers as the structural test.
- **P2-5 (ADR-098):** internal contradiction — Positive consequence claims "Future cycles can apply the R5 audit pattern," Neutral consequence acknowledges it is not structural per Invariant 8. Revise Positive to remove the contradiction.
- **P2-6 (ADR-098):** FF3 graduation trigger fires only on harm evidence; cycles that correctly apply the re-audit accumulate no data toward the trigger. Add supplementary trigger for "reliance evidence" (re-audit consistently catching material findings).

### P3 — Consider

- **P3-1 (ADR-094):** distinguish standard-sequence rounds from re-audits-after-revision in the skill-text amendment guidance.
- **P3-2 (ADR-096):** clarify that the verdict-line's "Practitioner expected observation" field is elicited from the practitioner, not inferred by the agent.
- **P3-3 (ADR-098):** specify the F-P2 Pattern's count (six scope-limiting choices) for precision.

---

## Section 2: Framing Audit (surface to user, do NOT auto-correct)

### Alternative framings the evidence supports but the ADRs did not choose

**Alternative A — Skill-Structure Layer enforcement for ADR-097 at this evidence level.** Invariant 8 ("a specified mechanism is not a working mechanism") argues for minimal structural anchoring of the felt-trigger at ADR-drafting time, not vocabulary at Tier-2. A single workflow prompt — "Name one of the four grounding paths or annotate as Conditional Acceptance" — meets Invariant 8 without requiring thicker cross-project evidence. Under this framing, "thin evidence" is the wrong criterion for avoiding Skill-Structure Layer; the right criterion is whether mechanism reliability matters under task load (it always does).

**Alternative B — ADR-095 and ADR-097 merged as a single "Empirical Test for Artifact Commitment."** Three parallel Tier-2 felt-trigger tests (ADR-083 + ADR-095 + ADR-097) impose cognitive overhead the cycle does not examine. A single meta-criterion (name empirical grounding AND intended consumer for any new artifact) might be more proportionate to the calibration the cycle proposes.

**Alternative C — Convergence-Saturation Signal applied more broadly (Saturation-Aware Workflow principle).** ADR-094 and ADR-096 encode parallel saturation logic at different workflow positions. The general principle is not named; doing so would help future cycles extend the logic without requiring a new ADR per extension.

### Framing issues (severity-ranked)

**FA-P1 (P1 framing — surface to user):** The five ADRs do not examine whether three parallel Tier-2 felt-trigger tests (ADR-083 + ADR-095 + ADR-097) collectively exceed the cognitive budget at artifact-creation moments. This gap is directly relevant to the cycle's central research question (does RDD over-engineer its overhead?). The cycle's own conclusion (calibration is the answer) applies to the overhead of its own felt-trigger tests; the omission is consequential.

**FA-P2 (P2 framing — surface to user):** Cross-ADR tier-assignment asymmetry — stopping behaviors (ADR-094, ADR-096) at Skill-Structure Layer; grounding/filtering behaviors (ADR-095, ADR-097, ADR-098) at Tier-2. Stopping is mechanical; grounding requires judgment. The Skill-Structure Layer / Tier-2 split may reflect mechanism tractability rather than content-selection bias — but the analysis is not made explicit. Future cycles should examine whether any Tier-2 grounding test can be minimally structurally anchored (e.g., a single prompt at ADR-drafting time) without requiring thicker cross-project evidence.

**FA-P3 (P3 framing — surface to user):** The five ADRs collectively produce no mechanism that would have prevented the MODEL-gate Practitioner-Originated Framing Absorption pattern (FF1) the cycle documents as its principal susceptibility finding. ADR-098 names the gap and defers structural amendment; the other four ADRs do not reference FF1. The cycle's ADR outputs are proportional to the calibration-finding but not to the gate-framing-absorption finding.

---

## Verdict

**Two P1 argument-audit findings require correction before ADRs are accepted.** Six P2 + three P3 are agent-correctable refinements that improve the ADR set's evidential honesty. Three framing-audit findings surface to the user at the gate (FA-P1 is severity P1 because it is directly relevant to the cycle's central research question).

After corrections, re-audit is mandatory per orchestrator (re-audit-after-revision rule).

**Convergence-Saturation Signal (would be appended after R5 amendment to argument-auditor.md applies):** NOT TRIGGERED — 2 P1 + 6 P2 + 3 P3 + 3 framing findings; new framing-audit alternative framings introduced. Recommendation: CONTINUE to next round after corrections applied.
