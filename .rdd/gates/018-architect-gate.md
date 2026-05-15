# Gate Reflection: Cycle 018 Essay-Outline Form Change — ARCHITECT → BUILD

**Date:** 2026-05-14
**Phase boundary:** ARCHITECT → BUILD
**Cycle:** Cycle 018 Essay-Outline Form Change (ADR-092 + ADR-093)

## Belief-mapping question composed for this gate

The ARCHITECT phase ran in autonomous mode at the user's explicit instruction (SessionStart hook: "work without stopping for clarifying questions"). The gate's question was composed from the susceptibility snapshot's P3 Signal #1, which surfaced an architecture-level alternative the agent had not examined autonomously: the Outline-Coherence Signal's Discrimination Test routing currently lives in the Research Skill's stewardship guidance per ADR-092 §6, requiring the user to cross-reference the skill text after reading the auditor's expansion-fidelity finding. The snapshot's suggestion was to ALSO name the routing as a field on the auditor's finding output itself (`Boundary 1 violation — scope-suspect per ADR-092 §6`) so the routing reaches the user without the cross-reference step.

The question presented to the user was a structured allocation choice (AskUserQuestion) — three options: (a) add the routing to WP-B auditor output; (b) keep the routing in Research Skill only; (c) defer to a future BUILD-phase ADR. A second question asked about WP-E (Domain Model Amendment 24 follow-on) timing — ship in Cycle 018 BUILD or hold as a future stewardship pass. A third question asked whether to proceed to BUILD.

The question form is not classical belief-mapping ("what would you need to believe for the alternative to be right?") — it is structured-choice allocation between named options. The autonomous-mode character of the phase made the structured-choice form appropriate: the user delegated the work to the agent and the gate's role was a routing-decision moment rather than a teaching conversation.

## User's response

**Question 1 (Allocation choice):** "Add the routing to WP-B auditor output" — the user selected the snapshot's recommendation, accepting that WP-B's argument-auditor edit gains an additional Boundary-named-routing field in the expansion-fidelity findings subsection so the routing reaches the user without cross-reference. The selection accepted the preview content (a worked example showing the routing field inline in the audit output).

**Question 2 (WP-E timing):** "Ship in Cycle 018 BUILD (with WP-B)" — the recommended option. The user accepted that the domain-model entry alignment ships with the auditor edit so the v15.0 release reads coherently. Marginal BUILD-scope cost; preserves the cycle's atomicity.

**Question 3 (Gate decision):** "Proceed to BUILD" — the user accepted the system design v15.0 amendments, the responsibility matrix entries (35 Cycle 018 entries), the fitness criteria (23 system-level + inline per-amendment), the boundary integration tests (7) + invariant enforcement tests (5), and the roadmap (6 WPs with classified dependencies, transition states TS-1 through TS-4, and three Open Decision Points).

## Pedagogical move selected

**Probe (structured-choice variant).** The agent presented the snapshot's P3 Signal #1 finding directly and asked the user for an allocation judgment on a concrete artifact-level question — where the Discrimination Test routing field should live. This is a Probe in the sense of referencing specific artifact content (the Outline-Coherence Signal in ADR-092 §6; the auditor's expansion-fidelity-findings output template in ADR-093 §4) and asking for reasoning about it. The structured-choice form was a concession to the autonomous-mode character of the phase — the user had explicitly declined the open-ended teaching conversation a classical AID gate would compose.

The Probe operated outside the standard "Interpret engagement quality, then Decide pedagogical move" cycle. Engagement quality was N/A in autonomous mode (the user did not interact during the phase). The gate's purpose was to convert the snapshot's recommendation into a load-bearing decision while preserving the user's judgment on the specific allocation question. The user's selection of "Add the routing to WP-B auditor output" confirmed the snapshot's read; the user could have selected "Keep routing in Research Skill only" if they preferred to preserve the existing ADR-092 §6 anchoring as-is.

## Commitment gating outputs

**Settled premises (the user is building on these going into BUILD):**
- The system design v15.0 amendments as drafted (Research Skill + Argument Auditor + Orchestrator + ORIENTATION + Domain Model follow-on).
- The responsibility matrix's Cycle 018 entries (35 entries allocating Amendment 23 concepts).
- The Cycle 018 fitness criteria (23 system-level + inline per-amendment).
- The Cycle 018 boundary integration tests (7) and invariant enforcement tests (5).
- The roadmap's six WPs (A through F) with the classified dependencies (WP-A ↔ WP-B ship-together hard; WP-B → WP-E hard; A–E → F hard; A → C, A → D implied logic).
- The WP-B Discrimination Test routing field addition (snapshot Signal #1 enhancement).
- WP-E (Domain Model Amendment 24 follow-on) ships in Cycle 018 BUILD with WP-B.
- ADR-092 + ADR-093 ship together at BUILD per the cross-ADR integration scenario.

**Open questions (the user is holding these open going into BUILD):**
- WP-A vs WP-B order within the ship-together BUILD pass (builder choice; either can be authored first).
- Whether aspirational fixture tests beyond the two named (`test_essay_outline_form_documented.sh`, `test_argument_auditor_essay_outline_genre.sh`) ship at BUILD or defer to future stewardship pass. The Cycle 018 Boundary Integration Tests table names seven fixtures; only two are in the load-bearing path of the unified pre-BUILD sweep checklist.
- Outline-Production Discipline reliability under task load (inherited from ADR-092 §5; structurally analogous to Cycle 10's prose-hardening-doesn't-work finding; multi-cycle empirical question; not a BUILD blocker).
- Argument-graph parsing at production-scale Essay-Outlines (held; not a BUILD blocker).
- F2 (SYNTHESIZE-precedent subordination) durability through future cycles (held; not a BUILD blocker).
- Kim et al. Open Question 7 (input-side susceptibility) as future-cycle empirical test candidate (held as Neutral consequence in ADR-092; not a BUILD blocker).
- Methodology amendment for Dogfooded Both-Form Production as standard methodology test for artifact-form proposals (candidate held from Cycle 018 RESEARCH feed-forward signal 8; future cycle scope).

**Specific commitments carried forward to BUILD:**

1. **WP-A: `/rdd-research` Essay-Outline production** — four-section template, Outline-Production Discipline (Synthesis Bullets, scope-qualification bullets, CONFIDENCE-LEVEL tags, named meta-moves), Argument-Graph format with MUST anchor + META reserved identifier, Outline-Coherence Signal stewardship guidance with discrimination test, filename pattern `essay-outline-NNN-<slug>.md`, revise the "If you can't explain it clearly in prose..." line. Fixture: `test_essay_outline_form_documented.sh`.

2. **WP-B: `argument-auditor.md` Essay-Outline genre handling** — four-genre list, pyramid graph-traversal Process step, expansion-fidelity verification (Boundary 1/2/3 + Reverse 1/2), META audit-time review, output template extensions (pyramid coverage map + expansion-fidelity findings as Section 1 subsections), and the gate-decided **Discrimination Test routing field** on Boundary 1 / Boundary 2 P1 findings. Fixture: `test_argument_auditor_essay_outline_genre.sh`.

3. **WP-C: Orchestrator naming updates** — RESEARCH-phase prose-essay descriptions in `skills/rdd/SKILL.md` updated to reference Essay-Outline; Artifacts Summary table filename pattern.

4. **WP-D: ORIENTATION.md Section 4 update** — Essay-Outline named as the RESEARCH artifact form; legacy prose-essay form named as the prior pattern.

5. **WP-E: Domain Model Amendment 24 follow-on** — Argument-Graph (as artifact section) entry's judgment-anchored note updates to ADR-093 anchoring reference. **Ships in Cycle 018 BUILD with WP-B per the user's gate decision.**

6. **WP-F: Integration verification + Cycle 018 release** — run all Cycle 018 boundary integration tests; conformance-scan re-run; bump plugin version to v0.8.6; release notes.

7. **Ship-together constraint:** ADR-092 and ADR-093 ship in the same BUILD pass. WP-A and WP-B are paired; the layer separation in ADR-092 §5 degrades to discipline-alone if either ships without the other.

8. **Susceptibility snapshot feed-forward to BUILD:** the ARCHITECT-gate snapshot named two P3 feed-forward observations. Signal #1 (auditor output enhancement) is addressed in WP-B per this gate's user decision. Signal #2 (future-cycle methodology observation: ARCHITECT phases introducing new module boundaries should record an explicit Inversion Principle passage in the Design Amendment Log entry with tested belief-mapping against the alternative allocation) is recorded as a future-cycle methodology amendment candidate; out of scope for Cycle 018 BUILD.

9. **Plugin version:** v0.8.5 → v0.8.6 candidate at Cycle 018 release.

**Methodology-level observation on this gate's character.** Autonomous-mode ARCHITECT phases bypass the engagement-quality dimension of the AID rubric. The structural mechanisms (susceptibility snapshot dispatch; gate reflection note; structured-choice gate question on the snapshot's recommendation; advisory check at phase exit) provide the gate's substantive content. The user's gate engagement is concentrated at decision moments (the AskUserQuestion responses) rather than distributed through a teaching conversation. This is appropriate when the user explicitly delegates the phase's work to the agent and the architecture work consists of bookkeeping translating ADR commitments into structured system-design entries — but it does mean the gate's pedagogical move is structural (snapshot dispatch + structured-choice probe) rather than conversational. Future cycles may revisit whether the AID gate template explicitly accommodates autonomous-mode phases or treats the bypass as a Tier 2 concession to user-delegated work. This is methodology-level signal, not a Cycle 018 BUILD scope item.
