# Argument Audit Report

**Audited documents:** ADR-048 through ADR-054 (Composable Skill Family decision layer)
**Evidence layer:** Essay 011 — "Building with Understanding: Context-Reconstructive Development as Epistemic Practice"
**Prior ADRs consulted:** ADR-031, ADR-043, ADR-044, ADR-046, ADR-047
**Domain model:** docs/domain-model.md (Invariants 0–7, Amendment 15)
**Date:** 2026-04-02

---

## Summary

- **Argument chains mapped:** 14
- **Issues found:** 12 (2 P1, 6 P2, 4 P3)

### Argument chains mapped

1. Essay §1–§2 (understanding gap / artifact knowledge) → ADR-048 (decompose monolithic build)
2. Essay §3 (productive resistance / five research traditions) → ADR-048 (each skill is a distinct epistemic activity)
3. Essay §6 (shared context-gathering foundation) → ADR-049 (context gathering as embedded protocol)
4. Essay §2 (review skill demonstrates the pattern) → ADR-049 (reference implementation)
5. Essay §6 (forward-looking vs. backward-looking asymmetry) → ADR-050 (written session artifacts)
6. Essay §2 / §6 (five orientation questions) → ADR-051 (work decomposition from available sources)
7. Essay §4 (AI smell taxonomy, three tiers) → ADR-052 (AI smell detection in refactor skill)
8. Essay §7 (audit-refactor integration) → ADR-052 (targeted lens checks optional, not required)
9. Essay §8 (Invariant 4 tension / time budgets) → ADR-053 (time budget mechanism)
10. Essay §6 (build composes other skills) → ADR-054 (skill composition boundaries)
11. ADR-043/ADR-046 (review as optional utility) → ADR-054 (Build→Review trigger)
12. ADR-044/ADR-047 (two review modes, collaborative context gathering) → ADR-049 (reference implementation claim)
13. ADR-031 (artifact-mediated communication) → ADR-050 (session artifacts written to disk)
14. Domain model Invariant 3 (pragmatic/epistemic boundary) → ADR-049 step 5 / ADR-053 validation invariant

---

## Issues

### P1 — Must Fix

---

**Issue 1: ADR-054 introduces a new invocation semantic that contradicts ADR-043 and ADR-046**

- **Location:** ADR-054 §§ Build→Debug, Build→Refactor, Build→Review; ADR-043 Decision section; ADR-046 Decision section
- **Claim:** ADR-054 states that the build skill invokes debug, refactor, and review as inner skills through explicit trigger conditions, inheriting context and returning control to the build loop. The document frames this as a composition pattern where build "suggests" invocation and "the developer confirms or declines."
- **Evidence gap:** ADR-043 explicitly decided that `/rdd-review` is a utility skill — it "does not produce a phase artifact, does not have a fixed position in the pipeline sequence, and does not gate pipeline progression." ADR-046 reinforced this: the integration mechanics are stated as a "callout" in the build skill ("For epistemic review of this work package, invoke `/rdd-review`") — the *user* invokes it; it does not receive a trigger from the build loop and return control. ADR-054's composition model is structurally different: it posits build→review as a triggered invocation with context inheritance and explicit return semantics. This is not an optional utility pattern; it is a managed subprocess pattern. The two descriptions are architecturally incompatible. Either the review skill is a utility the user chooses to run (ADR-043, ADR-046) or it is an inner skill that build triggers, inherits context, and returns from (ADR-054). Both cannot be simultaneously true without an explicit amendment to ADR-043 and ADR-046.
- **Recommendation:** ADR-054 must either (a) align its Build→Review section with ADR-046's "callout" model, making the trigger advisory and the invocation user-initiated, or (b) explicitly supersede ADR-046 with a rationale for why the stronger composition model is warranted. If (b), ADR-043's utility framing also needs revisiting. The current state presents a structural contradiction that will produce inconsistent skill implementations.

---

**Issue 2: ADR-053 asserts that focused mode preserves "understanding quality" but offers no mechanism to verify this**

- **Location:** ADR-053 Decision section, "Focused (<10 minutes)" guidepost; Consequences §Positive
- **Claim:** "All skills adapt to the developer's real constraints without compromising understanding quality." The Focused mode retains "essential orientation: the single most consequential answer from each Orientation Question" and omits formal stewardship. The Consequences section claims the "focused mode makes epistemic building practical for small tasks."
- **Evidence gap:** The essay's productive resistance framework (§3) establishes that the five research traditions each identify friction as the mechanism of understanding-building. Ericsson's deliberate practice specifically requires "operating at the edge of failure." The essay does not establish that a 10-minute mode preserves the epistemic mechanisms it identifies — it establishes that "five minutes of genuinely oriented work beats thirty minutes of unfocused generation," which is a claim about *orientation quality*, not about whether the full epistemic loop (red-green-refactor at three levels, stewardship) operates in compressed time. The Focused mode explicitly drops the three-level refactor to "refactor only if a smell is glaring" and drops formal stewardship. The essay does not show this truncation preserves understanding quality; it shows orientation quality. The ADR conflates the two. More precisely: Invariant 4 (amended) says epistemic cost must be *productive*, not merely brief — but ADR-053 provides no mechanism to verify whether a focused session is productive or merely brief. The time budget is advisory, the clock is not watched, and no quality check replaces the dropped stewardship. The "invariant" that validation is never skipped protects orientation quality; it does not protect the downstream epistemic work.
- **Recommendation:** Qualify the Consequences claim. Change "without compromising understanding quality" to something like "while preserving orientation quality; the depth of downstream epistemic work scales with available time." Optionally, add a note that Focused mode is appropriate for tasks where the developer already holds strong domain understanding — the mode assumes epistemic capital the developer may not have.

---

### P2 — Should Fix

---

**Issue 3: ADR-048's "Everyday Developer cannot use current build skill" premise overstates the evidential support**

- **Location:** ADR-048 Context §3
- **Claim:** "The Everyday Developer stakeholder (product discovery, Cycle 6) needs epistemic building practices without requiring a six-phase pipeline."
- **Evidence gap:** The essay (§1) establishes that the current build skill "cannot function at all" without the full artifact corpus. This is the design of the current skill, not an empirically observed failure. The essay does not cite evidence that Everyday Developers have attempted to use the current skill and been blocked, nor does it cite stakeholder research showing this is a felt need. The product discovery document is referenced as the source ("product discovery, Cycle 6") but is not one of the audited artifacts, so the strength of that evidence cannot be assessed here. The claim is likely correct, but the form "the Everyday Developer *needs*" is stronger than "the current skill does not support the Everyday Developer," which is what the evidence actually shows. The gap matters because the decomposition decision rests in part on this stakeholder need — if the need is not well-evidenced, one of the three motivating findings is weaker than stated.
- **Recommendation:** Soften the claim to "the current build skill's pipeline mode cannot serve the Everyday Developer" or add a pointer to the specific product discovery finding that established this need. This is a scope accuracy issue, not a logical error — the decision would survive with two strong motivating findings instead of three.

---

**Issue 4: ADR-049 claims the review skill's collaborative context-gathering is a "reference implementation" for the embedded protocol, but the two protocols differ in a load-bearing way**

- **Location:** ADR-049 Context §3; ADR-049 Consequences §Positive §3
- **Claim:** "Consistent with the review skill's existing implementation (Collaborative Context-Gathering is already embedded)" — presented as validation that the embedded protocol pattern works.
- **Evidence gap:** ADR-047 defines Collaborative Context-Gathering as a five-step process where step 4 produces "an orientation summary: what the change is, why it exists, what constraints or goals shaped the approach, and what assumptions appear to be in play." ADR-049's step 4 produces answers to the five Orientation Questions, which are more structured and include "scope, integration points, and interaction mechanics" and "how do we demo what was built" — forward-looking questions the review skill does not need to answer, because review is backward-looking. The essay (§2) explicitly names this asymmetry: "Build orientation is forward-looking: it must generate scenarios and decisions from context that is inherently less complete than a finished diff." The review skill's step 4 and the build/debug/refactor skills' step 4 are doing substantively different synthesis work. Calling the review skill a "reference implementation" for the general protocol is accurate for steps 1–3 and 5, but overstates the generalizability of step 4. This matters because an implementer who treats the review skill as the template for build orientation will underspecify the forward-looking synthesis components.
- **Recommendation:** Qualify the reference implementation claim: "The review skill's protocol is the reference for steps 1–3 and 5 (mode detection, breadcrumb gathering, fetching, and validation). Step 4 diverges by direction: review synthesizes backward toward a completed change; build, debug, and refactor synthesize forward toward work that does not yet exist." This is a precision issue that will prevent implementation underspecification.

---

**Issue 5: ADR-050 adopts artifact-mediated communication (ADR-031) as justification, but session artifacts are architecturally distinct from ADR-031's scope**

- **Location:** ADR-050 Decision section; ADR-050 Consequences §Positive §3; ADR-031
- **Claim:** ADR-050 justifies written session artifacts by citing "artifact-mediated communication (ADR-031) is the established pattern for durable, inspectable output."
- **Evidence gap:** ADR-031 governs specialist work within RDD phases — specifically, "specialist subagents read input artifacts and write output artifacts." Its motivating concern is provenance: "after completing an RDD cycle, the user should be able to trace every claim to its verification." Session artifacts are explicitly marked non-permanent (`session-artifact: true` frontmatter), gitignored by default, and described as ephemeral ("discard [is] the typical case"). ADR-031's architectural pattern is for durable provenance artifacts. Citing it to justify session artifacts inverts the pattern's intent — ADR-031 exists precisely to avoid ephemeral outputs. The actual motivation in ADR-050 is different and valid: stewardship needs a stable reference, and context compression in long sessions can lose the build loop's work decomposition. That motivation does not require ADR-031 as justification. Invoking it introduces a terminological inconsistency: if session artifacts follow "artifact-mediated communication," they should be durable; if they are ephemeral by default, they contradict the pattern they claim to follow.
- **Recommendation:** Remove the ADR-031 citation from the justification for writing session artifacts. State the actual motivation directly: long-session context compression is the risk; written session artifacts are the mitigation. Note that session artifacts are intentionally outside ADR-031's scope — they are working-memory externalization, not provenance records.

---

**Issue 6: ADR-052 asserts inline smell detection "supports the opportunistic workflow" but the claim for novel smells is not established by the essay's evidence**

- **Location:** ADR-052 Decision section, "For novel smells" paragraph; ADR-052 Consequences §Positive
- **Claim:** The refactor skill embeds "awareness" of novel AI smells (Constraint Decay, Slopsquatting, Intent Debt) and "raises awareness rather than detecting them automatically" — the skill prompts the developer to check whether earlier constraints still hold, flags unfamiliar packages, and prompts for rationale.
- **Evidence gap:** The essay (§4) is explicit that novel AI smells "have mechanisms that strictly require AI code generation to exist." Constraint Decay manifests as probabilistic de-weighting over conversation length — there is no code-level signature the refactor skill could inspect. Slopsquatting requires checking package names against live registries — the essay describes this as a mechanism operating during generation, not a smell visible in already-generated code. Intent Debt is "code that works" where "no human holds the 'why'" — by definition, the code does not signal its own opacity. The ADR's "awareness" prompts (check constraints, flag unfamiliar packages, prompt for rationale) are reasonable practices, but they are context-management reminders, not smell detection embedded in the refactor diagnostic step. Embedding them in the refactor skill's level 1 (Smells) implies they are diagnosable from code inspection. They are not. This misclassification may cause developers to believe they have diagnosed novel AI smells when they have merely been reminded to check for them — a meaningful difference when the skill's output informs decisions about code quality.
- **Recommendation:** Restructure the novel smells section. Remove novel smells from the level 1 (Smells) diagnostic step and instead position them as a separate "AI hygiene prompts" category — practices the skill invokes regardless of what smells are found in the code. This is not a demotion; it is a more accurate characterization. The current placement implies detectability the essay does not establish.

---

**Issue 7: ADR-051 introduces dependency classification from the roadmap without acknowledging that the classification scheme was designed for architectural dependencies, not ticket-level task sequencing**

- **Location:** ADR-051 Decision §2 (Derive work packages), Dependencies subsection
- **Claim:** "Dependencies: classified as hard (structural necessity), implied (logical ordering), or open (genuine choice) — the same scheme as the roadmap's Dependency Classification."
- **Evidence gap:** The domain model defines Dependency Classification as applying to "dependency edges between work packages in the roadmap" where a hard dependency means "Module B literally cannot be built without Module A's interface — structural necessity." This is an architectural dependency scheme. In context-reconstructive mode, work packages are derived from a ticket plus codebase exploration, not from system design and ADR analysis. The ticket-level tasks ("add validation to the login form," "update the error message") are not the same kind of artifact as roadmap work packages ("implement the auth module," "build the session layer"). Applying the same classification vocabulary to ticket decomposition may create false confidence that the classification carries the same weight and precision as a roadmap-derived classification. ADR-051 acknowledges "the decomposition is approximate, not authoritative" but does not acknowledge that the dependency classification itself may be imprecise in a qualitatively different way at the ticket level.
- **Recommendation:** Add a note that the dependency classification at the ticket level is heuristic rather than architecturally grounded: "At the ticket level, hard/implied/open dependency classification is approximate — structural necessity is harder to identify without a full architectural model. Treat the classification as a starting decomposition, not an architectural fact." This preserves the value of a shared vocabulary while preventing overconfidence in the classification's precision.

---

**Issue 8: The essay's claim that the review skill "already demonstrates the pattern" (ADR-048 Context) is used to justify composition, but the review skill does not demonstrate composition — it demonstrates standalone utility**

- **Location:** ADR-048 Context §3 (second paragraph); ADR-048 Decision section
- **Claim:** "The review skill (`/rdd-review`, ADR-043 through ADR-047) already demonstrates the pattern: a standalone skill with two operating modes (corpus-grounded and context-reconstructive) that can also be invoked during build stewardship."
- **Evidence gap:** The review skill demonstrates the two-mode pattern and demonstrates standalone use. What ADR-043 and ADR-046 explicitly do *not* demonstrate is composition in the sense ADR-054 defines — triggered invocation with context inheritance and return-to-loop semantics. ADR-046 describes integration as a callout in the build skill: the user sees a suggestion and chooses to invoke the review skill. That is not the same architectural relationship as ADR-054's Build→Review composition model, where the build skill detects a stewardship trigger and suggests invocation with context inheritance. The essay's statement that "the review skill already demonstrates the pattern" is accurate for the two-mode pattern and standalone utility, but is being used to justify a composition model the review skill does not currently implement. The evidence supports the modes; it does not support the composition trigger semantics.
- **Recommendation:** Limit the claim to what the review skill actually demonstrates: "The review skill demonstrates the two-mode pattern (corpus-grounded and context-reconstructive) and standalone utility. The composition trigger semantics are new — they extend the review skill's integration beyond ADR-046's callout model." This is honest about what is established versus what is new, and it prevents a reader from assuming the composition model is already validated.

---

### P3 — Consider

---

**Issue 9: The five Orientation Questions are compressed differently in ADR-049 and ADR-051 than in the essay, with a gap in question 5**

- **Location:** ADR-049 step 4; ADR-051 §2 (Testable behaviors); Essay §2 (five questions)
- **Claim:** ADR-049's step 4 adapts the five questions per skill. ADR-051 specifies "testable behaviors: what can be verified (Given/When/Then sketches)" as part of work package derivation.
- **Evidence gap / terminology note:** Essay question 5 is "How do we demo what was built?" — which the essay traces to Play's contribution: "the ability to inhabit the system from a stakeholder's perspective." ADR-049 lists the five Orientation Questions in its context section but reduces question 5 to "How do we verify?" in step 5's validation framing. ADR-051 reduces it further to "Given/When/Then sketches." The domain model's Orientation Questions entry lists question 3 as "What's the scope, integration points, and interaction mechanics — and how are they testable?" which already addresses testability. Question 5 ("demo-ability") adds the inhabitation dimension — can the developer walk through what was built as a stakeholder? This dimension disappears in ADR-051's work package format. Not a critical error, but the demo-ability dimension is what connects build orientation to Play's epistemic function, and its absence means the build skill's context-reconstructive mode never sets up the forward path to play.
- **Recommendation:** Consider whether the work package format in ADR-051 should include a "demo scenario" field — how would a stakeholder use this feature? — alongside the Given/When/Then testable behaviors. Even a lightweight demo scenario preserves the inhabitation dimension and creates a natural handoff to Play without requiring the full pipeline.

---

**Issue 10: ADR-053 does not address what happens when a developer consistently selects Focused mode and how this interacts with Invariant 6 (scaffolding must fade)**

- **Location:** ADR-053 Consequences §Negative; domain model Invariant 6
- **Claim:** ADR-053 acknowledges "a developer who consistently chooses 'focused' may never experience the deeper modes — but this is the developer's choice to make."
- **Evidence gap / hidden assumption:** This statement treats the time-budget choice as a preference, but Invariant 6 (scaffolding must fade) implies the opposite trajectory: the skill should offer *less* scaffolding as the developer's expertise grows, encouraging them toward deeper modes rather than deeper reliance on abbreviated sessions. If a developer consistently uses Focused mode, the skill has no mechanism to detect whether this is (a) appropriate for their expertise level, (b) a symptom of time pressure they cannot control, or (c) a deskilling pattern where Focused mode becomes a permanent shortcut. The essay's productive resistance framework (§3) explicitly warns that "production needs reliability" and deliberate practice "requires operating at the edge of failure" — consistent Focused mode may be structurally incompatible with the skill formation goal. Dismissing this with "the developer's choice to make" understates the tension with the methodology's core aim.
- **Recommendation:** Add a note acknowledging the Invariant 6 tension: "Consistent Focused mode may indicate the developer has internalized the practices and needs less scaffolding (appropriate) or that time pressure is structurally preventing epistemic engagement (a system-level concern). The skill has no mechanism to distinguish these. Future cycles may address this through Attend-Interpret-Decide-style engagement detection."

---

**Issue 11: ADR-052's "integration with codebase-audit" section uses imprecise language about which skill drives which**

- **Location:** ADR-052 Decision section, "Integration with codebase-audit" paragraph
- **Claim:** "When a full codebase audit has been performed, its findings can feed the refactor skill as prioritized input. But the refactor skill does not require an audit — its diagnostic step is self-contained. Build stewardship may invoke targeted audit lenses (Structural Health, Dependency & Coupling) at checkpoints, but this is a stewardship decision, not a refactor dependency."
- **Terminology / clarity issue:** The sentence "Build stewardship may invoke targeted audit lenses" mixes two subjects. It is ambiguous whether this means: (a) the build skill itself invokes the codebase-audit skill's specific lenses, (b) the refactor skill invokes them during a stewardship checkpoint, or (c) the developer manually runs parts of the audit. The essay (§7) describes "targeted lens checks during build" as a build skill stewardship checkpoint behavior — the build skill would invoke specific lenses, not the refactor skill. If that is the design intent, the ADR should say so clearly. If the refactor skill is the invoker, the composition boundary described in ADR-054 needs to cover this. As written, the sentence is read either way, and the ambiguity will produce inconsistent implementations.
- **Recommendation:** Clarify the agent of "invoke": "The build skill's stewardship checkpoints may invoke targeted codebase-audit lenses — specifically Structural Health and Dependency & Coupling — as an optional diagnostic supplement to the refactor skill's level 3 (Methodology) check. The refactor skill itself does not invoke the codebase-audit skill."

---

**Issue 12: The essay's "honest bottom line" about novel vs. exacerbated vs. accelerated patterns is not reflected in how ADR-052 frames the taxonomy's practical implications**

- **Location:** Essay §4 final paragraph; ADR-052 Context and Decision sections
- **Claim:** ADR-052 presents the three-tier taxonomy as equally actionable across all three tiers in the refactor skill's diagnostic step.
- **Evidence gap:** The essay is explicit: "only three patterns have mechanisms that strictly require AI code generation to exist. Everything else is 'happens more' or 'happens via a new mechanism in a known category.' That does not make the exacerbated patterns less important... But it means the intervention for most patterns is a more deliberate application of known practices (refactoring, TDD, stewardship, review), not an entirely new kind of practice." ADR-052 correctly separates novel from exacerbated in its treatment, but its Consequences section frames the outcome as "the refactor skill handles the full spectrum of smells in a unified diagnostic step" — which implies a uniformity of treatability the essay explicitly cautions against. The novel smells require awareness, not remediation; the exacerbated smells require familiar techniques applied more deliberately; the accelerated smells require standard linting/review. The "unified diagnostic step" framing obscures these qualitatively different intervention types.
- **Recommendation:** Amend the Consequences framing: instead of "the full spectrum of smells in a unified diagnostic step," say "the full spectrum of smells in a single diagnostic step, with qualitatively different intervention paths: classical techniques for accelerated patterns, deliberate application of classical techniques for exacerbated patterns, and awareness prompts (not automated detection) for novel patterns."

---

## Summary Table

| # | ADR | Issue Type | Priority |
|---|-----|------------|----------|
| 1 | ADR-054 vs ADR-043/ADR-046 | Internal contradiction — composition model vs. utility model | P1 |
| 2 | ADR-053 | Overreaching claim — "understanding quality" not established for Focused mode | P1 |
| 3 | ADR-048 | Scope accuracy — Everyday Developer need asserted, not evidenced from audited artifacts | P2 |
| 4 | ADR-049 | Hidden assumption — review skill is a reference for step 4, but forward/backward asymmetry means it isn't | P2 |
| 5 | ADR-050 | Terminological inconsistency — ADR-031 invoked but session artifacts invert its intent | P2 |
| 6 | ADR-052 | Logical gap — novel smells claimed as diagnosable from code inspection; essay establishes they are not | P2 |
| 7 | ADR-051 | Scope accuracy — roadmap dependency classification applied at ticket level without acknowledging precision difference | P2 |
| 8 | ADR-048 | Overreaching claim — review skill claimed to "demonstrate the pattern" of composition; it demonstrates modes and standalone only | P2 |
| 9 | ADR-049/ADR-051 | Terminology — Orientation Question 5 (demo-ability) dropped in work package format | P3 |
| 10 | ADR-053 | Hidden assumption — consistent Focused mode not examined against Invariant 6 (fading) | P3 |
| 11 | ADR-052 | Terminology — ambiguous agent in "Build stewardship may invoke targeted audit lenses" | P3 |
| 12 | ADR-052 | Scope accuracy — "unified diagnostic step" framing implies uniform treatability the essay explicitly denies | P3 |
