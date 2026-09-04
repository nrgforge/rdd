# Argument Audit Report

**Audited document:** `docs/decisions/adr-099-substrate-and-surface-separation.md` (derived from `docs/substrate/adr/adr-099.json`); `docs/decisions/adr-100-pre-triage-at-practitioner-facing-moments.md` (derived from `docs/substrate/adr/adr-100.json`)
**Source material:** `/private/tmp/.../scratchpad/adr-099-prose.md`; `/private/tmp/.../scratchpad/adr-100-prose.md` (prose baselines, the files as they stood before the form change); `docs/substrate/adr/adr-099.json`; `docs/substrate/adr/adr-100.json`; `.rdd/gates/020-decide-gate.md`; `.rdd/gates/020-architect-gate.md` (consulted to verify the ADR-100 erratum's factual basis)
**Genre:** ADR (two ADR sets under audit; narrow scope per dispatch — form-change fidelity, not decision merit)
**Date:** 2026-09-04

## Section 1: Argument Audit

### Summary

- **Genre:** ADR
- **Scope:** narrow — whether the prose-to-Substrate form migration at Cycle 020 BUILD WP-D preserved audit-substance, not whether ADR-099/ADR-100's decisions are correct (they converged at R5 in DECIDE and are out of scope here)
- **Argument chains mapped:** 2 (ADR-099's architecture commitment + nested Authority sub-decision; ADR-100's pre-triage/plain-language commitment + graduation trigger)
- **Issues found:** 0 P1, 1 P2, 3 P3

### Method

Every prose section was diffed programmatically against its derived counterpart (Context, Decision body through each `###` subsection, Rejected alternatives, Consequences, Supersession notes, Provenance check) to catch paraphrase-as-weakening that a manual read could miss. Heading sets, rejected-alternative counts, and forward/backward textual references across the Authority reorder (ADR-099) and Graduation-trigger extraction (ADR-100) were checked directly. The two Substrate JSON records were read to confirm the markdown is a faithful mechanical rendering (it is — every JSON field maps one-to-one onto the corresponding markdown block).

### Findings

**Inferential chain (Check 1).** Programmatic diff of every section found **zero substantive differences** between prose and derived text in both ADRs, across Context, the full Decision body (architecture, six constraints, Complement, Scope-and-tier, Held caveat, Authority's five options A–E, Pre-Triage rules 1–5, Plain-language rules 6–7, Where-the-isolation-lives, Scope/tier/grounding), Rejected alternatives (A–H for ADR-099, A–I for ADR-100), Consequences, and Supersession notes. The only textual deltas are the ones the dispatch brief named as expected: the Authority sub-decision's reorder (ADR-099), the Graduation-trigger extraction and Posture correction (ADR-100), and cosmetic Markdown-list-marker changes in the Provenance-check "Drafting-time synthesis" paragraph (prose paragraph → derived bullet, identical wording) in both files. No warrant, rejected-alternative reason, consequence, or (with one exception below) provenance entry was lost, paraphrased weaker, or altered in meaning.

**Structure (Check 2).** Heading sets match exactly:
- ADR-099: identical `##`/`###` set; the sole difference is Authority's position, which moved from between "Binding design constraints" and "Complement, not substitute" to between "Held caveat (C7)" and "Graduation trigger." Rejected-alternative count: 8 in both (verified by count, not just by eye).
- ADR-100: identical set plus the one named exception, `### Graduation trigger`, promoted out of the "Scope, tier, and grounding" bullet list into its own subsection with byte-identical trigger text. Rejected-alternative count: 9 in both.

**Authority reorder, reference integrity (Check 2, second half).** Traced every `Authority`/`§Authority` occurrence in the derived ADR-099 (lines 5, 56, 57, 77, 95, 109–111, 128). Constraint 5's "resolved explicitly, in §Authority below" (line 57) still points below after the reorder (line 77). No other section — Complement, Scope-and-tier, Held caveat — refers back to Authority with ordinal language ("above"/"below"/"the preceding sub-decision"); each references it by name only, which survives the reorder. **No broken forward or backward reference found.**

**New content — Warrants (Check 3).** ADR-099's 8 warrants and ADR-100's 6 warrants were each checked against the `warrants_for` tag's target text. All 14 are faithful: every warrant's claim text is drawn near-verbatim from the corresponding prose passage, and each `warrants_for` tag names exactly the commitment fragment, sub-decision, or status the claim supports in the prose (e.g., ADR-099's "Spike validation... warrants_for: commitment and constraints 1–6" is accurate because each of the six constraints' prose text independently cites a spike finding as its basis). **No overreach found in either warrants list.**

**New content — Typed Links (Check 3).** All 14 typed links in ADR-099 and all 20 in ADR-100 were checked against body text for asserted-but-unsupported relationships. None found — every note text is either a direct quote or an accurate paraphrase of text present in the body. Two minor completeness gaps are listed under P3 below (not overreach, since nothing asserted is false — just narrower than the body's own text).

**New content — Erratum and corrected §Posture (Check 3).** See P2 finding below.

### P1 — Must Fix

None.

### P2 — Should Fix

**P2-1. ADR-100's erratum states the correction's outcome but not the governance premise that licenses it, and the premise is not self-evident from the ADR alone.**

- **Location:** `docs/decisions/adr-100-pre-triage-at-practitioner-facing-moments.md:1-3` (erratum header) and the corrected §Posture sentence at line 46 (audit trail line 9 also states the fact without the premise).
- **Claim:** The erratum reads: *"This record, the canonical body since BUILD WP-D, carries the accurate statement."* The corrected §Posture body directly states the accurate DECIDE-gate-default / ARCHITECT-gate-ruling account, replacing the prose's erroneous "put to the practitioner at the DECIDE gate as a pivot" sentence.
- **Evidence gap:** The **prose** baseline's own erratum (which the derived form supersedes) was explicit about the constraint it was operating under: *"Erratum 2026-09-04 (Cycle 020 ARCHITECT gate; **body unchanged per ADR-074**)."* Under that regime, the erroneous sentence stayed in the canonical body verbatim; only a header note corrected it, per ADR-074's body-immutability doctrine. The derived form drops that parenthetical and, unlike the prose, **actually rewrites the body sentence**. Neither the derived ADR-100 nor ADR-099 states, within either document, why a body correction is now permitted where it previously was not. The governing distinction — that the prose *file* stays frozen (ADR-074's pattern intact) while the newly-authored *Substrate record* is a fresh authoring, not an edit, and so isn't bound by "body unchanged" — exists and is stated clearly in `.rdd/gates/020-architect-gate.md`'s triage table: *"A dated erratum header added to ADR-100 (ADR-074 header pattern; body untouched) so the next reader does not inherit the overclaim; the WP-D record carries the accurate statement."* That is the premise. It answers the question correctly, but it lives in a gate note's triage-table cell, not in the ADR that makes the claim.
- **Why this matters going forward:** This audit could resolve the gap only because a prose baseline was available to diff against and a gate note happened to state the reasoning. Once the prose files are retired as the checkable baseline (i.e., once Substrate records are the only form future ADRs are authored in), this class of "is this correction actually licensed, or is it quietly overriding ADR-074?" question will have no prose file to check against — only the ADR's own stated reasoning. ADR-100's own rule 6 ("referenced content is inlined at the point of use... bare identifiers are not presented") sets exactly the standard this erratum falls short of by its own lights: the governing citation is a bare identifier away.
- **Recommendation:** Add one sentence to the erratum or to a provenance line, e.g.: *"The prose file at the pre-BUILD-WP-D path remains frozen per ADR-074 (header-only erratum); this record is authored fresh under ADR-099 §Authority option C and is not an edit to that frozen body, so it states the correction directly."* This closes the reasoning chain without changing any substantive claim.

### P3 — Consider

**P3-1. ADR-099's `lineage` typed links (3) under-represent the six prior ADRs the Context prose names.**

- **Location:** `docs/decisions/adr-099-substrate-and-surface-separation.md:16-18` (Typed links: `lineage` → ADR-083, ADR-095, ADR-092) vs. Context paragraph 3 ("Six prior ADRs (064, 083, 084, 085, 092, 095)...").
- **Claim:** The prose (preserved verbatim in the derived Context) names six ADRs as prior audience-bifurcation attempts; the Typed Links list only three.
- **Evidence gap:** No Substrate index records exist yet for ADR-064, ADR-084, or ADR-085 (`docs/substrate/adr/` holds no `adr-064.json`, `adr-084.json`, or `adr-085.json`), so the derivation tool has no valid link target for them. This is a corpus-migration-state artifact (ADR-099 §Authority option C explicitly defers legacy indexing), not a transcription error — and the full six-ADR account survives unabridged in the Context prose, so no audit-substance is lost. It is worth noting because Typed Links is the mechanism ADR-099 itself argues should be the corpus's navigable index; a reader who trusts the index over the prose would currently see half the lineage.
- **Recommendation:** No action required now; expect this to self-resolve as legacy index records for 064/084/085 are authored (constraint 6). Worth a one-line note if/when Typed Links becomes the primary read.

**P3-2. ADR-099's `references → invariant-0` and `references → invariant-8` typed links have no explicit textual anchor in the ADR-099 body.**

- **Location:** `docs/decisions/adr-099-substrate-and-surface-separation.md:26-27`.
- **Claim:** ADR-099 body text never says "Invariant 0" or "Invariant 8" by name (grep confirms only one "Invariant 1" mention, inside the Authority option B discussion — a different invariant).
- **Evidence gap:** The connection is thematically real — the "destination/route/engine" design-target language maps to Invariant 0 (as ADR-100 states explicitly: "the mapping of 'destination' onto Invariant 0's list"), and the Tier-2/not-yet-anchored framing maps to Invariant 8 (as ADR-100 states: "Tier 2 in Invariant 8's sense") — but ADR-099 makes both connections implicitly, never citing the invariant numbers itself. Under Note Discipline (ADR-099 constraint 2), `references`-type links are treated as schema-trivial and exempt from requiring note text, so this isn't a Note Discipline violation; it is a precision gap between what the link asserts and what the citing document itself shows.
- **Recommendation:** No action required; low stakes given `references` links carry the lowest evidentiary weight in the schema. Consider a one-line explicit tie-in if ADR-099 is revised for other reasons.

**P3-3. ADR-100's erratum drops the explicit `.rdd/gates/020-decide-gate.md` file-path citation the prose erratum carried.**

- **Location:** `docs/decisions/adr-100-pre-triage-at-practitioner-facing-moments.md:1-3` vs. prose erratum, which cited `` `.rdd/gates/020-decide-gate.md` `` by path alongside the ARCHITECT-gate path.
- **Claim:** The derived erratum says "The DECIDE gate record shows a stated default, not overridden" without the file path; it keeps the ARCHITECT-gate path citation.
- **Evidence gap:** Purely a citation-precision nit — the path is still discoverable in the same document's Provenance check (line 139: "...the triage tables in `.rdd/gates/020-discover-gate.md`, `020-model-gate.md`, and `020-decide-gate.md`"), so no information is inaccessible, just not co-located with the specific claim it supports.
- **Recommendation:** Restore the inline path if the erratum is touched again; not worth a standalone edit.

## Section 2: Framing Audit

The framing audit is narrowed per the dispatch to the form change itself: did transcribing prose into fields (`warrants_for` tags, sub-decision extraction, rejected-alternatives-with-reasons, typed links) introduce or drop a framing, independent of whether the underlying decisions are right.

### Question 1: What alternative framings did the source material support?

**Alternative A — strict-immutability-preserved migration.** The prose baseline itself, plus ADR-074, supports a framing where the form migration would have kept the ADR-100 body byte-identical to its pre-BUILD state (matching the "body unchanged per ADR-074" pattern the prose erratum already used) and layered the correction entirely in a header/provenance note, exactly as the prose did. Under this framing, the Substrate record's canonical status would be reserved for *new* decisions going forward, and the re-authoring of already-Accepted ADR-099/ADR-100 would carry forward every historical imperfection (including the Posture overclaim) with corrections annotated, not incorporated. This framing is fully supported by the source material (ADR-074's text, the prose erratum's own stated constraint) and was available; the derived form chose differently, correcting the body directly. Neither document argues for this choice over the alternative — see P2-1.

**Alternative B — Typed Links as the primary index, Context prose as supporting detail only.** ADR-099 argues Substrate is "agent-facing primarily" and that Surface Views (including, presumably, a future Typed-Links-driven overview) are how a reader is meant to navigate the corpus at scale. Under that framing, the Typed Links list — not the Context paragraph — is the operative index, and the missing 064/084/085 lineage links (P3-1) would read as a real gap rather than a footnote. The derived form doesn't take this framing explicitly (both the Typed Links and the full Context prose are present, so a reader has both), but it is the framing under which P3-1 would need to be resolved before the corpus scales past a human's ability to cross-check the two.

**Alternative C — treat the erratum as a Pivot rather than a routine fix.** The ARCHITECT gate's own triage table classifies the Posture-overclaim finding as "**Pivot** (framing-class; surfaced whole)" — the corpus's own governance process already recognized this correction as consequential enough to route to the practitioner, not silently resolve. The derived ADR-100's erratum, once authored, presents the outcome in flatter, more administrative language ("carries the accurate statement") than the framing-class weight the gate note gave it. This is a defensible compression (the pivot was already ruled on at the gate; the erratum is recording the ruling's result, not re-litigating it) but it is a framing choice worth naming.

### Question 2: What truths were available but not featured?

- The ARCHITECT gate note's explicit "(ADR-074 header pattern; body untouched)" qualifier for the *prose* file, and its explicit statement that the WP-D record is where the correction actually lands — both true, both available in `.rdd/gates/020-architect-gate.md`, neither is quoted or paraphrased into either derived ADR. This is the fact pattern behind P2-1.
- The six-ADR lineage list's full membership (064, 083, 084, 085, 092, 095) is available and, notably, *is* fully featured — in the Context prose, verbatim. It is the Typed Links rendering that narrows it (P3-1). This is a case where the "truth not featured" is confined to the new structural apparatus, not the document as a whole.

### Question 3: What would change if the dominant framing were inverted?

The form change's dominant framing is *trust the newly-authored Substrate record; the prose file is retired.* Inverting it — *trust the prose baseline as the check on the record, the way this audit did* — doesn't change any claim in either ADR, but it does expose a structural risk worth naming: this audit could verify P2-1's premise only because a prose baseline still existed to diff against and a gate note happened to carry the missing reasoning. Once Substrate becomes the sole form new decisions are authored in (no prose baseline, per ADR-099 §Authority option C), a future body correction to an already-canonical record would have no external check of this kind available — the record's own stated reasoning would be the only defense against a silent, unauthorized rewrite of an otherwise-immutable body. That argues for treating "does every body correction cite the governance basis for correcting it" as a standing check, not a one-time diff against a prose file that won't exist for future units.

### Framing Issues

**P3 — The erratum's administrative framing understates the correction's own governance weight relative to how the ARCHITECT gate itself classified it.**
- **Location:** `docs/decisions/adr-100-pre-triage-at-practitioner-facing-moments.md:1-3`; compare `.rdd/gates/020-architect-gate.md` triage table, row 1 ("**Pivot** (framing-class; surfaced whole)").
- **Claim:** The erratum presents the correction as settled fact ("carries the accurate statement") with no signal that the underlying finding was dispositioned as a framing-class Pivot at the gate that produced it.
- **Evidence gap:** Not a contradiction — the pivot was ruled on before this record was authored, so recording only the outcome is defensible. But a reader of the ADR alone, without the gate note, would not know the correction had been a Pivot-tier finding rather than a routine copyedit.
- **Recommendation:** Optional. If the erratum is revisited, one clause ("ruled as a framing-class pivot at the ARCHITECT gate, 2026-09-04") would carry that weight forward without re-litigating it. This is a lower-stakes restatement of P2-1's underlying gap and is not counted separately in the round's P2 tally below.

## Convergence-Saturation Signal (ADR-094)

**Convergence-Saturation Signal:** TRIGGERED
- Round number: R1 (form-change baseline reset per ADR-094 — this is the first argument-audit round on the derived-markdown form; it does not continue the Cycle 020 DECIDE-phase R1–R5 sequence that produced the prose baseline)
- P1 count this round: 0 (0 argument-audit P1 + 0 framing-audit P1)
- P2 count this round (new, non-carry-over): 1 (P2-1, argument audit; the Framing Issues P3 is an explicit restatement of the same underlying gap and is not counted a second time)
- New framings or claim-scope expansions: none. The three named alternative framings in Section 2 Q1 are the auditor's analysis of the form-change mechanics, not new warrants or claim-scope characterizations introduced by ADR-099 or ADR-100 themselves — every substantive claim, warrant, and rejected alternative traced back to content that was already part of the R5-converged prose argument. The one new fact this round surfaces (the erratum's governance premise) is a completeness gap in self-documentation, not a new claim about either decision's merits.
- Recommendation: STOP at this round

*The form change preserved audit-substance essentially completely: zero lost or altered warrants, sub-decisions, rejected-alternative reasons, or consequences across two ADRs; the one intended structural exception (Authority reorder) breaks no reference; the one named exception (Graduation-trigger extraction) carries identical trigger text. The single P2 finding is a self-documentation gap (the erratum states its conclusion without inlining the governance premise that licenses it) rather than a fidelity failure of the transcription itself, and is fixable with one sentence. No re-audit is required before this work is treated as settled; a practitioner may choose to patch P2-1 opportunistically without triggering a mandatory re-audit round, since no P1 exists and no revision to either ADR's substantive content is implied.*
