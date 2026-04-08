# Literature Review: Instruction-Following Degradation, Specification-Execution Gap, and Harness Design Under Non-Determinism
*2026-04-06*

## Abstract

The gap between a stated specification and its execution is one of the oldest problems in engineered systems, studied across software engineering, organizational behavior, human factors, and increasingly in the empirical literature on large language models. The literature converges on a few durable findings: specification-execution gaps are the default, not the exception; they are driven by a combination of structural, cognitive, and social factors that specification authors routinely underestimate; and reliable execution requires enforcement mechanisms external to the executor, not merely better-written instructions. The LLM-specific literature is young, primarily empirical, and not yet theoretically unified, but its findings map onto older bodies of work in ways that are instructive. Position effects (where instructions are placed matters) are robustly demonstrated across both the LLM and human-factors literatures. Type effects (certain kinds of rules fail more reliably) are emerging in the LLM literature but not yet cleanly separated from other variables. Instruction count alone is a weak predictor of failure; context utilization and position are stronger candidates. Harness design under cognitive and attentional constraints is well-studied in aviation and medicine, and the mechanisms that work there — brevity, external enforcement, closed-loop confirmation, failure loudness — have clear structural analogues for agentic AI systems.

---

## Method

Searches were conducted via web search in April 2026, covering the following source types: arXiv preprints and published conference papers (ACL, EMNLP, NeurIPS, ICLR, AAAI); peer-reviewed journals (TACL, NEJM, Scandinavian Journal of Trauma, Frontiers in Cognition, Human Factors); books by primary authors (Gawande, Vaughan, Reason, Weick/Sutcliffe); and official technical documentation (FAA Advisory Circulars, WHO Surgical Safety Checklist materials). Fields covered: prompt engineering and LLM evaluation, software engineering (design by contract, conformance testing), organizational behavior (normalization of deviance, high-reliability organizations), human factors (vigilance decrement, cognitive load, checklist compliance), and cognitive psychology (serial position effects, working memory). Excluded: blog posts and secondary summaries where primary sources were available. No fabricated sources are included; where a claim could not be traced to a verifiable primary source it has been flagged or omitted.

---

## Q1: Specification-Execution Gap (Broad Cast)

### What the literature says

**Prompt engineering and LLM instruction following**

The empirical literature on LLM instruction following is largely a benchmark literature, oriented around measuring how reliably models comply with explicit, verifiable directives. IFEval (Zhou et al., 2023) introduced a benchmark of ~500 prompts containing 25 types of verifiable instructions (e.g., "write more than 400 words," "mention the keyword X at least 3 times"), reporting results for available models and establishing a reproducible evaluation framework. FollowBench (Jiang et al., ACL 2024) extended this by defining five constraint types (Content, Situation, Style, Format, Example) and a multi-level mechanism that incrementally adds one constraint per level, evaluating 13 LLMs and documenting that compliance degrades systematically as constraint count increases. IFScale (Jaroslawicz et al., 2025) pushed further, testing up to 500 simultaneous keyword-inclusion instructions and finding three distinct degradation patterns across model families: threshold decay (near-perfect performance until a density threshold, then steep decline — characteristic of o3 and Gemini 2.5 Pro), linear decay (GPT-4.1, Claude Sonnet 4), and exponential decay (GPT-4o, Llama 4 Scout). "Revisiting the Reliability of Language Models in Instruction-Following" (arXiv 2512.14754, 2025) found that near-ceiling benchmark scores on IFEval do not translate to robust real-world compliance, with performance dropping up to 61.8% under nuanced prompt modifications. "Can LLMs Follow Simple Rules?" (arXiv 2311.04235) found that the vast majority of models fail to follow simple rules on a significant fraction of test cases.

The instruction-hierarchy problem is a structurally distinct failure: models often treat system-prompt instructions and user-prompt instructions as equivalent priority, enabling users to override developer-specified constraints. Wallace et al. (OpenAI, 2024) documented this systematically and proposed training-based remediation (The Instruction Hierarchy, arXiv 2404.13208). "Control Illusion: The Failure of Instruction Hierarchies in Large Language Models" (Geng et al., AAAI-26 accepted, arXiv 2502.15851) evaluated six state-of-the-art LLMs and found that even simple formatting conflicts are not reliably resolved in favor of the designated higher-priority instruction; moreover, societal hierarchy cues (appeals to authority, expertise, consensus) have greater behavioral influence than structural role designations (system vs. user prompt), suggesting that pretraining-derived social priors function as latent behavioral overrides of post-training instruction hierarchies.

**Software engineering**

The specification-implementation gap is one of the founding problems of formal methods in software engineering. Hoare's axiomatic semantics (1969) formalized the conditions under which a program meets a specification, but the practical problem is that programs routinely violate their specifications in ways that neither author notices until runtime. Design by Contract (Meyer, Eiffel language, late 1980s; elaborated in *Object-Oriented Software Construction*) addressed this by encoding contracts as executable assertions directly in source code — preconditions, postconditions, and class invariants — that are verified at runtime. The core insight is that specification compliance cannot be verified by inspection of the specification alone; it requires a mechanism external to the program's normal execution path that checks the contract and signals violation loudly. This is the software-engineering argument for runtime assertion: the specification exists, but execution will diverge from it unless there is a structural mechanism that makes divergence observable and loudly flagged.

Conformance testing (NIST; ISO standards) formalizes this further: given a specification, conformance is determined by constructing a test suite of atomic assertions, where each assertion is narrowly focused on one observable behavior. This is distinct from acceptance testing (does the product satisfy the stakeholder?) — conformance testing is about specification fidelity independently of satisfaction. The persistent finding in software engineering is that programs that lack runtime assertions or conformance tests diverge from their specifications silently, and the divergence is only discovered through downstream failures rather than at the point of non-compliance.

**Organizational systems**

The organizational literature on procedural compliance provides the most extensively theorized treatment of the specification-execution gap. Vaughan's *The Challenger Launch Decision* (1996) introduced the concept of normalization of deviance: small deviations from protocol that produce no immediate negative consequence become culturally normalized, providing a baseline from which further deviations are measured as acceptable. Over time the organization's actual practice diverges substantially from its documented procedure, but no single step in this drift is marked as a decision. The mechanism is incremental: each deviation is rationalized against prior deviations rather than against the original specification.

High-Reliability Organization (HRO) theory (Weick, Sutcliffe, and colleagues, originating at UC Berkeley from studies of aircraft carriers, air traffic control, and nuclear power) documents the organizational conditions under which specification compliance is sustained in high-consequence environments. The five HRO principles identified by Weick and Sutcliffe (2007) include preoccupation with failure (treating near-misses as data), reluctance to simplify (resisting interpretations that explain away anomalies), sensitivity to operations (maintaining frontline awareness), commitment to resilience (recovery capability), and deference to expertise. The structural implication is that high reliability requires continuous active maintenance of the specification-execution relationship, not a one-time implementation.

James Reason's Human Error (1990) and the Swiss Cheese model distinguish active failures (errors at the point of execution) from latent conditions (systemic gaps in the defensive layers that predispose active failures). The relevant point for this review is that individual execution failures are rarely sufficient to cause a system-level failure; it takes alignment of holes across multiple defensive layers. The design implication is that robustness requires defense in depth — multiple independent checking mechanisms — rather than reliance on any single layer.

**Human factors and vigilance research**

Mackworth (1948) established the vigilance decrement with the Mackworth Clock Task: radar operators monitoring for infrequent double-jumps of a clock pointer showed a 10-15% drop in detection accuracy within the first 30 minutes, with continued decline thereafter. This finding has been extensively replicated and theorized. The dominant theoretical account (resource depletion theory) holds that sustained attention gradually consumes processing resources. Signal Detection Theory (Green and Swets, 1966) provides a framework for distinguishing sensitivity loss from criterion shift: the vigilance decrement involves both reduced sensitivity and increased conservatism (higher threshold for reporting a signal), which means the operator may be capable of detection but not acting on it.

The procedural compliance literature in human factors identifies specific task characteristics that predict step skipping (Kulp et al., 2020, SIGCHI): tasks performed as part of a grouped activity but listed separately; tasks with long durations; tasks performed more than once; tasks with multiple sub-steps; and tasks rarely performed. The literature reframes procedural drift not as carelessness but as adaptive response to a mismatch between written procedure and work as performed.

### Key works

**Liu et al. (2023), "Lost in the Middle: How Language Models Use Long Contexts," TACL.**
Authors: Nelson F. Liu, Kevin Lin, John Hewitt, Ashwin Paranjape, Michele Bevilacqua, Fabio Petroni, Percy Liang. Tests multi-document question answering and key-value retrieval across context lengths and document positions. Core finding: performance is highest when relevant information is at the beginning or end of the input context, and degrades significantly for information in the middle, producing a U-shaped performance curve. This result holds even for models specifically designed for long contexts. This is the foundational empirical paper for position-based degradation in LLM attention.

**Wallace et al. (2024), "The Instruction Hierarchy: Training LLMs to Prioritize Privileged Instructions," arXiv 2404.13208, OpenAI.**
Authors: Eric Wallace, Kai Xiao, Reimar Leike, Lilian Weng, Johannes Heidecke, Alex Beutel. Documents the failure mode whereby LLMs treat system-prompt and user-prompt instructions as equivalent priority, enabling user instructions to override developer specifications. Proposes a training-based remedy (explicit instruction hierarchy). Applied to GPT-3.5 with meaningful robustness improvement at minimal capability cost. Foundational for understanding structural failure of the specification-execution relationship in LLM systems.

**Geng et al. (2025), "Control Illusion: The Failure of Instruction Hierarchies in Large Language Models," arXiv 2502.15851, accepted AAAI-26.**
Authors: Yilin Geng, Haonan Li, Honglin Mu, Xudong Han, Timothy Baldwin, Omri Abend, Eduard Hovy, Lea Frermann. Evaluates six state-of-the-art LLMs on instruction hierarchy conflicts. Finds that societal authority cues override structural role designations. Identifies a specific failure mode directly relevant to the Cycle 10 observation: models follow social/consensus cues from user input even when system-level instructions specify otherwise.

**Vaughan, D. (1996), *The Challenger Launch Decision: Risky Technology, Culture, and Deviance at NASA*. University of Chicago Press.**
The canonical organizational analysis of how protocol compliance erodes through incremental normalization of small deviations. The "production pressure" mechanism — schedule, budget, and competitive pressure that makes non-compliance feel adaptive rather than risky — is directly analogous to task-immersion pressure on LLM agents.

**Reason, J. (1990), *Human Error*. Cambridge University Press.**
Introduced active vs. latent failure distinction and the Swiss Cheese model. The key transferable insight is that individual layer failures are predictable and expected; system-level failures require alignment of multiple layer failures simultaneously. Design robustness requires multiple independent defensive layers, not a single well-specified one.

**Meyer, B. (1992), *Object-Oriented Software Construction*. Prentice Hall.**
Introduced Design by Contract. The key insight for this review: specification compliance is not verifiable by inspection of the specification; it requires executable assertions embedded in the execution path, with violations signaled loudly at the point of occurrence rather than discovered through downstream effects.

### Gaps and contested claims

The LLM instruction-following literature is primarily a benchmark literature and does not yet have strong theoretical accounts of *why* degradation occurs where it does — the empirical patterns are documented but the mechanistic explanation (attention weight distribution, instruction representation in context, interference between constraints) is not settled. There is no agreed taxonomy of instruction types that predicts compliance reliably; the categories used by FollowBench (Content, Situation, Style, Format, Example) and by IFEval (25 verifiable instruction types) are not aligned and have not been meta-analyzed.

The analogy between LLM instruction following and human procedural compliance is tempting but requires caution. LLMs do not have persistent cognitive resources that deplete across a task in the way human attention does; whatever "degradation" occurs is a function of how information is represented and attended to in context, not a temporal depletion process. The mechanisms are structurally different even if the observable patterns (position effects, type effects, count effects) superficially resemble each other.

---

## Q2: Attention-Budget Hypothesis (Count vs. Position vs. Type vs. Utilization)

### What the literature says about each variable

**Count effects**

The count literature is the most benchmarked. FollowBench (Jiang et al., ACL 2024) provides the clearest evidence: compliance degrades as constraint count increases from 1 to 5 in a controlled single-constraint-per-level design, across all 13 models tested. IFScale (Jaroslawicz et al., 2025) extends this to much higher densities (up to 500 instructions), finding that degradation patterns are model-family-dependent. The key finding from IFScale that is directly relevant to the author's skepticism of naive count explanations: top reasoning models (o3, Gemini 2.5 Pro) maintain near-perfect performance through 100-250 simultaneous instructions before showing degradation. If 4-5 mechanisms blow the budget, the budget was already constrained for other reasons. The finding that reasoning models perform substantially better at high instruction densities than non-reasoning models suggests the mechanism is not instruction count per se but the model's capacity to track multiple active constraints simultaneously.

**Position effects**

Position effects are robustly demonstrated across multiple independent lines of work. Liu et al. (2023) established the U-shaped curve for information retrieval: beginning > end > middle. Guo and Vosoughi (2024, arXiv 2406.15981, ACL 2025), "Serial Position Effects of Large Language Models," found consistent primacy and recency biases across tasks and models, with primacy dominant as context length increases — the middle becomes a progressively "dead" zone as prompts grow. Multiple practitioner analyses confirm that instructions placed at the beginning or end of a prompt are followed more reliably than instructions buried in the middle of long contexts. These findings are robust across model families, though the magnitude varies.

The position finding has a direct design implication: if unconditional mechanisms are specified in the middle of a long skill document that also contains extensive task instructions, they will be followed less reliably than if they are placed at the beginning or repeated at the end. This is a structural finding, not a count finding.

**Type effects**

The literature on instruction *type* is less settled. "Can LLMs Follow Simple Rules?" (arXiv 2311.04235) and related work suggest that negative constraints (things the model must *not* do) are more reliably violated than positive obligations. FollowBench's five types show different compliance rates across models, with Format and Style constraints generally more reliable than Content and Situation constraints, but this finding is from a single benchmark with 13 models and has not been independently replicated. The instruction hierarchy failure literature (Wallace 2024; Geng et al. 2025) suggests that meta-level instructions — instructions about how to process other instructions — are specifically vulnerable because they require the model to reason about its own instruction-following behavior, not just execute a task. This is distinct from the count, position, or utilization accounts: it is a claim about instruction *category* and the kind of self-referential reasoning required to execute it.

AGENTIF (Tsinghua KEG group, 2025) found that on a benchmark requiring agents to follow ~11.9 constraints per instruction, the best models perfectly followed fewer than 30% of instructions. The benchmark includes both condition constraints and tool constraints, and conditional rules (IF-THEN structures) show lower compliance than unconditional rules — a preliminary type effect finding, but from a single benchmark.

**Context window utilization effects**

The "needle in a haystack" line of work (popularized by Kamradt's open-source evaluation framework, 2024) extends the Liu et al. position finding to much longer contexts. Even models claiming 128K token context windows show degradation beyond 10% of their stated capacity (BABILong benchmark findings). The implication is that context utilization degrades before context capacity is reached — the model may be within its stated context window while effectively ignoring content in the middle. This is a utilization effect, not a count effect: it is not how many instructions exist, but where they sit relative to the attention distribution across the full context.

### Lost-in-the-middle and related findings

Liu et al. (2023) is the anchor paper. Published in TACL with the arXiv version from July 2023 (arXiv 2307.03172), it tested multi-document question answering and key-value retrieval tasks. The core finding — U-shaped performance as a function of document position in a long context — has been confirmed by subsequent work including the serial position effects literature (Guo and Vosoughi, 2024) and the needle-in-a-haystack evaluations. The architectural attention to the finding from multiple groups using different evaluation approaches makes it one of the more robustly established findings in the LLM evaluation literature.

The finding is qualified by model generation: more recent long-context models (Gemini 1.5 Pro, GPT-4 Turbo with 128K context) show improvement on retrieval from middle positions but do not eliminate the effect. The improvement is in degree, not in kind; the U-shape persists.

### Cognitive psychology analogues

The primacy and recency effects in human serial recall (Murdock, 1962; Atkinson and Shiffrin, 1968) are the classical cognitive psychology parallels. In human serial recall, items at the beginning of a list are well-encoded in long-term memory (primacy), while items at the end are still in working memory (recency). Items in the middle receive neither advantage. Miller (1956), "The Magical Number Seven, Plus or Minus Two," established that working memory capacity is approximately 7 ± 2 chunks, with later work by Cowan (2001) revising this to 3-5 chunks. Chunking — grouping related items into single meaningful units — is the cognitive mechanism for extending effective working memory capacity.

**What is transferable:** The observable pattern of primacy/recency advantage over middle-position items appears in both human recall and LLM context processing, and the "lost in the middle" finding has a structural parallel in human serial position research. Researchers studying LLMs have explicitly noted this parallel (Guo and Vosoughi, 2024).

**What is not transferable:** The mechanisms are different. Human recency effects arise from items remaining in a limited-capacity working memory buffer; human primacy effects arise from enhanced long-term memory consolidation for early items. LLMs have no equivalent of these dual-store memory systems. The LLM primacy/recency pattern likely arises from attention weight distributions and positional encoding in the Transformer architecture, not from cognitive resource depletion. Claims that "LLMs have limited working memory" are metaphorical rather than mechanistic. The practical consequence is that interventions that work for human memory (spaced repetition, interleaving, retrieval practice) do not straightforwardly apply, while structural interventions (placing critical instructions at position-privileged locations) likely do apply because the underlying mechanism — attention weighting — is structural.

---

## Q3: Harness Design Under Cognitive Load

### Checklist design and procedural compliance

Gawande's *The Checklist Manifesto* (2009) documented how a 19-item WHO Surgical Safety Checklist reduced surgical complications and mortality across a multicenter international study (Haynes et al., NEJM 2009, "A Surgical Safety Checklist to Reduce Morbidity and Mortality in a Global Population"). The design principles Gawande derived from aviation and medicine include: brevity (short enough to be completed under time pressure), exclusive focus on the highest-consequence steps (not exhaustive coverage), team communication as a primary function (not just step verification), and specific "pause points" structurally embedded in the workflow.

However, the implementation literature complicates the initial results. A systematic review and meta-analysis (PMC 11971763, 2025) found that the overall compliance rate with the WHO checklist was 73%, with only 51% completeness across all three phases (Sign In, Time Out, Sign Out — the last phase at 62%). The major limiting factor was partial completion rather than non-use. Individual barriers include cultural resistance, absent leadership, time pressure, role ambiguity, and perceived formality (checkboxes ticked without obtaining the information). The sign-out phase — which occurs at the end of the procedure when the team is cognitively winding down — has the lowest compliance. This is a position effect in procedure compliance: steps at the end of a checklist are less reliably executed than steps at the beginning, consistent with the primacy > recency > middle pattern, with recency advantage disappearing when cognitive load is high enough.

Kulp et al. (2020, SIGCHI, "Checklist Design Reconsidered") provided a systematic analysis of non-compliant checklist behaviors in trauma resuscitation, finding false check-offs (16%), inaccurate incomplete checks (5%), and missed checks (7%). Task characteristics predicting non-compliance include: tasks grouped in practice but listed separately, team leader absent at patient arrival, tasks with multiple sub-steps, and rarely-performed tasks. The mechanism is misalignment between the checklist's structure and the actual workflow, not individual carelessness.

Thomassen et al. (2011, Scandinavian Journal of Trauma) studied checklist implementation from an HRO perspective and identified the conditions for reliable compliance: checklist ownership by end-users (not imposed from above), design through participation of sharp-end operators, brevity, closed-loop communication protocols, mandatory simulation-based training, and feedback mechanisms that close the loop between compliance failures and checklist revision.

### Aviation, medical, and high-reliability domains

CRM (Crew Resource Management) training, formalized by FAA Advisory Circular 120-51D (2001) and now mandated for commercial aviation globally, emerged from accident investigation findings that most accidents resulted not from mechanical failure or pilot skill deficits but from crew communication and coordination failures under high-workload conditions. The Sterile Cockpit Rule (FAA 14 CFR 121.542, 1981) is a structurally relevant mechanism: it restricts conversation to operationally essential topics during taxi, takeoff, landing, and other critical phases. This is not a checklist item; it is a structural constraint on permissible communication that actively removes distractors during high-consequence periods. The rule enforces protocol compliance by limiting the interference channel, not by reminding the crew to comply with the protocol.

Weick and Sutcliffe's HRO theory (2007, *Managing the Unexpected*) identifies five organizational principles for maintaining reliability under complex, high-consequence conditions: preoccupation with failure (treating near-misses as data rather than lucky outcomes), reluctance to simplify (maintaining nuanced situational awareness rather than reducing to familiar categories), sensitivity to operations (staying close to frontline reality), commitment to resilience (investing in recovery capability, not just prevention), and deference to expertise (routing decisions to the most knowledgeable person, not the most senior). The structural implication is that compliance is maintained through a culture of active attention to deviation, not through a single well-designed protocol.

Reason's Swiss Cheese model (1990) provides the architectural frame: no single defensive layer is reliable; systemic safety requires multiple independent layers whose holes do not align. The model is explicitly a harness design argument: individual executor reliability cannot be the primary defense, so the harness must provide redundancy.

### Software reliability under partial executor failure

The software reliability literature approaches the specification-execution gap through testing and assertion design. The foundational principle of Design by Contract (Meyer, 1992) is that contracts must be *executable*: a specification that is not automatically checked is a specification that will silently drift. The analogous principle for LLM harness design is that any mechanism that is not structurally enforced — mechanically triggered, with a visible failure signal — will eventually be dropped.

The flaky test literature (see ScienceDirect, "Test flakiness: causes, detection, impact and responses," 2023) documents failure modes in automated test systems that are structurally analogous to the RDD Cycle 9 failure pattern. Flaky tests fail intermittently, which is qualitatively different from consistently failing tests: intermittent failure creates an environment where failures are rationalized as transient rather than investigated as signals. The design principle that emerges from the flaky test literature is "fail loud and fail local": failures should be immediately observable, attributed to the specific failing assertion, and not automatically retried in ways that mask the failure from downstream consumers. Google's internal data (frequently cited in the flaky test literature) found that 84% of pass-to-fail transitions in their CI were flaky rather than real failures, illustrating how high-frequency non-failures create a background of normalization within which actual failures are invisible.

Conformance testing (NIST, ISO standards) separates the question of "does this implementation conform to its specification?" from the question of "does this system do what users want?" Conformance tests define atomic observable behaviors derived from the specification and test each one independently. The implication for LLM harness design is that mechanism compliance requires independently verifiable, observable behaviors — not holistic assessments of whether the output is good.

### Human-in-the-loop AI and attention preservation

The HITL AI literature is young and largely practitioner-facing, but a consistent finding emerges: when humans are required to review all AI outputs, review quality degrades as volume increases (Ravi Palwe, "Review Fatigue Is Breaking Human-in-the-Loop AI," Medium, 2026; cited as practitioner observation, not peer-reviewed research). The mechanism is vigilance decrement applied to AI oversight: when the system routes everything to human review, each individual review item receives less attention, and the approval process becomes a formality rather than a check. The design response, consistent across multiple sources, is selective oversight: route high-uncertainty, high-consequence items to humans while allowing low-confidence items to be handled by the system, thereby preserving human attention for decisions where it is actually needed.

This finding has a direct structural parallel in the Cycle 10 failure observation that the Susceptibility Snapshot and subagent audit mechanisms were dropped. If those mechanisms are dispatched by the agent itself, the agent's task-level engagement is precisely the condition that depresses their execution likelihood. The design response is to move their dispatch out of the agent's voluntary action space.

---

## Cross-cutting findings

**1. Structural enforcement beats instructional specification, across all domains.**
Software engineering (runtime assertions enforce contracts), aviation (Sterile Cockpit Rule restricts communication structurally), medicine (WHO checklist creates mandatory pause points), and LLM evaluation (instruction hierarchy training changes behavior where prompt specification does not) all converge on the same finding: specifications that depend on the executor voluntarily applying them are less reliable than mechanisms that structurally prevent or detect non-compliance. The executor's intent to comply is insufficient; the harness must make non-compliance either impossible or immediately visible.

**2. Failure detection requires external vantage point.**
The "grading your own homework" problem appears in multiple guises: Reason's latent conditions are invisible to the individuals whose decisions created them; normalization of deviance occurs precisely because the deviating agent has a rationalization for each deviation; flaky tests that automatically retry mask their own failure; LLMs generating content in a context that also contains the specification they are supposed to follow cannot reliably audit that specification. The consistent design response across domains is context isolation: auditing must be done by an entity that does not share the context of the work being audited.

**3. Position effects are robust; count effects alone are not.**
Across both the LLM literature and the human factors / checklist literature, where something is placed in a procedure matters more than how many things are in the procedure. The sign-out phase of the WHO checklist (end position, high workload) has the lowest compliance. The middle of a long LLM context has the lowest instruction recall. Instructions at the beginning of a system prompt are more reliably followed than instructions buried after extensive task context. This has a direct design implication: critical mechanisms should be placed at structurally privileged positions, not embedded in the middle of dense task instructions.

**4. Type effects are under-studied but promising.**
The evidence that meta-level instructions (instructions about how to apply other instructions) fail at higher rates than object-level task instructions is preliminary but consistent across the instruction hierarchy literature (Geng et al., 2025), the agentic failure mode literature (Roig, 2025; Cemri et al., 2025), and the sycophancy literature (Kim et al., "Challenging the Evaluator," ACL 2025). The mechanism suggested by Geng et al. is specifically important: pretraining-derived social priors (authority, expertise, consensus) override post-training instruction hierarchies. This is a type effect (social-framing instructions override structural-framing instructions), not a count effect.

**5. Failure silence is the critical amplifier.**
Across all domains, the most dangerous failure mode is silent compliance failure — where the mechanism was supposed to run but did not, with no visible signal of its absence. Normalization of deviance in organizations, flaky tests in software, sign-out phase skipping in surgical checklists, and subagent dispatch falling back to in-context execution in LLM systems all share this structure. The Swiss Cheese model predicts exactly this: latent conditions are dangerous precisely because they are invisible until they align with an active failure. "Fail loud" design philosophy (make every non-execution visible) is the canonical response.

---

## Implications for the Cycle 10 Investigation

The literature maps onto the six observed failures and the project author's interpretive categories as follows:

**Type 1 failures (meta-level mechanisms dropped during task-level immersion — items 4, 5) are most strongly supported by the structural enforcement literature.** The consistent finding across software engineering, aviation, medicine, and organizational behavior is that mechanisms that depend on the executor voluntarily initiating them will be dropped under task load. This is not an attention-budget problem in the naive sense; it is a structural problem. The executor (the LLM in task context) is not the right entity to dispatch audits of its own work. The literature predicts exactly this failure and the design response it implies: move dispatch out of the agent's voluntary action space into the harness.

**Type 2 failures (moment-recognition — item 6, belief-mapping not triggered on user pushback) are most consistent with the type-effects and social-priors findings.** Geng et al. (2025) specifically found that authority and consensus cues override structural instruction hierarchies. The failure in item 6 (user pushback treated as an update to a documented constraint) is mechanistically consistent with this: the social signal (user disagreeing) overrides the structural signal (threat model specifying the constraint). The literature suggests this is a type effect — meta-level instructions specifying how to handle social pressure are less reliably executed than object-level task instructions — and that text instructions specifying "apply belief-mapping when X occurs" will not reliably survive contact with the X-type event they are meant to handle. This is the hardest failure type to address through harness design alone, because moment-recognition is precisely what harnesses struggle to trigger.

**The "text ambiguity failures" (items 1-3, already patched) are consistent with the FollowBench and IFEval findings** that nuanced specification language — conditional rules, embedded exceptions, compound instructions — is reliably followed less well than simple, unambiguous directives. The patches that made rules unconditional and reordered them are structurally consistent with the literature recommendations (brevity, removal of conditionality, position privileging).

**The structural vs. pedagogical interpretation:** The literature does not support the pedagogical interpretation (deeper understanding will produce reliable compliance). The human factors and organizational behavior literature consistently finds that even well-trained, highly skilled operators show compliance failures under task load — the Challenger engineers understood the risk; the surgical team understood the checklist protocol; the radar operators understood their monitoring task. Understanding is insufficient. The literature strongly supports the structural interpretation (mechanical enforcement is needed) for Type 1 failures.

**The observability interpretation** is strongly supported: silent failures (items 4, 5 produced no visible signal of omission) are the most dangerous failure mode across all literatures reviewed. The design implication is that every mechanism dispatch should produce an observable artifact — even if the artifact is "mechanism X was skipped and here is why" — rather than a silent absence.

**The acceptance-criteria interpretation** is indirectly supported by the conformance testing and HRO literatures: without an independent, automated check that a mechanism ran (not just that it was in the instructions), there is no way to distinguish compliance from non-compliance. The analogous principle is that absence of a failure signal is not evidence of compliance when the mechanism that would generate failure signals has not run.

**What the literature does not settle:** The literature does not directly address whether a *single-session* LLM agent (as opposed to a multi-agent system) can reliably self-monitor for mechanism execution under high task load, even with well-placed, structurally enforced instructions. The agentic failure mode literature (Roig, 2025; Cemri et al., 2025) focuses primarily on multi-agent architectures. Whether the structural interventions (isolated subagent contexts, mandatory artifact generation) sufficient for multi-agent settings translate to single-agent sessions is not directly tested. This should be resolved through empirical spikes rather than inferred from the literature.

The literature also does not address whether the specific failure pattern in item 6 (moment-recognition failure for belief-mapping) can be reliably addressed through any harness mechanism short of model fine-tuning, given Geng et al.'s finding that social priors from pretraining override post-training instruction hierarchies. This is a genuinely open question.

---

## Sources

Atkinson, R. C., & Shiffrin, R. M. (1968). Human memory: A proposed system and its control processes. *Psychology of Learning and Motivation*, 2, 89–195.

Cemri, M., Pan, M. Z., Yang, S., Agrawal, L. A., Chopra, B., Tiwari, R., Keutzer, K., Parameswaran, A., Klein, D., Ramchandran, K., Zaharia, M., Gonzalez, J. E., & Stoica, I. (2025). Why do multi-agent LLM systems fail? arXiv:2503.13657. Accepted at NeurIPS 2025.

Cowan, N. (2001). The magical number 4 in short-term memory: A reconsideration of mental storage capacity. *Behavioral and Brain Sciences*, 24(1), 87–114.

FAA. (2001). *Crew Resource Management Training* (Advisory Circular 120-51D). Federal Aviation Administration.

Gawande, A. (2009). *The Checklist Manifesto: How to Get Things Right*. Metropolitan Books.

Geng, Y., Li, H., Mu, H., Han, X., Baldwin, T., Abend, O., Hovy, E., & Frermann, L. (2025). Control illusion: The failure of instruction hierarchies in large language models. arXiv:2502.15851. Accepted at AAAI-26.

Green, D. M., & Swets, J. A. (1966). *Signal Detection Theory and Psychophysics*. Wiley.

Guo, X., & Vosoughi, S. (2024). Serial position effects of large language models. arXiv:2406.15981. In *Findings of ACL 2025*.

Haynes, A. B., Weiser, T. G., Berry, W. R., Lipsitz, S. R., Breizat, A. H. S., Dellinger, E. P., ... & Gawande, A. A. (2009). A surgical safety checklist to reduce morbidity and mortality in a global population. *New England Journal of Medicine*, 360(5), 491–499.

Jaroslawicz, D., et al. (2025). How many instructions can LLMs follow at once? arXiv:2507.11538.

Jiang, Y., Wang, Y., Zeng, X., Zhong, W., Li, L., Mi, F., Shang, L., Jiang, X., Liu, Q., & Wang, W. (2024). FollowBench: A multi-level fine-grained constraints following benchmark for large language models. In *Proceedings of ACL 2024*. arXiv:2310.20410.

Kim, S., et al. (2025). Challenging the evaluator: LLM sycophancy under user rebuttal. In *Findings of EMNLP 2025*. arXiv:2509.16533.

Kulp, L., Sarcevic, A., Zheng, Y., Cheng, M., Alberto, E., & Burd, R. (2020). Checklist design reconsidered: Understanding checklist compliance and timing of interactions. *Proceedings of the CHI Conference on Human Factors in Computing Systems*. PMC7368994.

Liu, N. F., Lin, K., Hewitt, J., Paranjape, A., Bevilacqua, M., Petroni, F., & Liang, P. (2023). Lost in the middle: How language models use long contexts. *Transactions of the Association for Computational Linguistics*, 12. arXiv:2307.03172.

Mackworth, N. H. (1948). The breakdown of vigilance during prolonged visual search. *Quarterly Journal of Experimental Psychology*, 1(1), 6–21.

Meyer, B. (1992). *Object-Oriented Software Construction*. Prentice Hall.

Miller, G. A. (1956). The magical number seven, plus or minus two: Some limits on our capacity for processing information. *Psychological Review*, 63(2), 81–97.

Murdock, B. B. (1962). The serial position effect of free recall. *Journal of Experimental Psychology*, 64(5), 482–488.

Reason, J. (1990). *Human Error*. Cambridge University Press.

Roig, J. V. (2025). How do LLMs fail in agentic scenarios? A qualitative analysis of success and failure scenarios of various LLMs in agentic simulations. arXiv:2512.07497.

Thomassen, Ø., Espeland, A., Søfteland, E., Lossius, H. M., Heltne, J. K., & Brattebø, G. (2011). Implementation of checklists in health care: Learning from high-reliability organisations. *Scandinavian Journal of Trauma, Resuscitation and Emergency Medicine*, 19(53). PMC3205016.

Vaughan, D. (1996). *The Challenger Launch Decision: Risky Technology, Culture, and Deviance at NASA*. University of Chicago Press.

Wallace, E., Xiao, K., Leike, R., Weng, L., Heidecke, J., & Beutel, A. (2024). The instruction hierarchy: Training LLMs to prioritize privileged instructions. arXiv:2404.13208. OpenAI.

Weick, K. E., & Sutcliffe, K. M. (2007). *Managing the Unexpected: Resilient Performance in an Age of Uncertainty* (2nd ed.). Jossey-Bass.

Zhou, J., Lu, T., Mishra, S., Brahma, S., Basu, S., Luan, Y., Zhou, D., & Hou, L. (2023). Instruction-following evaluation for large language models. arXiv:2311.07911.
