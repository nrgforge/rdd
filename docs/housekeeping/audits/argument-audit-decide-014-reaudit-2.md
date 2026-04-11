# Argument Re-Audit Report 2 — Cycle 10 DECIDE

**Audited document:** `docs/decisions/adr-064-compound-check-hooks.md` (targeted to Hook 2 Step 2 fix)
**Source material:** `docs/decisions/adr-063-per-phase-manifest-format.md`, `docs/essays/014-specification-execution-gap.md`
**Date:** 2026-04-09
**Prior audits:**
  - `docs/essays/audits/argument-audit-decide-014.md` (original)
  - `docs/essays/audits/argument-audit-decide-014-reaudit.md` (first re-audit)

---

## Summary

**Argument chains mapped:** 4
**Issues found:** 0
- **P1:** 0
- **P2:** 0
- **P3:** 0
- **Framing concerns:** 3 (FC-A, FC-B, FC-C — unchanged, surfaced to user at gate)

---

## NI-1 Verification

**Status: RESOLVED**

**Current text at ADR-064 Hook 2 Step 2:**

> "Reads the current cycle number from the `**Cycle number:** NNN` field in `docs/cycle-status.md` (canonical mechanism per ADR-063). If that field is absent or unparseable, falls back to inferring the cycle from the highest `NNN-` prefix in `docs/essays/`. If neither is available, emits `allow`."

**Consistency with ADR-063 Design properties:**

ADR-063's "Cycle-aware via template substitution" design property specifies: "The Stop hook reads the cycle number from an explicit field in `cycle-status.md` (canonical mechanism); if that field is absent or unparseable, the hook falls back to inferring the cycle from the highest `NNN-` prefix in `docs/essays/`." It further specifies the field convention as `**Cycle number:** NNN`.

The revised Step 2 matches this exactly — same field name, same canonical-primary/inference-fallback ordering, same fail-safe terminal (`emits allow`). The attribution parenthetical ("canonical mechanism per ADR-063") is correct and creates a traceable cross-reference for implementers. CONSISTENT.

**Consistency with ADR-064 Negative Consequences cycle-token bullet:**

The Negative Consequences bullet reads: "The `{cycle}` token resolution via cycle-status is the canonical mechanism, with essay-prefix inference as fallback." The revised Step 2 instantiates this commitment in the implementation steps with the correct primary/fallback ordering. The three documents that carry this commitment (ADR-063 Design properties, ADR-064 Negative Consequences, ADR-064 Hook 2 Step 2) now state the same mechanism in the same order. CONSISTENT.

**Consistency with ADR-064 Advisory mode subsection:**

The Advisory mode subsection does not independently specify cycle number detection logic — it governs whether the compound cross-reference runs, not the cycle resolution mechanism. Hook 2 Step 1 (reads `docs/cycle-status.md` for the current phase) is unchanged and still precedes Step 2. The Advisory mode detection logic (based on presence of `docs/housekeeping/.migration-version`) is separate from and does not depend on the cycle number resolution mechanism. No conflict. CONSISTENT.

---

## Adjacent Text Check

The revision is confined to Step 2 of Hook 2's numbered list. Surrounding steps are unaffected:

- Step 1 (reads `docs/cycle-status.md` for the current phase) is unrelated to cycle number resolution and was not modified.
- Steps 3–6 (manifest loading, phase lookup, structural assertions, block reason emission) reference `{cycle}` as a resolved token, not as a detection target. The resolution mechanism they depend on is now correctly specified in Step 2. CONSISTENT.

The pre-migration path `docs/cycle-status.md` referenced in Steps 1 and 2 is intentionally the pre-migration path. ADR-064 line 157 explicitly commits the cycle-status migration to ADR-070, and ADR-070's reference updates scope includes mechanical substitution of `docs/cycle-status.md` → `docs/housekeeping/cycle-status.md` across all ADRs when the migration runs. This is not an inconsistency introduced by the revision — it was already present in Step 1 and is handled by ADR-070. NOT A NEW ISSUE.

---

## New Issues

None. The revision is internally consistent, does not introduce any new logical gaps, and does not conflict with adjacent text in ADR-064, ADR-063, or ADR-070.

---

## Framing Concerns

All three original framing concerns are present and unchanged. None of the argument-audit revisions across the original, first re-audit, or this revision touched the substance of the framing concerns.

**FC-A (P2) — Graceful upgrade as architectural principle from single-instance evidence.**

ADR-064's Advisory mode subsection still contains: "any future plugin update that introduces a structural corpus migration should adopt the same pattern — version marker, degraded mode on absence, opt-in enforcement via conform." The generalization from one user concern at one gate conversation to a binding architectural principle for all future updates remains. The revision to Hook 2 Step 2 did not touch this section. Surface for user judgment: is the graceful-upgrade principle well-founded enough to be binding on future ADRs, or should it be stated as a recommendation rather than a principle?

**FC-B (P2) — Readables-vs-housekeeping test does not handle dual-nature documents.**

ADR-064 and ADR-070 both retain the binary readables-vs-housekeeping framing. The concern that audit reports are simultaneously acted upon by tooling AND read as prose (cited at gate conversations, referenced by line in downstream ADRs, the vehicle through which re-audit findings reach the user) is unaddressed by any revision. Surface for user judgment: does the readables-vs-housekeeping distinction work as a binary for all documents in the migration scope, or does it require a "both" category?

**FC-C (P3) — Provenance check subsection not formally adopted as required methodology artifact.**

ADR-069's positive scope-of-claim item 5 still lists "Provenance attribution for agent compositions at the point they land in artifacts" as a methodology commitment. The provenance check subsection remains a Cycle 10 practice without a methodology-level ADR specifying it as mandatory for future ADRs. Surface for user judgment: should the provenance check subsection become a formally required ADR element, or is Cycle 10 practice sufficient for ADR-069's scope-of-claim framing?

---

## Clean Closure

NI-1 is RESOLVED. No new issues were introduced by the revision. The ADR-064 Hook 2 Step 2 text now matches the committed cycle-status-field-primary mechanism in ADR-063's Design properties and ADR-064's own Negative Consequences, with inference as documented fallback and fail-safe emit-allow as the terminal case. All three texts are internally consistent with each other.

The eight-ADR DECIDE set is argument-clean. The three framing concerns (FC-A, FC-B, FC-C) remain surfaced to the user at the epistemic gate per the framing-audit surfacing protocol — these are not auto-corrected.

The ADR set is ready for Step 3.5 (conformance audit) and Step 3.7 (backward propagation).
