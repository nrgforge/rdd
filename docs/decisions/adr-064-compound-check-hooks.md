# ADR-064: Compound Check — PostToolUse(Agent) Dispatch Log + Stop Hook Manifest Verification

**Status:** Proposed

## Context

ADR-063 adopted the Per-Phase Manifest format as the canonical Harness-Layer specification for Tier 1 mechanism artifact requirements. The manifest alone — consumed by a Stop hook that checks artifact existence, size floors, and structural assertions — closes State B (missing artifact) and trivial State C (brief fabricated stubs). It does not close sophisticated State C: a task-immersed orchestrator drawing on prior audit examples in the repository can reproduce the full skeleton of an audit artifact with correct headers, field labels, and size above the floor, defeating purely structural discriminators. Essay 014 §6 and Spike S2's validation against Issue #9 Item 4 document this scope limit explicitly.

The complete defense against sophisticated State C is a **compound check**: the Stop hook must cross-reference its manifest checks against a **dispatch log** of every subagent dispatch the agent attempted during the session. An artifact at the expected path is not sufficient on its own; the artifact must correspond to a logged dispatch. Fabricating both the artifact *and* a matching dispatch log entry requires inducing a fake `PostToolUse` hook event — structurally impossible because the agent cannot inject hook events. The agent sees hook events; the harness emits them.

Spike S1 (`./essays/research-logs/spike-s1-hook-feasibility.md`) established that `PostToolUse` hooks fire on the `Agent` tool (the Task tool's hook `tool_name`) with full access to `tool_input.subagent_type` and `tool_input.prompt`. A shell hook can extract the expected output path from the prompt via regex and append a structured dispatch log entry to a session-scoped state file. This closes the compound check.

Two cross-cutting concerns shape the mechanism's design beyond the core architecture:

1. **Scope discipline (from DISCOVER settled premise 5).** The hook architecture must be scoped surgically to the four failure modes Essay 014 names (items 1–4 plus item 5 via path convention), not generalized as a new default for any structural mechanism. Items 5 and 6's conversational-mechanism nature places them outside the harness layer's reach; ADR-065 (Anchor Dispatch) and ADR-066 (User-Tooling Layer) handle residual cases.

2. **Hook-script reliability under user conditions (research-phase Commitment 1).** Broken hook scripts must never wedge the agent, but silent fail-to-allow is indistinguishable from no-hook from the user's perspective — exactly the failure mode Cycle 10 documents. The user of RDD is typically not the plugin maintainer and cannot debug hook scripts. Any surfacing mechanism must respect that position: non-blocking, actionable for maintainers via GitHub issue contribution, ignorable for users who do not wish to engage.

## Decision

Extend ADR-033's cross-cutting hook architecture with two additional hooks implementing the Harness-Layer Compound Check.

### Hook 1: PostToolUse on Agent — Verify Dispatch

**Event:** `PostToolUse`
**Matcher:** `Agent`
**Script:** `hooks/scripts/tier1-verify-dispatch.sh`

On every `PostToolUse` where `tool_name == "Agent"`, the hook:

1. Extracts `tool_input.subagent_type` from the hook input JSON.
2. If `subagent_type` is not in the Tier 1 mechanism set (research-methods-reviewer, citation-auditor, argument-auditor, susceptibility-snapshot-evaluator), exits silently (not a Tier 1 dispatch).
3. Extracts the expected output path from `tool_input.prompt` via regex, matching the canonical path patterns specified in the manifest's `path_template` entries (with `{cycle}` resolved to the current cycle).
4. Appends a structured entry to the session-scoped dispatch log at `docs/housekeeping/dispatch-log.jsonl`:
   ```json
   {"timestamp": "2026-04-08T15:42:11Z", "session_id": "...", "mechanism": "argument-auditor", "subagent_type": "argument-auditor", "expected_path": "docs/essays/audits/argument-audit-014.md", "tool_use_id": "..."}
   ```
5. Exits allow (never blocks the tool call — verification is append-only; the dispatch already ran).

The `docs/housekeeping/` directory is introduced in this ADR as a new structural pattern for operational artifacts that live in the RDD corpus but are machine-generated or machine-consumed rather than research prose. See §"Housekeeping directory" below for the rationale and scope.

**Precondition on skill text:** Every Tier 1 dispatch prompt must contain the expected output path in a canonical, regex-parseable form. ADR-065 (Anchor Dispatch) specifies the required prompt skeleton. Without that skeleton, the PostToolUse hook cannot extract the path and logs the dispatch with `expected_path: null`, which the Stop hook treats as a partial log (mechanism dispatched but target unknown).

### Hook 2: Stop — Check Phase Manifest with Compound Cross-Reference

**Event:** `Stop`
**Matcher:** (all)
**Script:** `hooks/scripts/tier1-phase-manifest-check.sh`

The reference implementation from Spike S2, extended with compound-check cross-referencing:

1. Reads `docs/cycle-status.md` for the current phase; if absent or unparseable, emits `allow` (fails safe).
2. Reads the current cycle number from the `**Cycle number:** NNN` field in `docs/cycle-status.md` (canonical mechanism per ADR-063). If that field is absent or unparseable, falls back to inferring the cycle from the highest `NNN-` prefix in `docs/essays/`. If neither is available, emits `allow`.
3. Loads the manifest from `hooks/manifests/tier1-phase-manifest.yaml` (per ADR-063); if absent or unparseable, emits allow with GitHub-issue surfacing (see §"Fails-Safe-to-Allow").
4. Looks up the current phase entry; if the phase has no obligations, emits `allow`.
5. For each required mechanism in the phase entry, runs the three structural assertions from ADR-063 (file existence, size floor, required headers, required fields) AND checks the dispatch log at `docs/housekeeping/dispatch-log.jsonl` for a matching entry whose `mechanism` matches and whose `expected_path` matches the resolved path template.
6. Emits `block` with a reason naming every failing mechanism, distinguishing four failure modes:
   - **Missing artifact + no dispatch log entry** — mechanism never ran (State B). Reason: "mechanism was not dispatched at all."
   - **Missing artifact + dispatch log entry exists** — mechanism dispatched but artifact not written (subagent failure). Reason: "mechanism was dispatched but did not produce its expected artifact."
   - **Artifact exists + no dispatch log entry** — potential State C (artifact produced without going through the subagent). Reason: "artifact exists but no corresponding dispatch was logged; this may indicate fabricated audit output."
   - **Artifact exists + structural assertion failure** — thin or malformed output. Reason: the specific assertion that failed.

The block reason includes an explicit instruction: *"Do NOT fabricate these artifacts in your own context. The mechanism's value is that the artifact comes from an isolated subagent dispatch, not that a file of the expected shape exists."* This closes the loop to the agent on its next turn via Stop hook's model-visible `block` injection.

### Fails-Safe-to-Allow — sufficiency analysis and surfacing design

**Default behavior unchanged:** On internal hook-script error (YAML parse failure, missing files, shell errors, any exception), the hook emits `allow` and exits 0. A broken hook must never wedge the agent. This is the baseline Spike S2's reference implementation already honors.

**Sufficient on its own? No.** Fails-safe-to-allow is a necessary default but not sufficient as a complete mitigation. The concern raised in research-phase Commitment 1: silent fail-to-allow is indistinguishable from no-hook from the user's perspective. If the hook script reliably fails internally on every turn, the user experiences identical behavior to the no-hook baseline — Cycle 10's exact failure mode, produced by a different cause. Sufficient mitigation requires making the failure *visible* to the user, through a channel that respects the user's position.

**The user is typically not the plugin maintainer.** RDD targets developers using the plugin, not developers maintaining it. Hook-script internal errors are the maintainer's bug, not the user's. Confronting the user with diagnostic information they cannot act on would harm methodology adoption more than it would protect against the rare case of a hook script bug. Any surfacing mechanism must:
- Not block (the methodology continues functioning without hook verification for the affected turn).
- Not alarm (no system-level error dialogs, no agent-session disruption).
- Be ignorable for users who do not wish to engage.
- Be actionable for users who *do* wish to contribute diagnostic data, via a channel proportional to their position (GitHub issue with pre-populated template, not shell debugging).
- Be honest about the degradation ("verification unavailable for this turn") rather than hiding it.

**Surfacing mechanism.** On internal error, the hook emits a brief stderr notice in this form:

```
rdd-hook: internal error in <hook-name>
methodology continues to function; verification unavailable for this turn.
please file an issue if convenient:
  https://github.com/nrgforge/rdd/issues/new?template=hook-failure.md
diagnostic: <short machine-readable summary>
```

The GitHub URL uses a pre-defined issue template at `.github/ISSUE_TEMPLATE/hook-failure.md` (companion change to this ADR, specified at implementation time) that asks for: plugin version, hook name, stderr diagnostic line, OS/shell environment, and a copy of the hook input JSON if available. The user fills in what they can; the maintainer gets structured data.

**Not chosen at v1, deferred:**
- **SessionStart self-test.** A hook that verifies other hooks at session start would add startup latency and surface error messages at session-initiation moments when the user wants to begin work, not debug plugins. Deferred unless the stderr notice proves insufficient in practice.
- **Per-session error suppression.** If a hook fails repeatedly in a session, the user sees the notice each time. This is potentially noisy but also informative — a reliably-failing hook probably *should* be visible to the user. Per-session state adds complexity; defer until usage demonstrates the trade-off.
- **rdd-doctor diagnostic skill.** Opt-in diagnostic skills are discoverable only by users who know they need one, defeating the purpose for silent failures.

**Residual risk explicitly accepted.** Users who ignore the stderr notice and continue working with a broken hook experience the same degraded verification as the no-hook baseline. The methodology still functions; only the harness-layer verification is absent. This is acceptable because the surfacing mechanism has made the failure visible once (at first occurrence, on stderr), even if the user chose not to engage with it. Silent-and-indistinguishable has been converted to visible-and-ignorable, which is a structural improvement even without guaranteed user engagement.

### Revision-aware re-audit reminder

The manifest's compound check verifies that an audit artifact exists at phase end with a matching dispatch log entry. It does not verify that the audit was performed on the *current* version of the audited document — an audit performed before a substantial revision does not satisfy the mandatory re-audit-after-revision rule that Invariant 4's amendment and research-phase Commitment 5 both reinforce.

Full temporal tracking (the hook mechanically blocks on any mtime mismatch) is not appropriate because substantiality is a judgment call: a typo fix should not trigger re-audit, but a section rewrite should. The Stop hook cannot mechanically determine substantiality. Silently doing nothing is also not appropriate because a substantial rewrite would then bypass re-audit without any surfacing.

The proportional middle is a **non-blocking reminder**. The Stop hook, in addition to its compound cross-reference, performs a mtime comparison for each audited document against the timestamp of the most recent matching dispatch log entry. If the document was modified after the last dispatch, the hook emits a model-visible notice (alongside its normal `allow` decision — this does *not* cause a block):

```
rdd-hook: re-audit reminder
Audited document was modified after the most recent dispatch.
If the modification is substantial, re-audit is required by
research-phase Commitment 5 and Invariant 4's mandatory re-audit rule.
  Document: docs/essays/014-specification-execution-gap.md
  Last audit dispatch: 2026-04-07T14:22:11Z (argument-auditor)
  Document modified: 2026-04-08T09:15:02Z
Determine whether the modification is substantial enough to warrant
re-auditing before the phase completes.
```

The notice is model-visible — the agent sees it on its next turn and is obligated to surface it to the user. The "substantial vs. trivial" judgment is epistemic, not mechanical: the agent and user together decide whether a re-audit is warranted based on what the revision changed. The hook makes the temporal mismatch visible; the decision remains human.

**Manifest extension (couples to ADR-063).** The hook needs to know which document each mechanism audits. This ADR extends the manifest format with an optional `audited_documents` field per mechanism:

```yaml
- mechanism: argument-auditor
  path_template: docs/essays/audits/argument-audit-{cycle}.md
  audited_documents:
    - "docs/essays/{cycle}-*.md"
  min_bytes: 1500
  ...
```

If `audited_documents` is absent, the mechanism is not subject to revision comparison. The extension is additive and backward-compatible with ADR-063's v1 schema.

**Data flow for the mtime comparison.** The hook implementation joins the dispatch log entry's `mechanism` field to the corresponding manifest entry's `mechanism` field to retrieve `audited_documents`. It then glob-expands the patterns in `audited_documents` (with `{cycle}` substituted) to produce the list of audited files. For each audited file, it performs the mtime comparison against the `timestamp` field of the matching dispatch log entry. If any audited file's mtime exceeds the dispatch log entry's timestamp, the reminder fires. This join is explicit in the hook implementation; without it, the hook has no path from "a mechanism dispatched" to "which documents that mechanism audited."

**Rationale for v1 inclusion.** This started as a deferred scope item ("re-audit temporal tracking is out of scope for v1"), but the user named the re-audit-on-substantial-revision rule at DECIDE gate 2026-04-08 as something that *should not* be silently dropped even if full enforcement is deferred. The reminder is the compromise: mechanical detection is in v1 scope because it's lightweight (mtime compare), decision remains human because substantiality is a judgment call, enforcement is absent because blocking would be disproportionate.

### Housekeeping directory

The dispatch log at `docs/housekeeping/dispatch-log.jsonl` introduces a structural pattern for the RDD corpus: a distinction between **centered** artifacts and **infrastructure** artifacts. The distinction is about what the methodology *centers for users to share and read* versus what *underpins how the framework operates*. The two categories overlap in technical readability — any file in the corpus can be opened and read — but they differ in design intent and user workflow.

- **Centered artifacts** are documents designed to be read, shared, or referenced directly by users: essays, system-design, product-discovery, roadmap, ORIENTATION, ADRs, domain-model. These are the documents a user would hand to a colleague, read end-to-end at a gate conversation, or cite in a PR description. They are organized at top-level `docs/` locations by document type and are the public face of the methodology's work.
- **Infrastructure artifacts** underpin framework operation without being designed for direct user reading. Audit reports are consumed by the orchestrator at gates and findings are surfaced to the user by the agent (not by the user browsing the corpus); cycle-status is parsed by the Stop hook for phase detection; the dispatch log is machine-only; the manifest is consumed by hooks. A user can open any of these if they choose, but the workflow does not expect them to — the information flows through the agent, not through direct reading.

**The distinction is not a hard binary.** Audit findings (like the three framing concerns being discussed in this gate right now) are surfaced by the agent reading infrastructure artifacts on the user's behalf. Cycle-status is sometimes read directly by users resuming a cycle. The distinction is about *what the methodology centers*, not about *what is technically possible to read*. Not everything needs to be centered; infrastructure artifacts remain inspectable and corpus-visible without being in the reading path.

The `docs/housekeeping/` directory groups infrastructure artifacts together so users can find them when they need to (e.g., for the once-in-a-blue-moon direct read), without those artifacts cluttering the top-level `docs/` space where the centered artifacts live. The name "housekeeping" signals "framework infrastructure" — inviting rather than opaque: it says "come look under the hood" rather than "stay out." This is distinct from a hidden `.rdd/` dotfile sidecar, which would actively discourage inspection.

**Attribution:** The centered-vs-infrastructure framing was surfaced by the user at DECIDE gate 2026-04-09 in response to the framing audit's FC-B observation that the original readables-vs-housekeeping binary was actually a spectrum. The original binary framing (user-surfaced at DECIDE gate 2026-04-08) resolved to this clearer framing through the gate conversation — the categories remain the same, but the principle is articulated around user workflow rather than technical readability.

**Rationale from DECIDE gate 2026-04-08:** A hidden `.rdd-session/` dotfile sidecar at the repo root was the original proposal. The user rejected it on grounds that operational files should live in the corpus alongside their peers, not as hidden state: *"it sort of implies 'hey come look under the hood, this is what we're doing' … We have top-level 'readables' that will likely be read by people, and then we have 'housekeeping' that are docs that are acted upon but humans don't need to read them."* This ADR adopts that framing as the structural principle.

**In scope for this ADR:**
- Create `docs/housekeeping/` as a new directory grouping infrastructure artifacts per the centered-vs-infrastructure framing.
- Place `dispatch-log.jsonl` in it.
- Add `docs/housekeeping/dispatch-log.jsonl` to `.gitignore` (session-scoped state is not durable).

**Committed as infrastructure, migration deferred to ADR-070:**

This ADR commits to the position that audit reports and cycle-status belong in the infrastructure category (underpin framework operation; findings surfaced by the agent rather than browsed directly by users). The actual migration mechanics — physical file moves, manifest `path_template` updates in ADR-063, path references in prior ADRs, skill-file dispatch instructions, Spike S2 reference implementation path updates — are separated into ADR-070 (Housekeeping directory migration). The separation is because the migration touches many files across the corpus and requires careful handling of in-flight Cycle 10 audits; bundling it into ADR-064 would violate the one-decision-per-ADR principle and produce an unreviewably large diff.

- **`docs/essays/audits/` → `docs/housekeeping/audits/`**: audit reports are output of verification subagents; the agent reads them at gates and surfaces findings on the user's behalf (as happened for the three framing concerns at this DECIDE gate). Users can read audits directly if they want, but the workflow does not center them for direct reading. Migration mechanics in ADR-070.
- **`docs/cycle-status.md` → `docs/housekeeping/cycle-status.md`**: cycle-status is parsed by the Stop hook for phase detection and is occasionally read by users resuming a cycle. Primarily infrastructure; occasionally centered. Same deferral to ADR-070.

**Related scope for rdd-conform (three new audit scopes specified in ADR-070):** The conformance audit skill should be extended with three new audit scopes: (1) **housekeeping directory organization audit** — verifies that audit files are organized by cycle with canonical naming, that infrastructure artifacts haven't drifted to the wrong locations, and that the centered-vs-infrastructure distinction is being honored by placement; (2) **gate reflection note template alignment audit** (per ADR-066) — verifies gate reflection notes match their canonical template; (3) **dispatch prompt format audit** (per ADR-065) — verifies skill-file dispatch prompts follow the canonical skeleton with the `Output path:` line so the PostToolUse hook can extract expected paths. All three are within `rdd-conform`'s existing template-alignment mandate, applied to new directory patterns and skill-file patterns.

**Why ADR-064 scopes the distinction but defers migration:** The centered-vs-infrastructure distinction is load-bearing for the dispatch log's location decision — without it, the dispatch log's placement in `docs/housekeeping/` would be arbitrary. With the distinction in place, the placement is the first concrete instance of a pattern that groups infrastructure artifacts together. The migration is operationally significant but architecturally straightforward — it is the mechanical execution of the distinction this ADR commits to.

### Advisory mode for pre-migration corpora

The compound check must not wedge corpora that were built on a pre-housekeeping version of the plugin. The methodology targets developers with varying investment levels: some will migrate their corpus eagerly by running `rdd-conform`; others will update the plugin but defer corpus changes until convenient. A Stop hook that blocks pre-migration corpora on every phase transition would impose migration work as a precondition for continued operation — a user-hostile default that the Fails-Safe-to-Allow principle rejects at the sibling failure-mode level.

**Migration version marker.** A marker file at `docs/housekeeping/.migration-version` contains the plugin version that last migrated the corpus to the current housekeeping structure. The file is written by ADR-070's migration process when `rdd-conform` runs in migration mode.

**Detection logic.** On Stop hook invocation:

- If `docs/housekeeping/` does not exist → corpus is pre-migration → **advisory mode.**
- If `docs/housekeeping/` exists but the marker file is absent → migration in progress or incomplete → **advisory mode.**
- If the marker file exists → corpus is migrated → **enforcement mode** (the compound check runs as specified in Hook 2 above).

**Advisory mode behavior.** In advisory mode, the hook does not block. It emits a notice via the same non-blocking stderr pattern as Fails-Safe-to-Allow, with different content:

```
rdd-hook: advisory mode (pre-migration corpus)
Compound-check verification is disabled for this corpus because the
housekeeping directory structure introduced in <plugin-version> has
not been applied yet.

Your cycle continues to work without harness-layer verification. To
enable the compound check and the Tier 1 artifact verification it
provides, run /rdd-conform, which will migrate your corpus and update
the marker.
```

The notice fires once per session (session-scoped suppression marker, same mechanism the dispatch log uses for session detection). Users who ignore it continue working without disruption; users who run `rdd-conform` transition to enforcement mode on their next session.

**Conform is opt-in, not required.** The compound check is an opt-in enhancement for corpora that have been migrated. It is *not* a precondition for operating RDD. A user who never runs `rdd-conform` after a plugin update continues to work normally with advisory-mode notices; their cycles complete, their ADRs land, their audits still dispatch via the Skill-Structure Layer (ADR-065), they simply lack harness-layer verification on their phase boundaries. This is acceptable because the primary anchoring is the Skill-Structure Layer; the Harness Layer is defense-in-depth per Essay 014 §5's own framing.

**User-experience framing: this is a UX commitment, not a new architectural principle.** The load-bearing motivation for the advisory-vs-enforcement split is user experience, surfaced by the user at DECIDE gate 2026-04-08: a developer who updates the plugin mid-cycle should not be forced into immediate corpus restructuring; their cycle should continue to complete normally while the new enforcement waits for them to opt in. This is a direct response to the concrete user workflow the methodology targets — not a derivation from a higher-level principle, not a generalization from the specification-execution gap diagnosis, but a commitment to the developer-as-user.

The specific mechanism documented above — version marker file, three-state detection (pre-migration / migration-in-progress / migrated), opt-in enforcement via `/rdd-conform migrate`, non-blocking stderr notice with GitHub issue surfacing — is the concrete application for ADR-064's compound check. It is not being proposed as a binding architectural principle for all future plugin updates. Future updates that introduce structural corpus migrations should consider user experience using similar intuition (how does a developer mid-cycle encounter this change? can they opt in on their schedule? what is the minimum user obligation for continued operation?), but the consideration is case-by-case UX judgment rather than a methodology-level rule. An update whose UX concerns are different from this cycle's may compose the pattern differently or not at all.

What this ADR establishes as durable: the specific advisory-mode mechanism for ADR-064's compound check. What it does not establish: a universal graceful-upgrade principle. The UX commitment is encoded for this specific case and available as a reference pattern for future cases that find it useful.

**Coupling to ADR-070.** The migration process in ADR-070 is responsible for: (a) moving files from pre-migration paths to housekeeping paths, (b) writing the marker file with the current plugin version, (c) handling edge cases like cycle-in-progress states and partial migrations. The Stop hook logic in this ADR is coupled to the marker file's existence; ADR-070 is coupled to its creation. The coupling is minimal — one file, existence check — but both must ship together for the transition to be clean.

**Note on Cycle 10's own corpus.** The corpus currently writing these ADRs is itself pre-migration (Cycle 10's audits live at `docs/essays/audits/`). When the plugin version shipping ADRs 063–065 and 070 is released, Cycle 10's own corpus will enter advisory mode on that plugin until `rdd-conform` is run to migrate it. This is the expected behavior — the methodology's first user of the new pattern is the methodology itself, and it will experience the graceful degradation like any other user.

### Scope — surgical, not general

Per DISCOVER settled premise 5, this hook architecture is scoped surgically to the four failure modes named in Essay 014 and validated in Spikes S1 and S2:

| # | Failure mode | Coverage |
|---|---|---|
| 1 | research-methods-reviewer not dispatched | Full (PostToolUse log + Stop hook manifest check) |
| 2 | citation-auditor not dispatched | Full |
| 3 | argument-auditor not dispatched | Full |
| 4 | Subagent silent fallback to in-context | Full (compound check — artifact must correspond to logged dispatch) |
| 5 | Susceptibility snapshot never ran | Full, contingent on ADR-065's skill-structure fix specifying the canonical path convention |
| 6 | Belief-mapping at user pushback | Not addressable at harness layer; see ADR-066 (User-Tooling Layer) for partial response via artifact-producing conversion |

The compound check is not proposed as a new default for any structural mechanism going forward. Mechanisms that have proven reliable through skill-structure anchoring alone (the existing citation, argument, and research-methods audits have 100% historical dispatch coverage at their step-anchored sites per Spike S3) do not require compound-check coverage — the PostToolUse log exists for them as defense-in-depth against silent fallback, but the skill-structure fix is their primary enforcement layer. The Stop hook's phase manifest is the incremental structural anchor for mechanisms whose dispatch cannot be step-anchored (the susceptibility snapshot specifically).

## Consequences

**Positive:**

- **State C becomes structurally impossible for the four addressed failure modes — in enforcement mode.** Sophisticated fabrication would require inducing a fake `PostToolUse` hook event matching the artifact claim; the agent cannot inject hook events. This is a structural guarantee, not a probabilistic discriminator. **The guarantee is conditional on the corpus being in enforcement mode** (the migration-version marker file is present — see §"Advisory mode for pre-migration corpora" below). In advisory mode, the PostToolUse dispatch log is not written and the compound cross-reference does not run; the structural guarantee does not hold. Future ADRs citing ADR-064 for the State C guarantee must inherit the enforcement-mode qualification.
- **Silent fallback (Cycle 9 Item 4) becomes catchable on the next `Stop` event.** The agent claims an audit was performed; the Stop hook cross-references the dispatch log; the absence of a logged dispatch distinguishes silent-fallback fabrication from genuine dispatch.
- **The susceptibility snapshot at phase boundaries becomes hook-enforceable.** Not via PostToolUse (phase boundaries are not tool calls) but via the Stop hook reading the phase from cycle-status and requiring the snapshot artifact at the canonical path. The session cannot end without the snapshot being present — the strongest case the harness layer handles.
- **Failure modes 1–4 move from judgment-anchored (orchestrator contextual recognition) to harness-verified (structurally observable).** This is Invariant 8's anchoring requirement met for these four mechanisms, via the Harness Layer substrate.
- **Fails-Safe-to-Allow with GitHub-issue surfacing respects the user's position.** Non-blocking, ignorable, actionable-if-desired. No diagnostic burden on users who cannot debug plugin internals.
- **The compound check extends ADR-033's hook architecture additively.** Two new hook scripts join the existing five; no changes to the five. Total plugin hook count: seven.

**Negative:**

- **Adds a new session-scoped state file at `docs/housekeeping/dispatch-log.jsonl` and introduces the `docs/housekeeping/` directory as a new structural pattern.** The file needs to be per-session (not persisted across sessions), gitignored, and cleaned up on session end. Session boundaries in Claude Code are not always cleanly defined; edge cases (interrupted sessions, parallel sessions on the same repo) need handling. Proposed v1 behavior: the file lives at `docs/housekeeping/dispatch-log.jsonl`, is appended to by the PostToolUse hook, and is truncated at the start of each session via a SessionStart hook. If SessionStart proves unreliable, the file is truncated at the first PostToolUse dispatch of a new session (detected via `session_id` change in the hook input). The housekeeping directory itself is a corpus-visible structural pattern (not a dotfile sidecar); see §"Housekeeping directory" in the Decision section for scope and future migration candidates.
- **Requires canonical output paths in dispatch prompts.** The PostToolUse hook cannot verify a dispatch it cannot parse. This is a hard dependency on ADR-065's skill-structure specification of the required prompt skeleton. Until ADR-065 is implemented, the PostToolUse hook logs `expected_path: null` for Tier 1 dispatches, and the Stop hook's compound cross-reference degrades to "dispatch happened, path unknown" — still better than no log, but not the full compound check.
- **Re-audit substantiality judgment is deliberately deferred to agent+user decision, not mechanically enforced.** The v1 compound check includes a revision-aware reminder (see §"Revision-aware re-audit reminder") that surfaces the temporal mismatch when an audited document has been modified after the last dispatch — but the reminder is non-blocking. The decision about whether the modification is substantial enough to warrant re-audit remains human. This is a principled limit, not a deferral: mechanical enforcement of a judgment-scale rule would be disproportionate, and blocking on every mtime change would be user-hostile. Users who want stricter enforcement can configure their workflow to re-audit on every revision without hook support. The ADR's stance is that v1 surfaces the condition; the decision is epistemic.
- **The `{cycle}` token resolution via cycle-status is the canonical mechanism, with essay-prefix inference as fallback.** ADR-063 commits to reading the cycle number from an explicit field in `cycle-status.md` (`**Cycle number:** NNN`) as the primary mechanism, falling back to essay-prefix inference when the field is absent. This resolves the out-of-order essay numbering fragility (essay 015 started while 014 is still in DECIDE) for any corpus that populates the cycle-status field. Pre-Cycle-10 corpora without the field continue to work via fallback inference. The fallback-inference failure mode remains theoretically possible for a pre-Cycle-10 corpus that starts a new essay out of order, but this is a narrow edge case and the migration to the explicit-field convention is a one-line change.
- **Task-immersion fabrication remains possible for mechanisms not covered by the compound check.** The agent could fabricate audit output for *any* mechanism not in the four-item scope above. This is a scope choice, not a design flaw — but the choice should be named honestly. Mechanisms beyond the four covered here remain governed by the skill-structure layer (ADR-065) or the user-tooling layer (ADR-066), not by this compound check.

**Neutral:**

- **Format versioning on the dispatch log format.** The JSONL schema should include a `format_version` field for coordination with the manifest format version from ADR-063. v1 schema: `{timestamp, session_id, mechanism, subagent_type, expected_path, tool_use_id}`.
- **Extension of ADR-033.** This ADR adds two hooks to the five ADR-033 specifies; the total plugin hook count becomes seven. ADR-033's architectural framing (cross-cutting concerns maintained in one place) continues to hold.
- **The Stop hook's block reason is model-visible but not user-visible.** Per Spike S1's finding (essay §5, line 117), all injected hook context is model-visible, not user-visible. When the hook detects a missing artifact and blocks, the agent sees the reason; the user depends on the agent to surface the failure. This is the two-step loop-closure ADR-033 already acknowledges for the existing hooks — noted here for consistency, not a new consequence.

## Provenance check

**Did this ADR's core framing originate from Essay 014, from a prior gate conversation, or from the agent's synthesis during drafting?**

Tracing each major claim to its source:

- **The compound-check architecture (PostToolUse dispatch log + Stop manifest cross-reference):** Essay 014 §6 line 149 ("The complete defense is a compound check… State C then requires fabricating both the artifact and somehow inducing a fake PostToolUse event — structurally impossible because the agent cannot inject hook events") and Spike S2 §"Validation Against Issue #9" line 504 ("The only complete State C defense is the compound check (PostToolUse-dispatch-log AND Stop-manifest-check) that S1 recommends"). Not agent synthesis.
- **The PostToolUse dispatch schema and `{description, prompt, subagent_type, model}` access:** Spike S1 §"Implementation precisions" and §"Per-Mechanism Feasibility Analysis" items 1–4. Not agent synthesis.
- **The Stop hook's reference implementation (phase from cycle-status, cycle from essay numbering, structural assertions):** Spike S2's reference implementation script. Not agent synthesis.
- **The surgical scope discipline (four failure modes, not general default):** DISCOVER settled premise 5 as recorded in `docs/cycle-status.md` feed-forward signals. Not agent synthesis.
- **The Fails-Safe-to-Allow sufficiency analysis (silent-fail indistinguishable from no-hook):** Research-phase Commitment 1 as recorded in `docs/cycle-status.md`. Not agent synthesis.
- **The GitHub-issue surfacing design (stderr notice with issue template URL, non-blocking, ignorable, maintainer-vs-user distinction):** DECIDE phase conversation 2026-04-08 (this cycle, this turn). The user named the product principle — "the user is in no position to fix the error unless they are me" — and the resulting design (non-blocking stderr notice directing to GitHub issue, no SessionStart self-test, no per-session suppression at v1) was composed in direct response to that framing. **User-surfaced at DECIDE gate 2026-04-08; agent composed the specific stderr-notice format in response.** This is a hybrid provenance similar to the User-Tooling Layer pattern from MODEL: the principle is user-surfaced, the structural encoding is agent-composed. The encoding carries explicit attribution here.
- **The "rdd targets developers who are not the methodology maintainer" product principle:** user-surfaced at DECIDE phase 2026-04-08, same conversation. Shapes the entire Fails-Safe-to-Allow sufficiency analysis. Attribution carried.
- **Revision-aware re-audit reminder (non-blocking mtime comparison, substantiality-is-human-judgment framing):** user-surfaced at DECIDE gate 2026-04-08. The user rejected pure deferral of re-audit temporal tracking ("not a hard blocker but we do want to re-audit if we make substantial revisions"), and the agent composed the reminder-rather-than-block design in response. The principle — mechanical detection, epistemic decision — is the agent's composition, but the requirement to include *some* revision-aware mechanism in v1 rather than deferring entirely is user-surfaced. Attribution carried in the Decision section.
- **The `docs/housekeeping/` directory as a structural pattern (corpus-visible rather than dotfile sidecar):** user-surfaced at DECIDE gate 2026-04-08. The user rejected the original `.rdd-session/` dotfile proposal on grounds that operational files should live in the corpus alongside their peers, not as a hidden sidecar.
- **The centered-vs-infrastructure framing (originally readables-vs-housekeeping):** user-surfaced at DECIDE gate 2026-04-08 as a binary framing (readables vs. housekeeping), refined at DECIDE gate 2026-04-09 to "centered-vs-infrastructure" in response to the framing audit's FC-B observation that the original binary was actually a spectrum. The user named both categories explicitly and committed to audits as infrastructure-scoped at both gates. The agent's composition: the specific scope list of what is centered vs. infrastructure, the committed-but-deferred migration structure (migration mechanics go to ADR-070), and the rdd-conform scope extension. The framing itself is user-surfaced (twice, at both gates); the architectural execution is agent-composed. Attribution carried in the Housekeeping directory subsection.
- **Advisory mode for pre-migration corpora (originally framed as graceful-upgrade principle, refined to UX commitment):** user-surfaced at DECIDE gate 2026-04-08 as a concern about plugin updates forcing immediate corpus migration: *"Someone may not want to do that immediately even if they have the latest version of RDD. So how to handle that? What happens if conform becomes required?"* The agent's original composition: the version marker mechanism, the detection logic (three-state — pre-migration, in-progress, migrated), the advisory-mode stderr notice format, the generalization to future migrations as a "graceful-upgrade principle", and the explicit commitment that conform is opt-in not required. At DECIDE gate 2026-04-09, the framing audit's FC-A observation flagged the generalization as an architectural-principle overreach derived from a single user concern. The user endorsed reframing the generalization as a UX commitment rather than a binding architectural principle. The mechanism is unchanged; the framing shifted from "principle" to "UX commitment." Attribution carried in the Advisory mode subsection.
- **The three "not chosen at v1" alternatives (SessionStart self-test, per-session suppression, rdd-doctor):** agent-generated at drafting time as independent second-order critique of the chosen design. These are tests of the decision's robustness against alternatives that were not in the essay or the cycle conversation.

**Result:** Core architecture is from essay + spikes (not agent synthesis). Four substantial design decisions in this ADR are user-surfaced at DECIDE gate 2026-04-08 with agent-composed encodings: the Fails-Safe-to-Allow stderr-notice design, the revision-aware re-audit reminder, the centered-vs-infrastructure framing, and the advisory-mode mechanism for pre-migration corpora. Two of those decisions (the centered-vs-infrastructure framing and the advisory-mode framing) were refined at DECIDE gate 2026-04-09 in response to the framing audit's FC-A and FC-B observations — the underlying mechanisms stayed but their conceptual framings shifted to be more precise about their grounding. Each decision is attributed in the ADR body at the point where the design lands. The three "not chosen at v1" alternatives are drafting-time critique. No synthesis-moment framing adoption detected at drafting time — every user contribution is named at its point of influence rather than absorbed silently. The pattern is consistent across both gates: the agent proposes a first-cut design or framing, the user raises a concern the agent had not independently surfaced (either directly at the gate or via the framing audit running in isolated context), and the final design is shaped by the user's framing with the agent's architectural composition. This is the fourth and fifth instance of the pattern in Cycle 10 (research-phase framing audit moments, MODEL compound-defense moment, DECIDE Fails-Safe-to-Allow moment, DECIDE advisory-mode moment, DECIDE centered-vs-infrastructure refinement), and the ADR-069 methodology scope-of-claim ADR records it as a settled finding.
