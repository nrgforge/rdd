# Argument Audit Report

**Audited document:** docs/decisions/adr-091-dual-mode-build.md
**Source material:** docs/decisions/adr-064-compound-check-hooks.md, docs/decisions/adr-066-user-tooling-layer.md, docs/decisions/adr-067-three-tier-enforcement-classification.md, docs/decisions/adr-072-cycle-shape-declaration.md, docs/decisions/adr-077-applicability-check-at-build-pattern-reuse.md, docs/decisions/adr-079-non-interrupting-stop-predicate.md, docs/decisions/adr-088-adr-064-advisory-demotion.md, docs/decisions/adr-090-in-progress-phase-role-shift.md, skills/build/SKILL.md, .rdd/audits/susceptibility-snapshot-017-build.md, .rdd/cycle-status.md
**Date:** 2026-04-28

---

## Section 1: Argument Audit

### Summary

- **Argument chains mapped:** 7
- **Issues found:** 6 (0 P1, 4 P2, 2 P3)

The seven inferential chains are:

1. Auto-mode BUILD is observable in practice → the methodology should recognize it (Gap-closure argument)
2. Prior phases do heavy lifting → BUILD gates serve a smaller residual function → residual can be zero in certain cycles (Load-distribution argument)
3. The catching-vs-teaching distinction → auto mode cannot serve teaching → gated mode required when teaching is primary (Axis 4 argument)
4. Agent cannot reliably evaluate availability / stakes / pedagogy → practitioner declaration is structurally honest (Invariant 8 argument against automatic mode selection)
5. A spectrum cannot drive skill behavior → binary is the right shape (Implementability argument for binary over spectrum)
6. Mid-phase shift mechanic provides pragmatic selective gating → third mode is unnecessary (v1 adequacy argument)
7. In-cycle scope fits within the Build Design Amendment pattern → deferral is unjustified (Timing argument)

All seven chains are structurally sound. The issues are in where claims modestly outrun their premises, hidden dependencies on sister ADRs, and underspecified handoffs.

---

### P1 — Must Fix

No P1 issues found.

---

### P2 — Should Fix

**Issue P2.1**

- **Location:** §4 (Mode declaration), final sentence — "Absence defaults to `gated`"
- **Claim:** "The methodology's default is the safer pattern; auto mode is opted-in, not opted-out-of."
- **Evidence gap:** The ADR asserts that gated is safer without grounding this in the Axis 3 or Axis 4 framework it just introduced. The four axes are cast as judgment-applied — a cycle with low stakes, fully-settled decisions, and a practitioner who wants a start-and-end engagement profile is not a cycle where gated mode is "safer" in any actionable sense. The safety claim is a global generalization from a subset of the axis space (generative work, high stakes, practitioner present). The default is defensible on conservatism grounds (it is the existing canonical pattern), but the ADR argues for it on safety grounds without confining that claim to the cases where gated is genuinely safer.
- **Recommendation:** Recast the default rationale as conservatism / existing-canonical-pattern, not as the generically safer choice. Add a one-sentence qualifier: "Gated mode is the safer default when cycle character is unknown or when the practitioner has not yet evaluated the axes; it is not necessarily safer for all cycles." This prevents the safety framing from inadvertently discouraging legitimate auto-mode use.

**Issue P2.2**

- **Location:** §5 (Scope-of-claim, Does not provide), bullet 2 — "A mechanical decision rule. The four axes are judgment-applied."
- **Claim:** The ADR provides no mechanical decision rule; the practitioner answers the mode question.
- **Evidence gap:** The ADR does not specify *when* the practitioner is asked to declare the mode. The skill text (SKILL.md, the BUILD Mode Selection subsection already implemented) reads the field at phase entry — but the ADR says nothing about whether the mode declaration is expected at BUILD entry, before the cycle begins, or at DECIDE. The Provenance section says the declaration mechanic is "modeled on ADR-072 / ADR-078 / ADR-079 / ADR-090's existing per-entry field pattern," but those ADRs specify lifecycle (when the field is set and cleared, who sets it, what the default absent-state means for the hook). ADR-091's §4 describes the mechanic but not the lifecycle responsibility — who sets the field, whether the orchestrator prompts for it, and what happens when the practitioner forgets.
- **Recommendation:** Add a brief lifecycle note to §4: at BUILD entry the orchestrator (or skill) checks for the field and prompts the practitioner to declare if absent. Alternatively, cross-reference the Skill-text amendment explicitly and note that the skill's Mode Selection subsection is the lifecycle specification. The absence leaves an implementer gap: a practitioner reading only the ADR does not know whether mode selection is a pre-BUILD DECIDE commitment or a BUILD-entry prompt.

**Issue P2.3**

- **Location:** §3, Axis 4 (Stewardship locality — catching vs. teaching)
- **Claim:** "When teaching is the primary need (e.g., the practitioner is new to the codebase, or wants to understand a particular subsystem deeply), gated mode is the right call regardless of the other axes."
- **Evidence gap:** The "regardless of the other axes" claim makes Axis 4 a lexically dominant factor whenever teaching is primary — effectively overriding Axes 1–3. This is a qualitative claim about the relative weight of the four axes that is asserted but not argued. The susceptibility snapshot (Signal E) actually raises the reverse concern: whether auto-mode BUILD should include a mid-phase user touchpoint, not whether gated mode should dominate whenever teaching is the primary need. The snapshot does not establish that teaching requires full gated mode rather than a lighter touchpoint within an otherwise auto-mode build. A practitioner running a mechanical cycle who wants to understand WP-D specifically is not well-served by gating every scenario group; they may want targeted engagement at one boundary, not distributed engagement at all of them.
- **Recommendation:** Soften "regardless of the other axes" to "weighed heavily against the other axes." The ADR already provides the mid-phase shift mechanic as the pragmatic answer when a practitioner wants gated engagement at specific points within an auto-mode cycle. The teaching axis should point toward that mechanic rather than implying gated mode is binary mandatory when teaching matters at all.

**Issue P2.4**

- **Location:** §2, Auto mode "When to use" — "well-tested mechanical changes, low-reversibility cost"
- **Claim:** Auto mode is appropriate when the "cycle's stakes are bounded" including "low-reversibility cost."
- **Evidence gap:** The term "low-reversibility cost" appears in the "When to use" for auto mode but Axis 3's table uses "low-reversibility cost" as a signal for *auto* mode — consistent — while the prose in §2 says "low-reversibility cost" in a parenthetical list that includes "methodology-internal work, well-tested mechanical changes." Cycle 017 was methodology-internal work, and the susceptibility snapshot named design-alternative examination and scoping-judgment surfacing as real costs that auto mode did not catch. The "low-reversibility cost" label is doing subtle work: it frames the auto-mode cost as a *reversibility* question when the snapshot evidence shows the cost is an *epistemic* one (alternatives not examined, scoping compressions). A future cycle can revert a partition design in code; it cannot retroactively examine the alternative that was never surfaced. The framing risks leading practitioners to assess auto-mode appropriateness along the wrong dimension (can I undo this?) rather than the more diagnostic one (would I want design alternatives examined here?).
- **Recommendation:** Add or substitute "low-epistemic-cost-if-unexamined" or an equivalent signal that names the design-alternative-examination axis directly. Alternatively, add a parenthetical that surfaces this: "low-reversibility cost (note: reversibility addresses code correctness, not the design-alternative-examination gap — assess the generative work character on Axis 1 for that dimension)."

---

### P3 — Consider

**Issue P3.1**

- **Location:** Rejected alternatives — "Define a continuous spectrum rather than a binary"
- **Claim:** "A binary decision is structurally implementable (the skill reads `**BUILD mode:**` and adapts) while a spectrum is not (the skill cannot adapt to '67% auto-mode')."
- **Evidence gap:** The implementability argument is sound but incomplete. The ADR does not engage with a middle alternative the source material suggests: a *parameterized* binary (e.g., `auto` with optional explicit gates at named WPs, similar to how ADR-072's `**Skipped phases:**` is a list, not a binary). The mid-phase shift mechanic exists as a post-hoc workaround for this gap, but the rejected alternatives section dismisses the spectrum framing on implementability grounds without noting that parameterized binary forms exist and were considered. The five-entry rejected alternatives section is thorough on framings it considered, but this specific gap between "pure binary" and "pure spectrum" is not addressed.
- **Recommendation:** Add a sentence noting that parameterized forms (e.g., auto mode with named gate-insertion points) were considered at v1 and deferred on simplicity grounds. The mid-phase shift mechanic is the current pragmatic answer. This closes the framing gap without requiring a new alternative entry.

**Issue P3.2**

- **Location:** §5 (Scope-of-claim), Provides bullet — "Skill-text adaptation so the agent's behavior matches the declared mode"
- **Claim:** The amendment includes skill-text adaptation.
- **Evidence gap:** The Skill-text and cycle-status amendments section (§6) lists three artifacts: `skills/build/SKILL.md`, `skills/rdd/SKILL.md`, and a fixture test. The SKILL.md amendment is confirmed by the actual skill text (the BUILD Mode Selection subsection at the top of PROCESS is present and detailed). However, the scope-of-claim bullet says the adaptation makes "the agent's behavior match the declared mode" — the SKILL.md subsection instructs the agent to read the field and adapt, but the ADR does not note that this remains a skill-text-layer instruction (Tier 2 conversational, per ADR-067's substrate taxonomy), not a harness-layer enforcement. A practitioner reading the scope-of-claim as structural enforcement would be misled. This is a soft precision issue: the instruction exists, but the channel is advisory skill text, not a hook predicate.
- **Recommendation:** Add a parenthetical in the scope-of-claim Provides bullet: "Skill-text adaptation so the agent's behavior matches the declared mode (Skill-Structure Layer instruction; not harness-enforced — the mode field is read by the skill at phase entry, not by a hook predicate)."

---

## Section 2: Framing Audit

The framing audit makes the negative space of content selection visible. The source material supported framings ADR-091 did not adopt; this section names them.

---

### Question 1: What alternative framings did the evidence support?

#### Alternative Framing A: "Auto mode as a disclosure requirement rather than a recognized pattern"

The susceptibility snapshot (Signal E) frames the auto-mode BUILD observation as a feed-forward *to the methodology itself* — something worth examining in a future DECIDE phase. The snapshot does not recommend legitimizing auto mode; it names the structural signal and asks whether auto-mode BUILD should include a mid-phase user touchpoint. The ADR interprets the same evidence as motivation for legitimization, but the source material equally supports a framing in which auto mode remains practitioner practice, the methodology adds a *disclosure requirement* (at cycle close, if you ran auto-mode, you acknowledge the two failure modes), and recognition is deferred until there is more than one observed instance.

**Evidence in source material:** Susceptibility snapshot Signal E: "Whether auto-mode BUILD should include a structured mid-phase user touchpoint — not at every WP boundary, but at the scenario-group boundary the roadmap defines — is a methodology question worth examining in a future DECIDE phase." The snapshot recommends a *future DECIDE* examination, not an in-cycle landing.

**Central argument under this framing:** Cycle 017 showed that auto-mode BUILD happens; it also showed that it misses design-alternative examination and scoping-judgment surfacing. The response to this evidence is to name the failure modes and require disclosure — not to legitimize the pattern and let practitioners choose it without the methodology's own tooling providing any compensating check.

**Belief-mapping:** A reader would need to believe that (a) single-instance evidence from one cycle is sufficient to recognize a pattern as methodology-legitimate, and (b) legitimizing the pattern without adding any compensating mechanism is preferable to deferring until more evidence or a compensating mechanism is available. Both are contestable.

---

#### Alternative Framing B: "The binary is the wrong shape — the missing dimension is *gate density*, not mode"

ADR-072 (cycle shape declaration) and ADR-079 (in-progress gate predicate) established per-entry fields that parameterize hook behavior at fine granularity. ADR-077 (applicability check) established a triggered mechanism that fires at specific moments rather than at every scenario boundary. The source material's dominant pattern for adapting mechanism intensity is *selective triggering*, not *binary mode switching*. Under this framing, the right response to Cycle 017's BUILD pattern is a `**EPISTEMIC GATE density:**` field (e.g., `every-WP`, `boundary-only`, `end-only`) rather than a mode binary. The binary trades expressiveness for implementability, but the source material shows the corpus already tolerates parameterized fields (skipped phases is a list; in-progress gate names a specific boundary).

**Evidence in source material:** ADR-072's `**Skipped phases:**` field is a comma-separated list, not a binary skip/run. ADR-079's `**In-progress gate:**` names a specific phase boundary. ADR-077's applicability check fires at a trigger condition rather than on every scan. All three suggest the corpus's existing pattern is *parameterized specificity*, not binary switches.

**Central argument under this framing:** The binary is simpler to implement but forces practitioners to choose between two extremes when most real cycles want something in between. A gate-density field expresses "I want a gate at the WP-D boundary but nowhere else" without requiring a mid-phase field edit. The mid-phase shift mechanic the ADR introduces is a workaround for this expressiveness gap — a workaround the ADR's own scope-of-claim bullet names as an operational complexity.

**Belief-mapping:** A reader would need to believe that parameterized gate density is worth the additional field complexity and that the existing mid-phase shift mechanic is insufficient for the expressiveness need. The ADR explicitly rejected the spectrum framing on implementability grounds, but it did not engage with the parameterized binary.

---

#### Alternative Framing C: "Mode selection as a post-BUILD reflection rather than a pre-BUILD declaration"

The susceptibility snapshot's Signal E is a feed-forward *to the methodology*. One interpretation is that the right structure is retrospective: after BUILD completes, practitioners characterize the mode they ran (as part of the susceptibility snapshot or cycle retrospective) rather than declaring it before the mode is chosen. Under this framing, the `**BUILD mode:**` field would be a *retrospective label*, not a pre-BUILD declaration. The skill would behave in default gated mode; practitioners who ran auto mode would annotate the record rather than configure the skill.

**Evidence in source material:** The provenance section acknowledges that the mode-declaration mechanic and default-gated choice are "agent composition" — not driver-derived. The practitioner's commitment was "adding that framing would be useful context for the agent and user in the future," which is consistent with retrospective annotation as much as prospective declaration. The susceptibility snapshot did not recommend a pre-BUILD field; it recommended a methodology question examination.

**Central argument under this framing:** Retrospective labeling captures the same information without requiring practitioners to predict their engagement pattern before BUILD begins. Many practitioners do not know whether they will run auto or gated mode until they see what the work demands. The mid-phase shift mechanic acknowledges this reality; the retrospective framing takes it seriously.

**Belief-mapping:** A reader would need to believe that retrospective annotation produces sufficient signal for the skill to adapt *prospectively* in future cycles and that the skill's behavior adaptation is not necessary in the current cycle. The ADR's most concrete value proposition is that the skill reads the field and adapts behavior — that only works prospectively, not retrospectively. So this alternative framing requires giving up the skill-behavior adaptation or deferring it.

---

### Question 2: What truths were available but not featured?

**Available truth T1: The susceptibility snapshot recommended a future DECIDE phase examination, not an in-cycle landing.**

The snapshot's Signal E is unambiguous: "Whether auto-mode BUILD should include a structured mid-phase user touchpoint... is a methodology question worth examining in a future DECIDE phase." The ADR's rejected alternative "Defer the ADR to a future cycle" gives a different reason for the deferral question (the practitioner committed at the BUILD-exit gate), but does not engage with the snapshot's specific recommendation about *what the future examination should address* (a mid-phase touchpoint, not a full mode legitimization). Signal E is present in the source material and consistent with the gate commitment, but its specific recommendation about what future-DECIDE work should examine is not referenced.

**Why it may have been excluded:** The practitioner's gate commitment ("adding that framing would be useful context") provides direct authorization for the ADR's existence. The snapshot's more cautious framing competes with that authorization. Including it would complicate the "why now" argument.

**Would its inclusion change the argument?** It would require the ADR to engage with whether legitimizing the mode *without adding a compensating mid-phase mechanism* is what the snapshot recommended — or whether the snapshot's recommendation was actually for a more limited scope (examine whether to add a touchpoint, not whether to recognize the full binary).

---

**Available truth T2: The Cycle 017 snapshot named a narrow circularity risk in WP-D — agent authored the ADR constraint and then used that language to justify the implementation.**

The snapshot's Per-Signal Evaluation §2 (WP-D) names this: "ADR-090 was authored at DECIDE by the agent itself. There is a narrow circularity risk: the agent authored the constraint language at DECIDE and then used that language to justify the implementation design at BUILD without examining whether the constraint was the most parsimonious formulation." ADR-091 is itself authored by the agent at BUILD entry in response to the agent's own gate exchange. The same circularity risk applies structurally: the agent names the problem (auto mode is unrecognized), proposes the solution (recognize it with axes), and the practitioner endorses the agent's framing. The snapshot's named pattern is directly analogous and is available in the source material.

**Why it may have been excluded:** The circularity risk is named for WP-D specifically, not for the methodology amendment. The ADR's provenance section is thorough about distinguishing user-derived from agent-composed content and explicitly labels which axes are agent composition. But it does not apply the WP-D circularity framing to its own situation.

**Would its inclusion change the argument?** Naming it would require either a grounding check (external validation of the four axes as the right frame) or an acknowledgment that the methodology amendment is subject to the same design-alternative-examination gap that it diagnoses in auto-mode BUILD.

---

**Available truth T3: ADR-072 and ADR-079 established that per-entry fields with explicit lifecycle specifications and failure-mode analysis are the corpus's standard for behavioral fields.**

Both ADR-072 (`**Skipped phases:**`, `**Paused:**`) and ADR-079 (`**In-progress gate:**`) include: (a) precise lifecycle specification (who sets the field, when it is cleared, what failure modes exist if the field is not cleared), (b) safe vs. unsafe failure mode analysis, and (c) a conformance audit posture. ADR-091's §4 specifies the mechanic but does not include lifecycle failure-mode analysis — what happens if the field is set incorrectly (e.g., `**BUILD mode:** auto` on a cycle that is generative), and what the conformance audit posture is.

**Why it may have been excluded:** The mode declaration is informational (the ADR's neutral bullet: "The declaration is informational, not enforced"), so failure-mode analysis for a hook predicate does not apply. But the omission of a conformance posture (does `/rdd-conform` check the field? emits a soft note?) is a gap the peer ADRs all fill.

**Would its inclusion change the argument?** Including a brief conformance posture and a "incorrect mode declaration" failure-mode note would complete the field specification to match the corpus's existing pattern. It would not change the core decision, but would reduce the implementation gap identified in P2.2 above.

---

### Question 3: What would change if the dominant framing were inverted?

The ADR's dominant framing is: **gated mode is the existing canonical pattern; auto mode is a legitimate deviation that the methodology should recognize by naming it alongside gated mode.**

The inverted framing: **auto mode is the natural execution pattern for a mature cycle with well-audited ADRs; gated mode is the pedagogical intervention that the methodology adds on top for cycles that need it.**

Under the inverted framing:

**Claims that become weaker:**
- "The methodology's default is the safer pattern" loses its ground: if auto mode is the natural pattern for well-prepared cycles, defaulting to gated is not "safer" — it is an added overhead requiring justification. The default rationale shifts from conservatism to an explicit acknowledgment that gated mode is the higher-cost intervention.
- "Auto mode is opted-in, not opted-out-of" becomes "gated mode is opted-in for cycles that need teaching or have generative risk." The opt-in direction reverses.
- The axis weighting in the rejected alternatives ("Promote auto mode to canonical; treat gated mode as a heavyweight option. Rejected. The two failure modes auto mode does not catch are real and consequential.") becomes less decisive: the inverted framing would agree that gated mode catches more, but frame gated mode as the opt-in overhead rather than the default floor.

**Claims that become stronger:**
- The two named failure modes (design-alternative examination; scoping-judgment surfacing) would be *more visible* under the inverted framing, because auto mode would be the default and its failure modes would need to be prominently disclosed as what practitioners opt into when they don't choose gated.
- The pedagogical function of gated mode (teaching, not just catching) would be more precisely scoped: gated mode is not the safe default but the deliberate investment in practitioner development. This would make Axis 4 more central rather than a fourth factor alongside Axes 1–3.
- The mid-phase shift mechanic becomes the primary mechanism in either direction: a practitioner starting in auto mode and shifting to gated at a generative WP is doing exactly what the inverted framing would predict as the default flow.

**What the ADR would need to address under the inverted framing:**
- A default-auto posture would require a stronger compensating mechanism for the design-alternative-examination gap — the susceptibility snapshot's Signal E points toward a structured mid-phase touchpoint that the current ADR does not require.
- The "well-audited ADRs doing the heavy lifting" argument (Context §3) actually supports the inverted framing more naturally: if the prior phases do the heavy lifting, auto mode is the expected execution form for a well-prepared cycle, not a deviation.
- The framing audit's Alternative Framing A (disclosure requirement) would fit naturally into the inverted framing: auto mode requires a cycle-close disclosure of which design alternatives were not examined, formalizing the failure mode acknowledgment.

The inverted framing is not obviously wrong given the source material. The ADR's choice of gated-as-default is defensible (conservatism, existing pattern, the two failure modes are real), but the inverted framing would better match the "prior phases do the heavy lifting" argument in the ADR's own Context section, which reads more naturally as motivation for auto mode being the expected case than as motivation for it being the opt-in deviation.

---

### Framing Issues

**FF-P2.1 (Should Fix)**

- **Location:** §2, Auto mode "When to use" and the broader legitimization frame
- **Claim:** The ADR legitimizes auto mode as a recognized methodology pattern on the basis of a single observed cycle (Cycle 017) with agent-composed axes.
- **Framing gap:** The available truth T1 establishes that the susceptibility snapshot recommended a *future DECIDE examination* of whether auto-mode BUILD should include a mid-phase touchpoint — not an in-cycle legitimization without a compensating mechanism. The ADR's framing elides the distinction between "recognize the pattern exists" (minimal legitimization) and "recognize the pattern as equally valid alongside gated mode without adding any compensating check" (full legitimization). The scope-of-claim section honestly names the two failure modes as real costs, but the mode-selection axes and the "legitimate pattern" language frame auto mode as an established methodology peer of gated mode on the basis of one cycle's data.
- **Recommendation:** Add a qualification in the Context section acknowledging that the legitimization is based on single-cycle evidence and agent-composed axes, and that the four axes are provisional characterizations rather than empirically validated criteria. This is consistent with the ADR's honest scope-of-claim posture and with the provenance section's acknowledgment that three of four axes are agent composition.

**FF-P2.2 (Should Fix)**

- **Location:** Rejected alternatives — "Define a continuous spectrum rather than a binary"
- **Claim:** The binary is chosen over the spectrum on implementability grounds.
- **Framing gap:** The source material's dominant pattern for adapting mechanism intensity is parameterized fields (ADR-072's list of skipped phases; ADR-079's named phase boundary), not binary mode switches. The rejected alternatives section dismisses the spectrum on implementability grounds but does not engage with parameterized binary forms that already exist in the corpus. The framing implicitly presents the choice as binary vs. continuous spectrum, skipping the intermediate form that the corpus already uses.
- **Recommendation:** Add a sentence acknowledging that parameterized forms (e.g., named gate-insertion points within an auto-mode cycle) are a known intermediate and were deferred to v1 simplicity. The mid-phase shift mechanic is the current answer; a future cycle could revisit if the binary proves too coarse. This is consistent with the last sentence of the rejected alternative entry, which already says "future cycles that observe the binary as too coarse can revisit."

**FF-P3.1 (Consider)**

- **Location:** Context, final paragraph — "The decide → architect → build pipeline already does most of the heavy lifting"
- **Framing:** The "heavy lifting" framing is used to justify why auto mode is appropriate for well-prepared cycles, but it actually supports the inverted framing more naturally (auto mode as default, gated as intervention). The ADR uses this framing to argue that auto mode is sometimes acceptable without noting that the same framing implies gated mode is adding overhead on top of already-sufficient upstream work — which is a stronger claim than the ADR makes.
- **Recommendation:** If the intent is that gated mode is the safe default for conservatism reasons, say so more directly rather than relying on the "heavy lifting" framing, which points the other direction. Or, acknowledge in the Rejected Alternatives section that the "heavy lifting" argument supports the inverted default direction and explain why conservatism nonetheless wins.
