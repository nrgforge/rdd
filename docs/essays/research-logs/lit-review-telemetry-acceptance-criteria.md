# Literature Review: Telemetry, Harness Composition, and Acceptance Criteria for AI Agent Protocols
*2026-04-06*

## Abstract

Three interlocking questions animate this review: how to detect silent failures in systems where the executor cannot be trusted to report its own non-execution; what harness design patterns work when the executor is non-deterministic or unreliable; and what it would mean for an AI agent protocol-compliance mechanism to have acceptance criteria — observable, verifiable properties that distinguish a working mechanism from a failed one. The distributed systems literature provides mature answers to Q1 through the Dapper trace model, watchdog/dead-man-switch patterns, and the SRE monitoring philosophy (symptom-oriented alerting, blackbox probing, alerting on SLO violation rather than on causes). Q2 is answered with actionable design patterns from flaky-test mitigation, ML pipeline circuit breakers, and HITL research on automation complacency — the through-line is that reliability must be asserted at the harness level, not assumed from the executor. Q3 is the most important and least answered question: the AI-agent-specific protocol-verification literature is nascent (AgentGuard, 2025; Sherlock, 2025) and does not yet provide acceptance-criteria frameworks for protocol-step execution. The analogous fields — Design by Contract, runtime verification, process mining, and Aspect-Oriented Programming — provide the conceptual vocabulary and design principles needed to build such frameworks, but nobody has yet assembled them into a coherent acceptance-criteria discipline for agentic AI protocols. That gap is the most actionable finding: it is not a literature question, it is a design question, and it is spike-shaped.

---

## Method

Searches were conducted via web search in April 2026. Sources covered: foundational CS and systems papers (Dapper/Sigelman et al. 2010; SRE Book/Beyer et al. 2016; Meyer DbC; Bartocci & Falcone 2018 runtime verification survey); peer-reviewed literature from Human Factors, ICST, and related venues (Parasuraman & Manzey 2010; Leinen et al. ICST 2024); arXiv preprints from 2024–2025 in agentic AI (AgentGuard arXiv:2509.23864; Sherlock arXiv:2511.00330); practitioner documentation (OpenTelemetry; LangSmith; LangFuse; Arize Phoenix; Helicone; NIST conformance testing); and the van der Aalst process mining corpus (2011, 2016). The first lit review (lit-review-instruction-following-degradation.md, same session) covered instruction-following degradation, attention, harness design under cognitive load, and checklist compliance — those findings are not re-covered here except where directly cross-applicable. Excluded: blog posts where primary sources were available. Sources that could not be verified as real and retrievable are not cited.

---

## Q1: Telemetry for Silent Failures

### Distributed tracing and observability literature

The foundational paper is Sigelman et al., "Dapper, a Large-Scale Distributed Systems Tracing Infrastructure" (Google, 2010). Dapper's three design goals are directly relevant to the silent-failure problem: **low overhead** (tracing that slows the system it monitors will be disabled under load), **application-level transparency** (the tracing infrastructure should not require each application component to implement its own trace reporting — gaps in voluntary reporting defeat ubiquity), and **ubiquitous deployment** (tracing that is on only some of the time cannot reconstruct what actually happened across a chain of calls). The transparency goal is the architecturally critical one for this cycle: Dapper achieves it by instrumenting shared infrastructure libraries (the RPC layer) rather than relying on application-level cooperation. The span-and-trace data model is the mechanism: every remote call generates a span with a globally unique identifier, a parent span reference, and timing; the trace reconstructs the call tree from these spans. The design question Dapper answers is: **how do you know a remote call happened?** The answer is: you instrument the transport layer, not the callee's cooperative reporting.

OpenTelemetry (CNCF, production-stable 2021, now the industry standard) generalizes the Dapper model into a vendor-neutral framework. A trace captures every operation — model calls, retrieval steps, tool executions, custom logic — along with timing, inputs, outputs, and metadata. Context propagation in OpenTelemetry allows spans to be linked across service boundaries into a complete distributed trace showing the end-to-end lifecycle of a request. The key design choice that makes this useful for detecting silent failures is that **context propagation is the transport's responsibility**: when a component does not emit a span, the parent span shows a gap in the causal chain. Absence is visible as absence, not as silence.

The **structural implication for AI agent harnesses**: if an agent dispatches a subagent, and the subagent dispatch fails, the trace should show the dispatch attempt and its failure — not silence. Current AI observability tools (LangSmith, LangFuse, Arize Phoenix) instrument at the framework layer (tool calls, LLM invocations), which is analogous to Dapper's RPC instrumentation. However, the critical gap noted in the current observability literature is that **protocol steps that are not tool calls or LLM invocations go untraced**: if an agent is supposed to run an audit but the audit is "supposed to happen" as a higher-level protocol step (not encoded as a tool call or specific LLM invocation), there is no mechanism analogous to the Dapper RPC span that makes its absence visible.

### Heartbeat, watchdog, and liveness detection patterns

The heartbeat pattern (documented as a pattern in Fowler's Patterns of Distributed Systems, and implemented in Kubernetes, ZooKeeper, etcd, and virtually all distributed coordination systems) addresses a structurally equivalent problem: distinguishing "still working" from "silently dead." A node that has failed does not announce its failure; absence of expected heartbeats triggers the failure response. The design is **inverse of normal reporting**: instead of signaling when something goes wrong, the pattern requires continuous affirmative signaling that everything is fine. Absence of the affirmative signal is the failure condition.

**Push vs. pull heartbeats**: Push-based systems have each node actively send "I'm alive" signals; pull-based systems poll nodes. Push is more sensitive to failure (missed sends are immediately observable) but requires the potentially-failed node to cooperate. Pull-based monitoring does not depend on the monitored node's cooperation — the monitor initiates the check independently. For the problem of detecting whether a protocol step fired, the pull analogy is external verification: an independent component checks whether the expected step occurred, rather than relying on the executing component to report that it did.

**Watchdog timers** and **dead-man switches** are the hardware/software embodiment of forced disclosure. A watchdog timer must be periodically reset ("petted") by the monitored process; if the process fails to reset it within the interval, the watchdog fires. The critical design property is that the watchdog fires not because the process reported a failure, but because it **stopped reporting success**. This is precisely the pattern needed for detecting protocol step non-execution: the mechanism fires if it does not receive an affirmative "I ran" signal from the protocol step within the expected window. In safety-critical embedded systems (automotive ECUs, spacecraft safe-mode logic), this pattern is a hard requirement, not an optional monitoring layer, because the systems must be safe in the face of silent failure of the primary execution path.

**The Phi Accrual Failure Detector** (used in Cassandra and Akka) extends the binary alive/dead model by computing the probability that a node has failed based on statistical analysis of heartbeat inter-arrival times. This adaptive approach reduces false positives under variable load. For agentic systems with variable execution time (some audit steps take longer than others), this statistical approach is relevant: fixed timeout thresholds will generate false failure alerts; adaptive thresholds calibrated to observed execution time distributions are more appropriate.

### SRE and monitoring philosophy

Beyer et al., *Site Reliability Engineering* (Google, 2016), Chapter 6 (written by Rob Ewaschuk), establishes a monitoring philosophy with direct structural parallels for AI agent protocol monitoring.

**Four golden signals**: latency (how long did it take?), traffic (how much demand?), errors (what fraction of requests failed?), and saturation (how close to capacity?). For AI agent protocol monitoring, the analogous signals are: step latency (did the step complete in expected time?), step coverage (what fraction of applicable sessions triggered the step?), step failure rate (what fraction of step executions failed or fell back to degraded mode?), and step load (is the mechanism being triggered at appropriate rate relative to workload?).

**Blackbox vs. whitebox monitoring**: Whitebox monitoring exposes the system's internal state (logs, metrics, profiling interfaces). Blackbox monitoring tests the system from the outside — probing observable behavior without access to internals. The SRE philosophy is that **blackbox monitoring is symptom-oriented**: it fires when something is actually broken right now, not when an internal metric crosses a threshold that might predict future problems. The critical SRE insight is that whitebox monitoring can be deceived — if the internal reporting mechanism itself has failed, whitebox monitoring will not show the failure. Blackbox monitoring is structurally more robust for detecting failures of the monitoring/reporting infrastructure itself. For AI agent protocol monitoring, blackbox verification (did the expected artifact appear? did the expected step produce an externally observable result?) is structurally more robust than relying on the agent's own trace reporting.

**Symptoms vs. causes, and alerting on SLOs**: The SRE prescription is to alert on user-visible symptoms (the SLO is being violated) rather than on the internal causes that might produce those symptoms. For protocol compliance, the analogous prescription is to alert on the *absence of expected artifacts* (the compliance SLO is violated) rather than on the specific internal cause (whether the failure was due to task immersion, subagent dispatch failure, or any other mechanism). This shifts the detection problem from "why did it fail?" to "did the expected observable output appear?" — a materially easier question to automate.

### AI agent observability tools

LangSmith (LangChain's native observability platform) traces every LLM call, tool call, chain execution, and retrieval step in LangChain/LangGraph workflows. LangFuse (open source, OpenTelemetry-based) provides nested trace views across distributed service boundaries and is framework-agnostic. Arize Phoenix instruments model calls, retrieval steps, tool use, and custom logic with OpenTelemetry-based spans. Helicone focuses on LLM request-level logging (prompts, completions, costs, latency) with session-level workflow tracking.

**What these tools trace**: LLM invocations, tool calls (with parameters and results), chain/graph step transitions, retrieval events, token counts, latency, errors.

**What these tools do not trace**: Protocol-level obligations that are not encoded as tool calls or LLM invocations. If an agent is supposed to dispatch a subagent but instead runs the audit in its own context (the Cycle 10 failure pattern), the observability tool records the LLM calls that produced the audit-shaped output — it does not record the fact that a subagent dispatch was supposed to happen and did not. The trace is informationally complete from the tool's perspective (it captured everything that happened) but diagnostically incomplete from the protocol-compliance perspective (it does not capture what was supposed to happen but did not).

The **observability gap** for AI agent protocols is structurally identical to the Dapper ubiquity problem: if tracing is only of what actually happened (tool calls, LLM invocations), and the failure mode is a *failure to attempt* a protocol step, the trace is blind to exactly the failure it needs to detect. Dapper solved this at the RPC layer by making every RPC attempt generate a span, regardless of success or failure. The analogous solution for AI agent protocols is to make every protocol obligation generate an expected span, and make the absence of that span auditable.

**AgentGuard** (Koohestani et al., arXiv:2509.23864, ASE 2025) is the closest existing work to an acceptance-criteria framework for AI agent protocols. It operates as an inspection layer that observes an agent's raw I/O, abstracts it into formal events corresponding to transitions in a state model, and uses online learning to build a Markov Decision Process (MDP) modeling the agent's emergent behavior. Probabilistic model checking then verifies quantitative properties in real-time. The explicit framing is "Dynamic Probabilistic Assurance" — the answer to "did this agent behave as specified?" is a probability distribution, not a binary. The tool is a proof-of-concept Python framework (2025), not a production system, but its architecture makes the right design choices: it is framework-agnostic, decoupled from the agent (verification logic lives outside agent code), and defines a state model externally in YAML.

**Sherlock** (arXiv:2511.00330, Microsoft Research, 2025) addresses agentic workflow reliability through selective verification and speculative execution. It identifies error-prone nodes in a workflow graph through counterfactual analysis and attaches cost-optimal verifiers only where needed. At runtime, Sherlock speculatively executes downstream tasks while verification runs in background; if verification fails, execution is rolled back. It achieves 18.3% average accuracy improvement over non-verifying baselines and 48.7% reduction in execution time over non-speculative execution. The design insight relevant to this cycle: **verifying every step is too expensive; selective verification at identified error-prone nodes is sufficient and dramatically more cost-effective**. The implication for Tier 1 mechanism acceptance criteria is that the priority for instrumentation is error-prone steps (Cycle 10's failing mechanisms), not uniform coverage of all steps.

### Key design principles for Q1

**1. Instrument the transport layer, not the executor's voluntary reporting.** Dapper's transparency goal: if you depend on each component to report its own execution, gaps in voluntary reporting defeat the system. Instrument shared infrastructure (the subagent dispatch mechanism, the tool call layer) so that attempts are recorded regardless of whether the callee cooperated.

**2. Invert the signal: require affirmative reporting, alert on its absence.** Heartbeat/watchdog pattern: expected behavior should generate a continuous signal; absence of signal is the failure condition. Applied to protocol steps: a Tier 1 mechanism that ran should generate an observable artifact; the harness checks for the artifact, and absence of the artifact is the alert condition.

**3. Alert on symptoms (absence of expected artifacts), not causes (why the step didn't fire).** SRE philosophy: blackbox monitoring on user-visible outcomes is more robust than whitebox monitoring on internal causes, because the internal reporting mechanism can itself fail. For protocol compliance: check for the expected output artifact, not for evidence that the mechanism attempted to fire.

**4. External verification beats self-reporting.** The AI agent observability blind spot is precisely the Dapper ubiquity problem applied at the protocol level: what was supposed to happen but didn't is invisible to tools that only trace what did happen.

**5. Selective verification at error-prone nodes (Sherlock).** Full coverage verification is expensive; prioritize verification at nodes identified as failure-prone through observation.

---

## Q2: Harness Patterns for Non-Deterministic Executors

### Flaky test mitigation patterns

The academic and practitioner literature on flaky tests is substantial. Leinen et al. (ICST 2024) found that a team of ~30 developers spent 2.5% of productive time dealing with flaky tests, with 1.3% on repairs alone. Google's internal data shows that new flakes appear at roughly the same rate as old ones are fixed, suggesting that the accumulation dynamic is structural rather than solvable through individual remediation.

The primary mitigation strategies form a design space:

**Retry approach**: Re-run failing tests, optionally on a clean machine. Tradeoff: retries mask flakiness from upstream consumers and create a normalization dynamic — if the test passes on second attempt, the failure signal disappears. Google's data that 84% of pass-to-fail transitions in CI are flaky (rather than real failures) illustrates how normalization occurs: the background rate of false-failure signals becomes high enough that the signal channel carries essentially no information. Retries should be logged and visible, not silent.

**Quarantine approach**: Detected flaky tests are removed from the blocking test run while still tracked. Tradeoff: you lose blocking coverage (real breakages in quarantined tests do not prevent merge), but you preserve the signal integrity of the non-quarantined suite. Atlassian's Flakinator platform implements quarantine with automated ownership assignment and Jira ticketing — the quarantine is not indefinite, and quarantined tests carry ownership metadata. The design principle: **quarantine is a temporary safe harbor with a mandatory exit path, not a disposal mechanism**.

**Ownership and alerting**: Research from Google, Slack, and Atlassian shows that assigning each flaky test an owner with threshold-triggered alerts is the most effective structural intervention. Without ownership, flaky tests accumulate (broken windows effect: individual tests are individually rationalized as acceptable, but the aggregate creates an environment where test failures carry no information). With ownership, the individual accountability prevents normalization. This is the organizational-behavior analog of the HRO principle "sensitivity to operations."

**The broken-windows structural finding**: Flakiness only becomes truly dangerous when there is a culture of toleration rather than control. At Google, the normalization dynamic means that even a small rate of flaky tests degrades the information content of the entire test suite. The structural lesson: **a single noisy signal channel degrades all information in that channel**, not just the noisy signal. Applied to Tier 1 mechanisms: a mechanism that fires unreliably (intermittent non-execution) is more dangerous than a mechanism that never fires, because the intermittent pattern produces normalization ("it usually works") rather than the visible absence that triggers investigation.

### Probabilistic pipeline reliability

The circuit breaker pattern in ML/data pipelines (Monte Carlo circuit breakers, September 2024; production pattern in data engineering) provides a runtime mechanism that stops pipeline execution when data quality metrics cross a threshold. Unlike a quality gate (which validates code at deployment), a circuit breaker validates *data* during active execution. If metrics deviate from the expected distribution (Z-score > 3 standard deviations from rolling mean), the circuit opens and halts downstream data flow.

The key design choice is **stage-level vs. pipeline-level reliability assertion**: asserting only at the pipeline's output misses failures that occur mid-pipeline and get compounded through downstream stages (a data quality problem at stage 2 produces corrupted outputs at stages 3-5 that look like stage 3-5 failures). Stage-level assertions catch failures at their source and prevent propagation. For AI agent protocol harnesses, the analogous pattern is per-step verification rather than end-of-session audit: checking that each protocol step ran before allowing the workflow to proceed past it.

**Speculative execution with rollback** (Sherlock's pattern): when verification is expensive, run the next steps speculatively in parallel with verification; if verification fails, roll back to the last verified checkpoint. This is the production pattern for handling the cost/reliability tradeoff in sequential pipelines where later steps depend on earlier steps being correct.

### HITL design responses to vigilance decrement

Parasuraman and Manzey (2010), "Complacency and Bias in Human Use of Automation: An Attentional Integration," *Human Factors*, 52(3), 381–410, is the foundational integration of the automation complacency and automation bias literatures. Key findings: automation complacency occurs under multiple-task load (manual tasks compete with the automated task for attention); it is found in both naive and expert participants and **cannot be overcome with simple practice or training**; automation bias (making errors of omission and commission when decision aids are imperfect) similarly **cannot be prevented by training or instructions**. The mechanism is attentional: the more reliable the automation appears, the less vigilant its human overseers become.

The structural implications for harness design:

**Selective oversight / confidence-threshold escalation**: Route low-confidence, high-stakes outputs to human review; allow high-confidence, low-stakes outputs to pass without review. This preserves human attentional resources for decisions where human judgment is actually needed. The design principle is not that humans review more; it is that humans review *less* — specifically, the items where their judgment adds value, not a uniform sample of all outputs.

**Active tasks to prevent complacency**: Research cited in the HITL literature suggests that requiring the reviewer to perform an *active task* (not just approve/reject) reduces automation bias — the human must engage with the content rather than rubber-stamp it. "Friction roles" force deliberate slowing of the decision process. Applied to Tier 1 mechanism verification: requiring the human to actively confirm a mechanism's output rather than passively noting its presence preserves the information value of the confirmation.

**Rotation and blind tests**: Rotating reviewers and injecting known-failing cases (blind tests) maintain vigilance by preventing the complacency that develops under long stable-operation conditions. For AI agent protocol monitoring, injecting synthetic failures (known mechanism non-executions) into the monitoring stream and tracking whether they are detected maintains the human reviewer's sensitivity to real failures.

The HITL literature is converging on a finding the first lit review noted: "Human-in-the-Loop has hit the wall" (SiliconAngle, 2026, citing multiple research groups). At scale, human oversight of AI decision-making is not viable if every decision requires review. The design response is not to eliminate human oversight but to make it selective, active, and structurally positioned where it adds value — precisely the Sherlock insight applied to human review rather than automated verification.

### Cross-cutting principles for Q2

**1. Reliability must be asserted at the harness level, not assumed from the executor.** The flaky test, ML pipeline circuit breaker, and HITL research all converge on this: executors are unreliable by nature; the harness must detect and surface non-execution.

**2. Intermittent failure is more dangerous than total failure** because it produces normalization. A mechanism that never fires produces visible absence; one that fires 70% of the time produces a background of "usually works" that masks the 30% of failures.

**3. Active enforcement over passive review.** Whether the enforcer is a circuit breaker, a watchdog timer, or a human reviewer with an active task, passive monitoring without an action trigger is weaker than active enforcement with a halting/alerting response.

**4. Ownership with mandatory exit paths.** Quarantine without ownership is disposal; ownership without exit paths is postponement. Flaky tests, ML pipeline failures, and protocol mechanism non-executions all require an owner with accountability and a path back to compliance.

**5. Selective targeted verification is more cost-effective than uniform coverage** (Sherlock). Not every step needs verification; error-prone nodes need it most.

---

## Q3: Acceptance Criteria for AI Agent Protocols

### Conformance testing tradition

NIST's Information Systems Group defines conformance testing as "testing to see if an implementation meets the requirements of a standard or specification." The methodology is specific: (1) analyze the specification to derive test assertions (TAs); (2) each TA must be as simple as possible, narrowly focused on a single atomic functionality, non-contradictory with other TAs, and have a testable consequence; (3) the test suite implements one test case per TA; (4) the goal is *falsification testing* — systematically attempting to demonstrate that the implementation violates each assertion.

The ANSI/NIST-ITL 1 biometric standards conformance suite illustrates the scale: over twelve hundred test assertions organized into tables, covering a single technical standard. The key principle is that a conformance suite is *only as complete as the assertions list* — if a behavior is not represented as a TA, it cannot be assessed. For AI agent protocol compliance, this implies: every protocol obligation must be expressible as an atomic, testable assertion, and the acceptance criteria for the protocol are the complete list of those assertions.

The NIST conformance testing framework separates conformance from acceptance: an implementation can conform to a specification while still failing user acceptance, and an implementation can satisfy user acceptance while failing to conform to the specification. For Tier 1 mechanism compliance, this distinction matters: the question is not "did the conversation go well?" (acceptance) but "did mechanism X execute when it was supposed to?" (conformance). These are independent questions, and answering the conformance question requires independent conformance assertions.

### Design by Contract — runtime verification

Meyer's Design by Contract (DbC), introduced in Eiffel and elaborated in *Object-Oriented Software Construction* (1992, 2nd ed.), is covered in the first lit review. The principle relevant here: contracts must be *executable* — preconditions, postconditions, and invariants are verified at runtime by a mechanism external to the normal execution path. If the mechanism is not structural (not embedded in the execution path as an assertion that fires automatically), it will eventually be skipped. **A specification that is not automatically checked is a specification that will silently drift.**

The direct analogy to AI agent protocol compliance: a Tier 1 mechanism specified in natural language instructions but not checked by a structural mechanism (one that fires on every applicable session and alerts on non-execution) is precisely a DbC contract that is not automatically verified at runtime. The specification exists; the structural enforcement does not.

Practical implementations of DbC exist in multiple languages: Eiffel (native), Ada 2012 (native), .NET Code Contracts (now archived, superseded by Roslyn analyzers), Python's `icontract` and `deal` libraries. The architectural pattern across all implementations is the same: contracts are defined *close to the code they constrain*, verified *at every call site*, and violations are *signaled immediately at the point of occurrence rather than discovered through downstream failures*.

The practical lesson: accepting DbC semantics means accepting that contracts must fire on *every call*, not on a sample. The equivalent for AI agent protocol acceptance criteria is that Tier 1 mechanisms must be verified on every applicable session, not on spot checks. Sampling may be acceptable for auditing purposes, but the acceptance criterion is based on the full population.

### Runtime verification literature

Bartocci, Falcone, Francalanza, and Reger, "Introduction to Runtime Verification," in *Lectures on Runtime Verification: Introductory and Advanced Topics* (Springer LNCS 10457, 2018), is the field's standard survey. Runtime Verification (RV) is formally defined as the discipline of monitoring program execution against a formal specification expressed as a temporal logic formula or automaton. The monitor is external to the program being verified — it observes execution traces and raises an alarm when the trace violates the specification. The theoretical questions the field addresses include: **monitorability** (can a given property be monitored at all?), **monitor synthesis** (can a monitor be algorithmically derived from the specification?), and **overhead** (what is the cost of monitoring?).

The monitorability question is directly relevant to AI agent acceptance criteria. Not every safety property is monitorable: properties that require observing infinite future behavior (liveness properties in the strict sense) are not monitorable in finite time. However, **safety properties** ("the bad thing does not happen") and **step-execution properties** ("this step was executed") are monitorable on finite traces. "Did Tier 1 mechanism X execute this session?" is a safety property (its violation is detectable as a finite trace event — a session ended without mechanism X firing) and is monitorable.

Havelund's Java PathExplorer (FMSD, 2001) and subsequent work demonstrate monitor synthesis from temporal logic specifications for Java programs. The RV conference series (annual, proceedings in LNCS) represents the state of the art. The field has matured from theoretical foundations to practical monitoring tools for real programs. The gap is that virtually all existing RV work targets *deterministic programs* — the specifications are over program states, and the monitors observe state transitions. For non-deterministic LLM agents, the state space is not finite and the transitions are not deterministic; this requires probabilistic extensions of the standard RV framework, which is exactly what AgentGuard (arXiv:2509.23864, 2025) attempts with its MDP-based probabilistic assurance.

### Process mining and workflow verification

Wil van der Aalst, *Process Mining: Data Science in Action* (Springer, 2nd ed., 2016), establishes conformance checking as a core discipline: given a process model (e.g., specified in BPMN or as a Petri net) and an event log (the record of what actually happened), conformance checking quantifies how well the observed behavior fits the specified model. The primary technique is **alignment-based conformance**: find the optimal alignment between observed trace and process model, quantifying deviations. The fitness metric measures how much of the observed behavior fits the model; precision measures how much the model allows that was never observed.

The direct application to AI agent protocol compliance: the protocol is the process model; the session transcript (or the agent's execution trace) is the event log; conformance checking determines whether the observed session followed the specified protocol. Kalenkova and van der Aalst, "Process Mining Using BPMN: Relating Event Logs and Process Models" (Software and Systems Modeling, 2016) provides the technical framework for BPMN-to-event-log conformance checking. The practical challenge for AI agents is that the "event log" must be structured — unstructured natural language outputs cannot be directly compared to a formal process model without a translation layer (which is where LLM interpretation introduces its own reliability problems).

The **fitness/precision distinction** is important for acceptance criteria: a protocol with high fitness but low precision is followed when it fires but fires in many unanticipated situations; a protocol with high fitness and high precision fires exactly when expected and does not fire unexpectedly. For Tier 1 mechanisms, the acceptance criterion is high fitness (the mechanism fires in all situations it is supposed to fire) — precision is a secondary concern.

### Aspect-Oriented Programming

Aspect-Oriented Programming (AOP; Kiczales et al., ECOOP 1997) addresses cross-cutting concerns — behaviors that span multiple modules but cannot be encapsulated within any single module. The core mechanism is the **pointcut/advice/weaving** model: a pointcut defines the join points (locations in execution) where an aspect applies; advice is the behavior to add at those points; weaving injects the advice into the execution path without requiring the target module's cooperation.

The structural relevance to AI agent protocol compliance is direct: audit, compliance checking, and protocol-step verification are cross-cutting concerns. They apply to every execution of the agent's workflow, regardless of which tool calls or LLM invocations are involved. In a conventional software system, AOP would enforce these concerns by weaving monitoring code into the execution path at relevant join points — independently of whether each module author chose to call the audit code.

The **key AOP insight for this cycle**: protocol-compliance enforcement should not require the agent itself to call the compliance-checking code. It should be woven into the execution path at the framework level, analogous to how AOP weaves audit logging into a Java application at join points without requiring each method to contain logging calls. The equivalent for AI agent harnesses is framework-level enforcement of protocol obligations: the harness checks for protocol step execution at session boundaries, independently of whether the agent decided to run the step.

The failure mode that AOP was designed to prevent — compliance code scattered through application code, inconsistently applied, skipped by modules whose authors forgot to include it — is exactly the failure mode observed in Cycle 9: Tier 1 mechanisms that depend on the agent voluntarily dispatching them are structurally equivalent to audit logging that depends on each method author remembering to include a logging call.

### AI agent protocol verification — the young literature

**What exists:**

AgentGuard (Koohestani et al., arXiv:2509.23864, ASE 2025) is the most directly relevant paper. Framework-agnostic, decoupled verification layer, MDP-based probabilistic assurance, defined outside the agent's code in YAML configuration. This is an existence proof that the problem is tractable and that the engineering approach (external monitoring, formal state model, probabilistic verification) is practical. It is a proof-of-concept; it has not been applied to protocol-step execution verification specifically (it targets safety properties of agent behavior more broadly).

Sherlock (arXiv:2511.00330, Microsoft Research, 2025) addresses step-level verification in agentic workflows with selective verification and speculative execution. The selective verification architecture (instrument error-prone nodes, not all nodes) is the closest existing production-oriented design to an acceptance-criteria framework for workflow steps.

NIST's AI Agent Standards Initiative (CAISI, 2025) is formalizing authentication, authorization, and governance expectations for AI agents in enterprise environments. This is an early-stage standards effort, not yet producing conformance test suites.

**What does not exist:**

There is no established acceptance-criteria framework for AI agent protocol-step execution — nothing analogous to the NIST conformance testing methodology applied specifically to "did protocol step X fire in session Y?" This is confirmed by the null result on the direct search for this framing. The AI agent verification literature (AgentGuard, Sherlock) addresses *output quality* and *safety property satisfaction*, not *protocol step execution compliance* as a first-class observable property.

Constitutional AI (Bai et al., Anthropic, arXiv:2212.08073, 2022) describes a training-time process for embedding safety properties through AI-generated critique-and-revision cycles. The verification question — "do the constitutional principles actually fire when they are supposed to?" — is answered through evaluation benchmarks (harmlessness scores, red-teaming) rather than through session-level mechanism-firing verification. System cards and model cards (OpenAI, Anthropic, Google) document safety properties and red-teaming results but do not include verification that specific safety mechanisms fire in individual sessions. The disclosure is at the model level, not the session level. This is not a gap in the cards; it reflects the current absence of session-level mechanism-firing verification tools.

The honest characterization: the AI safety literature treats safety properties as distribution-level empirical questions (does the model's output distribution satisfy property P across a test set?) rather than as session-level mechanism-firing questions (did mechanism M execute in session S?). These are different questions with different verification methods, and the session-level version is largely unaddressed.

### Key design principles for Q3

**1. Conformance requires atomic, testable assertions** (NIST). "The protocol was followed" is not a testable assertion. "Mechanism X produced artifact Y before the session concluded" is a testable assertion. Every protocol obligation must be decomposed to this form for acceptance criteria to be operational.

**2. Specifications that are not automatically checked will silently drift** (DbC). Acceptance criteria are only meaningful if there is a structural mechanism that checks them. Natural language specifications do not count.

**3. Protocol-step execution is a monitorable safety property** (RV literature). "Session ended without mechanism X firing" is detectable as a finite trace event. The monitorability question has an affirmative answer for step-execution properties.

**4. Process mining provides the technical vocabulary for comparing actual traces to specified workflows** (van der Aalst). Fitness (observed behavior fits model) and precision (model fits observed behavior) are the right metrics for protocol conformance.

**5. Cross-cutting compliance enforcement should not require executor cooperation** (AOP). The harness, not the agent, should enforce protocol obligations. Weaving (injecting compliance checks into the execution path) at the framework level is structurally superior to relying on the agent to call compliance-checking code.

**6. The acceptance criterion for mechanism-firing is distinct from the acceptance criterion for output quality** (NIST conformance/acceptance distinction). A session can have good output while mechanism X did not fire; a session can have mechanism X fire while producing poor output. These must be measured independently.

---

## Cross-cutting findings

**Finding 1: The fundamental design move is the same across all three questions.**
Dapper achieves ubiquitous tracing by instrumenting the transport layer rather than relying on application-level cooperation. Watchdog timers detect silent failures by requiring affirmative continuous signaling rather than waiting for failure announcements. Flaky test quarantine with ownership prevents normalization by making non-execution of each test a first-class auditable event. AOP enforces cross-cutting concerns by weaving into the execution path rather than relying on each module to include compliance calls. DbC makes contracts automatically checked at every call site rather than checked by inspection. The move in every case is **from executor-voluntary to harness-structural**. The same move is needed for AI agent protocol compliance.

**Finding 2: Absence must be made visible, and visible proactively.**
Every mature approach to silent failure detection encodes "nothing happened" as a first-class observable event. The absence of a Dapper span where one was expected is an observable gap. The absence of a heartbeat is the alarm condition. The absence of a circuit breaker check artifact is the pipeline halt trigger. For AI agent protocol compliance, the absence of a Tier 1 mechanism artifact must be observable and must trigger an alert — not discovered through downstream consequence.

**Finding 3: The observability gap in current AI agent tools is precisely at the protocol level.**
LangSmith, LangFuse, Arize Phoenix, and Helicone all trace what happened (LLM calls, tool calls, chain steps). None of them trace what was supposed to happen but did not. This gap is not a failure of these tools — it reflects the absence of a protocol-level specification they could check against. The tools are correct for what they instrument; the gap is that there is no protocol-level monitoring layer above the tool-call layer.

**Finding 4: Intermittent compliance failure is worse than total failure for normalization dynamics.**
This finding appears independently in the flaky test literature (84% of pass-to-fail transitions are flaky, producing normalization of CI failures), the HRO/normalization-of-deviance literature (small deviations rationalized against prior deviations, never against the original specification), and the HITL automation complacency literature (increasing system reliability reduces human vigilance below the level needed to catch real failures). A Tier 1 mechanism that fires 70% of the time is more dangerous than one that never fires, for exactly this reason.

**Finding 5: The acceptance-criteria framing reframes the design question productively.**
Moving from "how do we make mechanisms fire reliably?" to "how do we detect when they don't fire?" is the same move as moving from prevention to detection in SRE. Detection-based design (what would make non-execution observable?) is technically easier to answer than prevention-based design (what would make execution reliable?), and it is composable with prevention: detection can trigger remediation.

**Finding 6: The Q3 question is spike-shaped, not lit-shaped.**
There is no existing framework that answers "what are the acceptance criteria for AI agent protocol-step execution?" in a way that is ready to apply. The components exist (DbC precepts, RV monitorability theory, process mining fitness metrics, AOP enforcement architecture, AgentGuard's probabilistic verification approach), but assembling them into an operational acceptance-criteria framework for a specific agent protocol requires design work that the literature has not yet done. The honest characterization: this is a design question that the cycle must answer empirically, informed by the analogous-field literature but not answered by it.

---

## Implications for the Cycle 10 Investigation

**For the subagent dispatch failure pattern (items 4, 5 in Issue #9):**

The observability literature provides a direct design prescription: the subagent dispatch attempt should generate a span, and the span should include whether dispatch succeeded and, if it failed, what error was returned. Current AI agent observability tools do not instrument at the dispatch-attempt level (they instrument at the tool-call level, which is one level lower). The fix is harness-level: log the dispatch attempt and its result as a first-class event, independently of whether the LLM reported the failure. The watchdog pattern applies: if an audit step was supposed to run, and no audit artifact appears within the expected window, the harness should alert — not wait for the agent to report failure.

**For acceptance criteria for Tier 1 mechanisms generally:**

The NIST conformance testing methodology prescribes: (1) decompose every mechanism obligation to atomic testable assertions; (2) build a test suite that checks each assertion independently; (3) a mechanism is accepted when all its assertions pass on a sample of sessions. The current state is that there are no such assertions defined for RDD's Tier 1 mechanisms. Defining them is the next design step, and it is spike-shaped: requires empirical runs with known-good and known-failed mechanism executions to validate that the assertions actually distinguish the two cases.

**For the AOP structural insight:**

The most actionable design implication from Q3 is that Tier 1 mechanism enforcement should be woven into the RDD harness at the framework level, not specified as natural language instructions that depend on the agent voluntarily executing them. The specific target: the harness should check for Tier 1 mechanism artifacts at session boundaries (analogous to a pointcut at session-end join point) and surface the absence of expected artifacts to the user before concluding the session.

**What the literature does not settle:**

- Whether process mining techniques can be applied to the unstructured execution traces of LLM agent sessions without an intermediate semantic parsing layer (which would itself be LLM-dependent and reliability-limited).
- Whether the probabilistic assurance approach in AgentGuard scales to complex protocol specifications with many Tier 1 mechanisms and long sessions.
- Whether a structural enforcement mechanism (AOP-style weaving) is achievable within the current Claude API architecture, or requires changes to the harness scaffolding that are outside the agent's control.
- The specific acceptance criteria for each of RDD's Tier 1 mechanisms remain undefined — the literature provides the methodology but not the assertions. This is empirical design work.

---

## Sources

Bartocci, E., Falcone, Y., Francalanza, A., & Reger, G. (2018). Introduction to runtime verification. In E. Bartocci & Y. Falcone (Eds.), *Lectures on Runtime Verification: Introductory and Advanced Topics*. Lecture Notes in Computer Science, vol. 10457, pp. 1–33. Springer. https://doi.org/10.1007/978-3-319-75632-5_1

Bai, Y., Jones, A., Ndousse, K., Askell, A., Chen, A., DasSarma, N., Drain, D., Fort, S., Ganguli, D., Henighan, T., Joseph, N., Kadavath, S., Kernion, J., Conerly, T., El-Showk, S., Elhage, N., Hatfield-Dodds, Z., Hernandez, D., Hume, T., Johnston, S., … Kaplan, J. (2022). Constitutional AI: Harmlessness from AI feedback. arXiv:2212.08073. https://arxiv.org/abs/2212.08073

Beyer, B., Jones, C., Petoff, J., & Murphy, N. R. (Eds.). (2016). *Site Reliability Engineering: How Google Runs Production Systems*. O'Reilly Media. Chapter 6 (Monitoring Distributed Systems) authored by Rob Ewaschuk. https://sre.google/sre-book/monitoring-distributed-systems/

Ewaschuk, R. (n.d.). *My Philosophy on Alerting*. Google Docs. https://docs.google.com/document/d/199PqyG3UsyXlwieHaqbGiWVa8eMWi8zzAn0YfcApr8Q/edit

Havelund, K., & Roşu, G. (2001). An overview of the runtime verification tool Java PathExplorer. *Formal Methods in System Design*, 24(2), 189–215. https://havelund.com/Publications/fmsd-rv01.pdf

Kalenkova, A., & van der Aalst, W. M. P. (2016). Process mining using BPMN: Relating event logs and process models. *Software and Systems Modeling*, 16(4), 1019–1048. https://doi.org/10.1007/s10270-015-0502-0

Kiczales, G., Lamping, J., Mendhekar, A., Maeda, C., Lopes, C., Loingtier, J.-M., & Irwin, J. (1997). Aspect-oriented programming. In *Proceedings of ECOOP 1997*. Lecture Notes in Computer Science, vol. 1241, pp. 220–242. Springer.

Koohestani, R., et al. (2025). AgentGuard: Runtime verification of AI agents. arXiv:2509.23864. Presented at AgenticSE 2025 (co-located with ASE 2025). https://arxiv.org/abs/2509.23864

Leinen, A., et al. (2024). An industrial case study on flaky test detection and repair. In *Proceedings of the 17th IEEE International Conference on Software Testing, Verification and Validation (ICST 2024)*. IEEE.

Meyer, B. (1992). *Object-Oriented Software Construction*. Prentice Hall. (2nd ed., 1997.)

NIST Information Technology Laboratory. (n.d.). Overview of conformance testing. National Institute of Standards and Technology. https://www.nist.gov/itl/ssd/information-systems-group/overview-conformance-testing

NIST Information Technology Laboratory. (n.d.). What is this thing called conformance? National Institute of Standards and Technology. https://www.nist.gov/itl/ssd/information-systems-group/what-thing-called-conformance

OpenTelemetry. (2024). Observability primer. CNCF. https://opentelemetry.io/docs/concepts/observability-primer/

Parasuraman, R., & Manzey, D. H. (2010). Complacency and bias in human use of automation: An attentional integration. *Human Factors*, 52(3), 381–410. https://doi.org/10.1177/0018720810376055

Sigelman, B. H., Barroso, L. A., Burrows, M., Stephenson, P., Plakal, M., Beaver, D., Jaspan, S., & Shanbhag, C. (2010). *Dapper, a large-scale distributed systems tracing infrastructure*. Google Technical Report. https://research.google/pubs/dapper-a-large-scale-distributed-systems-tracing-infrastructure/

van der Aalst, W. M. P. (2016). *Process Mining: Data Science in Action* (2nd ed.). Springer. https://doi.org/10.1007/978-3-662-49851-4

van der Aalst, W. M. P. (2012). Replaying history on process models for conformance checking and performance analysis. *WIREs Data Mining and Knowledge Discovery*, 2(2), 182–192. https://doi.org/10.1002/widm.1045

Zhu, H., et al. (2025). Sherlock: Reliable and efficient agentic workflow execution. arXiv:2511.00330. Microsoft Research. https://arxiv.org/abs/2511.00330
