# Argument Audit Report — Re-audit Pass 4

**Audit type:** Re-audit pass 4 — gate-driven §3 reframe verification
**Audited document:** `/Users/nathangreen/Development/rdd/docs/decisions/adr-087-validation-spikes-in-research.md`
**Source material read:**
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-077-applicability-check-at-build-pattern-reuse.md`
- `/Users/nathangreen/Development/rdd/docs/domain-model.md` (Amendment 21 entry, Amendment 22 entry)
- `/Users/nathangreen/Development/rdd/docs/housekeeping/audits/argument-audit-decide-017-r3.md` (pass 3 verdict and framing issues)
- `/Users/nathangreen/Development/rdd/docs/housekeeping/audits/argument-audit-decide-017.md` (pass 1 framing issues F-P2.1, F-P2.2, F-P3.1)
**Date:** 2026-04-27

---

## VERDICT: CLEAN AUDIT

No new issues at P1 or P2. The §3 reframe, §3a positioning, title amendment, and Provenance check compose coherently, are internally consistent with §1 and §2, and carry no new logical gaps or overreach. One P3 observation on a stale internal reference within Rejected alternatives is noted below — it does not require resolution before downstream phases proceed. All three framing issues from pass 1 (F-P2.1, F-P2.2, F-P3.1) are confirmed present and unmodified by the §3 reframe.

---

## Section 1: Argument Audit (Pass 4)

### Summary

- **Argument chains re-verified:** 6 delta chains (§3 composition with §1 / §2; §3a anti-elaboration table; MODEL Amendment 21 connection; Provenance attribution; Rejected alternatives coherence; title-slug navigability)
- **New issues found at P1:** 0
- **New issues found at P2:** 0
- **New issues found at P3:** 1 (stale trigger-criteria reference in Rejected alternatives)

---

### P1 — Must Fix

None.

---

### P2 — Should Fix

None.

---

### P3 — Consider

**Issue R4-P3.1 — Rejected alternatives: two entries still reference the original three-criterion trigger the §3 reframe replaced**

- **Location:** ADR-087, Rejected alternatives, entries 4 and 5 ("Mandate validation spikes only for claims that contradict prior cycles" and "Encode validation spikes as Tier 1 unconditional with the trigger condition as the structural anchor")
- **Claim:** Both entries explicitly name the original trigger in their rejection rationales. Entry 4 says the contradiction-only trigger "is more mechanical than the optional-step trigger (load-bearing × literature-not-direct × evidence-anecdotal)." Entry 5 says the trigger is rejected because "load-bearing for downstream commitments" and "the literature does not directly establish the claim" are judgment moves — citing the old three-criterion form directly.
- **Evidence gap:** §3's revised encoding replaces the three-criterion structural-research-weakness trigger with the reframed question trigger ("Is the cycle at risk of producing speculative claims that downstream phases will over-elaborate? Or: would interaction-grounding surface real additional questions or directions that lit-review and methods alone cannot reach?"). The Provenance check explicitly states: "The reframed trigger replaces [the original three-criterion trigger] with a question matching the user's articulation." However, Rejected alternatives 4 and 5 still argue against alternatives by comparing them to the old trigger, not the new one. Entry 4 says the contradiction-only trigger is less good than "load-bearing × literature-not-direct × evidence-anecdotal" — which is no longer the active trigger. Entry 5's rejection rationale specifically names the two judgment dimensions of the old trigger ("load-bearing for downstream commitments" and "the literature does not directly establish the claim") as the reason Tier 1 encoding would be ceremonial — but the new trigger's judgment dimensions are different (possibility-space explosion risk; interaction-grounding payoff), and the same Tier-1-is-ceremonial argument applies on different grounds.
- **Severity assessment:** This is a navigational consistency issue, not a logical error. The rejection arguments still hold at the level of direction — neither alternative is more coherent than the new trigger on the anti-elaboration framing either. The Provenance check correctly describes the trigger replacement. But a reader who reads Rejected alternatives before §3 will encounter descriptions of a trigger that §3 does not use, and a reader who reads in order will notice the mismatch when they reach entries 4 and 5. P3 because the direction of rejection remains sound and the Provenance check names the substitution explicitly; the alternative entries do not need to be re-argued, only updated to reference the current trigger.
- **Recommendation:** Update Rejected alternatives entries 4 and 5 to reference the reframed trigger ("possibility-space-explosion risk / interaction-grounding payoff") rather than the retired three-criterion form. Entry 4: replace "(load-bearing × literature-not-direct × evidence-anecdotal)" with the reframed trigger's terms and confirm the rejection argument still holds (it does — the contradiction-only trigger still does not capture cycles where the claim is not contradictory but would benefit from interaction-grounding). Entry 5: update the two named judgment dimensions to the reframed trigger's dimensions; the Tier-1-is-ceremonial argument transfers cleanly.

---

### Delta Verification

#### 1. §3 reframe composition with §1 and §2

**Does §3's new framing contradict §1?**

§1 (Grounding Reframe of the Beck port) establishes that the Beck framing is calibrated as useful-but-not-verified. It names three specific items that separate the conceptual port from a verified payoff claim, and closes with: "The Beck port is a useful conceptual frame for the methodology's investment posture but is not load-bearing structural evidence."

§3 now opens with a positioning paragraph that explicitly addresses the composition question: "The framing is not 'validation spike as remediation for a Beck-port deficit' (which was the original entry framing the gate sharpened away from). The framing is 'tightly-scoped prototyping is one of several research methods, used where appropriate.'" It adds: "The Beck-port reframe in §1 still stands as the cycle's calibration on the methodology's investment posture; this section names how the methodology's research-method toolkit expands in response, not as a patch to a deficit."

This explicit sentence does the compositional work. §1 is a calibration of an existing frame; §3 is an expansion of the methodology's toolkit. The two are related but distinct: §1's Beck-port calibration answers "how should we hold this framing?" and §3's research-method positioning answers "how does the toolkit respond to what the calibration reveals?" No contradiction.

**Does §3's new framing contradict §2?**

§2 (validation spikes — what they would test) is unchanged. Its examples and limitations remain anchored to the concrete probe. §3 now positions the broader research-method framing; §2 remains the operational specification of what spikes test. The distinction between §2 (specific claims and their testability) and §3 (how the method category situates in the toolkit) is coherent — §2 is the mechanism's scope-of-application; §3 is its family membership. No contradiction.

**Does the Decision section header ("The methodology adopts validation spikes as an optional step in research phases") now misalign with §3?**

Yes and no. The Decision section preamble still reads "optional step in research phases" in line 19's paragraph, while §3's section title has changed to "Tightly-scoped prototyping as a research method" and the body text positions it as a research-method alongside lit-review. The Decision preamble's "optional step" language is technically not wrong — §3 still characterizes the method as judgment-applied and not unconditional — but the mismatch between the preamble and §3's framing is minor. The preamble is abstract and §3 operationalizes it with the reframed positioning. This falls below P3 threshold: the preamble is a one-sentence orienting statement, not the operative text. Noted for completeness.

#### 2. §3a anti-elaboration positioning — ADR-077 claim verification

The §3a table places ADR-077 Applicability Check in the "BUILD" row with anti-elaboration role: "Test pattern reuse against the new context's specific constraints."

Reading ADR-077 directly: ADR-077's Context section characterizes the Einstellung effect as the failure mode — "once a familiar pattern activates, it does not merely compete with alternatives — it actively inhibits attention to features that would reveal its inapplicability." Its Decision section is a stewardship-checkpoint prompt that fires when an existing pattern is being applied to a new context. The four prompts force structural mapping between source case and alternative before the reuse proceeds.

The anti-elaboration characterization in §3a is plausible but describes a secondary function of ADR-077, not its primary one. ADR-077's primary role is to counter the Einstellung effect at the pattern-reuse moment — its mechanism is cognitive-diversity intervention (forced structural comparison), not elaboration-pruning. The Einstellung effect and possibility-space explosion are distinct failure modes: Einstellung is attentional suppression around an activated pattern; possibility-space explosion is unconstrained forward elaboration without tangible grounding. ADR-077 guards against the first; it incidentally constrains the second only because forcing structural comparison may reveal that the reused pattern is simpler or more constrained than a generalized version would be.

The table's claim is not false — the applicability check can prevent gold-plating a reused pattern by surfacing that a simpler alternative applies — but it overstates ADR-077's anti-elaboration disposition. ADR-077 is primarily an anti-Einstellung mechanism; YAGNI is explicitly an anti-elaboration mechanism. The table treats all three rows as instances of "same disposition," but ADR-077's dispositional home is "apply the right pattern" rather than "resist speculative generality." The claim is a mild overreach.

**Severity:** P3 rather than P2. The table does not create a contradiction — the three mechanisms do share a "prefer tangible answers over speculation" family resemblance at a sufficient level of abstraction. The issue is the "same disposition" framing is more assertive than the evidence supports for ADR-077's primary purpose. The core value of §3a — naming the family and connecting to the future-cycle question — is unaffected.

This observation is within the same P3 category as R4-P3.1; it does not require resolution before downstream phases proceed. However, it is recorded for the user's awareness: if §3a's table is cited in future work as establishing that ADR-077 and tightly-scoped prototyping share the same dispositional family, the sourced evidence for that claim is weaker for ADR-077 than the table implies.

**Recommendation (P3 — same section as R4-P3.1 but distinct):** Consider adding a parenthetical to the ADR-077 row: "primary role: counter Einstellung-effect attentional suppression at pattern reuse; incidentally anti-elaborative by constraining reused-pattern scope." This preserves the family-resemblance claim at honest precision without revising the table's structure.

#### 3. MODEL Amendment 21 connection and partial-addressability claim

§3a states: "The connection makes a held-open future-cycle candidate (MODEL Amendment 21: 'Does RDD over-engineer? Does RDD's research front-loading produce systems whose elaborated possibility space exceeds what the user actually needs?') partly addressable in-cycle... The future-cycle question is not foreclosed — the broader critique of RDD's structural posture remains worth a dedicated cycle — but the in-cycle mechanism is now named."

The Amendment 21 entry in the domain model (line 859) reads: "Does RDD over-engineer? Does RDD's research front-loading produce systems whose elaborated possibility space exceeds what the user actually needs? Critique of the methodology's structural posture, not of any specific artifact; deserves a dedicated cycle with its own constraint-removal protocol, lit-review, and audit cycle."

The partial-addressability claim is accurate and appropriately scoped. The Amendment 21 question concerns RDD's structural posture as a whole — the cumulative elaboration tendency across the full cycle sequence. ADR-087 §3's mechanism addresses elaboration at the RESEARCH phase's output — specifically the risk that speculative claims from RESEARCH phase propagate downstream without tangible grounding. This is a genuine in-cycle contribution to the concern without claiming to resolve it. The distinction between "partly addressable in-cycle" (the mechanism exists at RESEARCH) and "not foreclosed" (the structural posture question requires a dedicated cycle) is maintained throughout the paragraph. No overreach detected.

The Provenance check correctly labels this connection as "agent composition; gate-articulation-derived" and explicitly states "The future-cycle critique is not foreclosed." The attribution is accurate.

#### 4. Provenance check attribution verification

The Provenance check contains the following attribution structure for the §3 material:

- §3 research-method reframing → labeled "user-articulated at the decide → architect gate (2026-04-28)" with verbatim quote
- Interaction-grounding rationale → labeled "user-articulated at the decide → architect gate (2026-04-28)" with verbatim quote
- Counterforce-against-possibility-space-explosion rationale → labeled "user-articulated at the decide → architect gate (2026-04-28)" with verbatim quote plus field-evidence note
- §3a anti-elaboration positioning → labeled "drafting-time synthesis composed against the user-articulated counterforce rationale. Agent composition; user-articulated rationale-derived."
- MODEL Amendment 21 connection → labeled "drafting-time synthesis surfacing that the gate-articulated rationale partly addresses an open future-cycle question. Agent composition; gate-articulation-derived."
- Reframed trigger → labeled "drafting-time synthesis composed from the user-articulated rationale... Agent composition responding to user-articulated rationale."

The Result paragraph summarizes: "The §3 framing of tightly-scoped prototyping as an additional research method alongside lit-review (rather than as a Beck-port amendment), the interaction-grounding rationale, and the counterforce-against-possibility-space-explosion rationale are user-articulated at the decide → architect gate (2026-04-28)."

Attribution is correctly layered. User-articulated content is labeled user-articulated with gate date. Agent composition synthesized from user rationale is labeled agent composition with rationale source named. The final sentence explicitly states "No synthesis-moment framing adoption detected; the gate articulation is recorded faithfully and labeled as user-derived rather than absorbed silently as agent composition." The attribution structure satisfies the framing-adoption check.

One precision note: the Provenance check attributes the date as "2026-04-28" for the gate articulation, while this re-audit is filed on 2026-04-27. If the gate articulation occurred after the date of this audit's filing, this is forward-referenced. This is a known artifact of the cycle mid-gate state (the user articulated at the gate; the ADR was revised; this audit verifies the revision). No logical issue — the gate date is the date of the user's articulation, not the date of this audit. Noted for completeness only; it is not an attribution error.

#### 5. Rejected alternatives coherence with reframed §3

**Entry 1 ("Promote the Beck port to a methodology premise"):** Remains coherent. §3's reframing does not change the Beck port's evidentiary status. The rejection holds.

**Entry 2 ("Reject the Beck port entirely"):** Remains coherent. §3 does not reject the Beck port. The rejection holds.

**Entry 3 ("Mandate validation spikes for every research-phase claim"):** The rejection rationale references "optional-step encoding with a step-anchored decision moment." §3's reframing preserves the optional / judgment-applied character of the method and the research → discover gate decision moment. The rejection holds. However, the entry's parenthetical characterization "mandating spikes for every claim is judgment-applied (which claims warrant spikes is itself a judgment)" now aligns slightly more cleanly with the reframed trigger than it did with the original — the reframed trigger is even more explicitly felt-judgment-based than the original three-criterion form. No incoherence; if anything, the reframe makes this rejection argument stronger.

**Entry 4 ("Mandate validation spikes only for claims that contradict prior cycles"):** References the retired trigger directly, as identified in R4-P3.1 above.

**Entry 5 ("Encode validation spikes as Tier 1 unconditional"):** References the retired trigger's judgment dimensions directly, as identified in R4-P3.1 above.

**Entry 6 ("Defer the Beck-port reframe"):** Remains coherent. The §3 reframe executes the TARGET 2 discharge. The rejection holds.

#### 6. Title-vs-slug navigability

The title is now "Validation Spikes as Research Method — with Grounding Reframe of the Beck Port." The file slug remains `adr-087-validation-spikes-in-research.md`.

The slug's "validation-spikes-in-research" is directionally accurate for both the old and new title: the ADR concerns the use of validation spikes / prototyping in the research phase. The slug is not a word-for-word title encoding; it is a navigational shorthand. The title's shift from "Optional Research-Phase Step" to "Research Method" is an elevation in positioning, not a topic change — both old and new titles concern the same subject matter. A practitioner searching by slug will find the right ADR; a practitioner reading the title in the index will see the current framing. No navigational confusion is introduced. The title-slug pair is acceptable as-is.

---

## Section 2: Framing Audit (Pass 4 Preservation Verification)

The framing audit's role in pass 4 is to confirm that the three framing issues from pass 1 are present in unchanged form and that the §3 reframe did not silently resolve or aggravate them.

### Framing Issue Preservation Status

**F-P2.1 — ADR-083 §3: Bolt-on / felt-additional signal scope ambiguity (companion file overlap):**

Status: PRESERVED. ADR-087's §3 reframe is isolated to ADR-087. ADR-083 is unchanged in this revision cycle. The bolt-on signal's potential to catch companion files (additive by ADR-084 design) without distinguishing human-reading-path candidates from agent-facing companion files remains present as originally identified. Not affected by ADR-087's §3 reframe.

**F-P2.2 — ADR-086 §Context: Essay's "candidate territory" framing for AI-as-orienter not visible in the ADR:**

Status: PRESERVED. ADR-086 is unchanged. The framing shift from the essay's "candidate territory" posture to the ADR's resolved non-adoption disposition remains present as originally identified.

**F-P3.1 — ADR-084: `<artifact>.agents.md` naming convention novelty relative to cited conventions:**

Status: PRESERVED. ADR-084 is unchanged. The observation that the `.agents.md` convention is an RDD-specific extrapolation from (not an adoption of) the `llms.txt` / `AGENTS.md` ecosystem conventions remains as originally identified.

### Does the §3 Reframe Address or Alter Any of the Three Framing Issues?

All three framing issues belong to ADR-083, ADR-084, and ADR-086 respectively. ADR-087's §3 reframe touches only ADR-087. No framing issue from the pass-1 audit concerns ADR-087's content. The §3 reframe's target — the positioning of tightly-scoped prototyping within the research-method toolkit — is entirely within ADR-087's own argument structure and does not alter the content-selection decisions in the three other ADRs that carry framing observations.

Confirmed: the §3 reframe could not have auto-corrected any of the three framing issues, and it did not. All three remain at the epistemic gate for user judgment as intended.

### Framing Audit: §3 Reframe Content Selection

The reframe presents one alternative framing worth naming for the gate record, since this is the first audit to examine the §3 reframe directly:

**Alternative framing available from the source material:** The user's gate articulation contains a strong "anti-elaboration at source" reading — the field-evidence story (another RDD project that produced a sprawling YAGNI-territory implementation) supports a framing where tightly-scoped prototyping is primarily a constraint mechanism that prevents downstream phases from inheriting speculative scope. The §3 reframe incorporates this but frames prototyping as a research method that adds to the toolkit (additive framing) rather than as a constraint that limits what makes it downstream (preventive framing). Both readings are available from the user's articulation. The ADR chose the additive framing ("additional research method alongside lit-review") over the preventive framing ("anti-elaboration gate before downstream elaboration"). §3a partially recovers the preventive framing by placing prototyping in the anti-elaboration family, but §3's opening adopts the additive positioning as primary.

This is P3: both framings are present (additive in §3; preventive in §3a); the selection does not suppress anything material from the source. The additive framing is truer to the user's first articulation ("an additional research method could be running tightly scoped prototyping where appropriate"); the preventive framing is truer to the user's second articulation ("rather than exploding the space of possibility"). §3a's table names the preventive function explicitly. No corrective action needed; noted for transparency.

### Framing Issues

No new P1 or P2 framing issues introduced by the §3 reframe or §3a addition.

---

## Summary

**Verdict: CLEAN AUDIT**

**Delta verification results:**

1. **§3 composition with §1 / §2:** Clean. §3's positioning paragraph explicitly addresses the compositional relationship: §1 calibrates the Beck port; §3 expands the toolkit in response. No contradiction between sections.

2. **§3a anti-elaboration table — ADR-077 claim:** The table's "same disposition" claim holds at the family-resemblance level but overstates ADR-077's primary anti-elaboration role. ADR-077 is primarily an anti-Einstellung mechanism; its anti-elaboration function is secondary. Recorded as P3 observation; does not affect the table's structural value or the §3a positioning claim.

3. **MODEL Amendment 21 partial-addressability claim:** Accurate and appropriately scoped. §3's mechanism addresses RESEARCH-phase elaboration; Amendment 21's scope is structural posture across the full cycle. The "partly addressable / not foreclosed" distinction is maintained and the Provenance check correctly labels this as agent composition from gate articulation.

4. **Provenance attribution:** Correctly layered. User-articulated content is labeled with gate date and verbatim quotes. Agent-composition synthesis is labeled agent composition with rationale source named. No synthesis-moment framing adoption detected.

5. **Rejected alternatives coherence:** Entries 1, 2, 3, 6 remain coherent with the reframed §3. Entries 4 and 5 reference the retired three-criterion trigger. Flagged as P3 (R4-P3.1) — directional coherence holds; references need updating to the current trigger for internal consistency.

6. **Title-slug navigability:** Acceptable. The slug "validation-spikes-in-research" covers both old and new titles; no navigational confusion introduced.

**Framing audit:** All three pass-1 framing issues (F-P2.1, F-P2.2, F-P3.1) confirmed present and unmodified. No new framing issues introduced by the §3 reframe.

**Status of open issues across the audit series:**
- Pass-1 P1 (ADR-085 stale-path consequence): Discharged (verified in pass 3)
- Pass-1 P2 2.1 (ADR-083 documentation-fatigue trigger): Resolved (verified in pass 3)
- Pass-1 P2 2.2 (ADR-086 indistinguishability failure mode): Unaddressed; held at gate for user disposition
- Pass-1 P2 2.3 (ADR-087 §4.1 probe scope): Resolved — the §3 reframe is pass 4's primary subject; §2's spike examples were also noted in the original ADR as "offered as additional context," satisfying this P2
- Pass-1 P2 2.4 (ADR-088/089 enforcement-mode semantic shift): Unaddressed; held at gate for user disposition
- Pass-1 P2 2.5 (ADR-090 stale field state recovery): Unaddressed; held at gate for user disposition
- Pass-3 P3 R3-P3.1 (ADR-083 cycle-archive observability precision): Unaddressed; held at gate
- Pass-4 P3 R4-P3.1 (Rejected alternatives entries 4 and 5 stale trigger reference): New in this pass; minor navigational consistency issue
- Pass-4 P3 R4 (§3a table ADR-077 primary-role precision): New in this pass; family-resemblance claim holds; primary-role description overstated
- Framing F-P2.1, F-P2.2, F-P3.1: Held at gate for user judgment per pass-1 and pass-3 record; unchanged

ADR-087 as revised is cleared for downstream phases.
