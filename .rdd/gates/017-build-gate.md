# Gate Reflection: Cycle 017 build → close

**Date:** 2026-04-28
**Phase boundary:** build → close
**Cycle:** Readability & Comprehensibility (017)

## Belief-mapping question composed for this gate

> What would you need to believe for the auto-mode BUILD pattern — implementation cycles without AID engagement at scenario-group boundaries — to be the right tradeoff for routine implementation work? And what cycle characteristics would shift the judgment back toward gated stewardship?

The question was composed against a specific signal from the build-phase Susceptibility Snapshot (`docs/housekeeping/audits/susceptibility-snapshot-017-build.md` Feed-forward Signal E): the BUILD phase ran in auto mode after the practitioner's high-level direction at the start, with the agent self-administering stewardship across all seven work packages. The snapshot named two failure modes auto mode does not catch — design-alternative examination and scoping-judgment surfacing — and recommended the dual-mode question be carried as a methodology-level item.

## User's response

The practitioner first asked for clarification of the framing — *"Explain auto-mode BUILD pattern as you put it"* — and the agent provided a teaching response covering (a) what auto-mode BUILD looked like in this cycle (one direction at the top, autonomous WP execution, concentrated review at start-and-end), (b) how that differs from `/rdd-build`'s prescribed gated pattern (per-scenario-group EPISTEMIC GATES with the AID cycle), (c) the tradeoff axis (auto optimizes throughput and reviewer-after-the-fact mode; forfeits design-alternative examination and scoping-judgment surfacing), and (d) why it is a question worth a methodology answer (the build skill currently has no language for auto mode; practitioners running it have no axes for deciding when it is appropriate).

The practitioner's substantive response: *"I see — I think adding that framing would be useful context for the agent and user in the future. There are circumstances where both modes are applicable for different reasons."*

Follow-up exchange: agent presented two questions — what distinguishes the modes (mechanical-vs-generative axis from the snapshot, plus practitioner availability, cycle stakes, stewardship locality as candidate axes), and where the framing should land (skill-text amendment, ADR, or both; in-cycle vs. Cycle 018). Practitioner response: *"c — I think this is in-cycle. We can do a patch release."* — committing to both the ADR and the skill-text edit, with v0.8.5 as a patch release.

## Pedagogical move selected

Teach (initial clarification of the framing) → Probe (two questions surfacing the operative axes and the landing scope). The teach move was driven by the practitioner's clarification request — *"Explain auto-mode BUILD pattern as you put it"* — and produced shared understanding before the substantive engagement. The probe surfaced specific commitments (axes + landing) the practitioner could respond to.

## Commitment gating outputs

**Settled premises (going into cycle close):**

- Auto-mode BUILD is a legitimate methodology-recognized pattern alongside gated mode, not a deviation. Both are applicable for different cycle characteristics.
- The methodology should name the framing so practitioners and agents have language and axes for the choice in future cycles.
- The amendment lands in-cycle (Cycle 017 reopens for a small mini-amendment) as a patch release (v0.8.5) — not deferred to Cycle 018.
- Both ADR and skill-text edit ship together (option c). The ADR codifies the methodology principle; the skill text operationalizes it via the `**BUILD mode:**` field.
- The agent composes the specific axes (mechanical-vs-generative, practitioner availability, cycle stakes, stewardship locality) drawing from the snapshot's framing and the agent's proposal; the practitioner accepts the agent's composition without further specification.
- Default mode is `gated` — preserves the existing canonical pattern and conservatism for practitioners new to the dual-mode framing. Auto mode is opted-in by deliberate declaration.

**Open questions (held into close):**

- **The two framing-audit findings on ADR-091 (FF-P2.1 and FF-P3.1).** FF-P2.1: the ADR legitimizes auto mode in-cycle without a compensating mechanism for the design-alternative-examination gap (the snapshot recommended a future DECIDE examination of compensating mechanisms; the in-cycle amendment ships the legitimization without that examination). FF-P3.1: the "heavy lifting" argument in ADR-091's Context section reads more naturally as support for auto mode being the expected execution form than for gated being the safe default — an internal tension between the framing and the commitment. Both held for practitioner judgment as future-cycle scope.
- **The narrow-circularity risk applied to ADR-091 itself.** The build-phase Susceptibility Snapshot named narrow circularity as the WP-D pattern (agent-authored ADR-090 driving agent-authored implementation in WP-D). ADR-091 has the same structural shape — agent-composed axes and mechanics in response to a one-sentence practitioner commitment. The amendment lands; the residual risk that the agent's composition does not match the practitioner's intent is held as an open question for a future cycle to revisit if the dual-mode framing produces operational friction.

**Specific commitments carried forward:**

- ADR-091 ships with v0.8.5 as a methodology amendment.
- `skills/build/SKILL.md` gains a "BUILD Mode Selection" subsection at the top of `## PROCESS`, before Step 0.
- `skills/rdd/SKILL.md` cycle-status schema gains a `**BUILD mode:**` per-entry field.
- One new fixture test (`test_build_mode_selection_documented.sh`) verifies the skill-text encoding.
- This gate exchange is itself field evidence of the dual-mode question — the practitioner engaged at the BUILD-exit gate (post-WP-G) but not at scenario-group boundaries within BUILD. The pattern the methodology now names is the pattern the cycle ran.
- v0.8.5 patch release per RELEASE.md: bump plugin.json, append CHANGELOG, commit, tag, push, GitHub release.

## Framing-audit findings carried forward (per ADR-061; user judgment, not auto-corrected)

The argument auditor's framing audit on ADR-091 (initial pass) surfaced three alternative framings the source material supported but the ADR did not adopt:

1. **Alternative A — Auto mode as a disclosure requirement rather than a recognized pattern.** The Susceptibility Snapshot's Signal E recommended a future DECIDE examination, not in-cycle legitimization. A narrower response would name the failure modes, require disclosure at cycle close when auto mode was used, and defer full recognition until more evidence or a compensating mechanism is available. ADR-091 chose recognition over disclosure.
2. **Alternative B — Gate density as a parameterized field rather than a binary mode.** The corpus's prior art for adapting mechanism intensity is parameterized fields (ADR-072 list, ADR-079 named boundary), not binary switches. ADR-091 deferred this to a future cycle for v1 simplicity (now in the Rejected Alternatives section).
3. **Alternative C — Mode selection as a retrospective label rather than a prospective declaration.** The practitioner's gate commitment ("useful context for the future") is consistent with retrospective annotation as much as pre-BUILD declaration. ADR-091 chose prospective.

Three available truths not featured: (T1) the snapshot's Signal E recommended a future examination, not an in-cycle full legitimization; (T2) the narrow-circularity risk the snapshot named for WP-D applies structurally to ADR-091's own genesis; (T3) peer ADRs 072 and 079 include lifecycle failure-mode analysis ADR-091 omitted (P2.2 added the lifecycle but not the failure-mode analysis at the same depth).

Dominant framing inversion — if auto mode is the natural execution pattern for a mature cycle and gated mode is the pedagogical intervention, the heavy-lifting argument supports the inverted framing more naturally than the chosen framing. Surfaced as user judgment for a future cycle to engage; not auto-corrected.
