# ADR-089: ADR-067 Amendment — Harness-Layer Technique Revised to Advisory Detection

**Status:** Proposed

## Context

ADR-067 specified the Three-Tier Enforcement Classification as the methodology-level taxonomy for unconditional structural mechanisms anchored under Invariant 8. The classification's row for the Harness Layer named the enforcement technique as: *"Two hooks: (a) PostToolUse on `Agent` logging every attempted subagent dispatch to a session-scoped dispatch log, and (b) Stop hook consuming a per-phase manifest that cross-references required artifacts against the dispatch log (the compound check)."*

The decision-procedure text named the Harness Layer as primary for *"mechanisms whose trigger is not a tool call (phase boundaries, Stop-event enforcement, manifest verification) or whose failure mode includes silent dispatch fallback that the skill-structure layer cannot detect."* The ADR's Decision section claimed: *"The Harness Layer's compound check (ADR-064) is the only structural defense against sophisticated State C fabrication in enforcement mode, because fabrication would require inducing a fake PostToolUse event, which the agent cannot do."*

ADR-088 amends ADR-064's enforcement disposition from blocking to advisory across all modes. The compound check mechanism is retained; its finding is surfaced as model-visible advisory rather than as Stop-hook block. The State-C claim shifts from "structurally impossible" to "structurally detectable."

ADR-067's Harness-Layer row must be amended to reflect this. Two specific updates are needed:

1. **The enforcement technique description.** The current row names the technique as "two hooks" with an implicit blocking semantic on (b). The amended technique is two hooks with advisory disposition on (b) and the dispatch log on (a) as the structural-detection substrate.
2. **The decision-procedure text and the Decision-section claim.** The "only structural defense" language relies on the impossibility claim ADR-088 amends. The amended language needs to use the detectability framing.

The Three-Tier Classification's substrates and the four-step decision procedure remain authoritative — only the Harness Layer's technique description and the Stop-event enforcement language change.

This ADR is the second of the two methodology-debt amendments named in cycle-status.md feed-forward signals. ADR-088 amended ADR-064; this ADR amends ADR-067 to align the classification taxonomy with the v0.8.3 reality.

## Decision

This ADR **partially supersedes ADR-067** (IETF *Updates* analog) by amending the Harness Layer's enforcement technique description and the related decision-procedure language. ADR-067's Three-Tier substrate framing, the unified principle ("anchor to a concrete, mechanically-unavoidable step with observable output"), the four-step decision procedure structure, and the descriptive-vs-prescriptive characterization all remain current authority.

### 1. Amended Harness-Layer technique description

The classification table's Harness Layer row is amended to read:

| Substrate | Mechanism type | Enforcement technique | Implementing ADR | Example mechanism |
|---|---|---|---|---|
| **Harness Layer** | Mechanisms needing verification against position effects, task-immersion pressure, or silent dispatch fallback; mechanisms whose trigger is a phase boundary (not a tool call) and whose enforcement requires artifact verification | Two hooks operating in advisory disposition: (a) PostToolUse on `Agent` logging every attempted subagent dispatch to a session-scoped dispatch log (this is the structural-detection substrate — the agent cannot inject hook events, so the log records what actually happened), and (b) Stop hook consuming a per-phase manifest that cross-references required artifacts against the dispatch log (the compound check), surfacing missing artifacts and fabrication signals as model-visible advisories. The advisories are read on every Stop event until the artifact appears or the `**In-progress phase:**` field is set; the practitioner is responsible for the response. | ADR-063 (manifest format), ADR-064 (compound check hooks, as updated by ADR-088) | Argument-auditor re-audit temporal verification (note: the primary argument-auditor dispatch is Skill-Structure Layer; the Harness Layer adds the revision-aware advisory from ADR-064 that surfaces re-audits not yet performed after document revisions); susceptibility snapshot at phase boundaries (as complement to skill-structure fix) |

### 2. Amended decision-procedure language for step 2

The decision procedure's step 2 is amended to read:

> 2. **Is the mechanism's trigger a tool-call or phase-end event that a hook can observe, or does its failure mode include silent dispatch fallback or fabrication?**
>    - Yes → **Harness Layer** (ADR-063/064 pattern, as updated by ADR-088). A manifest entry is added with the mechanism's canonical path, structural assertions, and the compound-check cross-reference applies in advisory disposition. Detection of failure modes is structural; the agent's response to detection is the practitioner-visible decision.
>    - No → continue to step 3.

The amendment preserves the substrate's primacy for tool-call-and-phase-boundary mechanisms while clarifying that the substrate's contribution is **detection with practitioner-decided response**, not mechanical prevention.

### 3. Amended State-C claim in the "Not a priority hierarchy" subsection

The Harness Layer paragraph in the "Not a priority hierarchy" subsection is amended:

> **Harness Layer is primary for mechanisms whose trigger is not a tool call** (phase boundaries, Stop-event verification, manifest cross-reference) or whose failure mode includes silent dispatch fallback that the skill-structure layer cannot detect. The Harness Layer's compound check (ADR-064 as updated by ADR-088) is the only structural defense against sophisticated State C fabrication, because fabrication would require inducing a fake PostToolUse event, which the agent cannot do; the compound check makes State C **detectable** rather than impossible — the Stop-event advisory surfaces the fabrication signal and the practitioner decides the response. The detection guarantee does not hold on pre-migration corpora in advisory-only mode (no dispatch log written); see ADR-064's advisory-mode-vs-enforcement-mode subsection.

The "structural defense" language is preserved (the structural argument is unchanged: fake hook events cannot be injected). The "impossible vs. detectable" distinction is the load-bearing change.

### 4. Substrate primacy preserved

The "primary in its domain" framing remains current. The Harness Layer is **still primary** for tool-call-and-phase-boundary mechanisms; the amendment does not demote the substrate or reorder the priority hierarchy. The substrate's enforcement strength changes (block → advisory); its primacy in its domain does not.

The Skill-Structure Layer's primacy for step-anchorable mechanisms is unchanged. The User-Tooling Layer's primacy for conversational mechanisms with natural artifact moments is unchanged. The "mechanisms may legitimately use more than one substrate simultaneously" subsection is unchanged. The four-step decision procedure's structure is unchanged; only step 2's Harness Layer description carries the amendment.

### 5. Mechanisms using the Harness Layer in v0.8.3 — explicit list

The mechanisms that use the Harness Layer per ADR-088's amended disposition:

- **Susceptibility-snapshot dispatch verification at phase boundaries.** Skill-Structure Layer is primary (ADR-065's per-phase dispatch sites); Harness Layer adds the compound-check verification (advisory).
- **Argument-auditor re-audit reminder.** Skill-Structure Layer is primary (the auditor dispatches at "after the essay is written"); Harness Layer adds the revision-aware advisory (already non-blocking per original ADR-064; aligned now with the rest of the manifest).
- **Citation-auditor verification.** Skill-Structure Layer is primary (the auditor dispatches at the same step-anchored position); Harness Layer adds the dispatch-log record and the manifest existence check (advisory).
- **Research-methods-reviewer verification.** Skill-Structure Layer is primary (ADR-060's pre-research-loop dispatch); Harness Layer adds the dispatch-log record and the manifest existence check (advisory).

In each case, the Skill-Structure Layer is the primary firing mechanism (causes the dispatch) and the Harness Layer adds defense-in-depth visibility (records the dispatch and verifies the artifact). The v0.8.3 amendment changes the Harness Layer's contribution from "block on missing" to "advise on missing"; it does not change the substrate primacy ordering.

## Rejected alternatives

**Demote the Harness Layer to a non-primary substrate (Skill-Structure becomes primary in domains the Harness Layer was primary in).** Rejected. The amendment does not reduce the Harness Layer's primacy domain; it amends its enforcement strength. Phase-boundary mechanisms (which cannot be tool-call-anchored) and silent-dispatch-fallback failure modes (which the skill-structure layer cannot detect) still need a substrate, and the Harness Layer remains the only one capable of providing it. Demoting the substrate would leave those domains uncovered.

**Drop the Harness Layer from the classification entirely.** Rejected. The Harness Layer's mechanism (PostToolUse log + Stop-event cross-reference) is a substantively different enforcement technique from the Skill-Structure Layer's skill-text edits and the User-Tooling Layer's canonical-path artifact requirement. The classification's three-substrate structure reflects three distinct techniques. Dropping a substrate because its enforcement strength was amended would conflate enforcement technique with enforcement strength.

**Add a fourth substrate ("Advisory Layer") for advisory-only mechanisms.** Considered. The substrate would group the now-advisory Harness Layer with any future advisory-only mechanism. Rejected because the Harness Layer's amendment is about enforcement disposition (block → advisory), not about a new technique class. The two hooks (PostToolUse log + Stop-event cross-reference) are still the technique; the disposition shifted. Splitting the substrate by disposition would proliferate substrates without adding classificatory value.

**Defer the ADR-067 amendment until further methodology evidence accumulates.** Rejected. The methodology-debt naming in cycle-status.md was explicit about both ADR-064 and ADR-067 amendments being owed. ADR-088 lands the ADR-064 amendment; deferring the ADR-067 amendment would leave the classification taxonomy out of sync with the implementing ADR. The two amendments must land together to keep the methodology's documentation consistent.

## Consequences

**Positive:**

- The Three-Tier Enforcement Classification's Harness Layer row reflects v0.8.3's actual implementation. The classification taxonomy stays in sync with ADR-064 (as updated by ADR-088).
- The decision procedure's step 2 produces the right answer for new mechanism proposals. Practitioners classifying a new mechanism see "advisory disposition with structural detection" as the Harness Layer's character, not "blocking enforcement" — the classification matches what the substrate delivers.
- Substrate primacy is preserved. The amendment is calibrated; it does not reorder the substrates or weaken their domain coverage. Future cycles inherit a classification taxonomy whose substrate primacy claims hold.
- The State-C claim is calibrated to detection. Practitioners citing the classification taxonomy for ADR design see the detection-vs-prevention distinction; the methodology's structural defense remains structural, but its contribution is named honestly.

**Negative:**

- The amendment compounds methodology-debt overhead. ADR-064 is updated by ADR-088; ADR-067 is updated by ADR-089; both updates land in the same cycle and require coordinated downstream-artifact sweeps. Mitigation: the sweeps are deferred to natural regeneration moments per ADR-074's fitness property; the deferral is recorded in cycle-status.md.
- Practitioners reading ADR-067 (the historical record) and ADR-089 (the current authority) need to compose the two to understand the classification taxonomy's current state. This is the cost ADR-074's body-immutability rule accepts. Mitigation: the supersession header on ADR-067 names ADR-089 explicitly; readers following the chain understand which authority applies.

**Neutral:**

- The four-step decision procedure's structure is unchanged. New mechanism proposals continue to follow the same decision procedure; only step 2's Harness Layer text is amended.
- The "mechanisms may legitimately use more than one substrate" subsection is unchanged. The susceptibility-snapshot example (Skill-Structure Layer primary + Harness Layer defense-in-depth) continues to be the canonical example; the Harness Layer's defense-in-depth contribution is now advisory rather than blocking.
- The descriptive-vs-prescriptive characterization (Invariant 8 is partly descriptive of what already works) is unchanged. The methodology's existing Tier 1 mechanisms continue to operate as ADR-067 originally framed; the v0.8.3 amendment is a calibration of the classification's enforcement-technique description, not a change to the mechanisms' actual operation.

## ADR-067 supersession header to apply

Per ADR-074 Step 2.5 supersession workflow, ADR-067 receives the following header at the top of its file (immediately below the `# ADR-067:` title):

```markdown
> **Updated by ADR-089 on 2026-04-27.** ADR-089 amends the Harness Layer row's enforcement-technique description and the decision-procedure step 2 language to reflect ADR-088's advisory demotion (v0.8.3). The Three-Tier substrate framing, the four-step decision procedure structure, and the substrate primacy ordering all remain current authority. Only the Harness Layer's enforcement-technique description and the State-C claim language are amended (block → advisory; impossibility → detectability).
```

ADR-067's Status field updates to `Updated by ADR-089`.

This is a **partial supersession** (IETF *Updates* analog). ADR-067's substrate framing, decision-procedure structure, descriptive-vs-prescriptive characterization, and "mechanisms may legitimately use more than one substrate" subsection all remain current authority. ADR-089 updates only the Harness Layer's enforcement-technique description and the State-C claim language.

## Downstream artifact sweep status (per ADR-074 Step 3)

Required updates to current-state artifacts:

| Artifact | Status | Notes |
|---|---|---|
| `system-design.md` | **Deferred to ARCHITECT (Cycle 017)** | The Three-Tier Classification's references in system-design.md update at ARCHITECT regeneration. Deferred-sweep rationale recorded in cycle-status.md. |
| `ORIENTATION.md` | **Deferred to ARCHITECT (Cycle 017)** | Section 4 references the classification framing. Deferred-sweep rationale recorded. |
| `domain-model.md` | **At MODEL Amendment 22 in this cycle** | The Three-Tier Enforcement concept's relationships shift from "Harness Layer provides blocking enforcement" to "Harness Layer provides advisory detection." MODEL-phase amendment captures this alongside the Compound Check concept update from ADR-088. |
| `field-guide.md` | **Deferred to BUILD (Cycle 017)** | The field-guide regenerates at BUILD completion; classification-taxonomy references update at that time. Deferred-sweep rationale recorded. |

The deferred sweeps are recorded in `.rdd/cycle-status.md` under the DECIDE phase status entry.

## Provenance check

- **The diagnosis that ADR-067's Harness-Layer row needs amending alongside ADR-064:** cycle-status.md feed-forward signal naming both ADRs as owing methodology-debt amendments. Driver-derived; user-surfaced via cycle-status.
- **The amended Harness-Layer technique description:** drafting-time synthesis composed from ADR-088's amended ADR-064 disposition. Agent composition; ADR-088-derived.
- **The amended decision-procedure step 2 language:** drafting-time synthesis applying ADR-088's amendment to the procedural text. Agent composition; ADR-088-derived.
- **The substrate-primacy-preservation argument (the amendment does not reorder the hierarchy):** drafting-time synthesis. The substrate-primacy framing is ADR-067's original; this ADR composes with it to articulate that an enforcement-strength change does not affect domain coverage. Agent composition; ADR-067-derived.
- **The mechanisms-using-Harness-Layer explicit list:** drafting-time synthesis enumerating the existing Tier 1 mechanisms. Each mechanism is essay-014-grounded or ADR-grounded; the list aggregation is agent composition.
- **The descriptive-vs-prescriptive characterization preservation:** ADR-067's original framing. Driver-derived.

**Result:** The diagnosis is user-surfaced. The amended technique description, decision-procedure language, and explicit mechanism list are agent-composed against ADR-088's amendment and ADR-067's original framing. The amendment is a partial supersession with explicit Updates header on ADR-067. No synthesis-moment framing adoption detected.
