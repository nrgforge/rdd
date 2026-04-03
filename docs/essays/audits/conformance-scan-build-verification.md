# Conformance Scan Report

**Scanned against:** ADR-048, ADR-049, ADR-050, ADR-051, ADR-052, ADR-053, ADR-054
**Codebase:**
- `/Users/nathangreen/Development/rdd/skills/build/SKILL.md`
- `/Users/nathangreen/Development/rdd/skills/debug/SKILL.md`
- `/Users/nathangreen/Development/rdd/skills/refactor/SKILL.md`
- `/Users/nathangreen/Development/rdd/skills/rdd/SKILL.md`
- `/Users/nathangreen/Development/rdd/skills/review/SKILL.md`
**Date:** 2026-04-02

---

## Summary

- **ADRs checked:** 7 (ADR-048 through ADR-054)
- **Fitness criteria verified:** 16 (plus 3 cross-skill consistency checks)
- **Conforming criteria:** 12
- **Violations found:** 7 (2 structural, 5 cosmetic)

---

## Conformance Debt Table

| ADR | Violation | Type | Location | Priority | Resolution |
|-----|-----------|------|----------|----------|------------|
| ADR-049 | Review skill does not reference the Context Gathering protocol or the orchestrator's authoritative definition. Build, debug, and refactor all contain `Follow the Context Gathering protocol defined in the orchestrator (skills/rdd/SKILL.md, § Context Gathering Protocol)` — review has no equivalent pointer. Review implements its own orientation steps inline without acknowledging the shared protocol. | structural | `skills/review/SKILL.md`, Step 1 | Structural | Add a reference to the Context Gathering protocol in Step 1's mode-detection section, or add a note that review's Step 1–2 implements the protocol adapted for backward-looking review. This is load-bearing for protocol consistency and drift prevention. |
| ADR-054 | Review skill has no `## MODE SHIFT FROM BUILD` section. Debug (`skills/debug/SKILL.md:105`) and refactor (`skills/refactor/SKILL.md:152`) both have an explicit section documenting behavior when the build skill shifts into their mode (no Context Gathering, no time budget prompt, context carries through). Review is missing this section entirely. ADR-054 §Mode Shift: Review requires the same context-continuity guarantee. | structural | `skills/review/SKILL.md` (missing section) | Structural | Add a `## MODE SHIFT FROM BUILD` section to the review skill documenting: no re-orientation, no time budget prompt, session artifacts carry through in context-reconstructive mode, pipeline artifacts carry through in pipeline mode. Pattern is established by `skills/debug/SKILL.md:105-114` and `skills/refactor/SKILL.md:152-164`. |
| ADR-054 | Build skill's `→ Review Mode` section does not state `no re-orientation` explicitly. Debug mode (`skills/build/SKILL.md:512`) says "no re-orientation" and "carry through." Refactor mode (`skills/build/SKILL.md:520`) says "carry through." Review mode (`skills/build/SKILL.md:526-531`) describes what the review draws on but omits the explicit context-continuity statement. ADR-054 requires identical treatment across all three inner skills. | cosmetic | `skills/build/SKILL.md:526–531` | Cosmetic | Add "No re-orientation occurs" to the review mode's `**What happens:**` paragraph, matching the explicit language in debug and refactor modes. |
| ADR-052 | The refactor skill's Level 1 catalog omits the Accelerated tier of the AI Smell Taxonomy. ADR-052 defines three tiers: Novel (mechanistically require AI), Exacerbated (AI makes worse), and Accelerated (same problems at higher volume: broad exception handling, unused variables, security vulnerabilities). The refactor skill's level 1 implements only the classical catalog and the AI-exacerbated catalog. The Accelerated tier is absent. | cosmetic | `skills/refactor/SKILL.md:44–74` | Cosmetic | Add the Accelerated tier to Level 1 with a brief note that these patterns are addressed via classical refactoring techniques — no special mechanism needed. The skill should at minimum acknowledge the tier so developers know why they don't see a special intervention path for it. |
| ADR-049 | Debug and refactor skills both defer to the orchestrator for the full five-step Context Gathering protocol but do not inline an explicit Step 5 (Validate with user) check. The orchestrator's protocol includes "User validation is never skipped, even under time pressure." Neither debug nor refactor explicitly restates this invariant in their Context Gathering sections — they reference the orchestrator but a developer reading only the skill file would not encounter the load-bearing validation requirement. | cosmetic | `skills/debug/SKILL.md:13–29`; `skills/refactor/SKILL.md:13–27` | Cosmetic | Add a one-line note to each skill's Context Gathering section: "User validation (step 5) is never skipped — see the orchestrator's protocol definition." This ensures the invariant is visible in the skill file without duplicating the full protocol. |
| ADR-053 | Build skill positions the time budget prompt after Context Gathering (`skills/build/SKILL.md:63–72`) and includes it in Step 0, but bundles it with the context-reconstructive flow rather than presenting it cleanly as a post-orientation step for both modes. In pipeline mode, the skill proceeds from Step 0 directly to Step 1 with the time budget prompt in the middle of the context-reconstructive block. A developer following pipeline mode could miss the time budget prompt because it appears inside a section labeled `#### Time Budget` within the context-reconstructive subsection flow, not at the top level of Step 0. | cosmetic | `skills/build/SKILL.md:63–72` | Cosmetic | Relocate or visually separate the `#### Time Budget` subsection so it is unambiguously post-orientation for both pipeline and context-reconstructive modes. Currently it reads as a context-reconstructive-only step because it follows items 1–6 of the context-reconstructive branch. |
| ADR-048 | Available Skills table in the orchestrator counts 15 entries (research, discover, model, decide, architect, build, debug, refactor, play, synthesize, graduate, conform, about, review, lit-review). The fitness criterion specifies 14 entries (12 real skills + lit-review subagent + graduate). The table actually contains 15 entries. This is a count discrepancy between the system design v10.0 fitness criterion and the current implementation. | cosmetic | `skills/rdd/SKILL.md:19–33` | Cosmetic | Either update the fitness criterion in the system design document to read 15 entries (if the current table is correct), or reconcile which entry the fitness criterion was not accounting for. The table appears correct; the criterion specification may be stale. |

---

## Passing Criteria

The following fitness criteria passed without violation:

1. **All four composable skills implement Context Gathering** — Build explicitly implements the five-step protocol in Step 0. Debug and refactor defer to the orchestrator's authoritative definition. Review implements an equivalent protocol under a different structure. All four are functional.

2. **Context Gathering step 4 adapts per skill** — Build (`skills/build/SKILL.md:45–51`) emphasizes work decomposition and testable behaviors. Debug (`skills/debug/SKILL.md:17–24`) emphasizes expected-vs-actual divergence. Refactor (`skills/refactor/SKILL.md:18–25`) emphasizes structural health and architectural intent. Review (`skills/review/SKILL.md:46–60`) emphasizes design rationale and decision context. All four adaptations match ADR-049's specification.

3. **All composable skills support both operating modes** — Each skill has explicit pipeline and context-reconstructive handling. Build has both in Step 0. Debug has both in Step 1. Refactor has both in Step 1. Review has corpus-grounded and context-reconstructive modes in Step 1–2.

4. **Build produces work decomposition in context-reconstructive mode** — `skills/build/SKILL.md:52–56` specifies the work package structure matching ADR-051 exactly: scope, integration points, testable behaviors, dependency classification, optional demo scenario.

5. **Session artifacts written to `session/` with `session-artifact: true` frontmatter** — `skills/build/SKILL.md:61` specifies: "Write the validated work decomposition and orientation summary to a `session/` directory as markdown files with `session-artifact: true` frontmatter." The orchestrator's Artifacts Summary table (`skills/rdd/SKILL.md:356`) confirms the convention. Matches ADR-050.

6. **All composable skills prompt for time budget** — Build prompts at `skills/build/SKILL.md:65`. Debug prompts at `skills/debug/SKILL.md:31–38`. Refactor prompts at `skills/refactor/SKILL.md:29–37`. Review prompts at `skills/review/SKILL.md:39–42`. All four present.

7. **Time budget adapts scope, not understanding quality; orientation validation never skipped** — Build states explicitly: "Orientation validation is never skipped, even under focused time budget" (`skills/build/SKILL.md:72`). Debug states: "still name the misunderstanding. Even under extreme time pressure, 'what was the mental model wrong about?' takes seconds" (`skills/debug/SKILL.md:38`). The orchestrator's protocol states: "User validation is never skipped, even under time pressure" (`skills/rdd/SKILL.md:302`). Matches ADR-053's invariant.

8. **Build composes via mode shifts, not dispatch** — The MODE SHIFTS section header states: "seamless mode shifts — not dispatched sub-workflows" (`skills/build/SKILL.md:506`). Each mode uses "shifts into" language. "invokes" language does not appear in the mode shift descriptions. Matches ADR-054's rejected alternative.

9. **Debug skill names the misunderstanding before fixing** — Step 5 is titled "Understand" and opens with "Name the misunderstanding before fixing anything" (`skills/debug/SKILL.md:75–76`). The three required parts (what the model assumed, what reality is, the mechanism) are explicitly enumerated. Named as a non-negotiable in Important Principles (`skills/debug/SKILL.md:131`). Matches ADR-048's specification.

10. **Refactor skill includes AI Smell Taxonomy in Level 1** — Level 1 contains both the classical smell catalog and the AI-exacerbated smell catalog as a structured table (`skills/refactor/SKILL.md:59–74`). All six AI-exacerbated smells from ADR-052 are present. Matches ADR-052's "two catalogs" specification for code-inspectable patterns.

11. **AI hygiene prompts separate from smell detection** — Step 4 of the refactor skill is explicitly labeled "AI Hygiene Prompts" and opens with "These run separately from level 1 smell detection" (`skills/refactor/SKILL.md:104–116`). The three novel AI patterns (Constraint Decay, Slopsquatting, Intent Debt) are addressed only there, not in Level 1. Matches ADR-052's structural requirement.

12. **Orchestrator Available Skills includes `/rdd-debug` and `/rdd-refactor`** — Both entries present at `skills/rdd/SKILL.md:25–26` with accurate descriptions matching ADR-048's skill purposes.

13. **No dispatch/invoke language in build skill's mode-shift descriptions** — The words "dispatch," "dispatched," and "invoke" do not appear in the MODE SHIFTS section descriptions. The section explicitly names the rejected alternative (dispatch). Build uses "shifts," "carries through," and "the build flow shifts into" throughout.

14. **Mode-shift sections describe context continuity** — Debug mode: "carry through — no re-orientation" (`skills/build/SKILL.md:512`). Refactor mode: "carry through" (`skills/build/SKILL.md:520`). Review mode: describes what context is drawn on (partial — see violation above).

15. **Orchestrator cross-phase integration correctly describes build's composition behavior** — `skills/rdd/SKILL.md:325` states: "composes `/rdd-debug`, `/rdd-refactor`, and `/rdd-review` as seamless mode shifts within the build flow — the developer stays in the thread of understanding. Skill boundaries disappear inside build; they exist for standalone invocation." This precisely mirrors ADR-054's decision language.

16. **Context Gathering protocol in the orchestrator is consistent with build, debug, and refactor implementations** — The orchestrator defines the canonical five steps at `skills/rdd/SKILL.md:279–304`. Build's Step 0 (`skills/build/SKILL.md:29–61`) implements all five steps inline. Debug and refactor reference the orchestrator and add skill-specific adaptations for step 4. All three are consistent with the canonical definition.

---

## Cross-Skill Consistency Findings

### Review skill and the mode-shift model (ADR-054)

The review skill does not conflict with ADR-054 in any destructive way, but it is not aligned with it either. The skill was written before the composable skill family existed and retains its pre-family character: it is framed as "a utility invoked on demand" (`skills/review/SKILL.md:9`), not as a composable skill with a build mode-shift path. The language "invoked on demand" is technically accurate but predates the mode-shift framing. ADR-054 explicitly supersedes ADR-046's callout model — the review skill contains no reference to ADR-046 or its supersession, but also contains no language that contradicts ADR-054. The practical gap is the missing `## MODE SHIFT FROM BUILD` section (see structural violation above).

The review skill's Step 1 does implement mode detection, breadcrumb prompting (implicitly in context-reconstructive mode), and user validation. It does this under its own structure rather than as an implementation of the shared protocol. This is coherent but creates a maintenance risk: if the shared protocol evolves, the review skill's equivalent steps will not be updated through protocol propagation.

### Orchestrator description of build's context-reconstructive mode

The orchestrator's cross-phase integration section accurately describes build's behavior in context-reconstructive mode (`skills/rdd/SKILL.md:324`): "in context-reconstructive mode, orientation is synthesized from tickets, codebase, and breadcrumbs — producing session artifacts (work decomposition, orientation summary) that stewardship references." This matches the build skill's implementation precisely.

### Orchestrator's Context Gathering protocol vs. review skill's implementation

The orchestrator defines step 4's review adaptation as "emphasizes design rationale and decision context (backward-looking)" (`skills/rdd/SKILL.md:299`). The review skill's orientation step does synthesize design rationale and decision context from artifacts (ADRs, system design). The adaptation is consistent in practice, even though the review skill does not name it as an adaptation of step 4.

---

## Notes

**Two violations are structural and should be addressed before the skills are considered production-ready.** The missing `## MODE SHIFT FROM BUILD` section in the review skill (ADR-054) is the more consequential of the two — it means a developer reading the review skill as a build mode-shift target has no description of what context carries through or what steps are skipped. The missing Context Gathering protocol pointer in the review skill (ADR-049) is load-bearing for the protocol's drift-prevention goal.

**The Accelerated tier omission from the refactor skill (ADR-052) is cosmetic but worth noting.** ADR-052 describes the three-tier taxonomy as the refactor skill's vocabulary. The skill implements two of the three tiers and correctly separates hygiene prompts for the Novel tier. The Accelerated tier (broad exception handling, unused variables, security vulnerabilities) is mentioned in the ADR as addressed by "classical refactoring techniques" — so its absence from the skill is arguably the correct behavior. However, a developer consulting the skill who has read ADR-052 would find a gap between the ADR's vocabulary and the skill's catalog. A one-sentence acknowledgment would close this.

**The skill count discrepancy (fitness criterion 14 vs. actual 15) suggests the system design v10.0 document was written before `/rdd-about` was added to the orchestrator's Available Skills table, or the count was calculated incorrectly.** The table itself is correct; the fitness criterion specification is the stale item.

**The overall implementation is structurally sound.** The composable skill family architecture from ADR-048 is realized. The shared Context Gathering protocol from ADR-049 is present. Session artifacts from ADR-050 are specified. Work decomposition from ADR-051 is implemented with the correct package structure. The AI Smell Taxonomy from ADR-052 is present in the refactor skill at the right levels. The time budget mechanism from ADR-053 is present in all four skills with the orientation-validation invariant preserved. The mode-shift composition from ADR-054 is correctly implemented in the build skill for all three inner skills.
