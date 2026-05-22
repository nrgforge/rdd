# Gate Reflection: Does RDD Over-Engineer? ARCHITECT → BUILD

**Date:** 2026-05-22
**Phase boundary:** ARCHITECT → BUILD
**Cycle:** 019 — Does RDD Over-Engineer?

## Belief-mapping question composed for this gate

The principal pedagogical move was a **warrant-elicitation against an embedded conclusion** the ARCHITECT phase had quietly inherited. The architecture artifacts characterized `docs/decisions/cycle-019-adr-index.md` as a "navigation-layer artifact" producing an actionable distinction (read-this-first; skip to ADR-097 if time-constrained) — language that left ambiguous whether the artifact was a **Cycle 019-scoped response** or a **generalizable architectural pattern** the methodology should adopt at future multi-ADR cycles.

The question composed:

> *"The reading-path artifact pattern at `docs/decisions/cycle-019-adr-index.md` is the cycle's structural response to the working-memory-budget concern raised at the DECIDE gate. The architectural amendments treat it as a navigation-layer artifact that itself passes ADR-095's Agent Outcome Test. But there's a deeper architectural question the snapshot didn't surface and the Open Questions hold: is the reading-path artifact pattern a one-off Cycle 019 response, or is it a generalizable architectural element of the methodology — a new kind of artifact in the three-tier hierarchy that future multi-ADR cycles should adopt? If it's generalizable, the architecture should name it (perhaps as a Tier-1.5 artifact between ORIENTATION.md and the ADR corpus). The system design currently records it as a Cycle 019-specific artifact. If future cycles producing 3+ ADRs would benefit from a parallel reading-path artifact, this is a methodology amendment in the making — and whether to encode it now (vs. wait for multi-cycle evidence per the cycle's own Empirical-Grounding Filter) is itself architecturally consequential."*

## User's response

> *"It's not a new kind of artifact. It was a reaction to my response to the gate reflection around whether granularity of ADRs contributes to overengineering versus making bolder more singular ADRs."*

The response cleanly distinguishes two categories the architecture had folded together:
- **Cycle 019 architectural output:** the specific reading-path artifact at `docs/decisions/cycle-019-adr-index.md`, produced as a reactive response to a specific gate exchange about ADR granularity vs. fewer-bolder-ADRs.
- **Methodology pattern:** a generalized architectural element of the methodology (a Tier-1.5 reading-path artifact type, or a phase-skill workflow step producing reading-path artifacts at cycle close when ADR count warrants).

The user's position: the artifact is the first category, not the second. The deeper question (does corpus-level granularity warrant pattern-level intervention?) remains the knowledge-graph corpus-collapse Open Question, not an answered methodology amendment.

## Pedagogical move selected

**Warrant elicitation** against an architecturally embedded conclusion. The question surfaced the ambiguity in the architecture's framing of the reading-path artifact and asked the user to distinguish two readings; the user's response named the distinction directly.

The agent's principal moves:
1. Presented the system-design / system-design.agents.md / roadmap amendments with the susceptibility snapshot result inline (no Grounding Reframe; two advisory observations).
2. Addressed the snapshot's documentation-gap observation inline (added "Alternatives considered and rejected" preamble naming the two rejected architecture-layer alternatives — new auditor-coordination agent; new `/rdd-patch-switch` skill).
3. Composed the warrant-elicitation question against the embedded "navigation-layer pattern" framing.
4. After the user's response, narrowed two artifact entries: the Cycle 019 Responsibility Matrix entry now reads "Cycle 019 Reading-Path Artifact (Cycle 019-scoped — NOT a generalized methodology pattern); future-cycle decisions about parallel artifacts are case-by-case judgments, not pattern instantiations." The system-design.md cross-cutting paragraph similarly narrowed.

## Commitment gating outputs

**Settled premises (the user is building on these going into BUILD):**

- The five Cycle 019 ADRs (094–098) at standalone scope with the reading-path artifact as Cycle 019's specific architectural output are the BUILD input — no further structural shifts to the ADR set.
- The reading-path artifact at `docs/decisions/cycle-019-adr-index.md` is **Cycle 019-scoped, not a generalized methodology pattern**. Future cycles produce parallel artifacts (or don't) by case-by-case judgment.
- The deeper architectural question (does corpus-level granularity warrant pattern-level intervention? — the knowledge-graph corpus-collapse question) remains **held open**, not answered by Cycle 019's outputs.
- BUILD debt is small and pre-scanned: WP-A (ADR-094 naming clarification) → WP-B (argument-auditor verdict-line) and → WP-C (citation-auditor verdict-line) → independent WP-D (research skill Patch-Switching) and WP-E (orchestrator vocabulary additions) → WP-F (integration verification + v0.8.7 release).
- The "no ship-together constraint" claim between Cycle 019 ADRs holds at the ADR level (the five ADRs are mechanistically distinct; no ADR depends on another's landing). The roadmap's WP-A → WP-B/WP-C hard-dependency is a workflow-level constraint, not an ADR-level constraint.
- BUILD mode is **auto** per ADR-091 — mechanical work; moderate stakes; catching-dominant stewardship.
- Per the susceptibility snapshot, no Grounding Reframe is warranted. FF1 evidence count unchanged from MODEL + DECIDE (one cycle's worth; the multi-cycle threshold is the graduation test).

**Open questions (the user is holding these open going into BUILD):**

- **Reading-path artifact generalization** — explicitly held open at this gate (the user clarified the artifact is Cycle 019-scoped; whether the pattern generalizes is a future-cycle judgment that the methodology has not yet made and does not commit to now).
- **Corpus-level granularity** — whether ~100-ADR corpus accretion rate is itself an over-engineering signal that the methodology's current criteria don't catch.
- **Knowledge-graph corpus collapse** — practitioner-named future-cycle research topic.
- **Consolidation-as-F-P2-instance** — whether the DECIDE-gate consolidation-then-restoration is the cycle's reflexive correction OR another instance of the F-P2 pattern. The multi-cycle graduation trigger for ADR-097 is the assessability test.
- **WP-E reachability gap (susceptibility-snapshot advisory observation #1)** — the orchestrator-vocabulary fitness criteria verify presence by grep but not reachability at the felt-trigger application moment during DECIDE-phase ADR-drafting. Whether to add a cross-reference in the Decide Skill's ADR-drafting step pointing practitioners toward the vocabulary is a stewardship judgment carried into BUILD; not blocking.

**Specific commitments carried forward to BUILD:**

1. **Six work packages with classified dependencies** — WP-A → WP-B/C (hard); WP-B → WP-C (implied); WP-D / WP-E independent; WP-F depends on all (hard). Total amendment size small: two agent files + one skill file + one orchestrator file + one ADR clarification + integration-verification + release housekeeping.
2. **Auto mode for BUILD** per ADR-091. Stewardship self-administered; review concentrated at start-and-end; auto-mode failure modes (design-alternative examination, scoping-judgment surfacing) acknowledged but not anticipated to bite this cycle (the ADR-specified amendment sites are tight).
3. **WP-E stewardship advisory** carried forward as an open consideration — the builder may add a Decide-Skill cross-reference toward the orchestrator vocabulary if BUILD-time judgment supports it. Not a precondition for v0.8.7 release.
4. **Reading-path artifact remains Cycle 019-scoped** — the system-design entries narrowed to reflect this at the ARCHITECT gate; future cycles do not inherit a "reading-path artifact pattern" obligation.
5. **All five ADRs status transitions** at v0.8.7 release — Proposed → Accepted per the standard transition.
6. **Three Open Questions carry forward** to future-cycle research scope — corpus-level granularity; knowledge-graph corpus collapse; consolidation-as-F-P2-instance.
7. **Methodology pattern around the gate's pedagogical move**: the user's clarification at the gate corrected an architecturally embedded conclusion the artifacts had quietly inherited. The pattern — *gate-conversation framings may quietly propagate into architectural language; the architect must surface them as questions, not record them as decided* — is recorded here for future cycles' ARCHITECT phase. This is **not a methodology amendment** (the cycle's own Empirical-Grounding Filter argues against thin-evidence amendments), but a stewardship observation worth recognizing.
