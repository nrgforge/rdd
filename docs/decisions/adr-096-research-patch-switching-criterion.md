# ADR-096: Patch-Switching Criterion for RESEARCH Loop Termination

**Status:** Accepted

## Context

The `/rdd-research` skill describes an iterative research loop: ideation → research/spike → synthesis. The loop terminates when the practitioner-and-agent dyad judges the problem space sufficiently understood to produce the citation-audited and argument-audited Essay-Outline. The methodology does not currently specify an explicit termination criterion at the loop boundary — the judgment is felt-trigger-anchored.

Cycle 018's RESEARCH had no termination criterion, and the loop ran longer than the practitioner reflectively endorsed (Cycle 018 reflections; cycle-status). Cycle 019's RESEARCH ran six loops (per cycle-status §From RESEARCH), with Loop 6 added at the gate based on user feedback — the cycle's most consequential finding (C7 cross-project evidence) emerged from Loop 6, validating the late addition but also exposing that the original five-loop sequence had reached a structurally fuzzy stopping point.

Pirolli & Card (1999) name **patch-switching** as the information-foraging behavior that exits a current information patch when its marginal value falls below the opportunity cost of staying. The construct is well-established in HCI and information science; Cycle 019's lit-review (`lit-review-019-methodology-overhead.md`) referenced the construct as the directional evidence for ADR-CANDIDATE-019.3.

The cycle's Essay-Outline Section 10 names ADR-CANDIDATE-019.3 as a Branch D Calibration Move at Skill-Structure Layer (small `/rdd-research` skill-text amendment adding the termination criterion at Step 3 or Step 4). The Skill-Structure Layer scope reflects the evidence base: literature support is direct (Pirolli & Card 1999); the gap evidence is direct (Cycle 018 RESEARCH had no termination criterion); the amendment is small and localized to a single skill file.

## Decision

The `/rdd-research` skill adopts a **Patch-Switching Criterion** at the research-loop boundary as a Skill-Structure Layer mechanism.

### The criterion

At the end of each research loop (before invoking the next loop or proceeding to Essay-Outline synthesis), the practitioner-and-agent dyad applies the Patch-Switching Criterion:

> *"Does the current research patch's marginal information value exceed the opportunity cost of staying in it? If no, switch — either to a new patch (a different research thread the prior loop surfaced) or to synthesis (the Essay-Outline production work)."*

The criterion is **satisfied (stay in the current patch)** when:

- The loop is still producing P1 or P2 framings the prior loops did not surface.
- A specific question the prior loop opened has not yet been answered, and the next loop has a credible path to answering it.
- The practitioner can name what they expect the next loop to reveal that would **change** (not merely deepen) their reading of the problem space. **Reflexive-vs-genuine pre-mortem discrimination (per R2 audit P2-3 2026-05-22):** a reflexive answer ("I expect more evidence for the claims already established") triggers the switch condition, not the stay condition. The agent's role at loop-end is to ask: *"Is this expected observation distinct from confirming what the loop already found, or is it an extension of existing findings?"* If the practitioner cannot name an observation that would change (not merely deepen) the reading, the switch condition applies. The Einstellung effect (domain model Invariant 8 extension at Cycle 016) makes reflexive answers more likely after several iterations — the agent's prompting must elicit pre-mortem reasoning, not confirm-from-existing-frame.

The criterion **triggers a switch** when:

- The loop is producing P3 polish only, or finding-confirmations of what prior loops already established.
- The practitioner cannot name a specific question the next loop would address.
- The practitioner cannot name what they would need to observe for the prior conclusions to change.

The criterion **triggers synthesis** (rather than another patch) when:

- The dominant remaining question is not "what else does the literature say?" but "what does this corpus of findings synthesize to?"
- The framing has stabilized across prior loops; the work that remains is composition, not investigation.

### Skill-text amendment site

The criterion is encoded in `/rdd-research` at the **end of each research loop**, before the next-loop / synthesis decision. The exact skill-text amendment site is at the orchestrator-readable boundary where the agent currently asks the practitioner "another loop, or synthesis?" The criterion's question replaces the bare prompt with the Pirolli-Card-anchored question.

The amendment is small (~10–15 lines of skill text), localized to `/rdd-research`, and does not introduce a new specialist subagent or hook.

### Verdict-line format

After each research loop, the agent appends a structured verdict to the research log (`research-logs/research-log.md` or equivalent):

```
**Patch-Switching Criterion (loop N → loop N+1 decision):**
- Marginal yield this loop: [P1 / P2 / P3 findings; new framings; questions answered]
- Specific question for next loop: [name it, or "none"]
- Practitioner expected observation: [practitioner's response to "what would change (not deepen) the reading?", or "none (practitioner did not specify)"]
- Recommendation: [CONTINUE-this-patch | SWITCH-patch | SWITCH-to-synthesis]
```

**Practitioner-elicited field (per R2 audit P3-2 2026-05-22):** the "Practitioner expected observation" field is elicited from the practitioner at the loop boundary, not inferred by the agent from the research log. Before appending the verdict line, the agent prompts the practitioner: *"What specific observation in the next loop would change your reading of the problem space — not deepen it, but change it?"* The practitioner's response populates the field. If the practitioner does not engage substantively, the field reads "none (practitioner did not specify)" and the criterion treats absence as evidence of reflexive engagement per the discrimination above.

The verdict-line is the audit-trail closure for each loop: future cycles can retrospectively evaluate whether the criterion correctly predicted the next loop's marginal yield.

### Late patch-additions

Cycle 019's Loop 6 was added at the gate based on user feedback after Loop 5 had completed and synthesis had begun. The criterion accommodates **late patch-additions** explicitly:

- If a synthesis pass surfaces a question the prior loops did not address, the criterion can be re-invoked: is the new patch (an additional loop) high-marginal-yield, or is the question scope-of-claim language the synthesis can encode without an additional loop?
- Late patch-additions are recorded in the research log with the verdict-line and a rationale for why the prior loops did not reach this point.

## Rejected alternatives

**A. Time-based termination (e.g., maximum 4 loops).** Rejected for the same reason fixed audit round-count was rejected in ADR-094 — marginal yield varies by problem and cycle. Some problems converge in 2 loops; others (Cycle 019's reflexive critique) need 6. A fixed count under-fits and over-fits.

**B. No termination criterion; rely on practitioner felt-trigger alone (status quo).** Rejected because the status quo produced the structurally fuzzy stopping point Cycle 018 named in its reflections. The methodology can scaffold the felt-trigger with the Pirolli-Card-anchored question; the practitioner can still override but does not have to make the decision from raw research-log content.

**C. Patch-switching as a Tier-2 methodology-principle level concept (no skill-text amendment).** Rejected because the evidence base supports structural encoding: Pirolli & Card 1999 is direct literature support; Cycle 018 evidence is direct gap evidence; the amendment is small and localized. The Tier-2 scope reasoning that applies to ADR-095 (thin cross-project evidence) does not apply here — the supporting evidence is well-established literature, not single-cycle observation.

**D. Bundle with ADR-094's Convergence-Saturation Signal as one cross-skill mechanism.** Rejected because the two mechanisms operate at different workflow points: ADR-094 fires at audit-round-end (within a single artifact's audit sequence); ADR-096 fires at research-loop-end (within the upstream research production sequence). The signals are conceptually related (both name marginal-yield saturation at a workflow boundary) but their dispatch points are distinct.

**E. Patch-switching as an explicit hook (Harness Layer enforcement).** Rejected because the criterion is agent-judgment-applied — the verdict line is the agent's reading of marginal yield, not a file-system-observable predicate the Stop hook can verify. Skill-Structure Layer alone is appropriate.

## Consequences

**Positive:**
- The RESEARCH loop has a named, literature-anchored termination criterion the methodology recognizes.
- The verdict-line format produces an audit-trail closure for each loop, supporting retrospective evaluation of patch-switching predictions.
- Late patch-additions (Cycle 019 Loop 6 pattern) are accommodated explicitly — the criterion is not a one-way exit; it can re-fire during synthesis if a new patch surfaces.
- The criterion is small (~10–15 lines of skill text) and localized to `/rdd-research`; the amendment cost is bounded.

**Negative:**
- The criterion's "expected observation" question (what would change the reading?) requires the practitioner to name counter-evidence in advance — a form of pre-mortem reasoning the practitioner may not be prepared to produce on demand. The criterion's value depends on the practitioner engaging the question rather than answering reflexively.
- The verdict-line format introduces a small artifact-overhead at each loop boundary. The cycle's evidence supports it as worthwhile, but the cost is real.

**Neutral:**
- The criterion does not change the research-loop's substantive work — only its boundary judgment. The agent continues to do ideation → research/spike → synthesis within each loop.
- The criterion applies to `/rdd-research` only. SYNTHESIZE-phase loops (if any) operate under the Synthesis skill's existing conventions; the methodology may extend the criterion to SYNTHESIZE in a future cycle if evidence warrants.

## Provenance check

- **Pirolli & Card (1999) information-foraging patch-switching**: source literature; cited in essay-outline-018 §10 ADR-CANDIDATE-019.3 and in `lit-review-019-methodology-overhead.md`.
- **Patch-Switching Criterion** as named concept: domain model Amendment #25 (Cycle 019, MODEL phase).
- **Calibration Move** as named concept: domain model Amendment #25 (Cycle 019, MODEL phase).
- **Essay-Outline-018 §10 ADR-CANDIDATE-019.3** specifies the Branch D remedy.
- **Cycle 019 Loop 6 evidence** for late patch-additions: cycle-status.md §From RESEARCH (Loop 6 re-opened RESEARCH at the gate); the criterion's late-patch-addition handling traces to this evidence.
- **Driver chain:** Pirolli & Card (1999) literature + Cycle 018 gap evidence + Essay-Outline-018 §10 ADR-CANDIDATE-019.3 → Cycle 019 MODEL gate commitment → ADR-096.

Drafting-time synthesis (not from the driver chain): the specific phrasing of the criterion's question, the satisfied / triggers-switch / triggers-synthesis enumeration, and the verdict-line format are drafting-time synthesis.
