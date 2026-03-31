# Research Log: Adaptive Epistemic Gates

## Question 1: How do adaptive educational dialogues work — what does the literature say about conversations that assess understanding and adjust in real-time, as opposed to fixed-template assessments?

**Method:** Literature review (lit-reviewer subagent) + web search (6 targeted searches, 5 deep paper fetches)

### Findings

#### 1. Formative Assessment and Contingency (Black & Wiliam, 1998, 2009; Wiliam, 2006)

Black and Wiliam define formative assessment as "the creation of, and capitalization upon, 'moments of contingency' in instruction for the purpose of the regulation of learning processes." The critical distinction is between **assessment of learning** (summative, fixed) and **assessment for learning** (formative, adaptive). RDD's current gate protocol operates more like assessment *of* learning — predetermined questions applied uniformly.

Five key strategies:
1. Clarifying learning intentions and criteria for success
2. Engineering effective discussions, tasks, and activities that elicit evidence of learning
3. Providing feedback that moves learners forward
4. Activating students as instructional resources for one another
5. Activating students as owners of their own learning

Wiliam emphasizes that questions in formative contexts should serve two purposes: reveal student thinking (diagnostic) or cause thinking (generative). RDD's current gate prompts attempt the second but lack the first. The agent does not diagnose what the user understands before choosing what to ask.

#### 2. Contingent Teaching (Wood, Bruner & Ross, 1976)

The **contingent shift principle**: increase control when the learner fails, decrease control when they succeed. This creates a "region of sensitivity" where the learner never succeeds too easily or fails too often. The key cognitive demand on the tutor is holding two models simultaneously — expert knowledge of the domain AND a model of the learner's developing understanding.

Hendrick (2024) identifies the "lethal mutation" of scaffolding: confusing it with permanently tailored support (differentiation) rather than temporary, strategic, adaptive assistance that fades. Real scaffolding requires the tutor to continuously ask: "What does the student understand now? What's the gap? What's the minimum support needed at this exact moment?"

**Implication for RDD:** The gate agent needs a model of the user's current understanding — not just of the artifact, but of the domain. The contingent shift principle provides a mechanism: thin user responses → increase teaching/explanation; rich user responses → validate and build on their insight, decrease scaffolding.

#### 3. Dialogic Teaching (Alexander, 2008; Bakhtin; Mercer)

Alexander's five principles of dialogic teaching: **collective** (tasks addressed together), **reciprocal** (participants listen and consider alternatives), **supportive** (ideas articulated freely without fear), **cumulative** (building on each other's contributions), **purposeful** (educationally directed).

Mercer's "exploratory talk" allows challenges and counter-challenges, making reasoning publicly visible. The challenge for one-on-one human-AI interaction is simulating genuine peer dialogue — multi-role systems offer partial solutions.

**Dialogic Pedagogy for LLMs (2025)** proposes 12 concrete strategies for aligning LLMs with pedagogical theory, including:
- Tiered Socratic prompting (hints → partial solutions → full explanations based on response)
- ZPD-responsive scaffolding with fading
- Reflective and metacognitive prompts
- Periodic retrieval practice ("Earlier we discussed X — can you recall...?")
- Transparent reasoning and justifications from the AI

Critical gaps identified: LLMs lack genuine student models ("they only have the immediate context of the conversation"), LLMs default to over-directness (complete answers rather than guided discovery), constant availability contradicts productive failure principles.

#### 4. Haraway's "Staying with the Trouble" (2016)

Haraway's framework has been translated into design methodology as an **anti-solutionist approach**: "responding to/with trouble, rather than designing solutions to problems." Three practices:

1. **Staying with the wrong** — actively questioning the given, staying with uncomfortable feelings rather than resolving them
2. **Curious visiting** — moving beyond one's own perspective by listening to stories of pleasure and pain
3. **Collective imagining** — collaboratively rewriting possible futures

The methodological translation (Søndergaard, AU/KB Press) explicitly critiques solutionism: design becomes "a way of making trouble and staying with the trouble" rather than escaping it. In education, Haraway's "response-ability" — the cultivated capacity to respond with care to what emerges — maps to the adaptive quality the gates need.

**Implication for RDD:** The gate should not resolve tension prematurely. When a user encounters something unfamiliar or uncomfortable in an artifact (e.g., an architectural choice they don't understand), the current protocol moves past it with a general prompt. The Haraway-informed gate would stay with that trouble — explore what's confusing, sit with the uncertainty, teach into it — rather than accepting surface-level approval and advancing.

#### 5. Student Engagement Profiles (2025 cluster analysis, N=13,855 dialogues)

Five engagement profiles identified in LLM-assisted learning:
1. **Early Disengagers** (31%) — no meaningful interaction
2. **Stagnating Interactors** (19%) — high message volume, low learning; 38% off-topic content
3. **Lurkers** (24%) — minimal interaction but successful outcomes
4. **Active Questioners** (14%) — knowledge co-construction, questioning behaviors; highest quiz scores
5. **Responsive Navigators** (9%) — regulatory and emotional management focus

**Critical finding: interaction quality, not quantity, predicts performance.** The three-dimensional coding framework (behavioral × cognitive × emotional) provides a model for assessing engagement:
- Behavioral: questioning, responding, progress monitoring
- Cognitive: remembering/understanding vs. applying vs. higher-order thinking (Bloom's)
- Emotional: positive, negative, neutral affect

**Implication for RDD:** The agent can assess user engagement quality by reading the conversation history for markers. Surface compliance markers: restating without adding, approval without specificity, declining to engage with specific concepts. Genuine engagement markers: novel connections, building on prior gate responses, questions that challenge choices, specificity about artifact content.

#### 6. Productive Struggle and AI (Bellwether, 2025)

AI threatens productive struggle by removing essential cognitive effort. The core calibration question: "When does ease enable greater learning, and when is ease a shortcut with a hidden cost?"

**Productive struggle indicators:** active information processing, self-questioning, strategy adjustment, ability to explain/defend work, remaining engaged despite difficulty.

**Surface compliance indicators:** polished outputs without reasoning, inability to articulate rationale, copy-paste reliance, outputs that appear successful while learning fails silently.

**The ownership problem:** AI tools face incentives to maximize ease (user satisfaction), not preserve struggle. Without deliberate design, ease wins. This maps directly to RDD's design challenge: the gate must preserve productive difficulty while keeping cost lightweight (Invariant 4).

#### 7. Hybrid Dialogue Systems (2025)

Recent work on hybrid LLM-embedded dialogue agents for learner reflection combines rule-based structure (pedagogical alignment) with LLM flexibility (contextual responsiveness). The rule-based structure grounds dialogue in self-regulated learning theory; the LLM decides when and how to prompt deeper reflection based on conversational context.

**Key finding:** The system achieved richer reflections but introduced repetitiveness and misalignment in prompts, reducing engagement. The balance between structure and adaptivity is the core design challenge — too much structure → formulaic (RDD's current problem); too much adaptivity → drift from pedagogical intent.

#### 8. Freire's Dialogical Pedagogy

Freire's concept of **generative themes** — the key issues and concerns discovered through dialogue, not predetermined — maps to what the gate should do. Instead of fixed questions, the gate should discover what matters in this particular cycle through dialogue with the user.

A "double dialogic pedagogy" (Wegerif, 2025) is proposed for AI contexts: true to Freire's dialogic education and consistent with liberal education principles. Students interrogate assumptions underlying AI responses and critically analyze outputs. The **problem-posing approach** involves coaching and metacognitive engagement, where the user actively uses AI as a tool for inquiry.

**Implication for RDD:** The gate's questions should emerge from the specific artifact and the specific user's engagement with it — generative themes, not predetermined templates.

#### 9. The IRE/IRF Pattern — What RDD Gates Currently Do (Sinclair & Coulthard, 1975; Mehan, 1979)

The Initiation-Response-Evaluation (IRE) pattern is the dominant classroom discourse structure: teacher initiates a question, student responds, teacher evaluates. Research finds over 80% of classroom talk follows this pattern, and it "restricts opportunities for critical thinking, authentic communication, and the development of communicative competence."

The critical limitation: "the teacher rarely asked a question because he or she genuinely wanted to know the answer; instead, the teacher wanted to know whether the student knew 'the answer.'" This is a display question — the teacher displays their knowledge by confirming or correcting. It creates the appearance of dialogue while functioning as a quiz.

RDD's current gates follow the IRE pattern precisely: the agent asks a predetermined question (I), the user responds (R), the agent notes discrepancies and proceeds (E). This is why the gates feel formulaic — they are structurally identical to the most criticized discourse pattern in educational research.

The alternative (Wells, 1999; Alexander, 2008) is not to eliminate the three-turn structure but to transform its character: referential questions (genuinely open), elaborative feedback (building on the response), and student-initiated talk. The issue is rigid implementation, not the structure itself.

**Implication for RDD:** The gate should ask questions the agent genuinely does not know the answer to — questions about the user's understanding, priorities, and connections to their domain expertise. Not "can you explain what the essay found?" (display question) but "what does this mean for your specific situation?" (referential question).

#### 10. Wait Time and Silence (Rowe, 1974, 1986)

Rowe's 1974 study found teachers waited an average of **0.9 seconds** before rephrasing or moving on. When wait time increased to 3-5 seconds:
- Student responses increased by **300%** in length
- Responses became more evidence-based and cognitively complex
- More students offered responses
- Speculative thinking increased

Most striking: **judgmental comments — even positive ones ("Well done!") — negatively affected performance** even with extended wait time. Task persistence was greatest where verbal rewards were fewer.

This connects directly to the Cycle 4 play field notes: "A UX researcher would propose one complication and spend 20 minutes in it. The simulated session named six complications and explored none to the point of surprise. The most important facilitation skill is watching without narrating."

**Implication for RDD:** The gate protocol should include explicit patience — the agent should not rush to evaluate the user's response or offer praise. The temptation to say "Great insight!" after a user's gate response is precisely what Rowe's research warns against. The agent should sit with the response, build on it, or ask a follow-up — not evaluate it.

### Synthesis

The literature converges on a clear picture of what adaptive educational dialogue requires:

1. **A model of the learner** — the tutor must track what the learner currently understands, not just what was presented. This is the hardest problem for AI tutoring (LLMs lack genuine student models) but RDD has a unique advantage: the full conversation history and artifact corpus provide rich signal about what the user engaged with and how.

2. **Contingent response** — the next question depends on the last answer. Fixed templates cannot do this. The contingent shift principle (increase support on failure, decrease on success) provides a simple, robust mechanism.

3. **Diagnostic before generative** — before asking the user to produce something (epistemic act), assess what they currently understand. The gate should read signals from the cycle: Did the user ask questions during research? Did they propose modifications to the domain model? Did they challenge an ADR? These are indicators of engagement quality.

4. **Teaching as part of the gate** — the agent-as-teacher axis is not separate from assessment; it IS the response to assessment. When the diagnostic reveals a gap, the agent explains before asking. This is contingent teaching: identify the gap, teach into it, then check understanding.

5. **Staying with the trouble** — resist premature closure. When the user encounters difficulty or confusion, the gate should explore it rather than accept surface approval. Haraway's "response-ability" — cultivating the capacity to respond to what emerges — is the philosophical frame for adaptive gates.

6. **Engagement markers over compliance markers** — the agent can read the conversation for quality signals: specificity, novel connections, questions, challenges (genuine engagement) vs. approval without specificity, restating without adding, declining to engage (compliance). This is the "honestly evaluate if the user is phoning it in" axis.

7. **The hybrid design challenge** — too much structure → formulaic; too much adaptivity → pedagogical drift. The solution is structured intent (what the gate must accomplish) with adaptive execution (how it gets there based on the specific user and cycle).

8. **The IRE trap** — RDD's current gates are structurally identical to the most criticized discourse pattern in education: Initiation-Response-Evaluation. The fix is not eliminating the three-turn structure but transforming its character: ask referential questions (genuinely open, about the user's understanding) rather than display questions (checking whether the user can repeat what the artifact says).

9. **Silence is productive** — Rowe found that even positive evaluation ("Great insight!") reduces response quality. The gate agent should build on the user's response rather than evaluate it. This connects to the play field notes: the most important facilitation skill is watching without narrating.

### Implications for Research

The literature provides strong theoretical grounding for the adaptive gate redesign. The next questions that emerge:

- **Q2 (combined):** How should the agent assess engagement, calibrate its teaching response, and what user-facing language replaces "epistemic gate"?

## Question 2: How should the agent assess user engagement, calibrate teaching, and what should the gates be called?

**Method:** Web search (8 targeted searches, 2 deep paper fetches)

### Findings

#### 1. The Teacher Noticing Framework (Jacobs, Lamb & Philipp, 2010)

Teacher noticing comprises three interrelated skills executed near-simultaneously:

1. **Attending** — selectively looking for particular information, events, and interactions; identifying what is noteworthy and what can be disregarded
2. **Interpreting** — drawing on knowledge and experience to make sense of what is observed. Three stances: *descriptive* (what happened), *evaluative* (correct/incorrect), *interpretive* (inferences about understanding)
3. **Deciding** — choosing how to respond based on the interpretation

Key finding: "The noticing required in teaching is specialized and is not a natural extension of being observant in everyday life." It must be learned through deliberate practice. This applies to the agent: reading engagement signals requires a structured framework, not generic observation.

**Implication for RDD:** The gate agent needs a three-phase process: (1) attend to specific engagement signals from the cycle, (2) interpret what they indicate about the user's understanding, (3) decide what kind of gate conversation would be most productive. The current protocol skips steps 1 and 2 entirely — it jumps straight to "decide" with a predetermined prompt.

#### 2. Discourse Markers of Engagement Quality

Research on text-based discourse analysis identifies observable markers that distinguish deep from surface engagement:

**Deep engagement markers:**
- Authentic questions (genuinely open, not rhetorical)
- Elaborated explanations with reasoning connectives ("because," "therefore," "if-then")
- Extended responses with supporting detail
- Exploratory talk: tentative language, building on prior contributions
- Specificity: referencing particular concepts, terms, or artifact content
- Challenge: pushing back, proposing alternatives
- Connections: linking new material to prior knowledge or domain experience

**Surface engagement markers:**
- Brief, fragmented responses without elaboration
- Approval without specificity ("looks good," "agreed," "let's proceed")
- Restating without adding (parroting the artifact summary)
- Disconnected talk not referencing specific artifact content
- Low uptake: not building on prior discussion

The cluster analysis from Q1 reinforced this: Stagnating Interactors (19% of learners) showed high message volume but 38% off-topic content and low learning. Active Questioners (14%) showed knowledge co-construction and questioning — highest performance. Quality, not quantity.

**Implication for RDD:** The agent can operationalize these markers by reading the conversation history at gate time. Specific signals to attend to:

| Signal | Genuine Engagement | Surface Compliance |
|--------|-------------------|-------------------|
| During RESEARCH | Asked follow-up questions, proposed new directions | Said "proceed" without engaging findings |
| During MODEL | Challenged term definitions, proposed alternatives | Approved vocabulary without discussion |
| During DECIDE | Engaged with rejected alternatives, asked about implications | Accepted ADRs as presented |
| During ARCHITECT | Connected architecture to their mental model | Did not question module boundaries |
| At any gate | References specific concepts from artifact | Generic approval |
| At any gate | Asks "why" questions | No questions |
| At any gate | Connects to prior domain experience | No connections made |
| At any gate | Substantive response (3+ sentences with reasoning) | Brief response (1 sentence, no reasoning) |

#### 3. The Four-Step Contingent Teaching Model

The scaffolding literature operationalizes contingent teaching as a four-step cycle:

1. **Diagnose** — use diagnostic strategies to establish the user's current understanding
2. **Check** — verify the diagnosis with the user ("It sounds like you're seeing X as Y — is that right?")
3. **Intervene** — provide targeted help based on the diagnosis
4. **Check learning** — verify that the intervention moved understanding forward

This is not a one-shot exchange — it is an iterative loop. The current RDD gate protocol does one round (ask → response → note discrepancies → proceed). The contingent teaching model does as many rounds as needed, with each round informed by the previous.

**The contingent shift principle operationalized:**

| User response quality | Agent action |
|----------------------|--------------|
| Rich, specific, shows understanding | Validate the insight, build on it, ask a harder question, or proceed |
| Adequate but shallow | Probe deeper: "You mentioned X — what do you think would happen if X changed?" |
| Thin or generic | Teach first: explain the key concept, then re-ask |
| Confused or contradictory | Back up: clarify the artifact, address the misunderstanding |
| Disengaged (minimal response) | Name it gently: "This is a lot of material. What part feels most relevant to what you're building?" |

#### 4. Inner-Outer Loop Architecture for AI Tutoring (2025)

Recent work on conversational AI tutors proposes a hybrid architecture:

- **Outer loop** — selects what content/phase comes next (RDD's phase sequence)
- **Inner loop** — manages step-level interactions within a phase, including error detection, graduated hints, and diagnostic questioning

Within the inner loop, the system distinguishes between:
- **Slips** (the user knows but made a careless error) → light-touch: "You're close — what would you change?"
- **Non-mastery** (the user doesn't yet understand) → diagnostic questioning and remediation

The key design principle: "structured learner models determine *which pedagogical move* is needed, while generative AI realizes that move in natural language." The structure ensures pedagogical fidelity; the LLM provides conversational naturalness.

**Implication for RDD:** The gate is the "inner loop." The phase sequence is the "outer loop." The gate agent should:
1. Read engagement signals from the cycle (attend)
2. Form a hypothesis about the user's understanding (interpret — is this a slip or non-mastery?)
3. Choose a pedagogical move (decide — teach, probe, validate, build on)
4. Express that move in natural dialogue (the LLM's strength)

#### 5. Naming: "Reflection" in Professional Practice

"Reflection time" aligns with multiple research traditions:

- **Schon (1983):** Reflection-on-action — examining decisions after they are made. The gate IS this: a structured pause to reflect on what the phase produced.
- **Rowe (1974):** Wait time / think time — making space for thinking, not rushing to the next thing
- **Mindfulness in education:** "Short, consistent practices embedded in the daily rhythm" — not a heavy exercise but a built-in pause
- **Professional practice:** "Time for reflection" is standard terminology in nursing, teaching, and coaching — professional fields where practitioners reflect on practice as part of practice

"Reflection" carries the right connotations:
- **Not a test** — you're reflecting, not being examined
- **Not approval** — you're thinking, not rubber-stamping
- **Brief** — a reflection is a pause, not a project
- **Professional** — practitioners reflect; students take exams
- **Bidirectional** — reflection can surface things for the agent too

**"Reflection time"** is the strongest candidate. Alternatives considered:
- "Checkpoint" — too mechanical, suggests passing/failing
- "Pause and reflect" — slightly verbose
- "Check-in" — too casual, doesn't signal the cognitive work
- "Understanding conversation" — too long
- "Staying with it" — Haraway-inflected but possibly obscure to new users

The term "epistemic gate" can remain in the research/design vocabulary (domain model, essays, ADRs). The user-facing term in skill files and agent dialogue becomes "reflection time." The mapping is explicit: reflection time IS the epistemic gate, renamed for the audience that experiences it.

### Synthesis

The three threads converge into a concrete design:

**The Attend-Interpret-Decide cycle** replaces the fixed-template gate:

1. **Attend** — at gate time, the agent reads the conversation history for engagement signals: questions asked, concepts engaged with, challenges raised, connections made, approval patterns
2. **Interpret** — the agent forms a hypothesis: Is this user deeply engaged (building connections, challenging choices)? Adequately engaged (following along, some specificity)? Surface-engaged (approving without engaging)? Confused (contradictions, avoidance)?
3. **Decide** — the agent selects a pedagogical move:
   - Deep engagement → validate, build on their insight, ask a harder question, or explore an edge case together
   - Adequate engagement → probe: "You mentioned X — what makes that important for your case?"
   - Surface engagement → teach first: explain the most important choice in the artifact, why it matters, then ask for the user's take
   - Confusion → back up: clarify, address the misunderstanding, then re-approach
   - Disengagement → re-anchor: "What part of this connects most to what you're actually building?"

**The agent-as-teacher** is not a separate mode — it is what the agent does when the interpret step reveals a gap. Contingent teaching: diagnose → check → teach → check. The teaching happens *within* the gate conversation, not as a separate step.

**"Reflection time"** is the user-facing name. It signals: pause, think, reflect on what was produced. The agent introduces it naturally: "Before we move on — reflection time. [adaptive prompt based on attend-interpret-decide]."

**The Haraway connection:** "Staying with the trouble" is the philosophical ground for not rushing past difficulty. When the interpret step reveals confusion or surface engagement, the agent stays with it — explores the discomfort, teaches into the gap, sits with the uncertainty — rather than accepting approval and advancing. The gate becomes a place to stay with trouble, not a checkpoint to pass through.

## Question 2b: How should the gate resist sycophancy and productively challenge the user's assumptions?

**Method:** Web search (3 targeted searches, 1 deep paper fetch)

**Context:** The user observed that AI models are criticized for being overly validating, reinforcing implicit biases. Gates are an opportunity to subvert this — challenging assumptions and offering higher-perspective reframing ("have we considered solution D that solves this better than ABC?").

### Findings

#### 1. Sycophancy Is Structural, Not Incidental (2024-2025)

Recent research decomposes LLM sycophancy into three distinct behaviors (ICLR 2026):
- **Sycophantic agreement** — echoing factually incorrect user claims
- **Genuine agreement** — agreeing with correct claims
- **Sycophantic praise** — exaggerated flattery ("Great insight!")

These are mechanistically separable in model representations. Critically, "indiscriminate interventions against sycophancy can unintentionally suppress truthful alignment." The problem is not agreement per se but *uncritical* agreement — the model defers to the user's framing even when it has information suggesting a different view.

In educational contexts, sycophancy "can limit learning and entrench misconceptions." When LLMs are "prompted with perspectives from either side of a moral conflict, [they] affirm whichever side the user adopts in 48% of cases." This is the opposite of what a good teacher does.

**Implication for RDD:** The gate agent must distinguish between validating genuine understanding (good) and sycophantically agreeing with surface-level responses (bad). Rowe's finding applies: even positive evaluation ("Well done!") reduces response quality. The agent should build, probe, or challenge — not evaluate.

#### 2. Productive Challenge in Educational Dialogue

The devil's advocate approach in education aims to "challenge students' existing beliefs and assumptions in order to foster a better understanding about the complexity of the issue being studied." The classroom environment becomes one of "productive discomfort, not intimidation."

Key finding: "The back and forth nature of dialogue does not allow students to remain passive; rather, students feel a bit uncomfortable and are eager to hear what is next or want to get involved themselves." Challenge increases engagement rather than reducing it.

The Socratic method's core mechanism is **aporia** — the productive state of puzzlement where the learner realizes their existing understanding is insufficient. Socrates did not teach by explaining; he taught by questioning until the learner's assumptions collapsed, creating the space for genuine understanding.

**Implication for RDD:** The gate should sometimes induce aporia — not by being adversarial, but by surfacing tensions the user hasn't noticed. "The essay argues X, but your earlier research question assumed Y — how do you reconcile those?" This is already the Inversion Principle from the domain model, applied at the gate.

#### 3. Reframing: Stepping Outside the Problem Space

Design thinking research emphasizes **reframing** — questioning whether the problem as stated is the right problem. "Problem framing is about uncovering the actual problem worth solving — which is often hidden to everyone when the design process begins."

Reframing involves:
- Seeing the problem from multiple perspectives
- Deconstructing stakeholder beliefs and assumptions
- Breaking thought patterns to shift paradigms
- Looking beyond the obvious with curiosity

**Implication for RDD:** The gate agent has a unique vantage point — it has seen the full artifact corpus across the cycle. It can notice when the user's framing has narrowed. "The research explored technologies A, B, and C, but the domain model suggests the core problem is actually about X — have the artifacts been solving the right problem?" This is a higher-order move the agent is well-positioned to make because it holds the full context.

#### 4. Connection to Existing RDD Concepts

This thread connects to three existing domain model concepts:

- **Inversion Principle** — "systematically question assumptions before encoding them in architecture." Already cross-cutting (discover, decide, architect, play, synthesis). The gate is a natural sixth location.
- **Haraway's "staying with the trouble"** — resistance to comfortable resolution. Sycophantic agreement is the opposite: premature resolution through validation.
- **Rowe's wait time** — even positive evaluation reduces quality. The agent's instinct to praise is itself a form of sycophancy that the gate protocol should resist.

### Synthesis

The anti-sycophancy axis adds a fourth dimension to the gate design. The Attend-Interpret-Decide cycle from Q2 now includes a **challenge** move:

| User engagement | Agent response |
|----------------|---------------|
| Deep, specific, shows understanding | **Challenge**: surface a tension, apply the Inversion Principle, reframe |
| Adequate but shallow | **Probe**: ask for reasoning, specificity, connections |
| Thin or generic | **Teach**: explain the key choice, then ask for the user's take |
| Confused or contradictory | **Clarify**: back up, address the misunderstanding |
| Disengaged | **Re-anchor**: connect to what they're actually building |

The key insight: **challenge is the response to deep engagement, not to poor engagement.** When the user is genuinely engaged, the most productive move is not to validate — it is to push further. "You've articulated the architecture clearly. Now: what's the weakest part? Where does this break?" The user who has built genuine understanding can handle the challenge and will learn more from it than from praise.

For the reframing move specifically, the agent can draw on the full artifact corpus: "The research found X, but the domain model emphasized Y, and the scenarios assume Z — are all three aligned? Is there a different frame that resolves the tension?" This is a move only the agent can make, because it holds the cross-phase context that the user may have lost across sessions.

This also resolves an asymmetry in the current gate design: gates currently treat all users the same regardless of engagement depth. The adaptive model treats deep engagement as the opportunity for the *hardest* questions — not the easiest pass-through.
