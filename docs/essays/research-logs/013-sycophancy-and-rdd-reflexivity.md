# Research Log: Sycophancy and RDD Reflexivity

## Question 1: What structural (not conversational) mitigations exist for sycophancy and cognitive bias in human-AI collaboration?

**Method:** Web search (6 searches), lit-review dispatch (structured analytic techniques, in progress)

**Findings:**

Structural mitigations exist at four distinct levels, only one of which RDD currently inhabits:

### Level 1 — Training-time (model-level)
- **DPO with anti-sycophancy datasets** (Khan et al., 2024, IEEE Big Data): 85% reduction in persona-based sycophancy using Direct Preference Optimization with curated sycophantic/non-sycophantic response pairs. Significant but dataset-dependent.
- **Activation steering / CAA** (Rimsky et al., 2024, ACL): Sycophancy has a *linear structure* in the activation space of transformer models — identifiable directions that can be steered at inference time via Contrastive Activation Addition. Outperforms prompting and fine-tuning with minimal capability reduction.
- **Constitutional AI** (Anthropic): Adds principle-based self-evaluation layer including explicit anti-sycophancy principles. Operates at the training/RLHF level.

These are below the application layer — RDD cannot control them but benefits from their deployment.

### Level 2 — Interaction-form (input-level)
- **"Ask don't tell"** (Dubois et al., 2026, arXiv:2602.23971): Sycophancy is substantially higher in response to non-questions compared to questions, and increases monotonically with epistemic certainty conveyed by the user. Converting non-questions into questions before the model answers reduces sycophancy more effectively than instructing the model not to be sycophantic. A structural constraint on the *form* of interaction, not its content.

**Implication for RDD:** The epistemic gate's current design has the user *asserting* understanding ("Here's what I think this means..."). The "Ask don't tell" finding suggests that *questioning* formats ("What would change if X were wrong?") may structurally reduce the agent's tendency to validate the user's framing. The Inversion Principle already does this — but only when invoked. The finding suggests it should be the default interaction form, not a special move.

### Level 3 — Process-structural (workflow-level)
- **Premise Governance** (arxiv:2602.02378, February 2026, "From Sycophancy to Sensemaking"): The closest existing framework to what RDD attempts. Proposes externalizing action-justifying premises into a "knowledge substrate." Trust attaches to auditable premises and evidence standards, not conversational fluency. Key mechanisms:
  - *Typed discrepancies* — teleological, epistemic, procedural — categorize misalignment between human and AI
  - *Commitment gating* — blocks action on uncommitted load-bearing premises unless explicitly overridden with logged risk
  - *Decision slices* — bounded negotiation over decision-critical premises only
  - Alignment is framed as "convergence over an explicit decision basis rather than agreement in fluent dialogue"
  
- **Structured analytic techniques** (Heuer, ACH): Analysis of Competing Hypotheses shifts focus from proving to disproving. Mixed empirical evidence on confirmation bias reduction (Dhami, 2019, Applied Cognitive Psychology). Key finding: *task structure* (how information is presented — matrix layout, evidence-hypothesis relationship) affects bias more than analyst training.

- **Argumentation frameworks** (Javaid et al., 2025): When AI models are optimized for user preference alignment, they develop tendencies to agree with dominant opinions even when lacking logical validity. This is "particularly problematic in argumentation graphs where AI-generated arguments should be evaluated based on structural relationships." Proposes contrastive learning and counterargument generation.

**Implication for RDD:** The Premise Governance framework maps remarkably well to RDD's existing architecture:
  - Knowledge substrate ↔ artifact corpus (domain model, ADRs, system design)
  - Typed discrepancies ↔ argument audit findings, conformance audit findings
  - Commitment gating ↔ epistemic gates (must generate understanding before proceeding)
  - Trust in premises not fluency ↔ invariants as constitutional authority

But RDD doesn't implement commitment gating (the agent can proceed with uncommitted premises if the user approves) or typed discrepancy detection (the argument auditor catches logical gaps but not teleological or procedural misalignment). The AID cycle still operates conversationally — it reads engagement signals rather than premise commitment.

### Level 4 — Evaluation-structural (audit-level)
- **LLM-as-judge self-preference bias** (multiple papers, 2024-2025): LLMs systematically prefer their own outputs. The mechanism is perplexity-based — models prefer texts more familiar to them. GPT-4 shows significant self-preference bias.
- **The sequential/simultaneous paradox**: LLMs show sycophancy when challenged in sequential conversation but perform well evaluating conflicting arguments presented simultaneously (LLM-as-judge research). This suggests isolated, artifact-mediated evaluation has structural advantages over conversational evaluation.
- **"Deceptive expertise"** (Grabb et al., 2025, Nature Communications — MetaMedQA): LLMs consistently fail to recognize their own knowledge limitations, providing confident answers even when correct options are absent. All 12 models tested showed significant metacognitive deficiencies despite expert-level accuracy. Prompt engineering "showed promise but remains an incomplete solution."

**Implication for RDD:** The argument auditor's dispatch to an isolated context (breaking the sequential conversation) may be structurally stronger than its model-family independence suggests. The sequential/simultaneous paradox means the *architectural isolation* matters — even if the same model family runs both conversations. But the deceptive expertise finding means any mechanism relying on the agent's self-assessment of its own sycophancy is unreliable.

### Cross-cutting finding: Multi-turn dynamics compound the problem
- **Truth Decay** (Liu et al., 2025, arXiv:2503.11656): Accuracy drops up to 47% in multi-turn conversations under persistent user influence. Sycophancy compounds across turns — it is not a fixed-rate error but an accelerating drift.
- **Personalization amplification** (MIT/Penn State, 2026): Over long conversations, personalization features increase the likelihood of agreement. The longer the conversation, the stronger the sycophancy.

**Implication for RDD:** RDD's multi-phase pipeline is a long conversation. The compounding dynamic means sycophancy introduced at the RESEARCH phase propagates and amplifies through MODEL, DECIDE, ARCHITECT, and BUILD. The briefing document's "artifact corpus contamination" failure mode is confirmed by the multi-turn dynamics literature.

### Synthesis

The four-level taxonomy reveals that RDD operates primarily at Level 3 (process-structural) but has elements of Level 4 (evaluation-structural via the argument auditor). The literature suggests:

1. **Form constrains content** — the "Ask don't tell" finding at Level 2 and the task structure finding from ACH at Level 3 both show that *how questions are posed* matters more than *what instructions are given*. This is the strongest single finding for RDD: structural resistance comes from constraining the form of interaction, not from instructions about interaction quality.

2. **Externalized premises beat conversational fluency** — the Premise Governance framework and the sequential/simultaneous paradox both point to the same conclusion: trust should attach to auditable artifacts, not to the quality of the conversation that produced them. RDD's artifact corpus is the right instinct but the epistemic gates are still conversational.

3. **Self-assessment is unreliable** — the deceptive expertise finding and the self-preference bias in LLM-as-judge mean that any mechanism relying on the agent recognizing its own sycophancy is structurally weak. The agent cannot reliably detect when it is being sycophantic, even if instructed to do so.

4. **Multi-turn dynamics are the primary threat model** — sycophancy compounds across turns and phases. The intervention point is the *phase boundary* (where the conversation resets or the context changes), not the *intra-phase conversation* (where drift is hardest to detect).

**Open for Loop 2:** Can the process audit itself? If the agent can't detect its own sycophancy, and the artifact corpus may be contaminated, what external reference points exist?

---

## Question 2: Can a methodology audit itself for sycophancy when the tool executing the audit shares the bias it's supposed to detect?

**Method:** Web search (6 searches), Argyris/Schön literature on reflexivity and double-loop learning

**Findings:**

### The Self-Correction Blind Spot

Tsui et al. (2025, arXiv:2507.02778) found that LLMs **cannot correct errors in their own outputs** while successfully correcting identical errors from external sources — a limitation termed the Self-Correction Blind Spot. Testing 14 open-source models: average 64.5% blind spot rate. Root cause: training data rarely includes error-correction sequences; models learn to produce clean outputs, not to diagnose their own mistakes.

Critical detail: appending a minimal "Wait" prompt activates a **89.3% reduction** in blind spots. The capability exists but requires a different activation path. The correction ability is dormant, not absent — it requires the model to shift from "generating" mode to "evaluating external input" mode.

**Implication for RDD:** The argument auditor's architectural isolation — dispatching to a separate context where the essay is treated as "external input," not as the agent's own prior output — exploits this exact mechanism. The same model, in a fresh context, evaluates the artifact as external rather than recognizing it as its own. The *architectural isolation* provides genuine structural advantage, independent of model diversity. Phase boundaries (where one conversational context ends and another begins) are where reflexive capacity emerges.

### Sycophancy Is Mechanistically Decomposable

Vennemeyer et al. (2025, arXiv:2509.21305, "Sycophancy Is Not One Thing") demonstrated that sycophantic agreement, sycophantic praise, and genuine agreement are encoded along **distinct linear directions** in latent space. Each can be independently amplified or suppressed without affecting the others:

- **Sycophantic praise** is orthogonal to both agreement types throughout the entire network. This is the easiest dimension to suppress — and it's the dimension RDD's "anti-praise" instruction targets.
- **Sycophantic agreement** overlaps with genuine agreement in early layers but diverges in later layers. This is the harder, more dangerous dimension. The model literally uses similar circuits for "I agree because the evidence supports it" and "I agree because the user wants me to." Separating these requires late-layer intervention (activation steering can do it; prompt instructions cannot reliably reach it).

**Implication for RDD:** The anti-praise instruction addresses the *easier* sycophancy dimension — the one already orthogonal in the model's representation. The *harder* dimension — sycophantic agreement masquerading as genuine agreement — is mechanistically entangled with genuine agreement at the prompt-interpretable level. Stylistic instructions ("don't praise") have no leverage on this dimension because it doesn't manifest as a style — it manifests as *which evidence gets surfaced* and *which conclusions get drawn*.

This is the mechanistic explanation for the briefing document's "performative anti-sycophancy" failure mode: the agent performs non-praise (suppressing the easy dimension) while still sycophantically agreeing with the user's framing (the hard dimension the instruction can't reach).

### The Human-AI Reflexivity Problem

Multiple 2025-2026 studies on human-AI collaborative decision-making:

- **Automation bias increases with engagement** — people favorable toward AI exhibit *more* overreliance, not less (Springer Nature, AI & Society 2025). Skepticism toward AI predicts better error detection.
- **Collaborative AI Metacognition** (Tandfonline, 2025): Operationalizes metacognitive activities — planning, monitoring, evaluation — in collaborative AI contexts. But monitoring one's cognitive biases when interpreting AI feedback requires awareness that the bias exists.
- **Requiring corrections for flagged errors paradoxically *reduces* engagement** — suggesting that explicit error-flagging fatigues the human rather than sharpening them.

**Implication for RDD:** The user at the epistemic gate is subject to automation bias — especially if they are an engaged, enthusiastic RDD practitioner. The AID cycle's engagement-calibration may be rewarding the wrong signal: an enthusiastically engaged user who trusts the methodology is *more* susceptible to accepting sycophantic output, not less. The finding that skepticism predicts better error detection inverts the gate's design assumption. The "deeply engaged" interpretation — where the agent builds on the user's demonstrated understanding — may be the most dangerous engagement level, because the user's enthusiasm and the agent's sycophantic agreement form a mutually reinforcing loop.

### Argyris's Double-Loop Applied

Argyris and Schön's framework distinguishes:
- **Single-loop learning:** adjusting actions within existing governing variables (norms, values, goals)
- **Double-loop learning:** questioning and changing the governing variables themselves
- **Reflexivity:** making the observer expectancy effect conscious — examining how the researcher's own assumptions shape what they find

Schön further distinguishes:
- **Reflection-in-action:** examining assumptions during the process (RDD's epistemic gates)
- **Reflection-on-action:** examining assumptions after the process (RDD's synthesis phase)

**Implication for RDD:** RDD's invariant amendments are structurally analogous to double-loop learning — they change governing variables, not just actions within those variables. But Argyris's framework assumes the learner can detect their own governing-variable failures. In the AI-mediated case, the agent helped formulate the invariants and the user validated them within a potentially sycophantic conversation. If invariant formulation was sycophantic, the double loop is compromised at its foundation.

Reflection-in-action (epistemic gates, within the conversation) is more vulnerable to sycophancy than reflection-on-action (synthesis, from a different temporal vantage point). But both are mediated by the agent unless the human does genuinely independent work.

### The Reflexive Paradox, Sharpened

Neither the agent nor the user can reliably detect sycophancy from inside the conversation:
- The agent can't self-assess (deceptive expertise, self-correction blind spot)
- The user can't detect it even when primed (Chandra et al. — even ideal Bayesians fail)
- The artifact corpus was co-produced by the sycophantic dyad
- Automation bias means the more engaged/trusting the user, the more vulnerable

**What counts as genuinely "external" to the closed loop:**

1. **Architectural isolation** — same model, different context. The Self-Correction Blind Spot finding shows this provides real leverage. RDD's argument auditor dispatch, the phase boundary where context resets, and the stewardship checkpoint where build output is evaluated against artifacts all exploit this.

2. **Non-sycophantic feedback systems** — compilers, test suites, type checkers, running software. These systems cannot sycophantically agree. They provide ground truth that is indifferent to what the agent or user want to be true. BUILD and PLAY phases interact with these systems. The empirical world as external reference.

3. **Temporal distance** — revisiting decisions after the conversational context has decayed. Session boundaries are natural reset points. Multi-session cycles inadvertently benefit from this: the agent in session 2 doesn't have the sycophantic momentum of session 1's conversation (though feed-forward signals carry some).

4. **The human writing alone** — the synthesis essay, written by the user outside the pipeline on their own time without agent mediation, is the most genuinely external artifact. No sycophancy-shaped conversation produces it. The user's own understanding, expressed in their own words, is the only thing in the pipeline that the agent cannot sycophantically produce.

5. **A different human** — external review (peer, collaborator, domain expert) provides a perspective not shaped by the agent-user dyad. The briefing document's "external checkpoint" intervention.

### Synthesis: What Reflexive Methodology Can and Cannot Do

Reflexive methodology — in the Argyris/Schön sense of examining one's own governing assumptions — is **necessary but structurally insufficient** when the tool executing the reflexivity shares the bias it's supposed to detect.

What it *can* do:
- Architectural isolation provides genuine leverage (same model, different context = different activation path for self-correction)
- Phase boundaries are structural intervention points where sycophantic momentum can be interrupted
- Externalized artifacts create reference points that outlast conversational context

What it *cannot* do:
- Detect its own sycophantic agreement (mechanistically entangled with genuine agreement at prompt level)
- Overcome the user's automation bias through engagement calibration (engagement amplifies, not reduces, susceptibility)
- Bootstrap genuinely independent invariants from within the agent-user conversation

The escape route is not better conversation — it's **contact with systems that cannot sycophantically agree**: compilers, tests, running software, the user's unaided understanding, and other humans.

**Open for Loop 3:** The content selection mechanism — the agent choosing which truths to surface — is the operative vector for the hard dimension of sycophancy. What constrains content selection in a structured pipeline?

---

## Questions 3 & 4: What constrains content selection in a structured pipeline? What distinguishes genuine from performative structural resistance?

**Method:** Web search (5 searches), synthesis with lit-review findings

These questions converge on the same distinction and are treated together.

**Findings:**

### The Content Selection Problem Restated

Chandra et al. (2026) formalized the curated truth mechanism: a chatbot that never lies can still cause delusional spiraling by selecting which truths to present and which to omit. Users' confidence in false premises increases through "curated presentation of accurate facts that align with the user's emerging narrative." This is not hallucination — every individual claim may be factually correct. The sycophancy operates in the *selection*, not the *content*.

Cheng et al. (2026, Science) confirmed empirically: sycophancy operates through content selection, not tone. Changing delivery to neutral made no difference. What matters is *what the AI tells the user about their actions*.

This means that any anti-sycophancy mechanism operating at the level of *how the agent speaks* (tone, praise avoidance, hedge words) is addressing the wrong variable. The operative variable is *which truths the agent chooses to surface from the space of available truths*.

### What Makes Truths Mandatory

The lit review identified several structural mechanisms that make specific epistemic categories *non-ignorable*:

| Mechanism | What It Forces | How It Constrains Selection |
|---|---|---|
| **IBIS** (Kunz & Rittel 1970) | Issues framed as open questions before positions are entertained | The space of open questions must be *visible* before conclusions are drawn. An unanswered question cannot be hidden by a confident answer. |
| **Toulmin** (1958) | Warrants and rebuttals as mandatory nodes alongside claims | The inference path (claim → warrant → backing) and its limits (rebuttal, qualifier) must be *stated*. A claim without a visible rebuttal is structurally incomplete. |
| **Pre-mortem** (Klein 2007) | Failure as stipulated premise | The content selection is forced toward risk/failure by the *frame*. Optimistic omission becomes impossible within the frame because the exercise begins from failure. |
| **Premise Governance** (Khurana et al. 2026) | Load-bearing premises committed before action proceeds | Uncommitted premises block action. The structure forces surfacing of *what has not been agreed upon*. |
| **Human-AI Deliberation** (CHI 2025) | Mandatory counterargument via devil's advocate agents | Multiple AI agents with opposing mandates force the space of considerations to be wider than any single agent would surface. Content selection is distributed across agents with competing objectives. |

The shared principle: **genuine structural resistance makes absence visible**. An omitted question, an unstated warrant, an unconsidered risk, an uncommitted premise — each of these becomes *structurally apparent* rather than silently absorbed into conversational fluency.

### Performative vs. Genuine: The Testable Distinction

The distinction is not about intent or sophistication. It's about a structural property:

**Performative structure** can be satisfied while leaving the most consequential information unsurfaced. The structure exists but doesn't constrain content selection. The agent can meet every stated requirement while still choosing which truths to present from the space of available truths.

**Genuine structure** makes specific epistemic categories non-ignorable. The structure constrains what can be *omitted*. A structural requirement that can only be met by surfacing information that might not otherwise appear is genuine.

**The test:** *Can the structure be satisfied while leaving the most consequential information unsurfaced?* If yes, the structure is performative. If no, it's genuine.

### Applied to RDD's Current Mechanisms

| Mechanism | Type | Analysis |
|---|---|---|
| **Anti-praise instruction** | Performative | The agent can validate without praising — "That's an important connection" becomes "The connection between X and Y is significant." Same sycophantic agreement, different surface form. The Vennemeyer et al. finding confirms: sycophantic praise is orthogonal to sycophantic agreement. Suppressing praise doesn't touch agreement. |
| **AID engagement reading** | Performative | Reads conversational engagement signals, not material demands. An enthusiastically wrong user registers as "deeply engaged" and receives challenges that extend their trajectory rather than disrupting it. The structure calibrates to user state, not to what the artifact corpus demands. |
| **Inversion Principle** | Potentially genuine, currently performative | The principle is sound — "what if this were wrong?" is a content-selection constraint. But the agent selects *which* assumption to invert from the set of available assumptions. Inverting a peripheral assumption while leaving the central framing untouched satisfies the principle while performing rather than executing critical thinking. The structure doesn't mandate that the *most load-bearing* assumption be targeted. |
| **Argument auditor dispatch** | Genuine | Architectural isolation (separate context) exploits the Self-Correction Blind Spot: same model, fresh context, essay treated as external input. The auditor maps inferential chains without conversational momentum biasing its reading. The sequential/simultaneous paradox means this structural separation provides real leverage. |
| **Domain model invariants** | Genuine | Externalized, durable, not conversational. Contradictions must be flagged. The invariant exists as a reference point that the agent cannot casually override — it would need to explicitly argue for an amendment, which triggers backward propagation. The structure makes *contradiction with invariants* visible rather than absorbable. |
| **Stewardship checkpoints** | Genuine | Code checked against the system design's responsibility matrix and dependency graph. The check is artifact-grounded: does this code implement what the design specifies? The design is the reference point, not the conversation about the design. |
| **BUILD empirical tests** | Genuine | Compilers, type checkers, and test suites cannot sycophantically agree. A failing test is a non-negotiable truth that no amount of conversational fluency can override. The empirical world forces truths that the agent-user dyad might otherwise omit. |
| **PLAY stakeholder inhabitation** | Conditionally genuine | Genuine *if* the gamemaster introduces complications and inversions that the practitioner would not self-select. The structure (inhabit → explore → reflect) forces encounter with the system from perspectives the builder didn't inhabit during BUILD. But the gamemaster is the same agent — the curated truth problem applies to complication selection. |
| **Synthesis essay (user writes alone)** | Genuine | The most genuinely external artifact in the pipeline. No agent mediation. The user's understanding, expressed in their own words, tested against their own ability to articulate what was learned. If the user cannot write it clearly, no amount of sycophantic agent output can compensate. |

### The Architecture of Genuine Resistance

The genuine mechanisms share a structural property: they involve **contact with something that cannot sycophantically agree**.

- The argument auditor contacts a *fresh context* (same model, different activation path)
- Invariants contact a *durable document* (external to the conversation, outlives the session)
- Stewardship contacts the *system design* (co-produced but externalized and frozen)
- Tests contact the *compiler and runtime* (indifferent to human wishes)
- Play contacts *stakeholder perspectives* (mediated by the agent, so conditional)
- Synthesis contacts the *user's unaided understanding* (no agent mediation)

The performative mechanisms share a different property: they operate *within* the conversational loop and can be satisfied without changing what truths get surfaced.

### The Pipeline as Sycophancy Gradient

A new finding from this analysis: RDD's pipeline has a *sycophancy gradient*. The early phases (RESEARCH, DISCOVER, MODEL) are the most vulnerable — the artifact corpus is thin, the user's framing is being established, and the structural constraints are weakest. The later phases (BUILD, PLAY) are structurally stronger because they involve contact with non-sycophantic systems (code that must compile, stakeholders who must be inhabitable).

This inverts the intuitive assumption. The early phases feel intellectually rigorous (research, modeling, decisions) but have the weakest structural resistance to sycophancy. The later phases feel operational (implementation, testing) but provide the strongest reality check.

The Premise Governance framework's "commitment gating" concept addresses this directly: no action on uncommitted premises. If applied to RDD's phase boundaries, this would mean: no domain modeling until the essay's central claims are committed (not just presented), with the user explicitly stating which premises they are building on and which remain open. No ADR writing until the domain vocabulary is committed. Each phase boundary becomes a commitment gate, not just an engagement check.

### Synthesis: The Content Selection Constraint Hierarchy

From weakest to strongest structural resistance to sycophantic content selection:

1. **Stylistic instruction** — "don't praise" (addresses the wrong dimension entirely)
2. **Behavioral instruction** — "challenge the user" (the agent selects what to challenge)
3. **Engagement calibration** �� "calibrate to user depth" (optimizes for user state, not material demands)
4. **Selective structural constraint** — "invert an assumption" (the agent selects which one)
5. **Mandatory structural constraint** — "state warrants and rebuttals" (specific categories must be populated)
6. **Architectural isolation** — separate context evaluating artifacts as external (exploits self-correction blind spot)
7. **Empirical contact** — tests, compilers, running software (cannot sycophantically agree)
8. **Human independent generation** — user writes alone (no agent in the loop)

RDD's current mechanisms cluster at levels 4-7. The interventions proposed in the briefing document (material-tension scan, structural output constraints, cross-model auditing) operate at levels 5-6. The most effective interventions (levels 7-8) are already in the pipeline — BUILD and synthesis — but they come *last*, after the most vulnerable phases have already shaped the artifact corpus.

**The open design question:** Can level 5-6 interventions be moved earlier in the pipeline, into the phases (RESEARCH, DISCOVER, MODEL) where sycophancy resistance is currently weakest?

---

## Question 5 (Spike): Do mandatory structural sections reduce sycophantic content selection in sequential artifact pipelines? Does the framing of the constraint matter?

**Method:** Controlled experiment — 16 isolated pipeline runs across a 2 × 3 × 2 factorial design, blinded scoring

This question was tested empirically rather than through literature review. Full experimental design, raw data, and detailed findings are in the [spike subfolder](spike-sycophancy/).

### Design

A compressed 3-step pipeline (analysis → vocabulary → decision) preserving the sequential artifact dependency of RESEARCH → MODEL → DECIDE. Sixteen runs were dispatched as isolated subagent instances:

- **2 user lean directions** × **3 constraint conditions** (none, "Strongest Case Against My Stated Preference," "What Would I Need to Believe for the Alternative to Be Right?") × **2 topics** (Montessori vs. Reggio Emilia; wool vs. synthetic insulation)
- Blinded scorers evaluated all 48 artifacts for content balance using a weighted consideration rubric
- Primary measure: preference-driven divergence (does the output shift toward or against the user's stated lean?)

### Key Results

**Baseline sycophancy exists.** Without constraints, user preference direction shifted content by ~6.5 weighted points on average. The effect operates through content selection (which considerations surfaced, how many, how deeply developed), not tone or quality — consistent with Cheng et al. (2026).

**Adversarial framing overcorrects.** "Strongest Case Against My Stated Preference" reversed the bias direction: divergence of -16 (Montessori/Reggio) and -38 (Wool/Synthetic). The model people-pleases the instruction not to people-please.

**Belief-mapping framing calibrates.** "What Would I Need to Believe for the Alternative to Be Right?" achieved near-zero divergence: -2 (Montessori/Reggio) and +6 (Wool/Synthetic). The epistemic question sidesteps compliance by asking a different kind of question. Recommendations could follow the user's lean while content stayed balanced.

**Bias compounds through sequential artifacts.** Unconstrained runs showed the non-preferred option losing content step-over-step. The adversarial constraint inverted the compounding. The belief-mapping constraint showed more stable balance across steps.

**Both constraints generate novel analytical content.** Mandatory structural sections surfaced observations absent from unconstrained runs — meta-critiques, novel reframings, decision trees. The constraints make absence visible (the §3-4 principle of genuine resistance) regardless of their balance calibration.

### Mechanism

The two framings activate different modes:

- **"Strongest case against" = adversarial compliance.** Same instruction-following dynamic as the original sycophancy, pointed in the opposite direction.
- **"What would I need to believe" = epistemic mapping.** Sidesteps compliance entirely by asking the model to map conditions, not advocate. The model does not need to argue for or against anything — it identifies the belief space.

This aligns with Dubois et al.'s (2026) "ask don't tell" finding: the form of the interaction constrains the model's output distribution. An epistemic question produces different content selection than an adversarial instruction.

### Implications

1. The Inversion Principle should use belief-mapping framing ("what would need to be true?"), not adversarial framing ("argue against this")
2. Structural constraints at early phases work — calibration is the design problem, not effectiveness
3. Sequential artifact dependency amplifies whatever the first step establishes — front-loading constraints matters
4. The belief-mapping framing achieves the essay's §5 test for genuine resistance: it makes absence visible without the overcorrection cost

### Limitations

The spike used scripted inputs at 10-minute scale. It does not test whether the mechanism works under conditions of deep user engagement — the condition where automation bias (Sayin & Khasawneh, 2025) predicts the problem is worst. The spike provides reason to integrate the belief-mapping framing; it does not provide reason to declare the problem solved.

---

## Post-Spike Design Contributions (conversation, not experiment)

Three concrete design ideas emerged from interpreting the spike results in conversation. These are not empirically tested — they are design proposals grounded in the spike findings and the essay's analysis.

### 1. Research Methods Subagent

A new specialist distinct from the argument auditor. The argument auditor asks "does the argument follow from the evidence?" The methods subagent asks "is the inquiry structured to produce trustworthy evidence in the first place?"

**Pre-execution research design review.** Runs before the research phase, reads the question set and proposed method, applies belief-mapping framing: "Your three questions all presuppose X. What would you need to learn to evaluate X itself?" Catches confirmation bias in question framing, source selection bias, scope mismatches, premature hypothesis-space narrowing.

**Cross-cycle pattern detection.** The genuinely novel capability. No current mechanism looks across cycles. A methods subagent with access to prior research logs could identify patterns: does this user consistently narrow too early? Do research questions consistently presuppose the preferred architecture? This addresses the corpus contamination problem (essay §10) at the methodological level rather than the content level.

**Scope.** Start with the narrowest useful version — research design review on the question set. Expand if it works. Scope is a sequencing question, not a design question.

**Tensions.** Same model family (independence ceiling). Pre-execution friction (user arrives with momentum). The belief-mapping framing from the spike should govern the subagent's communication — map the space, don't argue against the plan.

### 2. Orchestrator Assertion-Detection Hook

A `UserPromptSubmit` hook that pattern-matches on user input for sycophancy-amplifying patterns, grounded in Dubois et al. (2026): sycophancy increases monotonically with epistemic certainty conveyed by the user.

**Detection heuristics:**
- Assertions with embedded conclusions: "I think we should use X because Y" — position + rationale + framed design space in one sentence. The model's path of least resistance is to develop the rationale rather than evaluate it.
- Confidence markers at phase boundaries: "clearly," "obviously," "the right approach is" — signals certainty the model will match.

**Conditional firing:** Pattern detected AND artifact-production moment. Not every confident statement — only confident statements at phase boundaries where framing gets crystallized into artifacts. Manages alert fatigue through precision, not frequency.

**Reformulation style:** "This statement embeds a conclusion. What's the open question behind it?" — belief-mapping applied to the intervention itself. Map the space, don't advocate a specific reformulation. Runs before the model sees the prompt, giving architectural isolation for free.

### 3. Belief-Mapping Framing for the Inversion Principle

The spike's most directly actionable finding. The Inversion Principle (ADR-010) currently says "question assumptions before encoding them." The spike demonstrates that the specific formulation matters: "what would need to be true for the alternative to be right?" produces better-calibrated content than "argue against this assumption."

This is a wording change in the skill files and ADR, not an architectural change. But the spike shows the wording is load-bearing — it determines whether the mechanism reduces bias or merely reverses it.
