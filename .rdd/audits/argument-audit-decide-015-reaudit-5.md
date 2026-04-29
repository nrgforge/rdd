# Argument Audit Report — Re-audit (Pass 7)

**Audited documents:**
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-071-lifecycle-composition-in-build-stewardship.md` (post-pass-6 fixes)
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-072-cycle-shape-declaration.md` (post-pass-6 fixes)
- `/Users/nathangreen/Development/rdd/docs/scenarios.md` — ADR-071 and ADR-072 feature blocks (post-pass-6 fixes)

**Source material:**
- Pass 6 audit: `/Users/nathangreen/Development/rdd/docs/housekeeping/audits/argument-audit-decide-015-reaudit-4.md`
- Prior audit trail: argument-audit-decide-015.md through argument-audit-decide-015-reaudit-4.md

**Date:** 2026-04-13

---

## Audit scope for this pass

This is pass 7. Scope is narrowly bounded:

1. Verify all five fix items applied in response to pass 6 are correctly present and do not introduce regressions.
2. Confirm argument chains A–I from pass 6 still hold under the revised text.
3. Re-report all six open framing findings unchanged.

No new argument chains are mapped; the corpus is unchanged in structure from pass 6. Only the targeted text edits are under scrutiny.

---

## Section 1: Argument Audit

### Summary

- **Argument chains mapped:** 9 (carry-forward from pass 6; no structural changes)
- **Issues found:** 0

---

### Fix verification

**Fix 1 — P3-A ADR-071 (mode-shift inheritance wording)**

- **Location:** ADR-071 Consequences §Negative, final bullet point (line 78)
- **Previous text:** "ADR-048 supports this directionally but does not state category-inheritance explicitly."
- **Revised text present:** "ADR-048 establishes the mode-shift composition pattern the inference depends on, but does not address category inheritance explicitly."
- **Verification:** Confirmed present verbatim. The revised wording correctly distinguishes what ADR-048 contributes (structural evidence: mode-shift composition pattern) from what it does not contribute (semantic evidence: category propagation). The P3-A concern from pass 6 is resolved. No regression introduced — the surrounding argument (Chain D: scope build-local) is unchanged and still holds.

**Fix 2 — P2-A ADR-072 (indefinite pause position)**

- **Location:** ADR-072 Consequences §Negative, third bullet point (lines 107-108)
- **Previous text:** The bullet acknowledged that indefinite pause was "acceptable — the pause is visible in the Pause Log" but did not state the methodology's position.
- **Revised text present:** "The methodology's position: an indefinitely-paused cycle is a deliberately open state, not a closed or abandoned one — the Pause Log entry has no resume date and remains visible. This is distinct from Graduation (ADR-025) which formally closes a cycle, and from abandonment (no affordance in the methodology). The observability argument for Invariant 8 compatibility depends on the Pause Log being readable, which is a weak structural anchor (it relies on the human reader); acceptable because the pause itself is declared explicitly in cycle-status.md, not silent. A future ADR could add pause-staleness signaling (e.g., auto-surface pauses older than N days) if the accumulation of stale pauses becomes a problem."
- **Verification:** Confirmed present. The addition takes the explicit position the P2-A finding called for: indefinite pause is a deliberately open state (not an error), distinct from Graduation and from abandonment, with an honest acknowledgment that the Pause Log's observability argument is a weak structural anchor. The forward path (pause-staleness signaling as a future ADR) is named. The Invariant 8 argument (Chain H) is not weakened by this addition — it is clarified. The reasoning now accurately distinguishes structural observability (Pause Log visible in cycle-status.md) from enforcement (not enforced, relying on the human reader). P2-A is resolved.

**Fix 3 — P2-B ADR-072 (pause-notice marker name)**

- **Location:** ADR-072 Decision §Hook behavior changes, first bullet (line 55)
- **Previous text:** "log the pause to stderr as an advisory notice once per session (like advisory mode's one-time notice)"
- **Revised text present:** "log the pause to stderr as an advisory notice once per session (using a separate session-scoped marker, e.g., `/tmp/rdd-pause-notice-${SESSION_ID}`, distinct from the existing advisory-mode marker `/tmp/rdd-advisory-${SESSION_ID}` so the two notices don't collide)"
- **Verification:** Confirmed present. The marker file convention is now explicit. The two markers are named and distinguished. The collision risk identified in P2-B is pre-empted for BUILD. The word "e.g." correctly scopes this as guidance, not a rigid file-path mandate. P2-B is resolved. No regression — the hook behavior logic (Chain G, Chain I) is unchanged.

**Fix 4 — P3-B scenarios (scenario conflation removed)**

- **Location:** scenarios.md, "Stop hook honors Skipped phases declaration" scenario (lines 1986-1991)
- **Previous text:** The scenario's Then-chain included "And the hook continues to enforce for non-skipped phases."
- **Revised text present:** The scenario ends at two Then-clauses: "Then the hook does not require any artifacts for that phase / And the hook returns allow without running the per-phase manifest check for the skipped phase." The "continues to enforce" clause is absent.
- **Verification:** Confirmed absent. The scenario now tests exactly one behavior (allow without manifest check for the skipped phase) without doubling into the non-bypass guarantee, which is correctly isolated in "Skipped phase declaration does not bypass compound check for other phases." Both scenarios are refutable independently. P3-B is resolved.

**Fix 5 — P3-C scenarios (Pause Log columns)**

- **Location:** scenarios.md, "Pause Log records pause/resume history" scenario (line 2010)
- **Previous text:** "each entry records the pause date, resume date (if resumed), and reason" (column `#` absent from scenario)
- **Revised text present:** "And the table columns are `#` (sequential numbering), Paused (date), Resumed (date or blank), Reason" added as a distinct Then-clause before the prose description.
- **Verification:** Confirmed present. The scenario now fully mirrors the Decision's table format including the `#` column. The structural match between Decision and scenario is complete. P3-C is resolved.

---

### Argument chain re-verification

**Chain A (ADR-071: gap identification)** — Unchanged by any fix. Holds.

**Chain B (ADR-071: three-anchor structure)** — Unchanged. The dual-placement revision from pass 5 remains intact. Holds.

**Chain C (ADR-071: Invariant 8)** — Unchanged. Holds.

**Chain D (ADR-071: scope build-local)** — Fix 1 tightened the P2-B note's language. The chain is now more precisely stated: ADR-048 contributes structural evidence (mode-shift pattern) but not semantic evidence (category inheritance). The inference is still flagged as inferred and unvalidated. Chain holds and is more precise than in pass 6.

**Chain E (ADR-071: Step 5.5 rejection)** — Unchanged. Holds.

**Chain F (ADR-072: problem identification)** — Unchanged by any fix. Holds.

**Chain G (ADR-072: field placement)** — Fix 3 added marker specificity in the Decision text. This addition is consistent with the rejected-alternatives reasoning (cycle-status.md is the correct location; operational details go in the hook layer, with the Decision specifying the convention). The chain holds; the addition strengthens BUILD-phase clarity without altering the argument.

**Chain H (ADR-072: Invariant 8 preservation)** — Fix 2 added an explicit acknowledgment that the Pause Log's observability is a "weak structural anchor (it relies on the human reader)." This is an honest qualification, not a weakening of the chain. The chain's conclusion — acceptable because the pause is declared explicitly, not silent — is preserved. Invariant 8's concern is silent non-execution; declared-but-human-readable is distinguished from declared-and-machine-enforced, with the former accepted as sufficient for this case. The chain holds; the qualification is accurate.

**Chain I (ADR-072: scope containment)** — Unchanged. Holds.

---

### P1 — Must Fix

No P1 issues found.

---

### P2 — Should Fix

No P2 issues found. All P2 issues from pass 6 are resolved.

---

### P3 — Consider

No P3 issues found. All P3 issues from pass 6 are resolved.

---

### Scenario refutability verification (delta check)

Only the two modified scenarios are re-checked; the others are unchanged from pass 6.

**"Stop hook honors Skipped phases declaration"** — Post-fix, the scenario has two Then-clauses testing a single, unified outcome (no manifest check for the skipped phase). Both clauses are independently falsifiable: (1) does the hook run the manifest check? (2) does the hook return allow? These are not redundant — a hook could return allow but still run (and silently ignore) the manifest check. The scenario is now more precisely targeted than before. Satisfactory.

**"Pause Log records pause/resume history"** — Post-fix, the scenario specifies columns (`#`, Paused, Resumed, Reason) in a Then-clause that is independently falsifiable against the table structure in cycle-status.md. The column-specification clause and the prose-description clause that follows it are not redundant — one tests structure, the other tests content. Satisfactory.

---

## Section 2: Framing Audit

No new framing issues introduced by the five fixes. All six open framing findings from pass 6 are re-reported unchanged below.

---

### Carry-forward framing issues (passes 1-6)

**Framing P2-A (passes 1-5 carry-forward, open at user gate): COMPOSABLE TESTS primary placement**

- **Location:** ADR-071 Decision §Extension 1; Consequences §Negative
- **Issue:** The framing question about whether COMPOSABLE TESTS is the right primary anchor for lifecycle reasoning (versus Step 5, where developers actually run integration verification) remains open. The dual-placement revision from pass 5 made this less acute — lifecycle guidance now appears at both anchors with cross-references — but the question of which placement is "primary" (and whether the COMPOSABLE TESTS subsection will be encountered at design time in practice) has not been resolved.
- **Do not auto-correct.** Open at user gate.

**Framing P2-B (passes 1-5 carry-forward, open at user gate): mode-shift inheritance unverified**

- **Location:** ADR-071 Consequences §Negative (P2-B note, now Fix 1 wording); Rejected alternatives §"Extend to every composable skill"
- **Issue:** The scope exclusion of debug, refactor, and review depends on an unverified claim that mode-shift composition (ADR-048) propagates category awareness from build into those skills when invoked as mode shifts. ADR-048 establishes the mode-shift pattern but does not address category inheritance. Fix 1 has made this acknowledgment more precise, but the underlying gap — category inheritance has not been empirically validated or explicitly designed — remains.
- **Do not auto-correct.** Open at user gate.

**Framing P3-A (passes 1-5 carry-forward, open at user gate): Provenance check normative status**

- **Location:** ADR-071 §Provenance check; ADR-072 §Provenance check
- **Issue:** Both ADRs include a Provenance check section with a note that this element "is not yet established as a required template element." The normative status of the Provenance check — whether it is mandatory, conventional, or situational — remains unresolved. ADR-072's note defers to ADR-071's by reference, which creates a minor readability dependency between the two ADRs. This is not a logical error; it is a scope question about whether a future methodology ADR should resolve the template question.
- **Do not auto-correct.** Open at user gate.

**Framing P2-A (pass 6, new, open at user gate): missing hook-suppression rejected alternative**

- **Location:** ADR-072 §Rejected alternatives; Context §"In-progress gates and user-away sessions"
- **Issue:** The hook already suppresses repeated advisory notices via a session-scoped temp file (fires once, then stops). This suppression pattern was not extended to blocking behavior. An alternative fix — block once per session on a user-tooling mechanism (the gate reflection note), then downgrade to advisory for subsequent fires — would address the 60-successive-blocks problem from the harness side without adding fields to cycle-status.md. This alternative is not listed in the Rejected alternatives section.
- **Do not auto-correct.** Open at user gate.

**Framing P2-B (pass 6, new, open at user gate): durable-record vs. operational-control dual nature**

- **Location:** ADR-072 Decision §Field 2 — Paused; Consequences §Negative
- **Issue:** The Paused field is "intended to be removed when the cycle resumes" — making it transient operational state. The Pause Log section is a durable audit trail that persists. The ADR frames cycle-status.md consistently as "the durable record" but does not acknowledge that the Paused field is operational state placed in a durable record document. This dual nature (control surface during pause, historical record after resume) is not addressed in the Decision or Consequences, and the "single source of truth" argument for cycle-status.md elides it. Fix 2 improved the Consequences §Negative language around indefinite pause but did not engage the durable-vs-operational distinction.
- **Do not auto-correct.** Open at user gate.

**Framing P3-A (pass 6, new, open at user gate): priority order for coexisting Paused and Skipped phases**

- **Location:** ADR-072 Decision §Hook behavior changes
- **Issue:** The hook-behavior bullet order implies Paused takes precedence over Skipped phases (if Paused: short-circuit → else if Skipped: skip that phase → else: run manifest check), but this priority order is never stated explicitly. A cycle that is both paused and has skipped phases would benefit from the ADR naming the precedence. This is an implementation-guidance gap for BUILD.
- **Do not auto-correct.** Open at user gate.

---

### Carry-forward status summary

| Issue | ADR | Priority | Pass 6 status | Pass 7 status |
|---|---|---|---|---|
| Framing P2-A (passes 1-5): COMPOSABLE TESTS primary placement | ADR-071 | P2 | Open at user gate | Open at user gate (unchanged) |
| Framing P2-B (passes 1-5): mode-shift inheritance unverified | ADR-071 | P2 | Open at user gate | Open at user gate (unchanged) |
| Framing P3-A (passes 1-5): Provenance check normative status | ADR-071 | P3 | Open at user gate | Open at user gate (unchanged) |
| Framing P2-A (pass 6): missing hook-suppression rejected alternative | ADR-072 | P2 | Open at user gate | Open at user gate (unchanged) |
| Framing P2-B (pass 6): durable-record vs. operational-control | ADR-072 | P2 | Open at user gate | Open at user gate (unchanged) |
| Framing P3-A (pass 6): priority order for coexisting Paused+Skipped | ADR-072 | P3 | Open at user gate | Open at user gate (unchanged) |
