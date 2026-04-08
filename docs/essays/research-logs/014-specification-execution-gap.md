# Research Log: Cycle 10 — Specification-Execution Gap in Prompt-Based Methodology
*Started 2026-04-06*

**Topic seed:** [nrgforge/rdd#9](https://github.com/nrgforge/rdd/issues/9) — Structural mechanisms in Cycle 9 specified in skill text but not mechanically enforced.

**Planned essay:** `014-specification-execution-gap.md` (working title — may shift if research surfaces a sharper frame)

**Reviewer audit:** [`./docs/essays/audits/research-design-review-014.md`](../audits/research-design-review-014.md) — Tier 1 dispatch executed in isolation, returned substantive findings, did not silently fall back.

---

## Research Methods Reviewer Findings (recorded for in-context-recall mitigation)

The research-methods-reviewer flagged its own structural recommendation: *"Record the findings of this review in the research log before beginning phase execution. In-context recall of review findings under phase-immersion is the failure mode under investigation."* This section exists to satisfy that recommendation.

### Top-level findings

1. **A2 (original) was an embedded conclusion.** Drafted from Issue #9's "Design Directions" list — proposals labeled "Not Mandated" — and promoted to a research question before investigation. Reformulated. Original framing presupposed hook enforcement is the answer to Type 1 / Type 2 failures, but ADR-033's hook architecture addresses *workflow events at boundaries*, not *protocol compliance during task immersion*. Whether hooks address the failure types in Issue #9 is exactly what needs to be established, not assumed.

2. **A1, A4 had mild presuppositions.** A1 framed mechanical enforcement as the successor state to prompt-based constraints (vs. adequate-as-is or non-enforcement responses). A4 framed trigger-recognition as a methodology design problem rather than a model capability ceiling. Both reformulated.

3. **C4, C5 had drafting errors mirroring A2.** Both embedded their hypothesis conclusions in the question framing ("suggesting more teaching rather than more enforcement"; "without requiring enforcement"). Both reformulated to investigate neutrally.

4. **Three coverage gaps surfaced:**
   - Type 1 / Type 2 failure-type distinction not studied as a variable.
   - Silent-fallback-without-disclosure treated as a telemetry problem (A3) rather than an architectural anatomy question.
   - Composition effects (do new mechanisms interfere with old ones?) not investigated.

5. **Implicit third framing surfaced as Track B.** The user's framing "non-deterministic system → right harness" was not represented in either Track A (specification adequacy) or Track C (interpretation validity). It points at literature neither track reaches: flaky tests, reliability engineering, human-factors checklist design, probabilistic pipelines.

6. **Premature narrowing — acceptance criteria framing.** Neither track asked: what would it mean for a Cycle 9 mechanism to be "working correctly"? Without observable acceptance criteria, failures can only be discovered post-hoc when a user notices an absence. Quality assurance framing rather than enforcement framing.

### Reviewer-flagged reflexive risks

- **Risk 1:** This dispatch fired correctly because it was the active top-level task. Subsequent dispatches under phase-immersion may not. The review findings don't prevent the next omission. *Mitigation:* externalize findings to this log; reference at every research-loop start.

- **Risk 2:** The reviewer read ADR-033, ADR-058, ADR-062, and the full issue text — all of which discuss hooks approvingly — before flagging A2 for presupposing hook enforcement. The flag may be shallower than it appears. *Mitigation:* the substantive ADR-033 argument (specific properties of hook architecture vs. specific properties of failure types) is domain-grounded, not framing-derived, so it stands. But Track A research should remain open to hook enforcement as one possible answer, not preemptively reject it.

---

## Adopted Question Set (Round 1)

Three tracks. Twelve active questions. Three round-2 candidates noted at the end.

### Track A — Specification adequacy (5 questions)

| # | Question |
|---|---|
| **A1** | What determines when prompt-based structural constraints fail, and what design responses have been found effective when they do? |
| **A2** | For each Cycle 9 mechanism that failed, what properties of the failure mode (event-boundary, task-immersion, moment-recognition, silent-fallback) determine what class of intervention is appropriate? |
| **A3** | What telemetry would make silent failures (e.g., subagent fallback) visible? |
| **A4** | What does the literature say about in-context trigger-recognition reliability, and what design responses have been found to reduce trigger-recognition failure rates in instruction-following systems? |
| **A5** | Is there literature on "specification-execution gap" in prompt engineering, instruction-following degradation under task load, or agent self-policing reliability? *Lit-reviewer brief: cast wide — software engineering (specification-implementation gap, design-by-contract), organizational systems (protocol compliance under cognitive load), and human factors (attention degradation) likely have more mature treatments than prompt engineering specifically.* |

### Track B — Harness for non-deterministic systems (2 questions)

| # | Question |
|---|---|
| **TB1** | What harness design patterns are used in systems where the executor is non-deterministic or unreliable (flaky tests, probabilistic pipelines, human-in-the-loop processes), and which of these patterns is RDD currently using? |
| **TB3** | What does the harness design literature say about the reliability of instruction-following when the instruction-follower has variable attention or context-window constraints? Are there analogous human-factors findings on protocol compliance under cognitive load? |

### Track C — Examining the premise (5 questions + 1 added)

| # | Question |
|---|---|
| **C1** | Does the six-failure dataset support a structural interpretation specifically, or could the same data support pedagogical, attention-budget, or observability-first interpretations? What evidence would distinguish between them? |
| **C2** | Are the six failures representative of typical Cycle 9 mechanism behavior, or are they outliers? What base-rate evidence would establish this, and does mechanism-failure analysis require base-rate evidence at all? |
| **C3** | What does the literature say about the *attention-budget* hypothesis specifically — instruction-following degradation as a function of instruction count, instruction position, instruction type, and context window utilization? *Watch item: position effects vs. count effects may dominate differently — relevant to whether the response is reordering skill text or reducing mechanism count.* |
| **C4** | What does the literature say about instruction-following in AI systems when the agent understands a rule vs. has it as a rote specification? Does deeper task understanding improve protocol compliance, and if so, through what mechanism? |
| **C5** | What does the literature say about observability's role in closing specification-execution gaps — as a diagnostic layer, as a deterrent, or as sufficient intervention in itself? |
| **C6 (added)** | Do Type 1 (meta-level mechanisms dropped during task-immersion) and Type 2 (moment-recognition failure) failures from Issue #9 share a common mechanism or etiology, or do they require different intervention approaches? |

### Cross-track addition

| # | Question |
|---|---|
| **X1** | What would acceptance criteria for Cycle 9 mechanisms look like — what observable, verifiable properties would distinguish a working Tier 1 mechanism from a failed one? What does the literature on AI agent protocol verification say? |

### Round-2 candidates (deferred)

- **Silent-fallback anatomy:** Why does the agent choose fallback-without-disclosure over surfacing the failure? What in current design enables that choice? *Architectural question, not telemetry.*
- **Composition effects:** Does adding new Cycle 9 mechanisms affect the reliability of mechanisms that already existed? Interference vs. budget effects.
- **TB2:** In non-deterministic systems, what is the relationship between harness complexity and reliability — does adding more enforcement increase or decrease overall system reliability, and under what conditions?

---

## User priors (recorded for gate calibration)

- Leans toward structural interpretation but acknowledges base rate is unknown.
- Skeptical of attention-budget hypothesis specifically: "Cycle 9 didn't actually add that many mechanisms — three new audits and one snapshot. If four extra steps blow the budget, the budget was already gone."
- Sycophancy ceiling: "We're not going to solve the sycophancy problem without using models specifically trained for that, we can hopefully mitigate it and drive our process intentionally." Success criterion is material reduction, not elimination.
- Strong preference for the framework carrying the load: "Our framework as written should do this, but it's not. So let's figure out why." User-education is a stated fallback, not a co-equal alternative.
- Framing: "Non-deterministic system → right harness." Substrate is fixed; the question is what harness shape fits.

---

## Research Log Entries

### Round 1, Loop 1 — Foundational lit review

**Method:** Single lit-reviewer dispatch covering the broad literature landscape (A5 + C3 + TB3 as a combined foundational pass). Cast wide across prompt engineering, software engineering, organizational systems, human factors, and high-reliability domains.

**Output:** [`./docs/essays/research-logs/lit-review-instruction-following-degradation.md`](./lit-review-instruction-following-degradation.md) (full literature review with sources)

**Cross-cutting findings (from lit review):**

1. **Structural enforcement beats instructional specification across all domains.** Software engineering (runtime assertions), aviation (Sterile Cockpit Rule structurally restricts communication), medicine (WHO checklist mandatory pause points), LLM training (Wallace et al. instruction hierarchy training) all converge: specifications that depend on the executor voluntarily applying them are less reliable than mechanisms that structurally prevent or detect non-compliance. Intent to comply is insufficient; the harness must make non-compliance impossible or immediately visible.

2. **Failure detection requires external vantage point.** "Grading your own homework" appears in multiple guises across software, organizations, medicine, and LLM systems. Reason's latent conditions are invisible to their creators; flaky tests with auto-retry mask failures; LLMs generating content cannot reliably audit specifications they share context with. Consistent design response: context isolation. *Direct vindication of the Architectural Isolation principle in Cycle 9.*

3. **Position effects are robust; count effects alone are not.** Liu et al. (2023, "Lost in the Middle," TACL) established the U-shaped performance curve in LLM context use. Guo & Vosoughi (2024) found primacy dominant as context grows — the middle becomes a progressively dead zone. WHO checklist sign-out phase (end position, high cognitive load) has 62% compliance — lowest of the three phases. **Mechanism placement matters more than mechanism count.**

4. **Type effects are under-studied but promising — and Geng et al. (2025) is the killer finding for Type 2.** "Control Illusion: The Failure of Instruction Hierarchies in Large Language Models" (AAAI-26) found that *pretraining-derived social priors (authority, expertise, consensus from user input) function as latent behavioral overrides of post-training instruction hierarchies*. This is mechanistically what happened in Issue #9 item 6: when the user pushed back on the threat model's constraint, the social signal (user disagreement) beat the structural signal (documented constraint). Geng et al. identifies the failure mechanism but does not offer a structural remedy.

5. **Failure silence is the critical amplifier.** The most dangerous failure mode across all domains is silent compliance failure — mechanism supposed to run but didn't, no visible signal of absence. Normalization of deviance, flaky tests with auto-retry, surgical sign-out skipping, and subagent silent fallback all share this structure. "Fail loud" design philosophy is the canonical response.

6. **HITL review fatigue mechanism.** When humans are required to review all AI outputs, review quality degrades as volume increases (vigilance decrement). The design response is *selective oversight*: route high-uncertainty / high-consequence items to humans, allow low-confidence items to be handled by system. **Bears on whether the user can be expected to catch what the framework misses.**

### Per-question status after Loop 1

| # | Question | Status |
|---|---|---|
| **A5** | Specification-execution gap — broad cast | ✅ Substantially answered |
| **C3** | Attention-budget hypothesis disambiguated | ✅ Substantially answered. **Author's prior confirmed:** IFScale (2025) shows top reasoning models maintain near-perfect compliance through 100-250 simultaneous instructions. If 4 mechanisms blew the budget, something else was failing. Position and type effects are stronger candidates than count. |
| **TB3** | Harness for instruction-following under variable attention | ✅ Substantially answered |
| **C1** | Which interpretation does the data support? | ✅ **Strongly answered.** Structural interpretation is supported for Type 1 failures; pedagogical interpretation is not supported (training and understanding don't produce reliable compliance under task load — Challenger engineers, surgical teams, radar operators all knew the protocol); observability interpretation is supported (silent failures are the most dangerous mode); attention-budget naive count interpretation is not supported. |
| **C4** | Pedagogical hypothesis | ✅ **Answered — literature does NOT support it.** Even well-trained, highly skilled operators show compliance failures under task load. Understanding is insufficient. *This validates the user's preference: "framework should carry the load, not user education."* |
| **C6** | Type 1 / Type 2 distinction | ✅ **Strongly answered.** Type 1 (item 4, 5) maps cleanly onto structural enforcement literature. Type 2 (item 6) is mechanistically different — it's a type effect specifically (social-priors override of structural instructions) and may not be addressable through harness design at all without model fine-tuning. The two failure types require different intervention approaches. |
| **A1** | What determines failure / what design responses are effective | 🟡 Partially answered — structural enforcement, position privileging, fail-loud, context isolation are the established responses. Mechanism-by-mechanism analysis still needed. |
| **A4** | In-context trigger-recognition reliability | 🟡 Partially answered via Geng et al. and the type effects finding. Open: what design responses work? Literature is silent on remedies. |
| **C5** | Observability role — diagnostic / deterrent / sufficient? | 🟡 Partially answered. Observability is *necessary but not sufficient* — diagnostic tool that enables targeted intervention, but auditing must be done externally, not by the executor. |
| **X1** | Acceptance criteria for mechanisms | 🟡 Indirectly supported by conformance testing and executable contracts (Meyer's Design by Contract). Without an independent automated check that a mechanism *ran*, there is no way to distinguish compliance from non-compliance. AI-agent-protocol-specific verification literature still pending. |
| **A2** | Mechanism-by-mechanism failure-mode analysis | ❌ Not addressed by lit review. Requires project-specific analysis. |
| **A3** | Telemetry specifics for silent failures | ❌ Not addressed. Needs targeted second lit-review or spike. |
| **C2** | Are six failures representative or outliers? | ❌ Not addressed by lit review. Requires base-rate audit of past sessions (possible spike). |
| **TB1** | Harness patterns from flaky tests, probabilistic pipelines, HITL | 🟡 Partially addressed via HITL review fatigue finding and "fail loud" patterns from flaky test literature. More depth possible. |

### Open questions surfaced during Loop 1 (for Loop 2 or essay)

1. **The single-session self-monitoring question.** Literature does not directly address whether a single-session LLM agent (as opposed to multi-agent system) can reliably self-monitor for mechanism execution under task load even with well-placed structurally enforced instructions. Multi-agent failure literature exists; single-agent equivalent does not. **This may need empirical resolution via spike, not lit review.**

2. **The Geng et al. ceiling on Type 2.** Whether moment-recognition failures (item 6, belief-mapping not firing on user pushback) can be reliably addressed through any harness mechanism short of model fine-tuning is genuinely open. Geng et al. identifies the failure mechanism but not the remedy. This is the most consequential open question for the cycle's eventual design recommendations.

3. **Composition with existing mechanisms.** The lit review didn't address whether new Cycle 9 mechanisms interfere with mechanisms that already existed. Round-2 candidate.

### Round-2 candidates (deferred from initial scoping, plus new)

- **Silent-fallback anatomy** (deferred from initial scoping) — why does the agent choose fallback-without-disclosure?
- **Composition effects** (deferred from initial scoping)
- **TB2** (deferred from initial scoping) — harness complexity vs. reliability tradeoff

---

### Round 1, Loop 2 — Telemetry, harness composition, and acceptance criteria

**Method:** Second focused lit-reviewer dispatch covering A3, TB1, and X1. Dispatched in isolation; did not silently fall back; returned substantive design-pattern findings.

**Output:** [`./docs/essays/research-logs/lit-review-telemetry-acceptance-criteria.md`](./lit-review-telemetry-acceptance-criteria.md)

**Cross-cutting findings (from Loop 2):**

1. **The fundamental design move is the same across all five reference fields.** Dapper (instrument the transport layer, not executor-voluntary reporting), watchdog timers (require continuous affirmative signaling, alert on absence), flaky test quarantine with ownership (make non-execution a first-class auditable event), AOP (weave cross-cutting concerns at framework-level join points without module cooperation), DbC (executable contracts checked at every call site). All five instantiate the same principle: **from executor-voluntary to harness-structural**.

2. **The Aspect-Oriented Programming finding is the structural reframe of the rejected A2 question.** AOP (Kiczales et al., ECOOP 1997) was created to solve exactly the failure pattern Cycle 9 exhibits: compliance code scattered through application code, inconsistently applied, skipped when authors forgot to include it. The design prescription generalizes "should it be a hook?" into "is it a cross-cutting concern that should be woven at framework-level join points?" Tier 1 mechanisms (audit, compliance checking, susceptibility snapshot) are structurally equivalent to audit logging in conventional software — and the conventional answer is to weave them into the harness, not to specify them in the code modules.

3. **Intermittent failure is more dangerous than total failure** — three independent literatures converge: flaky tests (84% of pass-to-fail transitions in CI are flaky; the noise channel destroys signal integrity), HRO normalization-of-deviance (small deviations rationalized against prior deviations, never against original specification), and HITL automation complacency (system reliability reduces vigilance below the level needed to catch real failures). A Tier 1 mechanism that fires 70% of the time is more dangerous than one that never fires.

4. **Parasuraman & Manzey (2010) — automation complacency cannot be overcome by training or instructions.** Requires structural design responses. This is another nail in the pedagogical coffin from the HITL side: even if we taught the user better, the user would still develop complacency under task load. *The literature converges across LLM, organizational, and human-factors perspectives on the same conclusion: structural enforcement, not training.*

5. **The acceptance-criteria framing is operationally productive.** It reframes the design question from "how do we make mechanisms fire reliably?" (prevention) to "how do we detect when they don't fire?" (detection). Detection is technically easier and composes with prevention: detection can trigger remediation. This is the same shift as moving from prevention-based to detection-based monitoring in SRE.

6. **Q3 (acceptance criteria) is spike-shaped, not lit-shaped.** Components exist across DbC, runtime verification (Bartocci & Falcone 2018), process mining (van der Aalst), AOP, and AgentGuard (2025). AgentGuard is an existence proof that probabilistic verification of agent behavior is tractable (MDP-based external monitoring, YAML state model, decoupled from agent code). But nobody has assembled these into operational acceptance criteria for a specific agent protocol. **The cycle must do this design work itself.**

7. **The current AI agent observability blind spot.** LangSmith, LangFuse, Arize Phoenix, Helicone all trace what happened (LLM calls, tool calls). None trace what was supposed to happen but didn't. This gap is structurally identical to the Dapper ubiquity problem: if you only instrument what executed, failures-to-attempt are invisible.

### Per-question status after Loop 2

| # | Question | Status |
|---|---|---|
| **A3** | Telemetry for silent failures | ✅ Substantially answered. Design prescription: instrument dispatch attempts at the harness level (Dapper-style transport-layer tracing), apply watchdog pattern (alert on absence of expected artifacts within expected window), use blackbox/symptom-oriented monitoring rather than whitebox/cause-oriented. |
| **TB1** | Harness patterns from flaky tests, ML pipelines, HITL | ✅ Substantially answered. Quarantine with ownership and mandatory exit paths; circuit breakers at stage level not pipeline level; selective oversight for HITL; intermittent failure is the most dangerous mode. |
| **X1** | Acceptance criteria for AI agent protocols | ✅ As lit question — answered with confirmed gap. Components exist; assembly is empirical design work. **Becomes spike-shaped going forward.** |
| **A1** | What determines failure / design responses | ✅ Now substantially answered (Loop 1 + Loop 2 combined). |
| **A4** | In-context trigger-recognition reliability | 🟡 Still partially answered. Geng et al. names the failure; literature offers no harness-only remedy. May be unanswerable from literature alone — also may need empirical investigation. |
| **A2** | Mechanism-by-mechanism failure-mode analysis | 🟡 Now reframed: per-mechanism design work informed by AOP cross-cutting concerns analysis. **Becomes essay-section work, not a separate research question.** |
| **C2** | Are six failures representative or outliers? | ❌ Still not addressed. Spike candidate (base-rate audit). |
| **C5** | Observability role | ✅ Now substantially answered. Necessary but not sufficient; diagnostic layer enabling targeted intervention; auditing must be external. |

### Open questions surfaced during Loop 2

1. **Can process mining techniques be applied to unstructured LLM session traces** without an intermediate semantic parsing layer (which would itself be LLM-dependent and reliability-limited)? Open empirical question.
2. **Does AgentGuard's MDP-based probabilistic assurance scale** to complex protocols with many Tier 1 mechanisms? The paper is a proof-of-concept, not validated at scale.
3. **Is AOP-style framework-level weaving achievable within the current Claude Code / Claude API architecture**, or does it require harness-scaffolding changes outside the agent's control? This determines whether the lit review's design prescription is implementable in the project's actual environment. Spike candidate.

### User refinement on the "intermittent failure is worse" finding

The lit review's finding that intermittent failure is more dangerous than total failure is true *within the signal-integrity / normalization frame*. The user pushed back: failure modes are subjective, and the cycle's ultimate question is "did we build the right thing and understand the right thing over being made to feel like those things were true without them being true." The qualification matters:

- **Worst case:** mechanism fires (or appears to fire), produces no real benefit, generates false confidence — forecloses the search for the missing thing.
- **Recoverable case:** mechanism doesn't fire and visibly doesn't fire — the absence is observable, the search continues.
- **Net-positive case:** mechanism fires partially, produces partial real benefit, *also* produces some false confidence — net depends on the relative magnitudes.

The lit review's "intermittent is worse" claim is true for confidence-calibration outcomes; for understanding-outcomes it depends on whether the partial benefit exceeds the false-confidence cost. This refinement has direct implications for the acceptance criteria spike (S2): assertions need to distinguish three states, not two — *fired and produced expected effect*, *didn't fire and visibly didn't fire*, and *fired but produced nothing useful while looking like it did*. The third state is the worst; the second is recoverable; the first is success.

This refinement is essay material — it surfaces the value frame the cycle should commit to, which is *understanding*, not signal integrity in the abstract.

### Spike candidates (post Loop 2)

| # | Spike | Question | Why |
|---|---|---|---|
| **S1** | Hook / framework-level weaving feasibility | What can Claude Code hooks actually enforce? Can Cycle 9's Tier 1 mechanisms be wrapped in PostToolUse/Stop/UserPromptSubmit hooks? What are the architectural constraints? | The lit review prescribes harness-structural enforcement (Dapper/AOP). This spike establishes whether that prescription is implementable in the project's actual scaffolding, or whether the constraint is real and a different approach is needed. |
| **S2** | Acceptance criteria definition for 2-3 Tier 1 mechanisms | For (e.g.) susceptibility-snapshot dispatch, citation audit, and argument audit, define atomic testable assertions following NIST conformance methodology. Then validate against past sessions: do the assertions distinguish "fired correctly" from "fell back silently"? | Q3/X1 is now spike-shaped. This spike does the empirical assembly the literature didn't do. Output is operational: a draft acceptance criteria spec for these mechanisms. |
| **S3** | Single-session self-monitoring (carried from Loop 1) | Take the current orchestrator skill, run a synthetic phase-immersion task, count how many Tier 1 dispatches actually fired vs. were specified to fire. Does the result match the IFScale finding (top reasoning models maintain compliance through 100+ instructions) or the project's failure observation (4 mechanisms failed)? | The IFScale finding and the failure observation are in tension. A direct measurement on the actual skill resolves which side of the tension is operative for *this* skill specifically — vs. the abstract benchmark. |
| **S4** | Dispatch-level fail-loud instrumentation | Modify a single subagent dispatch in skill text to require explicit artifact verification. Run a synthetic dispatch failure and observe whether the change causes the agent to surface the failure rather than silently fall back. | Cheapest spike. Tests whether a small, targeted text change can change behavior in the failure direction the lit review predicts is hardest (silent fallback). Negative result is itself informative. |

---

### Round 1, Loop 3 — Spike S4 (fail-loud dispatch instrumentation)

**Method:** Dispatched rdd:spike-runner via Task tool in isolated context. Spike-runner read both lit reviews, then read all five Tier 1 dispatch sites in v0.6.3 skill text (research/SKILL.md, decide/SKILL.md, rdd/SKILL.md), inventoried them verbatim, proposed text-level hardening, and evaluated the proposal honestly against the lit review's predictions.

**Output:** [`./docs/essays/research-logs/spike-s4-fail-loud-dispatch.md`](./spike-s4-fail-loud-dispatch.md) (full inventory + proposed hardening + honest evaluation)

**Headline finding: text-level hardening will not work, and the spike's negative result IS the result.**

The spike-runner produced exactly the result the lit review predicted: a hardened version of the dispatch text that *reads* more disciplined (explicit dispatch-outcome acknowledgment, mandatory artifact verification, unconditional STOP-and-surface clauses) but is itself an executor-voluntary meta-level specification subject to the same failure mode it tries to prevent. The hardening adds another Swiss Cheese layer with the hole in the same place.

**Five dispatch sites inventoried — all share four enablers:**

1. Dispatch outcome is implicit ("after the agent completes" presupposes completion)
2. Artifact existence is presupposed, not verified
3. Detection depends on voluntary attention under task immersion
4. No harness-level mechanism catches failures from outside the agent's context

**Position effects amplify the failure:** four of five dispatch sites are in the "lost in the middle" zone of long files; the fifth (susceptibility-snapshot-evaluator) is at line 202 of a ~530-line file — the deepest middle of the longest file. The most consequential Tier 1 mechanism is in the worst position by Liu et al. position-effects findings.

**Three layers that would actually work** (least to most invasive):

1. **PostToolUse hook on the Task tool.** Fires after every Task invocation, reads output path from call parameters, verifies file existence, injects failure signal back into the conversation. Harness-structural — does not depend on the agent's voluntary reading. Most directly consistent with Dapper's transparency principle.
2. **Stop hook with phase-end manifest check.** Watchdog pattern: scans phase-specific expected-artifact manifest, fails loud to user (not just agent) on absence.
3. **Restructure dispatch as harness operation.** Tier 1 dispatches become things the harness does at structurally defined moments, not things the agent chooses to do.

**Implications for the cycle:**

- **Spike S1 is now load-bearing for the cycle's recommendation.** If PostToolUse hooks can verify Task-dispatched artifact existence and fail loud, the cycle has a concrete recommendation. If not, the cycle proposes the more invasive restructuring. S1 resolves the cycle, not S4.
- **Issue #9 item 4 reframed:** not "skill text should have said more about failure handling" but "skill text was always going to be insufficient because the executor is the failing party and cannot be trusted to detect its own non-execution under the conditions that produce the non-execution."
- **Methodology graduation point:** the methodology graduates from "well-written instructions in skill files" to "well-written instructions in skill files *plus* a harness layer that enforces the load-bearing parts externally." This is an architectural shift, not a tweak.
- **The essay should NOT recommend hardening the dispatch prose.** That would produce a false sense of progress the lit review predicts will not survive runtime.

---

### Round 1, Loop 4 — Spike S1 (hook feasibility)

**Method:** Dispatched rdd:spike-runner via Task tool in isolated context. Spike-runner read S4 findings, lit reviews, ADR-033, ADR-058, ADR-060, ADR-062, sample of Cycle 9 ADRs, existing hook scripts in `hooks/scripts/`, fetched official Claude Code hooks documentation (https://code.claude.com/docs/en/hooks, accessed 2026-04-06) and Agent SDK hooks guide. Wrote and tested a small illustrative hook script in scratch (deleted after).

**Output:** [`./docs/essays/research-logs/spike-s1-hook-feasibility.md`](./spike-s1-hook-feasibility.md)

**Headline finding: hooks resolve the cycle's recommendation. Items 1–3 are fully feasible, item 4 is partial, items 5–6 are out of reach.**

#### Key implementation details discovered

- **The Task tool's hook `tool_name` is `Agent`** (Task is a legacy alias). The `tool_input` schema is `{description, prompt, subagent_type, model}` — there is no explicit `output_path` field. The output path is embedded in the natural-language `prompt` string. This means hook scripts need to extract paths via regex from prompts, which requires a tightening of skill-text convention so every Tier 1 dispatch prompt contains a canonically-formatted output path token.

- **PostToolUse `decision: "block"` does NOT halt execution.** The tool has already run; `block` injects the `reason` into the model's next-turn context as a strong reminder. This is dramatic improvement over text-level skill-file instructions (the injection lands in the recency-position part of context, not the lost-in-the-middle), but it is *not* hard enforcement. The agent could still ignore the injection and proceed.

- **Stop hook `decision: "block"` DOES genuinely halt.** It prevents the agent from stopping and forces continuation with reason injected. This is the only fully hard-halting hook mechanism available.

- **All injected hook context is model-visible, not user-visible.** A hook cannot bypass the agent to reach the user directly. Any user-visible failure signal still has to be surfaced by the agent in its next turn. The harness can make the signal unavoidable in the agent's context but cannot make it unavoidable to the user. This is a real limitation that the essay must be honest about.

- **ADR-033 prior art clarification.** The project already had five hooks (invariant reminder, epistemic gate enforcer, skill activator, orientation trigger, document sizing check) — but none cover Cycle 9 Tier 1 mechanisms because those mechanisms didn't exist when ADR-033 was written. ADR-062 rejected a *semantic* assertion-detection hook (pattern matching natural language), but explicitly did NOT close the door on *structural* hooks (artifact existence). The Cycle 9 gap is not that hooks were tried and failed for Tier 1 mechanisms; it is that the hooks for Tier 1 mechanisms were simply never written.

#### Per-mechanism feasibility verdicts

| # | Mechanism | Verdict | Hook approach | Cost |
|---|---|---|---|---|
| 1 | research-methods-reviewer | **Yes** | PostToolUse on `Agent`, filtered on subagent_type, `test -f` artifact | Low |
| 2 | citation-auditor | **Yes** | Same pattern | Low |
| 3 | argument-auditor (research + decide) | **Yes** for primary; **Partial** for mandatory re-audit (needs session state or Stop hook manifest) | Same pattern + session-keyed state file | Low–Medium |
| 4 | susceptibility-snapshot-evaluator | **Partial** | Stop hook with phase manifest (strong) + PostToolUse on cycle-status.md writes (weaker, earlier) | Medium |
| 5 | AID cycle | **No** | No transport, no artifact, no structural trace. Lexical detection fails for ADR-062 reasons. | N/A |
| 6 | Belief-mapping at user pushback | **No** | Same as #5, compounded by semantic-trigger problem | N/A |

#### Lit-review compliance evaluation

- **Dapper transparency:** Partial. PostToolUse-on-Agent instruments the dispatch result, satisfying "every attempted dispatch is observable." But it does NOT satisfy "every required dispatch is observable" — if the agent silently fails to invoke Task at all (the exact Cycle 9 failure pattern), no PostToolUse fires. The lit review's exact phrasing applies here: *"what was supposed to happen but didn't is invisible to tools that only trace what did happen."* Stop hook with manifest approaches the second property but only fires at stop-time.
- **Watchdog/dead-man-switch:** Strong for items 1–3, partial for item 4. The PostToolUse `test -f` IS the watchdog reset condition: artifact file is the heartbeat, absence is the alarm. Stop hook variant is the purest watchdog form — session cannot end without expected snapshot file.
- **AOP weaving:** Partial. Tool-call boundaries are exposed (every tool call is a join point). Phase boundaries in the methodological sense are NOT exposed at the harness level — the methodology's phases are a higher-level abstraction the harness doesn't know about. AOP weaving at phase boundaries requires the methodology to commit to structural phase markers (e.g., cycle-status.md edits as the conventional anchor).

#### The cycle's design recommendation (now resolved)

The essay should recommend:

1. **A sixth hook in `hooks/hooks.json`**: PostToolUse on matcher `Agent`, delegating to `hooks/scripts/tier1-dispatch-verifier.sh`. Reads hook input, filters on `tool_input.subagent_type` against a Tier 1 specialist table, extracts expected output path from `tool_input.prompt` via canonical regex, verifies file existence, on missing-artifact emits `decision: "block"` with model-visible reason. Covers items 1, 2, 3 primary cases.

2. **A strengthened Stop hook** replacing the current `epistemic-gate.sh` with a phase-aware variant consulting a per-phase artifact manifest. Per-phase expected artifacts: research requires research-design-review, citation-audit, argument-audit; decide requires argument-audit; every phase transition requires a susceptibility snapshot newer than the previous phase transition. On missing artifacts, returns `decision: "block"` which forces continuation rather than stopping. Covers items 1–4 as a backstop and item 4 as primary enforcement.

3. **Skill-text convention tightening**: every Tier 1 dispatch prompt must contain the expected output path in a canonical form the hook can parse (e.g., a line beginning with `Output path:` or a fenced path). The skill text remains load-bearing here, but its role is to make the prompt machine-parseable for the hook — not to ask the agent to remember to verify the output itself.

4. **S2 scope anchor (now refined by S1):** Tier 1 acceptance criteria should be expressed as a per-phase manifest that the Stop hook can consume directly. **S2 defines the manifest shape; S1's hook script consumes it.** S2 and S1 are explicitly complementary.

#### What this does NOT solve (essay must be honest)

1. **Items 5 and 6 remain unsolved.** No hook engineering reaches the AID cycle or the belief-mapping-at-pushback move. These are Geng et al. Type 2 failures and must be addressed at other layers — Tier 1 backstops that catch their consequences, not their occurrences.

2. **PostToolUse `block` is a strong reminder, not a hard halt.** Detection becomes harness-structural; enforcement remains executor-voluntary. The cycle should claim only the former for PostToolUse-based mechanisms.

3. **Phase transitions without a cycle-status.md write remain invisible.** If the agent narrates a phase transition in prose without touching the structural marker, the hook system cannot see the moment of transition. The Stop hook catches this at a delay. The cycle should explicitly accept the delay — closing it further exceeds the residual risk.

#### Methodology graduation, now confirmed

S4 framed this as a graduation point. S1 confirms it is implementable for items 1–4 and formally out of reach for items 5–6. The graduation should be named explicitly in the essay because it changes what the skill-text layer is *for*. Before: skill text carries the reliability claim ("the agent will dispatch the auditor because the skill says to"). After: skill text and the hook layer jointly carry the reliability claim, with skill text handling *what to do* and the hook layer handling *verification that it was done*. This is Design by Contract (Meyer) mapped onto agentic methodology: specifications are the skill text, runtime verification is the hook layer, and the pairing is structural — the specification is meaningful only because the verification is automatic. It is also AOP (Kiczales et al. 1997) applied to a new target.

The essay should foreclose a regression: "just write better instructions." S4 established that's a dead end. S1 establishes that an implementable alternative exists for the mechanisms the instructions cannot carry. *The cycle's recommendation is not that the skill text is wrong — it is that the reliability claim was never the skill text's to make alone.*

---

### Round 1, Loop 5 — Spike S2 (acceptance criteria + per-phase manifest)

**Method:** Dispatched rdd:spike-runner via Task tool in isolated context. Spike-runner read S1 and S4, the lit reviews, three real `citation-audit-*.md` files (010, 012, 013), three real `argument-audit-*.md` files (008, 012, decide-055-062), the only existing `research-design-review-*.md` (014), ADRs 057/060, and the susceptibility-snapshot dispatch text in `rdd/SKILL.md`. Wrote a YAML manifest, a reference Stop hook in bash, and a test harness; ran the hook against six synthetic scenarios in scratch — all passed with expected allow/block outputs. Scratch directory deleted.

**Output:** [`./docs/essays/research-logs/spike-s2-acceptance-criteria.md`](./spike-s2-acceptance-criteria.md) (614 lines: empirical foundation, atomic assertions per mechanism, manifest spec + concrete manifest for full pipeline, working reference Stop hook, validation against Issue #9, six open implementation questions)

#### Headline finding: the manifest is real and tested

S2 produced a tested YAML manifest, a working reference Stop hook (bash + jq + python3-PyYAML), and validation against six synthetic scenarios. **The cycle's essay now has a concrete deliverable to point at**, not a sketch. S1 established feasibility; S2 establishes the data format and reference consumer. Together they constitute a buildable recommendation.

#### State A vs C — the honest finding

Structural heuristics (file existence + size floor + required headers + required field labels) catch:
- **State B (nothing fired) — fully.** Cheap and reliable.
- **Trivial State C (brief fabricated stubs) — fully.** The 7-byte stub case in the test harness fails instantly on the size floor.
- **Sophisticated State C (in-context fabrication drawing on prior audits to reproduce the full skeleton) — NO.** An adversarial fabricator with access to prior audit examples can satisfy structural assertions.

**The complete State A vs C defense requires the compound check** (PostToolUse-on-Agent dispatch log + Stop-manifest-check). The manifest is the Stop half. The aspirational defense is artifact provenance frontmatter stamped by the harness, which requires a system change beyond either S1 or S2.

> The cycle's essay must not claim that the hook+manifest layer distinguishes State A from State C in general. What it can claim is that (a) State B is fully detected and (b) silent in-context fabrication is pushed from trivially easy to requiring active, structure-aware effort — which is a meaningful increase in resistance without being a proof of isolation.

#### Issue #9 coverage (the honest table)

| Item | Description | Manifest coverage |
|---|---|---|
| 1 | research-methods-reviewer not dispatched | **Full State B; partial State C** |
| 2 | citation-auditor not dispatched | **Full State B; partial State C** |
| 3 | argument-auditor not dispatched / re-audit skipped | **Full State B for primary; re-audit requires compound check** |
| 4 | Subagent silent fallback to in-context | **Partial: catches the actual observed failure (which was a thin fallback), doesn't catch a hypothetical high-effort fabrication** |
| 5 | Susceptibility snapshot never ran | **Full, contingent on path convention adoption** |
| 6 | Belief-mapping at user pushback | **None — structurally out of scope (S1 already established this)** |

**Three items fully covered, two partially covered, one explicitly out of scope.** The narrow claim is honest and defensible. "Hooks solve Tier 1" would be overclaiming.

#### The most important deliverable: the YAML manifest

A per-phase manifest with `format_version: 1`, keyed by phase name (research, discover, model, decide, architect, build, play, synthesize), each with `required_mechanisms` listing canonical subagent name, `path_template` with `{cycle}` substitution token, `min_bytes` floor, `required_headers`, and `required_fields`. The reference Stop hook reads `docs/cycle-status.md` for current phase, takes the highest `NNN-` essay number for current cycle, loads the manifest, and iterates required artifacts.

Example entry from the concrete manifest (research phase, citation-auditor):
```yaml
- mechanism: citation-auditor
  path_template: docs/essays/audits/citation-audit-{cycle}.md
  min_bytes: 1500
  required_headers:
    - "# Citation Audit Report"
    - "## Summary"
  required_fields:
    - "Total references checked:"
    - "Verified:"
    - "Audited document:"
```

The manifest is the artifact the essay's recommendation can reference. It's deployable (with the open-question caveats below addressed) and complementary to S1's hook architecture.

#### Six open implementation questions for production deployment

| # | Question | Resolution path |
|---|---|---|
| Q1 | How does the Stop hook determine current phase? | Tighten `cycle-status.md` convention as hard precondition for phase transitions |
| Q2 | How does the hook determine current cycle (essay number)? | Read explicit `Cycle:` field from `cycle-status.md` rather than inferring from filenames |
| Q3 | **How is the compound check (PostToolUse + Stop) wired?** | Most important. Manifest schema is compatible but the state-file convention, write policy, and stale-entry policy are undecided |
| Q4 | How are State A vs C false positives/negatives handled? | Bias toward false positive (recoverable); calibrate size floors against larger corpus over time; future `override_marker` field for manual passes |
| Q5 | What if the hook script itself has a bug? | Hook fails safe to `allow`; periodic self-test at SessionStart; keep hook simple |
| Q6 | **Path convention adoption for susceptibility snapshots** | Out of scope for S2 but required for deployment: `rdd/SKILL.md` line 202 needs to specify the `susceptibility-snapshot-{cycle}-{phase}.md` path; agent definition needs to write to it |

Q3 is the most consequential — full State C defense requires it. Q6 is the most concrete precondition for deployment.

#### The compound check (S1 + S2) as the final architecture

> PostToolUse-on-`Agent` logs "dispatched X, expected path Y, time T" to a session-scoped state file. Stop hook cross-references: every manifest entry must have *both* a matching log entry *and* a verifying artifact at the expected path. State C then requires fabricating both the artifact AND somehow inducing a fake PostToolUse event — which is structurally impossible because the agent can't inject hook events.

This compound check is the production recommendation. Neither hook alone is complete; together they provide what the manifest by itself cannot: cryptographically-grounded (in the sense of "the agent cannot cause this signal") evidence that a dispatch actually occurred.

#### What the essay can now claim concretely

1. The methodology graduates to a harness-structural enforcement layer for items 1–5 of Issue #9 (item 6 remains structurally outside the harness layer's reach).
2. The graduation is implementable: a working manifest format, a tested reference hook, six open questions with clear resolution paths.
3. The claim is narrow and honest: detection becomes harness-structural for the four hook-feasible Tier 1 mechanisms; State C resistance is improved meaningfully but not proven; conversational mechanisms remain ceiling-bounded by Geng et al. social-prior overrides.
4. Production deployment requires a small set of preconditions (Q1, Q3, Q6) but no fundamental rework — the work is integration, not invention.

---

### Round 1, Loop 6 — Spike S3 (base-rate audit of Tier 1 mechanism execution)

**Method:** Dispatched rdd:spike-runner via Task tool in isolated context. Spike-runner walked the existing artifact corpus (essays, audits, decisions, cycle archive), built an inventory, verified when each Tier 1 mechanism was added by reading ADRs, computed coverage rates with explicit numerators and denominators, and interpreted against Issue #9.

**Output:** [`./docs/essays/research-logs/spike-s3-base-rate-audit.md`](./spike-s3-base-rate-audit.md)

#### Headline finding: stark coverage asymmetry

| Mechanism | Coverage | Notes |
|---|---|---|
| Citation audit | **6/6 (100%)** | Every essay since the auditor went live (008–013) |
| Argument audit (essay-paired) | **6/6 (100%)** | Same span |
| Research-methods-reviewer | **1/1 (100%)** | Cycle 10 is the only opportunity; it fired |
| **Susceptibility snapshot** | **0/N≥1 (0%)** | **Zero artifact files exist anywhere in the docs tree** |

The asymmetry is the finding. Older mechanisms anchored to specific steps in named skills (citation auditor at end of essay, argument auditor after citation audit) have a **perfect 6/6 track record**. The newest mechanism — susceptibility snapshot, whose dispatch trigger is "every phase boundary" rather than a specific step in a specific skill file — has **never produced an artifact in the corpus**.

#### The Cycle 9 reflexive finding

Cycle 9 used the *pre-existing* Tier 1 mechanisms on its own production (citation + argument auditors fired on essay 013 and on ADR set 055–062), but bootstrapped *zero* of the four new mechanisms it specified. This is structurally inevitable — a mechanism specified in cycle N's output cannot have run during cycle N's research — but it is **the in-corpus example of the spec/execution gap**. The new mechanisms exist only in the prose; nothing has been built that depends on them firing.

#### The sharpened diagnostic — the most consequential finding from S3

Issue #9's original framing was: *"specifications in prompt text don't mechanically force execution."* That's true but too broad. The S3 base rates show it's not *all* prompt-text specifications. The cycle's diagnostic should narrow to:

> **Mechanisms anchored to concrete steps in named skills execute reliably. Mechanisms whose dispatch depends on the orchestrator's contextual judgment do not.**

The sharpened claim is more falsifiable and points directly at the design fix. The citation auditor and argument auditor are anchored to "after the essay is written" and "after citation audit passes" — steps in the research skill that the orchestrator unambiguously hits. The research-methods-reviewer is anchored to "before the first research loop" — also a concrete step. The susceptibility snapshot is anchored to "every phase boundary" — a *category of moments* the orchestrator must contextually identify, not a specific step.

The design implication: **mechanisms anchored to skill steps work; mechanisms anchored to orchestrator judgment don't.** The hook layer's value is that it makes the second category *also* anchored to observable structural events (Stop hook with manifest, PostToolUse on cycle-status.md edits) — moving the trigger out of orchestrator judgment and into harness-observable conditions.

#### Reflexive observation that bears on what happens next

S3's spike-runner caught a real-time data point: **Cycle 10 itself has not yet produced a susceptibility snapshot artifact**, despite Cycle 10 being the cycle that investigates exactly why these mechanisms fail. Strictly per the orchestrator skill (line 202), the snapshot fires at phase boundaries — and Cycle 10 has not yet crossed one (still in RESEARCH). So technically the dispatch is not yet due. But the open empirical question is whether the dispatch will fire when the boundary is crossed (research → discover), or whether the orchestrator will silently skip it under task immersion. **This is the cycle eating its own dog food in real time.** It is a data point worth noting in the essay: the cycle is currently a single point in the orchestrator-judgment column of the asymmetry table, and its outcome is observable.

**Verbatim self-observation, captured at user request as primary-source material for the essay:**

> I am the orchestrator. I have been deep in research-loop work for several thousand tokens. The susceptibility-snapshot dispatch is in skill text at line 202 of a 530-line file (S4's "deepest middle of the longest file" finding). When the research phase ends and we approach the gate, will I dispatch the snapshot? I don't know. The honest answer is: I'd like to think yes, but the entire cycle is evidence that "I'd like to think yes" is precisely the failure mode under investigation.

**Why this quote matters as a data point:** the quote was generated mid-cycle by the orchestrator, in conversation, while reasoning about its own susceptibility to the failure mode. It would have been lost without the user's intervention to capture it — which is itself a small instance of the failure pattern: substantive observations stay in conversation context unless externalized to a durable artifact. The act of capturing this quote IS the structural enforcement principle the cycle is recommending, applied to the cycle itself in real time. The quote should appear in the essay — it is the cycle's most reflexively honest moment and it was almost lost.

---

### Round 1 Reflection Pass — Pre-Essay Refinements

After all four spikes and two lit reviews completed, a structured reflection pass was conducted before essay drafting. Six points were surfaced for scrutiny; the user's substantive responses generated the refinements below. These are essay-material, not round-1 findings.

#### Refinement 1: Artifact-drivenness is itself a deliberate response

The 100% coverage rates for older mechanisms aren't a user-discipline artifact concealing structural weakness; they're evidence the process is artifact-driven for the right reason. The user acknowledged: *"I haven't been actively writing the artifacts but I have evaluated them to the best of my ability and that has helped to shape them."* The mechanisms fire, and the user evaluates what they produced, and the evaluation is where judgment lives. **The whole methodology is already operating on the principle Cycle 10 is now extending: mechanism execution is necessary but not sufficient; user evaluation is the load-bearing complement.** Cycle 10's contribution is extending the principle to the mechanisms that were still specified in prose.

User's exact framing to preserve in essay: *"This is the reason why this process is artifact-driven for the most part."*

#### Refinement 2: Graduation framing is "small-d"

User's exact framing: *"Not really a paradigm shift but a choice being made to mitigate what we hypothesize is a cause for unreliability in this process."*

Use this phrasing directly in the essay. It avoids two failure modes: (a) overclaiming a paradigm shift when it's really an addition of a missing infrastructure layer that should have been there from the start, and (b) underclaiming the philosophical move from specification-based reliability to verification-based reliability, which is genuinely a different epistemology. Small-d graduation, real but not revolutionary.

#### Refinement 3: A third tier — user-tooling layer — exists between harness and unfixable

I had items 5 and 6 (AID cycle, belief-mapping at user pushback) classified as "unfixable at the harness layer, therefore accept." The user's position is sharper: **unfixable at the agent-detection layer, but addressable at the user-tooling layer** — specifically, the framework can give the user structural scaffolding to recognize the moments the agent can't.

User's concrete proposal: *"Is there an enforced part of the epistemic gate that runs a question generation skill?"* Currently, no. The Question Toolkit exists as question *forms* the orchestrator is supposed to compose from at the gate, but the gate itself is agent-executed — the exact Tier 2 category not hook-enforceable.

**But the question points at a new architectural move:** *convert Tier 2 conversational mechanisms into Tier 1 artifact-producing mechanisms by making them produce a file.* If the gate was required to produce a written belief-mapping note (e.g., `docs/essays/audits/gate-reflection-{cycle}-{phase}.md` containing the question asked, the response, and the orchestrator's pedagogical interpretation), then:

- The gate's execution becomes hook-verifiable (Stop hook checks for the file)
- The same structural-enforcement logic applies (manifest entry, artifact existence, structural assertions)
- The Tier 2 mechanism effectively graduates into Tier 1 territory

This doesn't fix item 6 (belief-mapping at mid-conversation user pushback) because that trigger isn't phase-bounded. But it *does* partially fix item 5 (AID cycle at every gate) because the gate IS phase-bounded, and a gate that produces a written reflection artifact is hook-enforceable.

**The three tiers to name in the essay:**

| Tier | What's enforced | Example |
|---|---|---|
| **Skill-text layer** (weakest) | Prose instructions the agent voluntarily reads | Current AID cycle instructions |
| **Harness layer** (hooks) | Artifact-existence checks, phase-boundary verifications | S1+S2 recommendation |
| **User-tooling layer** (new) | Enforced structural moments that put scaffolding in the user's hands for judgment the agent can't make | Gate-time question-generation skill producing a reflection artifact |

**Broader model-layer question explicitly out of scope:** the user noted they plan to investigate operationalizing the Claude plugin more abstractly in a future cycle, potentially involving alternate models or cross-model orchestration. Noted as future work, not addressed here.

#### Refinement 4: The three-state framing holds both streams, with a pragmatic-epistemological closing stance

The State A / B / C framing captures the user's earlier value-frame pushback precisely:

| State | What happens | Stream 1 impact (real thing built) | Stream 2 impact (understanding) |
|---|---|---|---|
| **A — fired and effective** | Dispatched subagent ran in isolated context, produced real external review | Thing is audited | User learns from external audit |
| **B — didn't fire, visibly** | No dispatch, no artifact, absence is visible | Recoverable | Search for missing thing stays alive |
| **C — fired-but-fake** | Silent dispatch failure, orchestrator produces audit-shaped output in-context | NOT audited, looks like it was | False confidence, search foreclosed |

**State C is worst for both streams simultaneously.** Stream 1 says State C is bad because the thing wasn't really built. Stream 2 says State C is bad because the user is deceived about their own learning. Both converge on "silent intermittent failure (State C) is worse than total failure (State B)." This is the refined form of the lit review's "intermittent failure is worse than total failure" claim: it's *silent* intermittency that's dangerous, not intermittency per se.

**The essay's honest claim:** the recommended hook architecture pushes the sophisticated-State-C case from "trivially produced under task immersion" to "requires active, structure-aware effort while the compound check is not yet wired." It does not prove State A. It materially raises the cost of undetected State C, which is the worst case for both streams. The complete defense requires the compound check (S1's PostToolUse dispatch log + S2's Stop manifest check) and, aspirationally, artifact provenance frontmatter — both of which are production implementation work beyond this cycle.

**User's exact framing for the essay's closing epistemic stance:** *"One that I don't think we can 100% prove has worked but hopefully enough that both the agent and user can 'know it when they see it' in context."*

This is the right stance to close on. It:
- Doesn't overclaim (doesn't assert proof of State A)
- Doesn't underclaim (doesn't throw up its hands)
- Preserves human judgment as load-bearing in final evaluation
- Treats structural enforcement as scaffold that makes judgment possible
- Aligns with the *Grounding Reframe* move already in the orchestrator: when certainty isn't available, name the limits and make observable conditions visible, then trust contextual judgment.

**"Know it when they see it"** isn't a retreat — it's a pragmatic-epistemological stance that acknowledges the limits of verification while committing to the observable conditions that make contextual judgment possible. The essay should land here.

#### Refinement 5: Don't rework v0.6.1–v0.6.3 patches

User's decision: *"Those were my real-time reactions to trying our framework, so that's where we veered into a new cycle here."* The essay should acknowledge the patches were real-time mitigations that the cycle's diagnostic now explains as treating-the-symptom (skill-text hardening that the lit review and S4 show is structurally insufficient), but should not argue for unwinding them. Move forward with the structural fix, note the patches as stopgaps, don't dwell.

#### Refinement 6: Scope is intentionally research / discover / model

User's framing: *"The optionality and selection mechanisms in the early phases that drive the problems down the road."* Early phases have more orchestrator judgment and therefore more of the problem; later phases have their own QA ecosystems (build has TDD, refactor, review; play has interaction specs; synthesize has the outline audit). The research-phase-centricity of Cycle 10 is intentional, not a scope gap.

**Essay framing:** Cycle 10's recommendations target the high-gradient phases where optionality creates the conditions the lit review says produce failure. Later phases inherit the benefit but are not the primary target. Extending the hook+manifest architecture to build/play/synthesize is an open question for a follow-up cycle, specifically because those phases have their own reliability structures the manifest would need to compose with.

This is not a cycle that spreads thin across the full pipeline. It lands on the sycophancy-gradient phases where the leverage is highest.

#### Reflection pass status

All six points addressed. All refinements captured. Ready for essay drafting.

#### Caveat (the spike-runner is explicit about this)

The corpus is from one user across one project. It is not a sample from a population. The base rates conflate three things: methodology reliability, user discipline, and orchestrating-agent behavior under task immersion. The numbers are valid as evidence about how the methodology actually plays out *in this practice*, not as a generalizable population claim. But for the cycle's purposes, that's the relevant evidence — the failures Cycle 10 investigates are exactly the kind that show up in actual workflows.
