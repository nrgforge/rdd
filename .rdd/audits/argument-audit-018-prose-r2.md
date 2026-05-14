# Argument Audit Report — Re-audit (R2)

**Audited document:** `/Users/nathangreen/Development/rdd/docs/essays/017-outlines-as-research-artifacts-prose.md`
**Prior audit:** `/Users/nathangreen/Development/rdd/.rdd/audits/argument-audit-018-prose.md` (R1)
**Source material:**
- `/Users/nathangreen/Development/rdd/docs/essays/research-logs/research-log.md`
- `/Users/nathangreen/Development/rdd/docs/essays/research-logs/lit-review-018-ai-prose-critique-landscape.md` (Loop B)
- `/Users/nathangreen/Development/rdd/docs/essays/research-logs/lit-review-018-minimal-surface-artifact-design.md` (Loop C)
- `/Users/nathangreen/Development/rdd/.rdd/audits/argument-audit-018-spike-s1.md` (Spike S1 outline audit)
- `/Users/nathangreen/Development/rdd/.rdd/audits/citation-audit-018-outline.md` (outline citation audit)
**Date:** 2026-05-11

---

## Correction Verification

This is a mandatory re-audit following revisions made in response to the R1 findings. Each expected correction is verified first, before new issues are mapped.

### P1 corrections

**P1.1 — "Single largest S-Small divergence" → "most consequential accidental S-Small divergence" (§2, §7)**

- §2 paragraph 2: "RESEARCH is the methodology's **most consequential accidental S-Small divergence point**" — LANDED. The wording matches the recommended form precisely.
- §7 paragraph 1: "identifies the RESEARCH essay as the **only phase whose S-Small divergence is accidental and unremediated**" — LANDED. This is the alternative recommended formulation and is equally accurate.

Both instances corrected. P1.1 is resolved.

### P2 corrections

**P2.1 — §4: distinguish the issue-count gain story from the 80–85% calibration-loss story**

§4 now contains: "The issue-count comparison is a *gain* story for outline form: more issues surfaced overall, one prose issue resolved by form change. The auditor's net qualitative assessment is a separate *loss* story focused on a specific dimension: outline form preserves approximately 80–85% of argument-audit fidelity relative to prose, with the loss concentrated in rhetorical-confidence calibration… Both stories are true simultaneously — the issue-count gains and the calibration loss measure different things."

LANDED. The two measures are now explicitly distinguished in the same paragraph where they co-appear.

**P2.2 — §1: "critical finding" softened to "structural gap in the literature"**

§1 paragraph 3: "A **structural gap in the literature** reframes the cycle's central question: *no source surveyed distinguishes audited from unaudited AI prose*…"

LANDED. The phrase "critical finding" no longer appears; "structural gap in the literature" is the operative framing.

**P2.3 — §3: benchmark-dependence note added to Liu et al. ARA at first citation**

§3 paragraph 3: "In empirical testing **on a particular benchmark set in a single unreviewed preprint**, QA accuracy for downstream AI agents improved from 72.4% to 93.7%…"

LANDED. The benchmark-dependence and preprint-status qualifications are integrated at the point of first citation, before the figure does argumentative work.

**P2.4 — §3, §7: Loop C observation distinguished from RDD-context inference**

§3 final paragraph: "The observation is Loop C's; the inference combining that observation with the RDD-context AI-agent qualifier is this cycle's synthesis."

§7 paragraph 3: The same Loop C observation is reproduced and the claim that follows it ("framing adoption can therefore occur within a well-headed section without detection when the producer is an AI agent whose prose discipline is the variable in question") is presented as flowing from the combined observation + qualifier, not as a direct Loop C finding.

LANDED. Both instances now appropriately attribute the base observation to Loop C and the compound inference to the essay's synthesis.

### P3 corrections

**P3.1 — §4: "nine of the eight" restated**

§4 now reads: "All eight prose issues transferred to the outline audit at equivalent or higher strength; one prose issue (a Decker citation bibliographic phantom) was *resolved* by the outline form when the citation node was made explicit; the outline audit surfaced two additional framing findings without prose equivalents…"

LANDED. The mathematically confused "nine of the eight" phrasing is replaced with a clear accounting: all eight transferred, one resolved, two new.

**P3.2 — §5: "counterbalances" → "partially offsets"**

§5 paragraph 3: "One loss in auditability **partially offsets** the gains without reversing the net direction…"

LANDED. The word "counterbalances" no longer appears; the directional net finding is now accurately represented before the verbatim quote.

**P3.3 — §6: grep-method scope note added for R2**

§6 paragraph 2: "The method scope is worth flagging: `grep -rEn 'Essay [0-9]+|essays/[0-9]+'` surfaces explicit essay-numbered references; implicit content reuse — where downstream artifacts adopt a framework concept or synthesis statement from an essay without citing it by essay number — is not captured by this method. The 96-reference figure is therefore a floor on substantive consumption, not a ceiling…"

LANDED. The scope note is present at the point where the method's findings are introduced.

### Framing fixes

**Framing P2-A — §1, §7: sycophancy-surface-reduction flagged as "theoretically motivated but empirically untested"**

§1 paragraph 4: "(a) a **theoretically motivated but empirically untested** reduction in surface area for sycophantic framing-adoption — less connective synthesis is hypothesized to leave fewer invisible premises (Cheng et al. ELEPHANT 2025; Cheng et al. Science 2026), but **Loop B and Loop C both note explicitly that no 2025–2026 study directly tests prose vs. structured output as a susceptibility variable**"

§7 paragraph 2: "sycophancy-resistance via reduced framing-adoption surface (**theoretically motivated but empirically untested**, per Loop B and Loop C)"

LANDED. Both instances carry the epistemic-status marker and the explicit acknowledgment that no direct study exists.

**Framing P2-B — §3 or §7: Kim et al. (2025) complication discussed with input/output distinction**

§3 fifth paragraph: Kim et al. (2025) are now cited in-text with the regressive sycophancy finding stated, the naive reading presented, and the input/output distinction applied as resolution: "Loop C resolves the tension via an input/output distinction: Kim et al.'s effect operates at the *input* side… while the artifact-design question the cycle pursues is about the *output* side… Whether outline-structured inputs to downstream RDD agents (DECIDE, ARCHITECT) trigger Kim et al.-type over-weighting is an open empirical question the cycle does not resolve."

LANDED. The Kim et al. citation is no longer orphaned in the References; the complication is presented and the counter-argument applied. The residual open question is appropriately acknowledged rather than foreclosed.

**Framing P3-A — §2: affirmative case for CRESS scope-transfer added**

§2 paragraph 2: "The affirmative case for transfer rests on what CRESS principles describe at the abstraction level: properties of information-bearing context fed to LLM agents. RDD's phase artifacts… function as context fed to downstream LLM agents… within the methodology's own pipeline. The scope transfer is argued by analogy… The analogy is not validated by Gorman directly; it is the cycle's working hypothesis. A reader skeptical of the transfer can read the CRESS-thread findings as conditional on accepting that analogy."

LANDED. The scope-transfer question receives an affirmative case, the analogy basis is named, and the reader is given a conditional reading path if skeptical.

---

## Section 1: Argument Audit

### Summary

- **Argument chains mapped:** 7 (same chains as R1; no new chains introduced or collapsed by revision)
  1. AI-prose critique does not distinguish audited from unaudited AI prose → outline cannot be primarily justified as critique-response
  2. Reduced framing-adoption surface + CRESS alignment + downstream consumption → outline is justified on three independent grounds
  3. CRESS phase-by-phase audit identifies RESEARCH as the most consequential accidental S-Small divergence
  4. Spike S1 → outline preserves ~80–85% argument-audit fidelity on calibration; gains on issue-count; no audit extension needed
  5. Corpus consumption check → downstream phases consume structured content, not prose flow; outline can carry it with discipline
  6. Dogfooded citation comparison → outline has fewer unique errors and higher citation auditability
  7. Two-thread convergence (practice + principle) → supports stronger conclusion than either thread alone
- **Issues found:** 4 (0 P1, 2 P2, 2 P3)
- **Corrections confirmed clean:** 8 of 8 expected corrections landed without introducing new P1 issues

---

### P1 — Must Fix

No P1 issues found. All prior P1 issues are resolved.

---

### P2 — Should Fix

**Issue 2.1 — §4 gain/loss accounting introduces a new arithmetic ambiguity in describing the Spike S1 findings**

- **Location:** §4, paragraph 2
- **Claim:** "the outline audit surfaced two additional framing findings without prose equivalents (a missing Nguyen et al. 2025 citation, and an underweighted prior-familiarity intervention)"
- **Evidence gap:** The Spike S1 audit source (argument-audit-018-spike-s1.md, Section 3 summary) states: "The outline form transferred nine of the twelve findings from the prior prose audit with equivalent or higher fidelity. The three findings that did not transfer at equivalent strength were: 1. The rhetorical-confidence calibration issues (P2.1 in the prose; partially present here but harder to surface from bullet labels alone). 2. The reflexive self-application finding (P3-A in prose; partially dissolved because outline form improves the abstract's scent structure). 3. The bibliographic-phantom finding (Decker in prose; resolved because the outline correctly cites Decker in §1)." The research log Spike S1 comparison table shows the prose audit found 8 total issues (1 P1, 4 P2, 3 P3) and the outline audit found 10 (1 P1, 4 P2, 5 P3). The essay's revised §4 now correctly states "All eight prose issues transferred" and "one prose issue resolved" — which aligns with the research log's accounting where 9 of 12 findings transferred at equivalent strength (the discrepancy between 8 and 12 is because the Spike S1 auditor's Section 3 counts framing findings separately). But the revised paragraph's claim that "two additional framing findings without prose equivalents" surfaced introduces a tension: the research log shows the outline audit total as 10 issues, not 10 issues plus 2 additional framing findings beyond that count. The two framing findings (Nguyen et al. 2025 missing, prior-familiarity underweighted) are among the 10 outline-audit issues, not additional to them. The revised phrasing could lead a reader to add them on top of the stated totals, producing phantom arithmetic (8 transferred + 1 resolved + 2 new = 11, not 10).
- **Recommendation:** Clarify that the two framing findings are included within the outline audit's total of 10 issues, not additional to them. A cleaner restatement: "The outline audit surfaced 10 total issues — all 8 prose issues at equivalent or higher strength, one prose issue resolved by the form change, and two new framing findings (a missing Nguyen et al. 2025 citation and an underweighted prior-familiarity intervention) not surfaced in the prose audit."

**Issue 2.2 — §7's "only phase whose S-Small divergence is accidental and unremediated" overstates the DISCOVER situation without acknowledging it**

- **Location:** §7, paragraph 1
- **Claim:** "the CRESS phase-by-phase audit independently identifies the RESEARCH essay as the only phase whose S-Small divergence is accidental and unremediated"
- **Evidence gap:** The Loop D principled-vs-accidental table classifies DISCOVER's S-Small divergence as "Mixed" — neither clearly principled nor clearly accidental. The table note is: "Per-cycle update mode is principled (each cycle re-examines); total accretion may be accidental (no graduation/compaction mechanism for outgrown content)." "Mixed" includes an accidental component. §2 paragraph 1 explicitly notes "DISCOVER and MODEL also score WEAK on S-Small in the matrix" and the principled-vs-accidental classification "distinguishes those phases (where accretion is principled or mixed) from RESEARCH, whose divergence is fully accidental and remediable by form change." That §2 phrasing ("principled or mixed") is accurate. The §7 phrasing ("only phase whose S-Small divergence is accidental and unremediated") suppresses DISCOVER's mixed status — if DISCOVER's accidental component is unaddressed, it is also unremediated on that component. The R1 audit flagged this as Framing Available Truth C; the prior revision addressed the §2 claim by using "accidental and unremediated" as the description, but the §7 restatement re-introduces the uniqueness claim without the §2 qualifications that make it defensible. The wording in §7 is categorical where §2 is appropriately hedged.
- **Recommendation:** Align §7 with §2's framing: "the CRESS phase-by-phase audit independently identifies the RESEARCH essay as the only phase whose S-Small divergence is *fully* accidental and remediable by form change — as distinct from DISCOVER's mixed divergence and MODEL's principled accumulation." This preserves the argumentative force while not misrepresenting DISCOVER's classification.

---

### P3 — Consider

**Issue 3.1 — §1 epistemic-status sentence classifies (b) and (c) as drawing on "explicit findings in their respective source literatures" but this characterization is imprecise for (c)**

- **Location:** §1, paragraph 4
- **Claim:** "The three considerations have different epistemic statuses: (a) is theoretical inference; (b) and (c) draw on explicit findings in their respective source literatures."
- **Evidence gap:** Consideration (c) is "reduced rhetorical-vs-logical conflation, an argument that emerges from the Loop C audit-extended-prose comparison." The essay itself correctly identifies in §3 that the Loop C claim about audit-extended prose's inability to separate rhetorical from logical force is "the essay's synthesis" — the observation is Loop C's but the inference combining it with the RDD AI-agent context is the cycle's own. The §8 scope-of-claim paragraph also qualifies (c) explicitly: "Loop C's 'audit-extended prose cannot separate rhetorical from logical force' is theoretical (Docherty & Smith and the cycle's synthesis) rather than empirically measured for AI-agent-produced prose specifically." The §1 claim that (c) draws on an "explicit finding" in its source literature is therefore internally inconsistent with §3 and §8. The Loop C observation is a source finding; the compound inference the essay relies on is the cycle's synthesis of that observation and the RDD context qualifier — which is closer to theoretical inference than to an explicit finding, particularly the AI-agent-specific component.
- **Recommendation:** Revise the epistemic-status sentence to: "The three considerations have different epistemic statuses: (a) is theoretical inference; (b) draws on the CRESS framework's articulation of the Empirical principle; (c) draws on a Loop C observation (that prose does not structurally separate rhetorical force from logical force) combined with a cycle-specific inference about AI-agent producers — making (c) mixed in epistemic status, closer to (a) than to (b) in the aspects that bear the most argumentative load." Alternatively, simply note that all three have inferential components and only (b) has direct framework grounding.

**Issue 3.2 — §8 opens an unresolved forward reference to the dogfooding comparison that §5 already answers**

- **Location:** §8, paragraph 4
- **Claim:** "The dogfooding experiment — producing both essay and outline forms of this cycle's deliverable in parallel context-isolated subagents — generates evidence the cycle does not yet have at the time of this writing. The two forms can be independently citation-audited and argument-audited, and the comparison feeds Q1 directly. The outcome of that comparison is itself a finding for the cycle."
- **Evidence gap:** §5 ("Citation-audit comparison: the cycle's own self-evidence") presents the results of exactly this dogfooding comparison in full detail, including specific issue counts from both citation audits, three unique-to-prose P1 errors, and the auditor's net assessment. The §8 passage reads as if the comparison has not yet occurred ("evidence the cycle does not yet have at the time of this writing"), but §5 presents the results as established findings of the cycle. The tension is between §8's temporal framing ("does not yet have") and §5's evidential framing ("The empirical comparison is asymmetric. The prose-form audit identified…"). This appears to be a drafting artifact — §8 was written before §5 was completed, and the temporal framing was not updated. The reader who reaches §8 having read §5 is told the comparison is forthcoming when they have already read its results. This is a minor internal consistency issue but it signals unfinished revision.
- **Recommendation:** Update §8's forward reference to reflect that the comparison has been completed and its results are in §5: "The dogfooded comparison — producing both forms in parallel context-isolated subagents and submitting each to independent citation and argument audits — produced the findings described in §5. The comparison machinery is reproducible across future cycles, providing a path to further calibration." Remove the "does not yet have" phrasing.

---

## Section 2: Framing Audit

The framing audit makes the negative space of content selection visible. The revision under review addressed three framing findings from R1. This section verifies those fixes and checks whether the revision introduced new framing concerns.

### Framing Fix Verification

**Framing P2-A (R1) — Sycophancy-surface argument flagged as empirically untested**

Verified landed in §1 and §7. The epistemic-status marker is present at both sites. No new framing concern introduced by this fix.

**Framing P2-B (R1) — Kim et al. complication discussed with input/output distinction**

Verified landed in §3. The fix resolves the orphan-citation framing risk identified in R1. One residual concern: the fix introduces a new claim — "Whether outline-structured inputs to downstream RDD agents (DECIDE, ARCHITECT) trigger Kim et al.-type over-weighting is an open empirical question the cycle does not resolve" — which is accurate and appropriate. No new framing risk introduced.

**Framing P3-A (R1) — Affirmative case for CRESS scope-transfer added**

Verified landed in §2. The fix provides a genuine affirmative case (context for coding tasks and context for methodology-internal agent consumption share the property of being information an LLM consumes to produce downstream output) and correctly labels it an analogy rather than a validated transfer. No new framing concern.

---

### Question 1: What alternative framings did the evidence support?

The three alternative framings identified in R1 remain available and the revisions do not address them (nor were they required to — they were P3-equivalent framing observations, not required fixes). They are carried forward for reference:

**Alternative A** (downstream-consumption-first framing) remains available and is now slightly more salient because §5's dogfooding results make the downstream-consumption evidence the most directly measured finding in the essay. The essay's susceptibility-first framing in §1 still leads, which is a legitimate choice, but the evidence hierarchy has shifted — the measured findings (§5, §6) are stronger than the theoretical ones (§1, §3) and the essay's structure does not fully reflect this ordering.

**Alternative B** (outline trades one susceptibility for another) is partially addressed by the Kim et al. fix in §3, which acknowledges the input-side susceptibility risk. The output-side confidence-calibration-loss susceptibility is still treated as a production-discipline problem rather than a structural risk. This remains an available framing the essay does not take.

**Alternative C** (form question is less consequential than discipline question) is present in §8's open questions but is not foregrounded. The essay's structure treats the form decision as primary and discipline as secondary; the evidence equally supports the reverse priority.

---

### Question 2: What truths were available but not featured?

The three R1 framing findings (Available truths A, B, C) are addressed as follows by the revision:

- **Available truth A** (sycophancy literature does not directly test prose vs. structured output): Now surfaced in §1 and §7 per the Framing P2-A fix. Resolved.
- **Available truth B** (Kim et al. complication): Now surfaced in §3 per the Framing P2-B fix. Resolved.
- **Available truth C** (DISCOVER also scores WEAK on S-Small with mixed classification): Addressed in §2's hedging language ("principled or mixed") but not in §7's categorical restatement. This is carried forward as P2 Issue 2.2 above.

**New available truth: the research log's Loop C verdict explicitly treats the Cochrane hybrid as the "gold standard" and the strongest overall comparandum, but §3 presents Cochrane as having an incompatibility limitation that effectively dismisses it**

The Loop C lit-review (Category 7 verdict) states: "The Cochrane hybrid is the gold standard for the research question this lit-review addresses." The research log's Loop C synthesis lists it as "Strongest overall comparandum." The essay's §3 presents Cochrane as strong but scale-incompatible, then pivots to the ARA preprint as the source of the essay's "strongest empirical signal." The framing that makes the ARA the most prominent comparandum and Cochrane a near-miss is arguable — the Cochrane hybrid, despite scale incompatibility, is architecturally closer to what RDD actually does (layered audits on a structured artifact), while the ARA represents an infrastructure leap that RDD cannot make. Presenting the ARA figures prominently while relegating Cochrane to a "limitation" paragraph is a framing choice that weights novelty (a 2026 preprint) over maturity (a decades-refined methodology). This does not change the essay's conclusion but it warps the impression of the evidence landscape.

- **Why it may have been excluded:** The ARA finding (72.4% → 93.7%) is empirically striking and directly addresses the AI-agent downstream consumption question in a way Cochrane cannot. The essay uses ARA for its empirical force and Cochrane for its design-pattern force.
- **Would inclusion change the argument:** Not the conclusion, but the framing. The essay could present Cochrane as the proof-of-concept that layered audit-with-structure works at scale, and ARA as the directional signal for the AI-agent-specific case. This framing would be more accurate to the source material's hierarchy.

---

### Question 3: What would change if the dominant framing were inverted?

The R1 framing analysis covered this. The revisions do not alter the dominant framing (susceptibility-surface-reduction-first, CRESS-alignment-second, downstream-consumption-third). The inverted framing (downstream-consumption-first, susceptibility-second, susceptibility-reduction-as-hypothesis-not-finding) remains available and unchanged. See R1 Question 3 for the full analysis; it is unaffected by the revisions.

---

### Framing Issues

**Framing P2-A — §7 restatement of the DISCOVER classification suppresses its mixed status**

This is the framing dimension of Argument P2.2 above. The source material's Loop D table explicitly classifies DISCOVER as "Mixed" on the principled-vs-accidental axis. §7's "only phase whose S-Small divergence is accidental and unremediated" framing removes that nuance in the essay's concluding synthesis section. A reader relying on §7 for the summary argument would not know that DISCOVER has an unresolved accidental component.

- **Location:** §7, paragraph 1
- **Available truth:** Loop D principled-vs-accidental table: DISCOVER = "Mixed" with note that "total accretion may be accidental (no graduation/compaction mechanism for outgrown content)"
- **Why it matters:** The uniqueness claim ("only phase") is the argument's strongest form. Suppressing the DISCOVER complication is a framing choice that strengthens the claim at the cost of accuracy.
- **Recommendation:** Same as Argument P2.2: acknowledge DISCOVER's mixed status in §7 to preserve accuracy while retaining the core finding (RESEARCH is the only phase with *fully* accidental, *remediable* divergence).

**Framing P3-A — The Cochrane hybrid's status as "gold standard" in the Loop C source is downgraded to "scale-incompatible near-miss" in §3 without surfacing that the source material ranked it higher**

- **Location:** §3, paragraph 2
- **Available truth:** Loop C lit-review Category 7 verdict: "The Cochrane hybrid is the gold standard for the research question this lit-review addresses."
- **Why it matters:** Minor framing issue — the essay's ARA-as-strongest-signal framing is defensible on grounds of relevance to the AI-agent-specific question, but the source material's hierarchy (Cochrane = gold standard; ARA = limiting case) is the opposite of the essay's presentation (ARA = strongest empirical signal; Cochrane = valuable but scale-incompatible). A reader would benefit from knowing that the most mature, validated comparandum is Cochrane and the ARA is a directional signal from a single unreviewed preprint.
- **Recommendation:** A brief acknowledgment that Cochrane is the mature proof-of-concept and ARA is the directional signal for the AI-agent-specific sub-question would align the §3 presentation with the source material's hierarchy.
