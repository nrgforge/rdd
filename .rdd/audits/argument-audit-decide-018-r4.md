# Argument Audit Report (R4 — Post-Gate Revision Verification)

**Audited document:**
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-092-essay-outline-as-research-artifact.md` (revised at DECIDE gate)
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-093-argument-auditor-graph-traversal.md` (unchanged at R4; verified for cross-ADR consistency)

**Source material:**
- `/Users/nathangreen/Development/rdd/docs/essays/017-outlines-as-research-artifacts-prose.md` (especially abstract + §6 + §7 — the swap's empirical anchor)
- `/Users/nathangreen/Development/rdd/docs/essays/017-outlines-as-research-artifacts-outline.md` (C1 abstract — the prior framing ADR-092 had followed)
- `/Users/nathangreen/Development/rdd/.rdd/cycle-status.md` (feed-forward signal 1 — named Loop C as #3; the signal the swap departed from)
- `/Users/nathangreen/Development/rdd/.rdd/audits/argument-audit-decide-018.md` (R1)
- `/Users/nathangreen/Development/rdd/.rdd/audits/argument-audit-decide-018-r2.md` (R2 — last full audit before gate)
- `/Users/nathangreen/Development/rdd/docs/domain-model.md` (Amendment 23 invariants)

**Date:** 2026-05-14

---

## R3 / Gate Context

R1 and R2 closed clean on argument issues (0 P1/P2/P3 at R2 closure). R2 carried two framing-audit items to the gate: F2 (SYNTHESIZE-precedent subordination) and F3 (Kim et al. Open Question 7 absence). At the DECIDE gate, re-examination of the source-essay framings revealed an asymmetry between the prose-form essay's §7 "central reframing" (three considerations: susceptibility + CRESS + downstream-AI-consumption) and the outline-form essay's C1 abstract (three arguments: susceptibility + CRESS + Loop C critical-flaw). The post-research feed-forward synthesis (cycle-status §From RESEARCH signal 1) had adopted the outline-form C1 framing (Loop C as #3), and the original ADR-092 Context followed that signal. At the gate, the user confirmed a swap: Context bullet #3 now encodes downstream-AI-consumption preservation (prose-essay §7 articulation), and Loop C is repositioned to its comparative-case role in Rejected Alternative #4. Kim et al. Open Question 7 (F3) was added as a Neutral consequence.

This R4 audit verifies the swap's accuracy, checks for new issues the revision may have introduced, verifies cross-ADR consistency with ADR-093, and resolves the carry-forward gate items.

---

## Section 1: Argument Audit

### Summary

- **Argument chains mapped:** 11 (unchanged; no new chains introduced by revision)
- **Issues found:** 1 P3 (new; introduced by the revision)
- **Carry-forward gate items resolved:** F2 — resolved (indirectly, as explained below); F3 — resolved (added to Neutral consequences)

---

### R4 Verification Targets

#### Target 1: Numbers and characterization in new Context bullet #3

**Claim in ADR-092 Context bullet #3:** "The R2 corpus-consumption analysis in Cycle 018 grep'd this codebase's downstream artifacts and identified three distinct consumption modes: bibliographic provenance (12 references in `roadmap.md` + 4 in `ORIENTATION.md` + 2 in `field-guide.md`), section-keyed warrants (used throughout `system-design.agents.md` as the architectural-driver pattern), and substantive content reuse (96 essay references across ADRs, plus product-discovery and system-design references)."

**Verification against prose-essay §6:**

The prose-essay §6 reads: "Bibliographic provenance (low information density) appears in roadmap.md (12 references), ORIENTATION.md (4), field-guide.md (2), and domain-model.md (cycle tags)"; "Section-keyed warrants (medium density) appear in system-design.agents.md"; "Substantive content reuse (high density) appears in ADRs (96 essay references) and product-discovery.md."

- **12 / 4 / 2 references:** Matches exactly. Verified.
- **Three consumption modes (bibliographic provenance / section-keyed warrants / substantive content reuse):** Matches exactly. The ADR omits the domain-model.md cycle-tags sub-category that the essay names alongside field-guide.md, but the essay itself treats domain-model.md tags as the lowest-information-density item under bibliographic provenance; the omission is a compression choice that does not misstate the mode's character.
- **96 ADR references:** Matches exactly. Verified.
- **"Plus product-discovery and system-design references":** The essay separately names system-design.agents.md as section-keyed warrants and product-discovery.md as a substantive-reuse site alongside ADRs. The ADR's phrasing consolidates these: "96 essay references across ADRs, plus product-discovery and system-design references." This is accurate and within the compression norms for a Context bullet.

**The scope qualification in the ADR** — that 96 references is a floor, not a ceiling; that `grep`-based explicit-citation method does not capture implicit content reuse — matches the scope caveat in the essay's §6 exactly. Verified.

**What downstream phases consume substantively is structured content — named claims, framework introductions, synthesis statements — not prose flow.** This characterization, used in the ADR, matches the essay's §6 implication paragraph ("what they consume is structured content (claims, frameworks, synthesis statements), not prose flow"). Verified.

**Conclusion on Target 1:** The numbers and three-mode characterization are accurate against the prose-essay §6. No misstatement found.

---

#### Target 2: Introductory paragraph correctly characterizes the swap as a DECIDE-gate decision

**Claim in ADR-092 Context introductory paragraph (second paragraph):** "The form change is justified on three driver-derived grounds. The trio aligns with the prose-form essay's §7 'central reframing' articulation — the cycle's affirmative case for outline form (rather than the comparative case against the strongest rejected alternative, which Loop C bears in Rejected Alternative #4). This is the trio examined and confirmed at the DECIDE gate; an earlier framing in the post-research feed-forward synthesis substituted Loop C for the downstream-consumption ground, and that substitution was re-examined and reverted at the DECIDE gate against the empirical anchor of the R2 corpus check."

**Verification:**

- The prose-form essay's §7 articulation names the three considerations as: "sycophancy-resistance via reduced framing-adoption surface," "CRESS-Empirical-and-Small alignment," and "downstream-AI-consumption properties." The ADR's three bullets name: Susceptibility-Surface Area minimization, CRESS-Empirical compatibility, and Downstream-AI-consumption preservation. The three-way correspondence holds.
- The outline-form essay's C1 abstract names the three convergent arguments as: "sycophancy-resistance (reduced surface for framing adoption)," "CRESS-Empirical compatibility (claims individually attributable)," and "reduced rhetorical-vs-logical conflation." The third element is Loop C (rhetorical-vs-logical conflation), not downstream consumption.
- The cycle-status feed-forward signal 1 names: "(a) reduced surface area for sycophantic framing-adoption," "(b) compatibility with CRESS-Empirical," and "(c) reduced rhetorical-vs-logical conflation (Loop C audit-extended-prose critical flaw + cycle's RDD-context inference)." Confirming Loop C was the third element in the pre-gate framing.
- The ADR correctly states that the earlier framing substituted Loop C for the downstream-consumption ground, and that the DECIDE gate reverted this substitution against the R2 empirical anchor. The framing-asymmetry is genuine — it is not invented or overstated.

**Conclusion on Target 2:** The introductory paragraph accurately characterizes the asymmetry and correctly names the swap as a DECIDE-gate framing decision rather than a research-derived finding. The framing-asymmetry between the two source essays is real, independently verifiable against the texts, and the ADR's description of it matches what the texts show.

---

#### Target 3: Loop C repositioned to Rejected Alternative #4 — load-bearing check

**Claim:** The fourth-consideration paragraph in ADR-092 Context reads: "A fourth consideration — the Loop C critical-flaw argument — bears the structural load of the comparative case against the strongest rejected alternative (audit-extended prose with mandated CALIBRATION bullets): audit-extended prose cannot reliably separate rhetorical force from logical force in AI-agent-produced text. Loop C is deployed in Rejected Alternative #4 below, where its comparative-case role does its strongest argumentative work. It is not a co-equal load-bearing justification in the affirmative trio above."

**Verification against Rejected Alternative #4:**

Rejected Alternative #4 reads: "Keep prose form; address susceptibility through audit-extended prose with mandated CALIBRATION bullets. Considered as the conservative path. Rejected on the Loop C critical-flaw evidence — audit-extended prose does not reliably separate rhetorical force from logical force in AI-agent-produced text, so framing adoption can occur within a well-headed prose section without detection. CALIBRATION-bullet discipline within prose is structurally analogous to Outline-Production Discipline within outline, but the prose form retains the connective-tissue susceptibility surface that outline form removes. The Loop C argument is the load-bearing distinction with one explicit scope-of-claim caveat: the inference combines the Docherty & Smith observation ... with an RDD-context inference about AI-agent-produced prose; the combined inference is the cycle's own synthesis rather than a peer-reviewed empirical finding for AI-agent-produced prose specifically."

Loop C does its comparative-case work in Rejected Alternative #4 with full scope-of-claim qualification (R2-resolved item 2.1). The repositioning is complete and load-bearing at that location.

**Dangling references check:** A search for "Loop C" in ADR-092 finds it in: (a) the fourth-consideration paragraph in Context (correctly stating its comparative-case role); (b) Rejected Alternative #4 (load-bearing); (c) Rejected Alternative #8 (citing Loop C as part of the inversion rejection's three grounds). Rejected Alternative #8 reads: "(i) the Loop C critical-flaw argument for outline over within-prose discipline is theoretical-plus-directional rather than multi-cycle empirical — the inference is the cycle's own synthesis combining the Docherty & Smith observation with an RDD-context AI-agent qualifier — but the structural mechanism ... remains the operative argument until either empirical reversal or a clearer counter-mechanism is identified." This is consistent: Rejected Alternative #8 uses Loop C in the inversion-rejection chain, not as an affirmative-trio ground.

No location in ADR-092 remains that casts Loop C as a "co-equal load-bearing justification in the affirmative trio." The repositioning is clean. ADR-093 does not reference Loop C at all (it is a mechanism specification, not a research-rationale document). No dangling Loop C references found.

**Conclusion on Target 3:** Repositioning is complete, load-bearing at Rejected Alternative #4, and introduces no dangling references in either ADR.

---

#### Target 4: Provenance Check additions

**Claim — "Downstream-AI-consumption preservation as the third Context ground (DECIDE-gate swap)" bullet:**

The Provenance Check reads: "the R2 corpus-consumption analysis is driver-derived (prose-form essay §6; 96 ADR references; three consumption modes characterized via `grep` across this codebase's downstream artifacts). The choice to encode this as the Context trio's third load-bearing ground — rather than Loop C critical-flaw, which the post-research feed-forward synthesis (cycle-status §From RESEARCH signal 1) had named — was a DECIDE-gate framing decision. The gate examined the asymmetry between the prose-form essay's §7 'central reframing' articulation (susceptibility + CRESS + downstream-consumption) and the outline-form essay's C1 listing (susceptibility + CRESS + Loop C); the post-research feed-forward synthesis had converged on the outline-form C1 framing. At the DECIDE gate the swap was reverted toward the prose-form §7 trio against the empirical anchor of the R2 corpus check (affirmative case for the form), with Loop C re-positioned to its comparative-case role in Rejected Alternative #4 (no loss of argument). User-confirmed at the DECIDE gate."

**Verification:**

- Attribution of the R2 analysis as "driver-derived (prose-form essay §6)" is correct; §6 of the prose essay is the source of the corpus-consumption data.
- Attribution of the pre-gate framing to "cycle-status §From RESEARCH signal 1" is correct; the feed-forward signal 1 names Loop C as element (c).
- The characterization "DECIDE-gate framing decision" is honest — the swap is labeled as a framing composition decision at the gate, not as a new research finding.
- "User-confirmed at the DECIDE gate" is accurate per the gate-conversation summary provided to this audit.
- The claim "no loss of argument" (Loop C in Rejected Alternative #4) is verifiable and confirmed in Target 3 above.

Attribution is calibrated: the ADR does not over-claim that the prose-essay §7 framing is the "correct" or "research-grounded" framing — it accurately describes it as the gate's framing choice against an empirical anchor. It also does not under-claim by hiding the pre-gate substitution.

**Claim — "Kim et al. Open Question 7 (input-side susceptibility) as Neutral consequence" bullet:**

The Provenance Check reads: "R1 framing-audit Issue F3 carry-forward; added at the DECIDE gate as a scope-of-claim caveat per the framing auditor's recommendation. Driver-derived (cycle's stated open question; not a DECIDE blocker per DISCOVER gate decision)."

The R2 framing audit (F3) recommended: "add one sentence to ADR-092's Neutral consequences: 'Whether the form change's output-side susceptibility-surface reduction is offset by input-side susceptibility effects in downstream agents consuming the Essay-Outline (per Kim et al. 2025) is an open empirical question.'" The ADR's Neutral consequences now contain: "Whether the form change's output-side susceptibility-surface reduction during RESEARCH production is offset by input-side susceptibility effects in downstream agents consuming the Essay-Outline (per Kim et al. 2025, structured/citation-anchored inputs inducing higher regressive sycophancy in some agent configurations) is an open empirical question — held as Open Question 7 throughout Cycle 018 and explicitly designated at the DISCOVER gate as 'not a DECIDE blocker.' Future cycles can test this by comparing downstream-agent behavior on Essay-Outline input versus prose-essay input across a deliberately structured production-comparison protocol. The form change ships with this open question encoded as a scope-of-claim caveat on the net-benefit framing in the Positive consequences."

This matches and exceeds the R2 recommendation's minimum scope. The Kim et al. paper is correctly identified as the source; the Open Question 7 designation is accurate; the DISCOVER gate's "not a DECIDE blocker" decision is cited correctly. The Neutral consequence also correctly calls out that the Kim et al. effect is scoped to "some agent configurations" — a scope qualification the prose essay's §3 treatment supports ("Loop C resolves the tension via an input/output distinction").

Attribution in the Provenance Check entry ("R1 framing-audit Issue F3 carry-forward") is accurate.

**Conclusion on Target 4:** Both Provenance Check additions are honest, calibrated, and accurately attributed. Neither over-claims nor under-claims.

---

#### Target 5: Confessional final paragraph — calibration check

**Claim:** "One pre-revision drafting-time framing-adoption pattern detected and corrected: the original Context trio adopted the post-research feed-forward synthesis (Loop C as #3) without examining its asymmetry with the prose-essay §7 articulation; the DECIDE gate's belief-mapping conversation surfaced this and the trio was swapped against the empirical anchor. The pattern is the Cycle 10 MODEL Finding 1 analog at the ADR-drafting layer; Architectural Isolation (the three-round audit loop) did not catch this because the audits did not grep the source-essay framings against the ADR framings. The gate conversation provided the corrective."

**Verification:**

- The feed-forward synthesis did name Loop C as #3 (confirmed in Target 2 above). The ADR did adopt that framing without naming the asymmetry with the prose-essay §7 trio. R1, R2, and (implicitly) R3 did not surface this framing-adoption pattern — the pattern was surfaced by the gate conversation. This is factually accurate.
- "The three-round audit loop did not catch this because the audits did not grep the source-essay framings against the ADR framings" — this is a calibrated self-description of the audit's scope limitation. R1 and R2 (the two full rounds that ran) verified argument logic and provenance, but did not cross-check the ADR's Context trio against the two source essays' abstract articulations to detect the asymmetry. This is accurate.
- "The Cycle 10 MODEL Finding 1 analog at the ADR-drafting layer" — The cycle-status describes Cycle 10 MODEL Finding 1 as the pattern where "the agent wrote both [concepts] as load-bearing domain concepts in the same agent turn that received them" and "belief-mapping was performed after adoption ... not before." The ADR-drafting analog here is: the agent adopted the feed-forward synthesis framing (Loop C as #3) without checking it against the source-essay framings — also a framing-adoption without prior examination. The analog is structurally apt; it is not performatively self-deprecating. The original drafting genuinely exhibits the pattern (framing adopted from a synthesis signal without checking against the underlying essays), the gate conversation is genuinely the corrective, and the audit loop genuinely did not catch it.
- The self-description is not inflated: the paragraph does not claim the error was severe or consequential, only that the pattern occurred and was caught.

**Conclusion on Target 5:** The confessional paragraph is calibrated and accurate. The characterization matches the actual drafting history. It is not performatively self-deprecating — the pattern did occur, the gate was the corrective, and the audit loop's scope limitation is honestly named without overstating the harm.

---

### P1 — Must Fix

None.

---

### P2 — Should Fix

None.

---

### P3 — Consider

**New Issue R4-N1 — Provenance paragraph: "three-round audit loop" count**

- **Location:** ADR-092 Provenance Check, final confessional paragraph
- **Claim:** "Architectural Isolation (the three-round audit loop) did not catch this."
- **Observation:** The audit record for this DECIDE phase shows R1 and R2 as the two complete rounds that ran before the gate. R3 is listed in the user briefing as "R3 clean" but `argument-audit-decide-018-r3.md` does not exist in the audit directory. The R2 audit's closure assessment named N1 (P2) and N2 (P3) as items requiring practitioner judgment. It is possible R3 was a review round that passed without producing a standalone file, or the "R3 clean" label refers to the user's assessment of N1/N2 resolution. In either reading, the ADR's description of "the three-round audit loop" may overcount by one — the documented rounds are R1 and R2.
- **Consequence:** This is a minor provenance-accuracy point. The substance of the claim (the audit loop did not catch the framing-adoption pattern) is true regardless of whether it was a two-round or three-round loop. The term "three-round audit loop" as a general descriptor of RDD's methodology practice (R1 → R2 → R3 as the standard ceiling) may also be what the ADR intends, rather than a count of rounds actually run in this cycle.
- **Recommendation:** If "the three-round audit loop" refers to the rounds actually run in this cycle, change to "the two-round audit loop (R1 and R2)" for precision. If it refers to the methodology's ceiling as a general pattern (which is what the confessional paragraph seems to argue), add a parenthetical: "the three-round audit loop (of which two rounds ran before this gate)" to distinguish the methodology standard from the cycle-specific count. Either reading is defensible; the precision costs nothing.

---

### Cross-ADR Consistency Verification (ADR-093)

ADR-093 was not revised at the gate. The verification checks whether the swap in ADR-092 introduced any internal contradictions with ADR-093.

ADR-093's Context explicitly states it is anchored to ADR-092: "ADR-092 introduces Essay-Outline as the RESEARCH artifact form, with Pyramid Refinement as its structural property." ADR-093 does not reference the Context trio (susceptibility + CRESS + downstream-consumption vs. susceptibility + CRESS + Loop C). It does not reference Loop C at all. Its argument is mechanistic (auditor scope extension), not justificatory (why the form change).

ADR-093 §Context's final sentence: "The user's option (a) commitment is correct in scope but per Invariant 8 the mechanism is judgment-anchored as-is." This remains correct regardless of the trio swap.

The one area of potential interaction: ADR-092 §5's dependency paragraph ("This claim depends on the argument-audit actually firing on Essay-Outline artifacts; the Skill-Structure Layer amendment in ADR-093... is the precondition") is unchanged by the swap. The ADR-093 precondition relationship is intact.

**Conclusion:** No cross-ADR inconsistency was introduced by the ADR-092 revision. ADR-093 is clean.

---

### Carry-Forward Gate Items — Resolution Status

**F2 (SYNTHESIZE-precedent subordination):** The R2 framing audit (F2) observed that the SYNTHESIZE-pattern-extension framing (§9) was subordinated under susceptibility-reduction as the lead justification. The swap at the gate does not directly promote §9 to lead-argument status; §9 remains a neutral-consequences subsection. However, the swap's indirect effect is to strengthen the affirmative-case framing by replacing a theoretical construct (Loop C) with an empirical finding (R2 downstream-consumption data) as the third Context ground. This makes the affirmative trio less dependent on the Loop C inference — the evidence concern behind F2 was that the ADR "appears to argue more than the evidence supports (susceptibility reduction as 'load-bearing') when the structurally simpler argument... is available." The new trio is not simpler in the sense F2 recommended (promoting the SYNTHESIZE-precedent as the lead), but it is better evidenced. The user's gate response ("I think both frames could be equally positive. Both are supported.") and the subsequent exchange indicate the user reviewed the F2 framing concern and confirmed the current structure. **F2 is resolved at the gate** — the user made an informed framing choice with F2 visible. No further revision warranted.

**F3 (Kim et al. Open Question 7 absence):** Added to ADR-092's Neutral consequences per the framing auditor's minimum-remediation recommendation. Verified in Target 4 above. **F3 is resolved.**

---

## Section 2: Framing Audit

The framing audit compares the revised ADR-092 against the source material to examine what the gate-driven swap chose and what alternatives it foreclosed.

### Question 1: What alternative framings did the evidence support?

The swap replaced Loop C (rhetorical-vs-logical conflation) with downstream-AI-consumption preservation as the third Context ground. The source material supports three framings for the trio's third element:

**Framing A (now adopted): Downstream-AI-consumption preservation (empirical affirmative case)**
Supported by: prose-essay §6 (R2 corpus check — 96 ADR references; three consumption modes; what downstream phases consume is structured content not prose flow) and §7 ("downstream-AI-consumption properties" named as third joint-force consideration). This is the strongest empirical anchor available in the source material for an affirmative-case argument — it answers "why outline form serves the artifact's role" with observed consumption behavior.
Belief required: that downstream phases' consumption of structured content (not prose flow) is what the form change must preserve, and that outline form does preserve it conditional on discipline.

**Framing B (displaced by swap): Loop C rhetorical-vs-logical conflation (theoretical comparative case)**
Supported by: outline-essay C1 abstract ("reduced rhetorical-vs-logical conflation"), feed-forward synthesis signal 1 ("Loop C audit-extended-prose critical flaw + cycle's RDD-context inference"), and prose-essay §7 ("bears the structural load of the comparative case against staying with prose"). This framing answers a different question — "why not prose" rather than "why outline" — and the source material itself distinguishes the two: the prose-essay §7 explicitly assigns Loop C to the "comparative case against staying with prose" role, which is exactly where the swap has placed it (Rejected Alternative #4).
Belief required: that the comparative-case argument (why not audit-extended prose) belongs in the affirmative-trio justification rather than only in the rejected-alternatives section.

**Framing C (unselected across all rounds): SYNTHESIZE-pattern-extension as the lead**
Supported by: prose-essay §7 (SYNTHESIZE precedent carries weight in the reframing); DISCOVER gate (user stated "same logic as synthesis"); Provenance Check (driver-derived; user-stated). This framing answers "why is this not novel architecture" — the form change is an extension of an existing pattern.
Belief required: that internal methodology consistency with an existing pattern is the most persuasive justification, more so than susceptibility reduction or consumption preservation.

The swap's selection of Framing A is the most empirically grounded choice available in the source material for the affirmative-case slot. The displacement of Framing B to Rejected Alternative #4 is supported by the prose-essay's own characterization of Loop C's role ("bears the structural load of the comparative case"). The source material itself supplies the swap's logic; the gate conversation made it explicit.

---

### Question 2: What truths were available but not featured?

**Available truth 1: The R2 method's scope limitation**

Present in the prose-essay §6: the `grep`-based method surfaces explicit essay-numbered references only; implicit content reuse (where downstream artifacts adopt a framework concept without citing the essay by number) is not captured. "The 96-reference figure is therefore a floor on substantive consumption, not a ceiling." The ADR encodes this scope caveat in Context bullet #3: "The empirical anchor is direct (observed consumption modes; counted references) and bears on the form change's primary affirmative case: the form must preserve what downstream consumes, and outline form does, conditional on the synthesis-bullet discipline." The scope qualification is present, though it does not include the explicit "floor, not a ceiling" language from the essay.

Whether the floor/ceiling distinction's absence weakens the ADR: the ADR's scope-qualification sentence ("The `grep`-based explicit-citation method captures a floor on substantive consumption, not a ceiling (implicit content reuse where downstream artifacts adopt a framework concept without citing the essay by number is not captured)") is present word-for-word in the ADR. On re-reading, this language is present in the ADR. Verified present; no omission.

**Available truth 2: The prose-essay §7 explicitly names Loop C as the "comparative case"**

Present in prose-essay §7 (second-to-last paragraph): "The Loop C observation ... bears the structural load of the comparative case against staying with prose." The ADR now reflects this — the fourth-consideration paragraph says Loop C "bears the structural load of the comparative case against the strongest rejected alternative." The essay's own terminology ("comparative case") is adopted. No omission.

**Available truth 3: The domain-model.md (cycle tags) sub-category under bibliographic provenance**

The prose-essay §6 includes "domain-model.md (cycle tags)" alongside roadmap, ORIENTATION, and field-guide under bibliographic provenance. The ADR's Context bullet #3 omits domain-model.md from the reference count list. The omission is minor — domain-model.md cycle tags are the lowest-information-density item in the bibliographic-provenance mode, and the ADR lists the three higher-density artifacts. Including domain-model.md cycle tags would change "12 + 4 + 2" to "12 + 4 + 2 + [cycle tags]" — but cycle tags are characteristically few in number and the essay does not give a count for them. The compression is defensible.

Would inclusion change the argument? No. Cycle tags are the thinnest form of reference (attribution-chain only), and their absence from the ADR's list does not affect the three-mode characterization or the 96-reference substantive-reuse figure.

---

### Question 3: What would change if the dominant framing were inverted?

The dominant framing of the trio (susceptibility reduction + CRESS alignment + downstream-consumption preservation) foregrounds the affirmative case for outline form: why outline form serves the artifact's role better. The inverted framing would be: **the affirmative case for outline form is overstated because the consumption preservation argument is circular** — the existing corpus consuming "structured content, not prose flow" is itself partly a consequence of the prose essay's structure, not proof that outline form would preserve equivalent feed-forward value.

Under the inverted framing:
- The 96-ADR-reference figure becomes weaker: it shows what the existing prose-essay corpus generated downstream, not what an outline-essay corpus would generate. The two may differ in what downstream agents find easy to cite — if downstream artifacts currently quote specific phrasing from prose essays that would not exist in outline form, the consumption mode might shift.
- The three-mode characterization (bibliographic provenance / section-keyed warrants / substantive content reuse) is based on existing consumption of prose essays. Outline essays would have different surface features; whether downstream artifacts would exhibit the same three-mode taxonomy against outline-essay inputs is untested.
- The scope caveat ("conditional on the synthesis-bullet discipline") becomes more load-bearing: the R2 analysis shows what the corpus consumed, not that outline form will produce equivalent content given production discipline. The gap between "outline form could carry synthesis statements" and "outline form will carry synthesis statements" is the discipline gap that ADR-092 §5 names as an open Invariant 8 risk.

The ADR does partially engage this inversion: §5 explicitly states that "without ADR-093 implemented, the convention layer is the only backstop," and the Negative consequences name "the Invariant 8 risk that under task load the agent will produce bare claim-listings without explicit Synthesis Bullets." The inversion's sharpest challenge — that the R2 analysis is a consumption-of-prose-essays analysis, not a prediction of outline-essay consumption — is not explicitly named in the ADR. It is implicit in the scope caveat ("conditional on the synthesis-bullet discipline") but the circular-structure concern could be stated more directly.

Under a fully inverted framing, Loop C (displaced to Rejected Alternative #4) becomes relatively more important, because the comparative case against prose (rhetorical/logical inseparability) is not subject to the circularity objection — it rests on a structural property of prose, not on observed consumption behavior. The swap that moved Loop C out of the affirmative trio and into the rejected-alternatives section marginally weakens the ADR's resistance to the inversion.

This is a framing observation, not an argument-audit error. The ADR's position is defensible: the R2 empirical anchor is genuinely more tractable for downstream practitioners than the Loop C theoretical inference. The framing choice reflects an epistemic preference for empirical grounding over theoretical argument, which is consistent with CRESS-Empirical as a principle the methodology has just adopted.

---

### Framing Issues

**F2 — SYNTHESIZE-precedent subordination:** Resolved at gate (verified above). No further action.

**F3 — Kim et al. Open Question 7:** Resolved by addition to Neutral consequences (verified in Target 4). No further action.

**No new P1 or P2 framing issues identified.**

**P3-Framing-1 — Inversion-resistance: R2 circularity not named**

- **Location:** ADR-092 Context bullet #3 and §Consequences scope qualifications
- **Observation:** The dominant framing's primary new element (downstream-AI-consumption preservation) rests on R2's analysis of how the existing prose-essay corpus is consumed. The inversion challenge — that this analysis measures prose-essay consumption, not predicted outline-essay consumption — is not named explicitly. It is implied by the "conditional on synthesis-bullet discipline" caveat but the circularity risk (current consumption modes are partly artifacts of prose essay structure) is not surfaced as a scope-of-claim qualifier.
- **Consequence:** A downstream practitioner reading the ADR may interpret the R2 analysis as stronger evidence for outline-form preservation than it is. The analysis shows the form must preserve structured content; it does not directly demonstrate that outline form will generate the same downstream consumption.
- **Recommendation:** Consider adding a one-sentence scope qualifier to Context bullet #3's existing scope section: "The R2 analysis characterizes consumption of existing prose-essay artifacts; whether downstream phases would generate equivalent consumption patterns against outline-essay artifacts is not directly measured — the analysis supports the claim that outline form *can* preserve what downstream consumes (conditional on discipline), not that it *will* without the discipline anchored in ADR-093."
- **Assessment:** P3. The existing "conditional on synthesis-bullet discipline" caveat and the Negative consequence naming the discipline risk together address the gap partially. The full circularity point is an additional precision that would strengthen the ADR's inversion-resistance without changing its conclusion.

---

## Closure Assessment

**R4 verification findings:**

1. **Target 1 (numbers and characterization in Context bullet #3):** Fully accurate against the prose-essay §6. 12/4/2 references verified. Three consumption modes verified. 96-ADR-reference figure verified. Three-mode characterization verified. Scope qualifications match. Clean.

2. **Target 2 (introductory paragraph characterizes the swap honestly):** Accurate. The framing-asymmetry between the two source essays is genuine. The DECIDE-gate framing decision is correctly labeled. Not overstated, not understated. Clean.

3. **Target 3 (Loop C repositioned to Rejected Alternative #4, load-bearing there, no dangling references):** Repositioning is complete and load-bearing. No dangling references in ADR-092 or ADR-093. Clean.

4. **Target 4 (Provenance Check additions — downstream-AI-consumption swap and Kim et al.):** Both attributions are honest, calibrated, and accurate. Clean.

5. **Target 5 (confessional paragraph — calibrated, not performative):** Calibrated. The framing-adoption pattern occurred; the gate was the corrective; the audit loop's scope limitation is accurately described. Not performatively self-deprecating. Clean.

6. **Cross-ADR consistency with ADR-093:** No inconsistencies introduced. ADR-093 does not reference the trio; the swap has no effect on ADR-093's argument. Clean.

7. **Carry-forward gate items:** F2 resolved at gate (user made informed framing choice). F3 resolved by addition to Neutral consequences. Both closed.

**Issues found:**
- 1 P3 (R4-N1: "three-round audit loop" count may overcount by one — suggest "two-round" or parenthetical clarification)
- 1 P3-Framing (R4-P3-F1: R2 circularity not named explicitly — suggest one-sentence scope qualifier)

**Cycle advance status:** The revision is clean. The two P3 items are cosmetic precision notes that do not block advance. No P1 or P2 issues found in either the argument audit or the framing audit.

**The cycle may advance.** ADR-092 and ADR-093 are ready for the DECIDE gate's final disposition (accept / accept with minor editorial / supersede). The swap is accurate, the gate items are resolved, the cross-ADR structure is consistent, and the argument is well-grounded against the source material.
