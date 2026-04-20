## Literature Review: Multi-cycle Composition — Nested, Concurrent, and Paused Workflow State

**Date:** 2026-04-15
**Cycle:** RDD 016, Track #14
**Method:** Systematic web search across workflow engines, hierarchical state machine formalisms, process calculi, version control internals, schema evolution literature, and AI agent orchestration

---

### Sources Reviewed

| # | Author(s) / Source | Title / Document | Year | Venue | Relevance |
|---|---|---|---|---|---|
| 1 | Harel, D. | "Statecharts: A Visual Formalism for Complex Systems" | 1987 | Science of Computer Programming 8 | Foundational formalism for hierarchical, concurrent state; history pseudostates |
| 2 | W3C | "State Chart XML (SCXML): State Machine Notation for Control Abstraction" | 2015 | W3C Recommendation | Operationalizes Harel's model in XML; specifies history, parallel, compound states |
| 3 | Temporal.io | "Child Workflows" (Platform Documentation) | 2024 | docs.temporal.io | Child workflow lifecycle, Parent Close Policy, state isolation, event history |
| 4 | Temporal.io | "Workflow Engine Design Principles" | 2024 | temporal.io/blog | Durable execution, event-sourced state, scalability via composition |
| 5 | Temporal.io | "Human-in-the-Loop AI Agent" (Tutorial) | 2024 | learn.temporal.io | Signal-based pause/resume, `wait_condition()`, in-progress vs. waiting semantics |
| 6 | Temporal.io | "Orchestrating Ambient Agents with Temporal" | 2024 | temporal.io/blog | Multi-tier agent hierarchy; signal-based mid-execution injection |
| 7 | Temporal.io | "Patching" (Documentation) | 2024 | docs.temporal.io | Workflow versioning migration; patched() API for in-flight workflow compatibility |
| 8 | Temporal.io | "Versioning" (Documentation, TypeScript/Java/Go SDKs) | 2024 | docs.temporal.io | Determinism constraint, Worker Versioning, migration lifecycle |
| 9 | Temporal.io | "Parent Close Policy" (Documentation) | 2024 | docs.temporal.io | Cancellation propagation policy: TERMINATE, REQUEST_CANCEL, ABANDON |
| 10 | Apache Airflow | "SubDagOperator" (Documentation, v2.5.3) | 2023 | airflow.apache.org | Nested DAG model, deprecation, parent/child pause state inconsistency |
| 11 | GitHub / Apache Airflow | PR #5283: "Pause dag also pause its subdags" | 2019 | github.com/apache/airflow | Documented failure: SubDAG pause state not propagated from parent |
| 12 | Argo Workflows Docs | "DAG Templates, Nested Templates" | 2024 | argo-workflows.readthedocs.io | Template nesting in DAGs, known exit hook ordering bugs in nested structures |
| 13 | Uber / Cadence | "Workflows — Cadence Documentation" | 2023 | cadenceworkflow.io | Cadence parent-child model; task-based state transitions |
| 14 | Hoare, C.A.R. | "Communicating Sequential Processes" | 1978/1985 | CACM / Prentice Hall | Process composition, synchronization; original inspiration for Go channels |
| 15 | Milner, R. | "Calculus of Communicating Systems (CCS)" | 1980 | Springer | Parallel composition, nesting, naming of processes |
| 16 | Wong, P. & Gibbons, J. | "A Process-Algebraic Approach to Workflow Specification and Refinement" | 2008 | LNCS (Software Composition) | CSP applied to workflow spec; behavioral refinement for composition |
| 17 | Stately.ai | "History State — Glossary" (statecharts.dev) | 2023 | statecharts.dev | Shallow vs. deep history, pseudostate semantics, resumption without explicit tracking |
| 18 | Stately.ai / XState Docs | "Parent and Child States" (XState v4) | 2024 | stately.ai/docs | Invoked child machines, completion events, cancellation on state exit |
| 19 | Git SCM | "git-worktree Documentation" | 2024 | git-scm.com | Per-worktree HEAD and pseudo-refs; shared object store; lock mechanism |
| 20 | Git SCM | "git-stash Documentation" | 2024 | git-scm.com | Stash as commit DAG; refs/stash; state encoding as commit pair |
| 21 | Git SCM | "git-rebase Documentation" | 2024 | git-scm.com | Rebase-in-progress state; worktree-local `refs/rewritten/<label>` |
| 22 | Git SCM | "git-bisect Documentation" | 2024 | git-scm.com | BISECT_HEAD, BISECT_LOG; ad hoc per-operation state files |
| 23 | Atlassian / Apache | "Liquibase vs. Flyway" (community comparison) | 2024 | multiple | Migration tool strategies: versioned vs. declarative, preconditions |
| 24 | Confluent / Solace | Schema Registry best practices; schema evolution guides | 2024 | multiple | Backward/forward compatibility; optional fields; dual-write migration |
| 25 | Protobuf.dev | "Protocol Buffers Best Practices" | 2024 | protobuf.dev | Optional fields, unknown field handling, reserved declarations |
| 26 | Temporal Community Forum | "Workflow Versioning Strategies" | 2023 | community.temporal.io | Practitioner discussion on patching vs. worker versioning |
| 27 | AWS | "Choosing Standard vs. Express Workflows — Step Functions" | 2024 | docs.aws.amazon.com | Two-tier workflow model; nesting Express inside Standard |
| 28 | LaunchDarkly Docs | "Feature Flag Hierarchy" | 2024 | launchdarkly.com/docs | Prerequisite flags as conditional enforcement; dependent flag scoping |
| 29 | Open Policy Agent | "OPA Documentation" (openpolicyagent.org) | 2024 | openpolicyagent.org | Rego-based conditional policy; evaluate-at-invocation-time enforcement |
| 30 | geeksforgeeks / Wikipedia | "Hierarchical Task Network (HTN) Planning" | 2024 | multiple | Compound vs. primitive tasks; decomposition methods; planning as nested refinement |
| 31 | Bhansali et al. / IJCAI | "HTN Planning with Task Insertion and State Constraints" | 2017 | IJCAI Proceedings | Formal HTN with ordering constraints and state preconditions |
| 32 | Wikipedia | "Continuation-Passing Style" | 2024 | wikipedia.org | CPS transformation; saved continuation as resumption capsule |
| 33 | Microsoft Learn | "CPS and Asynchrony" (Eric Lippert blog) | archived | learn.microsoft.com | CPS as interruption/resumption mechanism; capsule pattern |
| 34 | Temporal.io | "Temporal for AI / Agentic Workflows" | 2025 | temporal.io/blog | Durable execution for LLM agents; multi-agent composition |
| 35 | Mendix / BPMN Docs | "Boundary Events; Sub-Processes" | 2024 | multiple | BPMN interrupting vs. non-interrupting boundary events on sub-processes |
| 36 | Microsoft Dynamics / Atlassian | Legacy migration docs (Connect API; Dynamics 365) | 2024 | multiple | Grandfathered rule patterns; active legacy rules continue post-deprecation deadline |

---

### Synthesis

#### Framing: Six Questions Across Three Paradigms

The six research questions for Track #14 land in three distinct paradigms that have each developed partial answers but don't directly address RDD's problem. The first paradigm is **durable workflow engines** (Temporal, Cadence, Airflow, Argo, Step Functions), which treat nesting and concurrency as architectural features to be designed in at construction time. The second is **hierarchical state machine formalisms** (Harel Statecharts, SCXML, UML, XState), which provide rigorous abstractions for nesting, concurrency, and interruption resumption. The third is **version control and schema evolution** (git internals, Protobuf, Flyway/Liquibase), which handles the migration problem—how to upgrade existing instances of a representation without breaking them.

RDD's case is unusual because it sits across all three: it has workflow-engine concerns (nested cycles, concurrent workstreams), state machine concerns (a cycle has discrete phases with enforced transitions), and schema evolution concerns (pre-v0.7.0 cycles lack ADR-072 fields). The synthesis maps what transfers and what breaks.

---

#### Q14.1 — Prior Art for Nested / Concurrent / Paused Workflow State

**Temporal's child workflow model** is the most fully developed production abstraction for hierarchical workflow composition. A child workflow has its own isolated Event History—it does not share local state with its parent. Communication is asynchronous via Signals. The parent can optionally await the child's result, but the child is otherwise autonomous. Crucially, Temporal settled on the position that a workflow is the *unit of scalability*: rather than scaling a single monolithic workflow instance, you compose parent-child trees. This is a deliberate design choice, not a limitation.

The key primitive for parent-child lifecycle coupling is the **Parent Close Policy**, which has three values: TERMINATE (default—child is forcibly stopped when parent closes), REQUEST_CANCEL (child receives a cancellation request, can clean up), and ABANDON (child continues independently, detached from parent). This tripartite policy is the settled abstraction Temporal uses to express the coupling semantics between workflow layers.

**Airflow's SubDagOperator** attempted nested DAGs but never settled the coupling semantics cleanly. The documented failure (PR #5283) is instructive: pausing a parent DAG did not propagate the paused state to sub-DAGs because the SubDagOperator ran as a BackfillJob that ignored the `is_paused` field. Airflow eventually deprecated SubDagOperator in favor of TaskGroup—a non-hierarchical grouping primitive that is visually nested but not a separate execution context. This is a case where the "settled abstraction" is *abandonment of nesting* in favor of flat grouping. The failure mode—inconsistent pause state between parent and child due to different execution models—is directly analogous to RDD's Hook-loop friction during gates.

**Argo Workflows** stores the entire run state in a Kubernetes CRD (Custom Resource Definition). Templates can call other templates (including DAG templates), creating nesting. However, a known issue documents that exit hooks on nested DAGs execute in incorrect order during workflow stops—LIFO semantics are expected but not reliably delivered. This is another example of where nesting's cleanup semantics are harder than the happy path suggests.

**Harel Statecharts (1987)** provide the foundational formal model. Three extensions transform flat FSMs: *hierarchy* (states can contain substates—being in a substate entails being in the superstate), *orthogonal regions* (concurrent independent regions whose combined state is the Cartesian product), and *broadcast communication* (events propagate to all active states). The critical mechanism for RDD's question is the **history pseudostate**: when a compound state is exited and later re-entered, the history pseudostate restores the most recently active substate rather than starting from the default initial state. Shallow history restores only the immediate child level; deep history restores the full active descendant configuration. SCXML (W3C 2015) operationalizes this in XML and adds a standard execution model. XState implements the same model in JavaScript; its `invoke` primitive delegates execution to a child machine, which is automatically cancelled when the invoking state is exited.

**Git's model** is the most ad hoc of the systems reviewed and is instructive precisely because of its divergence. Git does not have a first-class "workflow" abstraction. Instead, it accumulates operation-specific state files in `.git/`: MERGE_HEAD, BISECT_HEAD, BISECT_LOG, ORIG_HEAD, and per-worktree `refs/rewritten/<label>` during rebase. Worktrees share the object store but each has its own HEAD, index, and per-worktree pseudo-refs. This means concurrent workflows in git are handled by filesystem namespace partitioning, not by any compositional semantic model. The stash is represented as a pair of commits on a `refs/stash` ref—not a first-class workflow state. Mercurial Queues (MQ) adds an explicit patch stack at `.hg/patches/` with a `series` file, offering named intermediate states, but MQ was deprecated in favor of Shelve for precisely the reason that its state management was opaque and fragile.

The pattern across these systems is: **engineered hierarchical composition (Temporal) produces clean semantics at the cost of up-front architectural commitment; ad hoc state accumulation (git) is pragmatic but produces inconsistency under composition; formal models (Statecharts/SCXML) provide the cleanest abstraction but have rarely been adopted wholesale by workflow engines**.

**For RDD specifically:** the Statechart history pseudostate is the closest analogy to "a cycle was paused for a mini-cycle, and should resume where it left off." The Temporal Parent Close Policy is the closest analogy to "what happens to the outer cycle when the inner one completes." Neither maps directly because RDD's cycles are knowledge-building processes in conversational form, not automated execution units.

---

#### Q14.2 — Distinguishing In-Progress, Paused, and Active

The most important finding here is that **Temporal's UI and state model conflate "running" and "paused"**. The official documentation explicitly notes that a workflow waiting at `wait_condition()` for a Signal is shown as "Running" in the UI—it is not consuming compute resources, but there is no distinct "paused" status in the workflow execution state. This is architecturally deliberate: from Temporal's perspective, a workflow waiting for input is still *executing*—it is just blocked on an external event. The distinction between "in-progress-gate" (actively engaged, multi-turn conversation happening) and "paused" (user stepped away, no current agent turn) maps poorly to Temporal's model because Temporal's execution unit is finer-grained than RDD's.

In **hierarchical state machine formalisms**, "in-progress" is naturally modeled as a superstate containing "running" and "paused" substates. The dotnet-state-machine/stateless library discussion confirms this pattern: "In Progress" becomes a composite state with an initial substate of "Running", and a "Pause" trigger transitions to "Paused" within that superstate. This is the textbook treatment.

BPMN introduces a further distinction relevant to gates: **interrupting vs. non-interrupting boundary events** on sub-processes. An interrupting boundary event cancels the sub-process when triggered; a non-interrupting boundary event allows the sub-process to continue while spawning a parallel path. The gate-in-progress scenario in RDD is analogous to a non-interrupting boundary event: an external event (the Stop hook firing) should not interrupt the ongoing gate conversation—it should either be deferred or handled in parallel.

The concrete state representation patterns discovered:
- **Temporal:** Workflow execution state field has values: Running, Completed, Failed, Cancelled, Terminated, TimedOut, ContinuedAsNew. "Waiting for signal" is a sub-condition of Running, not a distinct top-level state.
- **Statecharts/SCXML:** State is represented as the *set of currently active states* (the active configuration), which may include compound states, substates, and parallel region memberships simultaneously.
- **Git:** State is encoded in the presence/absence of specific files (MERGE_HEAD, BISECT_HEAD) and specific ref values—there is no explicit status field.
- **BPMN:** Each token in a process has a position and can be in a task, waiting at a gateway, or in a sub-process; the sub-process boundary event provides the interrupting/non-interrupting distinction.

---

#### Q14.3 — Interaction Between Nested Workflows and Composition Operations

The primary finding is that **close/completion semantics in nested workflows are more complex than they appear and every major system has edge cases**.

Temporal's Parent Close Policy is the most explicitly designed solution. The three-valued policy (TERMINATE, REQUEST_CANCEL, ABANDON) allows per-child configuration. A known GitHub issue (#604) documents that cascading termination does not reliably propagate to grandchildren (descendants more than one level deep) in some conditions—the system was designed for one level of parent-child propagation, not recursive descent.

Airflow's SubDagOperator failed at propagating pause state, as noted above. Argo's known exit hook ordering bug (LIFO expected, not delivered) is another example of cleanup semantics breaking under nesting.

XState's model is the cleanest for this: when an invoking state is exited, the invoked child machine is automatically cancelled. This is enforced by the runtime, not configurable per-child. The tradeoff is rigidity—there is no "abandon" policy.

AWS Step Functions adds a two-tier workflow model: Standard Workflows (exactly-once, up to one year, full history) and Express Workflows (at-least-once, up to five minutes, CloudWatch logs). Express Workflows can be nested inside Standard Workflows, creating a scope-differentiated composition. The key design insight is that **different tiers of workflow can have different execution guarantees**, and nesting allows you to select the appropriate guarantee per scope.

**For RDD's graduation operation specifically**, the literature provides no direct analogue. RDD's "graduation" has a knowledge-transfer semantics—folding understanding into native project docs, making the RDD scaffolding unnecessary. This is closer to an architectural refactoring than to a workflow completion. Workflow engines typically model "completion" as the workflow reaching a terminal state with optional output artifacts. The graduation operation is more like a deliberate transition from one representational regime to another (RDD-mediated to unmediated). The closest analogical structure is Temporal's Continue-As-New operation, which allows a long-running workflow to carry forward essential state into a fresh workflow instance with an empty event history—a form of controlled amnesia with state preservation. But Continue-As-New retains workflow identity; graduation dissolves it.

The key gap: **no system reviewed models a "dissolve" operation that transfers accumulated knowledge to a different substrate and then terminates**. This appears to be genuinely novel to RDD.

---

#### Q14.4 — Scope-Adaptive Enforcement for Smaller Work Units

This question has no single well-studied answer, but the literature converges on several pattern families.

**Feature flags as conditional enforcement** (LaunchDarkly, Unleash) implement scope-conditional behavior: a prerequisite flag controls whether dependent flags are evaluated at all. This is the pattern of "enforcement only applies if the outer condition is met." LaunchDarkly's "flag hierarchy" allows a parent flag to gate all children—if the parent is off, no children are evaluated regardless of their individual settings. This directly models the problem of enforcement rules that should not apply to mini-cycles.

**OPA (Open Policy Agent)** with Rego evaluates policies against input data at invocation time. A policy can inspect attributes of the request (including cycle type, scope, phase) and return `allow` or `deny`. This is policy-as-code with full access to context. The relevant pattern is that OPA policies can include applicability conditions—effectively, "this policy is only relevant if the context matches this predicate." OPA does not have a concept of "scope-limited enforcement" as a first-class primitive, but the Rego language is expressive enough to model it.

**Liquibase preconditions** are the most directly analogous schema-migration pattern. Liquibase allows changesets to specify preconditions—conditions that must be true before a changeset is applied (e.g., "only run if column X does not already exist"). These can be configured with `onFail` and `onError` behaviors: HALT, CONTINUE, MARK_RAN, WARN. CONTINUE and MARK_RAN allow a migration to skip itself if the precondition is not met, without failing the overall migration. This is exactly the pattern RDD's Stop hook needs: a precondition that checks "is this a full-pipeline cycle?" and if not, either continues (allows the hook to pass) or marks the enforcement as not applicable.

**BPMN's non-interrupting boundary events** provide the process model equivalent: an enforcement check that fires on a boundary but does not interrupt the in-progress activity. The hook-loop friction in RDD is precisely the interrupting-vs.-non-interrupting distinction: the Stop hook was designed as an interrupting boundary event (it blocks the agent turn), but the gate-in-progress scenario calls for non-interrupting behavior (the gate conversation should continue; enforcement is deferred).

**AWS Step Functions' Standard vs. Express** provides the two-tier model: full enforcement for Standard (long-running, durable, exactly-once) and relaxed enforcement for Express (short, at-least-once, lighter overhead). RDD's mini-cycles are analogous to Express Workflows—they need lighter enforcement that doesn't trigger full-pipeline guardrails.

The synthesis from Q14.4: **the absence of a dedicated "scope-adaptive enforcement" term in the literature reflects that this is typically solved by composition of existing primitives** (preconditions, flag hierarchy, conditional policy evaluation) rather than by a specialized system. RDD's implementation will likely follow this pattern.

---

#### Q14.5 — Migration from Single-Cycle to Multi-Cycle Representation

The literature breaks migration into two distinct problems that RDD needs to distinguish.

**Structural migration** (transforming the shape of files/data) is well-studied. Protobuf's approach: new optional fields default to zero-value if absent; existing consumers ignore unknown fields; reserved declarations prevent field number reuse. Flyway/Liquibase: versioned migration scripts run in sequence; each script is atomic; Liquibase preconditions allow conditional application. The canonical patterns are: (1) add-only evolution (new fields are optional), (2) dual-write during transition (write to both old and new schemas simultaneously), and (3) expand-and-contract (expand schema, migrate data, contract old schema).

**Semantic migration** (deciding what existing state *means* in the new model) is less studied and appears to be RDD's primary challenge. The Temporal versioning literature is most directly relevant: when a workflow definition changes, existing in-flight workflow executions must continue using the old code path because they cannot rewind their event history. Temporal's `patched()`/`getVersion` API handles this by inserting a marker into the event history at the branch point—new executions take the new code path; existing executions replay along the old path. This is a **behavioral fork** keyed on the presence/absence of a marker in the execution's own history.

For RDD, the analogous problem is: pre-v0.7.0 cycles have a cycle-status.md without `Skipped phases:` and `Paused:` fields. The structural migration is trivial (add the fields with empty values). The semantic question is what "no Paused field" *means* for enforcement purposes. Three possible interpretations: (a) treat as `Paused: false` (fully active, full enforcement applies); (b) treat as unknown/exempt (enforcement skipped for pre-ADR-072 cycles); (c) require user walkthrough to assign the appropriate value before enforcement runs.

Microsoft Dynamics 365 documents a "grandfathered rule" pattern: active legacy rules continue to run after the deprecation deadline until explicitly deactivated. This suggests option (b)—pre-existing cycles run under the old regime until explicitly upgraded—is a well-precedented approach in enterprise workflow systems. Atlassian's Connect API migration confirms: apps can specify their migration enrollment status; those that don't are subject to the default behavior, which changes at a deadline.

The cost profile: automated migration (adding empty optional fields to all pre-ADR-072 cycle-status files) is low-cost and structurally sound but leaves the semantic question unresolved. User-walkthrough migration (the user inspects each legacy cycle and explicitly sets fields) is higher-cost but resolves the semantic question at migration time. The literature suggests a hybrid: automated structural migration with a lightweight attestation step ("confirm this cycle is Paused: true or false").

---

#### Q14.6 — In-Progress Gate: Schema, Protocol, or Hook-Behavior Change?

This question is answered most directly by the combination of Temporal's signal model and BPMN's interrupting/non-interrupting distinction.

**The in-progress gate is not primarily a schema problem.** Adding an `In-progress gate: true` field to cycle-status.md would describe the situation but would not resolve the friction. The Stop hook would still fire; the hook would still read the field; the behavior change must be in the hook's logic.

**It is partially a protocol problem.** If the convention is that the agent sets `In-progress gate: true` at the start of a gate conversation and unsets it when the gate completes, the hook can read this field and modify its behavior. But this protocol requires the agent to reliably maintain the field across turns—which is itself a source of fragility. Temporal's analogous mechanism is the Signal: an external event that updates workflow state without requiring the workflow to poll. The gate-in-progress protocol would need equivalent reliability.

**It is primarily a hook-behavior change.** The Stop hook's current design treats all incomplete phases as requiring enforcement. The fix is to add a predicate: "if the current cycle is in an active gate conversation, defer enforcement." This is the non-interrupting boundary event pattern: the boundary condition is detected, but the in-progress activity is not interrupted. The hook behavior change is the minimal necessary fix; the schema and protocol changes are enabling infrastructure.

**Backward compatibility implications:** Any schema change to cycle-status.md must treat the new field as optional with a well-defined default. If `In-progress gate:` is absent, the hook should default to the current behavior (enforce on incomplete phases). This preserves backward compatibility for all existing cycle-status files. The structural migration cost is zero—no files need to be changed; the field is only written when a gate conversation begins. This is the Protobuf "optional field with zero-value default" pattern applied to markdown.

---

### Key Findings

- **Harel 1987** introduced the history pseudostate for state resumption after interruption. SCXML (W3C 2015) standardized this in XML. The history state is the formal model for "resume the cycle where it was paused"—distinguishing shallow (one level) from deep (recursive) restoration. [Sources 1, 2, 17]

- **Temporal's Parent Close Policy** (TERMINATE / REQUEST_CANCEL / ABANDON) is the settled three-valued abstraction for coupling semantics between nested workflow layers. ABANDON is the policy that allows an inner cycle to complete independently of its parent. [Sources 3, 9]

- **Temporal conflates "waiting for signal" with "Running"** in its execution state model. There is no distinct "paused awaiting human input" status—workflows waiting at `wait_condition()` are Running but consuming zero compute resources. This is a deliberate design decision, not an oversight. [Source 5]

- **Airflow's SubDagOperator failure** (pause state not propagating from parent to sub-DAGs) is the canonical example of how ad hoc nesting without explicit coupling semantics produces inconsistent state. Airflow's response was to deprecate nesting in favor of flat TaskGroup. [Sources 10, 11]

- **BPMN's interrupting vs. non-interrupting boundary events** model the gate-in-progress friction precisely: an interrupting boundary event (the current Stop hook behavior) cancels the activity; a non-interrupting event allows it to continue. The fix for RDD's gate friction is a behavior change toward non-interrupting semantics. [Source 35]

- **Temporal's `patched()` API** is the industry-standard mechanism for migrating in-flight workflow executions: insert a marker into the execution's history at the branch point; new executions take the new code path; existing executions replay along the old path. The analogous RDD mechanism is a version field in cycle-status.md that gates enforcement behavior. [Sources 7, 8]

- **Liquibase preconditions** with `onFail: CONTINUE` are the canonical database-migration pattern for conditional enforcement: a migration step checks whether it is applicable and silently skips if not. This models RDD's need for enforcement that gracefully skips pre-ADR-072 cycles. [Source 23]

- **Feature flag hierarchy** (LaunchDarkly's prerequisite flags) provides the scope-adaptive enforcement pattern: a parent flag disables all dependent flags. Mini-cycles could set a "scope: mini" flag that disables full-pipeline enforcement checks. [Source 28]

- **The "grandfathered rule" pattern** from Microsoft Dynamics 365 and Atlassian Connect: active legacy rules continue running under the old enforcement regime until explicitly deactivated. Pre-ADR-072 cycles may be treated as grandfathered—exempt from enforcement until explicitly upgraded. [Source 36]

- **HTN planning** decomposes compound tasks into primitive tasks via methods. The decomposition is hierarchical and allows partial-order planning (not all steps need total ordering). This maps to RDD's cycle decomposition (phases as compound tasks, individual agent turns as primitives) more directly than workflow engines do, because HTN operates at the task-network level without assuming automated execution. [Sources 30, 31]

- **Git's ad hoc state file model** (MERGE_HEAD, BISECT_HEAD, REBASE_HEAD as sentinel files) demonstrates that concurrent operation state can be managed by filesystem presence/absence without a formal state machine. This is the minimal viable approach—fragile under concurrency but zero-overhead. RDD's current `Paused:` and `Skipped phases:` fields are in this tradition. [Sources 19, 20, 21, 22]

- **CPS (continuation-passing style)** provides the theoretical model for interruption/resumption: a suspended computation can be encoded as a continuation—a function representing "what to do next." The saved continuation is the resumption capsule. Temporal's workflow history is a practical implementation of this: replaying the history reconstructs the continuation. [Sources 32, 33]

- **RDD's graduation operation has no direct analogue in workflow engines.** "Completion" in workflow engines is terminal with optional output. Graduation involves knowledge transfer to a different representational substrate followed by dissolution of the RDD scaffolding. The closest analogue is Temporal's Continue-As-New (carry essential state into a fresh execution), but graduation dissolves workflow identity rather than continuing it. This is a genuine gap. [Q14.3 synthesis]

---

### Limitations

**Formal literature access was limited.** Harel's 1987 paper (Science of Computer Programming 8) and the Wong & Gibbons 2008 process-algebra-to-workflow paper were accessible only through abstracts and secondary summaries; full text was behind paywalls. The synthesis of these sources relies on well-documented secondary descriptions, which are adequate for the conceptual level of this review but would need primary source verification for any formal claim.

**RDD's conversational execution medium has no direct parallel.** All workflow engine literature assumes automated execution by software workers. RDD's "executor" is an AI agent in a multi-turn conversation with a human. The human-paced, conversation-mediated nature of RDD means that abstractions like "workflow waits for signal" map to "human returns to conversation"—a different reliability class. Temporal's human-in-the-loop tutorials approach this but still assume a software system that can reliably receive signals; RDD's signals are implicit (the human opens the tool and resumes).

**Scope-adaptive enforcement as a named concept is absent.** The search confirmed that "scope-adaptive enforcement," "conditional preconditions" for workflow enforcement, and "policy applicability scoping" are not established terms of art in any of the surveyed fields. The patterns exist (OPA conditional rules, Liquibase preconditions, feature flag hierarchy), but they are compositional applications of general-purpose tools rather than a named design pattern. This limits the precision of citations for Q14.4.

**AI agent multi-cycle orchestration is nascent.** The 2024-2025 literature on multi-agent AI orchestration (LangGraph, AutoGen, CrewAI, Temporal for AI) is growing rapidly but has not yet converged on stable abstractions for the specific problem of nested cycles with knowledge-transfer semantics. The Temporal ambient-agents architecture (three-tier broker/executor/judge) is the most architecturally detailed primary source, but it addresses a different problem (concurrent autonomous agents vs. sequential human-paced cycles).

**Git internals for concurrent operation state** (the specific interaction between REBASE_HEAD, BISECT_HEAD, and stash state in a single repository) were not available through web search at the required depth. The git documentation covers individual commands but not the multi-operation concurrency model. Primary investigation of `.git/` directory state during simultaneous operations would require hands-on experimentation.

**Migration cost profile data is sparse.** The literature provides patterns for migration (expand-and-contract, dual-write, preconditions) but has little empirical data on the relative cost of automated vs. human-walkthrough migration for small-scale systems like RDD's markdown-based state files. The cost profile judgment in Q14.5 is extrapolated from general migration strategy principles, not empirical measurement.
