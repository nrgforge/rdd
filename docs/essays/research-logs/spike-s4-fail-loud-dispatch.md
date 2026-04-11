# Spike S4: Dispatch-Level Fail-Loud Instrumentation
*2026-04-07*

## Spike Question

Can a targeted text-level change to subagent dispatch instructions in skill text harden the dispatch pattern against silent fallback to in-context execution?

## Method

Read the two prior Cycle 10 lit reviews. Read the actual dispatch-site text in `research/SKILL.md`, `decide/SKILL.md`, and `rdd/SKILL.md` (v0.6.3). Inventoried five Tier 1 dispatch sites verbatim. Analyzed what each instructs about failure handling and artifact verification, located its position in the enclosing file, proposed specific text-level hardening, and evaluated the proposal honestly against the lit review's findings. Analytical only; no code. Scratch directory deleted.

## Inventory of Current Dispatch Instructions

### Site 1: research-methods-reviewer (`research/SKILL.md`, Step 1b, lines 57–68)

**Current text (verbatim):**
> Before executing the first research loop, dispatch the **research-methods-reviewer** specialist subagent. Provide it with:
> - The research question set (the questions from Step 1)
> - Prior research context (existing essays or research logs from prior cycles, if available)
> - An output path for the review artifact (e.g., `./docs/housekeeping/audits/research-design-review-NNN.md`)
>
> The agent reviews each question for embedded conclusions, applies belief-mapping […], and flags premature narrowing in the question set.
>
> After the agent completes, read the review:
> - **Flagged questions** — present reformulations to the user. […]
> - **Premature narrowing** — surface the concern. […]
>
> This is a Tier 1 unconditional mechanism — it fires before every research phase. After any substantial essay revision […], dispatch the research-methods-reviewer again before the next research loop.

**Failure handling:** None. Zero clauses about dispatch failure.
**Artifact verification:** None. "After the agent completes, read the review" presupposes existence.
**Position:** ~1/4 through a ~280-line file — in the "lost in the middle" zone (Liu et al. 2023).

### Site 2: citation-auditor (`research/SKILL.md`, Step 4a, lines 151–164)

**Current text (verbatim):**
> After the essay is written, dispatch the **citation-auditor** specialist subagent. Provide it with:
> - The essay file path
> - The research log file path (as evidence trail)
> - An output path for the audit report […]
>
> The agent runs on Sonnet in an isolated context, reads the input files, verifies all references and factual claims, and writes a structured audit report to the output path.
>
> After the agent completes, read the audit report:
> - **P1 issues** — correct or remove the problematic references immediately
> - **P2 issues** — note for the epistemic gate discussion
> - **P3 issues** — note for completeness
>
> The essay is the foundation for all downstream phases — bad citations here propagate through the entire pipeline.

**Failure handling:** None.
**Artifact verification:** None — report is assumed to exist.
**Position:** Roughly middle of file. Worst position for serial-position attention.

### Site 3: argument-auditor with framing audit (`research/SKILL.md`, Step 4b, lines 167–195)

**Current text (key passage):**
> After citation audit passes, dispatch the **argument-auditor** specialist subagent. Provide it with:
> - The essay file path (primary document)
> - The research log file path (source material […])
> - An output path for the audit report […]
>
> The agent runs on Sonnet in an isolated context and produces a **two-section** audit report […]
>
> **Re-audit after revision is mandatory, not optional.** Any revision of the essay made in response to audit findings […] triggers a fresh argument auditor dispatch on the revised essay before the pipeline advances.

**Failure handling:** None. The "mandatory, not optional" language is about *whether to dispatch*, not about *whether the dispatch succeeded*.
**Artifact verification:** None.
**Position:** Late-middle. Most carefully framed of the sites but still buried in prose.

### Site 4: argument-auditor (`decide/SKILL.md`, Step 3, lines 84–106)

**Current text (key passage):**
> After ADRs are written, dispatch the **argument-auditor** specialist subagent. […]
>
> **Re-audit after ADR revision is mandatory.** […] This is unconditional […]

**Failure handling:** None. Same pattern as research/Step 4b.
**Artifact verification:** None.
**Position:** Middle of decide skill.

### Site 5: susceptibility-snapshot-evaluator (`rdd/SKILL.md`, line 202)

**Current text (verbatim):**
> **Susceptibility Snapshot Dispatch.** After the gate conversation completes and before the next phase begins, dispatch the **susceptibility-snapshot-evaluator** agent with the susceptibility signals recorded during the Attend step. The agent evaluates the signals in an isolated context and produces a Susceptibility Snapshot artifact. This is a Tier 1 mechanism — it fires at every phase boundary regardless of context. If the snapshot recommends a Grounding Reframe, present it to the user before entering the next phase […]. The user decides whether to pursue grounding or proceed — but the decision is visible, not silent.

**Failure handling:** None.
**Artifact verification:** None — "if the snapshot recommends" presupposes production.
**Position:** Line 202 of a ~530-line file. The *deepest* "lost in the middle" position of any dispatch site. ~200 lines above, ~330 below, no horizontal rule, no top-level heading, only inline bolding as structural emphasis.

## Silent-Fallback Enablers

Four properties repeat across all five sites:

1. **Dispatch outcome is implicit.** No site instructs explicit acknowledgment of success/failure. "After the agent completes, read the report" presupposes completion.
2. **Artifact existence is presupposed, not verified.** No instruction to tool-check that the file at the output path exists and was written by the dispatched agent.
3. **Failure is invisible under task immersion.** The lit review (Geng et al. 2025; Parasuraman & Manzey 2010) predicts precisely this: under task focus, the agent is not in a state to notice meta-level dispatch failure. The natural recovery is to produce the output directly — locally rational, globally catastrophic.
4. **Detection depends on voluntary attention.** All five sites delegate failure detection to the agent's own noticing. No harness-level mechanism catches failures from outside the agent's context. This is exactly what Dapper's transparency principle forbids.

Position effects amplify all four. Four of five sites are in the middle of long files; the fifth (susceptibility) is the deepest middle of the longest file.

## Proposed Hardening (Illustrative)

A representative hardened block, applied as the pattern across all five sites:

**Proposed text (applied to each dispatch site with site-specific details):**
> **Step [N] — [Mechanism name] (Tier 1, dispatch-verified).**
>
> Dispatch the **[agent-name]** specialist subagent via the Task tool, providing: [inputs + output path].
>
> **Dispatch verification (mandatory, before proceeding):**
> 1. State the dispatch outcome explicitly in the conversation: success, error, or permission denial.
> 2. Use a tool call (Read or Bash) to confirm the artifact file exists at the output path. If the file does not exist, the dispatch did not produce its required output, regardless of what the Task tool returned.
> 3. **On any failure — Task tool error, permission denial, or missing artifact — STOP. Do not produce the [audit/review/snapshot] in your own context. Do not proceed to [next step]. Surface the failure to the user explicitly: "The [agent-name] dispatch failed [with reason]. Architectural Isolation has been lost. Cannot proceed past [step] until this is resolved." The user decides how to proceed.**
>
> Producing the output in your own context is a structural failure of the Tier 1 mechanism. The mechanism's value is the isolated context, not the output content. Audit-shaped output generated in-context is not a substitute.
>
> Only after dispatch verification succeeds, proceed as currently described.

The pattern addresses the four enablers on its own terms: explicit dispatch-outcome acknowledgment, mandatory artifact-existence verification via tool call, an unconditional STOP-and-surface clause, and a direct denial of the in-context fallback as "equivalent."

## Honest Evaluation Against the Lit Review

**The proposed hardening will not work. The lit review predicts it will not work. This is the load-bearing finding of the spike.**

**Survives task-immersion?** No. The proposal is itself an executor-voluntary meta-level specification. Geng et al. (2025) found meta-level instructions are exactly the category reliably overridden by pretraining-derived social priors and task engagement. The STOP clause is more text in the same position in the same file with the same susceptibility to being read-but-not-applied as the original.

**Applied more reliably than the original?** Marginally, perhaps. Bolded STOP clauses may receive a few percentage points more attention. But the IFScale/FollowBench findings and "Revisiting the Reliability of Language Models in Instruction-Following" (up to 61.8% degradation under nuanced modifications) suggest the improvement is within noise. The added text may push other instructions deeper into the middle — possibly net negative.

**Moves enforcement from executor-voluntary to harness-structural?** No. This is the central failure. Every verification step is an additional thing the executor is voluntarily asked to do. The agent is still the party deciding whether the dispatch succeeded, whether to verify, and whether to STOP. The Dapper transparency principle is violated exactly as before: the proposed hardening instruments the executor's voluntary reporting and just adds more reporting steps.

**Failure mode of the hardening:** Identical to what it's supposed to prevent. Under task immersion: agent reads dispatch instruction, attempts dispatch, fails, reads verification instruction (more text), feels the local-task gradient toward producing the audit, produces it in-context, references the dispatch as successful, proceeds. And crucially the *failure of the hardening is itself silent* — the user does not learn the STOP clause was skipped any more reliably than they learned the dispatch was skipped. It adds another Swiss Cheese layer with the same hole in the same place.

## Conclusion

Text-level hardening is insufficient. The current dispatch text has zero failure-handling language and presupposes artifact existence. The proposed hardening fixes the obvious gaps and produces instructions that *read* as more careful and more disciplined. But the failure lives at the boundary between task-level engagement and voluntary attention to meta-level instructions, and prose hardening sits inside the same boundary that produces the failure. The enforcement layer is wrong.

Three layers that would actually work, least to most invasive:

1. **PostToolUse hook on the Task tool** (`~/.claude/settings.json`). Fires after every Task invocation, reads the output path from the call parameters, verifies file existence and basic structural properties, injects a failure signal back into the conversation (or fails the tool call outright) if the artifact is absent. Harness-structural — does not depend on the agent's voluntary reading. Most directly consistent with Dapper's transparency principle.

2. **Stop hook running a manifest check at phase completion.** Fires when the agent declares a phase complete, scans a phase-specific expected-artifact manifest, injects a hard alert visible to the user (not just the agent) if any expected artifact is missing, and prevents cycle-status phase completion. This is the watchdog/dead-man-switch pattern in text: absence of an expected artifact is the failure condition, detected externally.

3. **Restructure dispatch as a harness operation, not an agent operation.** Most invasive: Tier 1 dispatches become things the harness does at structurally defined moments, not things the agent chooses to do. Requires either an orchestrator wrapper or settings.json automation at fixed trigger points. Fully moves dispatch out of the agent's voluntary action space.

Option 1 is cheapest and most directly addressable. It is the layer Spike S1 is designed to investigate. **The negative result of S4 is the affirmative case for S1.**

## Implications for Cycle 10

- **The essay should not recommend hardening the dispatch prose.** That would produce a sense of progress the literature predicts will not survive runtime. The essay should surface the negative result directly: the failure layer is below the prose, and the response has to be at the harness layer.
- **Spike S1 is now load-bearing for the cycle's recommendation.** If PostToolUse hooks can verify Task-dispatched artifact existence and fail loud, the cycle has a concrete recommendation. If not, the cycle must propose a more invasive restructuring. S1 resolves the cycle, not S4.
- **Spike S2 (acceptance criteria) becomes directly useful.** Criteria that distinguish "mechanism executed in isolated context" from "mechanism-shaped output exists in transcript" become testable by the artifact-existence check S1 is feasibility-testing.
- **Issue #9 item 4 should be reframed.** Not "the skill text should have said more about failure handling," but "the skill text was always going to be insufficient regardless of its content, because the executor is the failing party and cannot be trusted to detect its own non-execution under the conditions that produce the non-execution."
- **Methodology graduation.** If the cycle's response is harness-structural rather than skill-textual, the methodology graduates from "well-written instructions in skill files" to "well-written instructions in skill files *plus* a harness layer that enforces the load-bearing parts externally." This is a meaningful architectural shift and should be acknowledged in the essay as such — not as a tweak but as recognition that the prose layer alone cannot carry the methodology's reliability claims.
