# Argument Re-Audit Report 4 — Cycle 10 DECIDE (NI fixes)

**Audited document:** `docs/decisions/adr-064-compound-check-hooks.md`, `docs/decisions/adr-070-housekeeping-migration.md` (targeted to NI-A, NI-B1, NI-B2 revisions)
**Source material:** `docs/essays/014-specification-execution-gap.md` §8, `docs/decisions/adr-069-methodology-scope-of-claim.md`, `docs/decisions/adr-066-user-tooling-layer.md`
**Date:** 2026-04-09
**Prior audits:**
  - `docs/essays/audits/argument-audit-decide-014.md`
  - `docs/essays/audits/argument-audit-decide-014-reaudit.md`
  - `docs/essays/audits/argument-audit-decide-014-reaudit-2.md`
  - `docs/essays/audits/argument-audit-decide-014-reaudit-3.md`

---

## Summary

**Argument chains mapped:** 6
**Issues found:** 1
- **P1:** 0
- **P2:** 1
- **P3:** 0
- **Framing concerns:** 0

---

## NI-A Verification

**Status: RESOLVED**

**Quote current text:** ADR-064 §"Advisory mode for pre-migration corpora" now closes with: "User-experience framing: this is a UX commitment, not a new architectural principle. The load-bearing motivation for the advisory-vs-enforcement split is user experience, surfaced by the user at DECIDE gate 2026-04-08: a developer who updates the plugin mid-cycle should not be forced into immediate corpus restructuring; their cycle should continue to complete normally while the new enforcement waits for them to opt in. This is a direct response to the concrete user workflow the methodology targets — not a derivation from a higher-level principle, not a generalization from the specification-execution gap diagnosis, but a commitment to the developer-as-user."

**§8 citation check:** Removed. No reference to Essay 014 §8 appears anywhere in ADR-064's §"Advisory mode for pre-migration corpora" section. The phrase "two-stream framing" does not appear in the revised text. The phrase "engineering stream" does not appear. The phrase "research stream" does not appear in that section.

**Cross-check with Essay 014 §8:** Essay 014 §8 defines the two streams as build-the-right-thing (did mechanisms fire and produce effects?) and phenomenological (was the learning earned and the practitioner's confidence genuine?). The revised ADR-064 text makes no claim about or reference to either of these streams in the advisory-mode context. The UX motivation stands entirely on its own: the Fails-Safe-to-Allow principle already established in ADR-064 provides direct grounding ("a user-hostile default that the Fails-Safe-to-Allow principle rejects") and no further citation is required or present. NI-A is cleanly resolved with no residue.

**Assessment:** The revision makes the correct argumentative move. The prior version's §8 citation was terminological overreach; the current version avoids the overreach without weakening the argument. The graceful degradation design is self-sufficient.

---

## NI-B1 Verification

**Status: RESOLVED**

**ADR-070 Context section:** Updated. Line 7 now reads: "ADR-064 established the centered-vs-infrastructure framing for the RDD corpus: centered artifacts are documents designed to be read, shared, or referenced directly by users (essays, ADRs, domain model, product discovery, roadmap, field guide, ORIENTATION); infrastructure artifacts underpin framework operation without being centered for direct user reading (dispatch log, audit reports, cycle-status). The distinction is about what the methodology centers for user attention, not a hard binary on technical readability — any file can be opened and read, but the workflow does not expect users to browse infrastructure artifacts directly." This is a complete replacement of the original readables-vs-housekeeping binary introduction. The updated text explicitly flags the spectrum nature of the distinction ("not a hard binary on technical readability") and uses the centered-vs-infrastructure vocabulary throughout.

**ADR-070 non-migration table:** Updated. Line 48 now reads: "The distinction is governed by the centered-vs-infrastructure framing from ADR-064: centered artifacts are designed to be read, shared, or referenced directly by users; infrastructure artifacts underpin framework operation without being centered for direct user reading. Reflections and research logs are read by users as narrative material — they are centered. They remain in `docs/essays/`. The distinction is not a hard binary (any file can be opened and read), but about where the methodology centers reading attention." The original binary test ("if a document is acted upon by tooling or consumed as operational state without being read as prose, it is housekeeping; otherwise it is readable") is gone. The justification for excluding reflections and research logs now correctly uses the centered-vs-infrastructure criterion (they are centered) rather than the technical-readability criterion (they are read as prose).

**ADR-070 provenance check:** Updated. Lines 185 and 188 now read: "The centered-vs-infrastructure framing that drives the migration decisions: User-surfaced at DECIDE gate 2026-04-08 (initial binary framing) and refined at DECIDE gate 2026-04-09 (centered-vs-infrastructure clarification in response to the framing audit's FC-B observation). Encoded in ADR-064. This ADR executes the framing; it does not originate it." The attribution explicitly names both dates: the original framing at 2026-04-08 and the refinement at 2026-04-09. This is accurate — the binary framing was user-surfaced at 2026-04-08 and the centered-vs-infrastructure clarification was surfaced at 2026-04-09. The non-migration application (line 188) also reads: "The framing itself is user-surfaced (ADR-064, refined 2026-04-09); the specific application to these three locations is drafting-time judgment." Provenance is cleanly attributed.

**Any remaining old binary references:** None detected in ADR-070. The phrases "readables-vs-housekeeping," "read as prose," and "acted upon by tooling or consumed as operational state without being read as prose" are absent from the revised text.

---

## NI-B2 Verification

**Status: RESOLVED**

**ADR-064 residual references check:** The three lines identified in NI-B2 (the brief describes them as lines 152, 160, 163) have been updated. Reading the current ADR-064 text:

- The "In scope for this ADR" bullet at what was line 152 now reads: "Create `docs/housekeeping/` as a new directory grouping infrastructure artifacts per the centered-vs-infrastructure framing." The phrase "readables-vs-housekeeping principle" is gone.
- The migration commitment item for audit reports (what was line 160) now reads: "audit reports are output of verification subagents; the agent reads them at gates and surfaces findings on the user's behalf (as happened for the three framing concerns at this DECIDE gate). Users can read audits directly if they want, but the workflow does not center them for direct reading. Migration mechanics in ADR-070." The phrase "acted upon, not read as prose" is gone. The justification now uses the centered-vs-infrastructure criterion (the workflow does not center them for direct reading).
- The rdd-conform scope item (what was line 163) now reads: "housekeeping directory organization audit — verifies that audit files are organized by cycle with canonical naming, that infrastructure artifacts haven't drifted to the wrong locations, and that the centered-vs-infrastructure distinction is being honored by placement." The phrase "readables-vs-housekeeping distinction" is replaced by "centered-vs-infrastructure distinction."

**Any remaining old binary references in ADR-064:** None detected in the body of ADR-064. The attribution note in §"Housekeeping directory" (line 147) does mention the original binary: "the framing audit's FC-B observation that the original readables-vs-housekeeping binary was actually a spectrum." This is a historical reference naming the prior framing as what was revised — it is not applying the old binary as a principle, it is attributing when the revision occurred and why. Accurate and appropriate.

The rationale from the DECIDE gate 2026-04-08 quote (line 149) also retains the original user language: "We have top-level 'readables' that will likely be read by people, and then we have 'housekeeping' that are docs that are acted upon but humans don't need to read them." This is a direct quotation of the user's original framing, preserved for provenance, and properly followed by "This ADR adopts that framing as the structural principle" in the sense of adopting the directional intent — not the binary criterion. The subsequent attribution note on line 147 makes explicit that the centered-vs-infrastructure refinement superseded the binary. The quotation as historical record is appropriate.

---

## FC-A, FC-B, FC-C Still Resolved?

**FC-A: RESOLVED (confirmed post-NI-A fix)**

The §8 citation is removed. The UX framing stands on its own. The closing paragraph of §"Advisory mode for pre-migration corpora" grounds the advisory-vs-enforcement split in user experience directly, without appealing to §8 or naming any stream taxonomy. The argument chain is: Fails-Safe-to-Allow principle establishes user-hostile-default rejection → advisory mode applies same principle to pre-migration corpora → UX commitment is the load-bearing motivation. This chain is valid and self-contained. FC-A is fully resolved.

**FC-B: RESOLVED (confirmed post-NI-B1 and NI-B2 fixes)**

ADR-064's §"Housekeeping directory" consistently uses centered-vs-infrastructure framing in both the body and the surrounding scope items. ADR-070's Context section, non-migration table, and provenance check all use centered-vs-infrastructure framing and match ADR-064's current text. The citation chain from ADR-070 to ADR-064 now returns consistent terminology. The cross-document inconsistency that made FC-B partially resolved in re-audit 3 is closed. FC-B is fully resolved.

**FC-C: RESOLVED (unchanged)**

ADR-069 item 5 continues to read: "Provenance via architectural drivers as the primary attribution mechanism" with provenance check subsections used selectively for ADRs carrying non-driver content. The Cycle 10 ADRs are explicitly called out as an unusual case. The framing correctly distinguishes what the methodology guarantees (drivers do the provenance work where they reach) from what Cycle 10 specifically did (supplementary provenance checks for high non-driver content). Nothing in the NI revisions touched ADR-069. FC-C remains resolved.

---

## New Issues (if any)

### NI-C (P2) — ADR-066 retains "not read-as-prose" language that was not in scope for the NI-B2 revision

**Location:** ADR-066, §"First migration: AID cycle gate reflection note," paragraph following the canonical path declaration.

**Claim:** "This is a new directory under the housekeeping pattern established in ADR-064. It is parallel to `docs/housekeeping/audits/` (the migration target for audit reports per ADR-070): both are housekeeping-categorized — machine-consumed, corpus-visible, **not read-as-prose**."

**Evidence gap:** The NI-B2 revision correctly updated ADR-064's residual old-binary references and the NI-B1 revision updated ADR-070. ADR-066 was listed as a cross-check reference, not a revision target. However, it contains the same "not read-as-prose" criterion that the centered-vs-infrastructure refinement supersedes. ADR-066 invokes "the housekeeping pattern established in ADR-064" as its justification, and characterizes the new `docs/housekeeping/gates/` directory using the original binary discriminator ("not read-as-prose") — not the centered-vs-infrastructure framing that ADR-064 now encodes. A reader following the citation from ADR-066 to ADR-064 will find that ADR-064 no longer uses "read-as-prose" as the discriminating criterion, but ADR-066 still does. This is the same cross-ADR inconsistency pattern NI-B1 corrected for ADR-070.

**Why this is P2, not P1:** The conclusion (gate reflection notes belong in `docs/housekeeping/gates/`) is correct under either framing. The inconsistency is in the stated criterion, not the classification outcome. No argument breaks on this; no recommendation is wrong. The issue is that ADR-066's line creates the same stale-citation inconsistency pattern that NI-B1 corrected in ADR-070, just in a different ADR.

**Recommendation:** Update the characterization to use centered-vs-infrastructure language: "both are housekeeping-categorized — machine-consumed, corpus-visible, and infrastructure rather than centered for direct reading." This aligns ADR-066 with the framing now consistent across ADR-064 and ADR-070. A one-sentence change; no argument changes.

---

## Clean Closure

NI-A, NI-B1, and NI-B2 are all RESOLVED. FC-A, FC-B, and FC-C remain RESOLVED. One new P2 issue (NI-C) is introduced: ADR-066 retains "not read-as-prose" language that the prior revisions correctly removed from ADR-064 and ADR-070. The issue is the same cross-ADR inconsistency pattern as NI-B1 — a residual reference to the old binary framing in an ADR that cites "the housekeeping pattern established in ADR-064" as its grounding.

NI-C is a single-sentence fix. It does not affect the argument's validity, but the mandatory re-audit-after-revision rule applies regardless of issue severity: if the revision is made, a fifth re-audit is required. Per the clean-closure criterion, the DECIDE set is **not yet ready** to proceed past the epistemic gate until NI-C is resolved (or explicitly accepted and documented as a known inconsistency). The DECIDE → ARCHITECT boundary should wait for the NI-C revision and its corresponding fifth re-audit.
