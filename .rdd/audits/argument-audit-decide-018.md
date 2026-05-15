# Argument Audit Report

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
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-091-dual-mode-build.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-082-question-isolation-protocol.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-067-three-tier-enforcement-classification.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-089-adr-067-harness-layer-revision.md`
- `/Users/nathangreen/Development/rdd/agents/argument-auditor.md`

**Date:** 2026-05-14

---

## Section 1: Argument Audit

### Summary

- **Argument chains mapped:** 11 (ADR-092: 8; ADR-093: 3)
- **Issues found:** 7 (0 P1, 4 P2, 3 P3)

ADR-092 argument chains: (1) form change justified by susceptibility-surface reduction; (2) CRESS-compatibility; (3) Loop C critical-flaw for outline over audit-extended prose; (4) Pyramid Refinement as structural property; (5) Outline-Coherence Signal discrimination; (6) Synthesis-bullet anchoring (conventional + structural verification at expansion level); (7) Available Instantiation framing; (8) form-migration scope held separable. ADR-093 argument chains: (1) existing auditor.md does not specify Argument-Graph consumption or expansion-fidelity verification; (2) Skill-Structure Layer is the correct substrate; (3) the amendment is a separate ADR rather than folded into ADR-092.

No P1 issues found. The ADRs' logical structure is sound; decisions follow from stated context; cross-references are coherent; the source material's scope-of-claim caveats are faithfully encoded; Invariant 8 is correctly applied; and the existing `argument-auditor.md` agent definition was correctly read — it does NOT specify Argument-Graph consumption, graph-traversal, or expansion-fidelity verification, confirming ADR-093 §5's premise.

---

### P1 — Must Fix

None.

---

### P2 — Should Fix

**Issue 2.1**

- **Location:** ADR-092 §Context, paragraph 2 (Susceptibility-Surface Area minimization bullet) and §Rejected Alternatives #4
- **Claim:** The Loop C critical-flaw evidence (that "audit-extended prose cannot separate rhetorical force from logical force") is stated as if it is a finding from the surveyed literature. The rejected-alternative #4 entry calls it "Loop C critical-flaw evidence" and makes it the "load-bearing distinction" against keeping prose.
- **Evidence gap:** The prose essay (§3, final paragraph) is explicit that the Loop C observation is the cycle's own synthesis combining two distinct inputs: the Docherty & Smith finding (mandatory headings within prose) and an RDD-context inference about AI-agent-produced prose. The essay states: "The observation is Loop C's; the inference combining that observation with the RDD-context AI-agent qualifier is this cycle's synthesis." ADR-092 consistently labels this as "Loop C critical-flaw evidence" without preserving the distinction between the literature finding and the cycle-as-synthesis inference. A reader of the ADR alone cannot tell that the inference is the drafting agent's composition, not a finding from the surveyed sources. The ADR's provenance section does not name this distinction; it is the one load-bearing framing element whose attribution is elided.
- **Recommendation:** In Rejected Alternatives #4 (and wherever the Loop C framing appears as evidence), add a parenthetical: "(the Docherty & Smith observation, plus the cycle's inference that the AI-agent context extends the finding — the inference is cycle synthesis, not a surveyed-source finding)." This matches the honest scope-of-claim standard the ADR otherwise maintains throughout.

**Issue 2.2**

- **Location:** ADR-092 §Decision §5 (Outline-Production Discipline section), final paragraph
- **Claim:** "The methodology does not assert that the convention layer alone is reliable under task load — Outline-Production Discipline's reliability under task load is an open question that future cycles may revisit."
- **Evidence gap:** The susceptibility snapshot and the cycle-status feed-forward signals both name an analog from Cycle 10: "prose-hardening-doesn't-work" — disciplinary instructions in skill text failed under task load in that prior cycle, and the DISCOVER gate surfaced synthesis-bullet-discipline as the analogous open question. ADR-092 §5 acknowledges the risk but doesn't cite the Cycle 10 analog. The Invariant 8 compliance argument (§5's claim that the Pyramid Refinement audit at the expansion level "catches the resulting failure") is structurally sound — but only if the argument-auditor actually fires on Essay-Outline artifacts. If it doesn't fire (judgment-anchored dispatch failure), the convention layer is the only backstop. ADR-093 addresses this, but ADR-092 §5 should cross-reference ADR-093 as the precondition for its "the Pyramid Refinement audit catches discipline failures" claim, so the claim's dependency is visible.
- **Recommendation:** Add a sentence: "This claim depends on the argument-audit firing on Essay-Outline artifacts; the Skill-Structure Layer amendment (ADR-093) is the precondition that makes the structural catch reliable. Without ADR-093 implemented, the convention layer is the only backstop."

**Issue 2.3**

- **Location:** ADR-092 §Rejected Alternatives #3 (Synthesis-bullet discipline anchored structurally per-section)
- **Claim:** The rejection treats "every body section must have a literal SYNTHESIS bullet" as the structural alternative and rejects it because "the four-section structure with explicit Argument-Graph + Pyramid Refinement audit already operates at the *expansion* level." This is the chosen layer separation.
- **Evidence gap:** The susceptibility snapshot's Finding 1 named three alternative framings for Pyramid Refinement that were not engaged before the concept was adopted: (a) flat four-section; (b) two-level hierarchy; (c) conventional rather than structural. ADR-092's Rejected Alternatives does address the synthesis-bullet per-section structural check, but none of the three snapshot-named alternatives to Pyramid Refinement itself appear as explicit rejected alternatives for the structural property. A reader trying to understand why the three-level pyramid was chosen over the flat or two-level alternatives cannot find that reasoning in the ADR. The MODEL gate's susceptibility snapshot explicitly named this as a warrant gap — the Grounding Reframe (Target 1) addressed it via worked-example grounding, but the three alternatives' rejections are not present in the ADR's rejected alternatives section.
- **Recommendation:** Add to Rejected Alternatives (or add an explicit note in §2 Pyramid Refinement): "Three structural alternatives to the refinement hierarchy were not adopted: (a) flat four equal sections — rejected because the sections are not informationally symmetric; abstract synthesizes what outline develops; treating them as peers would sever the expansion-fidelity verification target; (b) two-level hierarchy — abstract summarizes, everything else is flat — rejected because it loses the argument-graph-to-outline traversal that Invariant 8 requires be anchored; (c) conventional rather than structural framing — rejected because the compliance test (a–d) cannot license the Outline-Coherence Signal stewardship trigger without being structural." These are brief; including them closes the snapshot's explicit warrant gap.

**Issue 2.4**

- **Location:** ADR-093 §Context, paragraph 3; §Decision §5
- **Claim:** "The amendment to `agents/argument-auditor.md` adds (BUILD-phase work)" and the Context says "The amendment to `agents/argument-auditor.md` is the unconditional anchoring that ADR-092 §2 requires."
- **Evidence gap:** ADR-093 §5 names the substrate as "the Skill-Structure Layer (the substrate named in ADR-067 for mechanisms whose enforcement technique is a concrete workflow step in a named skill)." ADR-089 amends ADR-067 to note that the Harness Layer is now advisory. ADR-093's substrate claim is entirely consistent with this — the agent file is Skill-Structure Layer, unaffected by ADR-089's change to the Harness Layer. However, ADR-093 cites "ADR-067" in its Context (paragraph 3, last sentence: "The substrate named in ADR-067 for mechanisms whose enforcement technique is a concrete workflow step in a named skill") without noting ADR-089's partial supersession. A downstream reader who sees the ADR-067 reference and follows it will encounter the ADR-089 supersession header, but readers who don't follow the chain might not know to check whether ADR-067's current authority has been amended. The claim itself is correct (the Skill-Structure Layer substrate is unchanged by ADR-089), but the citation chain could be explicit.
- **Recommendation:** Change the Context citation from "the substrate named in ADR-067" to "the substrate named in ADR-067 as updated by ADR-089 — the Skill-Structure Layer, whose technique and primacy are unchanged by the ADR-089 amendment." This is a one-phrase clarification; the underlying claim is correct.

---

### P3 — Consider

**Issue 3.1**

- **Location:** ADR-092 §Decision §4 (Argument-Graph format conventions), final sentence of the main section
- **Claim:** "Citation-Embedded Outline body subsections SHOULD anchor to Argument-Graph node identifiers (e.g., `### Section 3: Argument-graph parallels in research-essay corpora (C1)`) so the auditor can verify 'this graph node expands cleanly into these outline bullets.'"
- **Observation:** The word SHOULD (RFC-2119 style) introduces an optional normative requirement. ADR-093 §2 (Tier 3 traversal step) states that the auditor looks for body subsections anchored to graph identifiers "per ADR-092 §4 convention." The combination creates a mild consistency tension: if the SHOULD is discretionary for the author, but the auditor traversal relies on the anchor convention, failure to anchor body subsections creates an Argument-Graph node with no detectable body content — which ADR-093 §3 would classify as a P1 boundary violation. The auditor cannot distinguish "body content exists but the author didn't add the anchor" from "body content is genuinely absent." This gap is real but bounded; the auditor can perform reverse-direction traversal (reading body sections for thematic alignment with graph nodes even absent an explicit anchor). Consider whether SHOULD should be MUST, or whether the fallback traversal procedure should be specified in ADR-093 §2.
- **Recommendation:** Either strengthen to MUST (if the anchor is required for audit traversal) or add a sentence to ADR-093 §2 explaining how the auditor handles body sections without graph-node anchors: "When a body subsection lacks a graph-node anchor, the auditor performs thematic alignment — associating the subsection with the most probable graph node — and flags the missing anchor as a P3 consideration."

**Issue 3.2**

- **Location:** ADR-092 §Consequences, Negative bullet 3 ("Argument-Graph format imposes a production-time cost")
- **Claim:** "The production-time cost is a feature, not a bug."
- **Observation:** The claim is rhetorical rather than argumentative. The prior sentence establishes the legitimate point: "the explicit structure is the source of the form's audit-fidelity advantage." The "feature, not a bug" phrasing adds advocacy framing without adding argument. The argument stands on the prior sentence; the rhetorical turn adds surface without content. Minor.
- **Recommendation:** Replace "the production-time cost is a feature, not a bug" with "this cost is the mechanism through which the audit-fidelity advantage is realized — explicit structure requires explicit composition." This preserves the logic without the rhetorical packaging, consistent with the ADR's otherwise careful scope-of-claim discipline.

**Issue 3.3**

- **Location:** ADR-093 §Decision §3 (Expansion-fidelity verification), Boundary 3
- **Claim:** "This boundary overlaps with the citation-auditor's responsibilities; the argument-auditor reports the boundary as part of the pyramid coverage map, deferring citation-existence verification to the citation-auditor."
- **Observation:** The deferral is sensible, but the ADR does not specify what the argument-auditor does when a boundary 3 violation is detected. Does it report the violation as P1 (and flag it as "citation-auditor should also be run") or does it suppress the severity because it is the citation-auditor's primary domain? ADR-093 §3's P1 severity assignment includes "any boundary violation that breaks the pyramid" — boundary 3 violations technically break the pyramid (a citation in the outline with no References entry means a body bullet is asserted without a resolvable source). But the deferral language suggests the argument-auditor may not independently verify citation existence. The interaction between these two agents' findings is underdefined.
- **Recommendation:** Add one sentence clarifying the severity: "Boundary 3 violations detected by the argument-auditor during pyramid traversal are reported as P2 (the citation-auditor's P1 takes precedence over the argument-auditor's structural finding for the same error); if the citation-auditor has not yet run, the argument-auditor flags it as P1 with a note that the citation-auditor is the primary verifier."

---

## Section 2: Framing Audit

The framing audit makes the negative space of content selection visible. The primary documents chose particular framings — this section examines what those choices excluded.

### Question 1: What alternative framings did the evidence support?

**Alternative framing A: The form change primarily as a downstream-consumption optimization**

The source material's R2 corpus-consumption analysis (96 ADR references to essay structured content; three distinct consumption modes) provides the clearest empirical anchor in Cycle 018. ADR-092 uses this evidence as one of several supporting reasons, but frames the change primarily around susceptibility-surface-area reduction. An alternative framing would lead with the feed-forward argument: the form change is justified because downstream phases consume claims, frameworks, and synthesis statements — not prose flow — and the form change removes the disconnect between what the artifact produces (narrative) and what downstream agents consume (structure). Under this framing, the central argument would be: "Essay-Outline is better feed-forward context for downstream agents than prose essays, as established empirically by the 96-reference corpus check, and the form change addresses a structural mismatch between artifact production and artifact consumption."

What the reader would need to believe for this framing to be right: that downstream consumption patterns are stable enough that a single-cycle corpus check generalizes; that feed-forward optimization is the right criterion for RESEARCH artifact form; and that susceptibility-surface reduction is a secondary benefit rather than a primary driver.

The current framing emphasizes susceptibility-surface reduction as the load-bearing argument, which depends on Loop C's theoretical inference. The feed-forward framing depends on the R2 empirical check, which has a narrower scope but a more direct evidential base. ADR-092 does not frame the choice between these two leading arguments.

**Alternative framing B: The form change as a scope-validation forcing function**

The Outline-Coherence Signal's scope-failure diagnostic — that a pyramid that cannot read cleanly signals a cycle whose scope is too large — suggests a different framing: the form change is primarily valuable as a forcing function that surfaces scope problems structurally rather than absorbing them in prose flow. Under this framing, the four-section Essay-Outline's structural property (Pyramid Refinement) is not primarily about susceptibility reduction or feed-forward quality; it is about making scope problems visible before the cycle ends. The rejected alternative of "keep prose, address susceptibility through audit-extended prose" fails not because of the Loop C inference, but because prose form absorbs scope problems rather than surfacing them.

What the reader would need to believe: that scope-problem surfacing is the primary design goal of RESEARCH artifact form; that practitioners more often suffer from undiagnosed scope problems than from susceptibility-induced framing adoption; and that the Pyramid Refinement compliance test is more valuable as a scope-diagnostic than as an argument-audit target.

**Alternative framing C: The form change as an extension of the SYNTHESIZE pattern rather than as a response to audit concerns**

The source material (prose essay §7; outline form abstract C1; discover gate reflection) explicitly names the "same logic as synthesis" framing as the user's own criterion. An ADR framed around pattern-extension rather than susceptibility-reduction would lead with: "SYNTHESIZE already operationalizes outline-as-research-artifact + user-writes-prose-for-sharing. RESEARCH's prose form diverges from SYNTHESIZE's pattern without principled rationale. The form change names what was already working and applies it where the user identified an information-propagation-vs-sharing mismatch."

ADR-092 §9 covers this framing but relegates it to a final "Neutral" section under "SYNTHESIZE precedent: this is the upstream extension." The framing is present but subordinated, whereas it is the most direct user-stated criterion the discover gate surfaced.

What the reader would need to believe: that methodology internal-consistency (RESEARCH and SYNTHESIZE behaving symmetrically) is a load-bearing criterion; that the SYNTHESIZE pattern is well-enough established to carry the weight of argument; and that the three susceptibility-reduction justifications are supporting rather than load-bearing.

---

### Question 2: What truths were available but not featured?

**Truth A: The iterative-audit pattern and its cost implications**

The cycle-status cross-cutting observations record that Cycle 018 dispatched approximately 14 specialist subagents, including 4 rounds of citation audit and 2+ rounds of argument audit — and that the "both-form dogfooded design doubled most audit-related costs." This is directly relevant to ADR-092: the form change, if it succeeds in reducing susceptibility-surface area, should reduce the audit iteration cost over subsequent cycles. But if outline-production discipline failures are common (generating frequent Outline-Coherence Signal triggers), the total audit cost may not improve — it will simply shift from iteration-on-prose-errors to iteration-on-discipline-failures. ADR-092 does not address whether the form change is expected to reduce or increase total audit costs per cycle.

Where it appears: cycle-status §Cross-cutting observations; prose essay §8 (open questions).

Why excluded: likely a scope decision — ADR-092 is a form-change ADR, not a cost-projection ADR. But the omission means downstream cycles cannot calibrate expectations about whether Essay-Outline form reduces the methodology's operational cost or merely redistributes it.

Would inclusion change the argument? Not substantively. But it would add a Consequence (neutral or uncertain) that makes the cost profile visible.

**Truth B: Kim et al. input-side susceptibility (Open Question 7)**

The model gate reflection, cycle-status, and prose essay §3 all name Open Question 7 explicitly: whether outline-structured inputs to downstream RDD agents (DECIDE, ARCHITECT) trigger Kim et al.-type over-weighting (citation-based arguments inducing higher regressive sycophancy). The outline form reduces output-side susceptibility (during RESEARCH production) but may increase input-side susceptibility (during downstream consumption). This is a genuine theoretical tension the cycle acknowledged but held as an empirical test candidate.

ADR-092 does not mention Kim et al. or Open Question 7. The ADR encodes the Target 2 and Target 3 caveats conscientiously, but Open Question 7 is a scope-of-claim caveat on the form change's net benefit that is absent from the ADR.

Where it appears: prose essay §3 (explicit "the naive reading would be..."); cycle-status feed-forward from DISCOVER (item 6); model gate reflection.

Why excluded: likely intentional — the discover gate explicitly held it as "not a DECIDE blocker." But its absence from ADR-092's Consequences section means downstream readers of the ADR cannot see the net-benefit uncertainty.

Would inclusion change the argument? It would add a Negative consequence or a scope-of-claim caveat in the Consequences section: "Whether the form change's output-side susceptibility-surface reduction is offset by input-side over-weighting in downstream agents per Kim et al. (2025) is an open empirical question." The decision stands; the consequence's honesty improves.

**Truth C: The "methodology compromise" at R2 phase exit**

The cycle-status records that at the RESEARCH phase exit, "the user accepted targeted P2 fixes without an R3 re-audit." This means the essays underpinning ADR-092's evidence base were not fully-audit-clean at phase exit. ADR-092 does not acknowledge this. The prose essay's §8 does list a "cycle-as-instance reflection (ADR-087 §4 standing caveat)" which covers the broader epistemics, but the methodology-compromise note is more specific: some P2 findings in the essays were not resolved, and the cycle-status names this as "DECIDE may treat the essays as substantively complete but not 'fully audit-clean.'"

Where it appears: cycle-status §From RESEARCH feed-forward signals, item 5 (Methodology compromise).

Why excluded: scope decision — the ADR's provenance section is thorough, but the methodology-compromise at phase exit is a transparency item about the evidence base's completeness, not a finding the ADR draws from.

Would inclusion change the argument? Minimally — the unresolved P2 findings are unlikely to touch ADR-092's load-bearing arguments. But explicitly noting "the evidence base includes essays that exited RESEARCH phase with P2 findings unresolved (per the cycle-as-instance caveat)" is consistent with the ADR's otherwise high epistemic-transparency standard.

---

### Question 3: What would change if the dominant framing were inverted?

ADR-092's dominant framing: **"Keep prose; address susceptibility through audit-extended prose with mandated CALIBRATION bullets" is the rejected alternative that defines the form change's load-bearing claim.** The Loop C critical-flaw evidence (that audit-extended prose cannot separate rhetorical from logical force) is what distinguishes outline from within-prose discipline.

Inverted framing: **Audit-extended prose IS adequate to address the susceptibility concerns, because the Loop C inference (that framing adoption can occur within a well-headed section without detection in AI-generated prose) is an untested inference rather than an empirical finding.**

Under the inverted framing:

- **Claims that become weaker:** ADR-092's rejected alternative #4 becomes the viable path. The form change is then justified only by the theoretical Susceptibility-Surface Area argument and the directional citation-error comparison — neither of which has been tested across multiple cycles or tested against prose produced directly from primary sources (the Target 3 caveat applies). The framing-adoption reduction from outline form over audit-extended-prose-with-mandatory-headings is, under the inversion, asserted rather than evidenced.

- **Claims that become stronger:** The cost-of-form-change arguments in ADR-092's Consequences (Negative) gain force. If audit-extended prose is adequate, then the Argument-Graph format production cost, the discipline fragility under task load, and the mixed-corpus problem are costs the methodology accepts for uncertain gain.

- **Evidence that becomes more salient:** The 80–85% audit-fidelity figure from Spike S1 (which the essay frames as a directional gain) actually includes a loss: "rhetorical confidence calibration was harder to assess" in outline form. If the Loop C inference does not hold, the calibration loss is a real fidelity regression, not an acceptable trade. The prose essay §4 explicitly notes: "The differential-confidence-calibration loss is a real fidelity concern but does not require audit-extension." Under the inverted framing, this loss is more costly.

- **What ADR-092 would need to address:** If the Loop C inference is challenged, the ADR needs either (a) empirical evidence across multiple cycles that audit-extended prose consistently fails to surface framing-adoption events that outline form would catch, or (b) a more careful characterization of the Loop C claim: not "cannot separate rhetorical from logical force" (strong categorical claim) but "is harder to audit for framing adoption in AI-generated prose contexts" (hedged inference). The current ADR treats the Loop C argument as structurally settled ("the Loop C critical-flaw argument for outline over within-prose discipline is structural, not statistical — it applies categorically to prose forms"); if it is not structural but theoretical, the rejected alternative #8 rejection ("the Loop C critical-flaw argument is structural, not statistical") would need revision.

**Assessment of ADR-092's treatment of the inversion:** The rejected alternative #4 (keep prose; address susceptibility through audit-extended prose) engages the inversion directly. The rejection is substantive: it names the Loop C critical flaw as the load-bearing distinction and provides the mechanism argument. However, the rejection does not acknowledge that the Loop C claim is the cycle's own synthesis inference (not a peer-reviewed finding), and does not encode a scope-of-claim caveat on the structural-vs-statistical characterization. Rejected alternative #8 ("reject the form change entirely") does include a structured three-point rejection, but point (i) again relies on the Loop C argument as if it were structural and not theoretical. The inversion would be better served by one additional sentence in the rejection of alternative #4: "The load-bearing Loop C inference is the cycle's synthesis, not a surveyed-source empirical finding; future cycles producing multi-cycle audit comparisons between outline and audit-extended prose would either strengthen or refute it."

---

### Framing Issues

**Framing Issue F1 (P2)**

- **Location:** ADR-092 §Rejected Alternatives #4 and #8 (the inversion-adjacent rejections)
- **Claim:** The rejection of "keep prose; address susceptibility through audit-extended prose" rests on the Loop C critical-flaw argument characterized as structural ("it applies categorically to prose forms").
- **Framing gap:** The "structural" characterization of the Loop C argument overstates the evidence available. The prose essay characterizes Loop C as "theoretical (Docherty & Smith and the cycle's synthesis) rather than empirically measured for AI-agent-produced prose specifically." The ADR's rejected alternatives do not preserve this distinction; the Loop C claim is characterized as categorical and structural, which is a stronger claim than the source material licenses.
- **Recommendation:** In Rejected Alternatives #4, after "the Loop C critical-flaw evidence," add: "(the inference is the cycle's own synthesis combining the Docherty & Smith observation with an RDD-context AI-agent-qualifier — not a peer-reviewed empirical finding; see §Context caveat and §Consequences)." This is redundant with Issue 2.1 above — the two issues are the same root: the Loop C claim's provenance is not consistently encoded. Resolving Issue 2.1 (adding the provenance note in Context) addresses this framing issue simultaneously.

**Framing Issue F2 (P2)**

- **Location:** ADR-092 overall; the three alternative framings in Question 1 (downstream-consumption-optimization; scope-validation-forcing-function; SYNTHESIZE-pattern-extension) are either absent or subordinated.
- **Framing gap:** The dominant framing (susceptibility-surface reduction as the lead justification) is defensible but competes with framings that have stronger or more direct evidential grounding: the feed-forward framing (R2 empirical corpus check) and the SYNTHESIZE pattern-extension framing (user-stated at discover gate as the primary criterion). Subordinating the SYNTHESIZE framing to a Neutral Consequences subsection underweights the user's own stated criterion, which was "information propagates the right information forward" and "same logic as synthesis."
- **Recommendation:** Surface in the Context section — or elevate in the Consequences Positive bullets — that the SYNTHESIZE pattern-extension is the primary user-stated criterion and that the three susceptibility-reduction justifications are supporting rather than competing evidence. The current structure risks appearing to argue more than the evidence supports (susceptibility reduction as "load-bearing") when the simplest and most grounded argument (SYNTHESIZE already does this; RESEARCH diverges without principled rationale) is present but subordinated.

**Framing Issue F3 (P3)**

- **Location:** ADR-092 §Consequences, Positive bullets; ADR-093 §Consequences, Positive bullets
- **Framing gap:** Neither ADR mentions Open Question 7 (Kim et al. input-side susceptibility) in its Consequences. The form change is framed as reducing susceptibility, but the source material explicitly holds open whether the output-side reduction is offset by input-side over-weighting in downstream agents. This is underrepresented rather than absent — the cycle-status holds it as "not a DECIDE blocker" — but it is a counterpoint to the positive consequences framing that deserves a neutral or uncertain consequence entry.
- **Recommendation:** Add to ADR-092's Neutral consequences: "Whether the form change's susceptibility-surface reduction during RESEARCH production is offset by input-side susceptibility effects in downstream agents consuming the Essay-Outline (per Kim et al. 2025) is an open empirical question; future cycles can test this by comparing downstream-agent behavior on Essay-Outline input versus prose-essay input."
