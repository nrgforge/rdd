# Conformance Scan Report

**Scanned against:** ADR-040 (Adaptive Gates — Attend-Interpret-Decide Cycle), ADR-041 (Reflection Time Naming), ADR-042 (/rdd-about Utility Skill), Invariant 4 Amendment 13
**Codebase:** `/Users/nathangreen/Development/rdd`
**Date:** 2026-03-30

---

## Summary

- **ADRs checked:** 4 (ADR-040, ADR-041, ADR-042, Invariant 4 Amendment 13)
- **Conforming:** 0 (all three ADRs are Proposed and not yet implemented)
- **Violations found:** 19

---

## Conformance Debt Table

| ADR | Violation | Type | Location | Resolution |
|-----|-----------|------|----------|------------|
| ADR-040 | RESEARCH gate uses fixed prompt table (self-explanation / reflection-on-action / articulation), not an AID cycle that reads engagement signals | exists | `skills/research/SKILL.md:167–179` | Replace the three fixed prompts with an Attend-Interpret-Decide cycle: read the conversation history, form an engagement hypothesis, select a pedagogical move (challenge / probe / teach / clarify / re-anchor) |
| ADR-040 | DISCOVER gate uses fixed prompt table (five options from product discovery framework), not an AID cycle | exists | `skills/discover/SKILL.md:225–248` | Same: replace fixed prompt list with AID cycle protocol |
| ADR-040 | MODEL gate uses fixed two-prompt table, not an AID cycle | exists | `skills/model/SKILL.md:105–118` | Replace with AID cycle |
| ADR-040 | DECIDE gate uses fixed two-prompt table, not an AID cycle | exists | `skills/decide/SKILL.md:208–221` | Replace with AID cycle |
| ADR-040 | ARCHITECT gate uses fixed three-prompt table, not an AID cycle | exists | `skills/architect/SKILL.md:286–300` | Replace with AID cycle |
| ADR-040 | BUILD per-scenario-group gate uses fixed two-prompt table, not an AID cycle | exists | `skills/build/SKILL.md:109–122` | Replace with AID cycle |
| ADR-040 | Orchestrator stage gates section describes "present 2-3 exploratory epistemic act prompts" as a fixed protocol step, with no AID cycle | exists | `skills/rdd/SKILL.md:164–172` | Amend protocol description to reflect AID cycle: orchestrator facilitates attend-interpret-decide at each gate rather than presenting a fixed prompt set |
| ADR-040 | ADR-003 context section states "Invariant 4 constrains epistemic cost to 5-10 minutes per gate" — this is the pre-Amendment-13 framing | exists | `docs/decisions/adr-003-phase-specific-epistemic-act-assignments.md:9` | Add a supersession note: the 5-10 minute constraint was replaced by Amendment 13 (Invariant 4 now requires productive cost, not brevity); note the entire fixed-assignment model is superseded by ADR-040 |
| ADR-041 | RESEARCH gate section heading is `### EPISTEMIC GATE` — this is agent-internal instruction text that the agent speaks to the user ("After presenting the essay, run the epistemic gate protocol") | wrong-structure | `skills/research/SKILL.md:167–169` | The section heading and protocol instruction may remain as internal vocabulary (research/design register), but any example dialogue the agent delivers to the user should use "reflection time" per ADR-041 |
| ADR-041 | DISCOVER gate section text that the agent presents to the user says "run the epistemic gate protocol" with no "reflection time" language | wrong-structure | `skills/discover/SKILL.md:225–227` | Add user-facing introduction using the ADR-041 prescribed form: "Before moving on — reflection time." The internal section heading may remain "EPISTEMIC GATE" |
| ADR-041 | MODEL gate: same issue — no user-facing "reflection time" introduction in agent dialogue | wrong-structure | `skills/model/SKILL.md:105–107` | Add "Before moving on — reflection time." preceding the adaptive prompt |
| ADR-041 | DECIDE gate: same issue | wrong-structure | `skills/decide/SKILL.md:208–210` | Add "Before moving on — reflection time." preceding the adaptive prompt |
| ADR-041 | ARCHITECT gate: same issue | wrong-structure | `skills/architect/SKILL.md:286–288` | Add "Before moving on — reflection time." preceding the adaptive prompt |
| ADR-041 | BUILD gate: same issue | wrong-structure | `skills/build/SKILL.md:109–111` | Add "Before moving on — reflection time." preceding the adaptive prompt |
| ADR-041 | README describes orchestrator as "invoking each phase skill in order with epistemic gates between them" — "epistemic gates" is user-facing text per the README's context | wrong-structure | `README.md:71` | Replace "epistemic gates" with "reflection time" in this user-facing sentence |
| ADR-041 | README Architecture section states "Skills (10) — orchestrate phases, manage user interaction, run epistemic gates" and "Hooks (5) — passive enforcement of invariants, epistemic gates, document sizing" — these are user-facing descriptions | wrong-structure | `README.md:91, 93` | Replace "epistemic gates" with "reflection time" in these user-facing descriptions; "epistemic gate" is reserved for research/design vocabulary |
| ADR-041 | ORIENTATION.md current state section reads "Epistemic gate protocol (ADRs 001-005) — implemented in all skill files" — this is user-facing text in an onboarding document | wrong-structure | `docs/ORIENTATION.md:80` | Rephrase to user-facing language: "Reflection time protocol (ADRs 001-005, 040-041) — implemented in all skill files" |
| ADR-042 | `/rdd-about` skill does not exist | missing | `skills/` (directory) | Create `skills/about/SKILL.md` implementing the three capabilities prescribed by ADR-042: version reporting, methodology overview in user language, and depth-calibrated elaboration |
| ADR-042 | Orchestrator does not offer `/rdd-about` when no RDD artifacts are detected | missing | `skills/rdd/SKILL.md:36–64` (ARTIFACT LOCATION section) | Add logic in the "no artifacts found" branch to mention `/rdd-about` as available for orientation before asking the user where to store artifacts |

---

## Notes

### What already conforms

The domain model Invariant 4 is fully updated. The Amendment 13 language ("Epistemic cost must be productive, not merely brief") is present at `docs/domain-model.md:397`. The amendment log records the change. The `scenarios.md` file contains well-formed behavior scenarios for all three ADRs (ADR-040, ADR-041, ADR-042) at lines 1435–1556, indicating the decision phase was completed correctly. The `product-discovery.md` product vocabulary table at line 230 correctly documents the dual-register naming. The `docs/domain-model.md` concepts table at line 177 lists "Reflection Time" as a concept with the correct avoid list, and the relationships at line 369 correctly state the alias relationship.

### Pattern of non-conformance

All 19 violations are in the implementation layer (skill files, README, ORIENTATION.md), not in the research or decision layer. The ADRs, scenarios, domain model, and product discovery are already updated. This is the expected pattern for a DECIDE-phase cycle that has not yet reached BUILD: the decisions are captured, the implementation has not caught up.

### Structural note on ADR-041 scope

ADR-041 prescribes a dual-register convention: "epistemic gate" remains in research/design vocabulary, "reflection time" is used in user-facing text. The skill file `### EPISTEMIC GATE` section headings are internal instructions to the agent, not user-facing dialogue — they are arguably in the design-vocabulary register and could legitimately remain unchanged. The violations logged above target only the introduction sentences the agent actually speaks to the user (the text that follows the heading), and the user-facing documents (README, ORIENTATION.md). The internal section headings themselves are a judgment call: they could stay as internal framing or be renamed to reduce maintenance confusion. This is noted rather than logged as a violation because ADR-041 explicitly says "no code changes required — this is a documentation and skill file terminology change," and the section headings serve as internal navigation for the skill author, not user-facing text.

### ADR-003 supersession

ADR-003's fixed-assignment prompt table is substantially superseded by ADR-040. The current skill files implement ADR-003's prompt assignments (the specific prompts in each gate match ADR-003's table), which is the source of the six ADR-040 violations in the gate sections. ADR-003 should receive a supersession note pointing to ADR-040, and the prompt lists in skill files should be replaced with AID cycle instructions that use ADR-003's prompt library as candidate moves (not a fixed selection).

### Invariant 4 in ADR-001

`docs/decisions/adr-001-replace-approval-gates-with-epistemic-gates.md:32` still reads "Adds 5-10 minutes per gate (Invariant 4 constrains this cost)". This is the pre-Amendment-13 framing but appears in the Consequences section of a historical ADR — it describes what was believed when the decision was made. This is borderline: it would be appropriate to add a note that Amendment 13 updated Invariant 4's framing, but superseding the ADR entirely would be disproportionate since the core decision (replace approval gates with epistemic gates) remains valid. This is flagged as a documentation note rather than a violation.

### Resolution sequence

Given the dependency between ADR-040 and ADR-041 (ADR-041 prescribes the introduction phrase that follows the AID-cycle prompt, so AID must be implemented first), the recommended resolution order is:

1. Implement AID cycle in all six gate sections (ADR-040 violations) as `refactor:` commits replacing the fixed prompt tables
2. Add "Before moving on — reflection time." introduction to each gate's user-facing dialogue (ADR-041 violations in skill files)
3. Update README and ORIENTATION.md for ADR-041 naming (structure-only commits)
4. Create `skills/about/SKILL.md` and amend the orchestrator's fresh-project detection (ADR-042)
5. Add supersession note to ADR-003 referencing ADR-040
