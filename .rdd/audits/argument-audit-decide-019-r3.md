# Argument Audit Report — Cycle 019 DECIDE (R3 narrow)

**Audited document:** `docs/decisions/adr-097-empirical-grounding-filter-at-decide.md` (consolidated)
**R1/R2 reference:** five-ADR set; R2 verdict TRIGGERED on five-ADR set, not on consolidated form.
**Genre:** ADR (consolidated single ADR).
**Date:** 2026-05-22.

## Section 1: Argument Audit

### R1+R2 Finding Preservation Verification

All 14 prior findings (2 P1 + 6 P2 + 3 P3 from R1; 1 P2 + 1 P3 from R2) verified preserved in consolidated form. No repair regression.

### P1 — Must Fix

**None.**

### P2 — Should Fix

**P2-R3-1: Agent Outcome Test absent from ADR-097 Decision and Encoding sections despite gate-reflection commitment.** The gate reflection committed to "Agent Outcome Test scope folded into the Decision section as scope-noted vocabulary." The phrase "Agent Outcome Test" does not appear in the Decision body, and the concept is missing from the Encoding section's domain-model concept list. The P1-A discriminating-criterion repair (which lived in ADR-095's Decision) is orphaned. Recommendation: add scope-note to Named-deferrals (or create a Scope-noted vocabulary paragraph) recognizing the Agent Outcome Test as a future-cycle candidate distinct from FF1/FF3 (those are methodology-audit gaps; this is a methodology-extension candidate).

**P2-R3-2: C7-at-corpus-level claim asymmetric placement.** Context section presents the claim as confident diagnosis; Provenance check + Three-Application F-P2 section qualify it as drafting-time synthesis. A reader of only the Context (standard ADR reading path) receives misleading certainty. Recommendation: add a parenthetical qualifier in the Context section's final paragraph linking forward to the Three-Application F-P2 Pattern section.

**P2-R3-3: Form-change baseline-reset gap.** ADR-094's saturation-signal verdict criteria were designed for iterative in-place revision. The consolidation is a form-change event (five-ADR set → consolidated ADR-097); the R2 TRIGGERED verdict on the five-ADR set cannot carry over. The ADR provides no guidance for this case, creating an underdetermined trigger condition. Recommendation: add one sentence to the Workflow scaffolding block specifying that form-change events reset the round-count baseline — the first audit on the new form is treated as R1 for saturation-signal purposes.

### P3 — Consider

**P3-R3-1:** Negative consequence bullet on under-documentation should name the audit trail (`argument-audit-decide-019.md` + r2 + r3) as the recovery path for implementation-choice rationale, not only essay-outline-018 §10.

**P3-R3-2:** Graduation trigger conditional ("if graduation triggers do not fire despite their conditions being met") may be misread as "if the triggers fail to be observed" rather than "if the conditions are met but the practitioners do not respond." Optional clarification language about honest assessment.

## Section 2: Framing Audit

### Framing findings (surface to user, do NOT auto-correct)

**FA-R3-P1 (P1 framing):** Rejected Alternatives section does not include the "five ADRs plus reading-path document" option. The DECIDE gate's three offered options (collapse / delete four / ship zero) did not include "keep five ADRs while addressing the working-memory-budget concern through a reading-path or summary artifact." The practitioner's concern was reading burden, not architectural clarity; an ORIENTATION.md-style index for the cycle's ADR set could have addressed the reading burden without structural deletion. This option's absence from the Rejected Alternatives is a framing gap. Whether including and rejecting it would change the consolidation conclusion is the practitioner's judgment. Recommendation: surface to user; add Rejected Alternative F if the user can supply a rejection reason, or acknowledge the gap as a framing finding.

**FA-R3-P2 (P2 framing):** C7-at-corpus-level claim asymmetric placement (related to P2-R3-2 but framing-coded). A forward reference from Context to Provenance check would align reading-order with epistemic ordering.

**FA-R3-P3 (P3 framing):** Agent Outcome Test gate-commitment gap (related to P2-R3-1 but framing-coded). The absence of the scope-note is not just an argument-audit omission — it is also a visible gap between the gate commitment and the artifact a reader can detect by comparing the two documents.

## Convergence-Saturation Signal (R3 — Dogfooding)

Per P2-R3-3, this R3 is the first audit on the consolidated form (form-change baseline reset). Verdict:
- P1 count this round: 0
- P2-new count: 3 (P2-R3-1, P2-R3-2, P2-R3-3) — exceeds ≤1 threshold
- New framings: 1 P1 + 1 P2 + 1 P3 framing finding (FA-R3-P1 / P2 / P3)
- Recommendation: **CONTINUE** — saturation signal does NOT fire. Apply corrections; re-audit (R4 narrow) after corrections.

**Dogfooding note:** had the R2 TRIGGERED verdict been treated as carrying over to the consolidated form, the signal would have fired on the wrong baseline. The form-change baseline-reset rule (P2-R3-3) is load-bearing.
