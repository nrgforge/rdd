# Argument Audit Report

**Audited document:** `docs/essays/essay-outline-020-substrate-and-surface-separation.md`
**Source material:**
- `docs/essays/research-logs/research-log.md` (Cycle 020 — Loops 1, 2, 3, 5)
- `docs/essays/research-logs/lit-review-020-substrate-and-surface-separation.md` (Loop 2)
- `docs/essays/research-logs/lit-review-020-graduation-pain-structural-character.md` (Loop 3)
- `docs/essays/research-logs/spike-020-substrate-surface-prototype.md` (Loop 5)
- `docs/essays/essay-outline-018-does-rdd-over-engineer.md` (antecedent Cycle 019 Essay-Outline)
**Genre:** Essay-Outline (per ADR-092)
**Date:** 2026-05-22

---

## Section 1: Argument Audit

### Summary

- **Genre:** Essay-Outline
- **Argument chains mapped:** 7 (C1 through C7)
- **Issues found:** 9 (2 P1, 4 P2, 3 P3)
- **Pyramid coverage map:** included
- **Expansion-fidelity findings:** P1: 0, P2: 1, P3: 0

---

### Pyramid Coverage Map

#### Four-section structural check

The Essay-Outline contains all four required sections in order: Abstract (with CONCLUSIONS list), Argument-Graph, Citation-Embedded Outline, and References. No structural violation at the section level.

#### Coverage table

| Abstract Conclusion | Argument-Graph Nodes | Body Sections | References Cited |
|---|---|---|---|
| C1. Topology hypothesis confirmed; 5-to-1+5 compression preserves audit-substance if substrate is first-class auditable. | C1, W1.1, W1.2, E1.1.1, E1.1.2, E1.2.1, E1.2.2 | §2 (C1) | Research log §Loop 1.1, 1.2, 1.3; Spike §Loop 5.2 |
| C2. Corpus-overwhelm is methodology-wide; Sweller element interactivity is the mechanism; graduation is the most acute case. | C2, W2.1, W2.2, W2.3, W2.4, E2.1.1, E2.1.2, E2.2.1, E2.2.2, E2.2.3, E2.3.1, E2.3.2, E2.3.3 | §3 (C2) | Sweller 1988; Sweller 2010; van Merriënboer & Kester 2008; Rukmono et al. 2025; Dagenais et al. 2010; Steinmacher et al. 2015; Chandler & Sweller 1992; Lethbridge et al. 2003; Garousi & Garousi 2013/2014; Forward & Lethbridge 2002; Gupta et al. 2026 |
| C3. Adopt substrate-and-surface separation as methodology-wide architectural commitment. | C3, W3.1, W3.2, W3.3, E3.1.1, E3.1.2, E3.1.3, E3.2.1, E3.2.2, E3.2.3, E3.2.4, E3.3.1 | §4 (C3) | Volpini et al. 2026; GraphReader 2024; Shneiderman 1996; Cockburn et al. 2008; Tufte 1983/1990; Lit-review §Q5 |
| C4. Six design constraints from spike must be honored by any committed amendment. | C4, W4.1–W4.6, E4.1.1–E4.6.1 | §5 (C4) | Research log §Loop 5.3 (Constraints 1–6); Lit-review §Q5 |
| C5. Prior audience-bifurcation lineage is convergent but incomplete; Cycle 020 names the separation. | C5, W5.1, W5.2, W5.3, E5.1.1–E5.2.1, E5.3.1 | §6 (C5) | ADR-064, ADR-083, ADR-084, ADR-085, ADR-092, ADR-095; Research log §Loop 1.5, Step 1.3 |
| C6. Architecture committed; specific schema language deferred. | C6, W6.1, W6.2, W6.3, E6.1.1, E6.2.1, E6.3.1 | §7 (C6) | Lit-review §Q4; Research log §Loop 5.3 |
| C7. Held caveat — kitchen-sink risk for the Calibration-with-Graduation-Trigger Pattern and the substrate-and-surface architecture. | C7, W7.1, W7.2, W7.3, E7.1.1, E7.2.1, E7.3.1 | §8 (C7) | ADR-097 Target 2; Research log §Loop 1.7; ADR-097, ADR-098 |

**META-anchored sections:** §1 (Methodology preamble), §9 (Scope-of-claim, feed-forward signals, and next-cycle questions)

All seven Abstract conclusions have matching Argument-Graph top-level nodes (C1–C7). All Argument-Graph nodes have body anchors in the Citation-Embedded Outline. No orphan body subsections (every section is anchored to either a claim identifier or META). No Boundary 1, Boundary 2, Reverse Boundary 1, or Reverse Boundary 2 violations detected.

---

### Expansion-Fidelity Findings

**P1 findings (pyramid violations):** None.

**P2 findings (weak expansion or META misclassification):**

- **Section 9 (META) — borderline misclassification risk.** Section 9 contains the provenance correction bullet (naming ADR-064 and ADR-084 as the closest prior moves but explicitly noting neither names substrate-and-surface separation) and the provenance driver chain for C3. These bullets are not developmental in the full sense — they do not expand a specific Argument-Graph node — but the provenance driver chain reads as a compressed restatement of C3's development. The META anchor is defensible because Section 9's primary purpose is scope-of-claim qualification and feed-forward signals, not Argument-Graph development. The developmental-looking provenance chain is more accurately a completeness record than a claim development. Noting this as borderline for the next round's review rather than flagging it as a definitive misclassification.

**P3 findings (minor coverage gaps):** None from pyramid traversal alone. Minor coverage gaps are noted in the P2/P3 argument-quality findings below.

---

### P1 — Must Fix

No P1 violations were found in the argument structure. The pyramid is structurally complete and the logical chains from evidence to conclusions are intact with scope qualifications present where the evidence does not fully reach the claims.

---

### P2 — Should Fix

**P2-1. W2.4 hidden in the Argument-Graph but not surfaced as a full warrant in the Citation-Embedded Outline body.**

- **Location:** Argument-Graph W2.4; Section 3 in the Citation-Embedded Outline.
- **Claim:** "The differentiator across holistic-synthesis moments is corpus scope, not mechanism type." W2.4 carries the SCOPE QUALIFICATION that no direct empirical comparison of mid-cycle gate-review friction vs. graduation overwhelm exists, but the Argument-Graph lists W2.4 as one of C2's four warrants.
- **Evidence gap:** Section 3's body covers the Sweller mechanism (W2.1), its methodology-wide operation (W2.2), and the "no one reads them" generalization (W2.3). W2.4's claim — the differentiator is corpus scope, not mechanism type — is expressed once in a SCOPE QUALIFICATION note but is never developed as a positive warrant with supporting reasoning. If W2.4 is a genuine warrant for C2, it needs at least minimal expansion explaining why "quantitative difference in scope" and not "categorical difference in mechanism type" is the correct framing. If W2.4 is solely a scope-qualification, it should be removed from the warrant list and maintained only as a parenthetical qualification on W2.2.
- **Recommendation:** Either expand W2.4 in Section 3 with the corpus-scope-logic reasoning (Rukmono et al. 2025 + Dagenais et al. 2010's scope descriptions are the available evidence), or reclassify W2.4 as a SCOPE QUALIFICATION on W2.2 and remove it from the Argument-Graph warrant list. The current state is that the warrant is asserted but the Outline's body does not show its working.

**P2-2. Gupta et al. (2026) cited in the Citation-Embedded Outline but absent from the Argument-Graph.**

- **Location:** Section 3 body (W2.3's EVIDENCE block) cites Gupta et al. (2026) with the "recency window of 3–5 prior ADR records" finding; this citation is not present in any Argument-Graph evidence node.
- **Claim:** The essay references Gupta et al. 2026 as supporting that "flat-corpus delivery is documented to be worse than structured-traversal for the methodology's primary agent consumer."
- **Evidence gap:** There is no E node in the Argument-Graph that carries this citation. The closest candidate would be under W2.3 (the "no one reads them" generalization), but W2.3's evidence nodes are E2.3.1–E2.3.3 (Lethbridge 2003; Garousi 2013/2014; Forward & Lethbridge 2002). Gupta et al. 2026 is a structurally distinct finding about agent consumption specifically, not human documentation-read patterns. It arguably belongs under C2 or C3 as its own evidence node but is absent from the Argument-Graph.
- **Recommendation:** Add Gupta et al. 2026 as an evidence node in the Argument-Graph, either as E2.3.4 under W2.3 or as E3.1.4 under W3.1 (which covers the agent-navigability case). Its absence means a citation appearing in the body has no corresponding Argument-Graph anchor — the evidence is used without being structurally mapped.

**P2-3. C5's "convergent but incomplete" lineage claim depends on a hidden premise about what counts as "the same" trajectory.**

- **Location:** C5, W5.2, E5.2.1; Section 6 body.
- **Claim:** "Each prior move chipped at the surface without producing substrate-and-surface separation." This is used to establish that the lineage was converging toward the Cycle 020 commitment without having named it.
- **Evidence gap / hidden assumption:** The claim presupposes that all six prior ADRs were addressing the same underlying problem (the audience-bifurcation / substrate-vs-surface problem) and were making partial moves toward a single architectural solution. But each of ADR-064, ADR-083, ADR-084, ADR-085, ADR-092, and ADR-095 was made in response to a specific, distinct problem at its own cycle gate. The "convergent lineage" framing is a retrospective interpretation: Cycle 020 names the prior moves as steps in a direction that was not necessarily the direction they were aimed at when made. W5.2's evidence (E5.2.1: "Pattern synthesis: ADR-064 named the centered-vs-infrastructure distinction [categorical, not architectural at the substrate-and-surface level]...") provides a characterization of what each prior ADR did NOT do, but does not establish that each ADR was aiming at substrate-and-surface separation and falling short of it. The hidden premise is that the problem these ADRs were solving is the same problem C3 solves; without that premise, the lineage framing is post-hoc naming rather than convergent movement.
- **Recommendation:** Add a sentence in Section 6 making the interpretive choice explicit: the essay is retrospectively naming a trajectory in moves that were each made in response to their own specific problems. The "convergent" characterization applies to the outcome pattern visible in hindsight, not to a shared intent at the time of each ADR. This makes the framing choice visible rather than treating it as a discovered fact. (This finding also feeds into Framing Audit Question 1 below.)

**P2-4. E1.2.2 / Section 2's spike-derived 49% compression figure is load-bearing but carries no scope-of-claim context in the Argument-Graph.**

- **Location:** E1.2.2, C1, Section 2 body; also Section 5 (C4) SCOPE QUALIFICATION.
- **Claim:** "49% line-count compression versus source; surface views regenerated from substrate without parallel maintenance." The compression figure supports C1's audit-substance preservation claim.
- **Evidence gap:** The scope qualification about single-cycle evidence (only Cycle 019's 5 ADRs) appears in Section 5 and Section 9, but the 49% figure appears in E1.2.2 and is cited in C1's body without inline qualification. The Argument-Graph's E1.2.2 note does not flag that this is from a 5-record spike. A reader of the Argument-Graph alone (without reading to Section 9) could take the figure as a general claim about the architecture. The spike report itself acknowledges that scaling to ~100 ADRs was not tested; Section 9 META qualifies it; but E1.2.2 in the Argument-Graph is unqualified.
- **Recommendation:** Add a brief parenthetical to E1.2.2 in the Argument-Graph flagging the single-cycle evidence scope: "(from spike on 5-record sample; multi-corpus scaling not tested — see Section 9 SCOPE QUALIFICATION)." This prevents a reader doing Argument-Graph-only review from treating the figure as a general finding.

---

### P3 — Consider

**P3-1. van Merriënboer & Sweller (2005) appears in the References but is not cited in the Argument-Graph or the Citation-Embedded Outline body.**

- **Location:** References section; van Merriënboer & Sweller (2005) "Cognitive load theory and complex learning: Recent developments and future directions."
- **Issue:** This reference has no corresponding citation in any evidence node. It is listed alongside van Merriënboer & Kester (2008), which is cited at E2.1.2. The 2005 paper is a genuine contribution to the CLT literature (establishing whole-task vs. part-task framing) and is cited in the Loop 3 lit-review. However, it does not appear in the body. Either it should be cited in Section 3 alongside the 2008 Kester reference, or it should be removed from References if it does not support any body argument. Its presence in References without a body citation is a minor consistency gap.
- **Recommendation:** Either add a citation in Section 3 where it adds precision to the element-interactivity mechanism (W2.1 development), or remove it from References. The citation-auditor's domain; noted here for completeness.

**P3-2. ADR-064 citation in the Argument-Graph (E5.1.1) describes the ADR as "Centered-vs-Infrastructure distinction" introduced at DECIDE gate 2026-04-09, but the research log's Loop 1 table identifies this as ADR-072 (not ADR-064).**

- **Location:** E5.1.1 in the Argument-Graph; Section 6 body; References section; research log §Loop 1.5 table.
- **Issue:** The research log Loop 1.5 table lists ADR-072 as the "Centered-vs-Infrastructure distinction" entry, while the Essay-Outline's Argument-Graph E5.1.1, Section 6 body, and the References section all cite ADR-064 for this. The essay's Section 9 PROVENANCE CORRECTION note also cites ADR-064. The discrepancy is between the research log (072) and the Essay-Outline (064). One of these is wrong.
- **Recommendation:** Verify which ADR is correct. If the research log is correct, correct ADR-064 to ADR-072 throughout the Essay-Outline (E5.1.1, Section 6 body, Section 9 PROVENANCE CORRECTION, References). If the Essay-Outline is correct, the research log mislabeled it — note the provenance correction for the cycle archive.

**P3-3. C7 could be more precisely scoped in the Abstract.**

- **Location:** Abstract CONCLUSIONS bullet C7; Section 8 body.
- **Issue:** C7's Abstract formulation is: "Held caveat: the Calibration-with-Graduation-Trigger Pattern itself inherits the kitchen-sink risk." The body of Section 8 extends this to say "the substrate-and-surface architecture inherits the same risk by extension." The Abstract bullet mentions "by extension the substrate-and-surface architecture" in the body (W7.2) but the Abstract itself does not make this explicit. A reader scanning only the Abstract receives a C7 that applies to the Pattern but might not notice it also applies to C3's architectural commitment by extension.
- **Recommendation:** Add "and by extension the substrate-and-surface architecture (C3)" to the Abstract's C7 bullet so the Abstract is complete and the gate reader sees the full scope of the caveat. (This is minor — the Abstract does mention C7 in relation to the architecture in the essay text; it is the CONCLUSIONS list specifically that is under-precise.)

---

## Section 2: Framing Audit

The framing audit makes the negative space of content selection visible.

### Question 1: What alternative framings did the evidence support?

**Alternative framing A: The five Cycle 019 ADRs were addressing genuinely distinct problems; the "one underlying pattern" is a post-hoc imposition.**

The research log records the shared structural elements across the five ADRs with considerable care: each names a workflow point, a calibration mechanism, a tier classification, an audit-bearing artifact, and a graduation trigger. The rejected-alternative overlap is offered as "diagnostic" evidence that the same underlying decision is being made. But this structural similarity is consistent with two different explanations: (a) the five ADRs are expressing one pattern at five points (the Essay-Outline's framing), or (b) the RDD methodology has a recurring structural shape that all calibration decisions adopt because they are all methodologically similar — the pattern is a property of the methodology's decision-making grammar, not evidence that the five ADRs were one decision made at excessive granularity.

To believe the Essay-Outline's framing, the reader must believe that structural similarity implies reducibility to one ADR plus substrate. But the alternative framing asks: what if the structural similarity is an artifact of methodology maturity? Mature methodologies produce decisions that share structural form because the decision-recording vocabulary is settled. The five ADRs might be five genuinely distinct decisions that happen to be well-formed in the same vocabulary. Under this framing, "compression" is not a discovery of underlying unity; it is a choice to accept information loss at the pattern level in exchange for surface legibility.

What the evidence supports for this framing: the research log's threshold question (Loop 1.6) asks whether scaffolded thematic consolidation suffices. The answer "necessary but not sufficient" was resolved quickly. The distinction between "the ADRs share a pattern" (what Loop 1.2 shows) and "the ADRs should be compressed into one ADR" (what C1 concludes) involves a normative step the evidence does not fully resolve. The audit-substance preservation test (Loop 1.3) shows that Option A compression works; it does not show that Option A is superior to five well-formed ADRs in all respects.

Belief-mapping: What would the reader need to believe for this framing to be right? The reader would need to believe that (a) the shared structural shape of the five ADRs does not indicate reducibility, (b) compression produces genuine audit-substance loss at the sub-argument level (which the spike confirms — see E4.3.1), and (c) the user's felt-overwhelm is addressed by better navigation of five ADRs rather than by reducing five to one.

**Alternative framing B: The graduation-pain framing obscures a more tractable problem — gate-conversation tooling rather than corpus architecture.**

The user's triggering example ("invariant 9 + ADR-014 §C.4 implies the NL constraint is load-bearing") is gate-conversation language. The user's telos (Step 1.5) is specifically about direction-quality: "I don't need to think very much" at BUILD, which requires clear direction from pre-BUILD gates. Under an alternative framing, the problem is not corpus architecture (too many ADRs) but gate-conversation design: the prompts and presentation at each gate checkpoint are too cross-referential.

Under this framing, a methodology amendment to gate-prompt structure (show the practitioner the relevant decision and its context together, without requiring the practitioner to hold the corpus in mind) could address the user's telos without requiring substrate-and-surface architectural changes to the entire corpus. This is a thinner, more targeted intervention.

What the evidence supports for this framing: Chandler & Sweller (1992) identifies the co-location remedy as the mechanism fix for split-attention cost. This could be implemented at the gate-prompt level (the skill places the relevant context adjacent to the question) rather than at the substrate-architecture level. The lit-review finding that focus+context is the right family (not replace-context) applies to this framing too.

What the Essay-Outline would need to address: the argument for methodology-wide substrate-and-surface separation over targeted gate-prompt revision. C3's warrant that "single-source derivation is architecturally required" addresses the dual-maintenance concern, but the gate-conversation-tooling framing might be satisfied with a lighter intervention (skill-text change at each gate phase) before a full substrate architecture is warranted.

Belief-mapping: What would the reader need to believe for this framing to be right? The reader would need to believe that (a) the cross-referential gate vocabulary is the primary pain source, (b) skill-text changes to how gate checkpoints present context could address it without requiring substrate architecture, and (c) the methodology-wide scope claimed in C2 overstates the need relative to the most acute pain points.

**Alternative framing C: The user's KG hypothesis was supported by the literature and the spike, making the Essay-Outline's framing a confirmation, not an investigation.**

The research log's ADR-082 question-isolation discipline is referenced at Loop 1 entry and Loop 2 synthesis. The user's stated hypothesis (graph behind human-friendly format) was "bracketed" at entry. But the lit-review's highest-ranked candidates (JSON-LD; typed-link JSON) are structurally aligned with the user's hypothesis. The spike tested the user's hypothesis on the user's corpus. The conclusions C3 and C6 confirm the architecture the user named and defer only the specific format.

Under this framing, the research was structured as a verification run for a hypothesis that had already been endorsed by the practitioner, with the bracketing serving more as procedural ceremony than genuine openness. The dispatch brief's framing concern #6 asks: "is there a finding from the research log that ARGUES AGAINST the architecture that the Essay-Outline elided or de-emphasized?"

What the evidence shows: The spike's failure modes — schema inadequacy, compression-loss at sub-argument level, authority ambiguity, note-discipline dependency — are real constraints that argue for caution rather than architectural commitment. The spike report's conclusion is that the architecture is supported "for the overview + drill-in navigation problem" but the failure modes are not trivial. The Essay-Outline frames these as "design constraints DECIDE / ARCHITECT must address" — treating them as implementation concerns rather than as reasons to pause before committing the architecture. An alternative framing would present the spike's failure modes as open questions the architecture has not answered rather than as downstream engineering concerns.

Belief-mapping: What would the reader need to believe for this framing to be right? The reader would need to believe that the spike's failure modes (especially compression-loss at sub-argument level and authority ambiguity) are consequential enough to defer architectural commitment rather than forward it, and that the research did not adequately test alternatives to the substrate-and-surface architecture before committing to it.

---

### Question 2: What truths were available but not featured?

**Finding A: The spike's sub-argument-level compression-loss is more architecturally consequential than the Essay-Outline presents.**

Where it appears: Spike report sections 1, 7 ("Implementation friction"); research log §Loop 5.3 Constraint 3; Essay-Outline E4.3.1 and W4.3.

The spike found that ADR-097's Target 2 and Target 3 sub-decisions are first-class content with their own commitment-and-rationale shapes, and the flat schema cannot hold these without nested fields or accepts them as compressed summaries. The spike report says: "A faithful substrate needs nested fields (sub-commitments, warrant-for-what, sub-graduation-triggers) — or it accepts compression loss at the sub-argument level. The lossiness is not catastrophic but it is real, and it is exactly the kind of loss that becomes invisible once the source is no longer the canonical reference."

The Essay-Outline acknowledges this in C4 (W4.3) as a design constraint. But the framing is "the constraint must be resolved by DECIDE/ARCHITECT." This treats a finding that undermines the auditability case as a downstream engineering problem. The user's constraint-removal response (Step 1.2) was explicit: the proposed substrate "must remain auditable." If the flat schema produces invisible lossy compression of sub-decisions, and if sub-decisions carry independent audit-substance, then the architecture's central claim (audit-substance is preserved through derivation) is conditionally true only for the canonical audit-substance but false for the sub-argument structure. The Essay-Outline does not surface the conditional nature of the audit-substance preservation claim prominently.

Why it might have been underweighted: C1 needed to conclude "compression preserves audit-substance" for the cycle to have a positive finding. Foregrounding the sub-argument compression loss would have complicated this conclusion. The hedge is present (Section 5, Section 9) but it is not placed at the same prominence as the positive finding.

Whether inclusion would change the argument: Yes. If the sub-argument compression loss is real and invisible, the audit-substance preservation claim needs qualification: "compression preserves canonical audit-substance but not sub-decision structure; the architecture requires nested field support or explicit acceptance of sub-argument scope-of-claim."

**Finding B: The Gupta et al. (2026) finding challenges the "more structure is better for agent consumption" assumption.**

Where it appears: Lit-review §Q6, Finding 6.5; research log §Loop 2.1 P1 finding; Section 3 body Citation-Embedded Outline (cited in W2.3 development).

The finding is that a recency window of 3–5 prior ADR records is the optimal context for LLM-based ADR generation, and all-history delivery degrades quality relative to windowed delivery. This is used in the Essay-Outline to support the case for structured traversal over flat corpus delivery.

But the finding is more ambiguous than the Essay-Outline's use implies. If optimal agent performance on ADR tasks requires a 3–5-record recency window, this might argue for topologically-filtered windowing rather than for a comprehensive substrate record covering the full corpus. A substrate that perfectly preserves all 100 ADRs in typed-link form is still a substrate whose full delivery would degrade agent performance relative to a windowed subset. The architecture supports structured traversal, but the Gupta finding does not confirm that comprehensive substrate plus traversal is better than selective windowing without substrate. The Essay-Outline uses the Gupta finding in one direction (flat is bad; structure is better) without surfacing that a comprehensive structured substrate might introduce its own degradation at scale.

Why it might have been underweighted: Noting the ambiguity would complicate the case for a comprehensive substrate. The finding is genuinely supportive of structured traversal; the ambiguity about substrate comprehensiveness at scale is a second-order concern the cycle did not address empirically.

**Finding C: Nogueira et al. (2026) on ADR template minimalism vs. comprehensiveness is present in the Loop 3 lit-review but absent from the Essay-Outline.**

Where it appears: Lit-review 020 (graduation-pain) §Q3; lit-review mentions Nogueira et al. 2026 (arXiv 2604.27333) finding that structural minimalism outperforms structural completeness in ADR comprehension (median 0.8 vs. 0.7, Wilcoxon p=0.002).

The Nogueira et al. finding directly addresses the comprehension cost of completeness-oriented ADR structures. The Essay-Outline draws on the lit-review Q3 finding (Rukmono et al. 2025 on shared structural drivers) but does not cite or develop the Nogueira et al. result. Since the Essay-Outline's architecture involves per-type record schemas with audit-substance blocks, the Nogueira finding is relevant: even for a single ADR, completeness-oriented structure raises comprehension cost. This has direct implications for the substrate's per-type record schemas — completeness-by-design in the substrate could replicate the problem it is intended to solve.

Why it might have been excluded: Nogueira et al. 2026 is a preprint with limitations (33 students, controlled experiment rather than practitioner observation). Including it would have complicated C4's design constraints.

**Finding D: No counter-evidence against the architecture from any of the research loops was surfaced.**

The dispatch brief asks directly: "is there a finding from the research log that ARGUES AGAINST the architecture that the Essay-Outline elided or de-emphasized?" Searching the source material, the most genuinely contrary finding is from Loop 2's negative-cases section: "Zooming without context is worse than monolithic viewing" (Cockburn et al. 2008). This is acknowledged in C3/W3.2 as the remedy (focus+context, not replace-context). But the lit-review's Finding 5.2 (over-confidence in incomplete overviews) and Finding 5.3 (comprehensiveness failures in arc42 and C4) are also negative cases that the Essay-Outline cites in C4 as design constraints rather than as challenges to the core architecture.

The framing throughout is "the architecture is supported; here are the failure modes to avoid." An alternative presentation would ask: given that arc42 and C4 — the closest prior art — both failed at the same task, what makes the substrate-and-surface architecture structurally different from them in a way that avoids their failure modes? W4.2 (per-type schemas) and W3.3 (single-source derivation) are the claimed differentiators, but the argument that these differentiators are sufficient is not developed; it is asserted.

---

### Question 3: What would change if the dominant framing were inverted?

**Inverted framing: The six prior audience-bifurcation ADRs were complete answers to different questions, not incomplete moves toward Cycle 020's commitment.**

Under this inverted framing, ADR-064's centered-vs-infrastructure framing was complete as a categorical distinction. ADR-083's cognitive economy criterion was complete as an admissibility test for human-facing artifacts. ADR-085's infrastructure relocation was complete as a filesystem-level separation. None of these ADRs needed substrate-and-surface separation to fully address its own problem. The user's persistent graduation frustration, under this framing, is not evidence that the prior ADRs were incomplete; it is evidence that the graduation problem is categorically different from the problems those ADRs addressed.

Under this framing:
- What becomes weaker: C5's "convergent but incomplete" claim loses its primary warrant. If the prior ADRs were addressing different problems, the convergence is accidental and the lineage is not building toward anything.
- What becomes stronger: The novelty of Cycle 020's finding. If the prior ADRs were not building toward substrate-and-surface separation, then Cycle 020 is identifying a genuinely new architectural problem that had not been addressed before, not completing a lineage.
- What the Essay-Outline would need to address: An argument that the graduation pain the user reports is causally linked to the inadequacy of the prior moves, not to the inherent complexity of graduation as a phase. The causal argument is currently implicit.

**What the inverted framing reveals:** The Essay-Outline's lineage framing performs two functions. First, it establishes that the problem is not new (prior efforts confirm the territory is real). Second, it positions Cycle 020 as completing a trajectory rather than opening a new one, which is a different rhetorical posture with different implications for the reader's confidence in the commitment. If Cycle 020 were opening a new territory, the evidence base (single-cycle spike; one user's experience) would feel thin. The lineage framing borrows credibility from the six prior ADRs even though those ADRs were addressing different specific problems. This is worth surfacing as a framing choice, not a finding.

**Inverted framing: The architecture's primary risk is over-commitment, not under-commitment.**

The Essay-Outline's dominant framing is that substrate-and-surface separation is the architectural commitment the methodology should make, with deferred schema details. The dominant risk addressed is commitment-without-sufficient-evidence (addressed through scope qualifications and C7's caveat). But the inverted framing asks: what if the risk runs in the other direction?

Given the spike's failure modes (schema inadequacy at first contact, compression-loss at sub-argument level, authority ambiguity), and given the single-cycle evidence base, the risk of over-committing to a structural architecture that proves to be the new arc42-at-scale is real. The architecture commits to a substrate layer, a surface layer, single-source derivation, note-discipline, and per-type schemas — each of which has maintenance overhead. A methodology amendment at this scope is potentially more complex than five well-formed ADRs, not less.

Under this framing:
- What becomes stronger: C7's caveat and C4's design constraints — these are not downstream engineering concerns but indicators that the architecture's production cost is not yet understood.
- What becomes weaker: C3's conclusion that the architecture should be committed now rather than continuing research.
- What the Essay-Outline would need to address: A more developed cost-benefit comparison between "commit the architecture with deferred schema details" (C3's choice) vs. "run a cross-cycle observation before committing" (a more conservative alternative that the research log considered and rejected at Loop 3 for Loop 4 skip).

---

### Framing Issues

**F-P1: The "convergent-but-incomplete lineage" framing obscures a material alternative interpretation without explicit acknowledgment.**

- **Location:** C5, W5.1, W5.2, E5.1.1–E5.2.1; Section 6 body.
- **Issue:** The prior six ADRs (064, 083, 084, 085, 092, 095) are each described as "chipping at the surface" toward substrate-and-surface separation. This retroactively characterizes them as partial moves in a single trajectory. But each was a complete answer to a specific problem at its own cycle gate. The framing is a post-hoc interpretive choice, not a discovered fact. The alternative interpretation — that these were genuinely separate moves addressing separate problems, and that the graduation pain they did not resolve is a newly-identified problem rather than an incompletely-addressed one — is not named or engaged.
- **Consequence for the document's conclusions:** If the alternative interpretation is more accurate, C5 overstates the lineage and borrows credibility for Cycle 020's commitment from prior ADRs that were not addressing the same problem. The reader forms an impression of accumulated methodology evolution toward a known destination when the evidence supports a different characterization: a new problem was identified in Cycle 020 that has a prior-art context.
- **Recommendation:** Add a sentence in Section 6 explicitly naming the alternative interpretation: the prior ADRs were complete answers to their own problems; the lineage framing is a retrospective interpretation, not an established fact of the ADRs' intent. This makes the framing choice visible and gives the gate reader the information needed to evaluate whether the lineage framing is the right one for the amendment's position.

**F-P2: The cycle's auto-mode-bias and loop-skip decisions are recorded but not critically evaluated for their influence on the evidence base.**

- **Location:** Research log §Loop 3.4 (Loop 4 decision); Step 1.5 (user's telos on auto-mode); Section 9 META (Loop 4 deferred).
- **Issue:** The user's telos at Step 1.5 was explicitly about reducing pre-BUILD fatigue so auto-mode BUILD could receive clear direction. The same conversation records that auto-mode BUILD is desirable. Loop 4 (cross-cycle topology examination) was skipped on the grounds that "the literature's mechanism is sufficient warrant." Loop 5 (spike) was run on a single cycle's five ADRs. The question the framing audit is asked to surface: did the orchestrator's auto-mode authorization (recorded at Loop 2 close, by the practitioner's own framing of the telos) influence the Loop 4 skip in a way that reduced the empirical grounding the cycle would have benefited from?

The research log records the Loop 4 skip decision with a clear rationale: cross-cycle topology would add breadth but is "the same pattern across more samples" and "the amendment-scope is now empirically grounded as methodology-wide." This is a defensible decision. But the cycle's evidence base for C1 (topology hypothesis confirmed) rests on exactly one cycle's ADRs. The framing that "the literature's structural mechanism is sufficient warrant" for methodology-wide scope relies on analogical transfer from CLT literature to software methodology documentation. The cross-cycle topology evidence would have provided a second, independent corpus-level data point for the pattern. Skipping it in favor of the spike (which also examined only one cycle's ADRs) means both empirical loops examined the same sample.

This is not an error in the Essay-Outline's logic, but it is a scope-of-claim precision issue the gate should consider: the cycle's empirical evidence is single-corpus for both the topology claim (C1) and the design constraint claim (C4). The literature supports the mechanism (C2) and the architecture class (C3); the specific corpus-level evidence is thinner than the scope of the amendment.

- **Recommendation:** The scope qualifications in Section 9 partially address this, but the specific observation that both empirical loops (Loop 1 and Loop 5) examined the same corpus (Cycle 019's 5 ADRs) should be named explicitly. The cycle has one empirical data point at the corpus level and relies on the literature for generalizability. This is honest research practice but the gate reader should be able to see it clearly.

**F-P3: Sweller's element interactivity is the offered mechanism, but the research did not test competing cognitive frameworks for the same phenomenon.**

- **Location:** C2, W2.1; Section 3 body; Loop 3 lit-review.
- **Issue:** The dispatch brief asks whether Sweller's element interactivity was tested against alternative cognitive frameworks (Hick's law for choice complexity; Miller's working-memory limits; information-density-vs-processing-speed). The Loop 3 lit-review examined CLT literature specifically and did not compare Sweller's framework against competing frameworks. The Essay-Outline presents Sweller's element interactivity as "the structural mechanism" (C2's exact language) without noting that this is the mechanism the research selected to explain the phenomenon, not the mechanism that was selected after alternatives were considered and rejected.
- **Consequence:** This is not a logical flaw — Sweller's CLT is well-grounded and the analogical transfer to documentation navigation is sound. But naming it "the structural mechanism" rather than "a well-supported structural mechanism" overstates the epistemic status. Alternative frameworks (information density, working memory limits, choice complexity) are not clearly wrong; they are simply not the framework the research chose. Hick's law, for instance, would predict that the corpus's navigation cost grows logarithmically with the number of ADR choices presented simultaneously — a distinct prediction from element interactivity, which scales with the interdependence of the elements.
- **Recommendation:** Soften "the structural mechanism" to "a structural mechanism" or "the best-supported structural mechanism in the evidence reviewed" in C2's Abstract conclusion and in the Argument-Graph W2.1. This is a precision adjustment, not a retraction. (P3-level; does not affect the argument's validity.)

---

## Convergence-Saturation Signal (ADR-094)

**Convergence-Saturation Signal:** NOT TRIGGERED

- Round number: R1
- P1 count this round: 0 (zero P1 findings in Section 1; one F-P1 in Section 2)
- P2 count this round (new, non-carry-over): 6 (P2-1 through P2-4 in Section 1; F-P2 and F-P3 in Section 2)
- New framings or claim-scope expansions surfaced this round:
  - "Convergent-but-incomplete lineage" as a retrospective interpretive choice rather than a discovered fact (F-P1 in Section 2)
  - Auto-mode-bias and loop-skip decisions as potential influences on the evidence base's scope (F-P2 in Section 2)
  - Sweller element interactivity as a chosen framework among plausible alternatives, not the uniquely correct mechanism (F-P3 in Section 2)
  - Gate-conversation-tooling as a thinner alternative intervention to full substrate-and-surface architecture (Question 1 Alternative B in Section 2)
  - Sub-argument compression-loss as a conditional qualifier on the audit-substance preservation claim (Question 2 Finding A in Section 2)
- Recommendation: CONTINUE to R2

*Note: The F-P1 finding is a consequential framing choice that the gate reader should see explicitly named. It is a P1-tier framing issue, but since it is in Section 2 (framing audit) rather than Section 1 (argument audit), it is counted separately. The P1 count for the signal evaluation counts all P1-class findings across both sections: F-P1 in the framing audit counts as a P1 for signal purposes. P1 count = 1. Signal condition 1 fails. NOT TRIGGERED.*

*Single-purpose re-audits (dispatched per the re-audit-after-revision rule) omit this section. Form-change events reset the round-count baseline — the first audit on a new form is its R1.*
