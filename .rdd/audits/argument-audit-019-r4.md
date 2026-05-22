# Argument Audit Report — Cycle 019, R4

**Audited document:** `docs/essays/essay-outline-018-does-rdd-over-engineer.md` (revised post-R3)
**Source material:**
- R3 audit: `.rdd/audits/argument-audit-019-r3.md` (remediation baseline)
- R2 audit: `.rdd/audits/argument-audit-019-r2.md` (prior baseline)
- R1 audit: `.rdd/audits/argument-audit-019.md` (original findings)
- Citation audit: `.rdd/audits/citation-audit-019.md` (Boundary 3 context)
- Research log: `docs/essays/research-logs/research-log.md` (§Loop 6 and §Loop 6.1–6.2)

**Genre:** Essay-Outline (per ADR-093 §1)
**Date:** 2026-05-16
**Auditor:** argument-audit skill (claude-sonnet-4-6), R4 dispatch

**R4 scope:** Post-R3 remediation verification. Six targeted repairs were applied (P1 Boundary 1 C5 mismatch; P2-R3-1 W7.1 qualifier; P2-R3-2 W7.3 scope; P2-R3-3 Section 3 staleness; P2-R3-4 C1/C7 superlative framing; P2-R3-5 agent-generation disclosure). The Tier-2 downgrade for ADR-CANDIDATE-019.4 was also integrated across four touch points as a gate-decision follow-through. R4 verifies all six repairs, audits the Tier-2 integration for consistency, rebuilds the pyramid coverage map, and runs the framing audit with specific attention to whether the Tier-2 downgrade introduced new framing biases.

---

## Section A — R3 Finding Remediation Review

### P1: Boundary 1 violation — Argument-Graph C5 contradicts Abstract C5

**R3 finding:** The Argument-Graph C5 node retained the R2 text ("Branch A held for a future cycle on amendment-size grounds") while the Abstract C5 and Section 6 SYNTHESIS had been updated to reflect Branch A's promotion to in-cycle as ADR-CANDIDATE-019.4.

**Revision applied:** The Argument-Graph C5 now reads: "Branch D and Branch A (reframed) are both promoted to in-cycle ADR candidates. Branch D was promoted at the audit framing finding F-P3; Branch A's specific remedy is reframed (per Loop 6 cross-project evidence) from per-cycle chain weight to the empirical-grounding criterion at DECIDE — now ADR-CANDIDATE-019.4 (see C7)."

**Verification:** The Abstract C5 (line 14) and the Argument-Graph C5 (line 59) are now consistent. Both reflect both Branches D and A as in-cycle candidates, with A reframed as ADR-CANDIDATE-019.4. Section 6 SYNTHESIS is also consistent.

**Verdict: RESOLVED.**

---

### P2-R3-1: W7.1 warrant overstates the pattern ("research-driven cascades" omitting "without empirical filter")

**R3 finding:** W7.1 said "kitchen-sink is localized to research-driven cascades" implying research-driven provenance causes kitchen-sink, when the operative variable is the absence of empirical filter (plexus ADR-038 is research-justified but correctly filtered at DECIDE, so "research-driven" alone is not sufficient).

**Revision applied:** W7.1 now reads: "kitchen-sink is localized to research-driven cascades *that lack empirical filter at DECIDE*" with an explicit scope qualification: "(SCOPE QUALIFICATION: plexus ADR-038 is itself research-justified but was correctly filtered at DECIDE — 'research-driven' alone is not sufficient for kitchen-sink. The operative condition is research-driven AND absence-of-empirical-filter.)"

**Verification:** The qualifier is present at the warrant level in the Argument-Graph (line 75). The Section 8 body W7.1 heading also now reads "kitchen-sink is localized to research-driven cascades" — without the full qualifier at the heading level, but the SYNTHESIS-BULLET under W7.1 in Section 8 reads "YAGNI as the dominant pattern when DECIDE applies empirical filter; kitchen-sink as the localized failure mode when DECIDE does not," which correctly scopes the claim. The Argument-Graph warrant carries the explicit qualification. This is sufficient.

**Verdict: RESOLVED.**

---

### P2-R3-2: W7.3 warrant is an unqualified negative claim from a single-cycle anchor

**R3 finding:** W7.3's label "Auto-mode BUILD does NOT cause kitchen-sink" was an unqualified negative from a single affirmative instance (llm-orc Cycle 6). The Section 9 caveat named the single-cycle anchor but the warrant label itself did not.

**Revision applied:** The Argument-Graph W7.3 now reads: "*(working hypothesis, single-cycle anchor)* The observed auto-mode BUILD instance (llm-orc Cycle 6) did not produce kitchen-sink elaboration; in that case the kitchen-sink mechanism operated upstream at DECIDE rather than at BUILD. The warrant does NOT support a general claim about auto-mode-vs-gated-mode at the BUILD layer; it supports the more specific claim that the remedy site for the C7 mechanism is DECIDE, not BUILD."

**Verification:** The "(working hypothesis, single-cycle anchor)" prefix directly names the epistemic status. The warrant's self-limitation statement ("does NOT support a general claim about auto-mode-vs-gated-mode") is explicit. The Section 8 body W7.3 heading reads "Auto-mode BUILD does NOT cause kitchen-sink in observed evidence" — the qualifier "in observed evidence" narrows the claim to the sample. A slight assertiveness remains in the body heading's form ("does NOT cause") but the Argument-Graph warrant's explicit self-limitation is the load-bearing text, and the body heading carries "in observed evidence." The residual assertiveness in the body heading is P3-level at most — the argument structure is now honest about its epistemic status.

**Verdict: RESOLVED.** (One P3 residual noted in Section D below — the body W7.3 heading retains "does NOT cause" phrasing where "did not produce" would be more precisely past-tense; this is editorial, not structural.)

---

### P2-R3-3: Section 3 (C2) SYNTHESIS body text is stale

**R3 finding:** Section 3's SYNTHESIS bullet stated "additional candidates (Branches A and D) are recorded for future cycles" when both are now in-cycle candidates.

**Revision applied:** Section 3's SYNTHESIS now reads: "The cycle identifies **four** in-cycle ADR candidates (Branches B, E, D, and A-reframed-as-empirical-grounding-criterion-at-DECIDE per Loop 6 evidence) — each addressing a specific layer where the calibration pattern can extend. The progression of in-cycle scope across cycle revisions (two → three → four ADR candidates) tracks the audit + gate-feedback + Loop 6 findings."

**Verification:** The SYNTHESIS correctly records all four in-cycle candidates. No remaining reference to Branches A or D as future-cycle. The progression narrative (two → three → four) is accurate relative to the documented revision history.

**Verdict: RESOLVED.**

---

### P2-R3-4: Abstract C1/C7 both claim superlative accuracy without establishing the refinement relationship

**R3 finding:** The Abstract presented C1 ("The over-engineering question resolves into a calibration question") and C7 as parallel "most accurate" framings without making the hierarchy explicit — C7 is a mechanism-level specification within C1's calibration framing, not a parallel competing diagnosis.

**Revision applied:** Abstract C7 now includes: "C7 refines C1's calibration framing by naming a specific mechanism... C7 does NOT supersede C1 — it specifies the load-bearing mechanism within C1's calibration framing."

**Verification:** The refinement-not-supersession relationship is explicit in the Abstract at line 16. A reader of the Abstract alone now receives the hierarchy: C1 is the framing; C7 is the mechanism within that framing. The parallel-superlative tension is resolved.

**Verdict: RESOLVED.**

---

### P2-R3-5: Loop 6.2 agent-generated investigations not disclosed as such in the body or Section 9 caveat

**R3 finding:** The three Loop 6.2 investigations were agent-conducted parallel subagent dispatches, not independent practitioner readings. The Section 9 caveat named the sampling scope but not the agent-generation provenance. R3 recommended adding one sentence to the Section 9 Loop 6 sampling scope caveat disclosing this.

**Revision applied:** The agent-generation disclosure was added to the evidence nodes in the Section 8 body. Each Loop 6.2 evidence node now carries a parenthetical: "*(per Loop 6.2 zani investigation 2026-05-16 — *agent-generated investigation report; sampled ~10/18 ADRs in depth*)*" (and equivalent for llm-orc and plexus).

**What is still missing:** The Section 9 Loop 6 sampling scope caveat (lines 204–205) does NOT contain the recommended disclosure sentence: "The investigations were conducted by parallel agent subagents dispatched on 2026-05-16; findings are reported against specific file paths that are verifiable, but LOC counts, quote accuracy, and feature characterizations carry agent-reading uncertainty." The R3 recommendation was to place this in Section 9 specifically because that is where scope-of-claim caveats live at the document level. The Section 8 evidence-node disclosures are correct additions, but they are per-evidence-node — a reader processing Section 9's scope-of-claim caveats will not encounter the agent-generation disclosure unless they read every evidence node in Section 8 first.

**Verdict: PARTIALLY-RESOLVED.** The evidence-node disclosures in Section 8 substantially address the epistemic transparency gap. The Section 9 caveat-level disclosure sentence, which is the appropriate document-level anchor for the epistemic risk, was not added. The remaining gap is P2-level: a reader of Section 9's scope caveats receives sampling-scope and kitchen-sink-by-delegation caveats but does not receive the agent-generation provenance disclosure.

---

### P3-R3-1: E7.4.1 practitioner gate response has no standalone References entry

**R3 finding:** E7.4.1 cites "Practitioner gate response, 2026-05-16, recorded verbatim" but there was no corresponding References entry.

**Revision applied:** A standalone References entry has been added: "*Cycle 019 practitioner gate response* (2026-05-16): recorded verbatim in `docs/essays/research-logs/research-log.md` §'Step 5.1 — Practitioner gate response' (the verbatim text *'what is GOOD about RDD is its propensity to work with nuance'* anchors W7.4)."

**One minor accuracy issue:** The References entry cites "§'Step 5.1 — Practitioner gate response'" as the section anchor in the research log. The research log has no heading labeled "Step 5.1." The practitioner gate response text appears within the "Loop 6: Re-opened RESEARCH on the v1-build translation question (gate-feedback)" section (line 542), without a "Step 5.1" subsection header. The cited section anchor does not exist. A reader following the citation chain to verify E7.4.1 will find the loop 6 section and the verbatim text, but under a different heading than cited. This is a Boundary 3 transparency gap — the citation resolves in substance but the cited section anchor is inaccurate.

**Verdict: PARTIALLY-RESOLVED.** The standalone References entry was added (addressing the R3 finding), but the section anchor cited ("§Step 5.1") does not exist in the research log. Severity remains P3.

---

### P3-R2-1 (carried from R2): W1.3 scope qualification labels one tested alternative as "Crystal-light methodologies"

**Status:** Unchanged from R2 and R3. The Argument-Graph W1.3 scope qualification still reads "Crystal-light methodologies" and "organizational alternatives" as the two tested alternative families, but E1.3.1 tests agile/requirements-deferral alternatives (Rahman & Cysneiros 2024), not Crystal-light alternatives specifically.

**Verdict: NOT-RESOLVED** (was P3 in R2/R3; remains P3 in R4; no regression; targeted edit could close it).

---

### EF-P3-2 (carried from R1): E2.3.1 development references the research log coverage map without reproducing structure

**Status:** Unchanged from R1 through R4. The body §3 bullet for W2.3's evidence states the coverage map conclusion without showing the branch-by-branch structure.

**Verdict: NOT-RESOLVED** (P3 carried; no regression; appropriate for Essay-Outline scope).

---

### Gate-decision item: ADR-CANDIDATE-019.4 Tier-2 scope

**R3 status:** This was a gate-decision item, not a revision requirement. The practitioner decided at the gate to encode ADR-CANDIDATE-019.4 at Tier-2 methodology-principle level (not Skill-Structure Layer enforcement). The Section 10 entry was to reflect this.

**Revision applied:** The Tier-2 framing is integrated across Abstract C5, Abstract C7, Section 8 SYNTHESIS, and Section 10 ADR-019.4 entry. Verified in Section B below.

**Verdict: RESOLVED** (gate decision propagated; integration verified in Section B).

---

## Section B — Tier-2 Downgrade Integration Check

The practitioner's gate decision: ADR-CANDIDATE-019.4 is encoded at Tier-2 methodology-principle level (felt-judgment-anchored, like ADR-083), NOT as Skill-Structure Layer enforcement. Rationale: the cycle's evidence (2 kitchen-sink instances across ~26 sampled ADRs) supports recognition-naming-pattern-as-methodology-vocabulary but does not yet support structural enforcement. The self-referential risk: proposing heavy structural enforcement from thin evidence would itself instantiate the research-driven-cascade-without-empirical-filter pattern C7 names.

### Touch point 1: Abstract C5

Abstract C5 (line 14) reads: "ADR-019.4 is encoded at Tier-2 methodology-principle level (not Skill-Structure Layer) per practitioner gate response to R3 framing finding (2026-05-16); the scope choice avoids the self-referential risk of proposing heavy structural enforcement from thin evidence."

**Assessment:** The Tier-2 designation and the self-referential risk rationale are both present. The reference to "R3 framing finding" is accurate — the R3 framing audit surfaced the confidence-level question that triggered the gate decision. Consistent.

### Touch point 2: Abstract C7

Abstract C7 (line 16) reads: "Single-cycle anchor evidence suggests auto-mode BUILD does not cause kitchen-sink in the observed case; the mechanism appears to operate upstream at DECIDE." C7 does not explicitly restate the Tier-2 designation — it refers to "the remedy is filtering research-surveyed possibilities through empirical grounding at DECIDE" without naming the tier.

**Assessment:** Abstract C7's scope is the mechanism diagnosis, not the ADR encoding decision. The Tier-2 designation is the ADR encoding detail appropriately owned by C5 and the Section 8/10 body. C7's Abstract text does not need to repeat the tier designation; its function is different (mechanism identification, not scope-of-enforcement decision). The absence of Tier-2 language from C7's Abstract text is not an inconsistency — it is appropriate division of labor between C5 (the decision about what to build) and C7 (the diagnosis that grounds it). **No inconsistency.**

### Touch point 3: Section 8 SYNTHESIS (C7)

Section 8 SYNTHESIS (line 195) reads: "ADR-CANDIDATE-019.4 introduces the empirical-grounding criterion at DECIDE — encoded at **Tier-2 methodology-principle level** (felt-judgment-anchored, like ADR-083), NOT as Skill-Structure Layer enforcement. The cycle's evidence supports the recognition-naming-pattern-as-methodology-vocabulary (practitioners gain 'conditional acceptance' / `adr-deferred-` vocabulary + felt-trigger question); structural enforcement is held for future cycles where more evidence may accumulate. The scope choice reflects the cycle's own self-reflexivity: proposing a heavy structural amendment from 2/26 evidence instances would itself instantiate the research-driven-cascade-without-empirical-filter pattern C7 names."

**Assessment:** All three elements are present and consistent: (1) Tier-2 designation; (2) self-referential risk rationale; (3) explicit statement that structural enforcement is held for future cycles with the evidence threshold named ("if kitchen-sink instances continue to appear"). The reasoning chain is tight and honest.

### Touch point 4: Section 10 ADR-019.4 entry

Section 10 ADR-019.4 entry (lines 216) reads: "**Encoded at Tier-2 methodology-principle level (felt-judgment-anchored, like ADR-083), NOT as Skill-Structure Layer enforcement** (decision per practitioner gate response to R3 framing finding 2026-05-16). Rationale: the cycle's evidence (2 kitchen-sink instances across ~26 sampled ADRs) supports recognition-naming-pattern-as-methodology-vocabulary (the practitioner gains the 'conditional acceptance' / '`adr-deferred-`' vocabulary + felt-trigger question) but does not yet support structural enforcement. If the failure mode persists across more cycles, future amendment can graduate it to Skill-Structure Layer."

**Assessment:** The Tier-2 designation, evidence count (2/26), self-referential risk rationale, and future-graduation path are all present. The comparative reference to ADR-083 (also Tier-2) provides calibration by precedent. The "2 kitchen-sink instances across ~26 sampled ADRs" is an accurate characterization of the evidence (zani palette, llm-orc calibration channel). Consistent.

### Tier-2 integration summary

All four touch points are mutually consistent. The Tier-2 designation, its rationale (self-referential risk + thin evidence), and the future-graduation path appear at each touch point where they are relevant. Abstract C7's silence on the tier designation is appropriate given its function. No integration inconsistencies detected.

**One observation on the "2/26" evidence count:** The Section 10 entry says "2 kitchen-sink instances across ~26 sampled ADRs." The sampled corpus was: plexus ~10 ADRs, llm-orc ~8 ADRs, zani ~10 ADRs = ~28 total. The "~26" in the Abstract is a reasonable approximation. The kitchen-sink instances are: (1) zani palette subsystem (ADR-018 chain) and (2) llm-orc calibration channel (ADR-016). Two instances is correct. The count and proportion are internally consistent across the document. No issue.

---

## Section C — Pyramid Coverage Map (Re-built Post-R3)

### Four-section identification

**Abstract Section:** Present. Seven conclusions C1–C7. C5 updated to reflect both Branches D and A as in-cycle. C7 updated with "refines, not supersedes" C1 clarifier.

**Argument-Graph Section:** Present. Seven top-level claims C1–C7. C5 updated. W7.1 updated with "without empirical filter" qualifier. W7.3 updated with "(working hypothesis, single-cycle anchor)" prefix.

**Citation-Embedded Outline:** Present. Ten sections (§1–§10). §3 SYNTHESIS updated. §8 (C7) updated with agent-generation disclosures in evidence nodes.

**References:** Present. Standalone practitioner gate response entry added (with the minor "Step 5.1" section-anchor imprecision noted in Section A above).

All four sections present. No structural-absence violation.

### Coverage map

| Abstract Conclusion | Argument-Graph Nodes | Body Section | References Cited |
|---|---|---|---|
| C1. Calibration question, not structural rejection; methodology posture supported for actual work; open risk is per-cycle/per-layer | C1, W1.1, W1.2, W1.3, E1.1.1–E1.1.4, E1.2.1–E1.2.2, E1.3.1–E1.3.2 | §2 (C1) | Cockburn 2004; Fowler 1999/2015; Beck 1999; Simon 1996; Pirolli & Card 1999; Cycle 018 cycle-status; ADR-091; Rahman & Cysneiros 2024; Cycle 019 research log |
| C2. Progressive calibration pattern; cycle names it; four in-cycle ADR candidates identified | C2, W2.1, W2.2, W2.3, E2.1.1–E2.1.2, E2.2.1, E2.3.1 | §3 (C2) | ADR-091; ADR-083; Reflection 005; ADR-025; Cycle 019 research log |
| C3. Branch B: trim audit round-count at convergence saturation; 3 rounds default | C3, W3.1, W3.2, W3.3, E3.1.1–E3.1.2, E3.2.1, E3.3.1 | §4 (C3) | Madaan et al. 2023; Kamoi et al. 2024; Bacchelli & Bird 2013; Cycle 018 cycle-status |
| C4. Branch E: admissibility criterion for agent-facing artifacts | C4, W4.1, W4.2, E4.1.1–E4.1.3, E4.2.1 | §5 (C4) | Paulsen et al. 2025; Gupta et al. 2026 (arXiv:2604.03826); Cycle 019 research log; Fowler 2025 |
| C5. Branches D and A both promoted to in-cycle ADR candidates; D = 019.3; A reframed as empirical-grounding criterion = 019.4 (Tier-2 methodology-principle level) | C5, W5.1, W5.2, E5.1.1–E5.1.2, E5.2.1–E5.2.2 | §6 (C5) | Cockburn 2004; Cycle 019 research log; Pirolli & Card 1999 |
| C6. Branch C strongly supported; entry-side gap separately scoped | C6, W6.1, W6.2, E6.1.1–E6.1.2, E6.2.1 | §7 (C6) | Reflection 005; ADR-025; domain-model.md:926 |
| C7. Failure mode traces to research-surveyed possibilities without empirical filter; C7 refines C1 and does NOT supersede it; auto-mode BUILD not the cause; nuance-surfacing preserved | C7, W7.1, W7.2, W7.3, W7.4, E7.1.1–E7.1.5, E7.2.1–E7.2.3, E7.3.1, E7.4.1 | §8 (C7) | Cycle 019 Loop 6.2 zani investigation; Loop 6.2 llm-orc investigation; Loop 6.2 plexus investigation; Practitioner gate response 2026-05-16 |

**META-anchored sections:**
- §1 (Introduction — question and cycle's posture): META. Confirmed non-developmental.
- §9 (Scope-of-claim caveats): META. Confirmed non-developmental; carries Loop 6 sampling scope caveat and distribution-of-cycle-types limitation.
- §10 (Forward-look — feed-forward signals): META. Confirmed non-developmental; carries ADR-CANDIDATE-019.1 through 019.4 and held-open future-cycle candidate.

**Argument-Graph nodes with no body content:** None detected.

**Body sections with no Argument-Graph anchor:** None detected. Sections 1, 9, 10 carry META; Sections 2–8 carry C1–C7 respectively.

**Coverage inconsistencies:** None detected post-revision. The C5 Boundary 1 inconsistency from R3 is resolved. The Section 3 SYNTHESIS staleness from R3 is resolved.

---

## Section D — Expansion-Fidelity Findings (R4)

### Boundary 1 (Abstract → Argument-Graph)

All seven Abstract conclusions (C1–C7) map to matching top-level Argument-Graph nodes. C5: both Abstract and Argument-Graph now reflect both Branches D and A as promoted in-cycle candidates. **No Boundary 1 violations.**

### Reverse Boundary 1 (Argument-Graph → Abstract)

All seven Argument-Graph top-level nodes (C1–C7) map to matching Abstract conclusions. **No Reverse Boundary 1 violations.**

### Boundary 2 (Argument-Graph → Citation-Embedded Outline)

All warrants and evidence nodes are developed in body content. No Argument-Graph node is orphaned. The W7.1–W7.4 developments are substantive; the W7.3 warrant's "(working hypothesis, single-cycle anchor)" prefix is carried through the body with the META-OBSERVATION clarifying the remedy-site claim. **No Boundary 2 violations.**

### Reverse Boundary 2 (Citation-Embedded Outline → Argument-Graph)

All ten body sections carry either an Argument-Graph anchor or META:

- §1: `(META)` — confirmed
- §2: `(C1)` — confirmed
- §3: `(C2)` — confirmed
- §4: `(C3)` — confirmed
- §5: `(C4)` — confirmed
- §6: `(C5)` — confirmed
- §7: `(C6)` — confirmed
- §8: `(C7)` — confirmed
- §9: `(META)` — confirmed
- §10: `(META)` — confirmed

**No Reverse Boundary 2 violations.**

### Boundary 3 (Citation-Embedded Outline → References)

The practitioner gate response citation (E7.4.1) now has a standalone References entry. The section anchor cited ("§Step 5.1") does not exist in the research log (the verbatim text appears within the "Loop 6" section without a "Step 5.1" subsection heading). The citation resolves to the correct document and the verbatim text is locatable, but the cited section anchor is inaccurate.

**Severity: P3.** The citation-auditor is the primary verifier; no escalation to P1 is warranted. The substance of the citation is verifiable; the section-anchor imprecision is a transparency gap.

No new Boundary 3 violations beyond this carried P3.

### Expansion-Fidelity Summary (R4)

**P1 findings (pyramid violations):** None.

**P2 findings (weak expansion or META misclassification):**

- P2-R3-5 (PARTIALLY-RESOLVED): Section 9 Loop 6 sampling scope caveat still does not contain the agent-generation disclosure sentence. Evidence-node disclosures in §8 address the gap per evidence node; the document-level caveat is absent. (See Section A above.)

**P3 findings (minor coverage gaps):**

- P3-R3-1 (PARTIALLY-RESOLVED): E7.4.1 References entry section anchor "§Step 5.1" does not exist in the research log.
- P3-R3-2 (from R3, residual): Body W7.3 heading uses "does NOT cause kitchen-sink in observed evidence" — the qualifier "in observed evidence" is present, but the Argument-Graph's more careful past-tense framing ("did not produce kitchen-sink elaboration") is not echoed in the body heading. Editorial-level; no structural consequence.
- P3-R2-1 (carried): W1.3 scope qualification labels one tested alternative as "Crystal-light methodologies."
- EF-P3-2 (carried): E2.3.1 development references research log coverage map without reproducing structure.

---

## Section E — Framing Audit (R4)

The framing audit for R4 focuses on whether the Tier-2 downgrade introduced new framing biases. The three questions from the standard framing-audit structure are applied with this focus.

### Question 1: Did the Tier-2 downgrade introduce alternative framings the evidence could support?

**Alternative A: The Tier-2 scope is honest evidence-scope-matching, not methodology conservatism.**

The Tier-2 choice is framed in the document as follows: "The cycle's evidence (2 kitchen-sink instances across ~26 sampled ADRs) supports recognition-naming-pattern-as-methodology-vocabulary... but does not yet support structural enforcement." This is a scope-of-claim judgment: the evidence supports naming the pattern; the evidence is too thin for enforcement. The rationale is explicitly stated and falsifiable ("If the failure mode persists across more cycles, future amendment can graduate it to Skill-Structure Layer").

*Is this honest scope-matching or conservatism disguised as scope-matching?* The self-referential risk rationale is the stronger test: the document says "proposing a heavy structural amendment from 2/26 evidence instances would itself instantiate the research-driven-cascade-without-empirical-filter pattern C7 names." This is a coherent and non-trivial argument. The cycle's own C7 claim (research-surveyed possibilities should be filtered at DECIDE before ADR commitment) is applied reflexively to ADR-CANDIDATE-019.4 itself. The methodology practices what it preaches by naming the ADR candidate's scope as a vocabulary addition rather than structural enforcement. The self-referential argument is tight, not circular: it does not use C7 to avoid writing ADR-CANDIDATE-019.4 — it writes ADR-CANDIDATE-019.4 at Tier-2 because the evidence supports that level.

**Alternative B: The Tier-2 scope is methodology conservatism that under-delivers on the cycle's evidence.**

Under this framing: the cross-project evidence from three RDD applications shows a specific, reproducible failure mode (research-driven cascades without empirical filter at DECIDE produce kitchen-sink at a detectable rate). The llm-orc "conditional acceptance" annotation is already an informal Skill-Structure-Layer practice — the methodology has it de facto. ADR-CANDIDATE-019.4 at Tier-2 names what already exists rather than formalizing it where it would actually constrain future behavior. A Skill-Structure Layer amendment would require future practitioners to apply the filter explicitly at DECIDE; the Tier-2 version leaves application to felt-judgment, which is the current situation.

*What would the reader need to believe for this to be right?* That felt-judgment at DECIDE is the failure mechanism (practitioners who need the rule won't apply it from vocabulary alone), and that the two instances of kitchen-sink suggest the felt-judgment already fails in practice. Under this belief, Tier-2 names the problem without solving it.

**Assessment of the framing choice:** Both alternatives are live. The document's rationale for Tier-2 is honest and internally consistent. The conservatism alternative has force: vocabulary amendments without enforcement rely on felt-judgment, which is the existing condition. However, the document explicitly records this as a scope choice with a future-graduation path ("If the failure mode persists across more cycles, future amendment can graduate it to Skill-Structure Layer"). This is the appropriate way to handle the uncertainty — not by asserting that Tier-2 is the correct tier forever, but by naming the evidentiary threshold for promotion. The framing is honest scope-of-claim, not methodology-conservatism camouflage.

**Framing finding E-P3-1:** The document presents the Tier-2 choice as flowing from the thin evidence (2/26 sampled ADRs). The counter-argument — that a Tier-2 vocabulary amendment may be insufficient if felt-judgment is the failure mechanism — is not acknowledged in the Section 10 ADR-CANDIDATE-019.4 specification. The specification would benefit from one sentence: "The limitation of Tier-2 encoding is that it does not constrain practitioners who fail to apply the felt-trigger; if felt-judgment proves insufficient across future cycles, the graduation to Skill-Structure Layer becomes the indicated move." This makes the Tier-2 trade-off visible rather than leaving it implicit in the future-graduation path. **Severity: P3.**

---

### Question 2: Does the Tier-2 downgrade land as honest scope-of-claim or as methodology hedging?

The key evidence: the R3 framing audit surfaced the question of whether ADR-CANDIDATE-019.4's confidence level was warranted by the evidence (two localized instances in a sampled corpus). The practitioner's gate decision was to encode at Tier-2. The document explains this explicitly in four consistent touch points (Abstract C5, Section 8 SYNTHESIS, Section 10 ADR-019.4 entry).

**Honest scope or hedging?** The Tier-2 choice is not hedging in the sense of avoiding commitment. The document commits to the vocabulary (the "conditional acceptance" / "adr-deferred-" pattern + felt-trigger question) while holding the structural enforcement for future cycles. This is a genuine scope-of-claim calibration: the evidence supports the vocabulary; the evidence does not yet support mandating the vocabulary via skill-text enforcement. The distinction is real, the evidence count (2/26) is accurately cited, and the rationale (self-referential risk) is coherent.

**What "honest scope-of-claim" looks like:** The document names the evidentiary gap directly ("2 kitchen-sink instances across ~26 sampled ADRs"), connects it to the enforcement question ("does not yet support structural enforcement"), and provides a falsifiable condition for future graduation ("If the failure mode persists across more cycles"). This is honest scope-of-claim.

**What "methodology hedging" would look like:** Avoiding a stance, using vague future-cycle language, not naming the evidentiary gap or the graduation condition. None of that appears here. The Tier-2 choice is defended with specificity.

**Verdict:** The Tier-2 scope lands as honest scope-of-claim. No new framing issue at this tier of analysis.

---

### Question 3: Does the C1/C7 relationship after the "refines, not supersedes" clause remain genuine?

**R3's concern:** Both C1 and C7 were framing themselves as the "most accurate" diagnosis without establishing hierarchy. The revision added "C7 refines C1... C7 does NOT supersede C1 — it specifies the load-bearing mechanism within C1's calibration framing."

**Post-revision assessment:** The refinement-not-supersession claim is now explicit in the Abstract, and the Section 8 SYNTHESIS develops it as the load-bearing mechanism within C1's framing. The question: is C1 genuinely preserved as the primary conclusion, or does C7 carry the argumentative load while C1 is cosmetically maintained?

**Evidence that C1 is genuinely preserved:**

- C1's scope is broader than C7's. C1 covers the full calibration framing across all methodology layers (audit-infrastructure via C3, agent-facing artifact layer via C4, entry-side operationalization gap via C6). C7 is the mechanism-level diagnosis for one specific failure mode. A reader who only cares about audit-round-count calibration (C3) or agent-facing artifact admissibility (C4) never needs C7; C1 covers their question.
- C7 does not make C3 or C4 redundant. The Cross-project evidence establishing C7's mechanism does not eliminate the need for Branch B (audit-round-count) or Branch E (agent-facing artifact admissibility). These remain independent calibration moves with their own evidence chains.
- The Section 9 distribution-of-cycle-types caveat constrains C1 independently of C7. The caveat that C1 was established for methodology-amendment cycles applies equally to C7 (the cross-project evidence is also from projects with relatively high-stakes RDD adoption, not routine feature-extension cycles). Both conclusions share the same scope limitation.

**Evidence that C7 risks carrying the argumentative weight:**

- C7 is the most recently derived conclusion, anchored by the most extensive evidence-gathering effort (Loop 6 cross-project investigation). It is the narrative climax of the research cycle.
- ADR-CANDIDATE-019.4 (the principal actionable output) derives from C7, not from C1 directly. A practitioner asking "what do I do with this research?" will follow the C7 → ADR-019.4 path, not the C1 → calibration-framing path.
- The Abstract's structure presents C1–C7 in sequence; a reader who stops after C7 will have the mechanism diagnosis and the ADR candidate; a reader who stops after C1 will have only the framing.

**Verdict:** The refinement relationship is genuine, not cosmetic. C1 carries the architectural frame (calibration across layers); C7 carries the mechanism diagnosis for the most consequential failure mode. They serve different readers and different downstream uses. C7 deepens C1 without consuming it. The "refines, not supersedes" clause is accurate. No new framing issue at this level.

**One residual note (P3):** The Abstract text presents C1 without any forward-reference to C7's refinement, and presents C7 with the "C7 refines C1" clause. A reader who encounters C7 for the first time at the end of the Abstract now sees the refinement relationship; a reader who reaches C7 from a partial reading of the Abstract (common in executive-summary usage) receives the calibration framing without knowing a mechanism refinement is coming. The forward-reference could be added to C1 ("the specific mechanism driving the open risk is identified in C7") but this is an editorial preference, not a logical gap. **P3-R4-1.**

---

### Framing Issues (R4)

**F-R4-P3-1: Section 10 ADR-019.4 specification does not acknowledge the Tier-2 limitation directly.**

- **Location:** Section 10, ADR-CANDIDATE-019.4 specification
- **Observation:** The Tier-2 scope choice and its rationale are present. The limitation of Tier-2 (vocabulary without enforcement may be insufficient if felt-judgment is the failure mechanism) is implicit in the future-graduation path but not stated directly. Adding one sentence naming the limitation would make the trade-off visible to a DECIDE practitioner reading the forward-look.
- **Recommendation:** Add to the ADR-019.4 entry: "The limitation of Tier-2 encoding is that vocabulary amendments do not constrain practitioners who fail to apply the felt-trigger at DECIDE; if the failure mode persists across cycles where the vocabulary is nominally in place, the graduation to Skill-Structure Layer is indicated."
- **Severity: P3.**

**F-R4-P3-2: C1's Abstract text has no forward-reference to C7's mechanism refinement.**

- **Location:** Abstract, C1 text
- **Observation:** C7 explicitly cross-references C1 ("C7 refines C1's calibration framing"). C1 does not cross-reference C7. A reader who forms their reading of C1 before reaching C7 receives the calibration framing without knowing the mechanism refinement is coming. The Abstract's forward-reference asymmetry is a minor navigational issue for abstract-only readers.
- **Recommendation:** Add a parenthetical to C1: "(the specific mechanism within this calibration framing is identified in C7 below)" or equivalent.
- **Severity: P3.**

---

## Section F — META Audit-Time Review

Three sections carry the META anchor: §1 (Introduction), §9 (Scope-of-claim caveats), §10 (Forward-look).

**§1 (Introduction — META): Unchanged from R3.** Confirmed non-developmental. PROVENANCE CORRECTION and SCOPE QUALIFICATION are present. No misclassification.

**§9 (Scope-of-claim caveats — META): Revised since R2 (Loop 6 sampling scope caveat; distribution-of-cycle-types limitation).** The two caveats added since R2 are confirmed non-developmental — they are narrowing statements. The Loop 6 sampling scope caveat names: ADR sample depth (~8–10), kitchen-sink-by-delegation critique (uninvestigated), feature-per-scenario heuristic roughness, W7.3 single-cycle anchor. The distribution-of-cycle-types caveat correctly constrains C1.

**META misclassification check for §9:** No developmental content detected. The Loop 6 caveat contains no claim/warrant/evidence bullets; it constrains C7's scope without developing any Argument-Graph node. The distribution-of-cycle-types caveat constrains C1 without developing a new claim. **No misclassification.**

**§10 (Forward-look — META): Revised since R3 (ADR-CANDIDATE-019.4 Tier-2 specification added).** The four ADR candidate specifications are confirmed as feed-forward material (summarizing decisions supported by conclusions already developed in §6 and §8), not new argument development.

**ADR-019.4 Tier-2 specification consistency within §10:**

- ADR-019.1 (audit-round-count calibration) — Skill-Structure Layer amendment.
- ADR-019.2 (Agent Outcome Test) — methodology-principle level (Tier-2).
- ADR-019.3 (RESEARCH patch-switching criterion) — Skill-Structure Layer amendment.
- ADR-019.4 (empirical-grounding criterion at DECIDE) — methodology-principle level (Tier-2, same as ADR-019.2).

The ADR-019.4 entry correctly distinguishes itself from the Skill-Structure Layer by naming the Tier-2 encoding and by noting the "Held open" future-cycle candidate (per-cycle early-phase chain weight calibration as the larger Branch A amendment). The distinction between ADR-019.4 (the narrow, evidence-supported subset) and the larger held-open amendment is clearly drawn. **No inconsistency.**

**One observation on §10's ADR-019.4 cross-project evidence anchor:** The entry names "plexus ADR-038 (explicit refusal) + plexus ADR-024 (cancellation of previously-deferred work) + llm-orc ADR-016 (conditional acceptance annotation) + zani palette subsystem (counter-example showing the failure mode when filter is absent)." This is a 3+1 structure (three exemplar instances of the filter operating correctly; one instance of the filter absent). The count is accurate. The cross-project evidence anchor is internally consistent.

**No META misclassification found in revised sections.**

---

## Section G — Summary and Re-audit Recommendation

### R3 finding remediation status

| R3 Finding | R4 Verdict |
|---|---|
| P1: Boundary 1 — Argument-Graph C5 contradicts Abstract C5 | RESOLVED |
| P2-R3-1: W7.1 "without empirical filter" qualifier missing | RESOLVED |
| P2-R3-2: W7.3 unqualified negative from single-cycle anchor | RESOLVED |
| P2-R3-3: Section 3 (C2) SYNTHESIS stale | RESOLVED |
| P2-R3-4: Abstract C1/C7 superlative framing collision | RESOLVED |
| P2-R3-5: Agent-generation disclosure (evidence nodes vs. Section 9 caveat) | PARTIALLY-RESOLVED |
| P3-R3-1: E7.4.1 References entry section anchor | PARTIALLY-RESOLVED |
| P3-R2-1 (carried): W1.3 "Crystal-light" label imprecision | NOT-RESOLVED (P3 carried) |
| EF-P3-2 (carried): E2.3.1 coverage map | NOT-RESOLVED (P3 carried) |
| Gate-decision Tier-2 integration | RESOLVED |

### Issue counts by severity (R4)

| Category | P1 | P2 | P3 |
|---|---|---|---|
| Expansion-fidelity (Section D) | 0 | 1 (partial P2-R3-5) | 2 (P3-R3-1 partial; P3-R3-2 residual) |
| Framing audit (Section E) | 0 | 0 | 2 (F-R4-P3-1, F-R4-P3-2) |
| Carried from prior rounds | 0 | 0 | 2 (P3-R2-1, EF-P3-2) |
| META misclassification (Section F) | 0 | 0 | 0 |
| **Total** | **0** | **1** | **6** |

### Verdict

**The Essay-Outline is substantially audit-clean at R4.** The single P1 from R3 is resolved. Five of five P2 findings from R3 are resolved or substantially addressed.

**One remaining P2:** P2-R3-5 is PARTIALLY-RESOLVED. The agent-generation disclosure was placed in the Section 8 evidence nodes (correctly, and with adequate detail), but the Section 9 Loop 6 sampling scope caveat does not contain the document-level disclosure sentence R3 recommended. A reader of Section 9's scope caveats will not receive the agent-generation provenance disclosure unless they also read every evidence node in Section 8. The gap is real but not structural: the evidence-node disclosures are the more specific and useful location for a reader verifying the evidence. The Section 9 disclosure sentence would add document-level epistemic transparency.

**Six P3 findings:** All are minor (label imprecision, section-anchor inaccuracy, editorial body-heading phrasing, Tier-2 trade-off implicit rather than named, Abstract forward-reference asymmetry, carried coverage notation). None block advancement.

### Advancement recommendation

**The cycle is ready to advance past RESEARCH to DISCOVER.**

The P1 is resolved. The five P2 repairs from R3 are substantially complete. The remaining P2 (agent-generation disclosure in Section 9) and all P3 findings can be corrected in-place without an R5 audit if the practitioner chooses to do so — they are targeted edits that do not require re-verification of the argument structure. Alternatively, they can be carried as documented scope observations without blocking advancement.

**Specific optional fixes before advancing (not required for gate):**

1. Add one sentence to the Section 9 Loop 6 sampling scope caveat: "The investigations were conducted by parallel agent subagents dispatched on 2026-05-16; findings are reported against specific file paths that are verifiable, but LOC counts, quote accuracy, and feature characterizations carry agent-reading uncertainty." *(closes the P2-R3-5 remainder)*

2. Correct the References entry for the practitioner gate response from "§'Step 5.1 — Practitioner gate response'" to the actual location ("§Loop 6: Re-opened RESEARCH on the v1-build translation question (gate-feedback), lines 542–552"). *(closes the P3-R3-1 remainder)*

3. In the Section 10 ADR-019.4 specification, add one sentence naming the Tier-2 limitation: "The limitation of Tier-2 encoding is that vocabulary amendments do not constrain practitioners who fail to apply the felt-trigger at DECIDE; if the failure mode persists across cycles where the vocabulary is nominally in place, graduation to Skill-Structure Layer is indicated." *(closes F-R4-P3-1)*

If all three optional fixes are applied, R4 closes without open P1 or P2 issues, and DISCOVER can proceed.

### Framing audit verdict (R4)

The Tier-2 downgrade did not introduce new framing biases. The scope choice is honestly calibrated to the evidence (2/26 sampled ADRs), the rationale is coherent (self-referential risk + thin evidence), and the future-graduation path is falsifiable. The conservatism alternative framing is live (Tier-2 may be insufficient if felt-judgment is the failure mechanism) but is adequately surfaced via the forward-graduation path. The C1/C7 refinement-not-supersession relationship is genuine. The document's central argument holds.

**The Essay-Outline's argument structure at R4 is sound, honest about its evidence base, and ready to serve as the RESEARCH artifact for DISCOVER.**
