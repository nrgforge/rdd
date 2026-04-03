# ADR-052: AI Smell Detection Embedded in Refactor Skill

**Status:** Proposed

## Context

Essay 011 introduces the AI Smell Taxonomy — a three-tier classification of code patterns in AI-generated codebases:

- **Novel** (mechanistically require AI): Constraint Decay, Slopsquatting, Intent Debt
- **Exacerbated** (AI makes worse via specific mechanism): Avoidance of Refactors, Over-Specification, Distributed Incoherence, Bugs Deja-Vu, Oracle Mirroring, Logic Drift
- **Accelerated** (same problems at higher volume): broad exception handling, unused variables, security vulnerabilities

Each tier requires different intervention. The codebase-audit skill provides comprehensive multi-lens diagnosis (ten analytical lenses). The refactor skill's diagnostic step (Three-Level Refactor, level 1: Smells) is where smell identification happens during the build cycle. The question: how much AI-specific detection in the refactor skill vs. delegating to the codebase-audit skill?

Essay 011 §7 identifies three integration points between audit and refactor: (1) full codebase audit → refactor plan, (2) targeted lens checks during stewardship, (3) AI-smell detection.

## Decision

The refactor skill **embeds awareness of the full AI Smell Taxonomy** in its diagnostic step. Detection is part of the Three-Level Refactor's level 1 (Smells), not delegated to a separate tool.

**Level 1 (Smells) includes two smell catalogs for code-inspectable patterns:**
1. Classical smells (Fowler's catalog, organized problem-first per refactoring.guru)
2. AI-exacerbated smells (the six patterns with AI-specific mechanisms but code-level signatures)

**Separately**, the refactor skill includes **AI hygiene prompts** — practices invoked regardless of what smells are found in the code. These address the three genuinely novel AI patterns that have no code-level signature and cannot be detected through inspection:
- **Constraint Decay:** prompt the developer to check whether constraints established early in the session still hold in recently generated code
- **Slopsquatting:** flag unfamiliar package names for verification against live registries
- **Intent Debt:** prompt for rationale — does the developer understand *why* this code exists, or was it generated without externalized intent?

These are awareness prompts, not smell detection. The distinction matters: a developer who completes the hygiene prompts has been reminded to check, not assured that novel AI patterns are absent.

**For exacerbated smells**, the refactor skill applies the same remediation techniques as their classical counterparts, with awareness of the AI-specific mechanism. Avoidance of Refactors → actively consolidate instead of adding. Over-Specification → generalize where adjacent problems exist. Distributed Incoherence → check module responsibilities against the architectural intent. Oracle Mirroring → check mutation kill rates, not just coverage.

**Integration with codebase-audit:** When a full codebase audit has been performed, its findings can feed the refactor skill as prioritized input. But the refactor skill does not require an audit — its diagnostic step is self-contained. The build skill's stewardship checkpoints may invoke targeted codebase-audit lenses (specifically Structural Health and Dependency & Coupling) as an optional diagnostic supplement to the refactor skill's level 3 (Methodology) check. The refactor skill itself does not invoke the codebase-audit skill.

**Rejected alternative:** Delegate all AI smell detection to the codebase-audit skill and have the refactor skill consume only its output. Rejected because: (1) the refactor skill needs to detect smells inline during the TDD cycle, not after a separate audit pass; (2) most refactoring happens opportunistically (rule of three, when adding a feature, when fixing a bug) — requiring an audit first defeats the opportunistic workflow.

**Rejected alternative:** Create a separate AI-smell-detection skill. Rejected because: smell detection is not an independent activity — it is always the first step of remediation. Separating detection from remediation splits a naturally unified workflow.

## Consequences

**Positive:**
- The refactor skill addresses the full spectrum of AI-era code quality in a single diagnostic step, with qualitatively different intervention paths: classical techniques for accelerated patterns, deliberate application of classical techniques for exacerbated patterns, and awareness prompts (not automated detection) for novel patterns
- Inline detection supports the opportunistic refactoring workflow
- The three-tier taxonomy gives developers a vocabulary for AI-specific structural damage
- Integration with codebase-audit is optional, not required

**Negative:**
- The refactor skill's diagnostic step is more complex than a classical-only catalog
- Novel AI smells cannot be reliably auto-detected — the skill can only prompt awareness
- The codebase-audit skill and refactor skill may develop overlapping detection capabilities over time

**Neutral:**
- The codebase-audit skill's lenses may independently evolve to include AI-specific patterns — this is complementary, not conflicting
