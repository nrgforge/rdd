# From Gatekeeping to Dialogue: Adaptive Epistemic Gates in Research-Driven Development
*2026-03-30*

## Abstract

This essay investigates why RDD's epistemic gates feel formulaic after four development cycles and proposes a research-grounded redesign. Through a literature review spanning formative assessment (Black & Wiliam), dialogic teaching (Alexander, Mercer), contingent scaffolding (Wood, Bruner & Ross), teacher noticing (Jacobs et al.), and anti-solutionist design methodology (Haraway), the research identifies a structural problem: RDD's gates replicate the Initiation-Response-Evaluation (IRE) pattern — the most criticized discourse structure in educational research. The essay proposes replacing fixed-template gates with an Attend-Interpret-Decide cycle grounded in the teacher noticing framework, where the agent reads engagement signals from the cycle, forms a hypothesis about the user's understanding, and selects a contingent response ranging from teaching (for gaps) to productive challenge (for deep engagement). A key finding is that challenge — not validation — is the appropriate response to genuine engagement, connecting LLM sycophancy research to the Inversion Principle already in RDD's domain model. The essay also proposes renaming the user-facing concept from "epistemic gate" to "reflection time," grounded in Schon's reflective practice and professional education terminology.

## 1. The Gate That Doesn't Listen

RDD's epistemic gates were designed to solve a real problem. Essay 001 documented how AI-assisted development systematically bypasses the cognitive processes that produce understanding, and proposed that phase transitions require the user to *produce* something — an explanation, prediction, or articulation — rather than merely approve. The theoretical grounding was strong: six established pedagogical frameworks, each with decades of empirical validation, converging on the principle that generation, not review, builds durable understanding.

After four cycles of practice, a different problem has surfaced. The gates work — users do produce explanations, and the epistemic acts do activate learning mechanisms. But the gates feel formulaic. The current protocol assigns a pedagogical framework to each phase (self-explanation at RESEARCH, retrieval practice at MODEL, elaborative interrogation at DECIDE) and fills prompts with artifact-specific content — referencing particular findings, domain terms, or decisions from the phase just completed. This is not context-free. But it is *engagement-blind*. The same framework-assigned prompt runs regardless of whether the user spent the cycle deeply engaged — asking questions, challenging choices, proposing alternatives — or passively approving artifacts and advancing.

This is not a minor UX complaint. It points to a structural limitation: the gates do not attend to *how the user engaged* during the cycle. The agent that spent hours researching, modeling, and designing alongside the user arrives at the gate with no model of the user's understanding. It selects a prompt based on the phase and the artifact, not based on whether the user built genuine comprehension or rubber-stamped their way through.

## 2. The IRE Trap

Educational research has a name for this pattern. Sinclair and Coulthard (1975) and Mehan (1979) identified the Initiation-Response-Evaluation (IRE) structure as the dominant form of classroom discourse: the teacher initiates a question, the student responds, the teacher evaluates. Decades of classroom observation research find that over 80% of classroom talk follows this pattern (reviewed in Alexander, 2008), and the accumulated evidence documents its limitations: it "restricts opportunities for critical thinking, authentic communication, and the development of communicative competence."

The critical limitation is not the three-turn structure itself but the character of the initiation. In the IRE pattern, the teacher "rarely asked a question because he or she genuinely wanted to know the answer; instead, the teacher wanted to know whether the student knew 'the answer'" (Sinclair & Coulthard, 1975). These are *display questions* — questions where the answer is already known to the asker, designed to confirm that the student can reproduce it. They create the appearance of dialogue while functioning as a quiz.

RDD's current gates follow the IRE pattern precisely. The agent initiates with a predetermined prompt ("What stands out as the most important finding?"), the user responds, the agent evaluates (notes discrepancies, asks whether to proceed). The agent already knows what the essay found — it wrote the essay. The question is a display question. The user's task is to demonstrate they absorbed the content, not to contribute something the agent does not already know.

Wells (1999) and Alexander (2008) demonstrate that the three-turn structure can be transformed by changing the character of its elements: referential questions (genuinely open, where the answer is unknown to the asker), elaborative feedback (building on the response rather than evaluating it), and student-initiated talk. The structure is not the problem. The rigidity is.

## 3. What Good Teaching Actually Looks Like

The alternative to the IRE pattern is well-documented. Three converging research traditions describe what adaptive educational dialogue requires.

### Formative Assessment: Moments of Contingency

Black and Wiliam (1998, 2009) define formative assessment as "the creation of, and capitalization upon, 'moments of contingency' in instruction for the purpose of the regulation of learning processes." The critical distinction is between *assessment of learning* (summative, fixed, after the fact) and *assessment for learning* (formative, adaptive, during the process). RDD's current gates operate more like assessment *of* learning — applying the same instrument regardless of context.

Wiliam identifies five strategies for formative assessment, but the most relevant here is the second: engineering effective discussions that *elicit evidence of learning*. Questions in formative contexts should serve one of two purposes: reveal the learner's thinking (diagnostic) or cause thinking (generative). RDD's gate prompts attempt the second but lack the first. The agent does not diagnose what the user understands before choosing what to ask.

### Contingent Teaching: The Shift Principle

Wood, Bruner, and Ross (1976) formalized the mechanism that makes adaptive teaching work: the **contingent shift principle**. Increase support when the learner fails; decrease support when the learner succeeds. This creates a "region of sensitivity" where the learner never succeeds too easily or fails too often.

The key cognitive demand on the tutor is holding two models simultaneously: expert knowledge of the domain AND a model of the learner's developing understanding. Hendrick (2024) identifies the "lethal mutation" of scaffolding: confusing it with permanently tailored support rather than temporary, strategic, adaptive assistance that fades. Authentic scaffolding requires the tutor to continuously ask: "What does the learner understand now? What is the gap? What is the minimum support needed at this exact moment?"

The scaffolding literature operationalizes this as a four-step cycle: (1) diagnose the learner's current understanding, (2) check the diagnosis with the learner, (3) intervene with targeted help, (4) check whether the intervention moved understanding forward. This is not a one-shot exchange — it is an iterative loop. RDD's current gate does one round. The contingent teaching model does as many rounds as needed.

### Teacher Noticing: Attend, Interpret, Decide

Jacobs, Lamb, and Philipp (2010) decompose the skill of responsive teaching into three interrelated components executed near-simultaneously:

1. **Attending** — selectively looking for particular information; identifying what is noteworthy
2. **Interpreting** — drawing on knowledge and experience to make sense of what is observed. Three stances: descriptive (what happened), evaluative (correct or incorrect), and interpretive (inferences about understanding)
3. **Deciding** — choosing how to respond based on the interpretation

A key finding: "The noticing required in teaching is specialized and is not a natural extension of being observant in everyday life." It must be learned through deliberate practice. This applies directly to the agent: reading engagement signals requires a structured framework, not generic conversational awareness.

RDD's current gate protocol skips attending and interpreting. It injects artifact-specific content into the prompt — referencing the essay's findings or the domain model's terms — but it does not attend to the user's engagement behavior across the cycle. It jumps straight to deciding, selecting a pedagogical framework based on the phase, not on what the user demonstrated during the phase.

## 4. What the Agent Can Notice

The teacher noticing framework requires observable signals. In a text-based AI-human interaction, what can the agent attend to?

Research on text-based discourse analysis identifies markers that distinguish deep from surface engagement. A 2025 cluster analysis of 13,855 student-AI dialogues found five engagement profiles, with a critical finding: **interaction quality, not quantity, predicts learning outcomes.** Stagnating Interactors showed high message volume but 38% off-topic content and low learning. Active Questioners showed knowledge co-construction and questioning behaviors — and achieved the highest performance.

The discourse analysis literature identifies specific markers observable in text:

**Deep engagement markers:** authentic questions (genuinely open, not rhetorical); elaborated explanations with reasoning connectives ("because," "therefore," "if-then"); extended responses with supporting detail; exploratory talk with tentative language; specificity referencing particular concepts or artifact content; challenge (pushing back, proposing alternatives); connections linking new material to prior knowledge or domain experience.

**Surface compliance markers:** brief, fragmented responses without elaboration; approval without specificity ("looks good," "agreed"); restating without adding; disconnected talk not referencing specific content; low uptake (not building on prior discussion).

RDD has a unique advantage over general-purpose tutoring systems. The agent does not observe only the gate response — it has the *entire cycle's conversation history*. During a RESEARCH phase, did the user ask follow-up questions about findings, propose new research directions, or push back on a conclusion? During DECIDE, did the user engage with rejected alternatives, ask about implications, or suggest alternatives of their own? During ARCHITECT, did the user connect module boundaries to their mental model of the domain? These behaviors, observed across the full phase, constitute rich evidence of engagement quality.

## 5. The Attend-Interpret-Decide Cycle

The redesigned gate replaces fixed-template prompts with a three-phase process:

**Attend.** At gate time, the agent reads the cycle's conversation history for specific engagement signals: questions asked during the phase, concepts engaged with or avoided, challenges raised or not raised, connections made to prior knowledge, patterns of approval versus substantive response. Freire's concept of *generative themes* (1970) — the key issues and concerns that emerge through dialogue rather than being predetermined — provides the epistemological grounding for this step. The gate's questions should not come from a template; they should emerge from what the cycle actually produced and how the user actually engaged with it. Wegerif (2025) extends this principle to AI contexts as a "double dialogic pedagogy" where the learner interrogates the AI's outputs and the AI interrogates the learner's assumptions — a mutual questioning that neither party controls in advance.

**Interpret.** The agent forms a hypothesis about the user's engagement and understanding:
- *Deeply engaged* — building connections, challenging choices, asking questions, referencing specific artifact content
- *Adequately engaged* — following along with some specificity, but not initiating questions or challenges
- *Surface-engaged* — approving without engaging, brief responses, no specificity
- *Confused* — contradictions between responses, avoidance of specific topics, misalignment with artifact content
- *Disengaged* — minimal responses, apparent fatigue or distraction

**Decide.** The agent selects a pedagogical move calibrated to the interpretation:

| Interpretation | Move | Example |
|---------------|------|---------|
| Deep engagement | **Challenge** | "The architecture allocates X to module Y. What is the weakest part of that decision? Where might it break?" |
| Adequate engagement | **Probe** | "You mentioned the domain model's distinction between A and B — what makes that distinction important for what you are building?" |
| Surface engagement | **Teach** | "The most consequential choice in this phase was Z, because it constrains downstream options. Here is why it was chosen over the alternatives. What is your take?" |
| Confusion | **Clarify** | "It sounds like the relationship between concepts P and Q is not clear. Let me walk through how they connect, and then I would like to hear whether that matches your understanding." |
| Disengagement | **Re-anchor** | "This is a lot of material. What part of it connects most directly to what you are actually building?" |

The contingent shift principle provides the mechanism for subsequent turns: if the user's response to a probe is thin, the agent shifts toward teaching; if the response to teaching demonstrates understanding, the agent shifts toward probing or challenging. The gate becomes an iterative dialogue, not a single exchange.

## 6. The Agent as Teacher

Essay 001 framed the agent's role at gates as an assessor — the agent checks whether the user can demonstrate understanding. The research suggests a richer role: the agent as *contingent teacher*.

The teaching axis is not separate from assessment. It IS the response to assessment. When the Attend-Interpret-Decide cycle reveals that the user does not understand an architectural choice, the productive response is not to ask a different question — it is to explain the choice, then ask. The four-step contingent teaching model applies: diagnose the gap, check the diagnosis with the user ("It seems like the trade-off between X and Y is not clear — is that right?"), teach into the gap, then check whether understanding moved forward.

This addresses a limitation of Essay 001's framework. The original design assumed the user could engage with artifacts at the level required for epistemic acts. If the user does not understand why an ADR rejected a particular alternative, asking "why was this alternative rejected?" is a display question that tests recall, not understanding. The contingent teaching model would first explain the trade-off, surface the reasoning, and *then* ask the user to articulate their own position.

The inner-outer loop architecture from conversational AI tutoring research (2025) provides the structural frame. The phase sequence is the outer loop — it selects what content comes next. The gate is the inner loop — it manages step-level interactions within a phase transition, including diagnosis, graduated hints, and adaptive questioning. The principle: "structured learner models determine *which pedagogical move* is needed, while generative AI realizes that move in natural language." The structure ensures pedagogical fidelity; the LLM provides conversational naturalness.

## 7. Challenge, Not Validation

A critical finding from this research reverses an assumption implicit in the original gate design: **challenge is the appropriate response to deep engagement, not to poor engagement.**

The current protocol treats all users the same at gates. A user who spent the cycle deeply engaged — asking questions, challenging ADR alternatives, connecting architecture to their domain expertise — receives the same predetermined prompt as a user who approved every artifact without comment. If anything, the deeply engaged user gets an *easier* pass, because their gate response is likely to be richer.

The adaptive model inverts this. The user who demonstrates genuine understanding gets the hardest question — because they can handle it, and because challenge produces more learning than validation at that level:

"The architecture cleanly separates concerns X and Y. Now — where does this design break? What assumption is load-bearing? If stakeholder Z's needs changed, which module boundary would need to move?"

This connects to a broader problem in AI-assisted work: sycophancy. Recent research decomposes LLM sycophancy into three mechanistically separable behaviors — sycophantic agreement (echoing incorrect claims), genuine agreement (agreeing with correct claims), and sycophantic praise (exaggerated flattery) (arXiv:2509.21305, ICLR 2026). Separately, empirical measurement of social sycophancy found that LLMs affirm whichever position the user adopts in 48% of moral conflict scenarios, regardless of which side (Cheng et al., ICLR 2026). In educational contexts, sycophancy "can limit learning and entrench misconceptions."

Rowe's 1974 wait-time research reinforces this from a different angle: **even positive evaluation reduces response quality.** Teachers who increased wait time to 3-5 seconds saw student responses increase by 300% in length and become more evidence-based and cognitively complex. But judgmental comments — even positive ones like "Well done!" — negatively affected performance even with extended wait time. Task persistence was greatest where verbal rewards were fewest.

The implication for RDD gates is direct: the agent should resist the impulse to praise. "Great insight!" is sycophantic praise that terminates productive dialogue. The agent should instead build on the response, probe its implications, or surface a tension — moves that treat the user's contribution as the *beginning* of a conversation, not the end.

This anti-sycophancy axis connects to three existing concepts in the RDD domain model:

**The Inversion Principle** — "systematically question assumptions before encoding them in architecture" — already operates at six locations across the pipeline (research, product discovery, decide, architect, play, synthesis). The gate is a natural seventh location, where the agent applies inversions to the user's own understanding: "The artifact presents X as settled. What would change if X were wrong?"

**Haraway's "staying with the trouble"** — resistance to comfortable resolution. Sycophantic agreement is premature closure through validation: the user says something, the agent agrees, and the trouble is resolved without being explored. The Haraway-informed gate stays with the trouble — sits with what is uncomfortable, explores what is unfamiliar, resists the mutual gravitational pull toward agreement.

**Reframing** — the agent holds the full artifact corpus across the cycle and can notice when the user's framing has narrowed. "The research explored approaches A, B, and C. But the domain model suggests the core problem is actually about X. Have the artifacts been solving the right problem?" This higher-order move is uniquely available to the agent because it maintains cross-phase context that the user may have lost across sessions.

## 8. Staying with the Trouble

Haraway's "staying with the trouble" (2016) has been translated into design methodology as an anti-solutionist approach: "responding to/with trouble, rather than designing solutions to problems" (Søndergaard). Three practices constitute this methodology:

1. **Staying with the wrong** — actively questioning the given, staying with uncomfortable feelings rather than resolving them
2. **Curious visiting** — moving beyond individual perspective by engaging with unfamiliar viewpoints
3. **Collective imagining** — collaboratively envisioning different possibilities

In educational contexts, Haraway's "response-ability" — the cultivated capacity to respond with care to what emerges — maps directly to the adaptive quality that gates need. The gate should not resolve tension prematurely. When a user encounters something unfamiliar or uncomfortable in an artifact (an architectural choice that does not match their intuition, a domain model term that feels wrong, an ADR that rejected their preferred approach), the current protocol moves past it with a general prompt. The Haraway-informed gate would stay with that trouble — explore what is confusing, sit with the uncertainty, teach into it — rather than accepting surface-level approval and advancing.

This philosophical grounding distinguishes the adaptive gate from a mere algorithmic optimization. The Attend-Interpret-Decide cycle could be implemented as a sycophancy-reduction technique — detect thin responses, ask harder questions. But the Haraway frame recontextualizes the entire interaction. The gate is not a checkpoint to pass through efficiently. It is a place to pause, to stay with what emerged during the phase, to resist the mutual pull toward forward progress when something has not been fully understood.

The connection to productive struggle (Bellwether, 2025) reinforces this: AI threatens productive struggle by removing essential cognitive effort. The calibration question is: "When does ease enable greater learning, and when is ease a shortcut with a hidden cost?" The gate's job is to preserve difficulty where it serves understanding — productive discomfort, not intimidation — while keeping the overall cost lightweight (Invariant 4).

## 9. Naming: From Epistemic Gate to Reflection Time

"Epistemic gate" is precise terminology within the research and design vocabulary. It names the concept exactly: a gate that requires an epistemic act. But it is academic language that creates distance between the user and the practice. The term signals assessment, formality, and judgment — precisely the connotations the adaptive redesign works to displace.

The term "reflection time" emerges from multiple research traditions that converge on the same practice:

**Schon (1983)** — reflection-on-action is the practice of examining decisions after they are made, stepping back to evaluate what happened, why, and what was learned. The gate IS reflection-on-action: a structured pause after a phase to reflect on what was produced.

**Rowe (1974)** — wait time and think time research demonstrates that making space for thinking, not rushing to the next interaction, produces dramatically better cognitive outcomes. "Reflection time" signals this pause.

**Professional practice** — "time for reflection" is standard terminology in nursing, teaching, coaching, and other professional fields where practitioners reflect on practice as part of practice. It carries connotations of professionalism rather than examination.

"Reflection" carries the right associations: not a test (reflecting, not being examined), not approval (thinking, not rubber-stamping), brief (a pause, not a project), professional (practitioners reflect; students take exams), and bidirectional (reflection can surface things for the agent as well as the user).

One risk: "reflection time" could be read as passive — time to quietly think rather than time to produce something. Invariant 1 requires generation, not review. The mitigation is in the agent's actual introduction of the gate: "Before moving on — reflection time" is immediately followed by an adaptive prompt that requires the user to produce something specific. The term names the pause; the prompt supplies the generative requirement. The term would become misleading only if used without the accompanying prompt.

The proposal: "epistemic gate" remains in the research and design vocabulary — the domain model, essays, and ADRs. The user-facing term in skill files and agent dialogue becomes "reflection time." The mapping is explicit and documented: reflection time is the epistemic gate, named for the audience that experiences it. The agent introduces it naturally: "Before moving on — reflection time." Then the adaptive prompt follows, calibrated by the Attend-Interpret-Decide cycle.

## 10. The Hybrid Design Challenge

A tension runs through the literature on AI-mediated educational dialogue: too much structure produces the formulaic quality that RDD's current gates exhibit; too much adaptivity produces pedagogical drift, where the system loses its educational purpose in pursuit of conversational naturalness.

Research on hybrid dialogue agents (2025) found that combining rule-based structure with LLM flexibility "achieved richer learner reflections but introduced repetitiveness and misalignment in prompts, reducing engagement." The balance between structure and adaptivity is the core design challenge.

The proposed design approaches this tension by separating *intent* from *execution*. Whether this separation actually prevents the failure modes observed in hybrid systems — repetitiveness and prompt misalignment — is an empirical question that usage will answer. The principle is:

**Structured intent** — the gate must accomplish specific things regardless of context:
- The user must produce something (Invariant 2: epistemic acts are mandatory)
- The user's response must inform the agent's next move (contingent teaching)
- The gate must not consist solely of approval (Invariant 2)
- The gate must remain lightweight (Invariant 4: minutes, not hours)

**Adaptive execution** — how the gate accomplishes these things varies based on context:
- The specific question depends on what happened during the cycle
- The pedagogical move (teach, probe, challenge, clarify, re-anchor) depends on the user's engagement
- The number of turns depends on when shared understanding is established
- The agent's tone and depth depend on the user's demonstrated expertise

This separation preserves the invariants while allowing the gate to adapt. The invariants say *what must happen*; the Attend-Interpret-Decide cycle determines *how it happens*.

## 11. The Self-Explanation Utility

A secondary concern motivating this cycle — though not the research itself — is RDD's readiness for sharing with new users. The adaptive gate redesign suggests a design proposal (not a research finding): if the agent can teach during gates, it can also teach about RDD itself. A `/rdd-about` utility skill — checking the current plugin version, providing a brief methodology overview, and offering to explain any phase in depth — would extend the agent-as-teacher role from domain teaching (explaining architectural choices) to meta-teaching (explaining the methodology that produced those choices).

The Attend-Interpret-Decide framework would apply by analogy. A new user invoking `/rdd-about` would receive an overview calibrated to their apparent context — are they exploring, committed, or mid-cycle? The agent reads signals and adjusts. This proposal follows from the main argument but has not been independently researched; it is better specified through the DECIDE phase than through further literature review.

## 12. Invariant Tensions

The proposed redesign creates tensions with two existing invariants that require explicit acknowledgment:

**Invariant 3 (pragmatic actions may be automated; epistemic actions may not):** The Attend-Interpret-Decide cycle involves the agent performing what looks like assessment — reading the user's engagement, forming a hypothesis about their understanding, choosing a pedagogical move. Is this assessment an epistemic action being performed by the AI?

The resolution: the agent's attending and interpreting are *pragmatic precursors* to the user's epistemic act, not epistemic acts in themselves. The agent does not understand the system on behalf of the user. It reads conversational signals to determine what kind of prompt will best support the user's own understanding. This is analogous to a teacher observing a student's work to decide what question to ask — the observation is pragmatic, the student's response to the question is epistemic. The boundary holds.

**Invariant 4 (epistemic cost must remain lightweight):** An iterative Attend-Interpret-Decide cycle with contingent teaching could expand the gate from 5-10 minutes to a longer conversation. If the agent detects surface engagement and shifts to teaching mode, the gate becomes a teaching session.

The resolution: the contingent shift principle itself provides the bound. If the user is deeply engaged, the gate is brief (one challenge, one response, proceed). If the user is surface-engaged, the gate may take longer — but this is precisely the case where more time is needed, because the user has not built the understanding that faster gates assume. The cost scales with the need. The disengagement response ("What part connects to what you are building?") provides a natural exit when the user genuinely cannot or should not engage deeply with a particular phase.

This resolution carries a hidden empirical assumption: that deep engagement (brief gates) is common enough that average gate cost stays within the 5-10 minute target. If most users present surface engagement most of the time, the adaptive gate would routinely expand into teaching sessions — not as an exception but as the norm. Whether this is the case requires operational data. The disengagement re-anchor provides a hard floor against runaway gates, but the distribution of engagement types across real cycles is an open question.

## 13. Implications and Open Questions

The research converges on a redesign that is theoretically grounded and practically specified, but several questions remain:

**Validation.** No study has tested whether adaptive gates produce better outcomes than fixed-template gates in a structured development methodology. The theoretical foundations are strong, but the specific application — an AI agent assessing developer engagement during a software development pipeline — is novel. The proposal is a synthesis of established principles applied to a new context, not a validated intervention.

**Calibration.** The Attend-Interpret-Decide cycle requires the agent to form accurate hypotheses about user engagement. Misinterpretation — reading genuine brevity as disengagement, or reading polite compliance as deep engagement — would produce inappropriate responses. The engagement markers from discourse analysis provide a starting framework, but calibration against actual usage patterns is needed.

**User reception.** The anti-sycophancy axis — challenging deeply engaged users rather than validating them — may initially feel adversarial. The framing matters: "productive discomfort, not intimidation." The agent's challenge should feel like a respected colleague's pushback, not an examiner's gotcha question.

**The `/rdd-about` skill.** The self-explanation utility is logically connected to the adaptive gate redesign (same teaching principles, same framework) but may be better specified through the DECIDE phase than through further research.

**Fading across cycles.** Invariant 6 (scaffolding must fade) implies that as the user develops expertise, the gates should shift character — from teaching toward challenge, from longer dialogues toward brief check-ins. The adaptive model supports this naturally (deep engagement triggers challenge, not teaching), but the mechanism for detecting cross-cycle expertise growth is not specified.

## References

- Alexander, R. (2008). *Towards Dialogic Teaching: Rethinking Classroom Talk*. 4th ed. Dialogos.
- Alexander, R. (2020). *A Dialogic Teaching Companion*. Routledge.
- Black, P. & Wiliam, D. (1998). "Inside the Black Box: Raising Standards Through Classroom Assessment." *Phi Delta Kappan*, 80(2), 139-148.
- Black, P. & Wiliam, D. (2009). "Developing the Theory of Formative Assessment." *Educational Assessment, Evaluation and Accountability*, 21(1), 5-31.
- Bellwether (2025). "Productive Struggle: How Artificial Intelligence Is Changing Learning, Effort, and Youth Development in Education."
- Freire, P. (1970). *Pedagogy of the Oppressed*. Continuum.
- Haraway, D. (2016). *Staying with the Trouble: Making Kin in the Chthulucene*. Duke University Press.
- Hendrick, C. (2024). "The Misunderstood Art of Scaffolding." *Substack*.
- Jacobs, V.R., Lamb, L.L.C. & Philipp, R.A. (2010). "Professional Noticing of Children's Mathematical Thinking." *Journal for Research in Mathematics Education*, 41(2), 169-202.
- Mehan, H. (1979). *Learning Lessons: Social Organization in the Classroom*. Harvard University Press.
- Mercer, N. & Littleton, K. (2007). *Dialogue and the Development of Children's Thinking*. Routledge.
- Rowe, M.B. (1974). "Wait-Time and Rewards as Instructional Variables." *Journal of Research in Science Teaching*, 11(2), 81-94.
- Rowe, M.B. (1986). "Wait Time: Slowing Down May Be a Way of Speeding Up!" *Journal of Teacher Education*, 37(1), 43-50.
- Schon, D.A. (1983). *The Reflective Practitioner: How Professionals Think in Action*. Basic Books.
- Sinclair, J.McH. & Coulthard, R.M. (1975). *Towards an Analysis of Discourse*. Oxford University Press.
- Søndergaard, M.L.J. (2018). *Staying with the Trouble through Design: Critical-Feminist Design of Intimate Technology*. Aarhus Universitet.
- Wegerif, R. (2025). "A Dialogic Theoretical Foundation for Integrating Generative AI into Pedagogical Design." *British Journal of Educational Technology*.
- Wells, G. (1999). *Dialogic Inquiry: Towards a Sociocultural Practice and Theory of Education*. Cambridge University Press.
- Wiliam, D. (2006). "Formative Assessment and Contingency in the Regulation of Learning Processes." Working paper.
- Wiliam, D. (2011). *Embedded Formative Assessment*. Solution Tree Press.
- Wood, D., Bruner, J.S. & Ross, G. (1976). "The Role of Tutoring in Problem Solving." *Journal of Child Psychology and Psychiatry*, 17(2), 89-100.
- (2025). "Dialogic Pedagogy for Large Language Models: Aligning Conversational AI with Proven Theories of Learning." arXiv:2506.19484.
- (2025). "Student-AI Interaction in an LLM-Empowered Learning Environment: A Cluster Analysis of Engagement Profiles." arXiv:2503.01694.
- Vanacore, K., Baker, R., Closser, A. & Roschelle, J. (2026). "The Path to Conversational AI Tutors: Integrating Tutoring Best Practices and Targeted Technologies to Produce Scalable AI Agents." arXiv:2602.19303.
- Sharma, K. et al. (2026). "Hybrid LLM-Embedded Dialogue Agents for Learner Reflection: Designing Responsive and Theory-Driven Interactions." arXiv:2602.20486.
- (2025). "Sycophancy Is Not One Thing: Causal Separation of Sycophantic Behaviors in LLMs." ICLR 2026. arXiv:2509.21305.
- Cheng, M., Yu, T., Lee, S., Khadpe, P., Ibrahim, L. & Jurafsky, D. (2025). "ELEPHANT: Measuring and Understanding Social Sycophancy in LLMs." ICLR 2026. arXiv:2505.13995.
