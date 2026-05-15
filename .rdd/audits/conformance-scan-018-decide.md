# Conformance Scan Report — Cycle 018 DECIDE

**Scanned against:**
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-092-essay-outline-as-research-artifact.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-093-argument-auditor-graph-traversal.md`

**Codebase root:** `/Users/nathangreen/Development/rdd/`

**Date:** 2026-05-14

---

## Summary

- **ADRs checked:** 2 (ADR-092, ADR-093)
- **Expected deferred sweep items:** 6 (verified real and accurate)
- **Unexpected debt found:** 4 (not listed in ADRs' deferred-sweep scope)
- **Violations total:** 10

---

## Conformance Debt Table

| ADR | File : approx. line | Violation | Type | Severity | Debt category |
|-----|---------------------|-----------|------|----------|---------------|
| ADR-092 | `skills/research/SKILL.md` : 7 | Skill description still reads "produce a publishable-quality essay" — the Essay-Outline form and four-section template are not mentioned anywhere in the file | missing | P2 — fix in BUILD | Expected deferred sweep |
| ADR-092 | `skills/research/SKILL.md` : 151 | Step 4 instructs the agent to "synthesize all findings into a publishable-quality essay" with prose-essay instructions ("body should: explain the problem space in prose…"; "use third person or impersonal voice") — no Essay-Outline template, no Argument-Graph section, no Outline-Production Discipline requirements | exists (wrong form) | P2 — fix in BUILD | Expected deferred sweep |
| ADR-092 | `skills/research/SKILL.md` : 170 | Filename pattern hardcoded as `./docs/essays/NNN-descriptive-name.md` — the `essay-outline-NNN-<slug>.md` pattern from ADR-092 §1 is absent | missing | P2 — fix in BUILD | Expected deferred sweep |
| ADR-092 | `skills/research/SKILL.md` : 329 | "Research produces writing, not just notes: The essay is the deliverable. If you can't explain it clearly in prose, you don't understand it well enough." — prose framing directly contradicts the adopted form change | exists (wrong structure) | P2 — fix in BUILD | Expected deferred sweep |
| ADR-093 | `agents/argument-auditor.md` : 26–29 | Genre list contains three entries (Research essays, ADRs, Synthesis outlines) — Essay-Outline is absent as the fourth named genre; no pyramid graph-traversal step; no expansion-fidelity verification; no pyramid coverage map in output template | missing | P2 — fix in BUILD | Expected deferred sweep |
| ADR-092 | `docs/ORIENTATION.md` : throughout Section 4 ("How the Artifacts Fit Together") | Section 4 does not name Essay-Outline as the RESEARCH artifact form; the essays listing describes 16 essays all under the prior `NNN-*.md` pattern with no mention of the new `essay-outline-NNN-*.md` pattern or the form change | missing | P2 — fix in BUILD | Expected deferred sweep |
| ADR-092 | `skills/rdd/SKILL.md` : 21 | Available Skills table entry for `/rdd-research` reads "citation-audited, argument-audited, and framing-audited essay" — the word "essay" should become "Essay-Outline" (or the equivalent new form name) after BUILD | exists (wrong description) | P3 — awareness only | Unexpected debt |
| ADR-092 | `skills/rdd/SKILL.md` : 86, 123 | Mode A and Mode C pipeline diagrams describe RESEARCH as producing "citation-audited and argument-audited essay" — missing framing audit in one instance (line 86) and no Essay-Outline distinction in either | exists (wrong description) | P3 — awareness only | Unexpected debt |
| ADR-092 | `skills/rdd/SKILL.md` : 546–548 | Cross-Phase Integration section uses "essay" throughout for the RESEARCH artifact ("The essay that enters downstream phases is…", "essay-as-checkpoint", "the essay is revised and re-audited") — language will need updating to "Essay-Outline" after the form change ships | exists (wrong description) | P3 — awareness only | Unexpected debt |
| ADR-093 | `docs/system-design.md` and `docs/system-design.agents.md` | Neither document's module description for the Argument Auditor Agent references ADR-092 or ADR-093 or the expanded scope to Essay-Outline genre — the ADR-093 §5 deferred sweep explicitly targets these files but the ADRs' own deferred-sweep list (ADR-092 §9 "Skill-text and downstream-artifact amendments") does not list them as targets; this is the only gap between the two ADRs' sweep lists | missing | P3 — awareness only | Unexpected debt |

---

## Verified Deferred Sweep Items (ADR Acknowledgment Confirmed)

The following six gaps are real in the current corpus and match what the ADRs claim is deferred. The ADRs' deferred-sweep scope analysis is accurate for these items.

1. **`skills/research/SKILL.md` — prose-essay production instructions** (ADR-092 §9 first bullet). Confirmed: the file produces a prose essay throughout; no Essay-Outline template exists.

2. **`skills/research/SKILL.md` — Outline-Coherence Signal stewardship guidance** (ADR-092 §9 second bullet). Confirmed: no Outline-Coherence Signal or Pyramid Refinement content exists in the file.

3. **`agents/argument-auditor.md` — Skill-Structure Layer amendment** (ADR-093 §5 / ADR-092 §9 third bullet). Confirmed: the agent currently has three genres; Essay-Outline is absent; no graph-traversal or expansion-fidelity verification is present.

4. **`docs/ORIENTATION.md` — Section 4 artifact map** (ADR-092 §9 fourth bullet). Confirmed: the essays listing in Section 4 covers only `001–016` and does not mention the Essay-Outline form or `essay-outline-NNN-*.md` pattern.

5. **`essay-outline-NNN-*.md` filename pattern documentation** (ADR-092 §9 fifth bullet). Confirmed: no file in the corpus documents this pattern; the orchestrator SKILL.md Artifacts Summary still shows `./docs/essays/NNN-descriptive-name.md` for the RESEARCH essay artifact (SKILL.md line 587–588).

6. **Fixture tests** (ADR-092 §9 sixth bullet / ADR-093 §5 second bullet). Confirmed: no `test_essay_outline_form_documented.sh` or `test_argument_auditor_essay_outline_genre.sh` exists under `hooks/tests/`. The existing test suite (`hooks/tests/`) contains no Essay-Outline or argument-auditor genre tests.

---

## Unexpected Debt Items (ADRs Did Not Account For These)

The following four items are not listed in either ADR's deferred-sweep scope. They represent either additional sweep targets the BUILD plan needs, or framing inconsistencies the ADRs did not enumerate.

### U-1 Orchestrator SKILL.md Available Skills table and pipeline diagrams

**Location:** `skills/rdd/SKILL.md` lines 21, 86, 123, 546–548

**What:** The orchestrator carries multiple independent references to the RESEARCH artifact as "essay" — the Available Skills table, both Mode A and Mode C pipeline diagrams, and the Cross-Phase Integration section. ADR-092 §9 lists `skills/research/SKILL.md` and `docs/ORIENTATION.md` as downstream sweep targets; it does not list `skills/rdd/SKILL.md`.

**Why it matters:** After BUILD ships the form change to the research skill, the orchestrator's descriptions will be stale. A practitioner reading Mode A's pipeline diagram will see "citation-audited and argument-audited essay" while the research skill produces an Essay-Outline. The mismatch is a documentation-drift risk that will trigger a future conformance finding if not addressed. ADR-092 §9's fifth bullet covers "wherever `./docs/essays/NNN-*.md` is referenced" in terms of filename pattern, but the prose descriptions of the artifact form in the orchestrator also need updating — this is a separable gap.

**Severity:** P3 awareness only (the orchestrator's descriptions do not affect production behavior; the research skill's instructions are what the agent executes). Becomes P2 at BUILD exit if not addressed.

**Recommendation:** Add `skills/rdd/SKILL.md` to the BUILD-phase deferred sweep list alongside the four files ADR-092 §9 already names. The specific locations to update: (a) Available Skills table row for `/rdd-research`; (b) Mode A and Mode C pipeline descriptions; (c) Cross-Phase Integration section's "essay" language for the RESEARCH artifact.

---

### U-2 Orchestrator SKILL.md Artifacts Summary table

**Location:** `skills/rdd/SKILL.md` line 587–588

**What:** The Artifacts Summary table records the RESEARCH essay artifact as `./docs/essays/NNN-descriptive-name.md`. ADR-092 §9's fifth bullet specifically says "wherever `./docs/essays/NNN-*.md` is referenced (orchestrator skill, ORIENTATION, research skill, this artifact summary table), add the `essay-outline-NNN-*.md` pattern alongside." The orchestrator SKILL.md is already named there, but the path in the fifth bullet says "orchestrator skill" — which means this location is actually within the expected deferred sweep scope. On re-reading, this is a case where the ADR names the sweep target correctly but the first-level reading of the file reveals two distinct types of reference: (a) the Artifacts Summary table path (named in ADR-092 §9 fifth bullet — covered) and (b) the prose descriptions in the Available Skills table and Cross-Phase Integration section (not named — the unexpected gap is U-1 above, not this item). Recording here for clarity: U-2 is a false alarm; line 587–588 is within ADR-092 §9's stated scope.

**Severity:** Awareness only — not an additional gap.

---

### U-3 `docs/system-design.agents.md` responsibility matrix

**Location:** `docs/system-design.agents.md` Specialist Subagent Modules section (Argument Auditor Agent entry, approx. line 250–258)

**What:** The Argument Auditor Agent module entry in `system-design.agents.md` describes the agent as owning "argument mapping, logical gap detection, hidden assumption identification, framing audit" — no mention of Essay-Outline genre handling, Argument-Graph consumption, pyramid graph-traversal, or expansion-fidelity verification. ADR-093 §5 (Skill-text amendments section) explicitly lists "`docs/system-design.md` and/or `docs/system-design.agents.md` — responsibility matrix updated to reflect the argument-auditor's expanded scope" as a BUILD-phase deliverable. However, ADR-092 §9 (Skill-text and downstream-artifact amendments) does NOT list `system-design.md` or `system-design.agents.md` as sweep targets for the form change.

**Why it matters:** ADR-093's deferred-sweep list includes the system-design files, but ADR-092's deferred-sweep list does not. Since the two ADRs are explicitly coordinated and ship together (ADR-092 §5, ADR-093 §5), a practitioner executing the BUILD pass from ADR-092's sweep list alone would miss this update. The omission is in ADR-092 §9, not in ADR-093.

**Severity:** P3 awareness — a BUILD coordination gap, not a current implementation failure (the system-design content is correct for the current state of the corpus where the amendment has not yet shipped). The gap creates a risk of partial execution if the practitioner follows one ADR's sweep list and not both.

**Recommendation:** The BUILD-phase sweep checklist (wherever it is recorded — presumably `cycle-status.md`) should consolidate ADR-092 §9 and ADR-093 §5's sweep targets into a single unified list. `docs/system-design.md` and `docs/system-design.agents.md` should appear on it, sourced from ADR-093 §5.

---

### U-4 `docs/domain-model.md` Amendment 24 note

**Location:** `docs/domain-model.md` Amendment 23 entry (approx. line 1003) / ADR-093 §5

**What:** ADR-093 §5 explicitly calls out "Amendment 24 (a small follow-on amendment, file in the next cycle's MODEL or as a stewardship update during BUILD): the Argument-Graph (as artifact section) concept entry's 'auditor consumption is currently judgment-anchored' note can be updated to 'auditor consumption anchored in `agents/argument-auditor.md` per ADR-093' once the skill-text edit ships." The current domain-model.md concept entry for Argument-Graph (as artifact section) (approx. line 269) does contain the judgment-anchored note: "Auditor consumption is currently judgment-anchored (MODEL gate Target 2 grounding action, 2026-05-14)." This is a deferred update explicitly named in ADR-093, not missing from the ADR's scope. The gap is real and consistent with what ADR-093 states.

**Clarification on debt category:** On reading, this is an expected deferred item — ADR-093 §5 acknowledges it. The reason it is listed here under unexpected debt is that ADR-092 §9 (the primary sweep ADR for the form change) does not mention `domain-model.md` as a sweep target; only ADR-093 §5 does. This again is the split-sweep-list coordination risk: a practitioner following only ADR-092 §9 would not know about the domain-model update.

**Severity:** P3 awareness — the current domain-model content is accurate for the current state (Amendment 23 correctly records the judgment-anchored status). The gap materializes only after ADR-093's skill-text edit ships; the methodology's own note (ADR-093 §5 paragraph 4) identifies the follow-on action.

---

## Overall Assessment

The ADRs' deferred-sweep scope analysis is accurate for all six items they explicitly claim to defer. No gap in the ADRs' gap-analysis was found for the core four-artifact sweep (research skill, argument-auditor agent, ORIENTATION, filename-pattern references). The expected debt is real and fully matches the ADRs' claims.

The unexpected debt is narrower than the expected: three distinct risks arise from the fact that ADR-093's sweep list and ADR-092's sweep list are not identical, and neither references the orchestrator's prose descriptions of the RESEARCH artifact form. None of these are blocking issues — they are documentation-drift and BUILD-coordination risks. The methodology's ADR-074 downstream-sweep workflow and the `cycle-status.md` deferred-sweep provision are the right mechanisms to consolidate them.

### Recommended action before BUILD begins

Record a unified sweep checklist in `cycle-status.md` that combines:
- ADR-092 §9's five named artifacts: `skills/research/SKILL.md`, `agents/argument-auditor.md`, `docs/ORIENTATION.md`, filename-pattern references (orchestrator SKILL.md Artifacts Summary + ORIENTATION + research skill), and fixture tests
- ADR-093 §5's additional targets: `docs/system-design.md`, `docs/system-design.agents.md`, `docs/domain-model.md` (Amendment 24), and the argument-auditor essay-outline genre fixture test
- The orchestrator's prose descriptions (U-1): `skills/rdd/SKILL.md` Available Skills table, Mode A/C pipeline diagrams, Cross-Phase Integration essay references

The consolidated list ensures BUILD executes both ADRs' sweeps atomically. The ADRs themselves are internally consistent; the coordination risk is at the execution planning level, not in the decisions.

### Corpus state consistency check

The domain-model (Amendment 23), product-discovery, and ADRs themselves are consistent with each other. The domain-model correctly records all Cycle 018 concepts with their current status (judgment-anchored where appropriate, held-for-DECIDE where appropriate). The two essay files at `docs/essays/017-outlines-as-research-artifacts-prose.md` and `docs/essays/017-outlines-as-research-artifacts-outline.md` are correctly named under the old pattern (no retroactive migration required per ADR-092 §1). The partial precedent in `017-outlines-as-research-artifacts-outline.md` (three sections, lacking the explicit Argument-Graph section) is consistently described in ADR-092 Consequences (Neutral) as "a partial precedent that does not retroactively require the missing Argument-Graph section" — this corpus state is consistent with the ADR's claims.
