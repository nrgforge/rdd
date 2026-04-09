# Argument Re-Audit Report 3 — Cycle 10 DECIDE (FC fixes)

**Audited document:** `docs/decisions/adr-064-compound-check-hooks.md`, `docs/decisions/adr-069-methodology-scope-of-claim.md` (targeted to FC-A, FC-B, FC-C revisions)
**Source material:** `docs/essays/014-specification-execution-gap.md` §8, `docs/decisions/adr-070-housekeeping-migration.md`, `docs/decisions/adr-063-per-phase-manifest-format.md`, `docs/decisions/adr-066-user-tooling-layer.md`
**Date:** 2026-04-09
**Prior audits:**
  - `docs/essays/audits/argument-audit-decide-014.md`
  - `docs/essays/audits/argument-audit-decide-014-reaudit.md`
  - `docs/essays/audits/argument-audit-decide-014-reaudit-2.md`

---

## Summary

**Argument chains mapped:** 6
**Issues found:** 2
- **P1:** 0
- **P2:** 2
- **P3:** 0
- **Framing concerns:** 0 (FC-A, FC-B, FC-C all addressed; two new cross-document consistency issues introduced by FC-B revision classified as P2 argument-audit items)

---

## FC-A Verification

**Status: RESOLVED**

**Revision quality:** The revised §"Advisory mode for pre-migration corpora" closes with: "User-experience framing: this is an application of the two-stream framing to plugin releases." The revision successfully shifts the register from a binding architectural principle to a UX motivation and frames the advisory-vs-enforcement split as the means by which a version mismatch is held gracefully. The load-bearing UX claim — a developer who updates the plugin mid-cycle should not be forced into immediate corpus restructuring — is coherent and well-grounded in the earlier §"Fails-Safe-to-Allow" analysis and in the Fails-Safe-to-Allow principle's user-hostile-default reasoning. The closing sentence correctly hedges future implications: "Future plugin updates that introduce structural corpus migrations should *consider* user experience using the same intuition, but the consideration is a UX commitment rather than an architectural-principle binding on all future ADRs." This is a principled softening that directly addresses the original framing concern.

**Cross-ADR consistency with Essay 014 §8:** One issue warrants surfacing. Essay 014 §8 defines the two-stream framing as a specific pair: the build-the-right-thing stream (did the mechanism fire?) and the phenomenological stream (was the learning earned?). It is a value frame for understanding why State C harms practitioners simultaneously on both axes. The ADR-064 revision applies the phrase "two-stream framing" to a different axis: the engineering stream (the plugin's shipping enforcement) and the research stream (the user's corpus state). These are related metaphors but not the same pairing §8 defines. §8 does not name an "engineering stream" or a "research stream" in the plugin-release sense; those terms belong to the ADR's domain of discourse, not to the essay's value-frame analysis.

This is a terminological overreach rather than a logical gap. The UX justification stands entirely without the §8 citation — the graceful degradation design is self-evidently motivated by not forcing migration mid-cycle, and the essay's own §"Fails-Safe-to-Allow" analysis provides the more directly relevant grounding. The §8 citation adds color but introduces a potential inconsistency for future readers who consult §8 and find the two-stream pair it defines does not map cleanly onto what the ADR is describing. This issue is classified as P2 in the argument-audit section below.

**Any new issues:** One new P2 issue (see NI-A below).

---

## FC-B Verification

**Status: PARTIALLY RESOLVED**

**Revision quality:** The revised §"Housekeeping directory" in ADR-064 successfully replaces the binary readables-vs-housekeeping test with the centered-vs-infrastructure framing. The key sentences that address the original concern are present: "The distinction is not a hard binary. Audit findings (like the three framing concerns being discussed in this gate right now) are surfaced by the agent reading infrastructure artifacts on the user's behalf. Cycle-status is sometimes read directly by users resuming a cycle. The distinction is about *what the methodology centers*, not about *what is technically possible to read*." The revised framing handles dual-nature documents honestly — audit reports are infrastructure in the sense that the methodology does not center them for direct reading, even though they can be opened and read. The user-workflow anchoring is the right principle. The attribution to DECIDE gate 2026-04-09 is present.

**Cross-ADR consistency against ADR-070:** The revision to ADR-064 §"Housekeeping directory" was not propagated to ADR-070, which remains on the original binary framing at multiple locations. ADR-070's decision section (line 48) still states: "The distinction is governed by the readables-vs-housekeeping test from ADR-064: if a document is acted upon by tooling or consumed as operational state *without being read as prose*, it is housekeeping; otherwise it is readable." This is the exact binary that the FC-B revision was designed to replace. It applies the binary test actively to justify the exclusion of reflections and research logs, using the "read as prose" criterion as the discriminator — language that ADR-064 now acknowledges is not the right principle. ADR-070's context section (line 7) also introduces the principle with the old readables-vs-housekeeping framing: "readables are documents humans read... and housekeeping is documents that are acted upon by tooling or consumed as operational state but not read as prose." ADR-070 lines 15 and 185 and 188 carry the old terminology throughout. The centered-vs-infrastructure reframe in ADR-064 is not inherited by ADR-070, which cites "ADR-064" as its source — creating an inconsistency where a reader following the citation chain from ADR-070 to ADR-064 finds a different principle than the one ADR-070 restated.

**Cross-document consistency within ADR-064:** The revision to the §"Housekeeping directory" subsection did not update adjacent text within ADR-064 that still uses the old formulation. Line 152 says "Create `docs/housekeeping/` as a new directory with the **readables-vs-housekeeping** principle documented." Line 160 describes audit reports as fitting "the 'acted upon, not read as prose' pattern." Line 163's rdd-conform scope item says the organization audit should verify "the readables-vs-housekeeping distinction is being honored." These lines use the binary language that the revised principle in the same ADR section has superseded. A reader of ADR-064 sees the centered-vs-infrastructure framing in the subsection body and the readables-vs-housekeeping binary in the surrounding scope items.

Both of these are classified as P2 issues in the argument-audit section.

**Any new issues:** Two new P2 issues (NI-B1 and NI-B2).

---

## FC-C Verification

**Status: RESOLVED**

**Revision quality:** The revised ADR-069 item 5 reads: "Provenance via architectural drivers as the primary attribution mechanism" with provenance check subsections used "selectively" when an ADR carries content not from the driver chain. The Cycle 10 ADRs 063-070 are explicitly called out as an unusual case "where provenance checks are load-bearing." This is accurate: ADR-063 through ADR-070 all carry provenance check subsections, and the provenance sections of each explain why — they carry unusually high proportions of DECIDE-gate contributions and agent-synthesis compositions. The framing correctly distinguishes what the methodology actually does (drivers do the provenance work where they reach) from what Cycle 10 specifically did (supplementary provenance checks for non-driver content). The closing sentence is appropriately hedged: "This is not a universal methodology promise that every future ADR must carry a provenance check."

**Cross-ADR consistency:** The revised item 5 aligns with actual practice across the Cycle 10 ADRs verified here (063, 064, 066, 069, 070). ADR-063's provenance check explicitly states "no synthesis-moment framing adoption detected at drafting time" and "The ADR is a mechanical adoption of Spike S2's output" — consistent with the "drivers do the work" framing. ADR-069's own provenance check names several items as "agent-composed at drafting time" and one as a watch item — the provenance check is load-bearing precisely because the ADR carries that level of non-driver content. The revised item 5's claim that Cycle 10 ADRs are an unusual case is borne out by the cross-ADR read: ADR-063 uses its provenance check to confirm there is nothing to flag; ADR-069 uses it to name watch items. Both uses serve the goal without implying all future ADRs must carry them.

**Does it avoid overclaiming future-ADR commitments:** Yes. The language "selectively" and "not a universal methodology promise" are explicit hedges. The positive claim is bounded to the driver chain as primary mechanism, with provenance checks as the named exception pattern.

**Any new issues:** None.

---

## New Issues

### NI-A (P2) — Two-stream terminology in FC-A revision does not map to Essay 014 §8's two streams

**Location:** ADR-064, §"Advisory mode for pre-migration corpora," closing paragraph ("User-experience framing" passage)

**Claim:** "This is an application of the two-stream framing to plugin releases. Essay 014 §8 introduces the two-stream framing — the methodology as a conversation with a moving implementation layer, where the research stream and the engineering stream must both hold."

**Evidence gap:** Essay 014 §8 defines the two-stream framing as build-the-right-thing (did mechanisms fire?) and phenomenological (was the learning earned?). It does not name a "research stream" or an "engineering stream" in the plugin-release sense. The streams §8 identifies are about a practitioner's value axes for evaluating methodology outcomes, not about the relationship between a plugin's shipping state and a user's corpus state. The revision's "engineering stream" and "research stream" are coherent concepts in ADR-064's context, but they are an analog reuse of the §8 metaphor rather than a citation of §8's actual content. A reader who consults §8 to understand what the "two-stream framing" means will find a different pair of streams than the ADR describes.

**Recommendation:** Either remove the §8 citation and let the UX motivation stand on its own (which it does — the graceful degradation reasoning is self-sufficient), or add a parenthetical clarifying that the ADR is drawing an analog rather than directly applying §8's pair. A phrasing like "analogous to Essay 014 §8's two-stream value frame" rather than "this is an application of the two-stream framing" would signal the relationship honestly.

---

### NI-B1 (P2) — ADR-070 decision section retains and applies the original binary readables-vs-housekeeping test

**Location:** ADR-070, §"Migration scope" (line 48), §Context (line 7), provenance check (lines 185, 188)

**Claim:** ADR-070 line 48: "The distinction is governed by the readables-vs-housekeeping test from ADR-064: if a document is acted upon by tooling or consumed as operational state without being read as prose, it is housekeeping; otherwise it is readable."

**Evidence gap:** ADR-064's §"Housekeeping directory" now states explicitly that the original binary framing was replaced by the centered-vs-infrastructure principle at DECIDE gate 2026-04-09, and that "The distinction is not a hard binary." ADR-070 still cites "the readables-vs-housekeeping test from ADR-064" and restates the binary criterion ("without being read as prose... otherwise it is readable") — language that ADR-064 has superseded. A reader following the citation from ADR-070 to ADR-064 will find a principle inconsistent with what ADR-070 restated. The specific justification in ADR-070 line 48 — that reflections and research logs are readable because they "are read as narrative material" — uses the original technical-readability criterion, which ADR-064 now identifies as not the right discriminator. The centered-vs-infrastructure framing would reach the same conclusion for reflections and research logs (they are centered artifacts), but for different reasons. The inconsistency is in the justification, not the conclusion.

**Recommendation:** Update ADR-070 to reference the centered-vs-infrastructure principle from ADR-064 rather than the original binary test. The specific migration non-targets (reflections, research logs, cycle-archive) would be re-justified under the centered-vs-infrastructure framing: these are documents the methodology centers for users to share and read, and therefore belong in the readable tier. No migration target changes; only the justification updates. The provenance note in ADR-070 (lines 185, 188) should also reflect the updated framing.

---

### NI-B2 (P2) — ADR-064 retains old binary language in scope items outside the revised subsection

**Location:** ADR-064, §"Housekeeping directory," lines 152, 160, 163 (outside the revised body text)

**Claim:**
- Line 152: "Create `docs/housekeeping/` as a new directory with the **readables-vs-housekeeping** principle documented."
- Line 160: "audit reports are output of verification subagents, consumed by the orchestrator and by follow-up phases. They fit the 'acted upon, not read as prose' pattern."
- Line 163 (rdd-conform scope): "verifies that... the readables-vs-housekeeping distinction is being honored"

**Evidence gap:** These three lines still use the original framing — "readables-vs-housekeeping" as a named principle and "acted upon, not read as prose" as the discriminating criterion — in the same ADR section whose subsection body has been revised to name the centered-vs-infrastructure framing as the replacement. A reader of the revised ADR-064 encounters the updated principle in the subsection body and the original binary language in the scope items immediately surrounding it. The rdd-conform scope item is particularly significant: it instructs the conformance tool to enforce "the readables-vs-housekeeping distinction" — meaning conformance tooling will be implemented against the binary criterion, not the centered-vs-infrastructure principle.

**Recommendation:** Update the three lines to use the centered-vs-infrastructure language consistently. Line 152 could read "Create `docs/housekeeping/` as a new directory with the centered-vs-infrastructure framing documented." Line 160's parenthetical could read "They are infrastructure artifacts in the centered-vs-infrastructure sense — designed for tooling consumption, not for direct user reading." Line 163's conform scope item could reference "the centered-vs-infrastructure distinction."

---

## Clean Closure

FC-C is fully RESOLVED. FC-A is RESOLVED on its primary intent (graceful-upgrade pattern grounded in UX rather than architectural principle) with one P2 terminology issue (NI-A) that does not undermine the argument but should be addressed before the §8 citation becomes canonically cited in downstream work. FC-B is PARTIALLY RESOLVED: the principle revision in ADR-064 §"Housekeeping directory" correctly addresses the spectrum concern, but two P2 issues (NI-B1 and NI-B2) remain where the old binary language persists in ADR-070 and in adjacent lines of ADR-064 itself.

The DECIDE-phase ADR set is not yet ready for epistemic gate advancement. The three NI issues are all P2 — no logical contradictions, no unsupported conclusions — but NI-B1 in particular is a cross-document inconsistency where ADR-070's decision section actively applies the superseded binary test to justify migration scope. Advancement to the DECIDE → ARCHITECT boundary should wait for these three revisions, after which a fourth re-audit is required per the mandatory re-audit-after-revision rule.
