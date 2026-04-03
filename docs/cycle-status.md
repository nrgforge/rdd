# Active RDD Cycle: Revamping rdd-build for Context-Reconstructive Building

**Started:** 2026-04-02
**Current phase:** BUILD ✅ Complete (PLAY/SYNTHESIZE optional)
**Artifact base:** ./docs/
**Essay:** 011-building-with-understanding.md

## Phase Status

| Phase | Status | Artifact | Key Epistemic Response | Notes |
|-------|--------|----------|----------------------|-------|
| RESEARCH | ✅ Complete | Essay 011, research log, citation audit, argument audit, reflection | Productive resistance is both foundational and distributed; five questions pragmatically sufficient; three-tier smell taxonomy is sharpest contribution; user draws the line on depth/scope | 4 research loops + AI pathology loop |
| DISCOVER | ✅ Complete | product-discovery.md updated | Everyday Developer as single stakeholder with two entry points; context-reconstructive makes build more capable not lesser; reconstructed facsimiles needed (especially work decomposition from roadmap); rdd-about as bridge for sharpening developers | New stakeholder, 6 tensions, 6 inversions, 9 vocab entries, 3 debt entries |
| MODEL | ✅ Complete | domain-model.md Amendment 15 | Context Gathering generalizes Collaborative Context-Gathering — same orientation, different direction (understanding existing changes vs making new ones); the protocol holds across all four skills | 24 concepts, 5 actions, 23 relationships, 12 synonym aliases; 5 original naming contributions |
| DECIDE | ✅ Complete | ADRs 048-054, scenarios updated, interaction-specs updated, argument audit, conformance scan | Composition should feel like mode shifts, not dispatch — skill boundaries are implementation details; the thread is understanding; standalone invocation is valid but inside build the transitions must be seamless | 7 ADRs, 40+ scenarios, 13 interaction spec tasks, 12 audit issues resolved |
| ARCHITECT | ✅ Complete | system-design.md v10.0, roadmap.md updated, ORIENTATION.md regenerated | Build skill density is agent instruction, not developer ceremony — the developer's experience is lightweight (orient, validate, build, check); the skill file is heavy because it encodes when the agent should pause and surface. TDAD principle applies: context > procedure, and Context Gathering is the most consequential step. Balance: AI drives, human navigates | Amendment #11: 2 new modules, 2 amended, 19 responsibility rows, 17 fitness criteria, 16 tests; 6 work packages |
| BUILD | ✅ Complete | 4 skill files (debug new, refactor new, build rewritten, review updated) + orchestrator updated | AI in the loop — the human builds understanding, the AI is in their loop serving that journey. Density is agent instruction not developer ceremony. | 6 WPs: protocol, debug, refactor, build rewrite, orchestrator, verification |
| INTEGRATE | ✅ Complete (within BUILD) | Verification pass: 2 structural + 5 cosmetic findings resolved | — | Conformance scan clean |
| PLAY | ☐ Optional | — | — | — |
| SYNTHESIZE | ☐ Optional | — | — | — |

## Feed-Forward Signals

### From RESEARCH
1. **White space confirmed** — no tool scaffolds the developer's understanding before and during building
2. **Context > procedure for AI agents** — TDAD: context outperforms procedural TDD instructions
3. **Shared context-reconstruction is real** — same pre-work questions, divergence after orientation
4. **Five orientation questions** — pragmatically sufficient, lossy compression of the full pipeline
5. **Productive resistance is both foundational and distributed** — orientation starts it, iterative engagement deepens it
6. **Three-tier smell taxonomy** — novel, exacerbated, accelerated; each tier needs different intervention
7. **The refactor step is reclaimed** — Red → Green → Refactor(smells → patterns → methodology)
8. **Four composable skills** — build, debug, refactor, review; user controls calibration
9. **Codebase audit is diagnosis without remediation** — rdd-refactor is the action arm
10. **Open: shared skill vs shared protocol** — DECIDE question
11. **Willison's golden rule has scoped exception** — principle holds for production work

### From DISCOVER
12. **Everyday Developer** — single stakeholder, two entry points (RDD practitioner in light mode; sharpening developer with no RDD background). Same need: orient before acting, come away sharper
13. **The skill teaches through use** — sharpening developer won't read a manifesto; the philosophy is implicit in the process
14. **Context-reconstructive makes build more capable, not lesser** — the enhancement benefits both modes; pipeline mode is deeper, not replaced
15. **Reconstructed facsimiles** — lightweight artifacts (mini-roadmap, testable behaviors, vocabulary) produced during orientation; gives stewardship something to check against
16. **Work decomposition is the most consequential reconstruction** — without work packages, the build loop has nothing to iterate through
17. **rdd-about as bridge** — for the sharpening developer who wants to understand the philosophy without running a full cycle

### From MODEL
18. **Context Gathering generalizes Collaborative Context-Gathering** — same orientation protocol, different direction (understanding existing vs making new changes). Validated by user experience
19. **Original naming contributions** — Productive Resistance, Constraint Decay, Distributed Incoherence, Oracle Mirroring, three-tier AI Smell Taxonomy. These give the skill family a diagnostic language
20. **No invariant amendments** — context-reconstructive mode extends Invariant 0 through a different mechanism, no contradictions
21. **Comprehension Debt now in domain model** — the Opacity Problem quantified (Osmani 2026). Links to Intent Debt as second-order manifestation

### From DECIDE
22. **Mode shifts, not dispatch** — skill composition inside build should feel like the build skill changing its lens, not dispatching sub-workflows. Skill boundaries are implementation details that disappear inside the build flow. Standalone invocation (`/rdd-debug`, `/rdd-refactor`) is where boundaries are visible and valid.
23. **The thread is understanding** — the connective tissue across all mode shifts. Debug, refactor, review are different lenses on the same thread. The developer should never stop thinking about the code to think about the process.
24. **Orientation quality vs understanding depth** — the argument audit forced a useful distinction. Focused mode preserves orientation quality; understanding depth scales with time. The essay's "five minutes of genuinely oriented work" is about orientation, not the full epistemic loop.
25. **Session artifacts for context compression survival** — reconstructed facsimiles written to `session/` directory. Not provenance records (outside ADR-031 scope) — working-memory externalization.
26. **Heuristic dependency classification at ticket level** — the roadmap's hard/implied/open scheme applies, but the classification is approximate without architectural grounding. A starting decomposition, not an architectural fact.
27. **AI hygiene prompts are distinct from smell detection** — novel AI patterns (Constraint Decay, Slopsquatting, Intent Debt) have no code-level signature. The refactor skill runs awareness prompts, not diagnostic detection.
28. **ADR-054 supersedes ADR-046** — the callout model evolves to seamless mode shifts with context continuity. The review skill retains standalone utility (ADR-043 intact).

### From ARCHITECT
29. **Build skill density is agent instruction** — the developer's experience is lightweight (orient, validate, build, periodically check). The skill file is heavy because it encodes the agent's side of the contract: when to pause, when to surface, when to shift mode. Procedure density ≠ developer ceremony.
30. **AI drives, human navigates** — use AI to its fullest potential while ensuring the human holds direction. The build skill shouldn't micromanage the AI; it should create checkpoints where the human confirms they're building the right thing in the right way for the right reasons.
31. **TDAD principle confirmed as load-bearing** — Context Gathering (context-first orientation) is the most consequential step. The procedural scaffolding (TDD, stewardship, mode shifts) creates moments where context matters — the rhythm, not the rules.
32. **Build skill at fitness threshold** — right at the "no module owns more than 10 glossary entries" line. Justified by domain complexity (building epistemically is inherently complex), not by poor decomposition. Monitor during BUILD.

## Context for Resumption

- This cycle redesigns rdd-build and creates rdd-debug and rdd-refactor as composable skills
- The user's framing: "orient first, set guardrails, then move fast" — orientation is foundational, TDD/stewardship is distributed
- **Key DECIDE insight:** composition is seamless mode shifts inside build, real entry points outside. The developer thinks about the code, not the process
- Context Gathering is an embedded protocol (ADR-049), not a separate skill — each skill adapts step 4 (synthesis) to its direction
- Reconstructed facsimiles (ADR-050) are session artifacts written to files, surviving context compression
- The argument audit surfaced 12 issues (all resolved); the conformance scan found no contradictions, 7 structural debt items for BUILD
- Two standalone conformance fixes needed before BUILD: interaction-specs.md in build read list, /rdd-play in build NEXT PHASE
- ARCHITECT produced system design v10.0 (Amendment #11): 2 new modules (Debug, Refactor), Build rewritten as outer loop, 6 work packages in roadmap
- User's build philosophy: "AI drives, human navigates" — build skill encodes agent behavior (when to pause, surface, shift), not developer ceremony
- TDAD principle is load-bearing: Context Gathering is step 1 and the most consequential part; procedural scaffolding creates moments where context matters
- Next: BUILD phase implements the composable skill family through the roadmap's work packages (WP-A through WP-F)
