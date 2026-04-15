# Susceptibility Snapshot

**Phase evaluated:** DECIDE → BUILD (Cycle 015, mini-cycle + scope expansion)
**Artifact produced:** ADR-071 (revised, three-extension dual placement), ADR-072 (new), ADR-071 and ADR-072 scenario blocks (thirteen scenarios total), seven argument-audit passes (clean on pass 7)
**Date:** 2026-04-13

---

## Observed Signals

| Signal | Strength | Trajectory | Notes |
|--------|----------|------------|-------|
| Assertion density | Ambiguous | Stable | ADR-071: assertion density stable from prior snapshot. ADR-072 was drafted in a single pass in response to a concrete hook-loop failure — all four argument chains asserted at once, no user interrogation between draft and pass-6 audit dispatch. The audit cycle substantively engaged the chains; none were unchallenged. Ambiguous overall: the drafting conditions for ADR-072 were time-pressured (hook loop in progress), but the chain quality held under seven passes. |
| Solution-space narrowing | Clear (ADR-072) / Absent (ADR-071) | Rising for ADR-072 | ADR-071: solution space was well-examined from early passes; no narrowing introduced by the dual-placement revision. ADR-072: the chosen design (two cycle-status.md fields) was adopted at drafting time; the rejected-alternatives section covers four alternatives but omits the most proximate one — extending the hook's existing session-scoped suppression to blocking behavior. The pass-6 audit flagged this as Framing P2-A; it remains unengaged in the artifact. The solution space narrowed to "cycle-status.md fields" before the hook-side alternative was examined. |
| Framing adoption | Clear (ADR-072) | Rising for ADR-072 | The user's exact words ("for mini-cycles we should 'pause' via the cycle status doc and allow for side-sessions like this that don't send us into hook loops") named a location (cycle-status.md) and a semantic (pause). The ADR adopted both as design commitments rather than treating them as framing candidates. The Provenance check correctly attributes user authorship of "pause" and "cycle-status.md location" — but those are two of the three most consequential design decisions, and neither was examined for alternatives before the ADR crystallized around them. The hook-side alternative (extend session-scoped suppression) would have addressed the loop without cycle-status.md changes. |
| Confidence markers | Ambiguous | Stable | ADR-072 uses appropriately hedged language in Consequences ("weak structural anchor (it relies on the human reader)"). ADR-071's revised Consequences tightened the ADR-048 language from "supports this directionally" to "establishes the mode-shift composition pattern the inference depends on, but does not address category inheritance" — a precision gain, not a confidence inflation. No "clearly" / "obviously" patterns. |
| Alternative engagement | Declining (ADR-072) | Rising concern | ADR-071: five alternatives engaged from early in the process; rebuttal quality is adequate. ADR-072: four alternatives engaged, but the most proximate alternative (hook-side one-time block-then-advisory, mirroring the existing advisory-mode suppression) is not in the rejected-alternatives section. Pass-6 audit identified this gap; pass-7 re-reported it. After two audit passes, the alternative has been documented in the framing findings but not engaged in the ADR text. The gap persists into BUILD. For the four alternatives that are listed, engagement quality is substantive: the environment-variable rejection ("invisible to the artifact trail") and the manifest-level-skip rejection ("cycle-independent, weaker guarantee for Mode A") engage the strongest cases for those alternatives. |
| Embedded conclusions | Clear (ADR-072) | Stable | Two conclusions were user-embedded in the scope-expansion moment: (1) cycle-status.md is the correct location, and (2) "pause" is the right semantic category. The ADR's Provenance check correctly attributes both to the user. The issue is not misattribution — it is that user-at-moment-of-fatigue framing was treated as design specification rather than as a starting point for alternatives exploration. The "Option A: bundle into Cycle 015" scope expansion authorized bundling, not the specific design. Whether the user intended their reframing as design specification or exploratory direction is not established. |

---

## Evaluation by Brief Item

### 1. Framing origin for ADR-072 — "pause" semantic

The Provenance check's attribution is accurate. The user's exact words are quoted directly: *"for mini-cycles we should 'pause' via the cycle status doc and allow for side-sessions like this that don't send us into hook loops."* The "pause" semantic is user-named. The "cycle-status.md" location is user-named. The two-field split (Skipped phases vs. Paused) is drafting-time synthesis grounded in the user's reframing plus Cycle 015's existing scoping record (which already listed skipped phases as prose). The Provenance check correctly distinguishes these.

**Assessment:** No fabrication of user intent. The framing-origin attribution is precise and honest. The susceptibility concern is not that the Provenance check is wrong — it is that the user's framing at a fatigue moment was operationalized as design specification rather than as a direction requiring alternatives examination. The attribution is accurate; the question is whether the user's words should have been treated as settling the design or opening it.

### 2. Pass-6 Framing P2-A (hook-suppression alternative) — concurrence assessment

The pass-6 finding is specific, accurate, and actionable. The hook does suppress repeated advisory notices via `NOTICE_MARKER="/tmp/rdd-advisory-${SESSION_ID:-unknown}"` with `touch "$NOTICE_MARKER"` — a session-scoped one-time-fire pattern. The blocking path has no analogous suppression. Extending this pattern to blocking (block once per session on a gate-in-progress condition, then downgrade to advisory for subsequent fires) would address the 60-successive-blocks problem from the harness side without adding fields to cycle-status.md.

This snapshot concurs with pass-6's concern. The finding is:
- **Specific:** the mechanism exists in the hook; its absence from the blocking path is observable.
- **Actionable:** the fix is a bounded hook change (add session-scoped marker for first-block, downgrade subsequent blocks to advisory) — entirely within the build scope.
- **In-cycle applicable per ADR-068:** this is not a future-cycle speculation; it is an alternative design for a decision that BUILD will implement in the next phase.

The finding is live and warrants surfacing at the user gate. It is not a blocker — the ADR-072 approach is coherent and its argument chains hold — but the user should explicitly authorize adopting cycle-status.md fields over the hook-side alternative, having engaged with what the hook-side alternative would look like.

### 3. Scope expansion susceptibility

**Solution-space narrowing:** The user's "Option A" authorization occurred at a moment when the hook loop was active and the user had just provided a concrete reframing. The authorization can be read two ways: (a) authorize bundling the pause mechanism into Cycle 015 with design still open, or (b) authorize the specific design the reframing implied (cycle-status.md fields). The ADR treats it as (b). The design was crystallized at drafting time around the user's reframing, and the rejected-alternatives section was populated thereafter. The order is characteristic of post-hoc alternatives generation — alternatives listed after the decision crystallized, which is the standard ADR pattern but which bypasses pre-crystallization alternatives exploration.

**Hook-side alternative:** The hook-side one-time-block-then-advisory alternative was not present in any draft of ADR-072's rejected alternatives section. It appeared first in the pass-6 framing audit. This means it was generated by the isolated auditor, not by the drafting agent — which is the correct detection pathway. The pattern is consistent with the Self-Correction Blind Spot: the in-conversation agent narrowed to cycle-status.md fields early; the isolated evaluator raised the alternative.

**"Option A" as endorsement of scope vs. design:** The user's "let's do Option A" response followed an agent presentation of three options for handling the scope expansion. The agent's Option A description was "bundle the pause mechanism into Cycle 015 now." This is a scope decision. The specific design (two fields in cycle-status.md vs. hook-side suppression) was not enumerated at the option-selection moment. The user authorized scope expansion; the design selection happened in the drafting agent's draft without a design-level alternatives presentation to the user.

### 4. Cross-ADR composition susceptibility

ADR-072's Provenance check includes a note reading: "same situational framing as ADR-071's Provenance check." This is self-referential — it adopts ADR-071's characterization by reference rather than independently justifying the Provenance check's presence for ADR-072's context.

For ADR-072's context (drafted mid-gate in response to a concrete hook-loop failure, with the driver being the observed loop itself), the justification for including a Provenance check is, if anything, stronger than for ADR-071 — the provenance is directly observable and time-stamped. The "same situational framing" note is not wrong; it is lazy. ADR-072 could have stated its own justification ("included because the ADR was drafted mid-gate and the provenance is the loop itself") rather than deferring to ADR-071. This is a mild framing-adoption signal: ADR-072 imported a stylistic convention from ADR-071 without independently justifying it.

The pass-6 audit correctly classified this as P3 (no argument error, readability friction). This snapshot concurs.

### 5. Rebuttal quality for ADR-072's four rejected alternatives

**Rely on user discipline:** Rebuttal engages the strongest case (why discipline is insufficient). References Invariant 8's original motivation directly. The loop happened *because* discipline alone fails when methodology has no structural representation of the state. Adequate.

**Agent-inferable fields (infer from cycle type):** Rebuttal engages the specificity argument (explicit declaration is a single source of truth the hook can rely on; heuristic inference introduces ambiguity). Does not engage the strongest case for agent-inferability, which is that the scoping agreement is already recorded in cycle-status.md as prose (the Phase field's initial prose value was the precipitating cause — the fix could be better parsing, not new fields). Partially adequate.

**Environment-variable toggle:** Rebuttal engages the observability argument (session-scoped and invisible to the artifact trail). Engages the strongest case against env-var: if methodology is partly a record of how the cycle unfolded, pauses belong in the durable record, not in the session environment. Adequate.

**Manifest-level skippable property:** Rebuttal engages the scope argument (manifest is cycle-independent; skipping is a cycle decision). Engages the strongest case against manifest extension: a manifest-level flag would weaken the Mode A guarantee (all cycles share the manifest). Adequate.

**Missing alternative (hook-side suppression):** Not engaged. The most proximate alternative — extend the existing advisory-mode session-scoped suppression to the blocking path — is absent from the rejected-alternatives section. This is the clearest rebuttal gap in the corpus.

### 6. Engagement signals from the DECIDE-phase conversation

**Deep engagement at scoping and option selection:** The user provided a clear and concrete reframing at the scope-expansion moment, answered the P2-B/P3-A open questions with explicit option letters, and engaged with the scope question directly. This was not fatigue-driven non-engagement — the user gave substantive input. The concern is not the quality of engagement but the design-vs-scope distinction: the user engaged with scope ("bundle it now" vs. "defer it") but not with the specific design ("cycle-status.md fields" vs. "hook-side suppression").

**Long audit-revision loops:** Engagement was thinner during the middle passes (passes 2-5 were primarily fix verification and re-reporting). This is expected — audit loops are mechanical. No susceptibility pattern here.

**Repeated "Waiting." responses:** The repeated Stop events during the user-away session produced repeated minimal responses. This is not a disengagement signal; it is the hook loop manifesting. The agent could not distinguish "user stepped away" from "appropriate agent inactivity." The loop is what ADR-072 addresses. Correctly identified as a methodology gap, not an agent behavior failure.

**User authorization tempo:** "Let's do Option A" was a quick decision following a structured three-option presentation. Rapid authorization of scope expansion is not itself a susceptibility signal — the user had sufficient context. The susceptibility is that "Option A" bundled scope and design together in the agent's presentation, and the user's authorization resolved both simultaneously without a design-level alternatives conversation.

---

## Interpretation

The expanded corpus (ADR-071 revised + ADR-072 new) shows a split pattern:

**ADR-071** is in earned-confidence territory. Seven argument-audit passes, dual-placement revision resolving the primary internal tension, framing findings correctly classified as open at the user gate, rebuttal quality adequate across five alternatives. The remaining framing findings (COMPOSABLE TESTS primary-vs-secondary placement, mode-shift inheritance unverified, Provenance check normative status) are appropriately scoped as user-gate discussion items, not structural blockers. BUILD will inherit these as acknowledged uncertainties with explicit documentation in the ADR text.

**ADR-072** exhibits a narrowing pattern that is not fully consistent with earned confidence. The pattern is:

1. Solution space narrowed to cycle-status.md fields at the moment the user provided framing, before alternatives were examined.
2. The most proximate alternative (hook-side session-scoped suppression extension) was not generated by the drafting agent and appeared only in the isolated auditor's pass-6 framing report.
3. After two audit passes identifying the gap, the alternative remains unengaged in the ADR text — it is documented in the framing findings but the ADR's rejected-alternatives section does not address it.
4. The user's "Option A" authorization resolved scope and design simultaneously without a design-level alternatives presentation.

This is a partial Self-Correction Blind Spot pattern: the isolated auditor detected what the in-conversation agent missed. The finding has been recorded but not resolved. BUILD will implement the two-field solution unless the user explicitly engages the hook-side alternative at the gate.

The narrowing is bounded. ADR-072's chosen design (cycle-status.md fields) is coherent, argument chains hold through pass 7, and the Invariant 8 argument survives scrutiny. The hook-side alternative is a genuine alternative — not necessarily a superior one — and the user could reasonably prefer the cycle-status.md approach after considering both. The problem is that the user has not yet been presented with the hook-side alternative as a named design option.

---

## Recommendation

**Grounding Reframe recommended — targeted to ADR-072's one live design gap.**

**The prior snapshot's grounding reframe (COMPOSABLE TESTS vs. Step 5 placement) is resolved.** Dual placement is implemented and scenarios validated across all three extension points. No further grounding needed for ADR-071.

**ADR-072 grounding trigger:** One alternative — extending the hook's existing session-scoped suppression to the blocking path — is documented in the framing findings but absent from the ADR's rejected-alternatives section. BUILD will implement the two-field design unless the user decides otherwise. The user has not been presented with the hook-side alternative as a named design option.

**What the user would be building on without grounding:** A two-field extension to cycle-status.md (Skipped phases, Paused) that adds operational control surface to a durable record document. The hook-side alternative would address the 60-successive-blocks problem from the harness layer instead, keeping cycle-status.md as a pure record. The user authorized scope expansion ("bundle now"), not the specific design, but the ADR operationalized that authorization as design endorsement.

**Concrete grounding action — one question at the user gate:**

Present the hook-side alternative explicitly: "ADR-072 solves the Stop-hook loop by adding two fields to cycle-status.md. There is a proximate alternative: extend the hook's existing session-scoped suppression (which already prevents repeated advisory notices) to apply to blocking as well — block once per session on a gate-in-progress condition, then downgrade to advisory for subsequent fires. This would address the 60-successive-blocks problem without adding fields to cycle-status.md. ADR-072's rejected alternatives don't engage this option. Do you want to add it as a named rejected alternative (with the ADR's reasoning for preferring cycle-status.md fields), or does the hook-side alternative change your preference for the design?"

**Acceptable user responses:**
- User articulates a preference for cycle-status.md fields over hook-side suppression (e.g., "the durable record is worth it," "explicit declaration is better than harness-layer magic," "I want the Pause Log"). In this case, add the hook-side alternative to ADR-072's rejected-alternatives section with the user's reasoning and proceed to BUILD.
- User prefers the hook-side alternative. ADR-072 needs revision before BUILD begins.
- User is indifferent and defers to the agent's judgment. This is also an acceptable gate outcome if the user can articulate which considerations are less important to them.

**Remaining framing findings (open at user gate, not blocking):**

Six framing findings carry forward as documented in the audit trail (three from ADR-071, three from ADR-072). Of these, ADR-071's Framing P2-A (COMPOSABLE TESTS primary placement) is the one most likely to surface as a usability question during BUILD — test authors may naturally consult Step 5 first and miss the COMPOSABLE TESTS subsection. The dual-placement with cross-references mitigates this; whether it mitigates it sufficiently is a judgment the user should make at the gate.

ADR-072's Framing P2-B (durable-record vs. operational-control dual nature of the Paused field) and P3-A (implicit priority order for coexisting Paused+Skipped phases) are implementation-guidance gaps for BUILD. P3-A is actionable: the ADR should state the priority order explicitly ("Paused takes precedence; if Paused is present and non-empty, all checks short-circuit; otherwise, Skipped phases are checked"). P2-B is a design-philosophy tension that does not affect BUILD correctness but affects how future readers interpret cycle-status.md's character as a document.
