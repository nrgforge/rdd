# ADR-088: ADR-064 Amendment — Phase-Manifest Check Demoted to Advisory; Compound Check Retained

**Status:** Proposed

## Context

Cycle 017 was paused twice during entry while the orchestrator and user diagnosed Stop-hook failure modes that ADR-064 had not anticipated:

- **Pause 1 (v0.8.1 → v0.8.2).** The Stop hook fires the per-phase manifest check on every Stop event between agent turns. At RESEARCH Step 1.1 (pre-dispatch, awaiting user input), every agent turn triggered the block check and produced a visible block-loop. The fix: introduce the `**In-progress phase:**` predicate (ADR-079 extension via skill-text discipline) so the hook short-circuits the manifest check while a phase is actively in progress.
- **Pause 2 (v0.8.2 → v0.8.3).** The user observed two issues. First, v0.8.2 fixed the orchestrator-driven path but left standalone phase-skill invocation vulnerable to the same loop — practitioners invoking a phase skill directly (without the orchestrator setting `**In-progress phase:**`) still hit the cascade. Second, the Stop-hook block was never a real wall in the first place: Claude Code feeds the Stop hook's reason field back as next-turn context, not as a terminating signal. The agent processes the block, attempts a remediation, and the hook fires again with the same content. The "blocking" semantic existed in the hook's exit code but not in the agent's experience. v0.8.3 demoted the manifest check to advisory-only across all modes; the In-progress phase predicate was retained as advisory-noise suppressor.

ADR-064's original Decision text claimed that the Stop hook "emits `block` with a reason naming every failing mechanism" and that the compound check provides structural prevention against sophisticated State C fabrication: *"State C becomes structurally impossible for the four addressed failure modes — in enforcement mode."* The **structural-prevention claim** was tied to the hook's blocking semantic.

v0.8.3's advisory demotion changes this in two ways:

1. **The phase-manifest check (existence + size floor + required-headers + required-fields assertions) no longer blocks.** It emits a model-visible advisory naming missing artifacts; the agent reads the advisory and surfaces it to the user. The advisory cannot be ignored without explicit choice — it is read on every Stop until the missing artifact appears or the In-progress phase field is set — but it does not wedge the cycle.
2. **The compound check's PostToolUse dispatch log + Stop-hook cross-reference remains.** The dispatch log continues to record every Tier 1 subagent dispatch; the Stop hook continues to cross-reference required artifacts against the log. The cross-reference's finding (missing dispatch log entry, fabricated artifact pattern) is surfaced as advisory rather than as block. The fabrication-detection mechanism still runs; only its enforcement strength changes from "block on detection" to "advise on detection."

ADR-064's structural-prevention claim is now overstated relative to what v0.8.3 delivers. The Harness Layer's role shifts from "blocking enforcement of mechanism execution" to "advisory verification with skill-discipline as the load-bearing enforcement layer." The compound check's State-C-impossibility argument is unchanged in mechanism — the agent still cannot inject hook events — but its delivery shifts from blocking to advisory. A practitioner can ignore the advisory and proceed; the methodology's response is to make the advisory visible and to record the choice in cycle-status, not to mechanically prevent the next step.

Cycle-status.md's feed-forward signals named this as methodology debt: *"v0.8.3 demoted the Tier 1 phase-manifest check from blocking to advisory. The prior 'Harness Layer provides structural prevention' claim is now overstated. ADR-064 (compound check / Stop-hook compound verification) and ADR-067 (Three-Tier Enforcement Classification) need amendment to reflect that the Harness Layer is now advisory-with-skill-discipline, not blocking."* This ADR addresses the ADR-064 amendment; ADR-089 addresses the ADR-067 amendment.

## Decision

This ADR **partially supersedes ADR-064** (IETF *Updates* analog) by amending the Decision text and the structural-prevention claim. ADR-064's Context (compound check architecture, fails-safe-to-allow rationale, scope discipline, housekeeping framing, advisory-mode-vs-enforcement-mode) and the dispatch-log mechanism remain authoritative.

### 1. Phase-manifest check is advisory across all modes

The Stop hook's per-phase manifest check (existence + size floor + required-headers + required-fields assertions for each required mechanism's expected artifact) **does not block** under any condition. It emits a model-visible advisory naming each failing mechanism. The advisory is the same content ADR-064 specified for the block reason; only the hook's exit code changes (from block to allow-with-advisory).

The advisory is repeated on every Stop event until the artifact appears or the `**In-progress phase:**` field is set. Repeated firing is the visibility mechanism that makes the missing artifact hard to ignore; the agent sees the advisory each turn and is expected to surface it to the user.

The advisory's content includes:
- The missing mechanism (e.g., "argument-auditor for cycle 017").
- The expected canonical path (e.g., `.rdd/audits/argument-audit-decide-017.md` post-ADR-085 migration).
- The four-failure-mode classification ADR-064 specified (missing artifact + no dispatch log entry; missing artifact + dispatch log entry exists; artifact exists + no dispatch log entry — fabrication signal; artifact exists + structural assertion failure).
- An explicit instruction reminding the agent that fabricating the artifact in-context to silence the advisory is a structural violation, not a workaround.

### 2. Compound check is advisory but retained

ADR-064's compound check (PostToolUse Agent dispatch log + Stop-hook cross-reference) **continues to fire**. Its finding is surfaced as an advisory rather than as a block. The State-C-fabrication-detection mechanism is unchanged: an artifact at the expected path with no corresponding dispatch log entry is flagged as a fabrication signal. The flag is advisory; it appears in the model-visible Stop-hook output and the agent is expected to surface it.

The compound check's structural argument shifts:
- **Before v0.8.3.** "State C becomes structurally impossible because fabrication would require inducing a fake PostToolUse event, which the agent cannot do, AND the Stop hook blocks on detection."
- **After v0.8.3.** "State C becomes structurally **detectable** (not impossible) because fabrication would require inducing a fake PostToolUse event, which the agent cannot do; the detection surfaces as an advisory; the practitioner sees the signal and decides whether to address it."

The detection-vs-prevention distinction is the load-bearing change. The compound check's mechanism (cross-referencing dispatches against artifacts) catches fabrication when fabrication occurs; the practitioner is responsible for the response.

### 3. Skill-text discipline is the load-bearing enforcement layer

With the manifest check advisory and the compound check advisory, the load-bearing enforcement layer becomes **skill text**:

- ADR-065's anchored dispatches (citation auditor, argument auditor, susceptibility-snapshot evaluator at structurally privileged positions in phase skills) are the primary mechanism that causes Tier 1 dispatches to fire.
- The dispatch log (PostToolUse) records every fired dispatch, providing the evidence that skill-anchored dispatches actually fired.
- The phase-manifest advisory provides a phase-end visibility check: at the Stop event closing each phase, the practitioner sees whether all expected artifacts are present.

The methodology's structural prevention against the failure modes ADR-064 named (Cycle 9 Items 1–5) shifts from "blocked at Stop event" to "anchored at skill text + visible at Stop advisory." The anchored-at-skill-text component continues to provide 100% historical dispatch coverage for the existing Tier 1 mechanisms (per Spike S3 in essay 014). The Stop advisory adds visibility, not enforcement.

### 4. Honest scope-of-claim — what the Harness Layer guarantees in v0.8.3

The Harness Layer's positive scope after this ADR:
- Records every Tier 1 subagent dispatch in the dispatch log (PostToolUse Agent hook). Coverage: every dispatch.
- Cross-references required artifacts against the dispatch log at phase end (Stop hook compound check). Coverage: structural-assertion-passing artifacts that lack a corresponding dispatch are detectable.
- Surfaces missing artifacts and fabrication signals as model-visible advisories. Coverage: every failing case is visible to the agent and (via agent surfacing) to the practitioner.

The Harness Layer's negative scope:
- **Does not** prevent the agent from proceeding past a missing-artifact advisory.
- **Does not** prevent the agent from fabricating an artifact in-context after seeing a fabrication-signal advisory.
- **Does not** mechanically force re-dispatch when an audited document is modified after the most recent dispatch (the revision-aware re-audit reminder from ADR-064 §"Revision-aware re-audit reminder" is also advisory).

Practitioners wanting stricter enforcement (the original blocking semantic) can configure their workflow to halt on advisory presence — but the methodology does not impose this. The advisory-by-default disposition is the v0.8.3 commitment.

### 5. The "structurally impossible for the four addressed failure modes — in enforcement mode" claim is amended

ADR-064's original Consequences section claimed structural impossibility of State C in enforcement mode. The amended claim:

> The Harness Layer makes State C **structurally detectable** for the four addressed failure modes (Cycle 9 Items 1–4 plus Item 5 via path convention). Detection surfaces as a model-visible advisory at the next Stop event. The structural argument — fabrication requires inducing a fake PostToolUse event, which the agent cannot do — provides the detection guarantee. The methodology does not mechanically prevent fabrication after detection; the practitioner is responsible for the response.

Future ADRs and methodology language citing ADR-064 for the State-C guarantee should cite the **detectability** claim, not the **impossibility** claim. The original ADR-064 body retains the impossibility language as historical record; this amendment updates the active-authority claim.

### 6. The In-progress phase predicate's role is amended

The `**In-progress phase:**` field, introduced in v0.8.2 as a load-bearing predicate that short-circuits the blocking manifest check, is amended in role: it is now an **advisory-noise suppressor**. With the manifest check advisory rather than blocking, the predicate's function is to reduce noise during phase work (the agent does not see the same advisory on every turn while the phase is actively progressing) rather than to prevent blocking.

The predicate continues to be set at phase entry by the orchestrator and removed at phase-exit readiness, per the orchestrator skill's existing protocol. ADR-090 documents the role shift in detail.

## Rejected alternatives

**Restore the blocking manifest check.** Rejected. The Pause-2 diagnosis identified that the blocking semantic was never effective at the agent-experience level — Claude Code feeds the block reason as next-turn context, and the agent processes it as a remediation prompt rather than as a wall. The user's diagnosis: *"the Stop-hook block was never a real wall."* Restoring the blocking semantic would not produce the structural prevention ADR-064 originally claimed; it would produce a more heavy-handed version of the noisy-loop failure mode v0.8.3 fixed.

**Demote the compound check entirely (drop the dispatch log + cross-reference mechanism).** Rejected. The compound check's detection capability is the only structural defense against sophisticated State C fabrication. Demoting the mechanism's enforcement to advisory does not require demoting the mechanism itself. The dispatch log is cheap to produce (PostToolUse hook appends one JSONL line per Tier 1 dispatch); the cross-reference is cheap to evaluate (file existence + JSONL grep). The mechanism remains.

**Demote the manifest check while retaining the compound check as blocking.** Considered. The split would mean: missing artifacts emit advisory, but artifacts with missing dispatch log entries (fabrication signal) emit block. Rejected because the block-vs-advisory split would reintroduce the same noisy-loop failure mode in a narrower scope — a fabrication signal would block on every Stop until the fabrication is addressed. Re-dispatching is the correct response to a fabrication signal (it produces a genuine artifact and a matching dispatch log entry), but the fabrication-signal block would cascade if re-dispatch fails (subagent unavailable at runtime, tool permissions error, model API rate-limiting): the agent would have no non-blocking resolution path, and the next Stop would re-fire the block with the same content. The specific failure mode is "failed re-dispatch loop," not generic "churn." Advisory across the board is the structurally consistent disposition that surfaces the fabrication signal without exposing the cycle to this loop.

**Make the advisory configurable per-corpus (advisory by default, blocking opt-in).** Considered. Rejected for v1 — adding a configuration option introduces a methodology-level setting that practitioners must understand and choose. The default-advisory disposition with skill-discipline as load-bearing is the cycle's commitment; future cycles that observe practitioners wanting blocking semantics can revisit the configurable disposition.

**Defer the ADR amendment until empirical evidence about advisory-vs-blocking is available.** Rejected. v0.8.3's release already shipped the advisory demotion; the ADR amendment lands the methodology's authoritative documentation in the same direction. Deferring the amendment would leave ADR-064's body claiming a guarantee the implementation no longer delivers — exactly the silent-drift failure mode ADR-074's body-immutability rule addresses.

## Consequences

**Positive:**

- The methodology's structural-prevention claim is calibrated to what v0.8.3 actually delivers. ADR-064's overstated guarantee is replaced with the honest detection-vs-prevention framing.
- The compound check's State-C-detection mechanism is preserved. Practitioners who observe a fabrication-signal advisory have the structural information they need to investigate; the methodology's documentation matches the implementation.
- Skill-text anchoring (ADR-065) is named explicitly as the load-bearing enforcement layer. The methodology's actual prevention happens in skill text; the harness adds visibility. This is the correct primacy ordering for the v0.8.3 implementation.
- The amendment is honest scope-of-claim — practitioners adopting RDD on the structural-prevention framing have the v0.8.3 reality reflected in the active authority. ADR-074's body-immutability rule is honored: ADR-064's body is preserved; this ADR carries the updated claim with explicit supersession header on ADR-064.

**Negative:**

- The Harness Layer's enforcement strength is reduced relative to ADR-064's original framing. Practitioners who relied on the blocking semantic for psychological safety (the methodology will catch me if I forget) lose that affordance. Mitigation: the advisory mechanism still surfaces the failure visibly; the catch-mechanism is intact, only the wedge-mechanism is removed.
- The amendment requires updating downstream-artifact references that cite ADR-064's State-C-impossibility claim. Per ADR-074 Step 3, the four-artifact downstream sweep applies (system-design.md, ORIENTATION.md, domain-model.md, field-guide.md). These updates are deferred to ARCHITECT and BUILD per the same deferral pattern ADR-085 uses; deferred-sweep rationale is recorded in cycle-status.md.
- Practitioners who deeply understood ADR-064's blocking claim may experience the amendment as a methodology weakening. Mitigation: the amendment is calibration to actual implementation; the original claim was never delivered as advertised (the user's Pause-2 diagnosis identified this), so the amendment closes a documentation-vs-implementation gap rather than weakening the methodology.

**Neutral:**

- The PostToolUse Agent dispatch hook implementation is unchanged. Only the Stop hook's exit-code disposition changes (block → allow-with-advisory).
- The dispatch log format (JSONL with `timestamp, session_id, mechanism, subagent_type, expected_path, tool_use_id`) is unchanged.
- The advisory-mode-vs-enforcement-mode framing for pre-migration corpora (ADR-064 §"Advisory mode for pre-migration corpora") is unchanged in mechanism; the post-migration "enforcement mode" no longer means blocking, it means advisory-with-compound-check rather than advisory-only. The semantic of "enforcement mode" shifts; the migration-version-marker mechanism is unchanged.
- The fails-safe-to-allow disposition (ADR-064 §"Fails-Safe-to-Allow") is unchanged. Internal hook-script errors continue to emit allow-with-stderr-notice.
- The revision-aware re-audit reminder (ADR-064 §"Revision-aware re-audit reminder") was already non-blocking advisory; this ADR aligns the rest of the manifest check with that disposition.

## ADR-064 supersession header to apply

Per ADR-074 Step 2.5 supersession workflow, ADR-064 receives the following header at the top of its file (immediately below the `# ADR-064:` title):

```markdown
> **Updated by ADR-088 on 2026-04-27.** ADR-088 amends the Stop hook's manifest check from blocking to advisory across all modes (v0.8.3 release). The compound check mechanism (PostToolUse dispatch log + Stop-hook cross-reference) is retained but its finding is surfaced as advisory rather than as block. The State-C "structurally impossible" claim is amended to "structurally detectable." Skill-text anchoring (ADR-065) is the load-bearing enforcement layer; the Harness Layer adds visibility and detection.
>
> **Two specific reading-time notes for navigating ADR-064's preserved body:**
>
> 1. **"Enforcement mode" semantic shift.** ADR-064's Advisory mode subsection defines "enforcement mode" as the state a corpus enters when the migration-version marker is present, in which "the compound check runs as specified in Hook 2 above." After ADR-088, "enforcement mode" continues to mean "compound-check active" but no longer means "blocking." Practitioners composing ADR-064 with ADR-088 should read "enforcement mode" as "advisory disposition with compound-check cross-reference," not as "blocking with compound check." The migration-version marker mechanism is unchanged; only the disposition the marker enables is amended.
>
> 2. **Stale `docs/housekeeping/` paths in ADR-064's preserved body.** Once ADR-085's `.rdd/` migration runs, the path references throughout ADR-064's Decision section (`docs/housekeeping/dispatch-log.jsonl`, `docs/housekeeping/.migration-version`, the housekeeping directory framing) become historical record of what the paths were when ADR-064 was authored. ADR-074's body-immutability rule prevents correcting these in ADR-064's body. The active path authority post-migration is ADR-085. This is an expected artifact of body immutability + path migration together; it is named here so readers of ADR-064 know which paths are historical and which are active.
```

ADR-064's Status field updates to `Updated by ADR-088`.

This is a **partial supersession** (IETF *Updates* analog). ADR-064's compound check architecture, fails-safe-to-allow rationale, scope discipline, housekeeping framing, advisory-mode-vs-enforcement-mode commitment, and revision-aware re-audit reminder all remain current authority. ADR-088 updates the enforcement disposition (block → advisory) and the State-C claim (impossibility → detectability).

## Downstream artifact sweep status (per ADR-074 Step 3)

Required updates to current-state artifacts:

| Artifact | Status | Notes |
|---|---|---|
| `system-design.md` | **Deferred to ARCHITECT (Cycle 017)** | The ARCHITECT phase will restructure system-design.md per essay 016 §6; the ADR-064 references update at that time. Deferred-sweep rationale recorded in cycle-status.md. |
| `ORIENTATION.md` | **Deferred to ARCHITECT (Cycle 017)** | Section 4 references infrastructure including the manifest mechanism; updates fold into the ORIENTATION regeneration. Deferred-sweep rationale recorded. |
| `domain-model.md` | **At MODEL Amendment 22 in this cycle** | The Compound Check concept's encoding shifts from "blocking enforcement" to "advisory detection." MODEL-phase amendment captures this; if this ADR's amendment lands during DECIDE, the domain model can capture it during DECIDE rather than waiting for ARCHITECT. The amendment is small (one concept update). |
| `field-guide.md` | **Deferred to BUILD (Cycle 017)** | The field-guide regenerates at BUILD completion; references to ADR-064's blocking claim update at that time. Deferred-sweep rationale recorded. |

The deferred sweeps are recorded in `.rdd/cycle-status.md` (post-ADR-085 migration path; pre-migration `docs/housekeeping/cycle-status.md`) under the DECIDE phase status entry.

## Provenance check

- **The diagnosis that ADR-064's blocking semantic was never effective at agent-experience level:** user-articulated at Pause 2 (recorded in cycle-status.md Pause Log entry 2). Driver-derived; user-surfaced.
- **The v0.8.3 advisory demotion as the implementation:** shipped as v0.8.3 release before this ADR's drafting. Implementation-derived; the ADR captures the methodology-level commitment that the implementation already represents.
- **The detection-vs-prevention reframe:** drafting-time synthesis. The detection capability is essay-014-grounded (the compound check's structural argument about fake PostToolUse events); the prevention claim's amendment to detection is agent composition responsive to the Pause-2 diagnosis. Agent composition; user-surfaced concern.
- **Skill-text anchoring as load-bearing enforcement layer:** essay 014 §7 (the Skill-Structure Layer is primary for mechanisms that can be step-anchored); ADR-065's framing of skill-anchored dispatches with 100% historical coverage. Driver-derived; restated here for the v0.8.3 amendment context.
- **The honest-scope-of-claim positive/negative listing:** drafting-time synthesis applying ADR-069's scope-of-claim framing to the v0.8.3 reality. Agent composition; ADR-069-derived.
- **The In-progress phase predicate role amendment:** user-articulated at Pause 2; documented in detail in ADR-090. Driver-derived; user-surfaced.
- **The deferred-sweep rationale (per ADR-074 fitness property):** ADR-074's pattern. Driver-derived.

**Result:** The diagnosis (blocking was never effective) is user-surfaced. The detection-vs-prevention reframe and the honest-scope-of-claim listing are agent-composed against driver-derived material (essay 014, ADR-065, ADR-069, ADR-074). The amendment is a partial supersession with explicit Updates header on ADR-064. No synthesis-moment framing adoption detected.
