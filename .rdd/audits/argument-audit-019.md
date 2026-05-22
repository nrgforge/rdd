# Argument Audit Report — Cycle 019

**Audited document:** `docs/essays/essay-outline-018-does-rdd-over-engineer.md`
**Source material:**
- Research log: `docs/essays/research-logs/research-log.md` (Loops 1, 2, 4, 5)
- Lit-review: `docs/essays/research-logs/lit-review-019-methodology-overhead.md`
- Citation audit: `.rdd/audits/citation-audit-019.md` (verdict: P1 + P2 fixes applied before dispatch)
- Cycle context: `.rdd/cycle-status.md` (feed-forward signals 1–7)

**Genre:** Essay-Outline (per ADR-093 §1)
**Date:** 2026-05-15
**Auditor:** argument-audit skill (claude-sonnet-4-6)

**Note on citation-audit P1/P2 status:** The citation audit identified two P1 errors (Bacchelli & Bird sample-size misattribution; Madaan/Madej author + fabricated title) and five P2 errors. The dispatch brief states these fixes were applied to the Essay-Outline before argument-audit dispatch. The argument audit treats the corrected text as the audit surface. Where corrected attribution language is now visible in the body (scope qualification on Self-Refine's round-count ceiling; Bacchelli & Bird without "2,500 code reviews"), those corrections are confirmed verified.

---

## Section 1 — Argument Audit (Standard)

### Summary

- **Genre:** Essay-Outline
- **Argument chains mapped:** 6 top-level claims (C1–C6), 13 warrants (W1.1–W6.2), 22 evidence nodes (E1.1.1–E6.2.1)
- **Issues found:** 7 (1 P1, 4 P2, 2 P3)
- **Pyramid coverage map:** Included (Section 2)
- **Expansion-fidelity findings:** P1: 0, P2: 1, P3: 2

---

### P1 — Must Fix

**No P1 argument-logic issues found.**

The six claim chains are internally consistent, warrant-supported, and do not contradict the evidence trail. The central reframing (over-engineering resolves to calibration, not structural rejection) is tracked across the five research branches and the corpus reflexive analysis. No non-sequiturs identified at the claim-warrant-evidence level.

---

### P2 — Should Fix

**P2-1: W3.1's round-count ceiling is scope-qualified at the evidence level but the warrant itself overstates precision.**

- **Location:** Argument-Graph W3.1 and Section 4 body (Branch B)
- **Claim:** "Literature supports 3–5 productive rounds for critical content; RDD's R1→R4 pattern is at the upper edge."
- **Evidence gap:** The 3–5 round ceiling is the lit-reviewer's synthesis across Self-Refine and code-review literatures. The scope qualification appears at the evidence node (E3.1.1) — "the round-count ceiling is the lit-review's synthesis across Self-Refine and code-review literatures, not a direct Self-Refine finding." However, the warrant W3.1 itself states this as established literature support ("Literature supports 3–5 productive rounds") without carrying the qualification into the warrant-level claim. A reader of the Argument-Graph who does not read the evidence node receives the unqualified assertion. The distinction matters because the 3–5 ceiling is an inference across literatures that do not share a methodology or output type; the warrant is presented with higher confidence than the evidence supports.
- **Recommendation:** Qualify W3.1 to read: "Adjacent literatures, taken together, suggest 3–5 productive rounds for critical content; RDD's R1→R4 pattern sits at the upper edge of this directional range." The qualification should be at the warrant level, not only at the evidence level. (Evidence node E3.1.1 already carries the scope qualification correctly; W3.1 should echo it.)

**P2-2: C1's W1.3 structural-rejection counterfactual is incomplete as stated.**

- **Location:** Argument-Graph W1.3; Section 2 body (C1 WARRANT W1.3)
- **Claim:** "Structural-rejection alternatives — replace RDD with a lighter methodology — fail their own counterfactuals when tested against RDD's actual context."
- **Evidence gap:** The warrant tests only two counterfactuals: (a) agile methods generating more requirements-related defects (E1.3.1) and (b) organizational alternatives degrading under solo-developer + cross-session conditions (E1.3.2). The research log's structured-alternatives analysis (Step 1.4, revised constraint-removal) named five alternatives to the early-phase chain — type-driven design, pair-walkthrough sessions, sketch-and-iterate, spec-driven with executable specs, decision-record-only. Of these, only the organizational alternatives (XP on-site customer; lean startup customer development) are addressed in E1.3.2. The three technical alternatives (type-driven design, spec-driven with executable specs, decision-record-only) are named in the research log but do not appear in the warrant or evidence chain. The warrant overstates what the evidence tests: it claims structural-rejection alternatives generically fail, but only tests two of five named alternatives.
- **Recommendation:** Either narrow W1.3 to the two tested alternatives ("organizational and requirements-deferral alternatives"), or add a sentence acknowledging that technical alternatives (type-driven design, spec-driven with executable specs) were scoped to future investigation. The current framing implies a more complete counterfactual test than was conducted.

**P2-3: C5's "additional candidates for future cycles" framing understates Branch A's empirical grounding.**

- **Location:** Argument-Graph C5, W5.1; Section 6 (Branch A)
- **Claim:** "Branch A (per-cycle early-phase chain weight calibration) is an additional candidate calibration move for future cycles" — positioned as less urgent than C3 (Branch B) and C4 (Branch E).
- **Evidence gap:** The research log's corpus reflexive analysis (Loop 4, C2) found Branch A "partially supported" — the early-phase chain is heavier than Crystal Clear's prescription for solo team size — and the lit-review's Section 1.3 identifies Crystal's calibration framework as the most substantive finding against RDD's early-phase chain weight for solo work. The Essay-Outline correctly identifies Branch A as a calibration gap, but the positioning of Branch A as a "candidate for future cycles" (C5) while Branch B (C3) and Branch E (C4) are positioned as immediate in-cycle candidates underweights Branch A's evidence. The Crystal framework evidence (lit-review Section 1.3) is as strong for Branch A as the Bacchelli & Bird + Liu et al. evidence is for Branch B. The asymmetry in the outline's hierarchy (C3/C4 as in-cycle candidates, C5 as future-cycle candidates) may reflect a framing choice that isn't fully argued within the outline itself.
- **Recommendation:** The Section 6 synthesis (C5) should add a sentence explaining why Branch A is held for future cycles rather than treated as a third in-cycle candidate alongside B and E. The current text ("Branch A is the larger amendment") gestures at a reason without establishing the argument. This is a scope-of-claim issue rather than an error; make the rationale visible.

**P2-4: E2.3.1's "none of the six prior partial answers treats audit-infrastructure cost as a separable concern" is established by the research log's Loop 1 C3 pre-pass but is presented without citing the coverage map.**

- **Location:** Argument-Graph E2.3.1; Section 3 body (W2.3 EVIDENCE)
- **Claim:** "Cycle 019 Loop 1, C3 pre-pass — none of the six prior partial answers treats audit-infrastructure cost as a separable concern; none provides an admissibility criterion for agent-facing artifacts."
- **Evidence gap:** This claim is well-supported by the research log's Loop 1 branch-by-branch coverage map (Branch B: "PARTIAL COVERAGE (BUILD-scoped only)"; the B2 carryover conclusion: "None of these scope to the audit infrastructure specifically"). However, the claim as stated in E2.3.1 frames it as a direct finding ("Cycle 019 Loop 1 C3 pre-pass coverage map shows...") without reproducing the coverage map's actual structure. The evidence node is an internal corpus reference; the specificity is correct, but a reader following the audit trail would need to consult the research log's Loop 1 section to verify it. The claim is accurate and the evidence exists; the gap is transparency about what the coverage map shows (the Branch B "PARTIAL COVERAGE (BUILD-scoped only)" finding is the load-bearing element).
- **Recommendation:** The evidence node is adequate for an Essay-Outline's scope. No structural change required. Surface as P2 because the load-bearing content is one level deeper than the evidence node indicates; if the outline ever expands to prose form, this node needs explicit quotation from the coverage map.

---

### P3 — Consider

**P3-1: The Abstract's C6 framing ("strongly supported by RDD's existing methodology") does not acknowledge the entry-side gap with equal weight to the solution-side answer.**

- **Location:** Abstract Section, C6; Argument-Graph C6 / W6.2
- **Claim:** "Branch C (methodology-mismatch as the canonical 'no' answer) is strongly supported by RDD's existing methodology."
- **Observation:** The Abstract's C6 and the Argument-Graph's C6 lead with the "strongly supported" claim and treat the entry-side gap (W6.2: "felt-judgment, not operationalized") as subordinate. The research log's Loop 1 coverage map notes that Branch C's "entry-side calibration (when does a problem warrant RDD?) remains felt-judgment, not operationalized" is a real gap. The Abstract's one-sentence framing does not flag this gap as part of C6's takeaway. A reader of the Abstract alone would read C6 as largely settled; the gap only surfaces in the Argument-Graph and body. This is a minor framing asymmetry, not an error.
- **Recommendation:** The Abstract's C6 sentence could add: "...though the entry-side operationalization (when does a problem warrant RDD?) remains held as felt-judgment." This would make the gap visible at the summary level rather than only at the warrant level.

**P3-2: The scope-of-claim caveats in Section 8 (META) do not call out the three-branch resolution asymmetry.**

- **Location:** Section 8 (META: Scope-of-claim caveats)
- **Observation:** Section 8 records four caveats: (1) no direct empirical literature at the Branch B intersection; (2) corpus reflexive analysis based on one case study; (3) SDD meta-framing asymmetry flagged; (4) reflexivity scope-of-claim. What Section 8 does not record is that the "calibration, not rejection" central finding rests on a partial test of counterfactuals (W1.3 tests two of five named alternatives). This is not a new finding — P2-2 above covers it as a warrant-level gap — but it is the kind of caveat Section 8 is designed to surface. The Section 8 list is the most consequential omission in the scope-of-claim record.
- **Recommendation:** Add a fifth caveat to Section 8: "The structural-rejection counterfactual test (W1.3) covers two of five named alternative methodologies (organizational/requirements-deferral alternatives). Technical alternatives (type-driven design, spec-driven with executable specs, decision-record-only) were identified but not tested in the corpus analysis. The 'structural rejection fails' claim is scoped to the tested alternatives."

---

## Section 2 — Pyramid Coverage Map

### Four-section identification

**Section 1:** Abstract Section — prose summary + CONCLUSIONS list (C1–C6). Present and well-formed.
**Section 2:** Argument-Graph Section — structured-bullet hierarchy with C1–C6, W-nodes, E-nodes. Present and well-formed.
**Section 3:** Citation-Embedded Outline — nine subsections (Sections 1–9), each with parenthetical anchor or META designation. Present.
**Section 4:** References — bibliography with 29 entries (23 external, 6 internal). Present and well-formed.

All four sections are present. No structural-absence violation.

### Coverage map

| Abstract Conclusion | Argument-Graph Nodes | Body Section | References Cited |
|---|---|---|---|
| C1. Calibration question, not structural rejection; methodology posture supported for actual work; open risk is per-cycle/per-layer | C1, W1.1, W1.2, W1.3, E1.1.1–E1.1.4, E1.2.1–E1.2.2, E1.3.1–E1.3.2 | §2 (C1) | Cockburn 2004; Fowler 1999/2015; Beck 1999; Simon 1996; Pirolli & Card 1999; Cycle 018 cycle-status; ADR-091; Rahman & Cysneiros 2024; Cycle 019 research log |
| C2. Progressive calibration pattern; cycle names it; next open moves identified | C2, W2.1, W2.2, W2.3, E2.1.1–E2.1.2, E2.2.1, E2.3.1 | §3 (C2) | ADR-091; ADR-083; Reflection 005; ADR-025; Cycle 019 research log |
| C3. Branch B: trim audit round-count at convergence saturation | C3, W3.1, W3.2, W3.3, E3.1.1–E3.1.2, E3.2.1, E3.3.1 | §4 (C3) | Madaan et al. 2023 (Self-Refine); Kamoi et al. 2024; Bacchelli & Bird 2013; Cycle 018 cycle-status |
| C4. Branch E: admissibility criterion for agent-facing artifacts | C4, W4.1, W4.2, E4.1.1–E4.1.3, E4.2.1 | §5 (C4) | Paulsen et al. 2025; arXiv:2604.03826 (Gupta et al. 2026); Cycle 019 research log; Fowler 2025 |
| C5. Branches A and D as additional candidate calibration moves | C5, W5.1, W5.2, E5.1.1–E5.1.2, E5.2.1–E5.2.2 | §6 (C5) | Cockburn 2004; Cycle 019 research log; Pirolli & Card 1999 |
| C6. Branch C strongly supported; entry-side gap separately scoped | C6, W6.1, W6.2, E6.1.1–E6.1.2, E6.2.1 | §7 (C6) | Reflection 005; ADR-025; domain-model.md:926 |

**META-anchored sections:**
- §1 (Introduction — question and cycle's posture): META. Confirmed non-developmental; contains the PROVENANCE CORRECTION and reflexivity scope-of-claim note.
- §8 (Scope-of-claim caveats): META. Confirmed non-developmental.
- §9 (Forward-look — feed-forward signals to downstream phases): META. Confirmed non-developmental.

**Argument-Graph nodes with no body content:** None detected.

**Body sections with no Argument-Graph anchor and not META:** None detected.

---

## Section 3 — Expansion-Fidelity Findings

### Boundary 1 (Abstract → Argument-Graph)

Every Abstract conclusion (C1–C6) maps to a matching top-level claim node in the Argument-Graph. Mapping is 1:1. **No Boundary 1 violations.**

### Reverse Boundary 1 (Argument-Graph → Abstract)

Every Argument-Graph top-level claim node (C1–C6) maps to a matching Abstract conclusion. **No Reverse Boundary 1 violations.**

### Boundary 2 (Argument-Graph → Citation-Embedded Outline)

All 13 warrants and 22 evidence nodes are developed in body content. The mapping is verified node by node:

- W1.1 through W1.3: developed in §2 (WARRANT bullets with EVIDENCE sub-bullets)
- W2.1 through W2.3: developed in §3
- W3.1 through W3.3: developed in §4
- W4.1 through W4.2: developed in §5
- W5.1 through W5.2: developed in §6
- W6.1 through W6.2: developed in §7

**No Boundary 2 violations.** All Argument-Graph nodes have body content.

### Reverse Boundary 2 (Citation-Embedded Outline → Argument-Graph)

All nine body sections carry either a Argument-Graph anchor or META:
- §1: `(META)` — confirmed
- §2: `(C1)` — confirmed
- §3: `(C2)` — confirmed
- §4: `(C3)` — confirmed
- §5: `(C4)` — confirmed
- §6: `(C5)` — confirmed
- §7: `(C6)` — confirmed
- §8: `(META)` — confirmed
- §9: `(META)` — confirmed

**No Reverse Boundary 2 violations.**

### Boundary 3 (Citation-Embedded Outline → References)

The citation-auditor has run on this artifact (verdict: P1 + P2 fixes applied). Per ADR-093 §3, Boundary 3 findings detected by the argument-auditor are reported as P2 (citation-auditor's P1 takes precedence for the same errors).

**Boundary 3 review:** During pyramid traversal, one citation warrants noting:

- The "LLM-as-judge reliability literature (Zheng et al. 2024 as anchor; specific 60–68% agreement figure per Cycle 019 lit-review §Branch B characterization)" entry in the References is an incompletely identified citation. The citation-audit flagged this as P3 (ACL 2025 unidentified). The specific 60–68% agreement figure is present in the body of §4 as background context in the SCOPE QUALIFICATION rather than as a named evidence node — it does not anchor any Argument-Graph node directly. **No Boundary 3 P2 finding from this audit passes threshold for argument-audit reporting** given the citation-audit's P3 treatment and the figure's non-load-bearing position.

**No new Boundary 3 violations detected by argument-auditor beyond what the citation-auditor covered.**

### Expansion-Fidelity Summary

**P1 findings (pyramid violations):** None.

**P2 findings (weak expansion or META misclassification):**

**EF-P2-1: §4 (C3) — W3.1 expansion is technically present but weak at the warrant level.**

- W3.1's body development reproduces the "largest gains rounds 1–2; rounds 3–5 productive for critical content; over-refinement past 5 rearranges errors" characterization without the warrant-level scope qualification that the round-count ceiling is a lit-reviewer synthesis rather than a direct empirical finding. The evidence node (E3.1.1) carries the SCOPE QUALIFICATION correctly; the warrant-level development in the body does not. The pyramid technically holds — there is body content anchored to W3.1 — but the expansion is epistemically weaker at the warrant level than at the evidence level.
- This EF-P2-1 is the expansion-fidelity view of the same issue flagged as P2-1 in the Argument Audit above. Cross-referenced.

**P3 findings (minor coverage gaps):**

**EF-P3-1: W1.3's body development covers only two of the five named alternative methodologies.**

- The Section 2 body develops W1.3 with two evidence bullets (Rahman & Cysneiros 2024 for requirements-deferral alternatives; organizational alternatives from Loop 1 and Loop 4 reflexive analysis). The research log's structured-alternatives analysis named five alternatives. W1.3 develops two. The pyramid technically holds — there is body content — but the claim "structural-rejection alternatives fail their own counterfactuals" is expanded against a subset of what the research investigated.
- This is the expansion-fidelity view of P2-2 above. Cross-referenced.

**EF-P3-2: E2.3.1's development in §3 references "Cycle 019 Loop 1 C3 pre-pass coverage map" without reproducing any of the map's structure.**

- The §3 body bullet for W2.3's evidence states: "Cycle 019 research-log §Loop 1 C3 pre-pass coverage map — none of the six prior partial answers treats audit-infrastructure cost as a separable concern; none provides an admissibility criterion for agent-facing artifacts." The map exists in the research log and is accurate, but the body's expansion consists of the conclusion only, not the map's branch-by-branch structure. This is a minor coverage gap; the pyramid holds.

---

## Section 4 — Framing Audit

### Question 1: What alternative framings did the evidence support?

**Alternative framing 1: Specification overhead is a fixed-cost-per-cycle problem, not a calibration problem.**

The lit-review's Cross-Branch Synthesis, Section 6.1 (Convergence 3) surfaces: "Specification overhead does not scale proportionally with task size. Short cycles on simple problems are more over-calibrated than long cycles on complex problems." This framing leads with a structural diagnosis rather than a calibration remedy: the over-engineering is in the methodology's fixed-cost startup, and the remedy is not calibration but *cycle-scope thresholding* — a minimum problem-size criterion below which the methodology shouldn't run at all (rather than a per-cycle machinery-weight dial). The Essay-Outline routes this evidence through W1.3's structural-rejection counterfactual test and Branch C (methodology-mismatch), which absorbs it into the calibration framing. Under the fixed-cost alternative framing, the conclusion would be: "RDD has a minimum viable problem size below which the fixed-cost startup cannot be amortized, and the methodology should define and enforce that threshold before a cycle begins — not after." The framing audit does not assert this alternative is correct; it surfaces what the evidence makes available.

*What would the reader need to believe for this alternative to be right?* That the calibration metaphor understates the problem — that dials and adjustments are insufficient responses to a structural mismatch between fixed-cost methodology architecture and variable-cost problem types. The distinction: calibration implies the machinery is right and needs tuning; the fixed-cost alternative implies some problems should not invoke the machinery at all. The felt-judgment entry criterion in W6.2 (Branch C's gap) is the exact site where this alternative framing would land its remedy.

**Alternative framing 2: The agent-facing artifact accumulation problem (Branch E) is load-bearing for the cycle's central argument, not a supporting finding.**

The Essay-Outline's argument hierarchy positions Branch E (C4) as one of two in-cycle remedy candidates, subordinate to C1's central "calibration, not rejection" conclusion. But the evidence for Branch E is the strongest empirical finding in the cycle: Paulsen et al.'s (2025) effective context consumption study is an established empirical result; the corpus measurements (domain-model.md 366 KB; scenarios.md 257 KB; 93 ADRs ~500 KB+) are direct measurements; the arXiv 2026 ADR retrieval paper is a direct empirical study. The Branch B evidence (audit round-count calibration) rests on adjacent literatures synthesized by the lit-reviewer. An alternative framing would position Branch E as the primary finding — "the over-engineering question's load-bearing answer is that RDD's agent-facing artifact corpus has grown past effective agent consumption limits" — and present C3/C4 not as parallel candidates but as primary/secondary in that order.

*What would the reader need to believe for this to be right?* That the empirical strength of the evidence should determine the hierarchy of conclusions — that a finding backed by direct measurement and primary empirical studies should lead the argument, rather than being nested under a more comprehensive but less empirically grounded framing claim.

**Alternative framing 3: The reflexivity of the cycle is a positive asset, not a caveat to be managed.**

The Essay-Outline treats reflexivity as a scope-of-claim risk (Section 1 META; Section 8 META's fourth caveat). The Tier 1 architectural-isolation mechanisms are framed as "principal defenses" against the susceptibility risks. An alternative framing would treat the cycle's reflexivity as productive rather than threatening: a methodology that can apply its own research apparatus to examine itself, produce citation-audited and argument-audited findings about its own over-engineering, and derive specific candidate ADRs from that examination is demonstrating exactly the kind of structured-thinking capability that justifies the methodology's existence. Under this framing, the reflexive finding (calibration, not rejection) is not a "moderate-between-extremes default reached by an in-context agent" but an empirically grounded finding produced by the exact process whose value the cycle is examining. The Essay-Outline does not foreclose this reading but does not develop it as a positive argument.

*What would the reader need to believe for this to be right?* That the architectural-isolation mechanisms (separate citation-auditor, argument-auditor with framing-audit) are sufficient defenses against self-justification susceptibility — that the methodology's audit apparatus, when it functions as designed, produces findings that can be trusted even when the methodology is the subject. The framing audit is itself part of the test.

---

### Question 2: What truths were available but not featured?

**Underrepresented finding 1: The Thoughtworks SDD critique (1,300-line date-display specification) as a concrete data point for over-specification.**

The lit-review (Section 4.1) gives the Thoughtworks 2025 SDD critique — including the 1,300-line date-display specification as a concrete instance of specification overhead disproportionate to task size — substantial treatment. The Essay-Outline routes this evidence into E4.1.2's arXiv 2026 finding (semantic relevance > completeness) and mentions Thoughtworks in the Argument-Graph (C4, W4.1) only indirectly through the corpus measurement. The 1,300-line example is the literature's most concrete data point for "elaboration accumulates past what the task warrants" — the exact mechanism the over-engineering question is asking about. Its near-absence from the Citation-Embedded Outline body (it does not appear as a named evidence bullet) means the strongest concrete analogy to RDD's situation is underrepresented.

*Why might it have been excluded?* The Thoughtworks source is practitioner discourse rather than peer-reviewed literature. The lit-review Section 7.2 flags explicitly: "this literature defaults toward 'more specification is better than less' because its reference failure mode is under-specification, not over-specification." Using the SDD discourse's most dramatic data point (1,300 lines for a 2-hour task) risks importing the meta-framing the lit-review warned against. The exclusion is defensible but should be visible.

*Would its inclusion change the argument?* Not the conclusion, but it would strengthen the over-engineering-as-real-phenomenon evidence before pivoting to calibration. Currently W4.1's evidence reads as: "corpus is large; LLMs consume less than their window; therefore the corpus is probably too large." The 1,300-line SDD data point would provide a direct comparison: RDD's early-phase chain for a methodology-amendment cycle is analogous to SDD's specification overhead for a complex feature — and the literature found SDD's overhead disproportionate for simple features. The analogy would then ask: which of RDD's cycles are in the "simple feature" category?

**Underrepresented finding 2: The design fixation literature as a positive argument for RDD's early-phase chain.**

The lit-review (Section 3.4) gives Gero & Kan (2011) and Zanker/Gerstenberg et al. (2019) substantial treatment: design fixation is the failure mode of lighter-process alternatives; early prototyping and early-commitment alternatives can increase fixation. This finding is potentially the strongest positive argument for RDD's early-phase chain — not just "RDD's posture is proportionate" but "the specific failure mode the early-phase chain prevents (fixation) is empirically documented and worse than elaboration overhead." The Essay-Outline routes this evidence only through W1.3's structural-rejection counterfactual ("organizational alternatives without written artifacts degrade systematically...") without naming the fixation mechanism. The word "fixation" does not appear in the Citation-Embedded Outline body. The design fixation literature's positive contribution is absent from the body sections.

*Why might it have been excluded?* The design fixation literature is in the design cognition domain; its direct applicability to software methodology requires analogical transfer that the lit-review makes but the Essay-Outline body does not. The argument chain (design fixation → early commitment is risky → RDD's early-phase chain prevents this) is one step more inferential than the proportionality principle evidence. The Essay-Outline may have defaulted to the cleaner evidence chains (proportionality + corpus measurements) and left the fixation-prevention mechanism implicit.

*Would its inclusion change the argument?* It would strengthen C1 by adding a positive mechanism rather than only a comparative mechanism. The current C1 argument structure is: "proportionality principle says elaborate to stakes; corpus shows proportionate cost; alternatives fail their counterfactuals." Adding the design fixation evidence would add: "and the alternatives' failure mode (fixation) is empirically documented as worse than elaboration overhead." This shifts from "our cost is proportionate" to "our cost prevents a documented worse failure."

**Underrepresented finding 3: Branch A/B compounding effects (R2 carryover B2 finding).**

The research-methods reviewer R2 flagged (carryover B2): "Branches A and B may be compounding effects of one mechanism rather than independent diagnoses." The research log's Loop 1 C3 pre-pass addressed this question: "Are early-phase chain cost and audit-infrastructure cost separable in the prior art? No — none of the six prior partial answers treats the audit-infrastructure cost as separable from broader process cost." The Essay-Outline treats Branches A and B as separable (C5 for Branch A, C3 for Branch B). The compounding-effects question — that a reduced early-phase chain would naturally reduce audit-infrastructure cost as a second-order effect, and that the two cannot be fully calibrated independently — is not addressed in the body. The lit-review's Section 6.3 explicitly works through this question and reaches a conditional answer: "could the audit infrastructure earn its cost if the early-phase chain were lighter? The literature's answer is conditional yes." This nuance is absent from the Essay-Outline's treatment of the relationship between C3 and C5.

*Would its inclusion change the argument?* It would add a caveat to C3 and C5's independent status: Branch B calibration and Branch A calibration interact. This does not change the conclusion (calibration is needed at both layers) but it changes the implementation picture (you cannot fully calibrate Branch B without knowing Branch A's outcome). The Section 9 forward-look to DECIDE does not flag this interaction for the candidate ADR design.

---

### Question 3: What would change if the dominant framing were inverted?

The dominant framing: "The over-engineering question resolves into a calibration question across methodology layers, not a structural rejection of any single layer."

**Inverted framing: "The over-engineering question reveals that RDD's current architecture is structurally mis-calibrated for the practitioner's actual workload, and calibration-dial adjustments cannot correct a structural mismatch."**

Under the inverted framing:

*Claims that become weaker:*
- C1's W1.2 ("corpus evidence shows cost proportionate to methodology-amendment stakes") becomes a description of a single high-stakes cycle, not a general defense. The inverted framing would ask: how many Cycle 019-equivalent methodology-amendment cycles does RDD produce per year, vs. how many routine feature-extension cycles? If most cycles are routine feature-extension, C1's proportionality argument uses one high-water-mark case to justify machinery that runs at full weight on lower-stakes work.
- C2's "progressive calibration pattern" becomes a description of the methodology's inability to commit to structural changes — each calibration move adds another adjustment mechanism rather than addressing the underlying over-engineering at the structural level.

*Claims that become stronger:*
- C6's W6.2 ("entry-side calibration is felt-judgment, not operationalized") becomes a load-bearing failure: under the inverted framing, the lack of an operationalized entry criterion is not a separately-scoped gap but the central diagnosis. The methodology runs because it runs — there is no systematic check that the problem warrants it.
- The fixed-cost alternative framing (Alternative Framing 1 above) becomes the primary narrative: if calibration dials can't fix structural mis-calibration, the structural answer is a minimum-viable-problem-size criterion before the cycle begins.

*Evidence that becomes more salient:*
- The Crystal Clear framework's prescription (barely sufficient process for solo teams) becomes the benchmark the methodology should meet rather than an acknowledged exception. Currently the Essay-Outline frames Crystal Clear as evidence that "heavier process is warranted for high-criticality novel work" — which is accurate — but the inverted framing would note that Crystal Clear also predicts RDD's actual usage pattern (all cycles at full weight) is over-calibrated for the majority of cycles.
- The Cycle 018 case study's 14 specialist subagent dispatches, under the inverted framing, becomes evidence of structural over-calibration that survived multiple prior calibration moves (ADR-091, ADR-083) — a pattern of adding adjustment mechanisms while the underlying cost continued to grow.

*What the document would need to address under the inverted framing:*
- The distinction between "the methodology is correctly calibrated for methodology-amendment cycles" (true per the evidence) and "the methodology is correctly calibrated for all cycles it is currently applied to" (not tested by the evidence).
- Whether calibration moves (C3, C4) can structurally cap the cost growth, or whether each cycle of methodology improvement adds artifacts and audit infrastructure that later cycles must process.

**Assessment of the dominant framing's evidence basis:** The calibration framing is genuinely supported by the evidence — the proportionality principle, the literature on expert design behavior, the design fixation literature (even if underrepresented in the body), and Branch C's existing methodology coverage all support it. The framing is not a default-to-the-middle choice without substantive evidence; it follows from examining what the literature says about both the over-engineering and the methodology-mismatch hypotheses. However, the central finding's strength is limited by one condition that the evidence does not fully address: the finding is established for methodology-amendment cycles (Cycle 018 as the case study) and for cycles that fit Crystal's high-criticality novel-work quadrant, but not for a distribution of cycle types that includes routine feature-extension work. If RDD were applied to routine feature-extension cycles at full machinery weight, the calibration answer would not suffice — and the Essay-Outline does not examine whether that is the current usage pattern.

---

### Framing Issues

**F-P1: The dominant framing's calibration conclusion is supported for the evidence base that was examined (methodology-amendment cycles; high-criticality novel work), but the cycle did not examine RDD's actual distribution of cycle types. This gap is not recorded in the scope-of-claim caveats.**

- **Location:** Abstract, C1; Section 2 body (C1 synthesis); Section 8 META (scope-of-claim caveats)
- **Observation:** The cycle's central conclusion ("calibration, not structural rejection") rests substantially on Cycle 018 as the evidence anchor. Cycle 018 is a methodology-amendment cycle — explicitly high-criticality novel work by any reasonable classification. The lit-review's Crystal framework analysis says: heavier process is warranted for high-criticality novel work; lighter process is warranted for well-structured lower-criticality work. The over-engineering critique, if it applies to RDD, applies to cycles below the high-criticality threshold — not to Cycle 018. The Essay-Outline's central conclusion is well-supported for the case it examined but does not examine the distribution of cases RDD is actually applied to. This is a consequential scope-of-claim omission: the argument could be entirely correct for Cycle 018 and the methodology-amendment cycles in the corpus, while the over-engineering critique applies specifically to the routine feature-extension cycles that the case study does not represent.
- **Recommendation:** Add a scope-of-claim caveat in Section 8: "The calibration conclusion is established for cycles matching the high-criticality novel-work profile (methodology-amendment cycles; identity-forming work). Whether RDD's current application distribution includes routine feature-extension cycles run at full machinery weight — and whether those cycles are over-calibrated — is a question the corpus reflexive analysis was not designed to test. Cycle 018 is not a representative sample of lower-stakes cycles." This does not change the conclusion but substantially narrows its scope. Note: per ADR-061, this framing finding is surfaced to the user at the gate, not auto-corrected.

**F-P2: The reflexivity-in-both-directions risk (self-justification vs. self-flagellation) is named in the cycle's framing apparatus but the framing audit's finding is that the conclusion's placement is closer to the self-justification pole, and the evidence does not fully rule out the self-flagellation alternative.**

- **Location:** Section 1 (META SCOPE QUALIFICATION); Section 8 (fourth scope-of-claim caveat); cycle-status feed-forward signal 2
- **Observation:** Feed-forward signal 2 named both self-justification and self-flagellation susceptibility. The cycle's architectural-isolation mechanisms (citation audit, argument audit with framing audit, research-methods review) are identified as defenses against both. The Essay-Outline's central finding (calibration, not structural rejection) sits closer to self-justification in the sense that it validates RDD's structural posture while recommending calibration adjustments. This does not mean the conclusion is wrong — the evidence does support it — but the equal-weight test surfaces a question: would the calibration conclusion have looked different if the research had started from the null hypothesis that RDD is over-engineered for most of its actual usage, and then tested whether the evidence supports this? The research's actual structure started from Branch C's strong coverage (the methodology-mismatch hypothesis) and examined whether the evidence supports it — which it does. But starting from Branch A's "yes, over-engineering is real" and asking how strong the countervailing evidence is might have produced a different framing weight.
- **Recommendation:** This is an epistemically live finding. The conclusion is supported by the evidence. But the framing audit finds that the cycle's research structure (Loop 1's prior-art pre-pass, which found Branch C "strongly covered") may have given the methodology-mismatch hypothesis a structural advantage in the synthesis. The reflexivity risk was named and the architectural-isolation defenses ran, but the conclusion's placement closer to "the methodology is basically right" than to "the methodology has a structural problem" should be flagged for the practitioner's judgment at the gate. Note: per ADR-061, this is surfaced, not auto-corrected.

**F-P3: Branch D's finding (RESEARCH lacks a patch-switching criterion) is positioned as a "candidate for future cycles" but the evidence for it is immediate and actionable — it was observed in Cycle 018's own evidence, not only in the literature.**

- **Location:** C5, W5.2; Section 6 (Branch D); Section 8 scope-of-claim caveats
- **Observation:** Branch D's gap (Pirolli & Card's patch-switching criterion is absent from RESEARCH) is documented in the corpus reflexive analysis with a direct Cycle 018 example: "Cycle 018 RESEARCH ran two lit-reviews plus both-form dogfooded production with no explicit termination criterion; current termination is 'user decides research is sufficient' — felt-judgment." The Essay-Outline treats Branch D's remedy as a "candidate for future cycles" and smaller than Branch B's remedy ("smaller amendment — fits as an addition to /rdd-research skill text"). The framing is consistent with the outline's hierarchy, but the Branch D finding is arguably more immediately operationalizable than Branch B (which requires a convergence-saturation signal to be defined and tested). The asymmetric treatment of two findings of similar immediacy may underweight Branch D. This is a framing preference rather than an error.

---

## Section 5 — META Audit-Time Review (ADR-093 §2 Tier 3)

Three sections carry the META anchor: §1 (Introduction), §8 (Scope-of-claim caveats), §9 (Forward-look).

**§1 (Introduction — META): Confirmed non-developmental.** The section contains the PROVENANCE CORRECTION (explaining the question's substitution for downstream audit traceability) and a SCOPE QUALIFICATION (reflexivity note). Neither contains claim/warrant/evidence bullets developing any Argument-Graph node. No misclassification.

**§8 (Scope-of-claim caveats — META): Confirmed non-developmental.** The four caveats constrain conclusions C1–C6 but do not develop any Argument-Graph node. Each caveat is a narrowing statement rather than an expansion. However, note the framing audit finding F-P1: a fifth caveat is missing from §8. The section's non-developmental character is correctly classified; its content completeness is addressed by F-P1 above.

**§9 (Forward-look — META): Near boundary, but confirmed non-developmental.** The section contains substantive candidate ADR descriptions (ADR-CANDIDATE-019.1 and ADR-CANDIDATE-019.2) with named components (default 3 rounds; convergence-saturation signal; Agent Outcome Test; Fowler's spec-vs-context-document distinction). These are feed-forward signals for downstream phases, not argument development — they are summarizing conclusions C3 and C4's remedies rather than developing warrants or evidence for those conclusions. The distinction: §4 (C3) and §5 (C4) develop the argument; §9 records what action the conclusions support. §9 is correctly classified as META.

**No META misclassification found.** No developmental content appears in META-anchored sections; no non-developmental sections carry Argument-Graph anchors that should be META.

---

## Section 6 — Summary and Re-audit Recommendation

### Issue counts by severity

| Category | P1 | P2 | P3 |
|---|---|---|---|
| Argument audit (Section 1) | 0 | 4 | 2 |
| Expansion-fidelity (Section 3) | 0 | 1 | 2 |
| Framing audit (Section 4) | 1 | 1 | 1 |
| META audit (Section 5) | 0 | 0 | 0 |
| **Total** | **1** | **6** | **5** |

The single F-P1 framing finding (scope-of-claim gap: the calibration conclusion is established for high-criticality cycles but not tested against RDD's distribution of cycle types) is a consequential omission from the scope-of-claim record. Per ADR-061, it is surfaced to the user at the gate, not auto-corrected.

### Verdict

**The Essay-Outline is conditionally ready to advance past RESEARCH.** It does not have argument-logic errors (no P1 in Section 1); the pyramid is complete with no expansion-fidelity violations at the structural level (no Boundary or Reverse Boundary violations). The six claim chains hold.

**Before advancing, the following revisions are recommended:**

**Revision 1 (addresses P2-1 and EF-P2-1):** Qualify W3.1 at the warrant level to carry the scope qualification currently present only at the evidence level: the 3–5 round ceiling is a synthesis across adjacent literatures, not a direct empirical finding in any single source.

**Revision 2 (addresses P2-2 and EF-P3-1):** Narrow W1.3's claim from "structural-rejection alternatives fail their counterfactuals" to the tested alternatives (organizational/requirements-deferral alternatives), or add an explicit acknowledgment that technical alternatives were scoped to future investigation.

**Revision 3 (addresses P2-3):** Add a rationale sentence to Section 6 (C5) explaining why Branch A is held for future cycles rather than treated as a third in-cycle candidate — "the larger amendment" is gestured at but not argued.

**Revision 4 (addresses P3-2 and F-P1):** Add a fifth scope-of-claim caveat in Section 8: the calibration conclusion was established for methodology-amendment cycles (Cycle 018 as anchor); the distribution of lower-stakes cycles was not examined; the conclusion's scope is limited to cycles matching the high-criticality novel-work profile.

**Gate-decision items (not revisions; surfaced for user judgment per ADR-061):**

**F-P1:** The calibration conclusion's scope should be made explicit: it is supported for high-criticality novel-work cycles but not tested against a distribution including routine feature-extension cycles. The practitioner should decide whether this limitation requires a broader scope-of-claim caveat or whether the current Section 8 caveats (reflexivity; one case study; no direct empirical literature at Branch B intersection) are sufficient.

**F-P2:** The reflexivity-in-both-directions risk's audit finding: the conclusion (calibration, not rejection) sits closer to the self-justification pole. The evidence supports this conclusion; the framing audit does not find the conclusion to be wrong. The practitioner should consider whether the framing of the essay would look different if the research had started from the structural-rejection hypothesis as the null rather than from Branch C's strongly-covered methodology-mismatch hypothesis. This is a gate-conversation question, not a revision requirement.

**F-P3 (informational):** Branch D's patch-switching criterion may be more immediately operationalizable than the outline's "future cycle" positioning implies. The practitioner should confirm whether Branch D is appropriately scoped to a future cycle or whether it belongs alongside the in-cycle candidates.
