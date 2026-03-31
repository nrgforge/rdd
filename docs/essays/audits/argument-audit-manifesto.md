# Argument Audit Report

**Audited document:** /Users/nathangreen/Development/rdd/index.html
**Evidence trail:** /Users/nathangreen/Development/rdd/docs/essays/009-adaptive-epistemic-gates.md, /Users/nathangreen/Development/rdd/docs/essays/001-pedagogical-epistemology-of-rdd.md
**Date:** 2026-03-30

---

## Summary

- **Argument chains mapped:** 6
- **Issues found:** 11

### Chains mapped

1. AI removes understanding-forcing functions → generation without comprehension compounds → structured process around generation preserves understanding → RDD
2. Framing determines available questions → research-first changes what questions emerge → different system gets built
3. Reflection time is grounded in generation effect, desirable difficulties, reflective practice → understanding compounds across phases
4. Provenance from module to decision to research finding → explainable, defensible, extensible software
5. RDD is a heavy process → but offset by being what careful practitioners would do anyway → net worth it for the right 20% of problems
6. Methodology is general → AI is one facilitator option → plugin is one implementation → manifesto describes the methodology, not the tool

---

## Issues

### P1 — Must Fix

---

**Issue 1**

- **Location:** Motivation paragraph (third `<p>` block), and Research phase description in the pipeline
- **Claim:** The motivation paragraph argues: "A citation-audited essay matters now because AI makes it trivially easy to produce one full of plausible-sounding references that don't check out." The Research phase description later says: "Produce a written account of what you found — an essay, a report, whatever form suits the material."
- **Evidence gap:** These two claims now contradict each other. The motivation section establishes *citation-audited rigor* as one of RDD's core justifications in the AI era — making the case that verification of sources is precisely what AI makes cheap to fake and expensive to actually do. The pipeline section then generalizes the output to "a written account... whatever form suits the material," which removes the citation-audit requirement entirely. A reader who takes both claims seriously cannot reconcile them: is citation audit a design requirement or not? If it's been deliberately relaxed, the motivation section needs to be updated too; it's currently arguing for a specific practice the pipeline no longer mandates.
- **Recommendation:** Either restore "citation-audited essay" to the Research phase description (accepting that the generalization was a mistake), or revise the motivation paragraph to make the citation-audit argument about epistemic rigor in general rather than about one specific output form. The current state creates a false premise in the motivation section — it argues for a practice the pipeline doesn't require.

---

**Issue 2**

- **Location:** Pipeline introduction paragraph; Principle 2 in Core Principles
- **Claim (pipeline intro):** Reflection time is "a deliberate pause to decide: what kind of engagement would deepen understanding right now?" — framing the user as the agent who selects the form of engagement.
- **Claim (Principle 2):** "At each phase transition, produce something — an explanation, prediction, or articulation — rather than merely assessing an output."
- **Evidence gap:** These two claims conflict on a structurally important point. The pipeline intro implies the user exercises judgment about whether and how to engage ("decide: what kind of engagement..."). Principle 2 states categorically that production is required at every phase transition — it is not optional or user-selected. Essay 009 (the evidence trail) makes the agent-selects-the-form design explicit through the Attend-Interpret-Decide cycle. The user does not decide; the agent reads engagement signals and selects a pedagogical move. Framing the pause as something the user "decides" is both inaccurate to the design and potentially undermines Principle 2 by suggesting the user can opt for lighter engagement.
- **Recommendation:** Revise the pipeline introduction to clarify that the form adapts — but that production is non-negotiable. Something like: "The form adapts to where you are — but the requirement to produce something doesn't. Understanding requires generation, not review." This brings the pipeline description into alignment with Principle 2 without changing the invitation-to-inquiry framing.

---

### P2 — Should Fix

---

**Issue 3**

- **Location:** First motivation paragraph, final sentence
- **Claim:** "Also, researching and understanding what you're working on is fun and good for your brain."
- **Evidence gap:** This sentence is tonally incongruent with the paragraph it closes. The preceding three sentences develop a sustained epistemological argument — framing determines what questions are available, software works the same way, research-first changes what questions emerge. The paragraph is making a serious structural claim about the relationship between inquiry framing and cognitive output. The "fun and good for your brain" addition shifts register abruptly to colloquial reassurance, which undercuts the argument's authority at the moment it would land. The claim is defensible (the evidence trail supports it: generation effect, desirable difficulties, the Anthropic comprehension study), but placing it as a parenthetical afterthought rather than a substantiated claim means it reads as an apology for the methodology's cost rather than a genuine benefit.
- **Recommendation:** Either move this claim to a location where it can be substantiated (e.g., the Core Principles section, connected to evidence), or cut it. If the intent is to signal that RDD is not purely instrumental — that there is intrinsic value to the inquiry — that argument deserves a sentence or two of its own rather than being tacked onto an epistemological argument as a trailing aside.

---

**Issue 4**

- **Location:** CTA ("Get Started") section
- **Claim:** "The principles above are the methodology. The RDD plugin for Claude Code implements them."
- **Evidence gap:** The manifesto establishes a methodology-first framing early and maintains it consistently through the pipeline and principles sections — the facilitator can be "a colleague, a facilitator, or anyone with a different perspective — even an LLM in the right setting." The CTA section then collapses this framing: the plugin for Claude Code is presented as the implementation, with three Claude Code-specific slash commands shown (`/plugin marketplace add nrgforge/rdd`, `/plugin install rdd@nrgforge`, `/rdd-research`). The effect is that a manifesto presenting itself as a general methodology ends with an advertisement for one specific AI-tool implementation. A practitioner using a different facilitator model, a human-led process, or a non-Claude AI environment would reasonably wonder whether the methodology applies to them.
- **Recommendation:** The CTA section needs either (a) an opening line that acknowledges the plugin as one implementation path ("If you're using Claude Code, the RDD plugin implements these principles...") or (b) a brief mention of other starting points for non-Claude-Code practitioners before showing the slash commands. The current transition from "methodology" to "plugin" without framing reinforces the ambiguity the manifesto otherwise works to resolve.

---

**Issue 5**

- **Location:** Pipeline section, "Synthesize" phase; Pipeline list header
- **Claim:** "Play and synthesis are the profoundly human steps." The pipeline list marks both Play and Synthesize as "(optional)."
- **Evidence gap:** Calling a phase "profoundly human" while simultaneously marking it optional creates a tension the manifesto doesn't address. If these are the phases that most distinctly require human judgment, curiosity, and synthesis, the optional designation needs justification — either an explanation of when they can be legitimately skipped, or a reframing that distinguishes "optional for short cycles" from "optional for any reason." As written, a practitioner could reasonably skip the phases described as most important to human understanding, which contradicts the methodology's core argument about what produces durable comprehension.
- **Recommendation:** Add a brief qualifier to the "optional" designation — e.g., "(optional — for time-constrained cycles)" or a parenthetical explaining that PLAY is optional for non-interactive software and SYNTHESIZE is optional when the cycle produces no novel findings worth preserving. Without this, "profoundly human" and "(optional)" sit unreconciled.

---

**Issue 6**

- **Location:** "When to Use It — and When to Stop" section
- **Claim:** "RDD is for the 20% where understanding determines whether the other 80% goes in the right direction."
- **Evidence gap:** This specific 20/80 split is stated as a factual claim with no source, qualification, or evidence. Given that the rest of the manifesto is careful to ground claims in research (generation effect, desirable difficulties, reflective practice, Anthropic comprehension study), an unsourced quantitative claim is jarring. The underlying argument — that some problems reward depth and others reward speed-to-feedback — is well-supported and important. The specific percentages are not supported and are likely rhetorical, but they carry false precision.
- **Recommendation:** Remove the specific percentages or soften them explicitly: "...the subset of problems where understanding determines whether the rest of the work goes in the right direction." The argument is stronger without the precision it can't back.

---

**Issue 7**

- **Location:** Architect phase description in the pipeline
- **Claim:** "Provenance chains link each design choice back through a decision to a research finding to a user need. If you can't follow the chain, the boundary is arbitrary."
- **Evidence gap:** This is stated as a guaranteed property of following the methodology ("Provenance chains link..."), not as a design goal or aspiration. The claim is categorical: if you do Architect correctly, provenance chains exist. But the manifesto provides no mechanism for verifying whether a chain actually holds — no audit step, no criteria for chain completeness. Essay 001 establishes provenance as a design principle; it does not establish that the principle is self-enforcing. A practitioner who follows the methodology could still have incomplete or circular provenance chains without knowing it. The "if you can't follow the chain" qualifier is the only hedge, and it places the burden entirely on the practitioner to notice the gap.
- **Recommendation:** Soften the categorical claim: "Provenance chains *should* link each design choice back through a decision to a research finding to a user need." This accurately represents the design goal without implying the chains are automatically produced.

---

**Issue 8**

- **Location:** Core Principles preamble; opening "slow on purpose" paragraph in the motivation section
- **Claim (preamble):** "This is a heavy process — but it's what you might do anyway for a hard problem that matters: research, name things, question assumptions, design carefully, test, reflect."
- **Claim (motivation):** "RDD is slow on purpose. It's a mindful process of making — a counter-practice to the scattered exhaustion of constant AI generation."
- **Evidence gap:** These two framings are not incompatible, but they motivate RDD differently in ways that aren't explicitly reconciled. The preamble argues from normalcy ("it's what you'd do anyway") — framing the overhead as something practitioners already accept for hard problems. The motivation section argues from contrast ("counter-practice to scattered exhaustion") — framing the overhead as a deliberate resistance to a pathological norm. A reader who encounters both framings may reasonably ask: is RDD advocating for slowing down (counter-practice framing) or for formalizing what thoughtful practitioners already do (normalcy framing)? These lead to different audiences and different entry points for the methodology. The manifesto would be stronger if it chose one primary frame and used the other as supporting evidence, rather than leaving both in parallel tension.
- **Recommendation:** Consider which framing is primary. The counter-practice argument is stronger for practitioners already exhausted by AI-generation speed. The normalcy argument is stronger for practitioners skeptical that any new methodology is warranted. The manifesto may be trying to reach both audiences simultaneously — which works, but the tension should be acknowledged rather than left implicit.

---

### P3 — Consider

---

**Issue 9**

- **Location:** Pipeline introduction paragraph
- **Claim:** "sometimes a colleague, a facilitator, or anyone with a different perspective helps you see what you missed — even an LLM in the right setting — teaching you something you didn't know you needed to understand. The form adapts to where you are — the goal is not to test understanding but to build it."
- **Evidence gap:** The em-dash following "even an LLM in the right setting" and the word "teaching" appear to modify the full preceding list ("a colleague, a facilitator, or anyone with a different perspective... even an LLM"). But the sentence structure is slightly awkward: the participial phrase "teaching you something you didn't know you needed to understand" grammatically attaches closest to "LLM in the right setting," making it seem like teaching is specifically what the LLM does. The sentence then cuts to a new thought ("The form adapts...") without a clean transition. The grammar isn't wrong, but it creates momentary ambiguity about whether "teaching" applies to all facilitators or specifically to the LLM case.
- **Recommendation:** A minor rewrite would clarify: "...even an LLM in the right setting. All of them may teach you something you didn't know you needed to understand." Or restructure the sentence to make the participial phrase clearly apply to all cases.

---

**Issue 10**

- **Location:** Principle 5 in Core Principles
- **Claim:** "The quality effect is cumulative — and it's the difference between software you own and software that owns you."
- **Evidence gap:** "Software that owns you" is a vivid phrase but it isn't defined in the manifesto. The implied meaning (software whose rationale is opaque and therefore difficult to change, extend, or defend) is the opacity problem established in essay 001, which the manifesto would benefit from making explicit here. The phrase works rhetorically but it's doing conceptual work that a brief clarification would anchor. Readers unfamiliar with the opacity problem framing may not follow the implication.
- **Recommendation:** A brief parenthetical would help: "...software that owns you (because no one can explain why it works the way it does, let alone safely change it)." This connects the rhetorical phrase to the manifesto's underlying argument without losing the punch.

---

**Issue 11**

- **Location:** Principle 6 in Core Principles
- **Claim:** "Reflection should be productive, not merely brief. The constraint is on waste — formulaic exchanges that build nothing — not on duration."
- **Evidence gap:** This principle is doing more argumentative work than it signals. It is a substantive revision of essay 001's Invariant 4 ("epistemic cost must remain lightweight"), which was designed to prevent gate-expansion into open-ended conversations. The revised principle ("productive, not merely brief") implicitly reframes the constraint from duration to quality. This is a defensible revision — essay 009 supports it through the contingent shift principle, arguing that deeply engaged users get brief gates and surface-engaged users need longer ones. But the manifesto states the principle without acknowledging that there's a design tension it resolves. A practitioner reading the principle without the essay trail might simply read it as "gates can be as long as needed" — which is not what the design intends.
- **Recommendation:** Add one clause that makes the bound explicit: "The constraint is on waste — formulaic exchanges that build nothing — not on duration. But the gate that becomes an open-ended conversation has likely drifted." This preserves the spirit of essay 009's adaptive design while making clear that duration is a signal worth attending to.
