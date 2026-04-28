# System Design: Pedagogical RDD

**Version:** 14.0
**Status:** Current
**Last amended:** 2026-04-28

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

3. **`.rdd/` infrastructure relocation.** ADR-085 partially supersedes ADR-070: process artifacts (audits, gates, cycle-status, dispatch log, migration marker, session/) relocate from `docs/housekeeping/` to `.rdd/` at the repository root. Process-vs-product directory separation via dotfile convention; `.rdd/` is corpus-visible, not hidden. Migration runs at BUILD via `/rdd-conform migrate-to-rdd`.

4. **Tier 1 Harness Layer demoted to advisory across all modes.** ADRs 088 / 089 / 090 amend ADR-064, ADR-067, and the In-progress phase field role. The compound check (PostToolUse dispatch log + Stop-hook cross-reference) continues to fire; missing artifacts and fabrication signals surface as model-visible advisories rather than blocks. Skill-text anchoring (ADR-065) is the load-bearing enforcement layer; the Harness Layer adds detection and visibility.

5. **Tightly-scoped prototyping as a research method.** ADR-087 §3 (reframed at the decide → architect gate) positions tightly-scoped prototyping alongside lit-review, literature search, and research-methods review — used to ground research in actual interaction and as counterforce against possibility-space explosion. Optional, not unconditional. Skill-text edit at the research → discover gate ships at BUILD.

6. **AI-as-orienter non-adoption.** ADR-086 names the operational-criterion problem: agent-mediated orientation is conceptually distinct from AI-as-reading-prosthetic, but the literature does not establish a tested criterion separating them in practice. The methodology defers adoption pending future-cycle conditions.

The full driver list, module amendments, and integration contracts for these changes live in [system-design.agents.md § Cycle 017 amendments](./system-design.agents.md#cycle-017-amendments--v140-readability--comprehensibility). Cycle 017 introduces no new modules in the dependency graph; the only new artifact module is `system-design.agents.md` itself, which is structurally a companion file rather than a new code module.

---

## Roadmap

See [`./roadmap.md`](./roadmap.md) for the active roadmap — work packages, classified dependencies, transition states, and open decision points. Cycle 017's BUILD work packages (the `/rdd-conform migrate-to-rdd` subcommand, the `/rdd-research` skill-text edit, hook-script and test-fixture path substitutions, field-guide regeneration, the code→doc dangling-reference graduation-check) are the active set going into BUILD.

---

## Design Amendment Log

The full log of design amendments — Cycle 1 through Cycle 016 with rationale and provenance — lives in [system-design.agents.md § Design Amendment Log](./system-design.agents.md#design-amendment-log). The most recent entry is summarized here:

| # | Date | What Changed |
|---|------|------------|
| 15 | 2026-04-28 | **System design v14.0 — Cycle 017 Readability & Comprehensibility.** Adopted companion-file pattern (ADR-084) — this document split from `system-design.agents.md`. Encoded Outcome Test as design principle (ADR-083). Path migration `docs/housekeeping/` → `.rdd/` (ADR-085, deferred sweep). Tier 1 Harness Layer demoted to advisory across all modes (ADRs 088 / 089 amending ADR-064 / ADR-067). In-progress phase field role-shift documented (ADR-090). Tightly-scoped prototyping added as Research-phase method (ADR-087 §3). AI-as-orienter explicitly non-adopted pending operational criterion (ADR-086). One new artifact module (`system-design.agents.md`); zero new code modules. Eight new ADRs (083–090); supersession headers on ADR-064 / ADR-067 / ADR-070; domain-model Amendment 22 landed at DECIDE. |

---

## Provenance

This system design's provenance traces through architectural drivers (the long table in `system-design.agents.md`) to specific ADRs (`docs/decisions/`), domain concepts (`domain-model.md` § Concepts and § Invariants), product discovery (`product-discovery.md` Stakeholder Map, Value Tensions), and essays (`essays/`). Provenance check subsections are used selectively — drivers are the primary attribution mechanism per ADR-069. The "Can I change this?" decision tree lives in [system-design.agents.md § Provenance Model](./system-design.agents.md#provenance-model).
