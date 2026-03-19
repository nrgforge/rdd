# Reflections: RDD as Plugin Architecture
*2026-03-18*

## Artifacts Over Context Passing

The essay frames agent extraction primarily as a context management strategy — keeping audit traces out of the phase skill's context window. The user challenged this framing: with 1M token context windows on Opus and Sonnet, context bloat is a weaker justification than it was.

The more compelling argument, surfaced during the epistemic gate, is that **artifacts are a better communication medium than context passing**. RDD already communicates between phases via artifacts (essays, domain models, ADRs, scenarios) — not by passing conversation context. Agent extraction should follow the same principle: agents read artifact files, produce artifact files, and the phase skill reads those artifacts.

This reframe matters because:
- **Artifacts are inspectable.** A citation audit report written to `docs/audits/citation-audit-007.md` can be read by the user, the skill, and future sessions. Context passed as a dispatch prompt is ephemeral.
- **Artifacts are durable.** They persist beyond the conversation. A future RDD cycle can reference the previous citation audit without re-running it.
- **Artifacts resist brittleness.** Context passing requires careful prompt engineering to include "just enough" — too little loses fidelity, too much wastes tokens. An artifact file is self-contained.
- **Artifacts align with RDD's existing philosophy.** The system already treats artifacts as the durable interface between phases. Making agents communicate via artifacts is not a new pattern — it's extending the existing one.

The essay's "asymmetric verbosity" section should be reframed in the DECIDE or ARCHITECT phase: the design principle is not "agents return summaries to save context" but "agents produce artifacts that phase skills consume, following the same artifact-mediated communication pattern that already governs inter-phase handoffs." The context savings are a side effect, not the motivation.

## The 1M Context Question

The user's challenge — is agent extraction worth it when context windows are 1M tokens? — deserves a direct answer rather than deflection:

**For context management alone:** Probably not worth it for most phases. A citation audit trace of a few thousand tokens is negligible in a 1M window.

**For model routing:** Still worth it. Running mechanical tasks on Sonnet or Haiku while the orchestrator runs on Opus saves cost and latency. This justification survives regardless of context window size.

**For artifact-mediated communication:** Worth it for reliability and inspectability reasons, not context reasons.

**For cross-cutting enforcement (hooks):** Worth it regardless of context window. Hooks solve code duplication, not context pressure.

The strongest case for the plugin architecture is not any single benefit but their combination: model routing + artifact-mediated communication + cross-cutting enforcement via hooks. The context argument is the weakest leg.

## Nothing Surprising — And That's Informative

The user noted that the research findings largely tracked expectations. This is itself informative: the RDD plugin restructuring is an engineering migration, not a research problem. The problem space was understood from the start — the research confirmed feasibility and surfaced implementation details (plugin manifest format, agent frontmatter fields, hook security constraints, marketplace distribution).

This suggests the PRODUCT DISCOVERY and MODEL phases can be lightweight for this cycle — the domain vocabulary is already established (it's RDD's own domain model), and the stakeholder needs are clear (the user is the primary stakeholder and knows what they want). The DECIDE phase matters most: ADRs for the specific agent boundaries, hook designs, and migration sequence.
