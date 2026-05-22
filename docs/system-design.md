# System Design: Pedagogical RDD

**Version:** 16.0
**Status:** Current
**Last amended:** 2026-05-22

---

## What this document is, who it's for, where to read what

This is the technical perspective on RDD — how the methodology is realized as a Claude Code plugin: skills, specialist subagents, hooks, manifests, and the artifact corpus they cooperate to produce. **First-encounter readers** orient through the diagram and brief module summaries below; **agents constructing context** for code work read the companion file at [system-design.agents.md](./system-design.agents.md), which carries the full architectural drivers table, responsibility matrix, integration contracts, fitness criteria, and test architecture in the form best suited to that work. **Sequencing** lives in [roadmap.md](./roadmap.md). **Decisions** live in [decisions/](./decisions/). **Vocabulary** lives in [domain-model.md](./domain-model.md).

The split between this artifact and `system-design.agents.md` is the **companion-file pattern** (ADR-084 Pattern B): a single human-facing surface for first-encounter readers, with a parallel-sibling agent-context file at a predictable path. The diagram retains its load-bearing role for human orientation; the dense reference material — driver tables, responsibility allocations, contract details — has been relocated rather than removed.

If you are coming to this corpus with no prior context, read [ORIENTATION.md](./ORIENTATION.md) first.

---

## Architecture at a glance

```
Plugin Manifest (.claude-plugin/plugin.json)
│
├── Skills Layer ─────────────────────────────────────────────────
│   Orchestrator (skills/rdd/SKILL.md)
│   ├── Phase skills: Research, Discover, Model, Decide, Architect, Build, Play, Synthesize
│   ├── Composable family: Build (outer loop) ──mode-shift──→ Debug, Refactor, Review
│   └── Utility skills: Conform, About
│
├── Agents Layer ───────────────────────────────────────────────── (8 specialist subagents)
│   citation-auditor • argument-auditor (with framing-audit extension)
│   lit-reviewer • spike-runner • conformance-scanner • orientation-writer
│   research-methods-reviewer • susceptibility-snapshot-evaluator
│
└── Hooks Layer ────────────────────────────────────────────────── (7 hooks)
    invariant-reminder • epistemic-gate-enforcer • skill-activator
    orientation-trigger • sizing-check
    tier1-verify-dispatch (PostToolUse on Agent — dispatch log writer)
    tier1-phase-manifest-check (Stop — advisory compound check)

Harness Layer infrastructure (declarative + verification):
    hooks/manifests/tier1-phase-manifest.yaml — per-phase Tier 1 obligations
    .rdd/dispatch-log.jsonl                   — session-scoped dispatch record
    .rdd/.migration-version                   — corpus migration marker
    .github/ISSUE_TEMPLATE/hook-failure.md    — hook failure surfacing
```

**Inter-skill communication is file-based.** Skills do not depend on each other directly; they read and write artifacts at known paths.

```
essay → product-discovery.md → domain-model.md → ADRs + scenarios + interaction-specs.md
                                                     ↓
                              system-design.md + system-design.agents.md + roadmap.md
                                                     ↓
                                       code + field-guide.md → field-notes.md
                                                     ↓
                              [full artifact trail] → synthesis outline → synthesis essay (user)
                                                     ↓
                                       ORIENTATION.md (derived at milestones)

field-notes.md feedback loop: → product-discovery.md (update mode), scenarios (missing),
                                interaction-specs.md (gaps), research (new questions)
```

---

## Modules — brief

### Pipeline phase skills

| Module | One-line purpose |
|---|---|
| **Orchestrator** (`skills/rdd/SKILL.md`) | Defines pipeline sequence, AID gate protocol, three-tier artifact hierarchy, cross-cutting principles (Invariant 8 anchoring, Three-Tier Enforcement Classification, Methodology Scope-of-Claim, Centered-vs-Infrastructure framing, Cognitive-Economy Criterion, Companion-File Pattern). Coordinates without owning phase work. |
| **Research Skill** (`skills/research/SKILL.md`) | Iterative research loop producing a citation-audited, argument-audited, framing-audited essay; essay is checkpoint; v0.8.4: optional validation-spike step at research → discover gate (ADR-087 §3). |
| **Product Discovery Skill** (`skills/discover/SKILL.md`) | Stakeholder maps, value tensions, assumption inversions in user voice; forward / backward / update modes. |
| **Model Skill** (`skills/model/SKILL.md`) | Domain vocabulary extraction with Product Origin column; invariant amendment site. |
| **Decide Skill** (`skills/decide/SKILL.md`) | ADRs, behavior + preservation scenarios, Cycle Acceptance Criteria Table, interaction specs; ADR supersession workflow with downstream sweep. |
| **Architect Skill** (`skills/architect/SKILL.md`) | Module decomposition, responsibility allocation, fitness criteria with qualitative-claim decomposition (ADR-076 gate); roadmap generation; v0.8.4: per-artifact Pattern A/B judgment for agent-context placement (ADR-084). |
| **Build Skill** (`skills/build/SKILL.md`) | Outer loop of composable skill family: TDD, stewardship checkpoints, integration verification, applicability check at pattern reuse, mode shifts to Debug / Refactor / Review with context continuity. |
| **Play Skill** (`skills/play/SKILL.md`) | Optional post-build experiential discovery via stakeholder inhabitation; orchestrating agent enters gamemaster mode; produces field notes categorized by feedback destination. |
| **Synthesis Skill** (`skills/synthesize/SKILL.md`) | Optional terminal: artifact-trail mining, three-phase framing conversation with structural experiments, two-register outline, conditional re-entry to Research. |

### Composable family inner skills

| Module | One-line purpose |
|---|---|
| **Debug Skill** (`skills/debug/SKILL.md`) | Hypothesis → trace → understand → fix; names what the mental model was wrong about before fixing. |
| **Refactor Skill** (`skills/refactor/SKILL.md`) | Three-Level diagnostic-remediation (smells → patterns → methodology) with AI Smell Taxonomy and AI hygiene prompts. |
| **Review Skill** (`skills/review/SKILL.md`) | Question-driven orientation for code review; corpus-grounded or context-reconstructive mode. |

### Utility skills

| Module | One-line purpose |
|---|---|
| **Conformance Audit Skill** (`skills/conform/SKILL.md`) | Audit / remediation / drift-detection / graduation; v0.8.4: `/rdd-conform migrate-to-rdd` subcommand for the `.rdd/` infrastructure relocation (ADR-085). |
| **About Skill** (`skills/about/SKILL.md`) | Plugin version reporting and adaptive methodology overview. |

### Specialist subagents (artifact-mediated, isolated context)

Eight subagents run in fresh contexts and communicate exclusively through file inputs and outputs. The dispatch-log + Stop-hook compound check (ADR-064 as updated by ADR-088) provides advisory verification that dispatches actually fired. Full descriptions in [system-design.agents.md § Specialist Subagent Modules](./system-design.agents.md#specialist-subagent-modules).

| Subagent | What it produces |
|---|---|
| citation-auditor | Two-section citation audit (existence + claim-source alignment) at canonical path |
| argument-auditor | Two-section audit: argument audit + framing audit (ADR-061) |
| lit-reviewer | Research-log entry from a structured literature search |
| spike-runner | Research-log entry from a focused code spike in a scratch directory |
| conformance-scanner | Conformance debt table mapping ADR declarations to codebase |
| orientation-writer | Regenerates ORIENTATION.md from the artifact trail |
| research-methods-reviewer | Pre-execution research-design review with belief-mapping; four-criterion scope per ADR-082 |
| susceptibility-snapshot-evaluator | Per-phase Susceptibility Snapshot at canonical path; advisory in v0.8.3 |

### Cross-cutting hooks

Five context-injection hooks (PreToolUse / UserPromptSubmit / Stop / PostToolUse) plus two Harness Layer hooks. **All hooks are advisory in v0.8.3** — the Stop-hook manifest check emits model-visible notices but does not block. Skill-text discipline (ADR-065 anchored dispatches) is the load-bearing enforcement layer; the Harness Layer adds visibility and detection. Full descriptions in [system-design.agents.md § Cross-Cutting Hook Modules](./system-design.agents.md#cross-cutting-hook-modules).

---

## How the Cycle 017 amendments fit

Cycle 017 (Readability & Comprehensibility) makes five architectural changes:

1. **Companion-file pattern adopted as architectural element.** ADR-084 names two patterns for agent-context content placement: Pattern A (audience-tagged sections within an existing artifact) below ~50% audience-tagged volume; Pattern B (companion file at predictable path `<artifact>.agents.md`) above. Directory-level audience separation is rejected. This document and `system-design.agents.md` are themselves the canonical Pattern B exemplar.

2. **Cognitive-Economy Criterion encoded as design principle.** ADR-083 establishes the Outcome Test ("does this produce direct human understanding without AI as workaround?") as the admissibility criterion for human-facing artifacts, with **in-place-first** as the default intervention move and **bolt-on / felt-additional** as the failure-mode signal. Methodology-wide default with four named exception conditions; not invariant-level pending structural anchor.

3. **`.rdd/` infrastructure relocation.** ADR-085 partially supersedes ADR-070: process artifacts (audits, gates, cycle-status, dispatch log, migration marker, session/) relocate from `.rdd/` to `.rdd/` at the repository root. Process-vs-product directory separation via dotfile convention; `.rdd/` is corpus-visible, not hidden. Migration runs at BUILD via `/rdd-conform migrate-to-rdd`.

4. **Tier 1 Harness Layer demoted to advisory across all modes.** ADRs 088 / 089 / 090 amend ADR-064, ADR-067, and the In-progress phase field role. The compound check (PostToolUse dispatch log + Stop-hook cross-reference) continues to fire; missing artifacts and fabrication signals surface as model-visible advisories rather than blocks. Skill-text anchoring (ADR-065) is the load-bearing enforcement layer; the Harness Layer adds detection and visibility.

5. **Tightly-scoped prototyping as a research method.** ADR-087 §3 (reframed at the decide → architect gate) positions tightly-scoped prototyping alongside lit-review, literature search, and research-methods review — used to ground research in actual interaction and as counterforce against possibility-space explosion. Optional, not unconditional. Skill-text edit at the research → discover gate ships at BUILD.

6. **AI-as-orienter non-adoption.** ADR-086 names the operational-criterion problem: agent-mediated orientation is conceptually distinct from AI-as-reading-prosthetic, but the literature does not establish a tested criterion separating them in practice. The methodology defers adoption pending future-cycle conditions.

The full driver list, module amendments, and integration contracts for these changes live in [system-design.agents.md § Cycle 017 amendments](./system-design.agents.md#cycle-017-amendments--v140-readability--comprehensibility). Cycle 017 introduces no new modules in the dependency graph; the only new artifact module is `system-design.agents.md` itself, which is structurally a companion file rather than a new code module.

---

## How the Cycle 019 amendments fit

Cycle 019 (ADRs 094, 095, 096, 097, 098 — *"Does RDD Over-Engineer?"*) produces five methodology amendments addressing the C7 failure mode named in essay-outline-018: *research-surveyed possibilities surviving into ADRs without empirical filter*. The cycle's evidence supports vocabulary additions and two narrow skill-text amendments; it does not yet support broader structural enforcement. The cycle's reflexive logic — heavy structural amendment from thin evidence would itself instantiate the C7 pattern — drove three of five ADRs to Tier-2 scope with multi-cycle graduation triggers.

Cycle 019's DECIDE phase made three structural shifts (5 ADRs → 1 consolidated ADR → 5 ADRs + reading-path artifact). The R3 narrow audit on the briefly-consolidated form caught a framing finding (FA-R3-P1) — the consolidation moment did not surface "five ADRs + reading-path artifact" as an option — and the practitioner restored the five-ADR form. The reading-path artifact `docs/decisions/cycle-019-adr-index.md` addresses the working-memory-budget concern as a navigation layer rather than via structural deletion. Domain-model Amendment #28 supersedes Amendment #27, recording the restoration and noting that **future practitioners facing similar structural-form decisions should surface the full option set including navigation-artifact alternatives before structural deletion**.

The cycle's five architectural changes:

1. **Convergence-Saturation Signal at audit-round-end (ADR-094, Skill-Structure Layer).** Default audit round count is 3; round 4 fires only when the signal does not trigger by R3 (P1 = 0, P2-new ≤ 1, no new framings); round 5 fires only if R4 surfaces a new P1; rounds beyond 5 require explicit practitioner authorization. The signal includes a **form-change baseline-reset rule** added at R3 — when an artifact undergoes form-change (restructuring, consolidation, replacement), the new form's first audit is its R1, not a continuation of the prior form's round count. Encoded as skill-text amendment to `agents/argument-auditor.md` (covering both the argument-audit and framing-audit sections of the combined dispatch per ADR-061) and `agents/citation-auditor.md`.

2. **Agent Outcome Test for agent-facing artifact admissibility (ADR-095, Tier-2).** Parallel to ADR-083's human-facing Outcome Test. At agent-facing artifact creation (ADR, scenario block, domain-model entry, system-design section, audit-report template, skill text), the practitioner-and-agent dyad applies the felt-trigger: does this produce direct agent consumption without re-orientation cost, or does it feel additional? The test's consumer-naming requirement is necessary but not sufficient — naming "future practitioners" without an actionable distinction is a trivially-passing answer. Tier-2 with graduation trigger to a candidate `/rdd-conform` audit step if multi-cycle evidence accrues.

3. **Patch-Switching Criterion at research-loop-end (ADR-096, Skill-Structure Layer).** Pirolli & Card (1999) information-foraging patch-switching applied at `/rdd-research` loop boundaries. The practitioner-and-agent dyad evaluates marginal yield against the opportunity cost of staying in the current patch; the verdict line (CONTINUE-this-patch / SWITCH-patch / SWITCH-to-synthesis) is recorded as audit-trail closure. Reflexive-vs-genuine pre-mortem discrimination is the criterion's load-bearing operational test — a reflexive answer ("more evidence for what's already established") triggers the switch condition. Late patch-additions (Cycle 019 Loop 6 pattern) accommodated explicitly. Skill-text amendment at `skills/research/SKILL.md` line 147 area.

4. **Empirical-Grounding Filter at DECIDE (ADR-097, Tier-2; the central commitment).** When an ADR commits to a feature based on research-surfaced possibility, the practitioner-and-agent dyad applies the felt-trigger: is this empirically grounded by **PLAY evidence**, **stakeholder-articulated demand**, **spike validation**, or **structural operationalization** (the four grounding-mechanism paths)? When grounded, the ADR proceeds normally. When not, the ADR takes one of two forms — Conditional Acceptance annotation (commitment taken; validation pending) or `adr-deferred-` filename pattern (commitment held until grounding accrues). Institutional patterns imported from llm-orc. Standalone-at-commitment-time but with distinct senses of "standalone": commitment-time vs. grounding-completion. Tier-2 scope honors the cycle's reflexive criterion; multi-cycle graduation trigger names the conditions under which Skill-Structure Layer enforcement would be warranted.

5. **Named-deferral of FF1 + FF3 (ADR-098).** FF1 is the practitioner-originated framing audit gap (the methodology's specialist subagents cover agent-produced claims but not practitioner-introduced framings at gate responses; the gate is the only check). FF3 is the Essay-Outline amendment re-audit protocol (backward-propagation events warrant narrow re-audit; the methodology has no automatic trigger). Both are recognized at the vocabulary level with **two-direction graduation triggers** (harm evidence OR reliance evidence) — the asymmetry closed so that cycles running the correct behavior accumulate graduation evidence rather than no evidence.

**Architectural posture going into BUILD.** The cycle's BUILD debt is small and pre-scanned: two skill-text amendments (the saturation-signal verdict-line step in two agent files; the Patch-Switching Criterion at one research-skill site) plus an ADR-094 naming clarification (the ADR's three-file enumeration should restate as two files covering the argument-auditor's combined dispatch and citation-auditor per ADR-061). Three ADRs (095, 097, 098) require no codebase amendment beyond the domain-model encoding already present at Amendments #25, #26, #28. The BUILD mode is anticipated as **auto** per ADR-091 (mechanical work; moderate stakes; catching-dominant stewardship); confirmed at BUILD entry.

**Cycle 019 reading-path artifact (Cycle 019-scoped, NOT a generalized pattern).** `docs/decisions/cycle-019-adr-index.md` is a navigation-layer artifact: ~120 lines indexing five ADRs (~1,500 lines total) with reading-order guidance, central-commitment naming, and per-ADR audience triggers. It is a **case-specific architectural response** to the Cycle 019 DECIDE-gate exchange about ADR granularity vs. fewer-bolder-ADRs — not a methodology pattern to apply at future multi-ADR cycles. The deeper question of whether RDD's corpus-level granularity warrants pattern-level intervention is the knowledge-graph corpus-collapse Open Question (held; not answered by this artifact). Clarified at the ARCHITECT gate 2026-05-22 — the artifact stays as Cycle 019's record; future cycles produce or don't produce parallel artifacts by case-by-case judgment, not by pattern instantiation.

**Three Open Questions held into future cycles:**
- **Corpus-level granularity.** Whether the rate of ADR accretion across RDD's ~100-ADR corpus is itself an over-engineering signal the methodology's current criteria don't catch. Named as future-cycle research scope.
- **Knowledge-graph corpus collapse.** Practitioner-named future-cycle topic: can methodology corpus information be collapsed into a knowledge-graph-type format that respects working-memory bounds while preserving audit-trail integrity?
- **The DECIDE-gate five-to-one consolidation as a fresh F-P2 instance.** Whether the consolidation-then-restoration is the cycle's reflexive correction OR another instance of the same pattern (the cycle preferring less of itself, again). The graduation trigger for ADR-097 is the multi-cycle test that makes this question assessable.

**Cycle 019 evidence base scope-of-claim caveat.** Cycle 019's findings are research-not-validation. The cross-project evidence base (zani, llm-orc, plexus; ~26 sampled ADRs in depth) is agent-conducted and carries agent-reading uncertainty. The MODEL gate and DECIDE gate together demonstrated two intra-cycle instances of Practitioner-Originated Framing Absorption — recorded as **one cycle's worth of evidence** for FF1 graduation count regardless of intra-cycle frequency. Future cycles applying ADRs 094–098 produce the validation evidence Cycle 019 cannot.

The full module amendments, responsibility-matrix entries (24 new domain concepts from Amendment #25 + qualifications from #26 + the consolidation reversal from #28), Cycle 019 fitness criteria, and boundary integration tests live in [system-design.agents.md § Cycle 019 amendments](./system-design.agents.md#cycle-019-amendments--v160-empirical-grounding-filter-and-related-methodology-amendments). Cycle 019 introduces no new modules in the dependency graph; two modules are amended (Research Skill, Argument Auditor Agent — both already amended in v15.0 for Cycle 018), plus the Citation Auditor Agent (first amendment since v12.0) and small Orchestrator vocabulary additions. The pre-BUILD sweep checklist consolidates the conformance scan's BUILD-debt items.

---

## How the Cycle 018 amendments fit

Cycle 018 (Essay-Outline Form Change) makes a focused architectural change to the RESEARCH artifact form and the argument-auditor's scope:

1. **Essay-Outline replaces prose essay as the RESEARCH artifact form.** ADR-092 introduces a four-section artifact (Abstract Section / Argument-Graph / Citation-Embedded Outline / References) under **Pyramid Refinement** — a structural property in which each level expands cleanly into the next. The form is RESEARCH-scoped; SYNTHESIZE's existing outline-then-user-writes-prose pattern is unchanged. Reflections and synthesis essays retain narrative prose form. Legacy prose essays remain at their existing paths under their existing names (no retroactive migration); the filename pattern (`essay-outline-NNN-*.md` vs. legacy `NNN-*.md`) distinguishes the forms.

2. **Argument-auditor scope extended to Essay-Outline as fourth named genre.** ADR-093 extends the argument-auditor's responsibilities to consume the Argument-Graph section as **structured input**, traverse the four-tier pyramid, verify expansion fidelity at three boundaries plus reverse-direction, and apply META audit-time review. The Skill-Structure Layer amendment to `agents/argument-auditor.md` anchors the auditor's Essay-Outline behavior per Invariant 8 — the mechanism is not judgment-anchored.

3. **Outline-Coherence Signal as stewardship trigger.** ADR-092 §6 names the signal that fires when the pyramid does not read cleanly within a cycle's scope, with a discrimination test routing the diagnosis: Boundary 1 (Abstract → Argument-Graph) failure → scope-suspect (consider splitting the cycle); Boundary 2 (Argument-Graph → Citation-Embedded Outline) failure → discipline-suspect (re-run production with discipline tightening). The signal is a stewardship trigger, not an auto-action.

4. **Layer separation between structural verification and conventional discipline.** ADR-092 §5 separates the verification layers: Outline-Production Discipline (per-bullet — Synthesis Bullets, scope-qualification bullets, CONFIDENCE-LEVEL tags, named meta-moves) is anchored conventionally in `/rdd-research` skill text; pyramid expansion fidelity is anchored structurally in the argument-audit per ADR-093. The methodology does not claim per-bullet discipline is reliable under task load — Outline-Production Discipline's reliability is held as an open question structurally analogous to Cycle 10's prose-hardening-doesn't-work finding. What IS anchored is the pyramid-expansion check, which fires structurally regardless of whether per-bullet discipline was achieved.

5. **Scope-of-claim caveats encoded for downstream consumption.** Downstream artifacts citing the cycle's CRESS-convergence or citation-comparison evidence carry: (a) the CRESS scope-transfer-via-analogy caveat (the two-thread convergence reaches the same diagnostic through a shared analogy rather than through two fully independent frameworks); (b) the citation-comparison method-scope caveat (the 3 unique-to-prose vs. 0 unique-to-outline P1 errors is scoped to Cycle 018's prose-production method); (c) the Kim et al. Open Question 7 caveat (output-side susceptibility reduction during production may be offset by input-side regressive-sycophancy effects in downstream consumers — held as Neutral consequence with future-cycle empirical test framing).

6. **Ship-together constraint for ADR-092 + ADR-093.** The two ADRs ship together at BUILD: the layer separation in ADR-092 §5 (Pyramid Refinement audit catches discipline failures at the structural level) is operative only when both ADRs ship together. A single-ADR BUILD would leave the layer separation degraded to discipline-alone — the Invariant 8 risk the form change is designed to mitigate.

The full module amendments, responsibility-matrix entries (24 new domain concepts + 2 actions from Amendment 23), Cycle 018 fitness criteria, and boundary integration tests live in [system-design.agents.md § Cycle 018 amendments](./system-design.agents.md#cycle-018-amendments--v150-essay-outline-form-change). Cycle 018 introduces no new modules in the dependency graph; two modules are amended (Research Skill, Argument Auditor Agent) plus four cross-cutting amendments (Orchestrator, ORIENTATION.md, this system-design pair, Domain Model follow-on Amendment 24 post-BUILD). The downstream-artifact sweep is deferred to the BUILD phase; the unified pre-BUILD sweep checklist consolidates ADR-092 §10, ADR-093 §5, and conformance-scan-018-decide.md targets into eight files plus two fixture tests.

---

## Roadmap

See [`./roadmap.md`](./roadmap.md) for the active roadmap — work packages, classified dependencies, transition states, and open decision points. Cycle 017's BUILD work packages (the `/rdd-conform migrate-to-rdd` subcommand, the `/rdd-research` skill-text edit, hook-script and test-fixture path substitutions, field-guide regeneration, the code→doc dangling-reference graduation-check) are the active set going into BUILD.

---

## Design Amendment Log

The full log of design amendments — Cycle 1 through Cycle 016 with rationale and provenance — lives in [system-design.agents.md § Design Amendment Log](./system-design.agents.md#design-amendment-log). The most recent entry is summarized here:

| # | Date | What Changed |
|---|------|------------|
| 17 | 2026-05-22 | **System design v16.0 — Cycle 019 Empirical-Grounding Filter and related methodology amendments.** Five ADRs (094, 095, 096, 097, 098) at standalone scope with a reading-path artifact (`docs/decisions/cycle-019-adr-index.md`) as the navigation layer (per domain-model Amendment #28's restoration of the briefly-consolidated form). **ADR-094** introduced the **Convergence-Saturation Signal** as a Skill-Structure Layer mechanism at audit-round-end (default 3 rounds; rounds 4–5 conditional on the signal; form-change baseline-reset rule added at R3 — operationally demonstrated by Cycle 019's own R3 audit); applies to `agents/argument-auditor.md` (covering both argument-audit and framing-audit sections of the combined dispatch per ADR-061) and `agents/citation-auditor.md`. **ADR-095** introduced the **Agent Outcome Test** at Tier-2 — admissibility criterion for agent-facing artifacts parallel to ADR-083's human-facing test; consumer-naming requirement is necessary but not sufficient (the trivially-passing-answer failure mode is named). **ADR-096** introduced the **Patch-Switching Criterion** at Skill-Structure Layer — Pirolli & Card (1999) information-foraging applied at `/rdd-research` loop-end; verdict-line format (CONTINUE-this-patch / SWITCH-patch / SWITCH-to-synthesis) with reflexive-vs-genuine pre-mortem discrimination; late patch-additions accommodated (the Cycle 019 Loop 6 pattern). **ADR-097** introduced the **Empirical-Grounding Filter at DECIDE** as the cycle's central Tier-2 commitment — felt-trigger question at ADR-drafting against four grounding-mechanism paths (PLAY evidence; stakeholder demand; spike validation; structural operationalization); two non-grounded forms (Conditional Acceptance; `adr-deferred-` filename pattern); two senses of "standalone" (commitment-time vs. grounding-completion); discriminating-criterion gap (Target 2) acknowledged. **ADR-098** records FF1 + FF3 as named-deferrals with two-direction graduation triggers (harm OR reliance evidence). Domain-model Amendments #25 (24 new concepts; 5 actions; ~25 relationships; 6 open questions; 24 synonym aliases), #26 (R5 narrowing — PLAY-as-Filter / Distributed Remedy Architecture / Kitchen-Sink Outcome qualified), #28 (consolidation reversal, supersedes #27). Zero new modules; zero new specialist subagents; zero invariant changes; three modules amended (Argument Auditor Agent, Citation Auditor Agent, Research Skill); two cross-cutting documentation amendments (Orchestrator vocabulary additions; this system-design pair). BUILD debt small and pre-scanned (two skill-text amendments + ADR-094 naming clarification). Three Cycle 019 Open Questions carry forward to future cycles (corpus-level granularity; knowledge-graph corpus collapse; consolidation-as-F-P2-instance). Per ADR-076 each amendment carries decomposed `**Fitness:**` properties. BUILD mode anticipated as auto per ADR-091 (mechanical work; moderate stakes; catching-dominant stewardship). |
| 16 | 2026-05-14 | **System design v15.0 — Cycle 018 Essay-Outline Form Change.** Introduced Essay-Outline as the canonical RESEARCH artifact form (ADR-092) — four sections (Abstract / Argument-Graph / Citation-Embedded Outline / References) under Pyramid Refinement as structural property; operational compliance test (a)/(b)/(c)/(d); Outline-Production Discipline (Synthesis Bullets, CONFIDENCE-LEVEL tags, named meta-moves) anchored conventionally in `/rdd-research` skill text; pyramid expansion fidelity anchored structurally in argument-audit. Outline-Coherence Signal as stewardship trigger with discrimination test (Boundary 1 → scope-suspect; Boundary 2 → discipline-suspect). Argument-auditor scope extended to Essay-Outline as fourth named genre per ADR-093 — pyramid graph-traversal, expansion-fidelity verification at three boundaries plus reverse-direction, META audit-time review, pyramid coverage map + expansion-fidelity findings as output additions. Skill-Structure Layer anchoring per ADR-067-as-updated-by-ADR-089 in `agents/argument-auditor.md`. Form change is RESEARCH-scoped; SYNTHESIZE pattern unchanged; reflections + synthesis essays retain narrative prose form. Filename pattern `essay-outline-NNN-<slug>.md` co-exists with legacy `NNN-*.md` (no retroactive migration). Two new ADRs (092, 093); domain-model Amendment 23 landed at MODEL (24 new concepts + 2 actions); zero new code modules; zero invariant changes; two modules amended (Research Skill, Argument Auditor Agent) plus four cross-cutting amendments. Per ADR-076 each amendment carries decomposed `**Fitness:**` properties. ADR-092 + ADR-093 ship together at BUILD (layer separation degrades to discipline-alone if either ships without the other). Scope-of-claim caveats encoded: CRESS scope-transfer-via-analogy; citation-comparison method-scope; Kim et al. Open Question 7 input-side susceptibility. |
| 15 | 2026-04-28 | **System design v14.0 — Cycle 017 Readability & Comprehensibility.** Adopted companion-file pattern (ADR-084) — this document split from `system-design.agents.md`. Encoded Outcome Test as design principle (ADR-083). Path migration `.rdd/` → `.rdd/` (ADR-085, deferred sweep). Tier 1 Harness Layer demoted to advisory across all modes (ADRs 088 / 089 amending ADR-064 / ADR-067). In-progress phase field role-shift documented (ADR-090). Tightly-scoped prototyping added as Research-phase method (ADR-087 §3). AI-as-orienter explicitly non-adopted pending operational criterion (ADR-086). One new artifact module (`system-design.agents.md`); zero new code modules. Eight new ADRs (083–090); supersession headers on ADR-064 / ADR-067 / ADR-070; domain-model Amendment 22 landed at DECIDE. |

---

## Provenance

This system design's provenance traces through architectural drivers (the long table in `system-design.agents.md`) to specific ADRs (`docs/decisions/`), domain concepts (`domain-model.md` § Concepts and § Invariants), product discovery (`product-discovery.md` Stakeholder Map, Value Tensions), and essays (`essays/`). Provenance check subsections are used selectively — drivers are the primary attribution mechanism per ADR-069. The "Can I change this?" decision tree lives in [system-design.agents.md § Provenance Model](./system-design.agents.md#provenance-model).
