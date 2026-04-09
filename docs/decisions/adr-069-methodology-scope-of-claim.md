# ADR-069: Methodology Scope-of-Claim — Competence Without Independent Second-Order Critique

**Status:** Proposed

## Context

The MODEL → DECIDE susceptibility snapshot (`docs/essays/audits/susceptibility-snapshot-014-model.md`) returned four findings. Three drove in-cycle course corrections (addressed in ADR-066 and ADR-068). The fourth is **Signal D**, which the snapshot routed as feed-forward to DECIDE with an explicit request: *"The DECIDE phase should produce at least one ADR that encodes the pattern explicitly as a named methodology limitation — not as a future research direction, but as a settled finding that shapes what the methodology guarantees. The domain model has the vocabulary for this (Synthesis-Moment Framing Adoption, ceremonial vs. operational reliability). The DECIDE phase should convert the vocabulary into a durable decision about what the methodology promises."*

This ADR is that decision. It encodes a pattern the snapshot and prior Cycle 10 analysis have named — **competence without independent second-order critique** — as a named methodology scope-of-claim limitation. The pattern is not a bug to be fixed; it is a structural property of the methodology the user operates that shapes what RDD can and cannot promise.

### The pattern as documented across Cycle 10

The pattern was named first by the research-phase snapshot as *"softer than sycophancy but real"*: the agent generates competent first-order analysis but does not independently generate the strongest competing case for alternatives it recommends against, and does not independently generate second-order critiques of its own output. Cycle 10 documents the pattern at four distinct phases:

1. **Research phase (four instances).** The framing audit, running in isolated context, surfaced four moments where the agent had reached for user-provided framings at synthesis moments rather than independently generating competing framings. The most consequential instance: the skill-structure-fix alternative that the in-context agent had not surfaced but the isolated framing audit generated. This became one of Cycle 10's three primary architectural recommendations.

2. **Discover phase (one instance).** The discover-phase susceptibility snapshot surfaced that user-crystallizations from the research phase were propagating into product-discovery vocabulary and tensions without attribution. The snapshot's finding was itself second-order critique (about the agent's propagation behavior) that the agent had not generated about its own prior-phase output.

3. **MODEL phase (one instance).** The user's pre-mortem on the User-Tooling Layer surfaced the **reframe-derailed gate failure mode** — a second-order critique of the agent's first-order User-Tooling Layer analysis. The agent confirmed this was a failure mode not previously considered and absorbed it into the domain model concept update.

4. **DECIDE phase (one instance, self-observed in this cycle).** In DECIDE turn 1, the agent absorbed the user's TDD framing for Invariant 8's sequencing at a synthesis moment, then named the absorption explicitly as the same pattern: *"I am adopting this framing now, in real-time, at a synthesis moment, and my adoption is structurally identical to the four framing-adoption moments the research snapshot documented."* The observation was not unique to DECIDE — it was the fourth phase-level instance of the same pattern, demonstrating that naming the pattern in the conversation does not eliminate it.

In each of the five instances above, the second-order critique required either **the user operating in second-order mode** (pre-mortem responses, belief-mapping challenges, assertion detection) or **an isolated evaluator** (framing audit, susceptibility snapshot). The agent did not generate the second-order critique independently. This is not an occasional miss — it is a pattern consistent across all phases of Cycle 10, and it persisted even after the pattern was named and explicitly attended to.

### The nuance surfaced at DECIDE — the failure mode has a complementary success mode

A sixth Cycle 10 instance, observed during DECIDE drafting (2026-04-09), clarifies the pattern's shape:

**The "compound defense" terminology endorsement (DECIDE, this conversation).** During the draft review of ADR-066, the user noted that "compound defense" was the agent's own term, originally composed at MODEL during the User-Tooling Layer concept edit. The user had not recalled the term easily earlier in the DECIDE conversation, because it wasn't their framing — they had surfaced the substantive observation (snapshot complements belief-mapping against engagement degradation) but not the umbrella term. When the user looked at the agent's composed term at DECIDE, they evaluated it on its merits: *"it makes sense to me and is descriptive. And if we add another layer of defense we don't have to update the name."* The user accepted the term because of stated criteria (descriptive, extensible, doesn't collide with Invariant 8's "layer" terminology when the three-layer-defense framing would have done so).

This is structurally different from the failure-mode instances. The user was not following along with the agent's synthesis and absorbing it as settled — they were **evaluating the synthesis on stated criteria and keeping it because the criteria were met**. This is second-order critique applied *by the user* to *the agent's* composition. The agent still did not generate the critique independently, but the user's engagement performed it, and the outcome was a principled acceptance rather than a silent adoption.

The pattern has two forms:

- **Failure mode:** agent composes a framing at a synthesis moment; the user follows along without evaluating; the framing becomes load-bearing without second-order scrutiny; a later isolated evaluator (framing audit, snapshot) or a later user intervention surfaces the problem retroactively. Seven instances across Cycle 10: four in research, one in discover, one in MODEL, one in DECIDE turn 1.
- **Success mode:** agent composes a framing at a synthesis moment; the user notices the composition, evaluates it against stated criteria, and accepts or rejects it on the merits. One clear instance in Cycle 10: the "compound defense" terminology endorsement at DECIDE 2026-04-09.

Both forms involve framing that originates with one party and is evaluated (or not evaluated) by the other. The difference is not whether the agent generates second-order critique — the agent does not, in either form. The difference is whether the *user* performs the second-order critique on the agent's output, and whether the agent's composition is visible enough for the user to evaluate.

### Why the distinction matters for scope-of-claim

The methodology's structural response to the failure mode (Tier 1 mechanisms, audits, snapshots) is designed to catch failures retroactively. The success mode is a different kind of structural support — one that prevents the pattern by making agent compositions visible enough that the user can evaluate them in the moment. The success mode requires:

1. **The agent's synthesis is nameable, not invisible.** If the agent's composition is absorbed into domain model relationships or essay material without being called out as a composition, the user has nothing to evaluate. The agent must name its own composition at the point it lands. (Cycle 10 introduced the explicit provenance check in each ADR's provenance section for exactly this reason.)

2. **The user is invited to evaluate, not just approve.** Approval is the path of least resistance. Evaluation requires the agent to ask "does this land?" or "is this the right umbrella?" rather than presenting the composition as settled. The Grounding Reframe extension (ADR-068) operationalizes this at phase boundaries; the provenance-check subsection in ADRs operationalizes it at drafting moments.

3. **The user has stated criteria to apply.** "Compound defense" was kept because it was descriptive, extensible, and non-colliding. The criteria made the evaluation cheap. Without criteria, evaluation becomes a vague judgment call and typically collapses into approval.

The success mode is not a guarantee — the user might not always be in a position to evaluate, criteria might not always be available, and some compositions drift silently into load-bearing structure before anyone notices. But the success mode is a cultivable pattern, and the methodology's mechanisms (provenance checks, Grounding Reframe, belief-mapping, commitment gating) are designed to make it more common than the failure mode.

## Decision

**The RDD methodology explicitly does not guarantee independent second-order critique by the agent alone.** The methodology's positive scope of claim is:

1. **Competent first-order analysis.** The agent generates essays, ADRs, scenarios, domain models, and system designs that are substantively correct and internally consistent at the level of direct content.

2. **Structural resistance to sycophancy via Tier 1 mechanisms (ADR-058).** Specialist subagent dispatches (citation audit, argument audit, framing audit, research methods review, susceptibility snapshot) run in architecturally isolated contexts and provide second-order critique the in-context agent cannot generate independently.

3. **Conversational mechanisms that invite user second-order engagement** — the Attend-Interpret-Decide cycle at phase gates (ADR-040, now graduated to artifact-producing form in ADR-066), the Question Toolkit (ADR-056), belief-mapping operationalization (ADR-055), assertion-aware observation (ADR-062), and the Grounding Reframe (ADR-059, extended in ADR-068).

4. **A compound defense at phase boundaries** (ADR-066) combining the User-Tooling Layer manifest check, the susceptibility snapshot, and belief-mapping. Three components covering non-overlapping failure modes of the engagement-degradation threat.

5. **Provenance via architectural drivers as the primary attribution mechanism** — research findings, domain model concepts, and prior ADRs traced through each ADR's context and decision sections. For most ADRs, the driver chain does the provenance work: the ADR's reasoning is visible because its sources are named in the context and the decision is a mechanical application of that material. **Provenance check subsections are used selectively** when an ADR carries content that is *not* from the driver chain — DECIDE-gate contributions, agent synthesis at drafting time, or cross-ADR compositions where the sources are other ADRs produced in the same cycle. The Cycle 10 ADRs 063–070 include provenance check subsections specifically because they carry unusually high proportions of non-driver content; this is not a universal methodology promise that every future ADR must carry a provenance check. The structural response to synthesis-moment framing adoption is: drivers do the work where they reach, and provenance checks fill in where they do not.

**The methodology's negative scope of claim:**

1. **The agent does not independently generate second-order critique of its own output.** Cycle 10 documents seven instances of this pattern across four phases. Naming the pattern in the conversation does not eliminate it. The pattern is a structural property of current language model capability, not a bug in the methodology's mechanism design.

2. **"Independent" is load-bearing.** Second-order critique appears when the user operates in second-order mode (evaluating, challenging, pre-morteming) or when an isolated evaluator runs in architecturally isolated context (framing audit, susceptibility snapshot). The agent-in-conversation does not generate it alone. The methodology's mechanisms are designed to fill this gap by either engaging the user in second-order mode or dispatching to an isolated evaluator — not by expecting the agent to perform the critique independently.

3. **Therefore, the methodology's guarantee rests on the mechanisms firing, not on the agent's independent judgment.** If the Tier 1 mechanisms fail to fire (the pattern Invariant 8 addresses structurally), the second-order critique is absent, and the methodology's sycophancy resistance degrades to "competent first-order analysis" alone.

### The pattern has two forms, both worth cultivating awareness of

The failure mode is the one Cycle 10 documents most. The success mode is rarer but cultivable. Both are recorded as durable methodological knowledge:

- **Failure mode** — agent composes a framing at a synthesis moment; the user follows along without evaluating; retroactive detection by isolated evaluator or user intervention is the correction path.
- **Success mode** — agent composes a framing at a synthesis moment; the user notices the composition, evaluates it on stated criteria, accepts or rejects on the merits.

The structural response to both forms is the same: **make the agent's compositions visible and invite evaluation.** Provenance checks do this in artifacts. Grounding Reframes do this at phase boundaries. Belief-mapping does this in conversation. The methodology's mechanisms are not designed to prevent the agent from composing (composition is useful) but to prevent composition from becoming load-bearing without being evaluated.

### What this ADR does not do

- **Does not propose a new mechanism.** The structural response is the existing Tier 1 architecture plus the cycle 10 enhancements (ADR-063/064/065 Harness and Skill-Structure Layer, ADR-066 User-Tooling Layer, ADR-068 Grounding Reframe extension). This ADR names what those mechanisms are collectively protecting against.
- **Does not predict the pattern will disappear with better models.** The pattern may become less frequent as language model capability improves, but this ADR's scope-of-claim stands regardless of model capability. The methodology is a framework for building with understanding, not a bet on any specific model's second-order reasoning capability.
- **Does not frame the limitation as shameful.** "Competence without independent second-order critique" is honest about a real property; it is not a lament. The methodology provides value precisely because it architects around the limitation rather than pretending the limitation doesn't exist.

## Consequences

**Positive:**

- **Signal D is discharged.** The snapshot's explicit request — "convert the vocabulary into a durable decision about what the methodology promises" — is honored in ADR form. The pattern is now a named methodology limitation, not a future research direction.
- **The Tier 1 architecture's purpose becomes explicit.** Future ADRs proposing new Tier 1 mechanisms can cite this ADR as the reason the mechanism exists. "Independent second-order critique is not guaranteed; the mechanism fills the gap" becomes the architectural rationale for any isolated evaluator, conversational challenge, or structural backstop.
- **The success-mode cultivation pattern becomes first-class methodology content.** Future methodology enhancements can target the success mode directly: make agent compositions more visible, invite evaluation more explicitly, provide more stated criteria for the user to apply. The pattern is nameable and therefore cultivable.
- **Honesty about scope of claim reduces the risk of over-promising.** Users who understand what the methodology does and does not guarantee are in a better position to apply it well. They know when to engage in second-order mode, when to dispatch isolated evaluators, and when to trust the methodology's structural responses.
- **The eight-instance documentation becomes durable evidence.** Future cycles that encounter the pattern can reference Cycle 10's seven failure-mode instances plus one success-mode instance as the empirical base for the scope-of-claim, rather than re-discovering the pattern.

**Negative:**

- **Naming a methodology limitation could be read as a disclaimer.** The text is deliberately framed as architectural honesty rather than apology, but readers who skim may interpret the ADR as "the methodology doesn't work." Mitigation: the positive scope-of-claim is listed first and occupies most of the decision section; the negative scope follows and is explicitly framed as "what the mechanisms are protecting against, not a concession."
- **The failure mode versus success mode distinction is a new analytical frame.** It did not exist in the essay or prior ADRs; it was composed in the DECIDE-phase conversation 2026-04-09 between the agent's observation of the compound-defense terminology exchange and the agent's drafting of this ADR. Accepted risk: future cycles may refine or refute the distinction, but naming it now is useful even if later revised.
- **"Stated criteria" as a success-mode requirement is more demanding than typical approval.** Users working the methodology at pace may not always have criteria ready to state. The methodology's mechanisms (especially provenance checks) make stated criteria more available, but the gap between "I approve" and "I approve because of X" is real. Mitigation: the Grounding Reframe extension (ADR-068) explicitly surfaces opportunities for stated criteria at phase boundaries; the provenance-check subsection in ADRs invites the user to evaluate specific agent compositions.

**Neutral:**

- **The scope-of-claim is not a version-specific property.** It applies to the methodology as specified, independent of plugin version or model version. Future models that reliably generate independent second-order critique would not invalidate this ADR — they would extend the methodology's positive guarantee without altering the architectural response to the limitation as currently specified.
- **The two-form framing (failure mode + success mode) is composed from Cycle 10 evidence, not from prior methodology literature.** It is agent-composed at drafting time as an abstraction from the eight observed instances (seven failure-mode plus one success-mode). Whether the distinction holds at scale is an empirical question for future cycles.
- **This ADR references, but does not restate, ADR-058 (Unconditional Architectural Floor) and ADR-055 (Belief-Mapping Operationalization).** Those ADRs specify mechanisms; this ADR specifies what the mechanisms are collectively protecting against. The two levels of specification are complementary.

## Provenance check

**Did this ADR's core framing originate from Essay 014, from a prior gate conversation, or from the agent's synthesis during drafting?**

- **The core pattern ("competence without independent second-order critique"):** The research-phase susceptibility snapshot named the pattern as *"softer than sycophancy but real"* (recorded in `docs/essays/audits/susceptibility-snapshot-014-research.md`). The discover-phase and MODEL-phase snapshots documented additional instances and extended the naming. Not agent synthesis at drafting time; isolated-evaluator work from prior phases. The specific ADR title phrasing "competence without independent second-order critique" is the research-phase snapshot's formulation, preserved here.
- **The eight-instance empirical base:** Seven failure-mode instances plus one success-mode instance, drawn from existing Cycle 10 artifacts — four research-phase framing-adoption moments documented by the framing audit, one discover-phase instance from the discover susceptibility snapshot, one MODEL-phase instance (the reframe-derailed gate surfaced in user pre-mortem), one DECIDE turn 1 self-observation (TDD framing absorption), and one DECIDE turn 9 success-mode instance (the "compound defense" terminology endorsement). Not agent synthesis at drafting time; compilation of documented instances.
- **Signal D's request to encode the pattern as a scope-of-claim ADR:** Explicitly from the MODEL → DECIDE snapshot. User-surfaced through isolated evaluation; not agent synthesis.
- **The positive scope-of-claim (five items):** Restatement of existing methodology commitments from prior ADRs (058, 059, 066, 068, and the provenance-check structure introduced across ADRs 063–068). Agent composition of the list at drafting time, mechanical aggregation of existing mechanisms.
- **The negative scope-of-claim (three items):** Agent-composed at drafting time as the honest formulation of what the empirical pattern means for the methodology's guarantee. The first item ("agent does not independently generate") is from the snapshots; the second ("'independent' is load-bearing") and third ("guarantee rests on mechanisms firing") are drafting-time clarifications that make the scope operational.
- **The failure-mode / success-mode dichotomy:** **Agent-composed at drafting time**, specifically at this ADR's drafting moment 2026-04-09. The framing was announced in the prior conversation turn when the agent said: *"This is a worth recording in ADR-069 (the methodology scope-of-claim ADR) as a nuance to the 'competence without independent second-order critique' pattern. The pattern has two forms."* The dichotomy is not in the essay or prior ADRs. It is inductive abstraction from the eight observed instances — seven failure-mode instances plus one success-mode instance (the compound defense endorsement). **Named explicitly as agent composition with a single-instance empirical base for the success mode.** The user has not explicitly endorsed the dichotomy as the right frame; the ADR's consequences section names this as an accepted risk.
- **The "success mode requires three conditions" (nameable synthesis, invited evaluation, stated criteria):** Agent-composed at drafting time as inductive abstraction from the compound defense endorsement. The three conditions are derived from what made that specific endorsement succeed. Whether they generalize is an empirical question.
- **The "this ADR does not do" list:** Agent-composed at drafting time as scope-boundary clarification. Not framing synthesis; mechanical limit-naming.

**Watch item — the failure-mode / success-mode dichotomy.** The dichotomy is agent composition built on one observed instance of the success mode and seven of the failure mode. The single success-mode instance is substantively strong (the user's stated-criteria evaluation is well-documented in this DECIDE conversation), but the sample size does not support claims of generality. The ADR treats it as a named pattern worth cultivating rather than a proven mechanism. Future cycles that observe additional success-mode instances (or that encounter situations where the three conditions are met but the outcome is still a failure mode) will provide the empirical base to evaluate the dichotomy. Flagging this explicitly so the encoding does not over-reach.

**Result:** This ADR is reflective and carries the highest proportion of agent-composed content of any DECIDE-phase ADR. The core pattern and its empirical base (seven failure-mode instances plus one success-mode instance) are from prior phases and isolated evaluators, not from drafting synthesis. The positive and negative scope-of-claim lists are aggregation and clarification of existing material. The two-form dichotomy (failure mode + success mode) is agent-composed at drafting time with one success-mode instance as its empirical base — named as a watch item. The ADR's honesty about its own drafting-time compositions is itself an example of the provenance-check pattern the ADR identifies as the structural response to the failure mode. No unresolved framing adoption detected; the watch item on the dichotomy is transparent rather than hidden.
