# Spike S1: Claude Code Hook Feasibility for Cycle 9 Tier 1 Mechanisms
*2026-04-06*

## Spike Question

Can Claude Code hooks enforce Cycle 9 Tier 1 mechanisms? Specifically: can a PostToolUse hook on the Task tool verify that subagent-dispatched artifacts exist at expected output paths and inject failure signals into the conversation when they don't, in a way that does not depend on the agent's voluntary attention?

## Method

Read Spike S4 findings, the lit review on telemetry and acceptance criteria, ADR-033 (the project's prior cross-cutting hooks ADR), and a representative sample of Cycle 9 ADRs (especially ADR-058 on the Tier 1 floor, ADR-060 on the research-methods subagent, and ADR-062 on the rejected assertion-detection hook). Examined the existing production hook scripts in `hooks/scripts/` (`epistemic-gate.sh`, `invariant-reminder.sh`, `orientation-trigger.sh`) as real working examples of how this project currently uses hooks. Fetched the official Claude Code hooks documentation at `https://code.claude.com/docs/en/hooks` (accessed 2026-04-06, redirected from `https://docs.claude.com/en/docs/claude-code/hooks`) and the Agent SDK hooks guide at `https://platform.claude.com/docs/en/agent-sdk/hooks` (accessed 2026-04-06). Read the TypeScript SDK reference for the Agent tool's `tool_input` and `tool_response` schemas. Wrote a small illustrative PostToolUse hook script in scratch and simulated it against a synthetic JSON payload to verify shape; scratch directory deleted.

## Hook Capability Surface

Claude Code exposes an unexpectedly large set of hook events. The ones load-bearing for this spike are `PreToolUse`, `PostToolUse`, `PostToolUseFailure`, `SubagentStop`, and `Stop`. The full event set (from the docs, 2026-04-06) also includes `SessionStart`, `UserPromptSubmit`, `PermissionRequest`, `PermissionDenied`, `Notification`, `SubagentStart`, `TaskCreated`, `TaskCompleted`, `TeammateIdle`, `StopFailure`, `CwdChanged`, `FileChanged`, `ConfigChange`, `PreCompact`, `PostCompact`, `Elicitation`, `ElicitationResult`, `WorktreeCreate`, `WorktreeRemove`, and `SessionEnd`. Not all are useful here.

| Event | Triggers on | Input includes | Blocks? | Injects context? | Context visible to |
|---|---|---|---|---|---|
| `PreToolUse` | Tool params created, before execution | `tool_name`, `tool_input`, `session_id`, `cwd` | Yes — `permissionDecision: "deny"` stops the tool call | Yes — `systemMessage` (top-level) and `additionalContext` (hook-specific) | Model |
| `PostToolUse` | Tool succeeds | `tool_name`, `tool_input`, `tool_response`, `tool_use_id` | No — tool already ran. `decision: "block"` prompts the model with the `reason` but does not prevent forward progress | Yes — `additionalContext` and `reason` | Model |
| `PostToolUseFailure` | Tool execution fails (Bash non-zero, etc.) | `tool_name`, `tool_input`, `error`, `tool_use_id` | No | Yes — `additionalContext` | Model |
| `SubagentStop` | Subagent completes its response | `agent_id`, `agent_type`, `agent_transcript_path`, `last_assistant_message` | Yes — exit 2 prevents the subagent from finishing | No direct context injection | — |
| `Stop` | Parent agent finishes responding | Session metadata only | Yes — `decision: "block"` with `reason` prevents stopping and forces the agent to continue with the reason injected into context | Yes — `reason` and `additionalContext` | Model |
| `UserPromptSubmit` | User submits prompt, before processing | `prompt` string | Yes — exit 2 erases prompt; `decision: "block"` with reason | Yes — stdout added as context | Model |
| `SessionStart` | Session begins/resumes/cleared/compacted | `source`, `model` | No | Yes — stdout and `additionalContext` added as context | Model |

**Critical precision points from the documentation, verified verbatim:**

1. **The Task tool's hook `tool_name` is `Agent`** (with `Task` as a legacy alias). The SDK reference's `AgentInput` type is:
   ```typescript
   type AgentInput = {
     description: string;
     prompt: string;
     subagent_type: string;
     model?: "sonnet" | "opus" | "haiku";
     resume?: string;
     run_in_background?: boolean;
   };
   ```
   There is **no explicit `output_path` field**. The output path is embedded in the natural-language `prompt` string.

2. **`AgentOutput` on PostToolUse for a synchronous completion** returns `status: "completed"`, `agentId`, a `content` array of text blocks (the subagent's final message), tool use counts, duration, and token usage. It does **not** include an explicit `output_file` field on synchronous completion. (There is an `async_launched` status that includes `outputFile`, used for background execution, but Tier 1 dispatches currently run synchronously.)

3. **PostToolUse `decision: "block"`** does not halt the agent. Quoting the docs verbatim: *"`"block"` prompts Claude with the `reason`. Omit to allow the action to proceed."* The tool has already executed; `block` injects the reason into the next turn as model-visible context. This is a **strong reminder-injection**, not a structural halt.

4. **Stop hook `decision: "block"`** genuinely prevents stopping: *"Prevents Claude from stopping, continues the conversation."* Reason and `additionalContext` are injected and the agent must keep going. This is structural, not advisory.

5. **PreToolUse `permissionDecision: "deny"`** structurally prevents the tool call from executing at all, with reason shown to the model.

6. **The `reason` / injected context is visible to the model, not the user.** The docs are explicit: on `deny`/`block`, the reason is shown to Claude; for allow/ask the reason is shown to the user. This matters: a hook cannot bypass the agent to reach the user directly. Any user-visible failure signal still has to be surfaced by the agent in its next turn. The harness can make the signal unavoidable in the agent's context but cannot make it unavoidable to the user.

7. **Hook scripts run synchronously by default** (agent waits for them) unless the hook declares `async: true`, in which case the hook runs in the background and cannot influence agent behavior. For enforcement, sync is required.

8. **Configuration locations** are layered: `~/.claude/settings.json` (user-global), `.claude/settings.json` (project, checked in), `.claude/settings.local.json` (project, not checked in), managed policy (org-wide), **plugin `hooks/hooks.json`** (this project's mechanism — hooks ship with the RDD plugin), and skill/agent YAML frontmatter (but the docs note plugin-provided agents cannot define their own hooks, which is consistent with ADR-033).

9. **Matchers are regex** against the tool name (for tool events) or the event's relevant filter field. Additional filtering uses the `if` field with permission-rule syntax (e.g., `"Bash(git *)"`).

10. **JSON output capped at 10,000 characters.** Not a practical constraint for the injection signals this spike cares about, but relevant for larger manifest checks.

## ADR-033 Prior Art

ADR-033 ("Cross-Cutting Hooks at Plugin Level") was the project's first commitment to hooks as an enforcement layer. It established five hooks in `hooks/hooks.json`:

| Hook | Event | Matcher | Purpose |
|---|---|---|---|
| Invariant reminder | `PreToolUse` | `Write|Edit` on `docs/` | Remind agent to check domain-model invariants before modifying artifacts |
| Epistemic gate enforcer | `Stop` | — | Remind about epistemic gate before stopping |
| Skill activator | `UserPromptSubmit` | — | Match RDD-related prompts, suggest phase skill |
| Orientation trigger | `PostToolUse` | `Write` on key artifacts | Remind to dispatch the orientation-writer subagent |
| Document sizing check | `PostToolUse` | `Write` on `docs/` | Flag documents exceeding sizing heuristics |

Inspection of the actual scripts (`hooks/scripts/epistemic-gate.sh`, `invariant-reminder.sh`, `orientation-trigger.sh`) shows the existing pattern very clearly: each script reads the hook input, grep-matches for a condition, and emits a plain-text `REMINDER:` line on stdout. None of them use `decision: "block"`. None of them attempt to verify artifact existence on disk. They are all passive nudges — written as *reminders*, not *enforcement*.

The key architectural note in ADR-033 is in its Consequences, and it is precisely the observation this spike is now updating:

> The epistemic gate enforcer uses reminder injection rather than blocking... blocking a Stop event would prevent the agent from completing at all — the desired behavior is to resume the phase with a gate reminder, not to prevent completion indefinitely. This is a design choice, not a capability limit.

ADR-033 explicitly acknowledged, at the time, that the hook layer *could* block but chose not to, because the phase-completion model wasn't yet load-bearing enough to justify the stronger mechanism. Cycle 9 changed that calculus by elevating specific mechanisms to Tier 1 (ADR-058) — unconditional, not subject to agent relaxation. ADR-033's five hooks do not cover any of the Cycle 9 Tier 1 mechanisms because those mechanisms did not exist when ADR-033 was written. Crucially, ADR-062 (2026 assertion-detection) explicitly *rejected* adding a sixth hook, moving assertion detection back into AID inline observation. That rejection was about *semantic* detection (confident-assertion pattern-matching doesn't work), not about the hook layer being inappropriate for structural enforcement in general. The door is still open for structural (artifact-existence) hooks; ADR-062 closed it only for semantic hooks. **The Cycle 9 gap is not that hooks were tried and failed for Tier 1 mechanisms — it is that the hooks for Tier 1 mechanisms were simply never written.**

One practical observation from reading the existing scripts: the project already uses `$INPUT` with `grep` for matching. This is fragile (a brittle text scan of a JSON payload). A production version of the Tier 1 hooks should prefer `jq` over grep for field extraction from the JSON input, matching the shape of the existing `.claude/` ecosystem.

## Per-Mechanism Feasibility Analysis

### 1. research-methods-reviewer dispatch

**Trigger:** Before the first research loop; after substantial essay revision, before the next research loop. ADR-060, Tier 1.
**Expected artifact:** `./docs/essays/audits/research-design-review-NNN.md`.
**Dispatched via:** Task tool, `subagent_type: "research-methods-reviewer"`.

**Hook event candidate:** `PostToolUse` with matcher `Agent`, filtered in-script on `subagent_type`.

**Implementation sketch:**
1. On every `PostToolUse` where `tool_name == "Agent"` and `tool_input.subagent_type == "research-methods-reviewer"`, extract the expected output path from `tool_input.prompt` (a grep or regex for `./docs/essays/audits/research-design-review-*.md`).
2. `test -f` the path.
3. If missing, return JSON with `decision: "block"`, a `reason` instructing the model not to proceed with in-context fallback, and `hookSpecificOutput.additionalContext` naming the missing path explicitly.
4. Optionally also verify structural properties of the file (non-empty; contains the expected section headings) — this is a bonus, not load-bearing.

**Feasibility verdict: Yes.** The dispatch is via the Task tool, the event boundary exists (`PostToolUse` on `Agent`), the check is a `test -f`, and the injection mechanism is documented. The PostToolUse `block` does not structurally halt the agent (the tool already ran), but it forces the failure signal into the agent's next-turn context in a way that cannot be avoided by task-immersion, because it is injected by the harness and not produced by the agent's own voluntary attention.

**Confidence softspot:** path extraction from a natural-language prompt. The Tier 1 dispatch prompts currently include output paths in conventional form, but the extraction is regex-dependent. A robust implementation requires tightening the skill-text convention: every Tier 1 dispatch prompt must contain exactly one output path token matching a fixed pattern. The spike did not verify that current dispatch prompts reliably follow such a pattern; this needs to be audited as part of S2 acceptance criteria work, and/or skill text needs to be updated to guarantee the convention.

### 2. citation-auditor dispatch

**Trigger:** After the essay is written, before the epistemic gate. Tier 1.
**Expected artifact:** `./docs/essays/audits/citation-audit-NNN.md`.
**Dispatched via:** Task tool, `subagent_type: "citation-auditor"`.

**Hook event candidate:** `PostToolUse` with matcher `Agent`, filtered in-script on `subagent_type`. Identical architecture to item 1.

**Feasibility verdict: Yes.** Same mechanism. Same path-extraction softspot.

### 3. argument-auditor dispatch (research and decide)

**Trigger:** After citation audit passes in research. After ADRs written in decide. Both require mandatory re-audit after any revision. Tier 1.
**Expected artifact:** `./docs/essays/audits/argument-audit-NNN.md` (research) or `./docs/decisions/audits/argument-audit-NNN.md` (decide).
**Dispatched via:** Task tool, `subagent_type: "argument-auditor"`.

**Hook event candidate:** `PostToolUse` with matcher `Agent`. Same architecture.

**Feasibility verdict: Yes.** The mandatory re-audit obligation is a separate conformance question (did the auditor fire *again* after revision?) which PostToolUse-on-Agent alone cannot verify in isolation — it needs session-level state, because "was a revision made?" is only visible by comparing file state across the session. But the primary dispatch (did the auditor fire at all, did the artifact appear) is fully hook-checkable. The mandatory-re-audit aspect requires either a Stop hook at phase-end that checks a manifest, or state tracking between PostToolUse events — which is harder but not impossible (the `session_id` is available in every hook input).

### 4. susceptibility-snapshot-evaluator dispatch

**Trigger:** Every phase boundary. ADR-057, Tier 1.
**Expected artifact:** Susceptibility Snapshot file (path varies per phase).
**Dispatched via:** Task tool, `subagent_type: "susceptibility-snapshot-evaluator"`.

**The trigger problem.** A phase boundary in the RDD orchestrator is not a tool call. It is a conversational event: "I am finished with research, moving to discover." PostToolUse on `Agent` only fires when the Task tool is *actually called*. The failure mode being defended against is exactly that the Task tool is *never called* at the phase boundary. So PostToolUse-on-Agent cannot, on its own, enforce this mechanism — it can only verify dispatches that were attempted.

**Hook event candidates:**

- **Stop hook with phase-state inference.** When the agent stops, inspect recent transcript / file-system state to determine whether a phase boundary was just crossed, and whether a susceptibility snapshot artifact was produced since the last snapshot. If a phase boundary was crossed without a new snapshot, return `decision: "block"` — which genuinely prevents stopping and forces the agent to continue. This is the strongest available enforcement for item 4 and is broadly a watchdog/dead-man-switch in exactly the Fowler sense: the snapshot file is the "pet the watchdog" signal; its absence during a stop-at-phase-boundary is the alert condition.

- **PostToolUse on a phase-marker tool.** If phase transitions are marked by a specific `Edit` or `Write` to `docs/cycle-status.md` (which they appear to be in this project), a `PostToolUse` matcher on `Edit|Write` plus an in-script check that the target path is `cycle-status.md` and the content indicates a phase transition could fire a snapshot-missing check at the moment of the transition. This is the AOP-style join point approach — it weaves the check into the structural operation that *is* the phase boundary.

- **FileChanged hook on cycle-status.md.** Purer watchdog form. The hook fires independently of whether the agent chose to interact with it, as long as the file is in its watched set. Useful if phase boundaries are ever marked by tools outside the agent's direct `Edit`/`Write` calls.

**Feasibility verdict: Partial — feasible but architecturally more demanding.** The enforcement exists but requires the project to commit to one of two structural anchors: (a) phase boundaries must be observable via a structural trace (a write to `cycle-status.md` at the moment of phase transition — this is already the convention), or (b) the Stop hook must do phase-state inference from transcript and file-system context. Option (a) is cheaper and cleaner and aligns with how ADR-033's `orientation-trigger.sh` already uses PostToolUse-on-Write as a structural hinge. The artifact expected for the snapshot does not have a fixed file name in the current spec, which is a second softspot — either the snapshot path needs to be fixed per phase, or the hook needs a "latest snapshot in directory X newer than last phase transition" check.

**Honest gap:** if the agent declares a phase transition in prose ("okay, moving to discover") without touching `cycle-status.md` and without dispatching the snapshot, *no hook event fires at that moment*. The Stop hook is the only backstop, and it fires only if and when the agent actually stops — which may be after the phase transition has already been acted on silently. The phase-marker PostToolUse covers the *explicit* structural transition; the Stop hook covers the *implicit* case at a delay. Neither is perfect. This is the first place the spike finds the hook layer genuinely constrained rather than just awkward.

### 5. AID cycle (Attend-Interpret-Decide) at every gate

**Trigger:** Between phases. The AID cycle is a conversational protocol (ADR-040) the agent runs inline at every gate.
**Expected artifact:** None — it is a conversational protocol. No file is produced.
**Dispatched via:** Not dispatched. The orchestrating agent executes it in its own context.

**Feasibility verdict: No.** There is no tool call. There is no file artifact. There is no structural trace that an AID cycle was performed. The only observables are in the conversation text itself, and the only hook with access to the conversation text on agent turns is implicitly the `Stop` hook (which sees `transcript_path`) or the `PostToolUse` hook (which sees `tool_response` text for the specific tool that just ran). A hook *could* grep the transcript for AID markers ("Attend:", "Interpret:", "Decide:") but this collapses immediately into the same failure mode as ADR-062's rejected assertion-detection hook: lexical pattern matching on natural language gives over-inclusive and under-inclusive results and can be trivially subverted by paraphrase.

Moreover — and this is the load-bearing point — even a successful lexical match would only verify that the agent *claimed* to run AID, not that AID was actually performed. The same executor that is supposed to run AID is the same executor that would generate the lexical markers under task immersion. There is no Architectural Isolation. The Dapper transparency principle fails because there is no transport layer to instrument — the "call" is entirely in the agent's own generated text.

This is outside the reach of hook-based enforcement entirely. It is the category Geng et al. (2025) predict cannot be fixed at the harness layer without model-level changes.

### 6. Belief-mapping at user pushback

**Trigger:** When a user pushes back against a documented constraint (prior research, threat model, ADR, domain invariant).
**Expected artifact:** None — it is a conversational move.
**Dispatched via:** Not dispatched. The agent is supposed to notice and perform belief-mapping in-context.

**Feasibility verdict: No.** Same analysis as item 5, compounded. The trigger is a natural-language pattern ("user pushes back") which has no structural trace. It is a *semantic* condition on user input, which is exactly what ADR-062 rejected a UserPromptSubmit hook for, for exactly the reasons that apply here: over-inclusive on benign confidence markers, under-inclusive on sophisticated pushback that does not present as pushback. Even if detection worked, the belief-mapping *response* is itself in-context prose with no verifiable artifact.

This mechanism is not hook-addressable at all. Marking it so plainly is a finding of the spike, not a defeat of it — it tells the cycle that Tier 2 conversational mechanisms are structurally outside the reach of hook enforcement, and the methodology's reliability claims for Tier 2 must be justified on other grounds (calibration by Tier 1 backstops, mostly, which is exactly what ADR-058 says).

## Feasibility Matrix

| # | Mechanism | Hook event | Verdict | Dapper compliance | Watchdog compliance | AOP compliance | Implementation cost |
|---|---|---|---|---|---|---|---|
| 1 | research-methods-reviewer | `PostToolUse` (`Agent`) | **Yes** | Partial — instruments the dispatch result, not the decision to dispatch | Yes (checks for artifact file) | Partial — weaves at the tool-call join point, not at the method-boundary join point | Low: ~40 lines of bash + `jq` |
| 2 | citation-auditor | `PostToolUse` (`Agent`) | **Yes** | Same as #1 | Yes | Same as #1 | Low |
| 3 | argument-auditor (research & decide) | `PostToolUse` (`Agent`) + session state for re-audit | **Yes** (primary) / **Partial** (mandatory re-audit tracking) | Same as #1; re-audit needs session-level state | Yes for primary; session-tracked for re-audit | Same | Low to medium |
| 4 | susceptibility-snapshot-evaluator | `Stop` + `PostToolUse` on cycle-status.md writes | **Partial** | Low — the harness only sees the snapshot obligation if a structural trace of phase transition is present; silent mid-turn phase transitions are invisible | High at stop-time, medium at phase-marker-time | Medium — leans on the cycle-status.md convention as the join point | Medium: requires a phase-aware manifest |
| 5 | AID cycle at every gate | — | **No** | No — no transport layer to instrument | No — no affirmative signal file | No — no structural join point | N/A |
| 6 | Belief-mapping at user pushback | — | **No** | No | No | No | N/A |

## Honest Evaluation Against the Lit Review

The lit review prescribes three design principles: Dapper transparency (instrument the transport, not voluntary reporting), watchdog/dead-man-switch (require affirmative signaling, alert on absence), and AOP weaving (cross-cutting concerns woven at framework join points). Evaluating the hook layer against each:

**Dapper transparency.** Partial, with a sharp boundary. The PostToolUse-on-`Agent` hook instruments the Task tool call as a transport event — every successful dispatch, failed dispatch, and permission-denied dispatch generates a hook event. This satisfies Dapper at the level of "every attempted dispatch is observable by the harness." But it does *not* satisfy Dapper at the level of "every required dispatch is observable by the harness," because the hook only fires when the agent decides to invoke the tool. If the agent silently fails to invoke the tool at all — the exact Cycle 9 failure pattern — no PostToolUse-on-`Agent` event fires. The Dapper transparency principle distinguishes between "make the call layer observable" (which the hook does) and "make the absence of a call observable" (which it does not). The lit review's exact phrasing — *"what was supposed to happen but didn't is invisible to tools that only trace what did happen"* — applies to PostToolUse-on-Agent. The Stop hook with a phase manifest approaches the second property but still only fires at stop-time, not at the moment of omission.

**Watchdog / dead-man-switch.** Strong for items 1–3 and partial for item 4. The watchdog pattern wants an affirmative signal on the "happy path" and an alarm on its absence. The PostToolUse `test -f` check is exactly the watchdog reset condition: the artifact file is the heartbeat; its absence is the alarm. The inversion from "fire on failure" to "fire on absence of success" is what makes this better than text hardening — the hook is checking the positive signal, not waiting for a negative one. Item 4's `Stop` hook variant is the purest watchdog form: the session cannot end without the expected snapshot file, and the absence of the file prevents the stop. This is architecturally identical to a hardware watchdog timer preventing the CPU from entering idle until the kernel has acknowledged the last tick.

**AOP weaving.** Partial. AOP weaves cross-cutting concerns at framework-level join points *without module cooperation*. The Claude Code hook system is explicitly an AOP-style weaving mechanism — matchers are pointcuts, hook scripts are advice, and the harness performs the weaving. This is genuinely analogous to classical AOP. The limitation is which join points are exposed. Tool-call boundaries are exposed (every tool call is a join point). Phase boundaries in the methodological sense are not exposed — the methodology's phases are a higher-level abstraction the harness does not know about. For AOP to weave at the phase boundary, the phase boundary must be made structurally visible at a level the harness can see. Currently, the closest structural anchor is `docs/cycle-status.md` edits, which is a conventional — not enforced — anchor. The AOP principle is satisfiable only to the extent the methodology commits to structural phase markers.

**The honest headline.** Hooks satisfy Dapper at the call layer, watchdog at the artifact layer, and AOP at the tool-boundary layer. They do not satisfy any of the three principles at the "phase boundary without a tool call" or "conversational event" layers — which is exactly the boundary where items 4 (partially), 5, and 6 live. The hook layer is strictly stronger than the text layer but strictly weaker than a true framework-level enforcement layer that could enforce at arbitrary join points.

**One further precision on enforcement vs detection.** PostToolUse `decision: "block"` does not actually halt the agent — the tool has already run; block injects the reason into the model's next-turn context as a strong reminder. Stop hook `decision: "block"` does genuinely halt stopping and forces continuation. This matters: for items 1–3, the hook cannot *prevent* the agent from continuing past a missing artifact; it can only *make it structurally impossible for the agent to continue without first being told* that the artifact is missing. The enforcement step — whether to honor the injected reason — is still voluntary. But the *detection* step is now harness-structural, not executor-voluntary, and the injected reason is unavoidably present in the agent's context. This is a dramatic improvement over text-level hardening (where even detection is executor-voluntary) but it is not full hard enforcement. The cycle's essay should be precise about this: hooks move detection out of the agent's voluntary attention space while leaving the enforcement step within it, and that is a smaller move than "hooks solve it" but a much larger move than text hardening can claim.

## Conclusions

### Which mechanisms are hook-enforceable

- **Items 1, 2, 3 (research-methods-reviewer, citation-auditor, argument-auditor in both skills).** PostToolUse on the `Agent` tool, matched on `subagent_type`, with artifact-existence verification and `decision: "block"` injection on failure. This is the single highest-leverage hook addition the project can make. The pattern is identical for all three and can be parameterized by subagent_type and expected path pattern. Session-level state tracking (simple session_id-keyed JSON file in `$CLAUDE_PLUGIN_DATA`) enables the mandatory-re-audit requirement for item 3.

- **Item 4 (susceptibility-snapshot-evaluator), partially.** A combination of PostToolUse on Write/Edit of `cycle-status.md` (for explicit phase transitions) and Stop hook with a phase manifest (for implicit ones). The Stop hook is the stronger enforcement because it can actually prevent the session from ending. The PostToolUse anchor is earlier but requires the methodology to commit to `cycle-status.md` as the phase-boundary structural marker.

### Which require more invasive restructuring

- **Item 4's "phase transition without a tool call" case.** To close the hole fully, phase transitions must become structural events the harness can observe — either by making `cycle-status.md` updates a hard precondition of phase advancement (so the write is forced before any other work), or by wrapping phase transitions in an explicit orchestrator tool call the hook can match on. Both are harness-structural changes, not hook additions.

- **Item 3's mandatory re-audit tracking.** Technically feasible inside the PostToolUse hook via session state, but more robust if re-audit is implemented as a phase-manifest item in the Stop hook. That requires defining per-phase artifact manifests — which is exactly what Spike S2 on acceptance criteria should produce.

### Which are not addressable at the harness layer at all

- **Item 5 (AID cycle).** No transport layer, no structural trace, no artifact. The mechanism lives entirely in the agent's conversational output. Hook-based enforcement cannot reach it. Per Geng et al. (2025), this is a Type 2 failure (the agent under task immersion cannot reliably meta-attend to its own protocol state), and the lit review is clear that Type 2 failures are the ones hook-style external instrumentation cannot fix. The mechanism must be defended at a different layer — either by Tier 1 structural backstops that catch what AID missed (which is what ADR-058 already says), or by model-level training (outside this project's scope).

- **Item 6 (belief-mapping at user pushback).** Same category as item 5, and for the specific reason ADR-062 already identified when it rejected the assertion-detection hook: the trigger is a semantic pattern in natural language that lexical matching cannot reliably detect, and even if it could, the response is a conversational move with no verifiable artifact. Not addressable.

## Implications for Cycle 10

### The cycle's design recommendation

The cycle's essay should recommend adopting **Option 1 (PostToolUse-on-`Agent` hook with artifact verification)** as the primary Tier 1 enforcement mechanism, extended by **Option 2 (Stop hook with a phase manifest)** for items requiring phase-boundary awareness. Option 3 (restructure dispatch as a harness operation) is *not* recommended because the cheaper options cover the load-bearing cases, and Option 3's invasiveness exceeds the benefit for items 1–3 (which Option 1 fully handles).

Concretely, the cycle should commission:

1. **A sixth hook in `hooks/hooks.json`**: PostToolUse on matcher `Agent`, delegating to a script at `hooks/scripts/tier1-dispatch-verifier.sh`. The script reads the hook input, filters on `tool_input.subagent_type` against a table of Tier 1 specialists, extracts the expected output path from `tool_input.prompt` via a conventional regex, verifies file existence, and on missing-artifact emits the `decision: "block"` JSON with a model-visible reason and additional context. This covers items 1, 2, 3 primary cases.

2. **A strengthened Stop hook** replacing the current `epistemic-gate.sh` with a phase-aware variant that consults a per-phase artifact manifest. Per-phase expected artifacts: research requires `research-design-review-*.md`, `citation-audit-*.md`, and `argument-audit-*.md`; decide requires `argument-audit-*.md`; every phase transition requires a susceptibility snapshot artifact newer than the previous phase transition. On missing artifacts, the hook returns `decision: "block"` with reason, which forces the agent to continue rather than stop. This covers items 1–4 as a backstop and item 4 as its primary enforcement.

3. **A skill-text convention tightening**, not a weakening of the hook argument: every Tier 1 dispatch prompt must contain the expected output path in a canonical form the hook can parse (e.g., a line beginning with `Output path:` or a fenced path). This is the one place the skill layer remains load-bearing, and its role is to make the prompt machine-parseable for the hook — not to ask the agent to remember to verify the output itself.

4. **A Spike S2 scope anchor**: the Tier 1 acceptance criteria should be expressed as a per-phase manifest that the Stop hook can check directly. This makes S2 and S1 explicitly complementary — S2 defines the manifest shape, S1's hook consumes it.

### What the recommendation does NOT solve

The essay must be honest about three things it does not solve:

1. **Items 5 and 6 remain unsolved.** No amount of hook engineering reaches the AID cycle or the belief-mapping-at-pushback move. These are Geng et al. Type 2 failures and must be addressed (to the extent they can be) at other layers — Tier 1 backstops that catch their consequences, not their occurrences.

2. **PostToolUse `block` is a strong reminder, not a hard halt.** For items 1–3, the injected failure signal is unavoidable in the agent's next-turn context, but the agent can still voluntarily ignore it. The Stop hook (for items where applicable) is genuinely hard-halting; PostToolUse is not. The cycle's essay should distinguish "detection is harness-structural" from "enforcement is harness-structural" and claim only the former for PostToolUse-based mechanisms.

3. **Phase transitions without a cycle-status.md write remain invisible.** If the agent narrates a phase transition in prose without touching the structural marker, the hook system cannot see the moment of transition. The Stop hook catches this at a delay. Closing the gap fully requires either tightening the orchestrator so phase transitions are always preceded by a structural operation, or accepting the delay. The cycle should explicitly accept the delay — the Stop hook's latency is bounded by one stop cycle and the cost of closing it further exceeds the residual risk.

### Methodology graduation

Spike S4 framed this as a methodology graduation point: "from well-written instructions in skill files to well-written instructions plus a harness layer that enforces the load-bearing parts externally." S1 confirms that this graduation is implementable for items 1–4 and formally out of reach for items 5–6. The graduation is real, not rhetorical: the project has been enforcing its Tier 1 mechanisms at the executor-voluntary layer and is about to move the load-bearing cases to the harness layer.

The graduation should be named explicitly in the essay because it changes what the skill-text layer is *for*. Before: skill text carries the reliability claim ("the agent will dispatch the auditor because the skill says to"). After: skill text and the hook layer jointly carry the reliability claim, with the skill text handling *what to do* and the hook layer handling *verification that it was done*. This is exactly the Design by Contract pattern (Meyer) mapped onto agentic methodology: specifications are the skill text, runtime verification is the hook layer, and the pairing is structural — the specification is meaningful only because the verification is automatic. It is also exactly the AOP pattern (Kiczales et al., ECOOP 1997) applied to a new target: protocol compliance as a cross-cutting concern, woven at framework-level join points, without requiring the agent to remember to call the verification.

Naming the graduation matters because it forecloses a regression the essay should explicitly reject: "just write better instructions." Spike S4 established that this is a structural dead end. S1 establishes that an implementable alternative exists for the mechanisms the instructions cannot carry. The cycle's recommendation is not that the skill text is wrong — it is that the reliability claim was never the skill text's to make alone.
