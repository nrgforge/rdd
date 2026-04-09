# ADR-067: Three-Tier Enforcement Classification as Methodology-Level Taxonomy

**Status:** Proposed

## Context

Invariant 8 requires that any unconditional structural mechanism the methodology specifies be anchored to one of three substrates: Skill-Structure Layer, Harness Layer, or User-Tooling Layer. The invariant names the three substrates but does not, on its own, provide a catalog for choosing among them or a decision procedure for classifying new mechanism proposals. The substrate concepts live in the domain model (Amendment #17, MODEL phase), and the specific implementations live in ADR-063/064 (Harness Layer — manifest format and compound check hooks), ADR-065 (Skill-Structure Layer — anchor dispatch), and ADR-066 (User-Tooling Layer — graduate conversational mechanism).

Research-phase Commitment 4 proposed that the three-tier categorization be captured as a methodology-level ADR. MODEL-phase Commitment 8 resolved that the rule *"no new Tier 1 mechanism without a concrete dispatch site"* does not need its own meta-ADR because it is mechanically implied by Invariant 8. This ADR discharges both commitments together: it is the catalog of the three substrates and the decision procedure for classifying future mechanism proposals, but it does not restate Invariant 8 as a separate rule — the invariant *is* the anchoring requirement; this ADR describes how to apply it.

The unified principle behind all three substrates is from Essay 014 §7 line 172: **anchor the mechanism to a concrete, mechanically-unavoidable step with observable output.** The *technique* differs across substrates — skill text edit, hook verification at a tool-call or phase-end boundary, or canonical-path artifact requirement — but the principle is invariant. The three substrates are context-dependent matches between mechanism type and enforcement technique, not a priority hierarchy where one substrate falls back to another.

## Decision

Adopt the **Three-Tier Enforcement Classification** as the methodology-level taxonomy for unconditional structural mechanisms. The classification is the authoritative catalog for operationalizing Invariant 8's anchoring requirement.

### The three substrates

| Substrate | Mechanism type | Enforcement technique | Implementing ADR | Example mechanism |
|---|---|---|---|---|
| **Skill-Structure Layer** | Mechanisms with a concrete, mechanically-unavoidable workflow step in a named skill | Embed the dispatch instruction at a structurally privileged position (top or bottom third) of the relevant skill file, with a canonical prompt skeleton containing the expected output path in regex-parseable form | ADR-065 | Citation auditor at "after the essay is written"; susceptibility snapshot at phase-end of each phase skill |
| **Harness Layer** | Mechanisms needing verification against position effects, task-immersion pressure, or silent dispatch fallback; mechanisms whose trigger is a phase boundary (not a tool call) and whose enforcement requires artifact verification | Two hooks: (a) PostToolUse on `Agent` logging every attempted subagent dispatch to a session-scoped dispatch log, and (b) Stop hook consuming a per-phase manifest that cross-references required artifacts against the dispatch log (the compound check) | ADR-063 (manifest format), ADR-064 (compound check hooks) | Argument auditor re-audit temporal verification (note: the primary argument auditor dispatch is Skill-Structure Layer; the Harness Layer adds the revision-aware reminder from ADR-064 that verifies re-audits happen after document revisions); susceptibility snapshot at phase boundaries (as complement to skill-structure fix) |
| **User-Tooling Layer** | Conversational mechanisms whose trigger is conversational and cannot be made structural through dispatch alone | Graduate the mechanism from purely conversational to artifact-producing by requiring a verifiable file at a canonical path. The same manifest-and-assertion logic from the Harness Layer then applies | ADR-066 | AID cycle at phase gates (graduated to gate reflection note at `docs/housekeeping/gates/`) |

### Unified principle

All three substrates share the same principle from Essay 014 §7 line 172: **anchor the mechanism to a concrete, mechanically-unavoidable step with observable output.** What the three substrates have in common:

- **A concrete step.** Not a general rule ("dispatch at phase boundaries"), but a specific, named position the mechanism must fire at.
- **Mechanical unavoidability.** The step cannot be skipped by orchestrator contextual judgment — either the skill text structurally puts the step in the orchestrator's path (Skill-Structure Layer), or the harness observes the absence (Harness Layer), or the artifact requirement produces an observable floor (User-Tooling Layer).
- **Observable output.** The mechanism produces something the methodology can verify: a skill-text dispatch instruction in a structurally privileged position, a hook event + artifact pair, or a canonical-path file.

What differs is the *technique*. Skill text edit is the cheapest and most direct; it should be preferred when the mechanism has a step-anchorable form. Hook verification is defense-in-depth on top of skill-structure anchoring and primary for mechanisms whose trigger is a phase boundary rather than a tool call. Canonical-path artifact requirement is primary for conversational mechanisms whose trigger cannot be step-anchored.

### Not a priority hierarchy

The three substrates are **not a priority hierarchy** where mechanisms fall back from one layer to the next. Each substrate is *primary* in its domain:

- **Skill-Structure Layer is primary for mechanisms that can be step-anchored.** It is cheaper than hooks, available immediately via skill text edit, and aligns with how the three successful existing Tier 1 mechanisms (citation auditor, argument auditor, research-methods reviewer) already work at 100% historical dispatch coverage (Spike S3). Hooks are defense-in-depth on top, not a replacement.

- **Harness Layer is primary for mechanisms whose trigger is not a tool call** (phase boundaries, Stop-event enforcement, manifest verification) or whose failure mode includes silent dispatch fallback that the skill-structure layer cannot detect. The Harness Layer's compound check (ADR-064) is the *only* structural defense against sophisticated State C fabrication in enforcement mode, because fabrication would require inducing a fake PostToolUse event, which the agent cannot do. The guarantee does not hold on pre-migration corpora in advisory mode; see ADR-064's advisory-mode subsection.

- **User-Tooling Layer is primary for conversational mechanisms** that cannot be made structural through dispatch alone. It converts ungovernable mechanisms into partially-governable ones by making them artifact-producing. Essay 014 §7: *"converting them into artifact-producing mechanisms is what makes them governable at all."*

A mechanism fits the substrate whose technique matches its type. The "best" substrate is the one whose enforcement technique naturally aligns with the mechanism's shape, not the one highest in some priority ordering.

### Decision procedure for classifying proposed mechanisms

Any future proposal to add an unconditional structural mechanism (Tier 1 under ADR-058) must name which substrate anchors its execution. The procedure:

1. **Does the mechanism have a concrete, mechanically-unavoidable workflow step at which it can be embedded in skill text?**
   - Yes → **Skill-Structure Layer** (ADR-065 pattern). The skill file gains a dispatch instruction at a structurally privileged position with a canonical prompt skeleton.
   - No → continue to step 2.

2. **Is the mechanism's trigger a tool-call or phase-end event that a hook can observe, or does its failure mode include silent dispatch fallback or fabrication?**
   - Yes → **Harness Layer** (ADR-063/064 pattern). A manifest entry is added with the mechanism's canonical path, structural assertions, and the compound check cross-reference applies.
   - No → continue to step 3.

3. **Is the mechanism conversational, and does it have a natural artifact moment (a phase boundary, a commitment point, a structured exchange) at which a canonical-path file could be produced?**
   - Yes → **User-Tooling Layer** (ADR-066 pattern). The mechanism is graduated from purely conversational to artifact-producing per the *Graduate Conversational Mechanism* action, with a canonical path, required structure, and manifest entry.
   - No → continue to step 4.

4. **None of the above applies.** The mechanism cannot meet Invariant 8's anchoring requirement and therefore **cannot be specified as unconditional**. Per Invariant 8, it may be specified as best-effort or explicitly contingent, with honest transparency about its non-structural character. The methodology does not silently claim a guarantee it cannot deliver.

The procedure is designed so that step 4 is the uncommon case. Most mechanisms the methodology needs fit one of the first three substrates. Step 4 exists to prevent accumulation of prose-only "unconditional" specifications — the failure mode Cycle 10's diagnostic named.

### Mechanisms may legitimately use more than one substrate

A single mechanism can be anchored to multiple substrates simultaneously, using each for a different purpose. The susceptibility snapshot at phase boundaries is the clearest example: it is **primarily** anchored at the Skill-Structure Layer (ADR-065 specifies the per-phase dispatch instruction at each phase skill's phase-end position) and **additionally** anchored at the Harness Layer (ADR-063/064's manifest entry enforces artifact existence at the Stop event). The skill-structure anchor is primary because it causes the dispatch to happen; the harness anchor is defense-in-depth that verifies the artifact was actually produced by an isolated subagent rather than fabricated in-context.

Defense-in-depth through multiple substrates is a pattern, not a violation of the "primary-in-its-domain" framing. Each substrate remains primary for its specific role; composition is orthogonal to classification.

## Consequences

**Positive:**

- **Invariant 8's anchoring requirement has operational form.** Future mechanism proposals have a concrete decision procedure rather than a prose requirement to interpret. The procedure is mechanical: answer the four questions in order; the answers determine the substrate.
- **The three-substrate catalog is extensible.** If future work identifies a fourth substrate (a new class of enforcement technique the methodology adopts), it joins the catalog without restructuring the unified principle. The classification is a catalog of currently-known substrates, not a closed taxonomy.
- **Prose-only "unconditional" specifications become architecturally visible as the failure mode they are.** Any mechanism that reaches step 4 of the decision procedure cannot claim Tier 1 status. This is the mechanical enforcement of Invariant 8 that Research-phase Commitment 3 proposed.
- **The classification reflects what already works.** Three of the methodology's existing Tier 1 mechanisms (citation, argument, research-methods auditors) are already at the Skill-Structure Layer with 100% historical dispatch coverage (Spike S3). The classification names what is descriptive of the existing methodology, not only what is prescriptive for future additions. Invariant 8 is partly descriptive (as the MODEL gate established) — this ADR is where the descriptive part is documented as a catalog.

**Negative:**

- **Edge cases in step 2 and step 3 require judgment.** Some mechanisms may have both a tool-call trigger and a conversational dimension. Some may have multiple candidate workflow steps. The decision procedure provides a default ordering (skill-structure first, harness second, user-tooling third) but edge cases may benefit from cross-substrate composition as the susceptibility snapshot example shows. Mitigation: the "mechanisms may legitimately use more than one substrate" subsection is the release valve for these cases.
- **The classification does not cover mechanisms that fit none of the substrates.** Step 4 explicitly names the gap: some mechanisms cannot be Tier 1. This is a limit of the methodology's current enforcement reach, not a defect of the classification. Essay 014 §7 names belief-mapping at mid-conversation user pushback as the canonical example of such a mechanism — no phase boundary, no natural artifact moment, no tool-call event. The classification does not make such mechanisms Tier 1; it makes the absence of Tier 1 status visible.
- **Classification can drift if the substrates are not revisited.** As the methodology evolves and new enforcement techniques become available (Claude Code hook capabilities change, new agent types are introduced, etc.), the catalog may need updating. Mitigation: `rdd-conform` can include a substrate audit as part of its template-alignment scope in future iterations — not scoped to this ADR or ADR-070, flagged as a potential follow-up.

**Neutral:**

- **This ADR does not restate Invariant 8 as a separate rule.** MODEL-phase Commitment 8 anticipated this disposition: the rule *"no new Tier 1 without a concrete dispatch site"* is mechanically implied by Invariant 8 plus this ADR's decision procedure. The rule exists; it does not need its own ADR.
- **The classification is at methodology level, not project level.** Individual projects using RDD inherit the classification from the plugin; they do not define their own substrates. The catalog is shared by all users of the methodology.

## Provenance check

**Did this ADR's core framing originate from Essay 014, from a prior gate conversation, or from the agent's synthesis during drafting?**

- **The three-substrate classification (Skill-Structure Layer, Harness Layer, User-Tooling Layer):** Essay 014 §7 and MODEL domain model Amendment #17. Not agent synthesis.
- **The unified principle ("anchor to a concrete, mechanically-unavoidable step with observable output"):** Essay 014 §7 line 172, verbatim. Not agent synthesis.
- **"Not a priority hierarchy" framing:** MODEL-phase settled premise 4 as recorded in `docs/cycle-status.md` feed-forward signals: *"The three-tier classification is not a priority hierarchy. Each layer is primary in its domain."* User-surfaced at MODEL gate 2026-04-08.
- **Decision procedure (four-step classification flow):** **Agent-composed at drafting time** as a mechanical operationalization of Invariant 8's anchoring requirement. The procedure is not in the essay or the prior gate conversation — it is the drafting-time synthesis of "here's how to apply the three substrates to a new proposal." Named as agent composition.
- **"Mechanisms may legitimately use more than one substrate" subsection:** Agent-composed at drafting time to address the susceptibility-snapshot edge case where ADR-065 (Skill-Structure Layer) and ADR-063/064 (Harness Layer) both apply. The edge case is real — the susceptibility snapshot is anchored at two substrates simultaneously. The framing of this as "defense-in-depth through multiple substrates is a pattern, not a violation" is agent composition. Named explicitly.
- **Step 4 (mechanisms that fit no substrate cannot be Tier 1):** This is Invariant 8's own requirement, applied here as the terminal branch of the decision procedure. Not agent synthesis; restatement of the invariant in procedural form.
- **The classification is partly descriptive:** MODEL-phase settled premise 2 as recorded in cycle status: *"The invariant is partly descriptive. Many phase transitions and specialist dispatches already meet the anchoring criterion. The invariant formalizes what already works and names what does not."* User-surfaced at MODEL gate 2026-04-08.
- **The disposition that this ADR does not restate Invariant 8 as a separate rule:** MODEL-phase Commitment 8 as recorded in cycle status. User-surfaced at MODEL gate 2026-04-08.

**Result:** This ADR is the cleanest-attributed of the DECIDE-phase ADRs so far. Core framing and major claims are from Essay 014, MODEL domain model Amendment #17, and MODEL-phase gate responses. Two specific design compositions at drafting time — the four-step decision procedure and the "multiple substrates" subsection — are agent-composed mechanical applications of prior material, with no synthesis-moment framing adoption detected. This ADR is primarily a catalog of what MODEL and the essay already established, in operational ADR form. No watch items.
