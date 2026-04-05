# Active RDD Cycle: Sycophancy and RDD Reflexivity

**Started:** 2026-04-04
**Current phase:** DISCOVER (next)
**Artifact base:** ./docs/
**Essay:** 013-sycophancy-and-rdd-reflexivity.md

## Phase Status

| Phase | Status | Artifact | Key Epistemic Response | Notes |
|-------|--------|----------|----------------------|-------|
| RESEARCH | ✅ Complete | Essay 013 (updated with §7 spike evidence), research log (updated with Question 5), 1 lit review, citation audit, argument audit, reflection, spike experiment (16 runs, 4 scoring reports, experiment design, findings) | **Three design implications + spike findings.** (A) Heavier framing architecture in early phases — same genuine mechanisms deployed earlier, not different ones. (B) Every phase transition evaluated through sycophancy lens — framing stability as a signal. (C) Retrospective sycophancy audit on prior corpuses with measurable proxies. **Spike:** Adversarial framing ("strongest case against") overcorrects; belief-mapping framing ("what would I need to believe") achieves near-zero divergence. The Inversion Principle operationalized as epistemic question, not adversarial demand. Bias compounds through sequential artifacts. | 4 research loops, 1 lit review, 16+ web searches, 16 spike runs across 2 topics × 3 constraints × 2 leans. All P1/P2 audit fixes applied. |
| DISCOVER | ☐ Next | — | — | — |
| MODEL | ☐ Pending | — | — | — |
| DECIDE | ☐ Pending | — | — | — |
| ARCHITECT | ☐ Pending | — | — | — |
| BUILD | ☐ Pending | — | — | — |
| INTEGRATE | ☐ Pending | — | — | — |
| PLAY | ☐ Optional | — | — | — |
| SYNTHESIZE | ☐ Optional | — | — | — |

## Feed-Forward Signals

### From RESEARCH
1. **Content selection is the operative mechanism** — sycophancy operates through which truths get surfaced, not tone (Cheng et al. 2026, Science). Stylistic mitigations address the wrong dimension.
2. **The performative/genuine distinction** — can the structure be satisfied while leaving the most consequential information unsurfaced? If yes, performative. If no, genuine. The testable criterion for evaluating any anti-sycophancy mechanism.
3. **The sycophancy gradient** — pipeline is most vulnerable in early phases (RESEARCH, DISCOVER, MODEL) where structural constraints are weakest, most resistant in later phases (BUILD, PLAY) where work contacts non-sycophantic systems. Spike confirms: bias compounds through sequential artifacts.
4. **Three performative mechanisms** — anti-praise instruction (wrong dimension), AID engagement calibration (optimizes for user state not material demands), Inversion Principle as currently specified (agent selects what to invert).
5. **Three genuine mechanisms already in RDD** — argument auditor dispatch (architectural isolation), domain model invariants (externalized, durable), BUILD empirical tests (compilers can't sycophantically agree).
6. **The framing audit concept** — new specialist or extended argument auditor that surfaces frames the essay didn't choose, comparing essay against full evidence base. Turns negative space of content selection into a visible artifact.
7. **Commitment gating at phase boundaries** — user explicitly states which premises they're building on and which remain open. From Khurana et al.'s premise governance framework.
8. **The self-correction blind spot as design leverage** — same model in fresh context treats prior output as external input, activating dormant correction capabilities (Tsui et al. 2025). Architectural isolation works.
9. **Automation bias inverts engagement assumption** — enthusiastic, trusting users are more susceptible, not less (Sayin & Khasawneh 2025). Deep engagement may be the most dangerous level.
10. **Retrospective sycophancy audit** — measurable proxies: framing coverage, alternative engagement depth, vocabulary provenance. Applied to prior corpuses, not just current cycle.
11. **Pre-mortem framing for essays** — "assume this essay led the project astray — what would have caused that?" Exploits prospective hindsight (Mitchell et al. 1989) at the framing level.
12. **Invariant tensions** — Invariant 0 (authority may be illusory), Invariant 3 (pragmatic/epistemic boundary may be operationally blurred), Invariant 4 (productive engagement may be performatively productive).
13. **The convenience-of-AI IS the problem** — the agent's value proposition (filtering for relevance) is exactly where sycophantic agreement hides. Structure must constrain what can be omitted, not just what gets said.
14. **"Rub vs. opportunity"** — user's framing. Same genuine mechanisms deployed earlier (pragmatic cost, not epistemic) is the opportunity reading. The test is whether these ideas survive DECIDE and BUILD.
15. **Belief-mapping > adversarial framing (spike finding)** — "What would I need to believe for the alternative to be right?" achieves near-zero preference-driven divergence. "Strongest case against my preference" overcorrects by 2-6×. The mechanism: epistemic questions sidestep compliance; adversarial instructions activate it in reverse. The Inversion Principle should be operationalized as a question, not an instruction.
16. **Mandatory structure improves analytical quality** — both constraint types surfaced novel observations absent from unconstrained runs, independent of balance calibration. The constraints make absence visible.
17. **Research methods subagent (post-spike design contribution)** — a new specialist distinct from the argument auditor. Not "does the argument follow from evidence?" but "is the inquiry structured to produce trustworthy evidence?" Pre-execution research design review: catches confirmation bias in question framing, source selection bias, scope mismatches between evidence and claims, premature hypothesis-space narrowing. Cross-cycle pattern detection is the genuinely novel capability — no current mechanism looks across cycles for methodological patterns (e.g., does this user consistently narrow too early? do research questions consistently presuppose the preferred architecture?). Narrowest useful first version: a research design reviewer that runs before the research phase, reads the question set, and applies belief-mapping framing. Scope is a sequencing question, not a design question — start narrow, expand if it works.
18. **Orchestrator assertion-detection hook (post-spike design contribution)** — a `UserPromptSubmit` hook that pattern-matches on assertions with embedded conclusions and confidence markers ("clearly," "obviously," "the right approach is") at phase boundaries. Grounded in Dubois et al. (2026): sycophancy increases monotonically with epistemic certainty conveyed by the user. The hook fires conditionally: pattern detected AND artifact-production moment. Surfaces a reformulation prompt, not a correction — "This statement embeds a conclusion. What's the open question behind it?" (belief-mapping applied to the intervention itself — map the space, don't advocate). Runs before the model sees the prompt, giving it architectural isolation for free. Alert fatigue risk managed by phase-boundary condition — not every confident statement, only confident statements at moments where framing gets crystallized into artifacts.
19. **Three concrete design contributions for DECIDE** — (a) belief-mapping framing for the Inversion Principle, (b) research methods subagent with cross-cycle pattern detection, (c) orchestrator assertion-detection hook at phase boundaries. All three are Level 2-5 interventions positioned at the early pipeline where the vulnerability gradient says they matter most.
20. **The briefing document** (sycophancy-and-rdd-reflexivity.md) should be retired — all content migrated into research log and essay.

## Context for Resumption

- Cycle 9 investigates whether RDD's anti-sycophancy mechanisms provide genuine structural resistance or performative anti-sycophancy
- RESEARCH complete with essay 013, audited, reflection recorded, and spike experiment integrated
- The central finding: a testable distinction between performative and genuine structural resistance, a sycophancy gradient showing early phases are most vulnerable, and three design implications (heavier early framing architecture, phase-transition sycophancy evaluation, retrospective corpus audit)
- **Spike experiment:** 16 isolated pipeline runs across 2 topics × 3 constraint conditions × 2 user leans. Key result: belief-mapping framing ("what would I need to believe?") achieves near-zero divergence; adversarial framing ("strongest case against") overcorrects by 2-6×. Essay updated with §7 (spike evidence), §8 and §10 updated with cross-references. Research log updated with Question 5.
- **Three concrete design contributions for DECIDE:** (a) belief-mapping framing for the Inversion Principle — operationalize as "what would I need to believe?" not "argue against this," (b) research methods subagent — pre-execution research design review with cross-cycle pattern detection, narrowest useful first version, (c) orchestrator assertion-detection hook — UserPromptSubmit hook that flags embedded conclusions at phase boundaries using Dubois et al. detection heuristics
- The framing audit concept from the gate conversation also needs specification in DECIDE
- DISCOVER should update stakeholder maps, value tensions, and assumption inversions against the sycophancy research, spike findings, and the three design contributions. Key assumption inversion for DISCOVER: "the user's research questions are well-formed" — what if that's the most sycophancy-susceptible assumption in the pipeline?
- The briefing document (sycophancy-and-rdd-reflexivity.md) can be removed once confirmed that all content is in the research log and essay
- Spike artifacts preserved in `docs/essays/research-logs/spike-sycophancy/` (experiment design, findings, 16 run directories, 4 scoring reports, 4 blinding keys)
