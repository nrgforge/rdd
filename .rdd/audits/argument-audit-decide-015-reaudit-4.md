# Argument Audit Report — Re-audit (Pass 6, Expanded Corpus)

**Audited documents:**
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-071-lifecycle-composition-in-build-stewardship.md` (revised: dual placement + P2-B note + P3-A note)
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-072-cycle-shape-declaration.md` (new)
- `/Users/nathangreen/Development/rdd/docs/scenarios.md` — ADR-071 and ADR-072 feature blocks

**Source material:**
- Issue #10 (driver for ADR-071)
- `/Users/nathangreen/Development/rdd/skills/build/SKILL.md` (COMPOSABLE TESTS §L366-387, Stewardship §L430-465, Step 5 §L213-224)
- `/Users/nathangreen/Development/rdd/hooks/scripts/tier1-phase-manifest-check.sh`
- `/Users/nathangreen/Development/rdd/hooks/manifests/tier1-phase-manifest.yaml`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-046-review-build-integration.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-048-composable-skill-family.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-052-ai-smell-detection-in-refactor-skill.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-063-per-phase-manifest-format.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-064-compound-check-hooks.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-070-housekeeping-migration.md`
- `/Users/nathangreen/Development/rdd/docs/domain-model.md` §Invariants (L659-678, Invariant 8)
- Prior audit trail: argument-audit-decide-015.md through argument-audit-decide-015-reaudit-3.md (passes 1-5)

**Date:** 2026-04-13

---

## Audit scope for this pass

This is pass 6. The previous five passes established a clean audit for ADR-071. This pass covers:

1. **ADR-071 revised** — confirms the dual-placement (three-extension) revision is internally coherent and does not introduce new argument issues. The P2-B note (mode-shift inheritance inferred) and P3-A note (Provenance check normative status situational) were added to the ADR text itself; this pass checks whether those additions hold under scrutiny.
2. **ADR-072 new** — full first-pass argument and framing audit.
3. **Scenarios** — refutability and ADR fidelity for both feature blocks.
4. **Cross-ADR consistency** — the "situational Provenance check" framing applied in both ADRs.
5. **Carry-forward framing issues from passes 1-5** — Framing P2-A, P2-B, P3-A remain open at the user's epistemic gate and are re-reported unchanged.

---

## Section 1: Argument Audit

### Summary

- **Argument chains mapped:** 9 (5 ADR-071, 4 ADR-072)
- **Issues found:** 3 (all P2 or P3; no P1)

---

### Argument chains — ADR-071 (revised)

- **Chain A (gap identification):** Integration risk has a third category (lifecycle) not covered by existing guidance. The chain holds; the revision does not touch it.
- **Chain B (anchor selection — two-sided):** COMPOSABLE TESTS and Stewardship Tier 1 are the correct insertion sites. The revision adds Step 5 as a third anchor. The three-anchor structure is now internally consistent: design-time (COMPOSABLE TESTS), verification-time (Step 5), review-time (Stewardship Tier 1). The internal tension that motivated the revision — Decision rejected a standalone Step 5.5 but placed no guidance in Step 5 — is resolved. The reasoning in the Rejected Alternatives section now matches the chosen placement.
- **Chain C (Invariant 8):** Satisfied. The Step 5 anchor is an existing concrete workflow step; adding guidance to it does not introduce a new unconditional mechanism. Chain holds.
- **Chain D (scope — build-local):** Unchanged. The P2-B note added to Consequences correctly flags the load-bearing inference about mode-shift inheritance without asserting it as proven.
- **Chain E (Step 5.5 rejection):** The revised rejection reasoning ("Step 5 itself is extended by this ADR") is now consistent with the chosen placement. The prior internal tension (rejecting Step 5.5 while placing nothing in Step 5) is gone. Chain holds cleanly.

---

### Argument chains — ADR-072

- **Chain F (problem identification):** Two distinct issues surfaced: (1) no structural representation for phase-skipping in mini-cycles, causing the hook's regex to misparse prose phase descriptions; (2) no structural representation for user-away sessions, causing repeated Stop blocks on a legitimately in-progress gate. The two-issue identification is accurate against the hook's code. The hook reads `**Phase:**` via `grep -E '^\*\*Phase:\*\*'` and then does a single `sed` extraction. A prose value like "RESEARCH / DISCOVER / MODEL / ARCHITECT skipped" would yield "RESEARCH" as the extracted phase after the sed pattern `([A-Za-z_-]+)`, not a parse failure. This is consistent with the Context's description: the hook "began correctly identifying `decide` as the current phase" after correction. The chain is accurate.
- **Chain G (field placement):** Cycle-status.md is the correct location for skip/pause declaration rather than the manifest or environment variables. The reasoning is: the manifest is cycle-independent (all cycles share it), environment variables are session-scoped and invisible to the artifact trail, and cycle-status.md is already the authoritative per-cycle state document the hook reads. All three rejected-alternative justifications engage the strongest case for each alternative. Chain holds.
- **Chain H (Invariant 8 preservation):** The ADR claims Invariant 8 is preserved because skip/pause is "a declared, observable structure, not a silent bypass." Invariant 8 requires unconditional structural mechanisms to be anchored to one of three substrates. The pause and skip bypass the manifest check — they do not anchor the bypassed checks to a different substrate; they suspend them. The question is whether "no unconditional mechanism introduced" is the right frame, or whether bypassing an existing unconditional mechanism requires explicit justification under Invariant 8. The ADR's answer is that the Pause Log provides structural observability — the bypass is declared and auditable, not silent. This is a reasonable interpretation: Invariant 8's concern is silent non-execution, and the Pause Log prevents that. The chain holds, but the reasoning requires the Pause Log to be a genuine audit trail, not merely a convention.
- **Chain I (scope containment):** The ADR explicitly lists what it does not change. The scope boundary is clearly stated and consistent with the decision text.

---

### P1 — Must Fix

No P1 issues found in either ADR or the scenarios.

---

### P2 — Should Fix

**P2-A — ADR-072: the Paused field creates a non-terminating bypass with no recovery enforcement.**

- **Location:** Decision §Field 2 — Paused; Consequences §Negative
- **Claim:** "Pause-until-resumed is user-driven. If the user never resumes, the cycle remains paused indefinitely. Acceptable — the pause is visible in the Pause Log."
- **Evidence gap:** The ADR asserts this is acceptable but does not explain what makes indefinite pause acceptable rather than a structural risk. The Invariant 8 argument hinges on observability; a Pause Log that is never read cannot perform the observability function. The comparison to advisory mode (one-time notice per session) in the hook behavior section is illuminating: advisory mode has the same "visible but not enforced" character, and ADR-064 frames advisory mode as an interim state (pre-migration), not a permanent one. The ADR does not address whether a cycle left paused indefinitely is analogous to a pre-migration corpus (awaiting action) or a genuinely closed cycle (requires a different mechanism like "archive" or "abandon"). The distinction matters because a permanently paused cycle would suppress manifest checks forever — a stronger bypass than the skipped-phase case, which is bounded to specific phases.
- **Recommendation:** Add a sentence to the Consequences §Negative acknowledging that indefinite pause creates persistent bypass and stating the methodology's position on it — either that paused cycles should be closed or resumed within some expected horizon (making the pause a temporary state), or that permanent pause is intentional and the Pause Log's visibility is considered sufficient. The current text acknowledges the risk but does not take a position on it.

**P2-B — ADR-072: the one-time advisory notice per session is underspecified.**

- **Location:** Decision §Hook behavior changes
- **Claim:** "log the pause to stderr as an advisory notice once per session (like advisory mode's one-time notice) and return allow without running any manifest check."
- **Evidence gap:** The hook script implements advisory-mode's one-time notice using a session-scoped temp file keyed by `session_id` from the input JSON (`/tmp/rdd-advisory-${SESSION_ID:-unknown}`). The ADR states the pause notice works "like advisory mode's one-time notice" but does not specify whether the same session-ID mechanism is used or a separate mechanism. BUILD-phase implementation will need to decide this. If the pause notice uses a separate temp file path, there is no collision; if it reuses the advisory-mode marker, a paused cycle running in enforcement mode would lose the advisory-mode notice (not a problem since enforcement mode does not use advisory notice) but the session-scoped suppression logic may interact unexpectedly with the ADVISORY_MARKER already defined in the hook. This is an implementation-time decision but the ambiguity should be noted here so BUILD does not have to reconstruct the intent.
- **Recommendation:** Add a brief parenthetical in the Decision specifying the marker file convention: e.g., "using a session-scoped temp file keyed to the session ID and the paused state (e.g., `/tmp/rdd-pause-notice-${SESSION_ID}`)," to distinguish it from the advisory-mode marker.

---

### P3 — Consider

**P3-A — ADR-071 revised: the P2-B note in Consequences is correctly placed but uses slightly imprecise language.**

- **Location:** Consequences §Negative, final paragraph (P2-B note)
- **Claim:** "ADR-048 supports this directionally but does not state category-inheritance explicitly."
- **Evidence gap:** Reading ADR-048, the composable skill family decision is about decomposing a monolithic build skill into four coordinated skills with "composition triggers" (ADR-054). ADR-048 does not address category inheritance at all — it addresses which skills exist and how they compose. "Supports this directionally" is an accurate hedge, but a reader might interpret it as meaning ADR-048 contains relevant evidence on category inheritance, when in fact it contains relevant structural evidence about mode shifts but no relevant semantic evidence about category propagation. The claim is not wrong; the precision could be tightened.
- **Recommendation:** Consider replacing "ADR-048 supports this directionally" with "ADR-048 establishes the mode-shift composition pattern that the inference depends on, but does not address category inheritance." This makes clear what ADR-048 does and does not contribute.

**P3-B — ADR-072 scenarios: the "Stop hook honors Skipped phases declaration" scenario is not fully refutable.**

- **Location:** Scenarios §Cycle Shape Declaration (ADR-072), scenario "Stop hook honors Skipped phases declaration"
- **Claim:** "Then the hook does not require any artifacts for that phase / And the hook returns allow without running the per-phase manifest check for the skipped phase / And the hook continues to enforce the manifest for non-skipped phases."
- **Evidence gap:** The first two Then-clauses describe the same outcome (allow without manifest check) from two angles. They are not independent falsifiable conditions — if the hook allows without manifest check, both are simultaneously satisfied or violated. The scenario would be more precisely refutable if the third clause ("continues to enforce for non-skipped phases") were separated into its own scenario (which it effectively already is — see "Skipped phase declaration does not bypass compound check for other phases"). The current scenario conflates two distinct behaviors in one Then-chain in a way that makes the scenario less precisely targeted.
- **Recommendation:** Split the "continues to enforce" clause into the dedicated non-bypass scenario, or add an explicit **But** connector to indicate the combined expectation. Minor — does not affect correctness, only clarity.

**P3-C — ADR-072: the Pause Log section convention is named in Decision but not reflected in the scenarios.**

- **Location:** Decision §Cycle-status convention for pause/resume; Scenarios §Cycle Shape Declaration
- **Claim:** The Decision specifies a "Pause Log" section in cycle-status.md with a markdown table. The scenario "Pause Log records pause/resume history" covers this.
- **Evidence gap:** The scenario's Then-clause ("it contains a 'Pause Log' section with a table of pause/resume entries / each entry records the pause date, resume date (if resumed), and reason") is accurate but omits the entry numbering column (`#`) present in the Decision's table format. This is trivial but a scenario that tests structure should match the specified structure completely to be unambiguous for BUILD.
- **Recommendation:** Add to the Then-clause: "And each entry is numbered sequentially (#)." Minor.

---

### Scenario refutability verification

**ADR-071 feature block:** Six scenarios. All six describe observable outcomes tied to specific skill sections or behaviors. The "Dual placement with cross-references" scenario correctly tests both the cross-reference from COMPOSABLE TESTS to Step 5 and from Step 5 to COMPOSABLE TESTS without assuming the developer has read the other. The "Lifecycle Composition guidance scoped to build skill only" scenario tests the negative case (no lifecycle subsection in debug/refactor/review) — this is refutable against the skill files and is correctly scoped. The cached-buffer and retained-registry-entry scenarios are concrete examples that can be falsified by running the test suite. All six are satisfactory.

**ADR-072 feature block:** Seven scenarios. See P3-B above for the minor split observation. The "Full-pipeline cycle behavior unchanged" scenario is correctly negative (tests that Mode A behavior is unaffected). The "Skipped phase declaration does not bypass compound check for other phases" scenario correctly tests the non-bypass guarantee for non-skipped phases. All seven are satisfactory modulo the P3-B precision point.

---

### Cross-ADR consistency: "situational Provenance check"

Both ADR-071 and ADR-072 include a Provenance check section. Both include a note that reads (ADR-072): *"same situational framing as ADR-071's Provenance check."* This self-referential framing is internally consistent — ADR-072 explicitly defers to ADR-071's framing note rather than restating it. The two notes are coordinated rather than independent, which is appropriate. The note in ADR-072 does not add new content about normative status; it adopts ADR-071's characterization by reference. This is consistent and coherent.

One minor observation: ADR-071's note says the Provenance check "is not yet established as a required template element for all ADRs. A future methodology ADR could either standardize it or formally declare it situational." ADR-072 says "same situational framing as ADR-071's." If ADR-071's note is the frame, and ADR-072's note says "same," the reader needs ADR-071 in hand to understand what ADR-072 means. For a corpus that may eventually be read without the other ADR immediately adjacent, this coupling is mild friction. It is not an argument error; it is a P3 concern already captured under Framing P3-A (carry-forward).

---

## Section 2: Framing Audit

### Carry-forward framing issues (passes 1-5)

The three framing issues from passes 1-5 are re-reported unchanged. The dual-placement revision addressed the underlying internal tension that motivated Framing P2-A (the ADR now has lifecycle guidance in Step 5), but the framing question itself — whether COMPOSABLE TESTS is the right primary anchor for lifecycle reasoning versus Step 5 — remains open. The revision makes P2-A less acute (the tension is resolved by placing guidance in both), but it does not dissolve the framing question about primary-vs-secondary placement.

- **Framing P2-A (carry-forward, open at user gate):** The COMPOSABLE TESTS extension may be placed in the wrong section for lifecycle reasoning. Less acute than in passes 1-4 because the dual-placement revision added Step 5 guidance, but the framing question about which anchor is "primary" remains visible.
- **Framing P2-B (carry-forward, open at user gate):** The scope exclusion of other composable skills relies on an unverified asymmetry — mode-shift inheritance propagates category awareness. The P2-B note added to ADR-071's Consequences is a welcome acknowledgment but does not resolve the underlying concern.
- **Framing P3-A (carry-forward, open at user gate):** The Provenance check section lacks normative status. The P3-A note added to ADR-071's Provenance check acknowledges this situationally; it does not resolve it.

---

### ADR-072: Framing Audit

#### Question 1: What alternative framings did the evidence support?

**Alternative A: Frame the Stop-hook loop as a hook robustness problem, not a cycle-shape problem.**

The infinite loop occurred because the hook fires on every Stop event and blocks when the gate reflection note is absent. An alternative framing would treat this as a hook robustness failure: the hook should have a rate-limiting mechanism (e.g., block at most once per N minutes, or require a minimum interval between successive blocks) rather than firing unconditionally. The driver — 60 blocks in succession during a user-away session — is a harness-layer behavior problem as much as a cycle-state problem.

What the source material supports: the hook script has no rate-limiting logic. The advisory-mode notice is suppressed after the first fire (session-scoped suppression via temp file), but blocking is not similarly suppressed. A paused state in cycle-status.md is the chosen fix; an exponential backoff or session-scoped block-once-then-downgrade-to-advisory would address the same problem from the harness side.

What a reader would need to believe: that the loop is a harness symptom rather than a cycle-state symptom — and that making the harness more resilient is the right fix rather than making cycle state more expressive.

**Alternative B: Frame the mini-cycle skip as a manifest extension, not a cycle-status extension.**

The manifest already governs what each phase requires. An alternative framing would add a `skippable: true` property to individual phase entries in the manifest, allowing the manifest to declare which phases may legitimately have no artifacts. The cycle-status field is then unnecessary; the hook would use the manifest's `skippable` flag alongside a per-cycle override mechanism.

What the source material supports: ADR-063's manifest format already accommodates extensibility via `format_version`; adding a `skippable` property is a one-key extension. The manifest is already read by the hook before the cycle-status field would be.

What a reader would need to believe: that "which phases are optional" is a cross-cycle structural property (belonging in the manifest) rather than a per-cycle state decision (belonging in cycle-status). The ADR rejects this on the grounds that skipping is a cycle decision — but a reader skeptical of that distinction would see the manifest as the more natural home.

**Alternative C: Frame the pause as a harness-layer mode, parallel to enforcement vs. advisory.**

The hook already has two modes — enforcement (with marker file) and advisory (without). The pause could be framed as a third mode: a session-level state that the hook respects, triggered by a specific session signal (e.g., a pause toggle the agent sets at the beginning of a session in which the user is away). This would keep cycle-status.md clean of operational state and place the pause signal where other operational modes live (the harness layer).

What the source material supports: the advisory marker uses a session-scoped temp file; pausing could follow the same pattern. The distinction between pause (a per-cycle operational state) and advisory mode (a per-corpus migration state) is one the ADR does not fully argue for.

What a reader would need to believe: that pause is an operational, session-scoped concern rather than a per-cycle durable state — and that placing it in cycle-status.md conflates the durable record with operational control.

---

#### Question 2: What truths were available but not featured?

**Finding A: The hook already has a mechanism to suppress repeated notices, which it does not apply to blocks.**

The advisory notice in the hook uses `NOTICE_MARKER="/tmp/rdd-advisory-${SESSION_ID:-unknown}"` and `touch "$NOTICE_MARKER"` to fire the notice only once per session. The blocking path has no analogous session-scoped suppression. ADR-072's context accurately identifies the symptom (60 successive blocks) but does not note this structural asymmetry in the existing hook code — which means the Decision's framing (add cycle-status fields to control hook behavior) is one of two equally available interventions, the other being extending the existing session-scoped suppression to apply to blocks in an in-progress-gate state.

Why it may have been excluded: the ADR is solving at the cycle-state level (more expressive cycle record), not at the harness level (more resilient hook). Both framings are defensible, but the source material supports an alternative fix that the ADR does not mention in rejected alternatives.

**Finding B: The Phase field regex vulnerability is a latent problem independent of the skip/pause fix.**

The hook parses `**Phase:**` with `sed -E 's/^\*\*Phase:\*\*[[:space:]]*([A-Za-z_-]+).*/\1/'`. This extracts the first alphabetic token. Any prose entry in the Phase field that begins with a phase name (e.g., "decide — gate in progress") would parse correctly. But a value like "RESEARCH / DISCOVER..." parses to "RESEARCH" (the first token), not to an error. The Skipped phases field solves the specific case where the Phase field was initially written as prose; it does not harden the hook against future similarly structured prose values. The ADR correctly identifies the parsing failure as the precipitating cause but does not recommend adding validation or canonical formatting enforcement to the Phase field itself. This is within the ADR's scope to leave to BUILD, but noting it here makes the latent risk visible.

**Finding C: ADR-072 does not address what happens when both Paused and Skipped phases are present.**

The Decision specifies a priority order (Paused takes precedence: short-circuit all checks → then Skipped phases → then normal). This is implied by the "if Paused is present and non-empty: return allow without running any manifest check" logic, but the ADR does not state the priority order explicitly. A cycle that is both paused and has skipped phases is a realistic scenario; the hook behavior is deterministic (Paused wins) but the Decision text does not make this explicit.

---

#### Question 3: What would change if the dominant framing were inverted?

The dominant framing: cycle-shape declaration is a cycle-level affordance — the cycle's skipped phases and paused state are per-cycle facts that belong in the per-cycle record (cycle-status.md).

The inverted framing: cycle-shape declaration is a methodology affordance — the capacity to skip phases and pause cycles is a feature of the methodology (not a per-cycle fact), and should be represented in the methodology's machinery (the manifest, the hook's own logic, or a dedicated methodology-layer configuration) rather than in each cycle's status file.

Under the inverted framing:
- The manifest could carry `skippable: true` per phase (Alternative B above becomes primary).
- The hook could have pause/resume built in as a session-level command rather than a field the user edits in a markdown file.
- The cycle-status.md would remain cleaner — a record of what happened (Phase, Cycle number, artifact log), not a control surface for hook behavior.
- The ADR's "single source of truth" argument for cycle-status.md becomes weaker: cycle-status.md is already a hybrid of durable record and operational state (the Phase field controls hook behavior); adding Skipped phases and Paused extends this hybrid rather than questioning it.

What the document would need to address: if methodology configuration should live in methodology machinery rather than per-cycle documents, then cycle-status.md's Phase field itself is a design smell — it is a per-cycle field that drives methodolgy-layer behavior. The inverted framing would ask whether the Phase field should also be moved to a more operational location. The ADR would need to justify why Phase lives in cycle-status but pause/skip could live elsewhere, or else treat all three consistently.

---

### Framing Issues — ADR-072

**Framing P2-A (new, open at user gate): A rejected alternative is missing — the hook's existing session-scoped suppression could have been extended to block-once-then-advisory.**

- **Location:** Rejected alternatives section; Context §"In-progress gates and user-away sessions create Stop-hook loops"
- **Issue:** The hook already suppresses repeated advisory notices using a session-scoped temp file. The same pattern could be applied to blocking: block once per session on a user-tooling-type mechanism (the gate reflection note), then downgrade to advisory for subsequent fires within the same session. This would address the 60-successive-blocks failure mode without adding fields to cycle-status.md. The ADR's rejected alternatives do not engage this option.
- **Why this matters:** The chosen fix (adding fields to cycle-status.md) increases the surface area of cycle-status.md as a control document. The hook-level fix would keep the control surface smaller. A reader might ask why the simpler intervention (extend the existing suppression pattern) was not considered.
- **Do not auto-correct.** Surface to user.

**Framing P2-B (new, open at user gate): The framing of the Pause field as a durable record vs. operational control is underdeveloped.**

- **Location:** Consequences §Neutral ("Advisory-mode corpora continue to behave as today")
- **Issue:** The Pause field is written to cycle-status.md and is "intended to be removed when the cycle resumes." This means cycle-status.md is a control document during the pause and a record document after the pause. The ADR does not acknowledge this dual nature — it consistently frames cycle-status.md as "the durable record," which is accurate for the Pause Log (which persists) but not for the Paused field itself (which is transient operational state). The distinction matters for the "single source of truth" argument: if the Paused field is operational state, placing it in a durable record document is a design choice that should be justified, not assumed.
- **Do not auto-correct.** Surface to user.

**Framing P3-A (new, open at user gate): The priority order for coexisting Paused and Skipped phases is implicit.**

- **Location:** Decision §Hook behavior changes
- **Issue:** The decision text implies Paused takes precedence over Skipped phases (if Paused is present, short-circuit; otherwise check Skipped phases; otherwise run manifest check), but this priority order is not stated explicitly. A cycle that is both paused and has skipped phases would benefit from the ADR stating the priority explicitly, both for the human reader and for the BUILD-phase implementer.
- **Do not auto-correct.** Surface to user.

**Framing P3-B (new, open at user gate): ADR-072's driver provenance is faithfully stated.**

This is a positive finding, included for completeness. The Provenance check states: *"The user identified cycle-status.md as the correct location and named the semantic category (pause) before the agent drafted this ADR."* Based on the ADR's Context section (which quotes the user's reframing directly: "for mini-cycles we should 'pause' via the cycle status doc and allow for side-sessions like this that don't send us into hook loops"), this attribution is accurate. The "pause" semantic is user-named; the two-field split is drafting synthesis. The Provenance check distinguishes these correctly.

---

### Carry-forward status summary

| Issue | ADR | Priority | Status |
|---|---|---|---|
| Framing P2-A (passes 1-5): COMPOSABLE TESTS primary placement | ADR-071 | P2 | Carry-forward, less acute post-dual-placement revision |
| Framing P2-B (passes 1-5): mode-shift inheritance unverified | ADR-071 | P2 | Carry-forward, P2-B note added to ADR text |
| Framing P3-A (passes 1-5): Provenance check normative status | ADR-071 | P3 | Carry-forward, P3-A note added to ADR text |
| Framing P2-A (this pass): missing hook-suppression rejected alternative | ADR-072 | P2 | New, open at user gate |
| Framing P2-B (this pass): durable-record vs. operational-control | ADR-072 | P2 | New, open at user gate |
| Framing P3-A (this pass): priority order for coexisting Paused+Skipped | ADR-072 | P3 | New, open at user gate |
