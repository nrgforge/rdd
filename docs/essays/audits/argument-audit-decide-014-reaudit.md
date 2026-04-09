# Argument Re-Audit Report — Cycle 10 DECIDE

**Audited document:** Eight-ADR set:
- `docs/decisions/adr-063-per-phase-manifest-format.md`
- `docs/decisions/adr-064-compound-check-hooks.md`
- `docs/decisions/adr-065-anchor-dispatch-skill-structure-fix.md`
- `docs/decisions/adr-066-user-tooling-layer.md`
- `docs/decisions/adr-067-three-tier-enforcement-classification.md`
- `docs/decisions/adr-068-grounding-reframe-extension.md`
- `docs/decisions/adr-069-methodology-scope-of-claim.md`
- `docs/decisions/adr-070-housekeeping-migration.md`

**Source material:**
- `docs/essays/014-specification-execution-gap.md`
- `docs/essays/research-logs/spike-s1-hook-feasibility.md`
- `docs/essays/research-logs/spike-s2-acceptance-criteria.md`
- `docs/essays/research-logs/spike-s3-base-rate-audit.md`
- `docs/essays/research-logs/spike-s4-fail-loud-dispatch.md`
- `docs/essays/research-logs/lit-review-instruction-following-degradation.md`
- `docs/essays/research-logs/lit-review-telemetry-acceptance-criteria.md`
- `docs/decisions/adr-033-cross-cutting-hooks.md`
- `docs/decisions/adr-055-belief-mapping-operationalization-of-inversion-principle.md`
- `docs/decisions/adr-056-research-grounded-question-toolkit-for-aid.md`
- `docs/decisions/adr-057-aid-susceptibility-extension.md`
- `docs/decisions/adr-058-unconditional-architectural-floor.md`
- `docs/decisions/adr-059-grounding-reframe.md`
- `docs/decisions/adr-060-research-methods-subagent.md`
- `docs/decisions/adr-061-framing-audit-as-argument-auditor-extension.md`
- `docs/decisions/adr-062-assertion-detection-hook.md`
- `docs/domain-model.md`

**Date:** 2026-04-08
**Prior audit:** `docs/essays/audits/argument-audit-decide-014.md`

---

## Summary

**Argument chains mapped:** 14
**Issues found:** 1
- **P1:** 0
- **P2:** 0
- **P3:** 1
- **Framing concerns:** 3 (FC-A, FC-B, FC-C — all present, none auto-corrected)

---

## Revision Verification

### P1-A — Structural-impossibility claim unqualified for advisory mode

**Finding:** ADR-064 Consequences stated "State C becomes structurally impossible" without qualification for advisory mode. ADR-067 Harness Layer table entry implied the guarantee was unconditional.

**Revision made (ADR-064):** The Consequences positive bullet now reads: "State C becomes structurally impossible for the four addressed failure modes — in enforcement mode." It continues: "The guarantee is conditional on the corpus being in enforcement mode (the migration-version marker file is present — see §'Advisory mode for pre-migration corpora' below). In advisory mode, the PostToolUse dispatch log is not written and the compound cross-reference does not run; the structural guarantee does not hold. Future ADRs citing ADR-064 for the State C guarantee must inherit the enforcement-mode qualification."

**Revision made (ADR-067):** The "Not a priority hierarchy" subsection, Harness Layer bullet, now reads: "The Harness Layer's compound check (ADR-064) is the *only* structural defense against sophisticated State C fabrication in enforcement mode, because fabrication would require inducing a fake PostToolUse event, which the agent cannot do. The guarantee does not hold on pre-migration corpora in advisory mode; see ADR-064's advisory-mode subsection."

**Revision status:** RESOLVED

**Notes:** Both revision sites are internally coherent and fit cleanly into surrounding text. The ADR-064 Consequences bullet is now the canonical statement of the conditional guarantee and explicitly directs future readers to inherit the qualification. The ADR-067 "Not a priority hierarchy" framing now carries the same qualification in the Harness Layer's primary-in-domain description. No new logical gaps introduced.

---

### P2-A — Cross-ADR coordination seam not closed

**Finding:** ADRs 063, 064, 065, and 070 each acknowledged the cross-ADR coordination dependency but none stated explicitly which ships first or what the atomic shipping unit is.

**Revision made (ADR-070):** A new subsection, "Implementation sequencing preconditions," has been added. It states explicitly: ADR-065's skill-file edits must ship before the migration operation runs. It defines the atomic shipping unit: the plugin release shipping ADRs 063–066 must treat ADR-065's skill edits and ADR-070's path updates as "a single atomic change." It also specifies the legitimate transitional state between ADR-065 shipping and the migration running, including what paths skill files and the manifest reference in that state, and confirms the Stop hook runs in advisory mode until migration completes.

**Revision status:** RESOLVED

**Notes:** The new subsection closes the seam the original finding identified. It correctly locates the precondition statement in ADR-070 (the migration ADR), which is the right owner because it is the ADR that depends on the prior work completing. The transitional-state description (skill files reference `docs/essays/audits/`, manifest matches, advisory mode in effect) is a clean addition that makes the in-between state explicit for implementers. No drift introduced relative to ADR-063 or ADR-064's framing of the coordination.

---

### P2-B — Instance count internally inconsistent across ADR-069

**Finding:** ADR-069's body said "six instances," the enumeration implied seven, and the provenance check said "five plus one." Three different numbers for the same count.

**Revision made (ADR-069):** The ADR now consistently uses seven failure-mode instances plus one success-mode instance = eight total. The pattern-summary in the Decision section reads: "Seven instances across Cycle 10: four in research, one in discover, one in MODEL, one in DECIDE turn 1." The provenance check states "seven failure-mode instances plus one success-mode instance." The Consequences Positive bullet states "seven failure-mode instances plus one success-mode instance as the empirical base." The Neutral consequences bullet also uses "seven failure-mode plus one success-mode." The word "six" no longer appears; neither does "five plus one."

**Revision status:** RESOLVED

**Notes:** Count is consistent across all four sites where it appears. The reconciled enumeration — four research + one discover + one MODEL + one DECIDE = seven failure-mode — matches the numbered list in the Context section. No residual inconsistency detected.

---

### P2-C — Cycle-number resolution design decision deferred without committing

**Finding:** ADR-063 specified inference from essay prefixes as the mechanism while ADR-064 deferred explicit cycle-status tracking to "if it becomes a problem," leaving the design decision unmade.

**Revision made (ADR-063):** The "Cycle-aware via template substitution" design property now commits to reading the cycle number from an explicit field in `cycle-status.md` as the canonical mechanism, with essay-prefix inference as fallback. It specifies the field convention: `**Cycle number:** NNN` at the top of the file.

**Revision made (ADR-064, Negative Consequences):** The `{cycle}` token resolution bullet now states: "The `{cycle}` token resolution via cycle-status is the canonical mechanism, with essay-prefix inference as fallback." It specifies that ADR-063 commits to the explicit field, explains how this resolves the out-of-order essay numbering fragility, and names the fallback-inference failure mode as a narrow edge case for pre-Cycle-10 corpora.

**Revision status:** PARTIALLY RESOLVED

**Notes:** The design decision is now committed in both ADR-063's Design properties section and ADR-064's Negative Consequences bullet — both name cycle-status as the canonical mechanism and essay-prefix inference as fallback. However, ADR-064's Hook 2 implementation steps (Decision section, Step 2) have not been updated. Step 2 still reads: "Reads the highest `NNN-` prefix in `docs/essays/` as the current cycle; if absent, emits `allow`." This step makes no mention of first reading the cycle-status field. A reader following the implementation steps would implement inference-first rather than field-first, directly contradicting the design decision now committed in ADR-063 and in ADR-064's own Negative Consequences section.

**New issue raised:** This creates a new internal inconsistency within ADR-064 itself — the Decision section's Hook 2 implementation steps specify inference-as-primary while the Negative Consequences section specifies field-as-primary. The inconsistency is within a single ADR, not just cross-ADR. It is a P3 in severity because Step 2 describes implementation logic (which the implementer will need to translate into actual code), and an implementer reading all of ADR-064 would catch the contradiction between steps and consequences. However, the implementation steps are the section most likely to be used as a literal specification, making the drift load-bearing for any mechanical implementation.

---

### P2-D — Belief-mapping at pushback misclassified as Skill-Structure Layer concern

**Finding:** ADR-066 called belief-mapping at mid-conversation user pushback "a Skill-Structure Layer concern," inconsistent with ADR-067's step-4 classification that mechanisms with no step-anchorable form, no hook-verifiable event, and no natural artifact moment cannot be Tier 1.

**Revision made (ADR-066):** The explicit non-targets section now contains a substantially expanded entry for belief-mapping at pushback: "Under ADR-067's four-step decision procedure, this mechanism reaches step 4 — no step-anchorable form (no concrete workflow step), no hook-verifiable event (not tool-call-bounded), no natural artifact moment (conversational, not phase-bounded). Per Invariant 8's anchoring requirement, mechanisms reaching step 4 cannot be specified as unconditional. Belief-mapping at pushback remains a Tier 2 best-effort context-responsive mechanism per ADR-058, with the honest acknowledgment that its execution depends on the orchestrator recognizing the pushback moment — exactly the judgment-anchored pattern Invariant 8 names as unreliable. Calling it a 'Skill-Structure Layer concern' would be inconsistent with ADR-067's classification; the skill-text layer can instruct belief-mapping at pushback, but instruction without a concrete dispatch site does not satisfy the Skill-Structure Layer's step-anchoring requirement from ADR-065."

**Revision status:** RESOLVED

**Notes:** The revision eliminates the "Skill-Structure Layer concern" framing and replaces it with the ADR-067 step-4 outcome and an explicit Tier 2 best-effort classification. The revised text is self-consistent with ADR-067's decision procedure and with ADR-058's framing of Tier 2 mechanisms. The parenthetical acknowledgment that skill text can instruct the mechanism while still not satisfying the step-anchoring requirement is a useful clarification — it correctly distinguishes "skill text mentions belief-mapping" from "skill text provides a concrete dispatch site." The revision fits cleanly into the non-targets list.

---

### P3-A — Data-flow join for revision-aware reminder not specified

**Finding:** The mtime comparison in ADR-064's revision-aware reminder section depended on a join from dispatch log entry to manifest `audited_documents` field, but the join was not specified as an implementation step.

**Revision made (ADR-064):** A "Data flow for the mtime comparison" paragraph has been added to the revision-aware reminder section. It specifies: "The hook implementation joins the dispatch log entry's `mechanism` field to the corresponding manifest entry's `mechanism` field to retrieve `audited_documents`. It then glob-expands the patterns in `audited_documents` (with `{cycle}` substituted) to produce the list of audited files. For each audited file, it performs the mtime comparison against the `timestamp` field of the matching dispatch log entry. If any audited file's mtime exceeds the dispatch log entry's timestamp, the reminder fires. This join is explicit in the hook implementation; without it, the hook has no path from 'a mechanism dispatched' to 'which documents that mechanism audited.'"

**Revision status:** RESOLVED

**Notes:** The new paragraph specifies the join in the exact form needed for implementation: field-to-field join (`mechanism`), glob expansion with `{cycle}` substitution, per-file mtime comparison, and the last sentence explicitly flags the join as necessary for correctness. The paragraph is concise and fits cleanly into the revision-aware reminder section immediately after the manifest extension block that introduces `audited_documents`. No new gaps introduced.

---

### P3-B — Harness Layer example mechanism misleads on primary dispatch layer

**Finding:** ADR-067's substrate table listed "Argument auditor re-audit verification" as the Harness Layer example without clarifying that the primary argument auditor dispatch is Skill-Structure Layer.

**Revision made (ADR-067):** The Harness Layer "Example mechanism" column now reads: "Argument auditor re-audit temporal verification (note: the primary argument auditor dispatch is Skill-Structure Layer; the Harness Layer adds the revision-aware reminder from ADR-064 that verifies re-audits happen after document revisions); susceptibility snapshot at phase boundaries (as complement to skill-structure fix)."

**Revision status:** RESOLVED

**Notes:** The parenthetical note directly addresses the original finding's concern — a reader cannot mistake the argument auditor's primary dispatch as belonging to the Harness Layer because the note explicitly states the primary dispatch is Skill-Structure Layer and characterizes the Harness Layer's contribution as the revision-aware reminder. The second example (susceptibility snapshot at phase boundaries, as complement to skill-structure fix) is also qualified, which prevents the same misreading for the snapshot. The table cell is now longer but the content is accurate and fits the column's purpose. No new gaps introduced.

---

### P3-C — Ambiguous "format audit" language in ADR-064's rdd-conform reference

**Finding:** ADR-064's reference to the rdd-conform scope extension was ambiguous — "format audit" could mean housekeeping directory organization audit or the dispatch-prompt format audit from ADR-065.

**Revision made (ADR-064):** The parenthetical reference to the rdd-conform scope extension in the Housekeeping directory section now enumerates three specific new audit scopes by name: "(1) housekeeping directory organization audit — verifies that audit files are organized by cycle with canonical naming, operational artifacts haven't drifted to the wrong locations, and the readables-vs-housekeeping distinction is being honored; (2) gate reflection note template alignment audit (per ADR-066) — verifies gate reflection notes match their canonical template; (3) dispatch prompt format audit (per ADR-065) — verifies skill-file dispatch prompts follow the canonical skeleton with the `Output path:` line so the PostToolUse hook can extract expected paths."

**Revision status:** RESOLVED

**Notes:** The three scopes are now named and distinguished. No ambiguity remains between "housekeeping directory format" and "dispatch prompt format." The enumeration is consistent with ADR-070's rdd-conform scope extension section, which specifies the same three scopes. The cross-ADR consistency check holds.

---

## New Issues

### NI-1 (P3) — ADR-064 Hook 2 implementation steps contradict the P2-C cycle-resolution fix

**Location:** ADR-064, Decision section, Hook 2 "Stop — Check Phase Manifest with Compound Cross-Reference," Step 2.

**Claim:** Step 2 reads: "Reads the highest `NNN-` prefix in `docs/essays/` as the current cycle; if absent, emits `allow`."

**Evidence gap:** The P2-C fix committed the design decision in two places within ADR-064 itself — the Design properties section of ADR-063 (canonical mechanism is cycle-status field, inference is fallback) and the Negative Consequences section of ADR-064 (same commitment). Step 2 of Hook 2's implementation steps was not updated to match. An implementer reading Hook 2's numbered steps literally would implement inference-first and never consult the cycle-status field, directly contradicting the design decision the revision intended to commit. The inconsistency is internal to ADR-064.

**Recommendation:** Update Step 2 of Hook 2 to reflect the committed resolution: "Reads the current cycle number from the `**Cycle number:** NNN` field in `docs/cycle-status.md` (canonical mechanism); if that field is absent or unparseable, falls back to inferring the cycle from the highest `NNN-` prefix in `docs/essays/`; if neither is available, emits `allow`." This brings the implementation steps into alignment with the design decision committed in ADR-063's Design properties and ADR-064's Negative Consequences.

---

## Framing Concerns Status

All three original framing concerns (FC-A, FC-B, FC-C) are present in the revised ADRs and have not been inadvertently corrected. None of the argument-audit revisions touched the substance of the framing concerns.

**FC-A (P2) — Graceful upgrade as architectural principle from single-instance evidence.** ADR-064's Advisory mode subsection still contains the full principle generalization: "any future plugin update that introduces a structural corpus migration should adopt the same pattern — version marker, degraded mode on absence, opt-in enforcement via conform." The generalization from one instance (the user's concern at DECIDE gate 2026-04-08) to "any future update" remains present and unchanged. Surface for user judgment: is the principle well-founded enough to be binding on future ADRs, or should it be stated as a recommendation rather than a precedent?

**FC-B (P2) — Readables-vs-housekeeping test does not handle dual-nature documents.** ADR-064 and ADR-070 both retain the binary readables-vs-housekeeping framing. The concern that audit reports are both acted upon by tooling AND read as prose (cited in gate conversations, referenced by line in downstream ADRs) is not addressed by any of the revisions. The test as stated remains: "if a document is acted upon by tooling or consumed as operational state without being read as prose, it is housekeeping; otherwise it is readable." Surface for user judgment: does this classification work as a binary for all documents in the migration scope, or does it require a "both" category?

**FC-C (P3) — Provenance check subsection not formally adopted as required methodology artifact.** ADR-069's positive scope-of-claim item 5 still lists "Provenance attribution for agent compositions at the point they land in artifacts" as a methodology commitment. The provenance check subsection introduced across ADRs 063–070 remains a Cycle 10 practice that has not been formally adopted by a methodology-level ADR specifying it as mandatory for future ADRs. Surface for user judgment: should the provenance check subsection become a formally required ADR element, or is Cycle 10 practice sufficient for ADR-069's scope-of-claim framing?

No new framing concerns were introduced by the revisions. The argument-audit fixes were narrow and structural; none of them introduced new agent-composed framings that would require framing-audit scrutiny.
