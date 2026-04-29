# Argument Audit Report

**Audited document:** `/Users/nathangreen/Development/rdd/docs/essays/009-adaptive-epistemic-gates.md`
**Evidence trail:** `/Users/nathangreen/Development/rdd/docs/essays/research-logs/research-log.md`
**Date:** 2026-03-30

---

## Summary

- **Argument chains mapped:** 8
- **Issues found:** 11 (2 P1, 5 P2, 4 P3)

### Argument Chains Mapped

1. Gates feel formulaic → IRE pattern diagnosis → adaptive design solves the structural cause
2. IRE characterization of current gates → three research traditions prescribe the alternative
3. Teacher noticing framework → Attend-Interpret-Decide cycle operationalizes adaptive response
4. Engagement signals are observable in text → agent can diagnose before deciding
5. Sycophancy research + Rowe's wait-time → challenge is appropriate response to deep engagement
6. Haraway's anti-solutionism → staying with trouble is the philosophical frame for the gate
7. Invariant tensions (3 and 4) → proposed design preserves both invariants
8. Reflection time naming → converging support from Schon, Rowe, professional practice

---

## Issues

### P1 — Must Fix

---

**Issue 1: Essay overstates the rigidity of the existing gate protocol**

- **Location:** Section 1 (paragraph 2), echoed in Section 3 (§ "Teacher Noticing")
- **Claim:** The current gates ask "a predetermined question drawn from a table mapping frameworks to phases (self-explanation at RESEARCH, retrieval practice at MODEL, elaborative interrogation at DECIDE)" and are "independent of what happened during the cycle."
- **Evidence gap:** ADR-003 (the operative specification of the existing gate protocol) explicitly states that prompts "must reference the specific artifact content and domain vocabulary from the current phase" and that "each skill fills them with specific content from the artifact it just produced." The current design is not a static, context-free question — it is a framework-assigned prompt that is dynamically filled with artifact-specific content. The essay conflates the fixed pedagogical framework assignment (true) with the claim that prompts are context-independent (false, or at least contested by ADR-003).
- **Recommendation:** Revise the characterization of the existing protocol to acknowledge that current gates already inject artifact-specific content into prompts. Reframe the limitation precisely: what is missing is not artifact-specificity but sensitivity to user engagement behavior across the cycle. The agent does not adapt the gate based on whether the user deeply engaged or passively approved — this is the real gap the IRE diagnosis supports.

---

**Issue 2: Inversion Principle location count is incorrect**

- **Location:** Section 7 (anti-sycophancy axis paragraph)
- **Claim:** "The Inversion Principle already operates at five locations across the pipeline (discover, decide, architect, play, synthesis). The gate is a natural sixth location."
- **Evidence gap:** The domain model's relationship section documents the Inversion Principle cross-cutting RESEARCH, PRODUCT DISCOVERY, DECIDE, ARCHITECT, SYNTHESIS, and PLAY — six locations already, not five. The essay's list is also wrong: it says "discover" rather than "product discovery," omits RESEARCH entirely (despite the domain model explicitly listing it), and names "discover" when the domain model concept is "Product Discovery." The count and enumeration are both inconsistent with the primary artifact trail.
- **Recommendation:** Correct the count and list to match the domain model. If the claim is that the gate becomes the seventh location, state that. If some domain model entries were superseded, document which ones.

---

### P2 — Should Fix

---

**Issue 3: "Four cycles of practice" is presented as observed evidence but sourced from user feedback**

- **Location:** Section 1 (opening paragraph of "The Gate That Doesn't Listen")
- **Claim:** "Four cycles of practice have revealed a different problem. The gates work — users do produce explanations... But the gates feel formulaic."
- **Evidence gap:** The cycle-status.md feed-forward signals (the actual evidence trail for this cycle) attribute the "formulaic" observation to user feedback: "User feedback: Gates feel formulaic in practice." The framing "four cycles of practice have revealed" implies an empirical observation across multiple cycles, but the evidence is a single self-reported user experience. These are different epistemic statuses. The essay's framing invests the observation with more evidential weight than the evidence trail supports.
- **Recommendation:** Either narrow the claim to "user feedback after four cycles reports that gates feel formulaic" or provide a reference to the artifact trail entries (field notes, gate conversations) that document the pattern across multiple cycles.

---

**Issue 4: Freire appears in references but not in the argument**

- **Location:** References section; the gap is in Section 3 and Section 8
- **Claim:** Freire (1970) is listed as a source. The research log (Finding 8) devotes a full section to Freire's "generative themes" concept and the "double dialogic pedagogy" proposed by Wegerif (2025) as a Freire-grounded approach.
- **Evidence gap:** Neither concept appears in the essay body. The generative themes concept — that gate questions should emerge from the specific cycle's content through dialogue rather than being predetermined — is directly relevant to the core argument and directly supported by the research log findings. Wegerif (2025) is cited in the references but also absent from the argument. The research log's synthesis (Finding 8 implication) states: "The gate's questions should emerge from the specific artifact and the specific user's engagement with it — generative themes, not predetermined templates." This is a research finding that strengthens the argument and is silently absent.
- **Recommendation:** Either incorporate the Freire/generative themes thread into the argument where it would strengthen the case for adaptive questioning (connecting to Section 5's Attend-Interpret-Decide design), or remove Freire from the references if the concept was intentionally excluded. A reference that plays no role in the argument creates a misleading impression of evidentiary scope.

---

**Issue 5: The hybrid design tension (Section 10) is not resolved — it is deferred**

- **Location:** Section 10 ("The Hybrid Design Challenge")
- **Claim:** "The proposed design addresses this tension by separating intent from execution." The structured intent / adaptive execution split is presented as a resolution.
- **Evidence gap:** The research cited for this tension (2025 hybrid dialogue agents study) found that combining rule-based structure with LLM flexibility "introduced repetitiveness and misalignment in prompts, reducing engagement." The essay acknowledges the finding but does not explain how the proposed design avoids these failure modes — repetitiveness and prompt misalignment. The structured intent / adaptive execution separation is a design principle, not a validation that the failure modes are prevented. This is a gap between claiming a design principle and claiming the design principle solves the cited problem.
- **Recommendation:** Either claim only that the design principle is a reasonable approach to the tension (not a resolution), or provide a mechanism argument for why repetitiveness and prompt misalignment would not occur in the proposed design. The distinction between "here is how we will try to address it" and "this resolves the tension" is load-bearing for the essay's conclusion.

---

**Issue 6: The Invariant 4 tension resolution contains a hidden assumption about disengagement frequency**

- **Location:** Section 12 ("Invariant 4" paragraph)
- **Claim:** "If the user is deeply engaged, the gate is brief (one challenge, one response, proceed). If the user is surface-engaged, the gate may take longer — but this is precisely the case where more time is needed." The cost scales with need; this preserves Invariant 4.
- **Hidden assumption:** This resolution assumes that the lightweight case (deep engagement, brief gate) is common enough that average gate cost remains within Invariant 4's 5-10 minute target. If most users present surface engagement most of the time, the adaptive gate would routinely expand into teaching sessions — not as an exception but as the norm — violating the spirit of Invariant 4 even while technically permitting longer gates in specific cases. The argument requires an empirical premise about the distribution of engagement types that is not supplied.
- **Recommendation:** Acknowledge this as an open empirical question, consistent with the Validation open question already present in Section 13. Alternatively, add a hard ceiling for the teaching mode (e.g., the disengagement re-anchor response provides a natural exit) and state it explicitly.

---

**Issue 7: The Section 11 self-explanation utility is not integrated into the argument structure**

- **Location:** Section 11 ("The Self-Explanation Utility")
- **Claim:** A `/rdd-about` utility skill extends the agent-as-teacher role to meta-teaching about RDD itself, using the same Attend-Interpret-Decide framework.
- **Evidence gap:** This section does not cite any research — not from the research log, not from the literature. The claim that the same AID framework applies to methodology self-explanation is an assertion by analogy, not a reasoned inference. The section opens with "A secondary concern motivating this research is RDD's readiness for sharing with new users" — but this secondary concern was not part of the research question framing at the top of the research log, nor does the research log discuss this application. The section reads as an addendum that was not part of the research agenda.
- **Recommendation:** Either establish the `/rdd-about` claim with an argument (why does AID apply to meta-teaching, not merely by analogy?) or flag it explicitly as a design proposal that follows from the main argument rather than as a research finding. The current framing implies research support that is not present.

---

### P3 — Consider

---

**Issue 8: "Over 80% of classroom talk" statistic is attributed to Alexander (2008) but the finding originates with earlier researchers**

- **Location:** Section 2 (IRE Trap)
- **Claim:** "Over 80% of classroom talk follows this pattern (Alexander, 2008)."
- **Evidence gap:** The 80% figure characterizes the pre-existing IRE literature that Alexander synthesizes; it is not Alexander's own finding. The citation gives the impression that Alexander (2008) established this statistic empirically. The original studies (Sinclair & Coulthard, 1975; Mehan, 1979) established the IRE dominance claim, and subsequent researchers accumulated the quantitative evidence. This is a minor attribution issue that overstates Alexander's contribution.
- **Recommendation:** Attribute the statistic to "decades of classroom observation research, reviewed in Alexander (2008)" or cite a primary source for the 80% figure. This is a precision issue, not a fabrication.

---

**Issue 9: The Rowe wait-time finding and the anti-praise point are used for two distinct purposes without distinguishing them**

- **Location:** Section 7 (wait-time paragraph)
- **Claim:** Rowe's research supports two points: (a) wait time increases response quality, and (b) even positive evaluation reduces response quality. Both are used to support the anti-sycophancy argument.
- **Evidence gap:** Point (a) is about the duration of silence before a student responds. Point (b) is about the effect of teacher verbal rewards on student behavior. These are related but separate findings from the same researcher, and the connection to AI gate design is different for each. The silence finding (a) does not directly translate to AI text interactions where there is no wait time in the same sense. The essay treats both findings as equivalent supports for the anti-praise recommendation, blurring an important distinction about mechanism.
- **Recommendation:** Separate the two findings and state which one provides stronger support for the AI gate context. The anti-praise finding (b) translates more directly. The wait-time finding (a) may require a sentence explaining how it applies to text-based asynchronous interaction.

---

**Issue 10: "Reflection time" section does not address the risk of the term being misread as unstructured**

- **Location:** Section 9 (Naming section)
- **Claim:** "Reflection time" carries the right associations: not a test, not approval, brief, professional, bidirectional.
- **Hidden assumption:** The essay does not address the risk that "reflection time" may signal passivity or informality — that users may treat "reflection time" as optional, self-directed, or non-generative. The pedagogical argument throughout the essay emphasizes that epistemic acts must be generative (Invariant 1: "understanding requires generation, not review"). The term "reflection time" does not signal generativity — it could be read as time to quietly think rather than time to produce something. The essay acknowledges the positive connotations but does not address this specific risk.
- **Recommendation:** Add one sentence acknowledging the passivity risk and either explaining why it does not materialize in the agent's actual introduction of the gate ("Before moving on — reflection time. [adaptive prompt]"), or considering whether the term needs a qualifier.

---

**Issue 11: The essay's treatment of dialogic teaching (Alexander, Mercer) is thinner in the essay than in the research log**

- **Location:** Section 3 ("What Good Teaching Actually Looks Like") — dialogic teaching is mentioned briefly as a "converging research tradition" but is not developed as a distinct strand.
- **Evidence gap:** The research log devotes a full section (Finding 3) to dialogic teaching including Alexander's five principles (collective, reciprocal, supportive, cumulative, purposeful) and Mercer's exploratory talk. In the essay, dialogic teaching receives a single paragraph that essentially reduces to "the three-turn structure can be transformed by changing the character of its elements." The research log's richer treatment supports the Section 5 design more directly — particularly the "cumulative" principle (building on each other's contributions) which directly maps to the AID cycle's probe and challenge moves.
- **Recommendation:** Either expand the dialogic teaching strand to draw out the principle most relevant to the proposed design (cumulative dialogue), or make it explicit that dialogic teaching is here used only in the narrow sense of transforming the IRE pattern, with a pointer to the research log for fuller treatment.

