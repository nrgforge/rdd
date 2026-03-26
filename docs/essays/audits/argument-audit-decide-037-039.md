# Argument Audit Report

**Audited documents:** ADR-037, ADR-038, ADR-039 (decision layer); Essay 008 and its reflection (evidence layer)
**Date:** 2026-03-26

---

## Summary

- **Argument chains mapped:** 11
- **Issues found:** 10 (1 P1, 5 P2, 4 P3)

### Argument chains mapped

1. Independent convergence (Adzic / Screenplay / HTA) → missing middle layer is a real structural problem → add Interaction Specifications
2. Derivation source (stakeholder models) → placement in DECIDE, not ARCHITECT
3. Interaction Specifications → create Playable Surface → Play requires them
4. Suchman's constitutive gap → no amount of better specs closes it → different epistemic mode required
5. Cross-discipline convergence on play (play theory / design theory / performance / critical theory / philosophy) → play is the right mode
6. Play ≠ exploratory testing (Bateson's frame shift / Gadamer's ontological priority) → distinct methodology needed
7. Discover–play symmetry → epistemic bookends → pipeline has complete epistemic coverage
8. Play feeds back into discover → pipeline loop character
9. ADR-016 pattern (synthesis subsumes its gate) → play subsumes its gate → no separate gate infrastructure needed
10. Epistemic Distance (Deterding) → active facilitation needed → gamemaster role
11. Gamemaster sits on Invariant 3 boundary → requires explicit boundary statement

---

## Issues

### P1 — Must Fix

---

**P1-1: The Invariant 3 boundary claim is incomplete in ADR-039, and the resolution inverts the problem**

- **Location:** ADR-039, Context and Decision sections; Essay 008, §6 (Invariant 3 tension); Reflection, "The Agent as Gamemaster"
- **Claim:** ADR-039 states the Gamemaster is "pragmatic in form (the agent performs it) but epistemic in function (shapes what the practitioner attends to and encounters during their epistemic act)" and characterizes this as a new category. The ADR concludes this is acceptable and names it "active facilitation during an epistemic act."
- **Evidence gap:** Invariant 3 reads: "Pragmatic actions may be automated; epistemic actions may not." The ADR acknowledges the gamemaster "shapes what the practitioner attends to and encounters" — that is, it shapes the content of an epistemic act, not merely the logistics of it. A gamemaster who proposes which stakeholder role to inhabit, which assumptions to invert, and which complications to introduce is not merely setting the stage; it is making the pivotal choices that determine what is discovered. The discovery a practitioner makes when the gamemaster says "try inhabiting the emergency operator under time pressure" is not the same discovery they would make unguided. The epistemic content is partially determined by the gamemaster's choices. The ADR's own negative consequence — "over-facilitation risk — too much side-coaching collapses play into guided testing" — acknowledges this risk but treats it as an implementation detail rather than a boundary principle. The reflection is clearer than the ADR about the problem: "the agent doesn't just set the stage, it continues to shape the encounter from the side" and calls it "active facilitation that is itself part of the epistemic machinery." If it is "part of the epistemic machinery," it may not satisfy Invariant 3. No resolution is offered that satisfies the invariant — only a naming of the tension. The ADR's statement that this is "genuinely ambiguous" and that "future experience may reveal this needs a clearer boundary principle" is an open question deferred into implementation, not a resolved architectural decision.
- **Recommendation:** Either (a) argue explicitly that shaping attention is structurally different from performing the epistemic act itself, with enough precision to operationalize where facilitation ends and direction begins — making this a P2-addressable nuance in the consequences section — or (b) acknowledge that the gamemaster role constitutes a qualified exception to Invariant 3 and state the exception condition explicitly (e.g., "epistemic facilitation by the agent is permitted when the practitioner retains final authority over what counts as a discovery and the agent cannot predetermine the outcome"). Leaving it as "genuinely ambiguous" defers the problem into the skill design without settling the principle, which means every future `/rdd-play` implementation will have to re-solve it from scratch.

---

### P2 — Should Fix

---

**P2-1: The placement argument in ADR-037 (DECIDE vs. ARCHITECT) rests on a single deciding factor that is contestable without acknowledgment**

- **Location:** ADR-037, Context section (final paragraph)
- **Claim:** "The derivation source is the deciding factor — Interaction Specifications derive from Product Discovery's stakeholder models and complement scenarios as behavioral specifications, placing them in the specification family rather than the design family."
- **Evidence gap:** The essay (§7, Open Question 1) explicitly holds this as an unresolved question: "DECIDE (alongside scenarios, derived from stakeholder models) vs. ARCHITECT (alongside system design, following the Screenplay Pattern's SOLID architecture)." The ADR promotes one side of this open question to a settled decision without identifying it as a contested question or explaining why the derivation-source criterion should outweigh the architectural-character criterion. The Screenplay Pattern's SOLID architecture is not merely a downstream implementation detail — it shapes the interaction spec artifact structure (Goal → Task → Interaction → Ability), which in turn determines how BUILD reads the specs. If the artifact's downstream consumer (BUILD) is determined by its architectural character, the ARCHITECT placement argument is not clearly weaker. The domain model's open questions section (line 394) still lists the DECIDE vs. ARCHITECT question as unresolved, which is inconsistent with ADR-037 having resolved it.
- **Recommendation:** Either resolve and close the open question in the domain model to match ADR-037's decision, or add a sentence in ADR-037's context acknowledging the alternative criterion and explaining why it was outweighed. The deciding factor should be stated as a choice, not presented as self-evident from the derivation source.

---

**P2-2: The "constitutive gap" claim is used to do more argumentative work in ADR-038 than Suchman's evidence supports**

- **Location:** ADR-038, Context (first paragraph); Essay 008, §3 ("A Different Kind of Gap")
- **Claim:** ADR-038 opens with "Essay 008 identifies a constitutive gap between specification and situated action (Suchman 1987): a system can satisfy every scenario, pass every test, and meet every criterion while remaining hostile, confusing, or unusable." This is used to establish that better specs cannot close the gap and that a different epistemic mode is required — motivating the entire play phase.
- **Evidence gap:** Suchman's original argument applies to plans and situated action in general — it is a claim about the relationship between any plan and any action. Applying it specifically to the gap between software specifications and user experience requires an additional premise: that software behavioral specs are the relevant kind of plan in Suchman's sense, and that users using software instantiate the "situated action" that diverges from them. The essay makes this application plausibly in §3 but does not verify it. More importantly, the claim that "no amount of better specs eliminates this gap" is used in ADR-038 as a premise that motivates adding play as the solution — but this is stronger than Suchman establishes. Suchman's claim is that plans and situated action are structurally different modes of engagement; it does not follow that a richer specification language (including interaction specs) cannot reduce the gap substantially. The essay acknowledges this more carefully in §3 ("No amount of better specs eliminates this gap. What it requires is a different mode of engagement") but ADR-038 inherits the strong form without the essay's hedging. The essay also uses both interaction specs and play to address the gap — which creates a question the ADR does not fully address: if interaction specs substantially reduce the gap, what is the specific residual gap that play addresses? The ADR would be stronger if it named what play reaches that interaction specs cannot.
- **Recommendation:** Add a sentence to ADR-038's context that names the residual gap specifically: what is it about interaction specs that still leaves something unaddressed, in Suchman's terms? The essay's framing in §3 — "even a perfect specification leaves something unaddressed because specification and use are different kinds of activity" — is close, but ADR-038 should carry this precision explicitly rather than leaving it implicit.

---

**P2-3: The discover–play symmetry claim overstates the structural parallel**

- **Location:** ADR-038, Context (third paragraph); Essay 008, §4 ("Discover and Play as Epistemic Bookends"); Domain Model, Play definition (line 92)
- **Claim:** "The discover-play symmetry gives the pipeline epistemic bookends around the pragmatic center: Product Discovery inverts assumptions about *what to build*; Play inverts assumptions about *what was built*. Both are epistemic, both are generative, both serve Invariant 0 from the 'who it was built for' dimension."
- **Evidence gap:** The symmetry is rhetorically powerful but the parallel is not structurally precise. Product Discovery produces a durable artifact (the product discovery document) that feeds forward into multiple phases with specified relationships. Play produces Field Notes that feed back into prior phases, but the mechanism and scope of feedback is not constrained — play can feed back to RESEARCH, DISCOVER, DECIDE, or Interaction Specifications, depending on what was found. The symmetry claim implies the phases are structurally parallel; the actual relationship is more asymmetric: Discover is upstream and its outputs are referenced by name in downstream phases (e.g., stakeholder models feed interaction specs, super-objectives in play). Play's outputs are categorized but their re-entry mechanism into earlier phases is informal — no ADR or invariant specifies how Field Notes re-enter, how they are prioritized, or who decides which feedback to act on. The claim that "play's feedback into discover makes play the precondition for the next discover phase" (Essay 008, §4; ADR-038 Decision) is an assertion of pipeline loop character that is not yet architecturally realized in the ADR set.
- **Recommendation:** Either (a) scope the symmetry claim to what is actually symmetric (both are epistemic, both are bounded by felt understanding, both are optional) and be explicit that the feedback mechanism is a design problem still to be solved in `/rdd-play` skill design, or (b) add a neutral consequence to ADR-038 that names the loop mechanism as an open design problem. The symmetry framing is not wrong but it is more complete as a vision than as a current architectural description.

---

**P2-4: ADR-038's bounding mechanism contradicts the essay's own identified Invariant 4 tension**

- **Location:** ADR-038, Decision section ("Bounded by felt understanding (Invariant 0), not timebox (Invariant 4)"); Essay 008, §6 (Invariant 4 tension)
- **Claim:** ADR-038 resolves the bounding problem by analogy to synthesis: "Play continues until the practitioner's felt sense is that discovery has plateaued. Same bounding principle as synthesis. No stakeholder-count limit."
- **Evidence gap:** The essay explicitly identifies this as an unresolved tension: "This tension requires a design decision, not more research" (Essay 008, §6, Invariant 4). Open Question 3 in the essay (§7) asks: "How is play bounded? Time-boxed sessions? Stakeholder-count limits? Felt saturation?" The domain model's open questions section (line 397-398) carries this forward as unresolved. ADR-038 resolves it by invoking the synthesis analogy — "same bounding principle as synthesis" — but synthesis has a natural exogenous bound (the conversation runs 30-60 minutes, the essay is written on the user's own time). Play has no equivalent natural bound: a practitioner could inhabit five stakeholders, or twenty; could spend ten minutes or three hours. The felt-saturation principle is not wrong, but it leaves the practitioner with no guidance about whether ten minutes is enough or whether skipping two stakeholders is a shortcut. The synthesis analogy does not carry to this level of detail. The essay's proposed mitigations (Spolin's 3-5 minute theater games as session length guidance; stakeholder felt-sense as stopping criterion) are more specific than what the ADR adopted.
- **Recommendation:** ADR-038 should acknowledge that bounding is an open design problem passed to the `/rdd-play` skill design, rather than presenting the synthesis analogy as resolving it. Alternatively, adopt the essay's more specific guidance (e.g., sessions are typically short, stopping when felt sense says discovery has plateaued across stakeholders) and note it as provisional pending operational experience.

---

**P2-5: The claim that Interaction Specifications "stabilize tests" (ADR-037, Consequences) is not established in the evidence**

- **Location:** ADR-037, Consequences (Positive, fifth bullet)
- **Claim:** "Stabilizes tests — workflow-level specs change less often than UI details."
- **Evidence gap:** The essay (§2) explicitly notes: "No empirical study has yet verified whether teams that adopt a formal workflow layer produce more stable test suites than those that do not; the stability claim remains practitioner consensus rather than measured outcome." ADR-037 carries this claim as a positive consequence without the essay's epistemic hedge. This is a case of the decision layer stating as fact what the evidence layer marks as unverified practitioner consensus. The claim may well be true — it is a reasonable inference from the structural stability of the workflow layer — but the ADR should not present it at a higher confidence level than the evidence supports.
- **Recommendation:** Add the essay's hedge: "Likely stabilizes tests — workflow-level specs change less often than UI details, though this remains practitioner consensus rather than measured outcome."

---

### P3 — Consider

---

**P3-1: The Inversion Principle's expansion to play is listed in the domain model but not argued in the ADRs**

- **Location:** ADR-039, Decision (step 2: "Introduces complications and inversions"); Domain Model, Inversion Principle entry (line 44); Domain Model, Relationships (line 343)
- **Claim:** ADR-039 states the Gamemaster "Introduces complications and inversions — 'what happens if this stakeholder ignores the instructions?' 'what if they're under time pressure?'" and names this "extending the Inversion Principle into play." The domain model entry for the Inversion Principle has been updated to include "as a play technique."
- **Evidence gap:** The inversion-in-play concept is plausible and well-motivated, but it is a design extension of the Inversion Principle that is not argued from the research evidence. Essay 008 does not invoke the Inversion Principle explicitly in the play sections — the closest source is de Certeau's tactics (§3), which is related but distinct. The domain model has already absorbed the extension, which means a reader consulting the domain model will find "play technique" as one of four levels of the Inversion Principle without being able to trace it to the essay's argument. This is a traceability gap, not a logical error.
- **Recommendation:** Add a sentence to ADR-039's context or decision noting that the gamemaster's inversion role extends the Inversion Principle into the play phase, and citing the essay's treatment of de Certeau (or directly acknowledging it as a design extension rather than a research finding). This closes the provenance chain.

---

**P3-2: "Playing as oneself is equally valid" lacks argumentative grounding in ADR-038**

- **Location:** ADR-038, Decision section (final paragraph of three-movement structure section); Domain Model, Epistemic Distance entry (line 97)
- **Claim:** "Playing as oneself is equally valid. If the practitioner is the primary stakeholder, self-play is natural — the play frame itself (Bateson's metacommunicative shift) makes the familiar strange regardless of whose role is inhabited."
- **Evidence gap:** The claim relies on Bateson's frame theory to assert that self-play is epistemically equivalent to inhabiting unfamiliar stakeholder roles — "the play frame itself makes the familiar strange." This is a significant claim: Deterding's Epistemic Distance critique, which motivates the entire gamemaster apparatus, presupposes that inhabiting the builder's own perspective is precisely the problem. The ADR resolves this by asserting the play frame is sufficient, but does not argue why the same frame that addresses the distance problem (by making familiar things strange) also makes self-play valid without a gamemaster. If the frame is sufficient for self-play, why is the gamemaster needed at all for other roles? The two claims exist in mild tension and the resolution is not made explicit.
- **Recommendation:** Either clarify the distinction (self-play works without a gamemaster because there is no role gap; the gamemaster addresses role-based distance specifically) or note the tension as an open question.

---

**P3-3: The play-precedes-synthesis ordering is asserted but not derived from a shared principle**

- **Location:** ADR-038, pipeline position claim; Essay 008, §4 ("Why Play Must Precede Synthesis")
- **Claim:** Play precedes synthesis because "the trail produced by BUILD is a trail of conformance" and synthesis benefits from having play's experiential discoveries in the artifact trail before mining it. Play enriches the trail; synthesis mines it.
- **Evidence gap:** This ordering is logically sound and well-argued in Essay 008. However, ADR-038 does not make the case — it asserts the pipeline position without reproducing the reasoning. A reader of ADR-038 who has not read Essay 008 sees "optional phase after BUILD, before SYNTHESIS" without understanding why play cannot follow synthesis or why synthesis without preceding play would be epistemically incomplete. The essay's argument in §4 (Winnicott's potential space as the prerequisite for genuine synthesis; conformance trail vs. experiential trail) would strengthen the ADR's context.
- **Recommendation:** Add a sentence to ADR-038's context section making the explicit link: play precedes synthesis because synthesis mines the artifact trail for novelty, and play's field notes contribute novelty that a conformance-only trail cannot contain. The one-line version of the Winnicott argument ("synthesis is discovery, not reporting; play is what makes it discovery") belongs in the ADR, not only in the essay.

---

**P3-4: Terminology in ADR-039 uses "side-coaching" inconsistently with the domain model**

- **Location:** ADR-039, Context ("Spolin's side-coaching directs attention without directing outcomes"); Domain Model synonym alias table (line 166: "Side-Coach: Not 'Direct (when referring to gamemaster facilitation), Prompt'")
- **Claim:** ADR-039 uses "side-coaching" as an analogy in the context section. The domain model defines Side-Coach as the mechanism of Gamemaster facilitation (line 344) and creates a synonym alias explicitly reserving "Direct" as the term not to use.
- **Evidence gap:** This is a minor terminological consistency issue, not a logical gap. ADR-039 uses "directs attention" in the phrase "side-coaching directs attention without directing outcomes" — the word "directs" appears in a context where the domain model's synonym table prohibits "Direct" as an alias for Side-Coach. The meaning is distinguishable in context (directing attention is not directing play), but a reader following the synonym conventions will find the phrasing awkward against the alias table. ADR-037 and ADR-038 do not have equivalent terminology issues.
- **Recommendation:** Rephrase "side-coaching directs attention" to "side-coaching focuses attention" in ADR-039's context to avoid any collision with the prohibited synonym. This is a polish issue, not an architectural one.
