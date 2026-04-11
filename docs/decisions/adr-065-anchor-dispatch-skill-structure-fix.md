# ADR-065: Anchor Dispatch — Skill-Structure Fix for Step-Anchorable Mechanisms

**Status:** Proposed

## Context

Cycle 10's Spike S3 base-rate audit of the project corpus produced the diagnostic Essay 014 turns on: **mechanisms anchored to concrete workflow steps execute reliably (100% coverage) while mechanisms whose dispatch depends on orchestrator contextual judgment do not (0% coverage for the susceptibility-snapshot-evaluator before Cycle 10 itself).** The citation auditor, argument auditor, and research-methods reviewer each have a concrete, mechanically-unavoidable workflow step at which their dispatch is anchored ("after the essay is written," "before the first research loop," "after any revision of the audited document"). The susceptibility-snapshot-evaluator had no such step. Its dispatch instruction lived in the orchestrator `SKILL.md` as a general rule about "phase boundaries," which the orchestrator was expected to recognize contextually under task load. The recognition did not happen.

Essay 014 §5 line 101 names the direct fix: *"The susceptibility snapshot's 0% coverage rate is not primarily a hook problem but a skill-structure problem: nothing in the methodology currently names a specific, mechanically-unavoidable step at which the snapshot must fire. The direct fix is a skill edit — embed the dispatch at a concrete step the way the citation auditor is embedded at 'after the essay is written.' This should be the first move."*

The harness-layer compound check in ADR-064 is defense-in-depth on top of this fix, not a replacement for it. Per Essay 014 §5: *"Hooks are defense-in-depth on top of that fix, not a replacement for it."* The skill-structure layer is primary for any mechanism that can be step-anchored because (a) it is cheaper to implement than hooks, (b) it is available immediately via a skill text edit, and (c) it aligns with how the three existing successful mechanisms already work.

Spike S4 (`./essays/research-logs/spike-s4-fail-loud-dispatch.md`) surfaced a complementary finding: even step-anchored dispatches are vulnerable to **position effects**. Four of five existing dispatch sites in the corpus sit in the "lost in the middle" zone of long skill files — positions where instruction-following degrades per Liu et al. (2023) and Guo & Vosoughi (2025). Step-anchoring is necessary but not sufficient: the anchor must be placed at a structurally privileged position in the skill file.

Invariant 8 (from Cycle 10's MODEL phase) requires that any unconditional structural mechanism be anchored to one of three substrates: Skill-Structure Layer, Harness Layer, or User-Tooling Layer. This ADR is the **Skill-Structure Layer** implementation — the primary substrate for step-anchorable mechanisms. It is the mechanical enforcement of Invariant 8's anchoring requirement for the class of mechanisms where step-anchoring fits.

ADR-064 depends on this ADR for a specific precondition: the PostToolUse hook cannot regex-extract the expected output path from a dispatch prompt unless the prompt contains it in a canonical, parseable form. This ADR specifies that canonical form.

## Decision

**Principle.** For every Tier 1 mechanism whose dispatch can be anchored to a concrete workflow step, the skill that governs its dispatch must:

1. Name the mechanism by its `subagent_type` identifier.
2. Place the dispatch instruction at a specific, mechanically-unavoidable workflow step in the skill text — not as a general rule or a contextual reminder.
3. Include the exact dispatch prompt skeleton, containing the canonical output path in regex-parseable form.
4. Place the dispatch step at a **structurally privileged position** in the skill file: either the top third or the bottom third, not the middle. Per Spike S4's position-effect finding, the "lost in the middle" zone is where instruction-following degrades even for well-specified instructions.

**Canonical dispatch prompt skeleton.** Every Tier 1 dispatch instruction in a skill file must contain a prompt block of this form:

```
Dispatch the <subagent-type> subagent with the following brief:

<brief content>

Output path: <canonical path with {cycle} and optionally {phase} substituted>
```

The `Output path:` line is load-bearing. The PostToolUse hook in ADR-064 extracts the expected path via regex matching `^Output path: (.+)$` from the `tool_input.prompt` field. Skill text that omits or rewords this line causes the hook to log `expected_path: null`, degrading the compound check to "dispatch happened, path unknown."

The subagent-type and output-path fields become the contract between the skill layer and the harness layer. Skill text owns the instruction; the hook owns the verification; both reference the same identifiers.

### Specific fixes required in this ADR

**Fix 1 (primary): susceptibility-snapshot-evaluator dispatch.**

The current state: the orchestrator `SKILL.md` contains a Susceptibility Snapshot Dispatch subsection describing *when* to dispatch ("at every phase boundary") and *what* to pass ("the AID cycle's recorded susceptibility signals"), but it is at a mid-file position in a 500+ line skill, and it instructs the orchestrator to recognize the phase boundary contextually. This is the judgment-anchored dispatch pattern the cycle's diagnostic flags.

The fix: each individual phase skill (`skills/research/SKILL.md`, `skills/discover/SKILL.md`, `skills/model/SKILL.md`, `skills/decide/SKILL.md`, `skills/architect/SKILL.md`, `skills/build/SKILL.md`, `skills/play/SKILL.md`, `skills/synthesize/SKILL.md`) gains an explicit **"Phase Boundary: Susceptibility Snapshot Dispatch"** subsection, placed at the phase-end position (structurally privileged — each phase skill ends with its transition to the next phase, so the snapshot dispatch sits at the bottom third). The subsection contains the canonical prompt skeleton with the phase-specific output path:

```
## Phase Boundary: Susceptibility Snapshot Dispatch

Before completing this phase, dispatch the susceptibility-snapshot-evaluator:

Dispatch the susceptibility-snapshot-evaluator subagent with the following brief:

<phase-specific brief: describe this phase's AID cycle recorded signals,
the phase boundary being crossed, the next phase being entered,
and any cross-phase signals from prior snapshots.>

Output path: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-{phase}.md
```

The `{phase}` token resolves to this phase's name (`research`, `discover`, `model`, `decide`, `architect`, `build`, `play`, `synthesize`). The `{cycle}` token resolves to the current cycle number as inferred by the hook.

**Path note for ADR-070 migration:** The canonical path is currently `docs/housekeeping/audits/susceptibility-snapshot-{cycle}-{phase}.md`. When ADR-070 executes the housekeeping migration, this path becomes `docs/housekeeping/audits/susceptibility-snapshot-{cycle}-{phase}.md`. The skill edits in this ADR and the path updates in ADR-070 must ship together to avoid a period where the skill text references a location different from where the hook and the subagent expect to find the artifact.

**Fix 2: verify prompt format for existing step-anchored mechanisms.**

The citation auditor, argument auditor, and research-methods reviewer already have concrete dispatch sites per Spike S3's corpus audit. This ADR requires that their existing dispatch prompts be audited against the canonical skeleton and updated if any of them omit the `Output path:` line or use a non-parseable form.

Expected state (to be verified during implementation):
- `skills/research/SKILL.md` — citation-auditor dispatch at the "after the essay is written" step, with canonical path `docs/housekeeping/audits/citation-audit-{cycle}.md`.
- `skills/research/SKILL.md` — argument-auditor dispatch at the "after the essay is written" step, with canonical path `docs/housekeeping/audits/argument-audit-{cycle}.md`.
- `skills/research/SKILL.md` — research-methods-reviewer dispatch at the "before the first research loop" step, with canonical path `docs/housekeeping/audits/research-design-review-{cycle}.md`.
- `skills/decide/SKILL.md` — argument-auditor dispatch at "after ADRs are written," with canonical path `docs/housekeeping/audits/argument-audit-decide-{cycle}.md`.

Implementation verifies each of these against the canonical skeleton; any that omit `Output path:` or use a paraphrase are updated to the canonical form. This is a mechanical audit, not a design decision.

**Fix 3: position audit for existing dispatch sites.**

Spike S4 found four of five existing dispatch sites in the "lost in the middle" zone of their skill files. Step-anchoring alone is insufficient without structurally privileged placement. Implementation audits each dispatch site's position in its skill file and relocates it if it falls in the middle third of the file. Top-third or bottom-third placement is required.

This is a structural-hygiene fix on top of the step-anchoring that already exists. It is distinct from Fix 1 (which is about adding dispatch sites for mechanisms that lack them) and distinct from Fix 2 (which is about the prompt format at existing dispatch sites).

### Mechanical enforcement of Invariant 8 (restating for clarity)

Research-phase Commitment 3 asked whether to write an ADR stating "No new Tier 1 mechanism without a concrete dispatch site." MODEL-phase Commitment 8 noted that this rule is implied by Invariant 8 and does not require a separate methodology-level ADR. This ADR is where that rule lands in practice — not as a meta-rule but as the execution pattern for step-anchorable mechanisms. The three-part checklist above (name, step-anchor, canonical prompt with path, structurally privileged position) is the operational definition of "anchored to the Skill-Structure Layer."

Any future proposal to add a Tier 1 mechanism must either:
- **(a)** Be step-anchorable, in which case it follows this ADR's pattern (name, concrete step, canonical prompt, privileged position); or
- **(b)** Be harness-verifiable, in which case it follows ADR-064's pattern (manifest entry, dispatch log, Stop hook); or
- **(c)** Be user-tooling-verifiable, in which case it follows ADR-066's pattern (canonical artifact, manifest check); or
- **(d)** Not be specified as unconditional.

This is Invariant 8's three-substrate requirement, operationalized. No mechanism can claim Tier 1 status without naming which substrate anchors its execution.

## Consequences

**Positive:**

- **Cycle 10 Item 5 (susceptibility snapshot never ran) is structurally fixed at the skill-structure layer.** The fix is cheap (a per-phase-skill text edit, roughly 15 lines per skill × 8 phase skills), available immediately, and aligns with the pattern the three successful existing mechanisms already use. This is the primary fix; ADR-064's compound check is defense-in-depth on top.
- **Position effects addressed via structurally privileged placement.** The four "lost in the middle" dispatch sites Spike S4 found are relocated to top-third or bottom-third of their skill files. This is incremental hygiene but compounds with the step-anchoring to reduce dispatch-failure probability.
- **Canonical prompt skeleton becomes the skill-hook contract.** Every Tier 1 dispatch site in the codebase now has a machine-parseable output path in its prompt, enabling ADR-064's PostToolUse hook to extract it reliably. The skill layer and the harness layer reference the same identifiers (`subagent_type`, output path).
- **Invariant 8 becomes mechanically enforced for step-anchorable mechanisms.** Future Tier 1 mechanism proposals cannot drift back to judgment-anchored patterns because the three-part checklist is now the operational definition of the Skill-Structure Layer substrate.

**Negative:**

- **Every phase skill gains a Susceptibility Snapshot Dispatch subsection.** Eight phase skills × roughly 15 lines each = 120 additional lines across the skill corpus. Phase skills get longer. Mitigation: the subsection sits at the bottom-third position (phase-end transition), where it does not compete with the phase's primary work instructions.
- **The canonical prompt format is load-bearing for ADR-064.** If the format drifts or is paraphrased by future skill-file edits, the PostToolUse hook's regex extraction breaks and the compound check degrades to partial (dispatch logged, path unknown). This is a coupling risk between this ADR and ADR-064. Mitigation: the `Output path:` line is visually distinctive and unusual enough that a skill-file edit would be unlikely to delete it accidentally; `rdd-conform` can be extended to verify the format as part of its template-alignment audit.
- **Per-phase briefs for the susceptibility snapshot are not specified in this ADR.** Each phase skill's snapshot dispatch subsection needs phase-specific brief content (what signals to pass, what boundary is being crossed, what prior snapshots to reference). This ADR names the requirement; the brief content is implementation work that happens at skill-file edit time. The briefs are not controversial design decisions — they follow the template from the existing orchestrator `SKILL.md` Susceptibility Snapshot Dispatch section, specialized per phase.
- **Coupling to ADR-070 (housekeeping migration) for path values.** Until ADR-070 ships, the canonical paths use `docs/housekeeping/audits/`. After ADR-070, they use `docs/housekeeping/audits/`. The skill edits in this ADR and the path updates in ADR-070 must be coordinated to avoid mid-transition inconsistency where skill text and hook manifest disagree on the canonical path.

**Neutral:**

- **The three existing step-anchored mechanisms (citation, argument, research-methods) are already at 100% coverage per Spike S3.** Fix 2 (prompt format verification) and Fix 3 (position audit) are hygiene improvements rather than functional fixes for those mechanisms. The positive delta for them is subtle: they become hook-verifiable via ADR-064 in addition to being already-reliable via step-anchoring. Defense-in-depth, not primary fix.
- **The ADR does not propose a new hook or a new subagent.** Every change is within the skill-text layer. This makes it the lightest-weight of the three structural ADRs (063, 064, 065) and the one with the clearest "just edit these files" implementation path.
- **The "no new Tier 1 without concrete dispatch site" rule from research-phase Commitment 3** is fully discharged here as the operational pattern rather than as a methodology-level meta-ADR. MODEL-phase Commitment 8 anticipated this disposition.

## Provenance check

**Did this ADR's core framing originate from Essay 014, from a prior gate conversation, or from the agent's synthesis during drafting?**

- **Skill-structure fix as the primary move (cheaper than hooks, available immediately):** Essay 014 §5 lines 101–103, explicit. Not agent synthesis.
- **Step-anchored vs. judgment-anchored diagnostic (100% vs. 0% corpus coverage):** Essay 014 §2 (the sharpened diagnostic) + Spike S3 corpus audit. Not agent synthesis.
- **Position effects and the "lost in the middle" zone finding:** Spike S4 + Essay 014's references to Liu et al. (2023) and Guo & Vosoughi (2025). Not agent synthesis.
- **Canonical prompt skeleton with `Output path:` line as the skill-hook contract:** Spike S1 §"Implementation precisions" first note ("every Tier 1 dispatch prompt must contain the expected output path in a canonical, parseable form"). The specific skeleton format is drafted in this ADR as the concrete encoding of the Spike S1 requirement — the requirement is from the spike, the specific format is agent-composed at drafting time. Named explicitly as agent composition.
- **Three-part skill-structure checklist (name, concrete step, canonical prompt, privileged position):** Composed in this ADR as the operational definition of the Skill-Structure Layer substrate, derived from Essay 014's principle and Spike S4's position-effect finding. Agent composition at drafting time. This is not framing adoption from conversation — no user input was solicited on the specific checklist; it is a mechanical composition of the essay and spike findings into an ADR-shaped rule.
- **Per-phase placement for the susceptibility snapshot dispatch (each phase skill gains a subsection rather than the orchestrator carrying it):** Agent composition at drafting time. The essay recommends "embed the dispatch at a concrete step"; the essay does not specify *which* skill file should contain the step (orchestrator or per-phase). This ADR proposes per-phase because each phase's snapshot brief content is phase-specific, which makes per-phase placement more maintainable than orchestrator-centralized placement. Named as agent composition; the alternative (orchestrator-centralized placement) was not engaged in the essay or prior conversation.
- **Mechanical enforcement of Invariant 8 as the ADR's framing (rather than a separate meta-ADR):** MODEL-phase Commitment 8, explicit. Not agent synthesis.

**Result:** Core diagnostic and primary-move framing from essay + spikes. Three specific design compositions at drafting time: the canonical prompt skeleton's exact format, the three-part checklist, and the per-phase placement decision. None of these are framing adoption from conversation — they are drafting-time synthesis of essay and spike material into ADR-shaped rules. The provenance is cleanest when an ADR is primarily a mechanical application of prior research findings, which this ADR is more than ADR-064 was.

One watch item: the per-phase placement decision for the susceptibility snapshot dispatch is a real architectural choice (per-phase vs. orchestrator-centralized) that the essay does not engage. If the user has a view on this, it should be surfaced before implementation. Flagging explicitly rather than defaulting to the agent's choice.
