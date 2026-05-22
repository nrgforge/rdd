# Conformance Scan Report — Cycle 019 DECIDE

**Scanned against:**
- `docs/decisions/adr-094-audit-round-count-convergence-saturation.md`
- `docs/decisions/adr-095-agent-outcome-test.md`
- `docs/decisions/adr-096-research-patch-switching-criterion.md`
- `docs/decisions/adr-097-empirical-grounding-filter-at-decide.md`
- `docs/decisions/adr-098-methodology-audit-gap-deferrals.md`

**Codebase:** `/Users/nathangreen/Development/rdd/`
**Date:** 2026-05-22

---

## Summary

- **ADRs checked:** 5 (ADR-094 through ADR-098)
- **Conforming (no codebase amendment required):** 3 (ADR-095, ADR-097, ADR-098)
- **Expected BUILD debt (Proposed ADRs — skill-text amendments pending):** 2 items (ADR-094 across 3 named files; ADR-096 in 1 file)
- **Immediate conformance violations (Accepted ADRs contradicted by codebase):** 0
- **Cross-cutting conflicts:** 0
- **Structural clarification needed:** 1 (ADR-094's reference to `framing-auditor.md` as a separate agent file is inconsistent with ADR-061's decision to extend `argument-auditor.md` rather than create a separate subagent)

---

## Conformance Debt Table

| ADR | Violation | Type | Location | Classification | Resolution |
|-----|-----------|------|----------|----------------|------------|
| ADR-094 | `argument-auditor.md` contains no Convergence-Saturation Signal verdict-line step at round-end position | missing | `agents/argument-auditor.md` (entire file; no round-end section exists) | Expected BUILD debt | Add signal-evaluation step per ADR-094 §"Signal-evaluation step (skill-text amendment)" at the round-end position in the agent's workflow |
| ADR-094 | `citation-auditor.md` contains no Convergence-Saturation Signal verdict-line step at round-end position | missing | `agents/citation-auditor.md` (entire file) | Expected BUILD debt | Add signal-evaluation step per ADR-094 §"Signal-evaluation step (skill-text amendment)" |
| ADR-094 | `framing-auditor.md` does not exist as a standalone file | naming discrepancy | `agents/` directory (no `framing-auditor.md` present; per ADR-061 the framing-audit section lives in `argument-auditor.md`) | Structural clarification | ADR-094's reference to `framing-auditor.md` should be reframed to "the framing-audit section of `argument-auditor.md` per ADR-061." See Cluster 1 below. |
| ADR-096 | `skills/research/SKILL.md` contains no Patch-Switching Criterion verdict-line at the research-loop boundary | missing | `skills/research/SKILL.md` line 147 (bare loop-again prompt: *"loop again with a new question, or proceed to the Essay-Outline?"*) | Expected BUILD debt | Add Patch-Switching Criterion criterion block and verdict-line format per ADR-096 §"Skill-text amendment site" and §"Verdict-line format" at the Step 3 → Step 4 decision point |

---

## Cluster 1: ADR-094 — Convergence-Saturation Signal (Skill-Structure Layer, Proposed)

**Status: Expected BUILD debt + structural clarification on naming.**

ADR-094 status is Proposed; its commitments are not yet operative. The three skill-text amendments it specifies have not been applied. The scan confirms:

- `agents/argument-auditor.md` — extensive skill text (~205 lines), no round-end section, no verdict-line block, no Convergence-Saturation Signal language.
- `agents/citation-auditor.md` — compact skill text (~63 lines), no round-end section, no signal language.
- `agents/framing-auditor.md` — **file does not exist.** Per ADR-061 (`docs/decisions/adr-061-framing-audit-as-argument-auditor-extension.md`), the framing audit is Section 2 of the argument auditor's dispatch, not a separate agent file. ADR-061 explicitly records: *"The subagent count remains at eight (not nine) because this extends an existing subagent rather than creating a new one."*

**Resolution required at ADR-094:** the ADR's three-file enumeration should be re-stated as a two-file enumeration covering the argument-auditor (both the argument-audit section and the framing-audit section round-ends) and the citation-auditor. The signal evaluates both sections of the argument-auditor's combined dispatch at the dispatch's end — Option (c) per the conformance scan's notes.

No existing text in any of these files specifies a competing round-count discipline. The current posture is silence — round-count is unspecified, which is the exact gap ADR-094 addresses. There is no conflict with existing text, only absence.

**BUILD action required after ADR-094 clarification:** Add the Convergence-Saturation Signal verdict-line step to `argument-auditor.md` (covering both the argument-audit round-end and the framing-audit round-end positions of the combined dispatch) and to `citation-auditor.md`.

---

## Cluster 2: ADR-096 — Patch-Switching Criterion (Skill-Structure Layer, Proposed)

**Status: Expected BUILD debt. No immediate conformance violation.**

ADR-096 status is Proposed. The Patch-Switching Criterion amendment to `skills/research/SKILL.md` has not been applied. The scan confirms:

- `skills/research/SKILL.md` line 147: current text is the bare felt-trigger prompt: *"Present a summary to the user and ask: **loop again with a new question, or proceed to the Essay-Outline?**"*

This is the status quo ADR-096's context identifies as the gap. No structured criterion, no Pirolli-Card-anchored question, no verdict-line format. Grep for "Patch-Switching", "marginal yield", "CONTINUE-this-patch", "SWITCH-patch", "SWITCH-to-synthesis", "opportunity cost" returns no matches.

No competing termination criterion is present in the skill text. The current text at line 44 (*"Repeat until the user says the problem space is sufficiently understood"*) and line 445 (*"User drives the questions: You facilitate and research; the user decides what matters and when understanding is sufficient"*) place the termination judgment entirely with the practitioner — exactly the status quo ADR-096 addresses. There is no conflict with existing text.

**BUILD action required:** At Step 3's loop-again decision point (line 147), replace or augment the bare prompt with the Patch-Switching Criterion criterion block and append the structured verdict-line format per ADR-096 §"The criterion" and §"Verdict-line format". ADR-096 specifies the amendment as ~10–15 lines of skill text.

---

## Cluster 3: ADR-095 — Agent Outcome Test (Tier-2, Proposed)

**Status: Conforming. No codebase amendment required.**

ADR-095 is Tier-2 methodology-principle level with no Skill-Structure Layer enforcement. Encoding sites:
1. `docs/domain-model.md` Concepts table — Agent Outcome Test as named concept (Amendment #25)
2. The ADR itself as historical record

Both satisfied. Domain model contains the full Agent Outcome Test entry, the Amendment #25 changelog confirms the concept was added, the synonym alias table includes `Agent Outcome Test | Agent-consumption test (acceptable as shorthand)`, the relationships table records the operationalization chain. The ADR file exists at the expected path.

---

## Cluster 4: ADR-097 — Empirical-Grounding Filter (Tier-2, Proposed)

**Status: Conforming. No codebase amendment required.**

ADR-097 is Tier-2 methodology-principle level with no Skill-Structure Layer enforcement. Encoding sites:
1. `docs/domain-model.md` Concepts table — Empirical-Grounding Filter, Conditional Acceptance, adr-deferred- Filename Pattern (Amendment #25)
2. The ADR itself as historical record

All satisfied. Domain model confirms:
- Empirical-Grounding Filter — full entry present, correctly scoped to DECIDE-layer, felt-judgment-anchored, Tier-2
- Conditional Acceptance — full entry present, referencing llm-orc institutional pattern (ADR-016)
- adr-deferred- Filename Pattern — full entry present, referencing llm-orc and plexus ADR-024 precedents
- Actions table: `Apply Empirical-Grounding Filter` action entry present
- Relationships table: `Empirical-Grounding Filter operationalizes Calibration Move for DECIDE-layer ADR-drafting (ADR-019.4 scope; Tier-2)`
- Amendment #25 + #26 confirm entries were added with R5 narrowing integrated

The Kitchen-Sink Mechanism, Kitchen-Sink Outcome, and their discriminating-criterion qualifier per R5 audit are present and consistent with ADR-097's §Target 2 framing.

---

## Cluster 5: ADR-098 — Named Deferrals FF1 and FF3 (Named-deferral, Proposed)

**Status: Conforming. No codebase amendment required.**

ADR-098 is a named-deferral. Conformance test: are graduation-trigger conditions named explicitly enough for future cycles to measure against them, and are FF1/FF3 recorded as named recognitions?

Both satisfied:

**FF1 (Practitioner-Originated Framing Absorption):**
- Domain model: Practitioner-Originated Framing Absorption — full concept entry; Cycle 019 MODEL gate demonstration; candidate future-cycle amendment
- Open Questions section: FF1 recorded with candidate amendment description
- Graduation trigger (2–4 cycles of evidence per ADR-098 §FF1): explicit named condition; future cycles can measure against it

**FF3 (Essay-Outline amendment re-audit protocol):**
- ADR-098 records FF3's recognition and graduation trigger
- Domain model Amendment #26 records the operational closure (R5 audit catching the pyramid violation; the R5 audit pattern as the cycle's current compound defense)
- Graduation trigger (2–4 cycles of in-place amendments without narrow re-audit): explicit named condition

No structural amendment to any skill file is required. The ADR's own framing of "surfacing-without-blocking" best-effort advisory posture (not Invariant 8 Tier-1) is consistent with how the domain model records them.

---

## Cluster 6: Cross-Cutting Conflict Check

**Status: No conflicts found.**

- **ADR-074 supersession check:** None of ADR-094 through ADR-098 contain "supersedes" or "updates" references to prior ADRs. All five are net-new methodology amendments within the existing framework. No supersession workflow triggers.
- **Competing round-count discipline:** No existing text in `argument-auditor.md` or `citation-auditor.md` specifies a round-count discipline that would conflict with ADR-094.
- **Competing RESEARCH loop-termination criterion:** No existing text in `skills/research/SKILL.md` specifies a competing termination criterion.
- **Competing artifact admissibility criterion:** No existing text in any skill or agent file specifies a different criterion for agent-facing artifact admissibility that would conflict with ADR-095. ADR-083 (human-facing) is the existing parallel.
- **Competing empirical-grounding requirement at DECIDE:** No existing ADR-drafting workflow specifies a competing filter.

---

## Resolutions and Next Steps

1. **ADR-094 naming clarification (immediate):** update ADR-094 §"Signal-evaluation step (skill-text amendment)" to replace the three-file enumeration with a two-file enumeration covering `argument-auditor.md` (covering both the argument-audit and framing-audit sections of the combined dispatch per ADR-061) and `citation-auditor.md`. This is an in-cycle clarification at DECIDE before BUILD; ADR-094's commitment becomes more precise.

2. **BUILD debt recorded for two ADRs (expected):** ADR-094 amendments to `argument-auditor.md` and `citation-auditor.md`; ADR-096 amendment to `skills/research/SKILL.md` line 147 area. Both are skill-text additions; both are localized; both are within the scope ADR-094 and ADR-096 specify.

3. **Three ADRs conforming as-is:** ADR-095, ADR-097, ADR-098 require no codebase amendment beyond the domain-model encoding already applied at Amendments #25 and #26.

4. **Cross-cutting check clean:** no conflicts with existing skills, agent definitions, or orchestrator files.

The conformance posture going into BUILD is healthy: two well-scoped skill-text amendments and one ADR-094 clarification before the BUILD phase begins.
