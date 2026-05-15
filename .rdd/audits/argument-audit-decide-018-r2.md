# Argument Audit Report (R2 — Re-audit after revision)

**Audited document:**
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-092-essay-outline-as-research-artifact.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-093-argument-auditor-graph-traversal.md`

**Source material:**
- `/Users/nathangreen/Development/rdd/docs/essays/017-outlines-as-research-artifacts-prose.md`
- `/Users/nathangreen/Development/rdd/docs/essays/017-outlines-as-research-artifacts-outline.md`
- `/Users/nathangreen/Development/rdd/docs/domain-model.md` (Amendment 23 vocabulary)
- `/Users/nathangreen/Development/rdd/.rdd/gates/018-model-gate.md`
- `/Users/nathangreen/Development/rdd/.rdd/audits/susceptibility-snapshot-018-model.md`
- `/Users/nathangreen/Development/rdd/.rdd/gates/018-discover-gate.md`
- `/Users/nathangreen/Development/rdd/.rdd/cycle-status.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-067-three-tier-enforcement-classification.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-089-adr-067-harness-layer-revision.md`
- `/Users/nathangreen/Development/rdd/agents/argument-auditor.md`
- `/Users/nathangreen/Development/rdd/.rdd/audits/argument-audit-decide-018.md` (R1, for revision-target verification)

**Date:** 2026-05-14

---

## R1 Revision Summary

R1 identified 0 P1, 4 P2, 3 P3 argument-audit issues and 2 P2, 1 P3 framing-audit issues. The author auto-corrected the argument-audit P2 and P3 issues. Framing-audit findings F2 (SYNTHESIZE-framing subordination) and F3 (Kim et al. Open Question 7 absence) were deferred to the gate per RDD methodology and are not in scope for this re-audit.

This report:
- (a) Verifies that each auto-corrected revision substantively addresses the R1 finding
- (b) Detects any new issues the revisions introduced
- (c) Confirms findings that are fully resolved
- (d) Labels carried-forward gate items as such

---

## Section 1: Argument Audit

### Summary

- **Argument chains mapped:** 11 (unchanged from R1 — no new chains introduced)
- **R1 findings verified:** 7
- **R1 findings resolved:** 6
- **R1 findings requiring attention:** 1 (partial resolution; see below)
- **New issues introduced by revisions:** 2 (1 P2, 1 P3)
- **Net new issues:** 3 (1 P2 carried from R1 partial, 1 new P2, 1 new P3)

---

### R1 Finding Verification

#### Issue 2.1 (R1 P2) — Loop C provenance: RESOLVED

**R1 finding:** The Loop C critical-flaw argument was labeled as "Loop C critical-flaw evidence" without preserving the distinction between the Docherty & Smith finding (surveyed literature) and the RDD-context AI-agent inference (cycle's own synthesis). Rejected Alternative #4 presented it as evidence without the cycle-synthesis qualifier.

**What the revision did:** ADR-092 §Context paragraph 3 (the Loop C bullet) now explicitly states: "The Loop C argument combines the Docherty & Smith finding (mandatory headings within prose do not address invisible-synthesis-in-connective-tissue) with an RDD-context inference about AI-agent-produced prose — the inference is the cycle's own synthesis, not a surveyed-source empirical finding. Outline form makes claim-warrant-evidence structure structurally visible; the differential against audit-extended prose is theoretical-plus-directional, not multi-cycle empirical."

Rejected Alternative #4 reads: "the Loop C critical-flaw evidence — audit-extended prose cannot separate rhetorical force from logical force in AI-agent-produced text, so framing adoption can occur within a well-headed prose section without detection. CALIBRATION-bullet discipline within prose is structurally analogous to Outline-Production Discipline within outline, but the prose form retains the connective-tissue susceptibility surface that outline form removes. The Loop C argument is the load-bearing distinction with one explicit scope-of-claim caveat: the inference combines the Docherty & Smith observation (within-prose discipline insufficient against the connective-tissue surface) with an RDD-context inference about AI-agent-produced prose; the combined inference is the cycle's own synthesis rather than a peer-reviewed empirical finding for AI-agent-produced prose specifically."

**Verification result:** Substantive. The revision adds the cycle-synthesis qualifier at both the Context bullet and the Rejected Alternative. R1 Framing Issue F1 (same root cause) is therefore also addressed. This finding is fully resolved.

---

#### Issue 2.2 (R1 P2) — ADR-093 dependency in §5: RESOLVED

**R1 finding:** ADR-092 §5's claim that "the Pyramid Refinement audit catches discipline failures" depended on the argument-audit actually firing on Essay-Outline artifacts, but did not name ADR-093 as the precondition. The Cycle 10 prose-hardening analog was mentioned as an open question without the cross-reference making the dependency structurally visible.

**What the revision did:** ADR-092 §5 now contains an explicit final paragraph: "This claim depends on the argument-audit actually firing on Essay-Outline artifacts; the Skill-Structure Layer amendment in ADR-093 (Argument-Graph consumption + pyramid graph-traversal + expansion-fidelity verification) is the precondition that makes the structural catch reliable. Without ADR-093 implemented, the convention layer is the only backstop and the layer separation degrades to discipline-alone — the very Invariant 8 risk the form change is designed to mitigate. The two ADRs ship together; the layer separation's reliability is conditional on both decisions being implemented."

The Cycle 10 analog is now referenced: "Outline-Production Discipline's reliability under task load is an open question structurally analogous to the Cycle 10 'prose-hardening-doesn't-work' finding (disciplinary instructions in skill text failed under task load)."

**Verification result:** Substantive. Both the ADR-093 precondition cross-reference and the Cycle 10 analog are present. The dependency is now explicit and the scope-of-claim is honest. This finding is fully resolved.

---

#### Issue 2.3 (R1 P2) — Three Pyramid Refinement alternatives: RESOLVED

**R1 finding:** The susceptibility snapshot's Finding 1 named three alternative framings for Pyramid Refinement (flat four-section, two-level hierarchy, conventional ordering) that were not engaged before the concept was adopted. The ADR's Rejected Alternatives did not contain these rejections, leaving the Model-gate warrant gap unaddressed in the ADR.

**What the revision did:** ADR-092 §2 (Pyramid Refinement as the structural property) now contains an explicit subsection: "Three structural alternatives to the refinement hierarchy were considered and not adopted (named by the MODEL-gate susceptibility snapshot as the warrant-gap targets and addressed at the gate via Target 1 grounding)." The three alternatives are:

- **(a) Flat four equal sections** — Rejected because the sections are not informationally symmetric; the compliance test (a)–(d) cannot be defined against flat peer sections; it requires the level boundaries that the hierarchy creates. The expansion-fidelity verification target and the Outline-Coherence Signal stewardship trigger both depend on the hierarchy.
- **(b) Two-level hierarchy** — Rejected because the Argument-Graph → Citation-Embedded Outline expansion is itself a refinement relationship that disappears under a two-level structure. The auditor's traversal across each named refinement requires three levels as the minimum.
- **(c) Conventional rather than structural framing** — Rejected because the compliance test (a)–(d) cannot license the Outline-Coherence Signal stewardship trigger without being structural: a "recommended ordering" cannot fail; only a "structural property" can fail in a way that signals scope or discipline problems.

**Verification result:** Substantive. All three alternatives are named with the rejection reasoning tied explicitly to load-bearing downstream uses (the compliance test, the expansion-fidelity target, the Outline-Coherence Signal stewardship trigger). The alternatives cross-reference the MODEL gate and the susceptibility snapshot explicitly. The snapshot's warrant gap is closed in the ADR. This finding is fully resolved.

---

#### Issue 2.4 (R1 P2) — ADR-067 citation chain in ADR-093: RESOLVED

**R1 finding:** ADR-093 §Context paragraph 3 cited "ADR-067" without noting ADR-089's partial supersession. The claim is correct (Skill-Structure Layer is unchanged by ADR-089) but the citation chain was incomplete for a reader following the reference.

**What the revision did:** ADR-093 §Context paragraph 3 now reads: "This ADR records the decision to anchor the auditor's expanded scope in the **Skill-Structure Layer** (the substrate named in ADR-067 as updated by ADR-089 — the Skill-Structure Layer for mechanisms whose enforcement technique is a concrete workflow step in a named skill, whose primacy and technique are unchanged by ADR-089's Harness Layer revision)."

**Verification result:** Substantive. The citation chain now includes both ADR-067 and ADR-089, with the clarifying note that ADR-089's amendment does not affect the Skill-Structure Layer's character. A downstream reader following either reference will not encounter an apparent inconsistency. This finding is fully resolved.

---

#### Issue 3.1 (R1 P3) — SHOULD vs. MUST + traversal fallback: RESOLVED (with qualification)

**R1 finding:** ADR-092 §4 used SHOULD for the body-subsection anchor requirement, creating a consistency tension with ADR-093 §2's Tier 3 traversal (which relies on the anchors being present). The auditor could not distinguish "body content exists but author didn't anchor" from "body content is genuinely absent." R1 recommended either strengthening to MUST or adding a fallback traversal procedure in ADR-093 §2.

**What the revision did — ADR-092 §4:** The SHOULD has been replaced with MUST throughout the anchor-convention sentence: "Citation-Embedded Outline body subsections **MUST** anchor to one or more Argument-Graph node identifiers via a parenthetical at the end of the section heading." Additionally, the revision introduces a `META` reserved identifier convention: "Body content that genuinely does not develop a named graph node — for example, methodology preamble, scope-setting introductions, or appendix-style background — is anchored to a reserved identifier `META` (e.g., `### Methodology preamble (META)`) so the auditor recognizes the section as deliberately non-developmental rather than as a missing anchor."

**What the revision did — ADR-093 §2 Tier 3:** The traversal instruction now reads: "A body subsection lacking any parenthetical anchor (graph identifier or `META`) is treated as a missing-anchor violation and reported as a P1 expansion-fidelity violation per §3 (Reverse Boundary 2)."

**Verification result:** Substantive. The MUST change in ADR-092 §4 and the P1 missing-anchor violation in ADR-093 §2 Tier 3 are present and consistent. The META reserved identifier handles the legitimate case of non-developmental sections cleanly. However, a minor new issue arises from the interaction between the MUST convention and the META exemption (see New Issue N1 below). The core R1 finding is resolved; the new issue is a P3 introduced by the revision.

---

#### Issue 3.2 (R1 P3) — Rhetorical phrasing: RESOLVED

**R1 finding:** ADR-092 §Consequences Negative bullet 3 contained the phrasing "the production-time cost is a feature, not a bug" — rhetorical advocacy packaging without additional argument.

**What the revision did:** The text now reads: "Mitigation: this cost is the mechanism through which the audit-fidelity advantage is realized — explicit structure requires explicit composition. The cost is bounded — outline form's production cost is comparable to (and in Cycle 018's experience, lower than) prose form's, because outline form does not require connective-tissue prose."

**Verification result:** Substantive. The rhetorical phrasing has been replaced with the logical claim the sentence was meant to carry. The consequence bullet is now argumentative rather than rhetorical. This finding is fully resolved.

---

#### Issue 3.3 (R1 P3) — Boundary 3 severity: RESOLVED

**R1 finding:** ADR-093 §3 Boundary 3 left undefined whether the argument-auditor reports a citation-not-in-References violation as P1 or P2 when the citation-auditor is the primary verifier. The interaction between the two agents' severity assignments was underdefined.

**What the revision did:** ADR-093 §3 Boundary 3 now reads: "This boundary overlaps with the citation-auditor's responsibilities; the argument-auditor reports the boundary as part of the pyramid coverage map, deferring citation-existence verification to the citation-auditor.) Severity coordination: Boundary 3 violations detected by the argument-auditor during pyramid traversal are reported as **P2** (the citation-auditor's P1 takes precedence over the argument-auditor's structural finding for the same error, avoiding double-counting at the gate). If the dispatch brief indicates the citation-auditor has not yet run on the same artifact, the argument-auditor escalates the violation to **P1** with a note that the citation-auditor is the primary verifier — the escalation ensures the violation is not silently dropped when the upstream verifier is absent."

**Verification result:** Substantive. The P2/P1-escalation coordination is now specified with the conditional: P2 when the citation-auditor has already run; P1 escalation with note when it has not. The double-counting concern is addressed. This finding is fully resolved.

---

### P1 — Must Fix

None.

---

### P2 — Should Fix

**New Issue N1 — Introduced by R1 revision**

- **Location:** ADR-092 §4 (Argument-Graph format conventions), META identifier convention; ADR-093 §2 Tier 3
- **Claim:** Body subsections MUST anchor to either a graph-node identifier or the reserved `META` identifier. The META identifier is for "methodology preamble, scope-setting introductions, or appendix-style background." ADR-093 §2 Tier 3 states: "A body subsection lacking any parenthetical anchor (graph identifier or `META`) is treated as a missing-anchor violation and reported as a P1 expansion-fidelity violation."
- **Evidence gap:** The MUST + META + P1-on-missing combination is internally coherent, but neither ADR specifies who determines whether a section qualifies for META designation. The META label is author-applied (the author decides a section is non-developmental). An author under task load may apply META to avoid the overhead of anchoring sections that are actually developmental — reducing the P1 trigger from a structural enforcement to an honor-system convention. This is the Invariant 8 pattern applied one level lower: the META exemption is itself a judgment-anchored escape hatch that could absorb what it was designed to surface. Neither ADR acknowledges this as a risk. The revision resolves the R1 SHOULD/MUST gap at the cost of introducing a semantically-equivalent escape hatch in the META convention.
- **Recommendation:** Add a sentence in ADR-092 §4 noting that META is an author declaration subject to audit-time review: "The auditor verifies that META-anchored sections are non-developmental in character (do not develop a named claim, warrant, or evidence node). A section anchored to META that contains claim/warrant/evidence bullets is a misclassification and should be reported as a P2 (the section belongs under a named graph node, not META)." This closes the judgment-anchored escape hatch without requiring structural enforcement.

---

### P3 — Consider

**New Issue N2 — Introduced by R1 revision**

- **Location:** ADR-092 §2, three-alternatives subsection, final sentence
- **Claim:** "These alternatives were named by the MODEL gate's susceptibility snapshot (Finding 1) as warrant-gap candidates; the Target 1 Grounding Reframe at the same gate confirmed that 'expand cleanly' is operationalizable on a worked example (the existing Cycle 018 outline-form essay) and the three rejections are recorded here so a downstream reader can trace the rationale."
- **Observation:** The sentence is accurate, but the paragraph refers to the three alternative rejections as being "addressed at the gate via Target 1 grounding." The susceptibility snapshot's Finding 1 named these alternatives as unengaged before adoption; the Target 1 Grounding Reframe at the gate tested whether "expand cleanly" was operationalizable on a worked example — which is a different confirmation than testing whether the three-level structure is better than the flat or two-level alternatives. The Target 1 Grounding Reframe grounded the compliance test, not the choice between three levels versus two levels or flat. The three-alternative rejections in the ADR are written as post-hoc argument synthesis (drafted in the ADR), not as gate-grounded outcomes. Calling them "addressed at the gate via Target 1 grounding" slightly overstates the gate's epistemic contribution to these specific rejections. This is a provenance precision issue, not a logical error, but the ADR's otherwise high provenance-transparency standard warrants naming the distinction.
- **Recommendation:** Change "addressed at the gate via Target 1 grounding" to "the gate's worked-example grounding confirmed that 'expand cleanly' is operationalizable; the three rejections are DECIDE-phase synthesis applying the compliance test's structure to the three structural alternatives named in the snapshot." This preserves accurate provenance without understating what the gate contributed.

---

### Confirmed Resolved (Clean)

The following R1 findings are fully resolved and introduce no follow-on issues:

| R1 Issue | Location | Resolution status |
|----------|----------|------------------|
| 2.1 Loop C provenance (P2) | ADR-092 §Context bullet 3 + Rejected Alt. #4 | Resolved. Cycle-synthesis qualifier added at both locations. |
| 2.2 ADR-093 dependency in §5 (P2) | ADR-092 §5 final paragraph | Resolved. Explicit ADR-093 precondition statement present; Cycle 10 analog referenced. |
| 2.3 Three Pyramid Refinement alternatives (P2) | ADR-092 §2 new subsection | Resolved. All three alternatives named with substantive rejections; snapshot cross-reference present. |
| 2.4 ADR-067 citation chain (P2) | ADR-093 §Context paragraph 3 | Resolved. "ADR-067 as updated by ADR-089" language present; Skill-Structure Layer primacy clarified. |
| 3.1 SHOULD vs. MUST + traversal fallback (P3) | ADR-092 §4 + ADR-093 §2 Tier 3 | Resolved (core). MUST present; META reserved identifier convention present; P1-on-missing in ADR-093. New N1 introduced (see above). |
| 3.2 Rhetorical phrasing (P3) | ADR-092 §Consequences Negative bullet 3 | Resolved. Replaced with logical claim. |
| 3.3 Boundary 3 severity (P3) | ADR-093 §3 Boundary 3 | Resolved. P2/P1-escalation coordination specified. |

---

### R1 Framing Issues — Carried-Forward Status

**Framing Issue F1 (R1 P2):** The Loop C claim's provenance was understated in Rejected Alternatives #4 and #8. This was the same root cause as Issue 2.1. The revisions to §Context and Rejected Alternative #4 address F1 simultaneously. **F1 is resolved.**

**Framing Issue F2 (R1 P2) — SYNTHESIZE framing subordination:** Not in scope for this re-audit. Deferred to gate per RDD methodology. Carried forward as framing-audit finding for gate review.

**Framing Issue F3 (R1 P3) — Kim et al. Open Question 7 absence:** Not in scope for this re-audit. Deferred to gate per RDD methodology. Carried forward as framing-audit finding for gate review.

---

## Section 2: Framing Audit

### Summary

The framing audit re-reads the primary documents against the same source material as R1. The R2 framing audit has two purposes: (a) confirm that the revisions did not introduce new framing problems; (b) restate the carried-forward gate items so the gate reviewer has them consolidated.

---

### Question 1: What alternative framings did the evidence support?

The three alternative framings identified in R1 (downstream-consumption-optimization, scope-validation-forcing-function, SYNTHESIZE-pattern-extension) remain present in the source material and are not addressed by the revisions. The revisions addressed argument-audit issues only; they do not affect framing choices. The R1 framing-audit analysis (Question 1) remains current with no changes.

The revisions introduce one framing micro-issue worth noting: the new three-alternatives subsection in ADR-092 §2 frames the rejection of the flat-section and two-level alternatives partly in terms of what the compliance test "requires" — that is, the compliance test is stated as the prior constraint that licenses rejecting the alternatives. A reader who did not know the compliance test was itself derived at the MODEL gate (not delivered to the ADR independently) might read the framing as if the compliance test existed first and the structural hierarchy was derived from it, rather than the actual order (user stated pyramid → compliance test operationalized). This is a minor provenance-framing issue (mitigated by the Provenance Check section at the end of ADR-092 which correctly attributes the compliance test to the Target 1 grounding action) and does not rise to a P2. It is noted for completeness.

---

### Question 2: What truths were available but not featured?

The three truth-gaps identified in R1 (iterative-audit cost implications; Kim et al. Open Question 7; methodology compromise at phase exit) remain absent or underrepresented in both ADRs. The revisions did not address these. R1's analysis (Question 2) remains current.

No new underrepresented truths are introduced by the revisions. The new three-alternatives subsection in ADR-092 §2 adds content that was genuinely absent (the MODEL gate's warrant-gap alternatives) and does not create new absences.

---

### Question 3: What would change if the dominant framing were inverted?

The inversion analysis from R1 (audit-extended prose is adequate; the Loop C inference is untested) remains current. The revisions strengthen the ADR's position on this inversion by adding an explicit scope-of-claim caveat on the Loop C argument in both the Context and Rejected Alternative #4 — the ADR is now more honest about what the Loop C claim does and does not establish. A reader who takes the inverted framing seriously will find the R2 ADR a somewhat harder target than the R1 ADR, because the scope-of-claim is now visible rather than elided. The inversion remains a real challenge (the evidence base is theoretical-plus-directional), but the ADR's treatment of it is more calibrated than in R1.

---

### Framing Issues

**Framing Issue F1 (R1 P2) — RESOLVED by revisions.** Loop C provenance in Rejected Alternatives #4 and #8 now carries the cycle-synthesis qualifier. See Section 1 confirmation above.

---

**Framing Issue F2 (carried forward to gate — not in R2 scope)**

- **Location:** ADR-092 overall structure; §9 (SYNTHESIZE precedent) relegated to final neutral-consequences subsection
- **Framing gap:** The SYNTHESIZE-pattern-extension framing is the most direct user-stated criterion from the discover gate ("same logic as synthesis") and is the framing with the strongest provenance (user-stated at DISCOVER, confirmed at the Provenance Check as "driver-derived; user-stated"). ADR-092's dominant framing (susceptibility-surface reduction as the lead justification) depends on the Loop C inference (cycle synthesis, now honestly labeled). The simpler and better-grounded argument — RESEARCH currently diverges from SYNTHESIZE's existing pattern without principled rationale; the form change names what was already working and extends it upstream — is present in §9 but subordinated as a neutral consequence rather than elevated as a positive lead argument. Under this subordination, the ADR appears to argue more than the evidence supports (susceptibility reduction as "load-bearing") when the structurally simpler argument (internal methodology consistency with existing SYNTHESIZE pattern) is available and less dependent on the Loop C inference.
- **Gate action:** Surface to user at the DECIDE gate. The user may confirm the susceptibility-reduction framing as the intended lead justification (in which case the framing is a deliberate strategic choice, not an oversight), or may choose to elevate §9's SYNTHESIZE-precedent framing. Either outcome is valid; the gate's job is to make the choice visible.

---

**Framing Issue F3 (carried forward to gate — not in R2 scope)**

- **Location:** ADR-092 §Consequences; ADR-093 §Consequences
- **Framing gap:** Neither ADR includes Open Question 7 (Kim et al. 2025 input-side susceptibility) in its Consequences section. The form change is framed as reducing susceptibility, but the source material (model gate, cycle-status, prose essay §3) explicitly holds open whether output-side susceptibility reduction is offset by input-side over-weighting in downstream agents consuming outline-structured inputs. The discover gate held this as "not a DECIDE blocker" but that is a process designation, not a claim about the question's significance. The ADR's Positive Consequences section presents susceptibility reduction as a clean win without acknowledging the theoretical counterpoint the cycle itself surfaced.
- **Gate action:** Surface to user at the DECIDE gate. The minimal remediation would add one sentence to ADR-092's Neutral consequences: "Whether the form change's output-side susceptibility-surface reduction is offset by input-side susceptibility effects in downstream agents consuming the Essay-Outline (per Kim et al. 2025) is an open empirical question; future cycles can test this by comparing downstream-agent behavior on Essay-Outline input versus prose-essay input." The user decides whether to add this or accept the current framing with the gate note as the record.

---

### Net framing status

| R1 Framing Issue | Status |
|-----------------|--------|
| F1 — Loop C provenance in Rejected Alts. (P2) | Resolved by revisions |
| F2 — SYNTHESIZE framing subordination (P2) | Carried forward to gate |
| F3 — Kim et al. Open Question 7 absence (P3) | Carried forward to gate |

No new framing issues were introduced by the revisions.

---

## Closure Assessment

The R2 re-audit finds:

- All 7 R1 argument-audit issues are substantively addressed by the revisions. None are perfunctory.
- The revisions introduced 2 new issues: N1 (P2 — META reserved identifier as judgment-anchored escape hatch) and N2 (P3 — minor provenance precision on the three-alternatives subsection).
- R1 Framing Issue F1 is resolved. R1 Framing Issues F2 and F3 are carried forward to gate as specified.

**Cycle advance condition:** Per the RDD DECIDE skill's revision-loop closure condition, the cycle can advance to scenarios if the practitioner judges N1 and N2 acceptable or addresses them. N1 is a genuine P2 (the META exemption's honor-system character is an Invariant 8-adjacent risk worth naming) and should be reviewed before advance. N2 is a P3 (provenance precision) that does not block advance.
