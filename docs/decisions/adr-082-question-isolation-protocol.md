# ADR-082: Question-Isolation Protocol at RESEARCH Entry

**Status:** Proposed

## Context

Issue #16 names the structural gap: when the research phase begins in a context where implementation artifacts already exist — code, infrastructure, prior design decisions — the research unconsciously narrows to "how do we integrate with what exists?" rather than "what is the simplest way to solve the underlying need?" The existing artifacts become constraints in the solution space before the research has a chance to question whether they should be.

Essay 015 §6 documents three simultaneous mechanisms operating before deliberate reasoning:

- **Selective accessibility** (Strack & Mussweiler 1997): the existing artifact activates information consistent with it; the research retrieves artifact-consistent considerations as its informational basis.
- **Anchoring-and-adjustment** (Epley & Gilovich 2006): for **self-generated anchors** — critically, practitioners who co-designed the existing implementation — adjustment terminates at the first plausible value, not the accurate one. The practitioner is in a *stronger* anchoring condition than the experimenter-provided anchor studied in most lab research.
- **Pre-semantic priming** (Tulving & Schacter 1990; Bargh & Chartrand 1999): existing artifacts make solution categories available before the researcher is aware of the influence. This component is not accessible to instruction.

Design fixation research (Jansson & Smith 1991; Chrysikou & Weisberg 2005) confirms that instruction-based intervention fails to override prior-example influence at the analogical level: participants reproduce analogical similarities from a prior example even when explicitly told to avoid its problematic features. This extends Essay 013's finding that the hard dimension of sycophancy is entangled at a level prompt instructions cannot reach.

Essay 015 §6 prioritizes **structural intervention at the question-formation stage**, citing the pre-registration movement as the strongest evidence: Scheel, Schijen and Lakens (2021) found 44% of Registered Reports yield significant results versus 96% of traditional publications, consistent with pre-specification structurally constraining bias at the question-formation stage among other confounds. PRISMA-S requires peer-reviewed search strategies before execution, preventing the known literature from shaping the search terms that will retrieve it.

Counterfactual mindset induction (Galinsky & Moskowitz 2000) operates at a different intervention point: broadening the accessible solution space before specific judgments form. The two interventions are complementary, not competing.

The methodology already has the **research-methods-reviewer** specialist subagent (ADR-060), which reviews question framing, embedded conclusions, and premature narrowing before each research loop. This ADR extends that dispatch to enforce a question-isolation protocol at research entry, and augments the Inversion Principle (ADR-055) with a constraint-removal prompt placed at the research-entry moment.

Essay 015 §10 grouped this protocol with ADR-077's applicability check under the "second-line cognitive" heading. On reflection during DECIDE, the classification is reconsidered: ADR-077 fires conversationally at the BUILD pattern-reuse moment with no per-step structural anchor, so it correctly sits at second-line cognitive (Tier 2 per ADR-058). This protocol, by contrast, **step-anchors a five-step research-entry sequence in the `/rdd-research` skill** — the user articulates the question as the research log's first content (an artifact check), the research-methods-reviewer dispatch is required before the research loop proceeds (a step-anchored dispatch), and each step has a mechanically observable output. Under ADR-067's four-step decision procedure (does the mechanism have a concrete, mechanically-unavoidable workflow step? → Skill-Structure Layer), the answer is yes: this protocol qualifies for **first-line structural (Skill-Structure Layer) classification with a cognitive component** (the constraint-removal prompt's wording). The classification matters because it sets the methodology's reliability expectations: structural mechanisms are held to Invariant 8's anchoring standard; cognitive mechanisms carry reduced expectations. Naming the protocol's actual mechanism design honestly is part of ADR-069's scope-of-claim discipline.

The domain-model concept **Question Isolation** was added in Amendment 19. This ADR specifies the protocol.

## Decision

**1. Research-entry question-isolation protocol.**

The `/rdd-research` skill gains a **question-isolation step** that fires at research entry, before any artifact corpus is consulted. The step requires:

- The user articulates the **research question(s)** in their own words, written into the research log as the entry's first content.
- The articulation occurs **before** the agent reads the existing artifact corpus (essays, ADRs, system-design, scenarios, product-discovery, code).
- The articulation includes a **constraint-removal prompt response**: "What if [the most consequential existing artifact / infrastructure component] were not available? How would the problem be solved then?" The user names the artifact and writes a brief answer.

The constraint-removal prompt is composed by the agent against the actual research context (the agent names the most consequential existing artifact; the user supplies the imagined-without-it framing). The prompt's wording is not a fixed script — it follows the schema-comparison principle: name a specific structural alternative, not a generic "consider alternatives" gesture.

When the user has no constraint-removal answer ("the artifact is genuinely irreplaceable"), that itself is recorded as the answer with a one-sentence justification. The structural anchor is the recorded engagement, not a particular content of the response.

**2. Research-methods-reviewer extension.**

The research-methods-reviewer dispatch (ADR-060) is extended to include the **question set as a reviewable artifact**. Specifically, the reviewer evaluates:

- Whether the questions are **framed around needs or around artifacts** ("how do we connect A to B?" is artifact-framed; "what is the simplest way to achieve the outcome A and B were built to serve?" is need-framed).
- Whether **embedded conclusions** are present in the question phrasing (e.g., "how should we adapt component X for case Y?" presupposes adaptation as the solution category).
- Whether **at least one question** treats existing artifacts as prior art rather than as constraints — i.e., asks the constraint-removal question explicitly.
- Whether the **incongruity signal** — when a simple solution in one area sits adjacent to a complex solution being designed for an adjacent area — has been surfaced for examination.

**The reviewer evaluates both artifacts produced in steps 1 and 2:** the research question(s) articulated in the research log (step 1) AND the constraint-removal response naming the most consequential existing artifact (step 2). The two artifacts are evaluated together as the **question set under review**. The third review criterion (at least one question treats existing artifacts as prior art) is satisfied either by an explicitly artifact-bracketing question in step 1 or by the step-2 constraint-removal response, which structurally treats the named artifact as prior art rather than as a constraint. Treating the two artifacts as one reviewable set closes the gap where step 1's questions might be wholly artifact-framed while step 2's response sits outside the reviewer's scope.

The reviewer's output is the question-set review report, written to `docs/housekeeping/audits/research-methods-question-set-<NNN>.md`. The reviewer flags issues; the user revises the question set or accepts the issues with rationale. The pattern follows the existing argument auditor / framing auditor flow.

**3. Inversion Principle augmentation at research entry.**

The Inversion Principle (ADR-055, operationalized as belief-mapping) gains an explicit constraint-removal form at research entry, in addition to its existing forms. The constraint-removal form is:

> *What would we build if [key infrastructure component] were not available?*

The form is added to the orchestrator's Question Toolkit alongside the existing six (belief-mapping, pre-mortem, warrant elicitation, rebuttal elicitation, commitment gating, open-question reframing). It is the **primary form** for the research-entry moment — the moment where solution-anchoring most operates — but is available throughout the cycle when an artifact's gravitational pull is suspected.

**4. Sequencing and enforcement.**

The research-entry workflow becomes:

1. **User articulates research question(s)** in the research log (no artifact reads yet).
2. **Agent composes the constraint-removal prompt** against the actual research context; user responds.
3. **Research-methods-reviewer dispatch** evaluates the question set against the four review criteria (framing, embedded conclusions, prior-art treatment, incongruity surfacing).
4. **User revises** the question set if the reviewer flags issues; or accepts the issues with recorded rationale.
5. **Research loop begins** — the agent now reads the existing artifact corpus and runs the lit-review / spike / synthesis loop on the (now-validated) question set.

The sequencing is the structural intervention. Steps 1-2 happen before any artifact reads; step 3 evaluates the questions in isolation from the corpus they will eventually consult.

**5. What this ADR does not do.**

- It does not prevent the user from consulting the artifact corpus before the question is articulated. The methodology cannot enforce the practitioner's reading habits; the structural anchor is the artifact (the research log entry's first content is the question). If the user reads the corpus first, the question articulated thereafter is anchored — and the reviewer is more likely to flag artifact-framed questions.
- It does not eliminate solution-anchoring. The pre-semantic priming component (Tulving & Schacter 1990) is not accessible to instruction; the methodology can structure the question moment but cannot reach below conscious deliberation.
- It does not require the constraint-removal answer to lead to a different solution. The structural function is forcing the question to be asked; the user's substantive engagement is the evidence (per ADR-055's belief-mapping principle).

## Rejected alternatives

**Forbid artifact-corpus reads until after question articulation, enforced by hook.** Rejected. The hook cannot detect "is the agent reading the corpus to inform the question or to inform something else?" The structural intervention is the artifact ordering (question first in the research log) and the reviewer's evaluation; the hook layer is not the right enforcement substrate.

**Generate the constraint-removal answer via LLM, not user.** Rejected. The user is the source of authority on which existing artifact is "most consequential" and what the imagined-without-it framing actually surfaces. Delegating the answer to the agent recreates the sycophancy vector — the agent's curated "what if X were not available?" answer would be artifact-shaped, anchored on the same artifact the question is supposed to bracket.

**Combine question-isolation with the existing argument auditor.** Rejected. The argument auditor evaluates argument validity in produced essays — a different analytical act from evaluating question framing before research begins. The research-methods-reviewer is the appropriate dispatch (ADR-060 already establishes its scope); extending it is the right move, not folding into a different specialist.

**Require multiple constraint-removal questions, one per artifact in the corpus.** Rejected as overhead-disproportionate. One constraint-removal question on the most consequential artifact is sufficient to break the anchoring frame; multiple questions per cycle creates ceremonial recitation. The single-question form composed against the most consequential artifact preserves the structural intervention without ceremony.

**Apply the protocol to every research loop, not only research entry.** Considered. Subsequent loops within a cycle are already informed by the prior loops' artifacts; the anchoring dynamic operates at every loop boundary. The decision is to require the protocol at **research entry** (the first loop) where the anchoring dynamic is strongest, and to make the constraint-removal form **available** to subsequent loops via the Question Toolkit but not mandatory. If subsequent-loop anchoring proves to be a recurring problem, the protocol can be extended in a future ADR.

**Treat this as an `/rdd-discover` responsibility rather than `/rdd-research`.** Rejected. Discover surfaces stakeholder needs and value tensions — it operates on already-formed problem framings. The question-formation moment is upstream of discover; placing the protocol at discover means the research has already anchored before discover can intervene. Research-entry is the correct phase placement.

## Consequences

**Positive:**

- Closes the research-phase share of the solution-anchoring failure mode: the constraint-removal question is asked at the moment the research framing is set.
- Operationalizes the pre-registration principle (Scheel et al. 2021, PRISMA-S) at RDD's scale — the question set is treated as an artifact requiring external review before execution.
- Classified as **first-line structural (Skill-Structure Layer)** with a cognitive component, per ADR-067's decision procedure. The five-step workflow's structural anchoring meets Invariant 8's mechanically-anchored standard; the constraint-removal prompt's wording is the cognitive component carried within the structural frame.
- Composes with ADR-060 (research-methods-reviewer) by extending an existing dispatch rather than adding a new specialist.
- Composes with ADR-055 (belief-mapping operationalization of Inversion Principle) by adding the constraint-removal form to the Question Toolkit.
- Acknowledges the irreducible component (pre-semantic priming, design fixation) — the methodology does not over-claim that question isolation eliminates anchoring.
- Cycle 016's research phase exhibited exactly the question-formation discipline this ADR specifies (the research-methods reviewer's pre-research recommendation to test the X.1 hypothesis before assuming it). The ADR codifies what worked in practice.

**Negative:**

- Research-entry overhead increases — the question articulation, constraint-removal response, and reviewer dispatch are added steps before the research loop begins. Mitigated by the steps being lightweight (one question articulation, one constraint-removal response, one reviewer dispatch); the overhead is bounded.
- The user may write the question articulation after consulting the corpus (defeating the structural intervention). The methodology cannot prevent this; mitigation is the reviewer's flag for artifact-framed questions, which catches the symptom even if the protocol's sequencing was bypassed.
- The constraint-removal response can be performative ("if X were not available, we would build X again from scratch"). Mitigated by the reviewer evaluating the response substance, not just its presence.
- The pre-semantic priming component is not addressed — the methodology's position is honest scope-of-claim (ADR-069): the structural mechanism is first-line, with a known residual that prompt-level intervention cannot reach.

**Neutral:**

- Research cycles in greenfield contexts (no existing artifacts) experience the protocol as a one-line null answer ("no consequential prior artifacts to bracket"). The structural anchor is recorded; the absence of an artifact corpus is itself the answer.
- Subsequent research loops within a cycle are unaffected (the protocol applies at entry); the constraint-removal form remains available via the Question Toolkit.
- The research-methods-reviewer dispatch is already step-anchored (ADR-060); the extended scope adds review criteria within the existing dispatch.

## Provenance check

The core framing — research-entry question-isolation protocol with a constraint-removal prompt — derives from Issue #16 (user-authored) §"Proposed Mitigations" and essay 015 §6. The Strack & Mussweiler (1997), Epley & Gilovich (2006), Tulving & Schacter (1990), Jansson & Smith (1991), Chrysikou & Weisberg (2005), Scheel et al. (2021), and Galinsky & Moskowitz (2000) sources are essay-grounded. The Question Isolation concept is in the domain model from Amendment 19. Driver-derived.

The five-step research-entry workflow (articulate / constraint-removal / reviewer dispatch / revise / loop begins) is drafting-time synthesis composed against ADR-060's existing research-methods-reviewer dispatch and the existing `/rdd-research` skill structure.

The four review criteria the reviewer evaluates (framing, embedded conclusions, prior-art treatment, incongruity surfacing) are drafting-time synthesis composed against Issue #16's "How It Manifests" section (which names the three patterns) plus the embedded-conclusions criterion already in ADR-060's scope.

The constraint-removal form's addition to the Question Toolkit (alongside the existing six) is drafting-time synthesis grounded in ADR-055's operationalization pattern — adding a new question form follows the established mechanism for extending the toolkit.

The "primary form for research entry, available throughout the cycle" classification is drafting-time synthesis composed against the essay's emphasis on intervention point ("the same kind of intervention placed at different pipeline stages") — the form is universally applicable; its primary placement is at the moment anchoring most operates.

The honest scope-of-claim regarding pre-semantic priming (the protocol does not eliminate anchoring) is grounded in essay 015 §6 and ADR-069 (Methodology Scope-of-Claim).
