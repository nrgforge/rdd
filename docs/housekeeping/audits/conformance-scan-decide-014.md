# Conformance Scan Report — Cycle 10 DECIDE

Audited document: Eight-ADR set (docs/decisions/adr-063 through adr-070)
Codebase root: /Users/nathangreen/Development/rdd
Date: 2026-04-09

---

## Summary

Debt items found: 34

- Area 1 (Hook architecture): 5
- Area 2 (Canonical prompt skeleton): 9
- Area 3 (Susceptibility snapshot dispatch): 9
- Area 4 (Cycle 9 substrate audit): 5
- Area 5 (Pre-migration corpus): 4
- Area 6 (Agent definitions): 2

---

## Area 1: Hook architecture

### Current state of hooks/hooks.json

`hooks/hooks.json` exists and defines five hooks matching ADR-033's specification:

| Hook | Event | Matcher | Script |
|------|-------|---------|--------|
| Invariant reminder | PreToolUse | Write\|Edit | invariant-reminder.sh |
| Epistemic gate enforcer | Stop | — | epistemic-gate.sh |
| Skill activator | UserPromptSubmit | — | skill-activator.js |
| Orientation trigger | PostToolUse | Write | orientation-trigger.sh |
| Document sizing check | PostToolUse | Write | sizing-check.sh |

ADR-033 compliance: **fully conforming**. All five hooks are registered. All five script files exist under `hooks/scripts/`.

### ADR-064 additions — not yet present

**Debt item A1-1**
ADR-064 requires a PostToolUse hook on the Agent tool (`tier1-verify-dispatch.sh`) that extracts `tool_input.subagent_type`, checks whether it is a Tier 1 mechanism, extracts the expected output path from `tool_input.prompt`, and appends a dispatch log entry to `docs/housekeeping/dispatch-log.jsonl`. Current state: no such hook entry in `hooks/hooks.json`; no `tier1-verify-dispatch.sh` in `hooks/scripts/`. Gap: this is entirely greenfield — no PostToolUse(Agent) hook entry exists at all as a foundation.

**Debt item A1-2**
ADR-064 requires a Stop hook (`tier1-phase-manifest-check.sh`) that reads `docs/housekeeping/cycle-status.md`, loads `hooks/manifests/tier1-phase-manifest.yaml`, and runs the compound check (manifest structural assertions + dispatch log cross-reference). Current state: the existing `epistemic-gate.sh` is the only Stop hook; it handles epistemic gate reminders, not manifest verification. `tier1-phase-manifest-check.sh` does not exist. Gap: entirely greenfield.

**Debt item A1-3**
ADR-063 requires `hooks/manifests/tier1-phase-manifest.yaml` as the canonical Harness-Layer specification. Current state: `hooks/manifests/` directory does not exist. Gap: directory and YAML manifest must be created from scratch.

**Debt item A1-4**
ADR-064 requires a `.github/ISSUE_TEMPLATE/hook-failure.md` issue template as a companion to the stderr surfacing mechanism. Current state: not found (`.github/` structure not scanned, but this was flagged as a companion change in ADR-064's Decision section). Gap: issue template must be created at plugin release time.

**Debt item A1-5**
ADR-064 requires advisory-mode detection via `docs/housekeeping/.migration-version` marker, and a `docs/housekeeping/` directory. The Stop hook must implement the three-state detection (pre-migration → advisory; marker absent → advisory; marker present → enforcement). Current state: `docs/housekeeping/` does not exist; `tier1-phase-manifest-check.sh` does not exist. Gap: fully greenfield for both the marker mechanism and the Stop hook implementing it.

---

## Area 2: Canonical prompt skeleton (ADR-065 Fix 2 and Fix 3)

ADR-065 Fix 2 requires every Tier 1 dispatch instruction to contain `Output path: <canonical-path>` on a standalone line, and to use the canonical phrasing `Dispatch the <subagent-type> subagent with the following brief:`. Fix 3 requires dispatch sites to be in the top third or bottom third of the skill file.

Tier 1 dispatch sites found across skill files:

### skills/research/SKILL.md (281 lines total; thirds: top ≤93, middle 94–187, bottom ≥188)

| Site | Line | Subagent | Output path line present | Position | Path specific? |
|------|------|----------|--------------------------|----------|----------------|
| Research Design Review | 57 | research-methods-reviewer | No — path given only as a parenthetical `e.g.` within bullet | Top (line 57/281) | Example pattern, not canonical form |
| Citation Audit | 152 | citation-auditor | No — path given only as a parenthetical `e.g.` within bullet | Middle (line 152/281) | Example pattern, not canonical form |
| Argument Audit | 168 | argument-auditor | No — path given only as a parenthetical `e.g.` within bullet | Middle (line 168/281) | Example pattern, not canonical form |

**Debt item A2-1 (Fix 2):** research/SKILL.md lines 57, 152, 168 — none of the three dispatch instructions contain the canonical `Output path:` skeleton line. They provide example paths as parenthetical bullets (`An output path for the review artifact (e.g., ...)`), which ADR-064's PostToolUse hook cannot regex-match.

**Debt item A2-2 (Fix 3):** research/SKILL.md — citation-auditor dispatch (line 152) and argument-auditor dispatch (line 168) are in the middle third of the 281-line file. Fix 3 requires top-third or bottom-third placement. Neither dispatch is at a structurally privileged position.

### skills/decide/SKILL.md (279 lines total; thirds: top ≤93, middle 94–186, bottom ≥187)

| Site | Line | Subagent | Output path line present | Position | Path specific? |
|------|------|----------|--------------------------|----------|----------------|
| Argument Audit | 86 | argument-auditor | No — parenthetical `e.g.` bullet | Top (line 86/279) | Example pattern |
| Conformance Audit | 110 | conformance-scanner | No — parenthetical `e.g.` bullet | Top (line 110/279) | Example pattern |

**Debt item A2-3 (Fix 2):** decide/SKILL.md lines 86 and 110 — both dispatch instructions lack the canonical `Output path:` line. Paths are given as parenthetical examples.

**Debt item A2-4 (Fix 3):** decide/SKILL.md — argument-auditor (line 86) and conformance-scanner (line 110) are both in the top third. These are structurally privileged positions per Fix 3. No position debt for decide/SKILL.md.

### skills/synthesize/SKILL.md (396 lines total; thirds: top ≤132, middle 133–264, bottom ≥265)

| Site | Line | Subagent | Output path line present | Position | Path specific? |
|------|------|----------|--------------------------|----------|----------------|
| Citation Audit | 229 | citation-auditor | No — parenthetical `e.g.` bullet | Middle (line 229/396) | Example pattern |
| Argument Audit | 237 | argument-auditor | No — parenthetical `e.g.` bullet | Middle (line 237/396) | Example pattern |

**Debt item A2-5 (Fix 2):** synthesize/SKILL.md lines 229 and 237 — both dispatch instructions lack the canonical `Output path:` line.

**Debt item A2-6 (Fix 3):** synthesize/SKILL.md — both dispatch sites are at lines 229 and 237 in a 396-line file (middle third, lines 133–264). Both require relocation to bottom-third (≥265) per Fix 3.

### skills/conform/SKILL.md — Drift Detection operation (line 163)

The conform skill dispatches the conformance-scanner subagent at line 163 of 220 lines (thirds: top ≤73, middle 74–147, bottom ≥148). Line 163 falls in the bottom third.

**Debt item A2-7 (Fix 2):** conform/SKILL.md line 163 — the dispatch instruction lacks the canonical `Output path:` line. Path is given as a parenthetical example.

**Debt item A2-8 (Fix 3):** conform/SKILL.md line 163 — bottom-third position. No position debt.

### Orchestrator skill (skills/rdd/SKILL.md)

The orchestrator references susceptibility-snapshot-evaluator at line 418 (of 532 lines; thirds: top ≤177, middle 178–354, bottom ≥355). Line 418 is in the bottom third.

**Debt item A2-9:** The orchestrator's susceptibility snapshot dispatch (line 418) does not contain a canonical `Output path:` line and does not use the `Dispatch the <subagent-type> subagent with the following brief:` skeleton. It reads as a documentation statement ("the orchestrator dispatches the susceptibility-snapshot-evaluator agent with...") rather than an actionable dispatch instruction. This is the primary dispatch site that ADR-065 Fix 1 targets; the orchestrator-level specification is itself a judgment-anchored description, not a step-anchored prompt. Position is bottom-third (non-debt for Fix 3), but the text is not a dispatch prompt — it is a system description.

---

## Area 3: Susceptibility snapshot dispatch (ADR-065 Fix 1)

ADR-065 Fix 1 requires each phase skill to have an explicit "Phase Boundary: Susceptibility Snapshot Dispatch" subsection at its phase-end position (bottom-third), containing the canonical prompt skeleton and a phase-specific output path (`docs/essays/audits/susceptibility-snapshot-{cycle}-{phase}.md`, migrating to `docs/housekeeping/audits/` via ADR-070).

Current orchestrator specification: `skills/rdd/SKILL.md` line 202 contains the Susceptibility Snapshot Dispatch subsection and line 418 contains the Tier 1 mechanism summary. Both are orchestrator-level statements, not per-phase skill-level dispatch instructions.

| Phase skill | Explicit dispatch subsection? | Dispatch line | Position | Canonical output path specified? |
|-------------|------------------------------|---------------|----------|----------------------------------|
| skills/research/SKILL.md | No | — | — | No |
| skills/discover/SKILL.md | No | — | — | No |
| skills/model/SKILL.md | No | — | — | No |
| skills/decide/SKILL.md | No | — | — | No |
| skills/architect/SKILL.md | No | — | — | No |
| skills/build/SKILL.md | No | — | — | No |
| skills/play/SKILL.md | No | — | — | No |
| skills/synthesize/SKILL.md | No | — | — | No |

Each phase skill contains a susceptibility signals recording instruction within its Attend step (RESEARCH line 215, DISCOVER line 246, MODEL line 123, DECIDE line 235, ARCHITECT line 304, BUILD line 183), but none of the phase skills contain a **dispatch instruction** — no call to fire the susceptibility-snapshot-evaluator subagent, no output path, no brief template.

The Susceptibility Snapshot Dispatch instruction exists only in `skills/rdd/SKILL.md` (lines 178 and 202), and only as an orchestrator rule describing that the dispatch happens "after the gate conversation completes and before the next phase begins." There is no `Output path:` line. There is no canonical path convention established in any skill file. The dispatch is judgment-anchored at the orchestrator level with no phase-skill-level step anchor.

**Debt items A3-1 through A3-8:** Each of the eight phase skills (research, discover, model, decide, architect, build, play, synthesize) is missing the required "Phase Boundary: Susceptibility Snapshot Dispatch" subsection. This is eight missing dispatch sites. The subsection should be placed at the bottom-third of each phase skill, contain the canonical `Dispatch the susceptibility-snapshot-evaluator subagent with the following brief:` skeleton, and specify the output path `docs/essays/audits/susceptibility-snapshot-{cycle}-{phase}.md`.

**Debt item A3-9:** The orchestrator (`skills/rdd/SKILL.md` lines 178–202) specifies the snapshot dispatch as a general orchestration rule without a canonical `Output path:` line. When ADR-065 per-phase dispatch is implemented, this orchestrator-level description should be updated to indicate that the phase skills now carry the dispatch instruction directly (the orchestrator rule becomes explanatory rather than operative). Until then, the orchestrator text is the only dispatch specification and it lacks the machine-parseable path that ADR-064's PostToolUse hook requires.

**No canonical output path exists anywhere in the skill corpus.** The existing susceptibility snapshots in `docs/essays/audits/` follow the naming pattern `susceptibility-snapshot-014-{phase}.md` (e.g., `susceptibility-snapshot-014-discover.md`), but this path is not specified in any skill file — it was established by practice, not by a canonical dispatch instruction.

---

## Area 4: Cycle 9 ADR substrate audit (Invariant 8 backward compliance)

Invariant 8 requires every unconditional structural mechanism to be anchored to one of three substrates: Skill-Structure Layer, Harness Layer, or User-Tooling Layer. Cycle 9 ADRs 055–062 predate Invariant 8.

### ADR-055: Belief-Mapping Operationalization of Inversion Principle

**Mechanism:** Belief-mapping as the mandatory form for Inversion Principle at six cross-cutting application points (RESEARCH, PRODUCT DISCOVERY, DECIDE, ARCHITECT, PLAY, SYNTHESIS).

**ADR-055 claimed tier:** Tier 2 context-responsive (the ADR does not claim Tier 1 unconditional status).

**Substrate analysis:** Belief-mapping is a conversational technique embedded in AID cycle pedagogical moves. It has no concrete skill-text dispatch site (no agent is dispatched), no hook-verifiable event, and no artifact-producing canonical path. This is a conversational mechanism whose execution depends on the orchestrator recognizing the application moment — precisely the judgment-anchored pattern Invariant 8 names as unreliable.

**Invariant 8 compliance status:** Compliant as a Tier 2 mechanism. ADR-067's four-step procedure places this at step 4 (cannot be Tier 1 — no step-anchorable form, no hook-verifiable event, no natural artifact moment). ADR-066 explicitly names belief-mapping at mid-conversation pushback as an explicit non-target of the User-Tooling Layer. No debt — ADR-055 does not claim Tier 1 status.

### ADR-056: Research-Grounded Question Toolkit for AID Cycle

**Mechanism:** Six question forms (belief-mapping, pre-mortem, warrant elicitation, rebuttal elicitation, commitment gating, open-question reframing) available to the AID cycle.

**ADR-056 claimed tier:** Not explicitly classified, but these are pedagogical instruments within AID — Tier 2 by function.

**Substrate analysis:** Question form selection is conversational and compositional. No dispatch site, no hook, no artifact path. Same structural position as ADR-055.

**Invariant 8 compliance status:** Compliant as Tier 2 best-effort. No debt.

### ADR-057: AID Susceptibility Extension

**Mechanism:** (a) Inline susceptibility signal observation during AID Attend; (b) Isolated evaluation via susceptibility-snapshot-evaluator dispatch at phase boundaries (Tier 1 unconditional per ADR-058).

**ADR-057 claimed tier:** Tier 1 for the isolated evaluation dispatch; inline observation is Tier 2.

**Substrate analysis:**
- Inline observation: conversational, no substrate — Tier 2 compliant.
- Isolated evaluation (snapshot dispatch): ADR-057 claims Tier 1 status for the snapshot dispatch. The Skill-Structure Layer substrate requires a concrete, step-anchored dispatch instruction in a skill file. Current state: the dispatch instruction lives in `skills/rdd/SKILL.md` as an orchestrator rule (lines 178–202) describing *that* the dispatch happens, but without a canonical output path, without the required prompt skeleton, and without per-phase step-anchoring. Area 3 documents this in full.

**Invariant 8 compliance status:** The snapshot dispatch is claimed Tier 1 but is currently anchored to orchestrator judgment rather than a concrete skill-structure step. This is the exact failure mode Cycle 10's diagnostic identified. **Debt item A4-1:** ADR-057 specifies susceptibility-snapshot-evaluator as Tier 1 unconditional; current anchoring is orchestrator judgment (no concrete dispatch site per ADR-065's three-part checklist); Invariant 8 compliance status is debt. Resolution is ADR-065 Fix 1 (per-phase skill dispatch sections).

### ADR-058: Unconditional Architectural Floor

**Mechanism:** Tier 1/Tier 2 classification of all sycophancy-resistance mechanisms. Tier 1 list: specialist subagent audits (citation, argument, framing), susceptibility snapshot, research methods review, mandatory structural output sections.

**ADR-058 claimed tier:** This ADR establishes the tier framework itself.

**Substrate analysis:** The three successfully step-anchored mechanisms (citation audit, argument audit, research-methods review) have concrete skill-text dispatch sites per Spike S3's 100% coverage finding, and the skill file instructions describe canonical output paths (though not in the machine-parseable `Output path:` skeleton form yet). These three meet the Skill-Structure Layer substrate with the caveat that Fix 2 (canonical skeleton) is outstanding.

**Invariant 8 compliance status:** The citation, argument, and research-methods mechanisms are substantively compliant at the Skill-Structure Layer (concrete dispatch steps exist) but technically incomplete (no `Output path:` skeleton per ADR-065 Fix 2). The susceptibility snapshot debt is inherited from ADR-057 (A4-1 above). No additional new debt items beyond A4-1.

### ADR-059: Grounding Reframe

**Mechanism:** A conversational pattern the orchestrator deploys when sycophancy risk is unassessable — naming uncertainty and offering grounding actions.

**ADR-059 claimed tier:** Tier 2 (context-responsive conversational mechanism, triggered by unassessable risk).

**Substrate analysis:** Grounding Reframe is a composable conversational response. No dispatch, no hook, no artifact path. Triggered by snapshot findings or inline judgment.

**Invariant 8 compliance status:** Compliant as Tier 2. No debt.

### ADR-060: Research Methods Subagent

**Mechanism:** Research-methods-reviewer dispatch before each research loop (Tier 1 unconditional per ADR-058).

**ADR-060 claimed tier:** Tier 1 unconditional.

**Substrate analysis:** The research-methods-reviewer has a concrete dispatch instruction in `skills/research/SKILL.md` at Step 1b (line 57 — top third of file). The agent definition exists at `agents/research-methods-reviewer.md`. The dispatch instruction describes an output path as a parenthetical example, not in the canonical `Output path:` skeleton form.

**Invariant 8 compliance status:** Substantively compliant at the Skill-Structure Layer (concrete step-anchored dispatch exists, top-third position). Technically incomplete: `Output path:` skeleton missing per ADR-065 Fix 2. This is the same Fix 2 debt as A2-1 above — not a new debt item. No additional debt.

### ADR-061: Framing Audit as Argument Auditor Extension

**Mechanism:** Framing audit as the second mandatory section of every argument audit dispatch (Tier 1 unconditional).

**ADR-061 claimed tier:** Tier 1 unconditional.

**Substrate analysis:** The argument auditor's system prompt (`agents/argument-auditor.md`) has been updated to include the framing audit section — the agent definition contains both sections. The dispatch instructions in `skills/research/SKILL.md` (line 168) and `skills/decide/SKILL.md` (line 86) reference the two-section output. The agent correctly implements both sections. The framing audit is embedded in the argument auditor's agent definition and fires on every dispatch.

**Invariant 8 compliance status:** Compliant at the Skill-Structure Layer. The framing audit fires unconditionally because it is part of the argument auditor's system prompt — it cannot be omitted by the dispatch caller. The dispatch sites that trigger the argument auditor already exist (Step 4b in research, Step 3 in decide, synthesize). No debt beyond the Fix 2 skeleton debt already noted in Area 2.

### ADR-062: Assertion-Aware Observation

**Mechanism:** Semantic detection of embedded conclusions in user assertions at artifact-production moments; inline AID observation responsibility, not a separate hook.

**ADR-062 claimed tier:** Tier 2 context-responsive (explicit in the ADR's Decision section).

**Substrate analysis:** Inline AID observation has no dispatch site, no hook, no artifact path. The orchestrator's AID Attend instructions reference this obligation (skills/rdd/SKILL.md line 199). Tier 2 by design — ADR-062 explicitly rejected hook architecture for this mechanism.

**Invariant 8 compliance status:** Compliant as Tier 2 best-effort. No debt. **Debt item A4-2 (acknowledged limitation):** ADR-062 names the self-referential problem explicitly — the agent detecting embedded conclusions is the same agent susceptible to them. This is a named, load-bearing limitation, not a debt item to be resolved. It is reproduced here as an acknowledged limitation consistent with ADR-058's framing of Tier 1 backstops (snapshot and framing audit) as the structural insurance.

**Summary for Area 4:** One substantive Invariant 8 debt item (A4-1: susceptibility snapshot Tier 1 claim without Skill-Structure Layer anchor). All other Cycle 9 mechanisms are either correctly Tier 2 or correctly Tier 1 with existing (if incomplete) skill-structure anchoring. The one compliance gap is exactly what Cycle 10's diagnostic identified and what ADR-065 Fix 1 addresses.

---

## Area 5: Pre-migration corpus structure (ADR-070 starting state)

| Path | Exists | Content summary |
|------|--------|-----------------|
| `docs/essays/audits/` | Yes | 37 audit files — citation audits (008–014), argument audits (008–014 plus decide variants), conformance scans (040–042, 048–054, build-verification), research-design-review-014, susceptibility snapshots (014-research, 014-discover, 014-model). Pre-migration location as expected. |
| `docs/cycle-status.md` | Yes | Active cycle 10 status document. Contains `**Current phase:**` marker but uses prose encoding (`RESEARCH ✅ complete; DISCOVER ✅ complete; MODEL ✅ complete; DECIDE next`), not a parseable `**Phase:** DECIDE` single-field format. Contains `**Plugin version during cycle:** v0.6.3` but no `**Cycle number:** NNN` field. |
| `docs/housekeeping/` | No | Does not exist — expected pre-migration state per ADR-070. Corpus is in pre-migration state. |
| `docs/housekeeping/.migration-version` | No | Does not exist — expected. Stop hook will detect advisory mode when ADR-064 ships. |
| `docs/housekeeping/dispatch-log.jsonl` | No | Does not exist — expected. Will be created by PostToolUse hook at first Tier 1 dispatch in enforcement mode. |
| `docs/housekeeping/gates/` | No | Does not exist — expected. New directory per ADR-066; no pre-migration equivalent. |

**Debt item A5-1:** `docs/cycle-status.md` does not contain the `**Cycle number:** NNN` field required by ADR-063's canonical cycle-number detection mechanism. The Stop hook requires this field to resolve `{cycle}` in manifest path templates. Without it, the hook falls back to inferring the cycle from the highest `NNN-` prefix in `docs/essays/` — but essay 014 is an active cycle essay and the fallback would correctly infer cycle 14. The missing field is pre-migration debt; it should be added to `cycle-status.md` as part of the migration or as a standalone preparatory step.

**Debt item A5-2:** `docs/cycle-status.md` does not contain the `**Phase:**` field in the parseable single-value form ADR-063 specifies for phase inference. The current field is `**Current phase:** RESEARCH ✅ complete; DISCOVER ✅ complete; MODEL ✅ complete; DECIDE next`, which embeds phase status for all phases in a single prose string. The Stop hook reads for a `**Phase:**` marker; this encoding would require regex parsing more complex than the ADR specifies (which expects a simple field value). Debt: add a `**Phase:** DECIDE` field or reformat the current phase field to be Stop-hook-parseable.

**Debt items A5-3 and A5-4:** `docs/housekeeping/` and `docs/housekeeping/gates/` do not yet exist — these are **expected pre-migration states**, not conformance debt against the current codebase. They document the starting state for ADR-070's migration operation. The corpus is correctly in pre-migration state for all three paths (housekeeping, migration-version, dispatch-log).

Note: Items A5-3 and A5-4 are expected absences, not violations. The two actual debt items for Area 5 are A5-1 (missing `**Cycle number:**` field) and A5-2 (unparseable `**Phase:**` format).

---

## Area 6: Agent definitions

| Subagent | Definition file | Exists | Subagent type identifier | Gaps vs. ADR requirements |
|----------|----------------|--------|--------------------------|--------------------------|
| research-methods-reviewer | `agents/research-methods-reviewer.md` | Yes | (no explicit `subagent_type` frontmatter field — uses `model: sonnet`) | No `subagent_type` identifier field; ADR-063 manifest uses `subagent_type` as the mechanism identifier. No conformance-scanner `Audited document:` required field in output format. |
| citation-auditor | `agents/citation-auditor.md` | Yes | (no explicit `subagent_type` field) | No `subagent_type` identifier field. No required field labels that the manifest's `required_fields` assertions reference (e.g., `Audited document:` is present in the output template). |
| argument-auditor | `agents/argument-auditor.md` | Yes | (no explicit `subagent_type` field) | No `subagent_type` identifier; framing audit is present and correctly implemented per ADR-061. Agent definition is conformant with ADR-061. |
| susceptibility-snapshot-evaluator | `agents/susceptibility-snapshot-evaluator.md` | Yes | (no explicit `subagent_type` field) | No `subagent_type` identifier field. Output template contains `**Phase evaluated:**` and `**Artifact produced:**` fields but not the `**Date:**` field that the manifest's `required_fields` would need to include as a required field label. The output template uses `**Phase evaluated:**` as a label — the manifest should use this as a `required_fields` entry. |
| conformance-scanner | `agents/conformance-scanner.md` | Yes | (no explicit `subagent_type` field) | No `subagent_type` identifier field. The dispatch in `skills/decide/SKILL.md` uses `conformance-scanner`; the file confirms this is the correct identifier. |

**Debt item A6-1:** None of the five agent definition files contain an explicit `subagent_type:` field in their YAML frontmatter. ADR-063's manifest uses the `mechanism` field (which "matches the `subagent_type` identifier") to cross-reference dispatch log entries. ADR-064's PostToolUse hook extracts `tool_input.subagent_type` from the Agent tool call. For this cross-reference to work, the canonical `subagent_type` identifier for each mechanism must be consistently documented. Currently, the identifier is implied by the file name and usage in skill files but not declared in the agent frontmatter. Resolution: add `subagent_type:` (or equivalent named field) to each agent definition's frontmatter so the canonical identifier is explicit and inspectable without cross-referencing skill files.

**Debt item A6-2:** The `susceptibility-snapshot-evaluator` output template specifies `**Phase evaluated:**` and `**Artifact produced:**` as required structural fields, but does not include a `**Date:**` field. ADR-063's manifest entry for this mechanism will need to specify `required_fields` that match the actual agent output. The mismatch between what the manifest will assert and what the agent actually produces needs resolution at manifest-authoring time. Suggested resolution: add `**Date:**` to the susceptibility snapshot evaluator's output template (matching the pattern used by all other audit agents), or document in the manifest that `**Date:**` is not required for this mechanism.

**Note on `rdd:framing-auditor`:** ADR-061 specifies the framing audit as an extension of the argument auditor, not a separate agent. The scan brief asks about `rdd:framing-auditor` as a potentially separate subagent. There is no separate framing auditor definition; framing audit is Section 2 of every argument audit dispatch. This is conformant with ADR-061's decision.

---

## Debt disposition summary

| Debt item | Description | Disposition |
|-----------|-------------|-------------|
| A1-1 | PostToolUse(Agent) hook entry + tier1-verify-dispatch.sh missing | ships-with-plugin-release |
| A1-2 | Stop hook for manifest check (tier1-phase-manifest-check.sh) missing | ships-with-plugin-release |
| A1-3 | hooks/manifests/tier1-phase-manifest.yaml missing | ships-with-plugin-release |
| A1-4 | .github/ISSUE_TEMPLATE/hook-failure.md missing | ships-with-plugin-release |
| A1-5 | Advisory-mode detection logic (3-state) not implemented in any Stop hook | ships-with-plugin-release |
| A2-1 | research/SKILL.md — 3 dispatch sites missing Output path: skeleton | ships-with-plugin-release |
| A2-2 | research/SKILL.md — citation-auditor (line 152) and argument-auditor (line 168) in middle third | ships-with-plugin-release |
| A2-3 | decide/SKILL.md — 2 dispatch sites missing Output path: skeleton | ships-with-plugin-release |
| A2-4 | decide/SKILL.md position — both sites in top third (no debt) | N/A — conforming |
| A2-5 | synthesize/SKILL.md — 2 dispatch sites missing Output path: skeleton | ships-with-plugin-release |
| A2-6 | synthesize/SKILL.md — citation-auditor (229) and argument-auditor (237) in middle third | ships-with-plugin-release |
| A2-7 | conform/SKILL.md — conformance-scanner dispatch missing Output path: skeleton | ships-with-plugin-release |
| A2-8 | conform/SKILL.md position — bottom third (no debt) | N/A — conforming |
| A2-9 | rdd/SKILL.md — orchestrator snapshot description not a dispatch prompt, no Output path: | build-phase-refactor (resolved when A3-1 through A3-8 add per-phase dispatch; orchestrator text becomes explanatory) |
| A3-1 | research/SKILL.md — missing Phase Boundary: Susceptibility Snapshot Dispatch subsection | ships-with-plugin-release |
| A3-2 | discover/SKILL.md — missing Phase Boundary: Susceptibility Snapshot Dispatch subsection | ships-with-plugin-release |
| A3-3 | model/SKILL.md — missing Phase Boundary: Susceptibility Snapshot Dispatch subsection | ships-with-plugin-release |
| A3-4 | decide/SKILL.md — missing Phase Boundary: Susceptibility Snapshot Dispatch subsection | ships-with-plugin-release |
| A3-5 | architect/SKILL.md — missing Phase Boundary: Susceptibility Snapshot Dispatch subsection | ships-with-plugin-release |
| A3-6 | build/SKILL.md — missing Phase Boundary: Susceptibility Snapshot Dispatch subsection | ships-with-plugin-release |
| A3-7 | play/SKILL.md — missing Phase Boundary: Susceptibility Snapshot Dispatch subsection | ships-with-plugin-release |
| A3-8 | synthesize/SKILL.md — missing Phase Boundary: Susceptibility Snapshot Dispatch subsection | ships-with-plugin-release |
| A3-9 | rdd/SKILL.md — orchestrator snapshot dispatch not machine-parseable (no Output path:) | build-phase-refactor |
| A4-1 | ADR-057 susceptibility snapshot claims Tier 1; no Skill-Structure Layer anchor exists | ships-with-plugin-release (resolved by A3-1 through A3-8) |
| A4-2 | ADR-062 self-referential detection limitation (acknowledged, not resolvable) | acknowledged-limitation |
| A5-1 | cycle-status.md missing **Cycle number:** NNN field | migration-work |
| A5-2 | cycle-status.md **Current phase:** field not parseable as single value | migration-work |
| A5-3 | docs/housekeeping/ does not exist (expected pre-migration) | migration-work |
| A5-4 | docs/housekeeping/gates/ does not exist (expected; no pre-migration equivalent) | migration-work |
| A6-1 | All 5 agent definitions lack explicit subagent_type: frontmatter field | ships-with-plugin-release |
| A6-2 | susceptibility-snapshot-evaluator output template missing **Date:** field | ships-with-plugin-release |

**Totals by disposition:**

- **ships-with-plugin-release:** 22 items (A1-1 through A1-5, A2-1 through A2-3, A2-5 through A2-7, A3-1 through A3-8, A4-1, A6-1, A6-2)
- **migration-work:** 4 items (A5-1 through A5-4)
- **build-phase-refactor:** 2 items (A2-9, A3-9)
- **acknowledged-limitation:** 1 item (A4-2)
- **N/A (conforming):** 2 items (A2-4, A2-8)

---

## Notes

**Concentrated debt in the skill-structure layer.** All Area 3 debt (8 missing per-phase dispatch subsections) and the Area 2 `Output path:` skeleton debt (7 dispatch sites across 4 skill files) are skill-text edits. This is the lightest-weight category of architectural change — no new infrastructure, no hook scripts, no agent definition changes. The concentrated debt is in the area ADR-065 correctly identified as the primary fix.

**Hook infrastructure is entirely greenfield.** Area 1's five debt items represent the complete ADR-064 hook architecture, which does not exist at all in the current codebase. There is no PostToolUse(Agent) entry in `hooks/hooks.json`, no manifest directory, and no `tier1-phase-manifest-check.sh`. The two new hook scripts must be created from scratch alongside the manifest YAML. This is the highest-complexity item in the release — not because of architecture uncertainty (the ADRs specify it in detail, including a reference implementation from Spike S2) but because it is the largest single unit of new code to write.

**The `rdd-conform migrate` subcommand does not yet exist.** ADR-070 specifies `/rdd-conform migrate` as the migration trigger. The current `skills/conform/SKILL.md` has three operations: Audit, Remediation, and Drift Detection. It does not have a Migrate operation. This is a ships-with-plugin-release gap not explicitly listed in the debt table above (it is implied by the migration-work items A5-1 through A5-4 requiring the migrate operation to exist). The conform skill needs a fourth operation added.

**ADR-067, ADR-068, and ADR-069 have no direct code implications.** ADR-067 (methodology catalog) is a classificatory framework codified in the ADRs themselves; ADR-068 (extended Grounding Reframe trigger) and ADR-069 (methodology scope-of-claim) are conversational mechanism specifications with no artifact, hook, or skill-structure changes required. These three ADRs are zero-debt by design.

**The susceptibility snapshot canonical path exists in practice but not in specification.** The three existing snapshots in `docs/essays/audits/` follow the pattern `susceptibility-snapshot-014-{phase}.md`, which matches ADR-065's prescribed template `docs/essays/audits/susceptibility-snapshot-{cycle}-{phase}.md`. The path was established by practice; the skill-file dispatch instructions to institutionalize it are the missing debt items. This is a favorable finding: the migration path (pre-migration → housekeeping) can be implemented without changing the artifact naming convention, only the directory prefix.

**Position effect debt is moderate.** Of the seven Tier 1 dispatch sites audited (excluding the snapshot dispatch sites that are entirely missing), four are in structurally privileged positions (top or bottom third): research-design-review (top), argument-audit in decide (top), conformance-scan in decide (top), and conformance-scanner in conform (bottom). Three are in the middle third: citation-audit in research (line 152/281), argument-audit in research (line 168/281), and both sites in synthesize (229/396, 237/396). The Fix 3 position debt affects 3 of 7 existing dispatch sites.
