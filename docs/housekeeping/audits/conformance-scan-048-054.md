# Conformance Scan Report

**Scanned against:** `/Users/nathangreen/Development/rdd/docs/decisions/adr-001` through `adr-054`
**Codebase (plugin):** `/Users/nathangreen/.claude/plugins/cache/nrgforge/rdd/0.4.2/skills/`
**Hooks:** `/Users/nathangreen/.claude/plugins/cache/nrgforge/rdd/0.4.2/hooks/`
**Agents:** `/Users/nathangreen/.claude/plugins/cache/nrgforge/rdd/0.4.2/agents/`
**Date:** 2026-04-02

---

## Summary

- **ADRs checked:** 54
- **ADRs fully conforming:** 35
- **ADRs with violations:** 11
- **Violations found:** 14
- **Structural violations (blocks downstream phases):** 7
- **Cosmetic/minor violations:** 7

---

## Scope Note on ADRs 048–054

ADRs 048–054 describe a composable skill family (`/rdd-debug`, `/rdd-refactor`) and associated mechanisms (context gathering protocol, session artifacts, time budget, work decomposition, AI smell taxonomy, skill composition triggers) that do not yet exist as implemented skills. This is **expected and correct** — these are proposed decisions for future BUILD work.

The scan below checks two things for these new ADRs: (1) whether any existing code directly contradicts their decisions, and (2) whether existing code creates structural debt that would block or complicate their implementation.

---

## Conformance Debt Table

| ADR | Violation | Type | Location | Priority | Resolution |
|-----|-----------|------|----------|----------|------------|
| ADR-025 | `rdd-conform` declares three operations (Audit, Remediation, Drift Detection) but ADR-025 specifies four — the fourth being **Graduation**. Graduation is redirected to `/rdd-graduate` via a note but was intended as an operation of conform. | wrong-structure | `skills/conform/SKILL.md:26-31` | Cosmetic | ADR-025 was likely superseded in practice by the graduate skill extraction. If the conform skill intentionally delegates graduation, add an explicit note: "Graduation is intentionally separated as `/rdd-graduate` (see ADR-025 note on open design questions)." |
| ADR-029 | The `rdd-build` NEXT PHASE section (line 500) mentions only `rdd-synthesize` as the next step; it does not mention `rdd-play` at all. ADR-038 places PLAY between BUILD and SYNTHESIS. | missing | `skills/build/SKILL.md:498-501` | Structural | Add `rdd-play` as the preferred next optional phase, before synthesis. The pipeline sequence prescribed by ADR-038 is: `BUILD → [PLAY] → [SYNTHESIS]`. |
| ADR-036 | The `rdd-research` skill (Step 3) says: "If `research-log.md` already exists when starting a new cycle, it is likely from a prior interrupted session. Archive it…" — this is the old ADR-036-violating behavior (archive at next cycle start). Step 6 correctly archives at cycle end. The Step 3 archival check is a backup path that contradicts the ADR's intent when it fires as primary behavior. | wrong-structure | `skills/research/SKILL.md:78` | Cosmetic | Rename Step 3's handling to make explicit it is only an interrupted-session recovery path, not the normal archival trigger. The wording "Handle stale logs" is correct but the logic should never produce the primary archival path for a completed cycle. |
| ADR-037 | The `rdd-build` skill (Step 1 artifact list) does not list `interaction-specs.md` as a source artifact to read. ADR-037 states: "The `/rdd-build` skill reads them alongside scenarios as behavioral requirements." | missing | `skills/build/SKILL.md:26-38` | Structural | Add `interaction-specs.md` to Step 1 read list with a note: "Interaction specifications (`./docs/interaction-specs.md`) — workflow-level task decompositions. If present, treat as behavioral requirements alongside scenarios." |
| ADR-041 | The `rdd-rdd` orchestrator Cross-Phase Integration section (lines 276–306) uses the internal term "epistemic gate" repeatedly ("runs `/rdd-citation-audit` and `/rdd-argument-audit`... before the epistemic gate", "same `/rdd-argument-audit` that `/rdd-decide` invokes... applied to the narrative genre"). ADR-041 specifies "epistemic gate" is user-facing vocabulary only in research/design artifacts; user-facing skill text should use "reflection time." The orchestrator Cross-Phase section is internal to the orchestrator's operating logic but is surfaced to users when the table is presented. | wrong-structure | `skills/rdd/SKILL.md:276,283,284,285,305,306` | Cosmetic | These occurrences are in the orchestrator's internal cross-phase integration notes — arguably research/design vocabulary rather than user-facing. If the orchestrator text is ever surfaced directly to the user, replace these references with "reflection time" or qualify them. Low priority given the audience is the agent's operating context, not direct user output. |
| ADR-043 | The `rdd-rdd` AVAILABLE SKILLS table (line 31) lists `/rdd-lit-review` as a skill. No `lit-review/SKILL.md` file exists in the skills directory — `/rdd-lit-review` is implemented as the `lit-reviewer` specialist subagent (ADR-032). The table entry falsely implies it is a user-invocable skill. | exists | `skills/rdd/SKILL.md:31` | Structural | Remove `/rdd-lit-review` from the AVAILABLE SKILLS table. The lit-reviewer is a specialist subagent dispatched internally by `rdd-research`; it is not a user-facing skill. Alternatively, add a footnote clarifying it is dispatched automatically, not invoked directly. |
| ADR-043 | The `rdd-research` skill loop description (line 40) says: "via web search, `/rdd-lit-review` (for academic topics), or a spike". This implies `/rdd-lit-review` is a skill the user could invoke; it is implemented as a subagent dispatch (lines 60-61 of the same file clarify). | wrong-structure | `skills/research/SKILL.md:40` | Cosmetic | Align line 40 with lines 60-61: change "`/rdd-lit-review` (for academic topics)" to "lit-reviewer agent dispatch (for academic topics)". |
| ADR-048 | `/rdd-debug` skill does not exist. ADR-048 prescribes decomposing the monolithic build skill into four composable skills: `/rdd-build`, `/rdd-debug`, `/rdd-refactor`, and `/rdd-review`. The debug skill is missing. | missing | `skills/` (directory) | Structural | Expected — this is proposed future work. Flag as BUILD-phase debt for when ADR-048 is implemented. No existing code contradicts this decision. |
| ADR-048 | `/rdd-refactor` skill does not exist. Same prescription as above. | missing | `skills/` (directory) | Structural | Expected — proposed future work. The existing build skill's `TIDYING` section provides inline refactoring guidance but does not constitute the three-level diagnostic-remediation cycle specified by ADR-048/ADR-052. This is design debt, not a conflict. |
| ADR-048 | The existing `rdd-build` skill is monolithic — it does not compose `/rdd-debug` or `/rdd-refactor` through trigger conditions as ADR-054 prescribes. The STEWARDSHIP CHECKPOINTS section (lines 370-444) contains an inline "Tier 2: Deep Architecture Review" that duplicates what ADR-048 intends for the refactor skill. | wrong-structure | `skills/build/SKILL.md:370-444` | Structural | This is structural debt for the BUILD phase of ADR-048–054 work. When `/rdd-debug` and `/rdd-refactor` are created, the Tier 2 inline review logic should be extracted into those skills and replaced with explicit composition triggers per ADR-054. The current structure does not conflict with the ADRs but will require refactoring when the composable family is built. |
| ADR-049 | Context Gathering embedded protocol is not present in the `rdd-build` skill. ADR-049 prescribes that all four skills in the Composable Skill Family implement the five-step context-gathering protocol. The build skill's Step 1 reads artifacts in pipeline mode only — there is no context-reconstructive mode, no breadcrumb prompting, no orientation synthesis, and no user validation step. | missing | `skills/build/SKILL.md:26-38` | Structural | Expected — proposed future work for ADR-048–054 BUILD phase. Structural debt that must be addressed when the composable family is implemented. The review skill's context-gathering (which exists) is the reference implementation. |
| ADR-050 | Session artifacts (`session/` directory, `session-artifact: true` frontmatter, gitignore convention) are not present in any skill. ADR-050 prescribes that reconstructed facsimiles be written as lightweight markdown files in a `session/` directory. | missing | `skills/build/SKILL.md`, `skills/` | Structural | Expected — proposed future work. No existing code contradicts the convention. |
| ADR-052 | The AI Smell Taxonomy (Constraint Decay, Slopsquatting, Intent Debt, Avoidance of Refactors, etc.) is not present in the `rdd-build` skill's TIDYING or STEWARDSHIP sections. ADR-052 prescribes AI smell detection as embedded awareness in the refactor skill's level-1 diagnostic step, but the three-tier smell catalog is not in any existing skill. | missing | `skills/build/SKILL.md:271-300` | Structural | Expected — requires `/rdd-refactor` skill creation. The build skill's TIDYING list is classical-only (guard clauses, dead code, etc.). When `/rdd-refactor` is built, the full three-tier taxonomy must be present. |
| ADR-053 | Time budget mechanism exists only in `rdd-review` (line 38-41). ADR-053 prescribes that every skill in the Composable Skill Family prompts for available time during or after context gathering. The `rdd-build` skill has no time budget prompt. | missing | `skills/build/SKILL.md` | Structural | Expected — the time budget was designed alongside the composable family. When context-reconstructive mode is added to `rdd-build`, the time budget prompt should be added at the same point. |

---

## Conformance by ADR Group

### ADRs 001–011 (Epistemic Gates, Product Discovery)

**Conforming.** All five skills that have gates (research, discover, model, decide, architect, build) implement the Attend-Interpret-Decide cycle per ADR-040, use "reflection time" in user-facing text per ADR-041, implement anti-sycophancy, apply contingent shift, and read cross-gate signals. The fixed-template approach of ADR-003 has been correctly superseded by the AID cycle. Synthesis subsumes its gate per ADR-016. Play subsumes its gate per ADR-038.

ADR-009's Product Origin column is present in the model skill's Concepts table template (`skills/model/SKILL.md:43`). ADR-011's inverted gate dynamic (user knows more) is correctly implemented in `skills/discover/SKILL.md:229-231`.

### ADRs 012–018 (Synthesis Phase)

**Conforming.** The synthesize skill implements all three conversation phases (ADR-013), the worth-the-calories quality gate (ADR-014), the synthesis essay as narrative context rollup (ADR-015), the gate-subsumed structure (ADR-016), the three narrative inversions (ADR-017), Level 1 cross-project prompting (ADR-018), and the re-entry mechanism (ADR-029).

### ADRs 019–024 (Artifact Hierarchy, Orientation, Roadmap, Field Guide)

**Conforming.** The orchestrator implements the three-tier artifact hierarchy, five-section ORIENTATION.md structure, agent-generates/user-validates model, regeneration milestones, and reading paths in the Who It Serves section. The architect skill generates the roadmap (ADR-022) and the build skill generates the field guide (ADR-023). Document sizing heuristics are in the orchestrator and the sizing-check hook.

One observation: ADR-020's prescribed five sections do not include "reading paths" per stakeholder. The orchestrator (line 345) adds reading paths to Section 2, which is an undocumented extension beyond what ADR-020 prescribes. This is additive and not a violation — but it is an undocumented enhancement that should be captured in the domain model or an ADR amendment.

### ADRs 025–026 (Conformance Audit, Scoped Cycles)

**Mostly conforming.** Scoped cycles are correctly described in the orchestrator. The conform skill correctly implements Audit, Remediation, and Drift Detection operations. The Graduation operation from ADR-025 is separated into `/rdd-graduate` with a redirect note — this is a deliberate structural choice but is not documented as a deviation from ADR-025 (see violation table above).

The conform skill's Step 1 reads skill files to understand expected structure (correct per ADR-025) but does not include `interaction-specs.md` in its audit checklist (lines 60-70 of `skills/conform/SKILL.md`). This is a format gap that could cause the audit to miss interaction spec conformance.

### ADRs 027–030 (Synthesis Enrichment)

**Conforming.** The synthesize skill implements four-dimension framing navigation (ADR-027), structural experiments (ADR-028), re-entry to RESEARCH (ADR-029), and the two-register outline with argumentative backbone and curatorial arrangement vocabulary (ADR-030).

### ADRs 031–036 (Plugin Architecture, Specialist Subagents, Hooks)

**Conforming.** Six specialist subagents exist as prescribed by ADR-032 (`citation-auditor`, `argument-auditor`, `lit-reviewer`, `conformance-scanner`, `orientation-writer`, `spike-runner`). All five hooks from ADR-033 are implemented. The invariant-reminder hook correctly filters to `docs/` files at the script level. Research log archival happens at cycle end per ADR-036.

One observation: ADR-033's hook table specifies the Orientation trigger fires on `Write on system-design.md, domain-model.md, or scenarios.md`. The implementation fires on `system-design.md | domain-model.md | scenarios.md | product-discovery.md` — product-discovery.md is an undocumented addition. This is additive and correct behavior; it is not a violation.

### ADRs 037–041 (Interaction Specs, Play, Adaptive Gates, Reflection Time)

**Mostly conforming.** The decide skill produces interaction specifications (ADR-037). The play skill correctly implements the three-movement structure with Gamemaster facilitation (ADRs 038–039). The AID cycle replaces fixed-template gates across all skills (ADR-040). "Reflection time" is used in all user-facing gate text (ADR-041).

**Violation:** The build skill does not list interaction-specs.md in its Step 1 read list despite ADR-037 prescribing that `/rdd-build` reads them alongside scenarios. See violation table row for ADR-037.

**Violation:** The build skill NEXT PHASE section does not reference `/rdd-play`. See violation table row for ADR-029.

### ADRs 042–047 (Utility Skills, Review)

**Fully conforming.** The `rdd-about` skill reports plugin version, calibrates to context, provides methodology overview, and offers to go deeper. The `rdd-review` skill implements both operating modes, question-based primary output, mechanical findings as secondary output, the three output tiers, time budget, facilitated walkthrough for large changes, review notes persistence, and the articulation step. The review skill correctly does not produce merge verdicts or severity ratings.

### ADRs 048–054 (Composable Skill Family — Proposed, Not Yet Built)

**No contradictions found.** Existing code does not conflict with any of the proposed decisions. The structural debt these ADRs will need to address during BUILD is itemized in the violation table and summarized below.

---

## Structural Debt for ADR 048–054 BUILD Phase

These items are not violations of existing ADRs — they are pre-existing structures that will require modification when the composable skill family is built:

1. **`skills/build/SKILL.md` is the work unit for decomposition.** The monolithic build skill becomes the outer loop (`/rdd-build`); its inline Tier 2 deep architecture review becomes input to `/rdd-refactor`; its debugging guidance becomes input to `/rdd-debug`. Composition trigger conditions (ADR-054) must be added.

2. **Context-reconstructive mode and time budget are entirely absent from `rdd-build`.** Both must be added from scratch. The `rdd-review` skill is the reference implementation for both mechanisms.

3. **Session artifacts require a new `session/` directory convention and gitignore entry.** Neither exists in the plugin today. The `.gitignore` at the project root should be checked and updated.

4. **The `rdd-build` Step 1 must add `interaction-specs.md`** to its read list regardless of whether the composable family is built — this is a standalone violation of ADR-037 that can be fixed immediately.

5. **The `rdd-conform` audit checklist should add `interaction-specs.md`** as an audited artifact. This is independent of ADR-048–054.

6. **The AI Smell Taxonomy must be embedded in `/rdd-refactor`** when it is created. The build skill should reference it but not re-implement it inline — the current TIDYING list is where it would land if not extracted.

7. **Work decomposition protocol (ADR-051)** requires the build skill to derive work packages from tickets/codebase when no roadmap exists. This is entirely new functionality.

---

## Notes

### Pattern: Proposed ADRs Are Clean Slates

ADRs 048–054 propose new skills and mechanisms without contradicting existing implementation. The build skill, while monolithic, does not structurally prevent decomposition. The absence of `/rdd-debug` and `/rdd-refactor` is the expected state before the BUILD phase for these ADRs.

### Pattern: Orchestrator Internal Language Vs. ADR-041 Scope

The orchestrator's Cross-Phase Integration section (lines 276–306) uses "epistemic gate" to describe inter-skill invocations (`/rdd-citation-audit... before the epistemic gate`). ADR-041 restricts "epistemic gate" to research/design vocabulary and prescribes "reflection time" for user-facing text. The boundary is ambiguous for orchestrator internals — this section is read by the orchestrating agent, not surfaced verbatim to users. No action required unless the section is refactored to be user-facing.

### Pattern: Lit-Reviewer Identity

The `rdd-rdd` orchestrator AVAILABLE SKILLS table lists `/rdd-lit-review` as if it were a user-invocable skill, but it is implemented as a specialist subagent (`agents/lit-reviewer.md`). This is the most concrete user-visible inconsistency in the current build and should be fixed before the next release.

### Observation: Reading Paths Are an Undocumented Enhancement

The orchestrator's ORIENTATION.md structure adds "reading path" entries per stakeholder in Section 2. This enhancement is not present in ADR-020 (Orientation Document Structure). It does not conflict with any ADR — it is additive — but it should be captured as a domain model or ADR amendment so it survives future skill updates without being silently stripped by a conform remediation pass.

### Observation: Interaction-Specs Missing from Conform Audit Checklist

The `rdd-conform` skill lists artifacts to check during audit (lines 60-70) but does not include `interaction-specs.md`. This means the conform tool would not detect a missing interaction-specs file on a project that has reached DECIDE phase. This is independent of the ADR-048–054 work.
