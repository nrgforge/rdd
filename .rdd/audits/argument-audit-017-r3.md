# Argument and Framing Audit: Essay 016 (Cycle 017) — R3

**Audited document:** `docs/essays/016-initial-handoff-and-the-audience-at-the-margin.md`
**Source material:**
- `docs/essays/research-logs/research-log.md`
- `docs/essays/research-logs/lit-review-017-diagram-driven-orientation.md` (Q5)
- `docs/essays/research-logs/lit-review-017-document-legibility.md` (Q2)
- `docs/essays/research-logs/lit-review-017-conversational-turn-structure.md` (Q4)
- `docs/essays/research-logs/lit-review-017-audience-corpus-organization.md` (Q6 + Q3)
- `docs/essays/research-logs/lit-review-017-nomenclature-leakage.md` (Q1)
- `docs/housekeeping/audits/argument-audit-017.md` (R1 report)
- `docs/housekeeping/audits/argument-audit-017-r2.md` (R2 report)
**Date:** 2026-04-24

---

## Section 1: Argument Audit

### Summary

- **Argument chains mapped:** 11
- **Issues found:** 3 (0 P1, 1 P2, 2 P3)
- **R2 corrections verified:** 3 of 3 resolved; no R2 issues persist
- **Asymmetric-constraint coherence:** substantively sound with one qualification (P2)
- **New issues introduced by R3 changes:** 1 P2, 2 P3

---

### R2 Correction Verification

**R2 Issue 2.1 — §4.5 closing methodology-self-credit sentence: Resolved.**
The R2 report found that the §4.5 closing paragraph ("The methodology's response to a comprehension failure is not more methodology; it is sharpening what the methodology already produces") re-introduced the methodology-self-credit framing that §6's revision had been asked to correct. In R3, that sentence is absent. The closing paragraph now reads structurally ("The five responses, taken together, share a structural property worth naming: each operates at the margin of the existing corpus...") and names the load asymmetry as an observation about the pattern set, not as a rhetorical claim about the methodology's agency. The attribution overstep is closed.

**R2 Issue 2.2 — "agent-mediated orientation" operational criterion confidence: Resolved.**
The R2 report found that the section implied DECIDE could establish an operational criterion distinguishing agent-mediated orientation from AI-as-prosthetic, when the source material provided no basis for that confidence. In R3, the paragraph now reads: "Whether the role is acceptable to the methodology's stakeholders, and whether an *operational* criterion can be established that distinguishes the two roles in practice rather than only in concept, are both open questions. The distinction is conceptually genuine but operationally fragile — it can shade into the rejected pattern under usage drift, and no source in the cycle's reviewed literature establishes a tested criterion for separating them." This accurately scopes both the conceptual legitimacy and the operational unresolvedness. The overconfidence claim is closed.

**R2 Issue 2.3 — §4.5 "reading-path infrastructure" presented as evidence-backed rather than design inference: Resolved.**
The R2 report found that the ORIENTATION.md reading-paths-as-information-scent claim was asserted rather than derived. In R3 the paragraph now opens: "IFT implies that such paths function as information scent... though the literature reviewed does not directly study `ORIENTATION.md`-style reading paths as artifacts." This accurately identifies the claim as a theoretical inference, not a literature-confirmed finding. The overstated evidence scope is closed.

---

### P1 — Must Fix

No P1 issues found in R3.

---

### P2 — Should Fix

**Issue 2.1 — The asymmetric-constraint revision introduces a potential tension with the user's AI-as-prosthetic objection that the essay does not resolve**

- **Location:** §4.5, particularly the closing paragraph; §1's framing of AI-as-prosthetic
- **Claim:** The essay distinguishes the user's objection to "AI as human-reading-prosthetic" (humans needing AI to translate docs that look like they should be directly readable) from a legitimate agent role in which agent-facing context may grow without adding to human reading load. The §4.5 agent-mediated-orientation sub-section holds a conversational on-ramp as a candidate on the grounds that it builds schemas through dialogue rather than document reading, thereby minimizing human reading load without routing humans through an AI translator for directly-readable documents.
- **Evidence gap:** The asymmetric-constraint framing (§4.5 intro: "optimization target is *what a human reader must read or see to understand*, not *what artifacts exist*") provides a principled basis for allowing more agent-facing context. But the essay now faces a consistency question it does not resolve: the user's original objection in §1 — "the failure of direct human readability for documents the methodology presents as primary readables" — was specifically about stakeholders routing around directly-readable documents by feeding them to AI. Under the R3 asymmetric framing, if agent-facing context grows because companion files and richer instruction packets allow agents to orient humans through dialogue, the human is still using an AI intermediary to understand the corpus — differing from the rejected pattern only in whether the intermediary is operating on agent-context artifacts (acceptable) rather than on human-readable documents (rejected). This is the same distinction the agent-mediated-orientation sub-section names as "conceptually genuine but operationally fragile." The R3 changes make the framing sharper and more honest, but they also make the tension more visible. The essay names the fragility once (in the agent-mediated-orientation sub-section) but does not surface it at §1 or in the §4.5 intro where the asymmetric constraint is introduced, leaving a reader who does not reach the agent-mediated-orientation sub-section with an incomplete picture of why the constraint does not automatically license all agent-mediated human orientation.
- **Recommendation:** Add a brief forward reference in §4.5's intro paragraph — at the point where the asymmetric constraint is introduced — noting that the constraint is asymmetric in direction but not unlimited in scope, and that §4.5's later sub-section on agent-mediated orientation addresses where the asymmetry has a limit. This is a one-sentence internal signpost, not a new argument. It ensures a reader who grasps the asymmetric constraint early also understands it is bounded, without having to reach the candidate-pattern sub-section to discover the complication.

---

### P3 — Consider

**Issue 3.1 — Heijstek (2011) UML parenthetical remains absent from §4.4**

- **Location:** §4.4, Heijstek citation
- **Status:** This finding was raised in R1 P3-2 and persisted through R2 P3-2 without resolution. The R3 essay still does not include the parenthetical "(the experiment used formal UML diagrams)" at the point of citation in §4.4. The §5 open question for Heijstek acknowledges the gap ("whether the result generalizes to RDD's informal architectural diagrams is not established"), but a reader who treats §4.4 as the primary reference still carries an unqualified reading of the finding's applicability to informal diagrams.
- **Recommendation:** Add a brief parenthetical at the Heijstek citation in §4.4. This is a one-line precision adjustment that has been deferred across three audit cycles.

**Issue 3.2 — Diátaxis "maps the same divergence" formulation remains unmodified**

- **Location:** §3, framework 3 (Diátaxis paragraph)
- **Status:** This finding was raised in R1 P3-3 and persisted through R2 P3-3 without resolution. The R3 essay still reads "Diátaxis (Procida) maps the same divergence to documentation purpose." The Q6 lit-review (audience-corpus-organization.md, §3.1) establishes that Diátaxis's boundary-crossing warning applies to type mixing, not audience mixing, and that "Diátaxis is silent on these dimensions, not prescriptive about them." The "maps" formulation overstates the precision of the analogy between Diátaxis's type-taxonomy and the initial-handoff/ongoing-reference distinction.
- **Recommendation:** Soften to "Diátaxis's purpose-typing framework provides a structural analog for the same divergence" or "is consistent with the same divergence." A one-phrase change that has been available since R1.

---

### Asymmetric-Constraint Coherence Assessment (R3 Audit Focus Item 2)

The three specific coherence questions named in the audit brief are addressed directly:

**§4.5 intro and §4.1 companion-file consistency.** The R3 asymmetric framing (human reading load minimized; agent-facing context may grow) is internally consistent with §4.1's companion-file pattern. §4.1 states explicitly: "Companion files are *additive*, not *substitutive*. The primary corpus retains its type-based organization." §4.5's closing paragraph confirms: "Companion files sit beside, not above, and they offload material from humans onto agents." The two sections are coherent. Agent material moved out of human-facing documents and into a companion file is the canonical case of the asymmetric constraint operating correctly: human reading decreases; agent-facing material increases. No inconsistency found.

**Asymmetric framing and the AI-as-prosthetic objection.** As noted in Issue 2.1 above, the tension is real and partially surfaced in the essay (in the agent-mediated-orientation sub-section), but the signposting is incomplete. The asymmetric framing in §4.5's intro does not cross into the rejected AI-as-prosthetic pattern as long as agent-facing artifacts are consumed by agents rather than used to mediate human understanding of documents the human was meant to read directly. The essay makes this distinction accurately; the gap is that the distinction is not flagged at the point where the asymmetric constraint is introduced.

**Agent-mediated-orientation sub-section status under R3 framing.** The R3 asymmetric framing does make agent-mediated orientation more aligned with cycle intent in the narrow sense that it fits the pattern (humans read less; agents have more to draw from). The essay retains the "candidate, not adopted here" framing for sound reasons: the operational criterion problem remains unresolved, and adoption would require a DECIDE-phase examination of the AI-as-orienter/AI-as-prosthetic distinction with the user's normative position as load-bearing input. Under the R3 framing, that examination becomes more consequential, not less, because the asymmetric constraint makes agent-mediated orientation look more permissible in principle while the operationalization question remains unresolved in practice. The essay's "candidate, not adopted here" framing is still accurate and appropriate.

---

### §6 Implications Consistency Assessment (R3 Audit Focus Item 4)

The asymmetric framing has one implication for DECIDE that §6 does not fully capture. The DECIDE paragraph currently states that the implementation of §4.5 context-building tooling "needs its own ADR that examines the AI-as-orienter / AI-as-prosthetic distinction explicitly, with the user's normative position as load-bearing input." This is accurate and necessary. However, the R3 asymmetric framing adds a second ADR requirement that §6 does not name: the constraint itself — that the optimization target is human reading load, not total artifact count, and that agent-facing material may grow — is a design decision that needs encoding in the ADR on context-building tooling. As currently written, §6 identifies that an ADR is needed to examine the distinctions, but does not specify that the asymmetric constraint's definition is itself a decision the ADR must record. A downstream DECIDE author reading §6 would know to write an ADR about the distinction but might not know to encode the asymmetric constraint as the ADR's governing design decision. This is a minor precision gap, not a logical error, which places it at P3; but it has downstream consequences for DECIDE completeness.

Given the P3 severity, this finding is noted here rather than elevated: the §6 DECIDE implications paragraph could usefully add a sentence specifying that the ADR should record the asymmetric constraint (human reading load as optimization target; agent-facing context growth as explicitly admissible) as a first-class design decision, not merely as background to the AI-as-orienter examination.

---

## Section 2: Framing Audit

The framing audit makes the negative space of content selection visible. It compares the essay's choices against what the source material made available.

---

### Question 1: What alternative framings did the evidence support?

**Status of R2 alternative framings under R3:**

**Alternative framing A (comprehension failure as context-building / tooling-gap problem): Remains substantially addressed.**
R2 resolved this by adding §4.5. The R3 asymmetric-constraint revision reinforces the resolution: §4.5 now explicitly distinguishes between human reading load and artifact count, and names the Ernst & Robillard prior-familiarity finding as the anchor that points toward reader-context interventions rather than document restructuring. Alternative framing A is not underrepresented in R3.

**Alternative framing B ("thread-the-needle" wrong in principle, not merely poorly implemented): Unchanged and still available.**
The essay continues to hold the "poor implementation" framing as dominant, with companion files as the supported resolution. The Nguyen et al. (2025) empirical finding (agent context files at legal-document readability level; "structures optimized for agent orientation create context debt for humans") remains uncited in the essay and continues to support the stronger claim that structural incompatibility — not poor threading — is the root issue. This alternative framing is available to a reader who consults the Q2 lit-review but is not visible in the essay itself.

**Alternative framing C (five threads are independent problems, not a structural family): Unchanged.**
The integrated synthesis framing continues to enact a narrative coherence the evidence does not require. The mechanisms are not mutually exclusive and have no generic causal ranking; the essay acknowledges this accurately but the structure of the document performs integration that goes slightly further than the evidence mandates. This remains a framing choice, not an error.

**New framings introduced or made more prominent by R3's asymmetric-constraint revision:**

**Alternative framing D: The load-asymmetry optimization is itself a consequential design commitment, not a neutral description.**
The R3 revision sharpens the asymmetric constraint and makes it load-bearing. The abstract, §4.5 heading, §4.5 intro paragraph, and §4.5 closing paragraph all now encode the constraint explicitly. However, the essay presents the asymmetric framing as an obviously correct characterization of the design objective ("worth stating precisely") rather than as a consequential framing choice that forecloses alternatives. The source material — specifically the R2 framing audit's finding that the "no-net-add" constraint forecloses the class of interventions most directly suggested by the strongest empirical anchor — was accepted and addressed by sharpening the constraint rather than softening it. The sharpening is defensible and represents a genuine user decision. What has not been addressed is whether the essay acknowledges the asymmetric constraint as a design decision rather than as an obvious analytical observation.

*Belief mapping:* A reader who holds that a brief dedicated orientation artifact (a one-page conceptual introduction authored specifically for zero-prior-familiarity readers) would be the highest-leverage intervention given Ernst & Robillard's prior-familiarity finding would read the asymmetric constraint as the design decision that ruled out that intervention. The constraint classifies such an artifact as "more human reading load" — which it is — but a reader with the opposite view would argue that a single, well-targeted, very short orientation artifact is a categorically different addition than adding noise to an existing 50-document corpus. The essay does not examine whether the asymmetric constraint's treatment of all new human reading as net-negative applies uniformly to high-value, low-volume, purpose-built artifacts as well as to bulk additions.

**Alternative framing E: Agent-facing context growth as a sustainability and maintainability concern.**
The asymmetric framing explicitly permits agent-facing material to grow. Neither the R3 revision nor the underlying source material examines the maintenance implications of that growth. The Q6 lit-review (audience-corpus-organization.md, §4.5) establishes that agent context-window compression is a driver of separation and that oversized context files cause "lost-in-the-middle" failures for agents. The Q6 lit-review also notes (§4.1) that separate corpora "create maintenance divergence" as a primary failure risk. If agent-facing context is permitted to grow unboundedly, the companion-file pattern eventually faces the maintenance divergence problem that the literature warns against: human-facing and agent-facing materials drift as the corpus evolves, and the companion files require synchronization discipline that the essay does not prescribe. The essay does not surface this as a constraint on agent-facing growth; it treats the growth as unproblematically admissible.

*Belief mapping:* A reader focused on long-term corpus maintenance would ask: at what scale of agent-facing context growth does the companion-file pattern require synchronization infrastructure comparable to the maintenance cost it was intended to avoid? The essay's asymmetric framing answers the short-term question ("human load shrinks; agent context may grow") but does not bound the long-term trajectory.

---

### Question 2: What truths were available but not featured?

**Available truth A: Nguyen et al. (2025) — strongest available empirical quantification of human-agent readability divergence — remains absent from the essay.**
This finding was surfaced in R1 and R2. The Q2 lit-review (document-legibility.md, §4.4) establishes the specific empirical finding: CLAUDE.md-style agent context files exhibit a median readability score of 16.6 (legal-document level); "structures optimized for agent orientation create context debt for humans." The essay cites Rukmono et al. (2024) and Ernst & Robillard (2023) as empirical anchors for the human-vs-agent divergence but not Nguyen et al. The R3 asymmetric framing, which is now central to the essay's argument, would be materially strengthened by the Nguyen et al. finding: the claim that agent-facing context may grow without burdening human readers is more defensible if the essay has established empirically (not just theoretically) that agent-optimized content is genuinely hostile to human first-encounter reading. Currently §4.1's companion-file rationale relies on theoretical frameworks for the human-agent divergence argument; the specific quantitative finding from Nguyen et al. is available and remains unused.

*Why excluded:* Selection decision across multiple synthesis passes; the finding was noted in R1 and R2 but not adopted. No new reason for exclusion is apparent.
*Would inclusion change the argument:* No structural change, but the asymmetric-constraint framing's empirical grounding would be strengthened specifically in the place — §4.1 and §4.5 — where the R3 revisions are most prominent.

**Available truth B: The maintainability constraint on agent-facing context growth — surfaced in Q6 but absent from §4.5.**
The Q6 lit-review (audience-corpus-organization.md, §4.5 and §9.4) establishes that comprehensive unified artifacts may actively degrade agent performance and that separate corpora create maintenance divergence as a primary failure risk. The R3 asymmetric framing permits agent-facing context to grow while holding human reading steady, but does not note that unbounded growth in companion files eventually triggers the maintenance-divergence problem the companion-file pattern was designed to address. This constraint is available in the source material and is absent from the essay. Its inclusion would not change the direction of the recommendation — companion files remain the supported pattern — but it would bound the "agent context may grow" claim with the maintenance caveat the literature supports.

*Why excluded:* Likely a scope decision to focus the §4.5 closing paragraph on the structural property of the response set rather than on long-run maintenance concerns. The omission is defensible but leaves the asymmetric framing's permissive direction unqualified.
*Would inclusion change the argument:* Partial change; the claim "agent-facing context may grow" would need to become "agent-facing context may grow within the bounds that avoid the maintenance divergence problem companion-file patterns are otherwise designed to prevent."

**Available truth C: The Q4 lit-review's ExploreLLM CHI 2024 empirical finding for agent-mediated schema-building remains uncited in §4.5's agent-mediated-orientation sub-section.**
This finding was identified in R2 (Framing P3-A, later renumbered) as absent from the essay. The Q4 lit-review (conversational-turn-structure.md, §3.2, ExploreLLM entry) documents that Ma et al. (CHI 2024) found that schema-like task decomposition in LLM interfaces reduced cognitive load for exploratory tasks and that users found the schema-like structure helpful for planning. The §4.5 agent-mediated-orientation sub-section appeals to "IFT and CLT in principle" to support schema-building through interaction, without citing the CHI 2024 empirical finding that most directly anchors the claim. A DECIDE-phase reader evaluating whether to adopt agent-mediated orientation would benefit from knowing an empirical anchor exists for the interaction-based schema-building claim.

*Why excluded:* The pattern of selecting IFT and CLT as theoretical anchors rather than the CHI 2024 empirical study appears consistent across synthesis passes; the omission is not new in R3. It is noted here because it becomes more consequential under the R3 framing, which leaves agent-mediated orientation as the most prominent candidate for the asymmetric constraint's "agent context may grow" space.

---

### Question 3: What would change if the dominant framing were inverted?

**Dominant framing of R3:** Context-building operates asymmetrically — human reading load is the optimization target; agent-facing context is permitted to grow; the five supported responses operate at the margin of the existing corpus and net human reading load downward or steady.

**Inverted framing:** Human reading investment in a purpose-built, brief, high-quality orientation artifact specifically designed for zero-prior-familiarity readers is net-positive even under the asymmetric constraint, because the optimization target (what humans must read or see to understand) is best served by one authoritative source rather than by the distributed orientation signals embedded across §4.5's five sub-patterns.

Under the inverted framing:

- The five sub-patterns of §4.5 (reading-path infrastructure, in-document orientation leads, visual scent, companion files, agent-mediated orientation candidate) are each individually modest interventions. Under the inverted framing, their aggregate effect on the zero-prior-familiarity reader is still distributed and implicit — no single artifact serves as the reader's explicit prior-context builder. The inverted framing says: one purpose-built orientation artifact, explicitly designed for the failing audience, would provide more per-unit-of-reading-investment than the five sub-patterns combined for that specific reader.
- The asymmetric constraint's classification of "the 51st document" as "more human reading load" is revealed as a framing choice about what counts as load. A 3-page conceptual introduction designed for a reader who would otherwise spend 2 hours bouncing off Tier-2 documents is "more reading" in a raw count but "less load" in a cognitive-cost-per-outcome sense. The essay's constraint treats these as equivalent; the inverted framing treats them as distinguishable.
- §4.4's diagram treatment becomes more prominent under the inverted framing: a well-designed system overview diagram (load-bearing per §2's constraint-removal) is itself a kind of purpose-built orientation artifact. If the diagram already functions as a pre-document context builder for the technical structure, the inverted framing asks why a parallel textual pre-context artifact is categorically excluded by the asymmetric constraint when the diagram is not.
- Agent-mediated orientation moves from "candidate, not adopted" to the implementation-layer question: if an interactive on-ramp is the right delivery mechanism for zero-prior-familiarity schema-building, the inverted framing asks whether DECIDE should prioritize this above the five structural sub-patterns rather than holding it as a residual candidate.

The inverted framing does not falsify the essay's five responses; they remain well-grounded for their target mechanisms. But it reveals that the essay's governing constraint embeds a particular theory of what "reading load" means — one that weights artifact count and raw reading volume equally regardless of the value delivered per unit read. That theory is not examined in the essay and is not required by the evidence.

---

### Framing Issues

**Framing P2-A — The asymmetric constraint's treatment of "reading load" is uniform where the evidence supports distinguishing high-value targeted addition from low-value noise addition**

- **Location:** §4.5, organizing constraint paragraph ("the optimization target is *what a human reader must read or see to understand*"); §4.5 closing paragraph; abstract
- **Claim:** The essay treats all additions to human reading material as equivalent reductions in optimization-target performance. "A reader who arrives at a 50-document corpus and is offered a 51st document as 'the document that orients you to the other 50' has been handed more human reading load, not less — and the methodology has compounded the problem it set out to address."
- **Evidence gap:** The source material does not establish that a single purpose-built orientation artifact for zero-prior-familiarity readers is equivalent in cognitive cost to adding a 51st reference document to a 50-document corpus. Ernst & Robillard's prior-familiarity finding — the essay's strongest specific empirical anchor, cited as the motivation for §4.5 — is most directly addressed by something that builds prior familiarity before document encounter, which is what a brief conceptual introduction does. The asymmetric constraint, as framed, classifies the highest-leverage intervention suggested by the essay's strongest empirical anchor as prohibited by definition. The constraint may correctly reflect the user's design preference, and the user's acceptance of the sharpened constraint in R3 makes this a user decision. However, the essay presents this as an analytic observation ("the methodology has compounded the problem") rather than as a design commitment that forecloses an evidence-supported intervention class. The distinction matters for downstream phases: if DISCOVER treats the asymmetric constraint as obvious rather than as a design decision, it will not examine whether the constraint is correctly scoped for all target interventions.
- **Recommendation:** Add a sentence in §4.5's constraint paragraph acknowledging that the no-new-human-reading constraint treats all additions as equivalent in reading cost, and that a downstream judgment call for DECIDE is whether a single high-value, low-volume orientation artifact for zero-prior-familiarity readers should be classified differently from bulk corpus additions. This is a one-sentence epistemic caveat that preserves the constraint's force while naming it as a choice rather than as a fact about reading load.

**Framing P3-A — Agent-facing context growth is presented as unproblematically admissible without noting the maintenance-divergence constraint the Q6 literature establishes**

- **Location:** §4.5, closing paragraph ("human reading load shrinks or holds steady while agent-facing context may grow"); abstract ("with agent-facing context allowed to grow when it offloads schema-construction work from humans")
- **Claim:** Agent-facing context growth is presented as a net-positive or neutral consequence of the asymmetric constraint, without qualification.
- **Evidence gap:** The Q6 lit-review (audience-corpus-organization.md, §4.1) notes that separate corpora create "maintenance divergence and synchronization failure" as the primary failure mode of fully separated agent and human documentation. The companion-file pattern avoids full separation, but if companion files are allowed to grow substantially without synchronization discipline, they re-introduce the maintenance divergence the pattern was designed to prevent. The essay does not surface this limit on the "agent context may grow" direction, leaving the asymmetric constraint unqualified in the direction where the literature does name a constraint.
- **Recommendation:** Add a brief qualifier to the closing paragraph noting that agent-facing context growth operates within the companion-file pattern's maintenance boundary — that is, companion files should remain sufficiently close to their primary artifacts (in scope, update discipline, and conceptual alignment) to avoid the maintenance divergence that fully separated corpora accumulate. One clause suffices. The P3 severity reflects that this is a downstream concern for DECIDE and ARCHITECT rather than an immediate argument error.

**Framing P3-B — Essay continues not to self-apply its own orientation principles (carried from R1 and R2 without change)**

- **Location:** Abstract; §1
- **Status:** Raised in R1 Framing P3-A and R2 Framing (not independently re-raised in R2 given no new changes to the abstract). The R3 abstract has been revised, but the revision addresses the asymmetric-constraint framing rather than the reflexive irony identified in R1: the essay opens with a dense, RDD-vocabulary-heavy abstract that presupposes prior familiarity with the corpus, committing in its first paragraph the precise error it diagnoses. The abstract is well-suited for the essay's primary audience (the user, who has full RDD context). It remains an irony worth noting at the epistemic gate, not a blocking issue.
- **Recommendation:** Carry forward unchanged. The P3 severity is correct; the essay's primary audience has the schema the abstract assumes.

---

## Summary

The R3 essay successfully resolves all three R2 P2 corrections. The methodology-self-credit sentence is gone; the agent-mediated-orientation operational-criterion confidence is accurately scoped; and the reading-path-infrastructure claim is correctly framed as a design inference from IFT rather than a literature-confirmed finding. No P1 issues exist.

The asymmetric-constraint revision — the principal substantive change in R3 — is internally coherent with §4.1's companion-file pattern and accurately names its own limits in the agent-mediated-orientation sub-section. The §4.5 heading and intro correctly target human reading load as the optimization variable while permitting agent-facing growth. The three consistency questions from the audit brief are resolved:

1. §4.5 and §4.1 are consistent — the asymmetric constraint and the companion-file pattern are aligned.
2. The AI-as-prosthetic tension is named in the agent-mediated-orientation sub-section but not signposted from the §4.5 intro where the asymmetric constraint is introduced. This produces Issue 2.1 (P2).
3. The "candidate, not adopted here" status for agent-mediated orientation remains appropriate under the R3 framing and should not be re-examined upward.

One P2 issue surfaces. The asymmetric constraint is introduced in §4.5 without noting that it has a bound — that the same section later establishes the "conceptually genuine but operationally fragile" nature of the agent-mediated-orientation pattern, which is the place where the constraint's permissiveness toward agent-mediated human understanding runs into the AI-as-prosthetic objection. A reader who grasps the asymmetric framing from §4.5's opening paragraphs should be directed toward that bound before the section ends.

The two persisting P3 issues (Heijstek UML parenthetical; Diátaxis "maps" softening) remain from R1 without resolution. Both are one-phrase adjustments. Their continued deferral does not affect gate readiness.

The framing audit's most significant new finding is the asymmetric constraint's uniform treatment of reading load (Framing P2-A). The constraint is now load-bearing throughout the essay but forecloses the intervention class most directly suggested by the essay's strongest empirical anchor without acknowledging that a high-value, low-volume, purpose-built orientation artifact might be categorically different from bulk corpus additions. The user's decision to sharpen rather than soften the constraint is accepted; the question at the epistemic gate is whether downstream phases (particularly DISCOVER's stakeholder model update and DECIDE's context-building ADR) should encode the constraint as a design decision subject to further scrutiny, or as a settled requirement. The essay currently presents it as the latter.

The essay is ready for the epistemic gate with Issue 2.1 applied. Framing P2-A is surfaced for user judgment at gate time. The P3 items and Framing P3 items are minor and do not affect gate readiness.
