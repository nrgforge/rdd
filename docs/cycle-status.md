# Active RDD Cycle: Adaptive Epistemic Gates and Self-Explanation

**Started:** 2026-03-30
**Current phase:** BUILD complete (PLAY, SYNTHESIS, or GRADUATE next)

### From DECIDE
21. **ADR-040 and Invariant 4 are co-dependent** — neither is coherent without the other. The prior "5-10 minute" constraint would conflict with iterative teaching.
22. **ADR-003 substantially superseded** — the fixed-assignment prompt table is replaced by AID cycle. ADR-003's prompts become a candidate library, not a fixed selection.
23. **19 conformance violations, all implementation-layer** — resolution sequence: AID in gates → reflection time naming → README/ORIENTATION → create /rdd-about → supersede ADR-003.
24. **Predictability was the annoying part** — user confirms the formulaic quality was what they experienced negatively. Well-grounded methodology should feel responsive, not random. Whether it works is an empirical question to be tested in practice.

### From ARCHITECT
25. **Earned fatigue detection is a cross-cutting concern** — belongs in the orchestrator's gate protocol definition, not in individual skills. The Attend step reads the full cycle's conversation history (not just current phase), enabling cross-gate pattern recognition. Orchestrator defines the awareness; skills execute it.
**Artifact base:** ./docs/
**Essay:** 009-adaptive-epistemic-gates.md

## Phase Status

| Phase | Status | Artifact | Key Epistemic Response |
|-------|--------|----------|----------------------|
| RESEARCH | ✅ Complete | Essay 009, research log, citation audit, argument audit, reflection | IRE trap diagnosis; Attend-Interpret-Decide cycle; challenge as response to deep engagement; "reflection time" naming; EventBridge reframing example; Invariant 4 is about waste not duration |
| DISCOVER | ✅ Complete | product-discovery.md updated | RDD as reclamation of craft against vibe-coded MO; "earned fatigue" vs scattered exhaustion; concrete fatigue-response language; scope boundary — RDD is for when you care about understanding; the "sufficient tests" consensus loses the craft |
| MODEL | ✅ Complete | domain-model.md (Amendment 13) | Invariant 4 amended: waste not duration, 5-10 min target removed. "RDD is for people who want to understand." 10 new concepts, Inversion Principle now at 7 locations. |
| DECIDE | ✅ Complete | ADRs 040-042, 20 new scenarios, argument audit, conformance scan (19 implementation-layer violations) | ADR-040 (AID cycle) and Invariant 4 amendment are co-dependent; ADR-003 substantially superseded; conformance scan provides BUILD resolution sequence |
| ARCHITECT | ✅ Complete | system-design.md v8.0, roadmap.md Cycle 5 | 5 WPs (AID in gates, reflection time, orchestrator, /rdd-about, verification); TS-1 after WP-A gives adaptive gates immediately; ADR-003 superseded |
| BUILD | ✅ Complete | 6 skill gates rewritten, orchestrator protocol, /rdd-about created, README/ORIENTATION updated, hook updated, ADR-003 superseded | 22 scenarios: 20 PASS, 2 PARTIAL (fixed). Plugin discovers 11 skills. No "5-10 minutes" references remain. |
| INTEGRATE | ☐ Pending | — | — |
| PLAY | ☐ Optional | — | — |
| SYNTHESIZE | ☐ Optional | — | — |

## Scope

Two interrelated concerns:

1. **Epistemic gates v2** — evolve gates from predetermined phase-boundary checkpoints to adaptive dialogues. Two axes: (a) assessment — agent reads user engagement patterns across the cycle; (b) teaching — agent explains choices, meeting the user where they are. Grounded in inquiry methodology (Haraway "staying with the trouble" as anchor). User-facing language should be friendlier than "epistemic gate."

2. **Self-explanation** — `/rdd-about` utility skill for version awareness and methodology overview. Orchestrator offers it to new users. The explanation depends on what the epistemology v2 pass discovers.

## Feed-Forward Signals

### From RESEARCH
1. **IRE trap** — current gates replicate the Initiation-Response-Evaluation pattern. The fix is engagement-sensitive prompts, not just artifact-specific ones.
2. **Attend-Interpret-Decide cycle** — three-phase gate process replacing fixed templates. Agent reads engagement signals, forms hypothesis, selects pedagogical move.
3. **Five response modes** — Challenge (deep engagement), Probe (adequate), Teach (thin), Clarify (confused), Re-anchor (disengaged).
4. **Challenge is the response to deep engagement** — not validation. Anti-sycophancy axis: the user who demonstrates understanding gets the hardest question.
5. **"Reflection time"** — user-facing name for epistemic gates. "Epistemic gate" stays in research vocabulary.
6. **EventBridge example** — concrete case of the reframing gap. RDD cycle stayed in the solution space it defined (SNS→SQS) rather than questioning the frame. The agent should step outside the frame when it holds enough cross-phase context to see narrowing.
7. **Invariant 4 reframed** — the constraint is on waste, not duration. Productive teaching time is not a violation; formulaic exchanges are the waste.
8. **Disengagement as opacity signal** — disengagement may mean fatigue (back off) or loss of comprehension (teach more). Conversation history distinguishes them.
9. **Agent-as-teacher within gates** — contingent teaching: diagnose gap, check, teach, check. Not separate from assessment.
10. **`/rdd-about` as design proposal** — self-explanation utility follows from the main argument but was not independently researched. Better specified in DECIDE.

### From DISCOVER
11. **RDD as reclamation of craft** — the methodology's value proposition is the felt experience of understanding, not productivity or quality. "Understanding is good and fun and also good for the brain." Not an efficiency argument.
12. **The "sufficient tests" consensus is insufficient** — the industry position that full-speed AI is fine with tests loses the craft of making, understanding, learning. RDD treats software as a practice to be understood, not an output to be validated.
13. **Earned fatigue is a good signal** — tiredness from deep engagement means take a break. Qualitatively different from the scattered exhaustion of context-switching across AI agents.
14. **Concrete fatigue-response language** — "It seems like the responses to these queries are not as in-depth as they could be so I just want to ask if it's a good time to take a break. Otherwise are there ways we can reframe our work to serve your current goals better?" Template for the re-anchor move.
15. **RDD asks something of the user** — two-way street. The methodology doesn't work without user engagement. Adaptive gates detect this but the user must also bring their part.
16. **Scope boundary** — RDD is for when it matters. Not silly feature work or bug fixes. Complex problems where the user cares about understanding.
17. **RDD as pace regulator** — gates anchor the user in one domain while AI productivity culture incentivizes scattering attention. Counter-practice to the productivity loop.

### From MODEL
18. **Invariant 4 amended** — "must be productive, not merely brief." 5-10 minute target removed. Propagation needed across all skill files, Essay 001, README.
19. **Question-asking asymmetry** — AI answers questions well but doesn't generate the questions that matter. RDD should develop the user's question-asking capacity. Three levels: (1) answer agent's questions, (2) engage with adaptive questions, (3) ask your own questions. Level 3 is where Invariant 6 (fading) leads.
20. **The heart of RDD** — "use AI for generation and scaffolding, then shift the fun part back to the user: engaging with problems that need thinking at the human level."

### From prior cycles
1. **Field notes (Cycle 4 PLAY):** Agent crosses Invariant 3 boundary in practice despite skill text stating the principle. Operational guardrails needed, not just principle statements.
2. **Field notes (Cycle 4 PLAY):** Gamemaster needs "refrain from" instructions alongside "do" instructions — silence, following the participant, raw observation.
3. **Field notes (Cycle 4 PLAY):** Recursive self-play is degenerate — evaluating facilitation while being facilitated collapses the frame.
4. **Essay 001 citations:** Prior work on epistemic gates, pedagogical epistemology — starting research base.
5. **User feedback:** Gates feel formulaic in practice. Predetermined questions don't adapt to context.

## Context for Resumption

- This cycle addresses the user's experience that epistemic gates can feel formulaic — the agent asks predetermined questions rather than adapting to what happened in the cycle
- Two design axes: assessment (reading user engagement) and teaching (explaining choices)
- Haraway's "staying with the trouble" is the user's most influential reference
- "Epistemic gate" stays in research vocabulary; user-facing language needs friendlier framing
- Build deliverables: amended gate protocol, `/rdd-about` skill, orchestrator amendment
- Prior cycle (Play & Interaction Spec) completed through PLAY, archived
