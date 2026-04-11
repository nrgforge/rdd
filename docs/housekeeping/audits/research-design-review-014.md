# Research Design Review: Cycle 10 (Specification-Execution Gap)
*2026-04-06*

## Reviewer summary

The two-track design is stronger than most question sets that arrive here — the Track C framing genuinely opens the premise rather than pretending to while actually defending it. The primary concern is that Track A contains one embedded conclusion severe enough to bias a research outcome (A2 presupposes hook enforcement as the answer to a question that hasn't been asked yet), and the implicit third framing is not covered by either track in a way that would produce actionable findings. The question set is worth running with targeted adjustments.

---

## Per-question audit

### Track A

---

#### A1: "How far can prompt-based structural constraints be pushed before mechanical enforcement becomes necessary?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that "mechanical enforcement" is a single, well-defined category — that the alternative to prompt-based constraints is clearly hook-based or runtime-blocking enforcement. The question frames the problem as a dial from "soft" to "hard" enforcement, with mechanical enforcement as the terminal end. A more productive question could be: "What are the distinct mechanisms by which constraints can be made more reliable, and what are the tradeoffs between them?" That question allows mechanical enforcement, redundancy, environmental scaffolding, and composition patterns to emerge as alternatives rather than assuming the continuum.

Additionally, the question assumes enforcement is the response dimension to vary. What if the response dimension is *verification* — not preventing failure but detecting and surfacing it faster? That's a different framing and would produce different research.

**Embedded conclusions.** Mild flag. "Before mechanical enforcement becomes necessary" presupposes that mechanical enforcement is the successor state — that the answer to finding the ceiling of prompt-based constraints is to cross to mechanical enforcement. The question doesn't consider that the ceiling may be found to be *adequate* at current mechanism count, or that the successor state might not be enforcement at all.

Suggested reformulation: "What determines when prompt-based structural constraints fail, and what design responses have been found effective when they do?"

This preserves the core research need (understanding limits) while keeping the response space open.

**Scope:** Appropriate. The question is grounded directly in the failure evidence and is the right level of abstraction for a lit review.

---

#### A2: "Which Cycle 9 mechanisms are good candidates for hook enforcement vs. which must remain in skill text?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that hooks are the correct enforcement mechanism for all or most of the gap. The question takes the hook-as-forcing-function idea from Issue #9's Design Directions section — a list of proposals, not findings — and treats it as an established conclusion before the research has run.

ADR-033 is instructive here: it describes a hook architecture for *cross-cutting concerns* that fire *passively at event boundaries*. ADR-033's five hooks are: invariant reminder (PreToolUse on Write/Edit), epistemic gate enforcer (Stop), skill activator (UserPromptSubmit), orientation trigger (PostToolUse on key artifacts), document sizing check (PostToolUse). These address *workflow events*, not *protocol compliance during task execution*. The Type 1 and Type 2 failures in Issue #9 are not workflow-event failures — they are task-immersion failures. Hook architecture as designed in ADR-033 does not straightforwardly address these. Susceptibility Snapshot was dropped not because no hook fires at phase boundaries — there is an epistemic gate enforcer — but because protocol awareness degraded. A new hook saying "run snapshot" would face the same degradation.

This question presupposes hooks are the right layer. It also presupposes that the mechanism-to-layer assignment is the right unit of analysis (vs. asking what type of failure each mechanism exhibits and what interventions are commensurate with that failure type).

**Embedded conclusions.** Flagged. "Hook enforcement vs. skill text" is a binary that maps directly onto one proposed design direction in the issue, promoted to a research question before investigation. This is an embedded conclusion about the solution architecture.

Suggested reformulation: "For each Cycle 9 mechanism that failed, what properties of the failure mode (event-boundary, task-immersion, moment-recognition, silent-fallback) determine what class of intervention is appropriate?"

This opens the question to hooks, redundancy, fail-loud design, scaffolding, or other interventions depending on what the failure analysis reveals.

**Scope:** Too narrow. This is an implementation-planning question masquerading as a research question. It belongs in DECIDE if the research phase concludes that hook enforcement is appropriate. Running it in round 1 research risks short-circuiting the more important question of whether hooks address these failure types at all.

**Recommendation:** Adapt or defer. If kept, reformulate as above. If deferred to DECIDE (its natural home), replace with a question that investigates what properties of failures determine appropriate intervention classes.

---

#### A3: "What telemetry would make silent failures (e.g., subagent fallback) visible?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

That silent failures are primarily a visibility problem — that if you could see them, you'd know how to respond. A different question would be more productive if the researcher believed that visibility is necessary but not sufficient: detecting a silent fallback is only useful if the agent or user has a response protocol. The more productive question might be: "What architectural properties prevent silent fallback from occurring vs. what telemetry makes it visible after it occurs, and are these alternatives or complements?"

**Embedded conclusions.** None flagged. The question is appropriately scoped and non-presuppositional about the answer.

**Scope:** Appropriate. Silent fallback (Issue #9 item 4) is a specific, concrete failure mode. Scoping telemetry research to this failure mode is focused and justified.

---

#### A4: "How should the methodology handle Type 2 trigger-recognition failures where the rule exists but the moment isn't recognized?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

That trigger-recognition is a methodology design problem rather than a model capability problem. The question frames it as something the methodology can handle — implying the design has leverage here. A different question would be more productive if trigger-recognition failure is primarily a model capability limitation: "What is the current state of research on in-context trigger recognition in instruction-following models, and at what model capability level does rule-fire reliability improve enough to change the design response?"

That question might reveal that this is not solvable at the methodology layer at the current model generation, which would substantially change the design response.

**Embedded conclusions.** Mild flag. "How should the methodology handle" presupposes the methodology can handle it effectively. The question doesn't consider "should the methodology acknowledge this as a known-failure mode with no current fix and document accordingly?"

Suggested reformulation: "What does the literature say about in-context trigger-recognition reliability, and what design responses have been found to reduce trigger-recognition failure rates in instruction-following systems?"

**Scope:** Appropriate. The reformulation is minor; the core question is sound.

---

#### A5: "Is there literature on 'specification-execution gap' in prompt engineering, instruction-following degradation under task load, or agent self-policing reliability?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

That the problem is well-described by existing prompt engineering literature. A more productive question might exist if the relevant literature is actually in software engineering (specification-implementation gap, design-by-contract, runtime assertions), organizational systems (protocol compliance under cognitive load), or human factors (attention degradation under task demands). These fields likely have more mature treatments of "specification exists, execution diverges" than prompt engineering, which is young and primarily empirical.

**Embedded conclusions.** None flagged. The question correctly spans multiple literature areas.

**Scope:** Appropriate, though the framing on "prompt engineering" specifically may be narrower than the actual literature landscape. The question hedges this with the alternatives listed.

---

### Track C

---

#### C1: "Does the six-failure dataset support a structural interpretation specifically, or could the same data support pedagogical, attention-budget, or observability-first interpretations? What evidence would distinguish between them?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

That the interpretations are separable from the data — that a coherent evidential argument can determine which interpretation the six failures support. The more productive question would matter if the interpretations are not actually competing but are complementary perspectives on the same failure process. In that case, the question "which interpretation does the data support?" has no determinate answer, and the productive question is "what does each interpretation imply for intervention design, regardless of which is 'correct'?"

**Embedded conclusions.** None flagged. The question explicitly holds the interpretation open and asks for evidence that would distinguish between them. This is good research design.

**Scope:** Appropriate. This is exactly the right framing for examining Track A's premise.

---

#### C2: "Is six failures in one day on one codebase under one user a population sufficient to ground hook-design decisions? What's the base rate of mechanism firing across all Cycle 9 sessions?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

That statistical population size is the primary concern. A different question would be more productive if the researcher believed the six failures are not a sample from a larger population but *diagnostic cases* — failures that reveal mechanism properties rather than establish incidence rates. Clinical medicine routinely draws design conclusions from small case series when the cases are mechanistically informative. The question "is the population sufficient?" is appropriate for epidemiology; for mechanism-failure diagnosis, the question might be "what do these failures reveal about mechanism properties regardless of their incidence?"

The base-rate audit is still useful as a Track C intervention, but the question may be slightly misdirected. The actionable concern isn't whether N=6 is statistically sufficient; it's whether the failures are representative of mechanism behavior or are exceptional outliers that don't characterize typical operation.

**Embedded conclusions.** None flagged, but the framing slightly undersells what the question is actually investigating. The deeper question is about mechanism reliability characterization, not sample adequacy.

Suggested reformulation (minor): "Are the six failures representative of typical Cycle 9 mechanism behavior, or are they outliers? What base-rate evidence would establish this, and does mechanism-failure analysis require base-rate evidence at all?"

**Scope:** Appropriate, with the clarification above.

---

#### C3: "What does the literature say about the attention-budget hypothesis specifically — that adding mechanisms past a threshold causes drop-out of earlier ones?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

That the attention-budget hypothesis is about *total mechanism count* rather than *mechanism type* or *mechanism placement in the instruction sequence*. If drop-out is primarily a function of instruction position (mechanisms mentioned later in long skill text are less attended) rather than count, the user's skepticism about the hypothesis (based on count) would be wrong for the wrong reasons. The more productive question: "What does the literature say about instruction-following degradation as a function of instruction count, instruction position, instruction type, and context window utilization?"

This matters because if the answer is "position effects dominate count effects," the intervention is reordering skill text, not reducing mechanism count.

**Embedded conclusions.** None flagged. The question correctly targets the specific hypothesis for investigation.

**Scope:** Appropriate. The scope is tightly coupled to the user's stated prior (skepticism about attention-budget), which is the right thing to investigate when you know the prior.

---

#### C4: "What does the literature say about the pedagogical hypothesis — that mechanisms work when understood deeply but fail on habit, suggesting more teaching rather than more enforcement?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

That "teaching" and "enforcement" are alternatives with the same goal. A different question matters if the pedagogical hypothesis applies to *human users* of the methodology rather than *the agent* — the mechanisms might fail not because the agent lacks understanding but because the user does not scaffold the agent with sufficient context to activate the mechanisms. The mechanism might require user-side behavior (structuring prompts to surface protocol, providing explicit task-phase context) that the methodology currently doesn't teach.

The user's stated prior — "framework should carry the load; user education is a fallback" — is itself a design assumption that the pedagogical hypothesis directly challenges. This tension is worth naming explicitly.

**Embedded conclusions.** Mild flag. "Suggesting more teaching rather than more enforcement" is already the hypothesis conclusion, not a neutral description of the hypothesis. The question should investigate what the literature says about *when* pedagogical approaches work vs. enforcement, not assume teaching is the implication.

Suggested reformulation: "What does the literature say about instruction-following in AI systems when the agent understands a rule vs. has it as a rote specification? Does deeper task understanding improve protocol compliance, and if so, through what mechanism?"

**Scope:** Appropriate.

---

#### C5: "What does the literature say about the observability-first hypothesis — that visibility alone (telemetry, fail-loud) closes specification-execution gaps without requiring enforcement?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

That the observability-first hypothesis is primarily about *closing* the gap rather than *characterizing* it. A more productive question exists if observability is better understood as a diagnostic tool that enables targeted intervention rather than a solution in itself: "What does the literature say about observability as a prerequisite for effective enforcement design vs. as a substitute for enforcement?"

This matters for question space coverage: if the answer is "observability is necessary but not sufficient," C5 and A3 together constitute a partial answer, and the sufficiency question is dropped.

**Embedded conclusions.** Mild flag. "Closes specification-execution gaps without requiring enforcement" frames observability as potentially sufficient rather than as a design variable. This framing could lead the lit review toward confirming or disconfirming sufficiency rather than understanding the relationship.

Suggested reformulation: "What does the literature say about observability's role in closing specification-execution gaps — as a diagnostic layer, as a deterrent, or as sufficient intervention in itself?"

**Scope:** Appropriate.

---

## Question space coverage analysis

Running both tracks in parallel covers more ground than either alone, but there are three gaps:

**Gap 1: The failure-type distinction is not studied as a variable.**

Issue #9 identifies two distinct failure types: Type 1 (meta-level mechanisms dropped during task-immersion) and Type 2 (moment-recognition failure — mechanism exists but trigger not recognized). Neither track has a question that specifically investigates whether these failure types require different interventions. Track A questions treat the failures as a single class requiring a single class of response. Track C questions examine alternative interpretations but don't probe whether the interpretations apply differently to Type 1 vs. Type 2 failures. A question directly addressing this distinction would be: "Do Type 1 and Type 2 failures in Issue #9 share a common mechanism or etiology, or do they require different intervention approaches?"

**Gap 2: The silent-fallback failure mode is the most dangerous item in the issue but is underweighted.**

Issue #9 is explicit: "silent fallback is particularly dangerous because the agent proceeds as if the mechanism fired when it didn't." A3 touches this via telemetry. But no question investigates *why* the agent chose silent fallback over surfacing the failure — what in the current design enables or encourages fallback-without-disclosure. This is an architectural question about the absence of fail-loud norms, not just a telemetry question.

**Gap 3: Composition effects are not investigated.**

The Cycle 9 architecture adds four new mechanisms to an existing orchestrator. No question asks whether the mechanisms interact — whether adding the Susceptibility Snapshot and three new audits affects the reliability of mechanisms that already existed. If adding mechanisms creates interference effects (not just budget effects), the intervention implied is different from what either track is researching.

---

## The implicit third framing

The user's framing — "We're working with a non-deterministic system, so the challenge is providing the right harness" — is not covered by either track in a way that produces actionable findings.

Track A treats the problem as one of specification adequacy (better text, better hooks, better triggers). Track C treats the problem as one of interpretation validity (are we diagnosing correctly). Neither asks: *what harness shapes are known to work with non-deterministic systems, and which of those shapes is RDD currently using or failing to use?*

This framing has a different research orientation. It asks about *categories of harness* — not "should we use hooks" but "what does the literature and practice on harness design for non-deterministic systems (probabilistic pipelines, distributed systems with partial failure, human-in-the-loop processes) say about what makes enforcement reliable when the executor is non-deterministic?" Software testing literature on flaky tests, reliability engineering literature on Byzantine fault tolerance, and human factors literature on checklist design all potentially apply. None of them are pointed at by Track A or Track C.

This framing should become explicit. Suggested questions for a Track B or as additions to existing tracks:

**TB1:** "What harness design patterns are used in systems where the executor is non-deterministic or unreliable (flaky tests, probabilistic pipelines, human-in-the-loop processes), and which of these patterns is RDD currently using?"

**TB2:** "In non-deterministic systems, what is the relationship between harness complexity and reliability — does adding more enforcement mechanisms increase or decrease overall system reliability, and under what conditions?"

**TB3:** "What does the harness design literature say about the reliability of instruction-following when the instruction-follower has variable attention or context-window constraints? Are there analogous human-factors findings on protocol compliance under cognitive load?"

These three questions are neither Track A (assuming hooks) nor Track C (examining premise) — they ask what is known about the right harness shape for this class of system. They could be run as a Track B in round 1 or deferred to round 2 after Track C establishes which interpretation of the failures holds.

---

## Premature narrowing

There is one alternative framing neither track surfaces: **the failure as acceptance criterion problem**.

Issue #9 notes that the skill text was "structurally correct but operationally slack." Three of the six failures were fixed by tightening the text. This invites an alternative interpretation: the problem is not that mechanisms fail to fire (structural), not that agents lack understanding (pedagogical), not that the budget is exceeded (attention), but that the methodology currently has no acceptance criteria for mechanism reliability. There is no definition of "Tier 1 mechanism is working correctly" that would enable detection of degradation.

If mechanisms had acceptance criteria — observable, verifiable properties — failures would be detectable systematically rather than discovered post-hoc by the user noticing an absence. This is a quality assurance framing, not an enforcement framing, and it implies a different research program: studying what properties of mechanisms make them testable/verifiable rather than studying how to make them harder to skip.

Neither track asks: "What would it mean for these mechanisms to have acceptance criteria, and what literature exists on verifiable properties of AI agent protocols?"

This framing deserves at minimum a question in Track C, which is examining the premise, and potentially a standalone question in Track A.

---

## Reflexive risk note

This dispatch has a reflexive structure that deserves naming directly.

**The problem under investigation is:** specifications in prompt text don't mechanically force execution. The agent can miss them, forget them, defer them, or interpret wiggle room as permission.

**What this dispatch is:** a specification in prompt text — a detailed prompt-based mechanism instructing this agent to conduct a research-methods review according to specific criteria.

The dispatch is functioning as written. But that is not evidence that the dispatch would function under the conditions that produced the Cycle 9 failures: deep task-immersion, competing priorities, long context windows with this specification earlier in the scroll. This dispatch was the active top-level task when it ran. Whether research-methods-reviewer dispatch would fire correctly when the orchestrator is deep in phase-level work is exactly the question Issue #9 item 5 (Susceptibility Snapshot never ran) demonstrates it might not.

There is an additional structural blind spot: this reviewer cannot evaluate the quality of its own execution. The issue #9 item 4 failure — "grading my own homework" — is precisely the problem with isolated self-auditing. This review was conducted in-context by the same agent that will use the findings to execute research. Whether the review found the most important gaps is not verifiable by the reviewer.

Two specific reflexive risks to name:

**Risk 1: This review may be well-formed but unfired.** The research-methods-reviewer subagent was dispatched correctly this time. In a subsequent phase-immersed session, the next dispatch of this mechanism may not happen — exactly as the Susceptibility Snapshot didn't happen in the failure case. The review findings don't prevent the next omission.

**Risk 2: The review itself may exhibit the embedded conclusion problem it audits.** This review has flagged A2 for presupposing hook enforcement. But this review was also written by an agent that has read ADR-033, ADR-058, ADR-062, and the full issue text — all of which discuss hooks approvingly. The reviewer's belief-mapping of A2 may be shallower than it appears if the reviewer has itself absorbed the hook framing from the materials. The parent should treat the flagging of A2 as a finding worth examining independently, not as an authoritative determination.

One practical implication: the findings of this review should be recorded in an artifact that persists beyond this context window (the research log or a discovery document) and referenced at the start of the research phase, not trusted to in-context recall.

---

## Recommendations

**Keep as-is:**
- A1 (minor reformulation acceptable but not required — the question is functional)
- A3 (well-formed, tightly scoped to a concrete failure)
- A5 (appropriate breadth for a foundational lit review)
- C1 (best-designed question in either track)
- C2 (useful as-is; the minor reformulation clarifies but doesn't change the question)
- C3 (appropriate; the position-vs-count clarification is worth noting to the researcher as a scope watch item, not a question change)

**Adapt:**
- A2: Remove the hook presupposition. Replace "hook enforcement vs. skill text" framing with a question that investigates failure-type properties and what intervention class each property warrants. Recommended reformulation above. Do not run this as an implementation-planning question in round 1 research.
- A4: Minor reformulation to open the "methodology can handle it" presupposition. Recommended reformulation above.
- C4: Remove "suggesting more teaching rather than more enforcement" from the question body. Investigate the hypothesis neutrally. Recommended reformulation above.
- C5: Open the sufficiency framing. Recommended reformulation above.

**Add:**
- A question directly addressing the Type 1 / Type 2 failure-type distinction as a variable (gap 1 above).
- A question addressing why silent fallback occurs without disclosure — the mechanism failure anatomy question, not just the telemetry question (gap 2 above).
- The implicit third framing should become 2-3 explicit questions, either as a Track B or as additions to Track A. TB1 and TB3 above are the highest priority; TB2 is secondary.
- A question on acceptance criteria / verifiable properties of mechanisms (the premature narrowing gap).

**Priority order for additions:** TB1 (harness patterns for non-deterministic executors) > Type 1/2 distinction question > acceptance criteria question > TB3 > silent fallback anatomy > TB2.

**Structural note for the research team:** Record the findings of this review in the research log before beginning phase execution. In-context recall of review findings under phase-immersion is the failure mode under investigation. Don't rely on it.
