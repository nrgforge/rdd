# Argument Audit Report — Re-audit Pass 3

**Audit type:** Re-audit pass 3 (post-correction verification)
**Audited documents:**
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-083-cognitive-economy-criterion.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-084-agent-context-content-placement.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-085-rdd-infrastructure-relocation.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-086-ai-as-orienter-non-adoption.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-087-validation-spikes-in-research.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-088-adr-064-advisory-demotion.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-089-adr-067-harness-layer-revision.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-090-in-progress-phase-role-shift.md`

**Source material:**
- `/Users/nathangreen/Development/rdd/docs/essays/016-initial-handoff-and-the-audience-at-the-margin.md`
- `/Users/nathangreen/Development/rdd/docs/product-discovery.md`
- `/Users/nathangreen/Development/rdd/docs/domain-model.md`
- `/Users/nathangreen/Development/rdd/docs/housekeeping/audits/susceptibility-snapshot-017-discover.md`
- `/Users/nathangreen/Development/rdd/docs/housekeeping/audits/susceptibility-snapshot-017-model.md`
- `/Users/nathangreen/Development/rdd/docs/housekeeping/gates/017-research-gate.md`
- `/Users/nathangreen/Development/rdd/docs/housekeeping/gates/017-discover-gate.md`
- `/Users/nathangreen/Development/rdd/docs/housekeeping/gates/017-model-gate.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-026-formalize-scoped-cycles.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-064-compound-check-hooks.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-067-three-tier-enforcement-classification.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-074-adr-supersession-workflow.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-089-adr-067-harness-layer-revision.md`

**Prior audit:** `/Users/nathangreen/Development/rdd/docs/housekeeping/audits/argument-audit-decide-017.md` (pass 1, which identified the two issues corrected in this pass)
**Date:** 2026-04-27

---

## VERDICT: CLEAN AUDIT

No unaddressed issues at P1 or P2. Both corrections from the prior pass are verified clean. One residual P3 observation is noted below. All three framing issues from the first-pass audit are present in unchanged form. The eight ADRs are cleared for downstream phases.

---

## Section 1: Argument Audit (Re-audit Pass 3)

### Summary

- **Argument chains re-verified:** 2 targeted (the two corrected issues) + spot-checks across remaining six ADRs
- **New issues found:** 0 at P1 or P2; 1 at P3 (minor observability precision claim)
- **Prior P1 issue (pass 1, Issue 1.1 — ADR-085 stale-path consequence):** Verified present in ADR-064's supersession header. The second reading-time note in ADR-064's supersession header explicitly names the stale-path consequence: "Stale `docs/housekeeping/` paths in ADR-064's preserved body." This discharges the P1 requirement. No new P1 issues introduced by the pass-3 corrections.

### P1 — Must Fix

None.

### P2 — Should Fix

None.

### P3 — Consider

**Issue R3-P3.1 — ADR-083 §4: "cycle-archive" as observability claim is stronger than ADR-026 supports**

- **Location:** ADR-083 §4, documentation-fatigue exception (third bullet), corrected passage
- **Claim:** The corrected text states the structural trigger is "graduation status: the corpus has one or more graduated Scoped Cycles in its cycle-archive (per ADR-026's lifecycle: scope → cycle → graduate)" and characterizes graduation status as "corpus-state-observable — graduation events are recorded in the cycle-archive."
- **Evidence gap:** ADR-026 establishes the scope → cycle → graduate lifecycle and specifies that at graduation "RDD artifacts are archived." However, neither ADR-026 nor the domain model's Graduation or Scoped Cycle concepts defines a formal "cycle-archive" as a named, structured location with observable graduation event records. The domain model's open question on graduation (line 801) describes the graduation signal as "a felt phase transition, not a metric." ADR-026 §Consequences mentions "Documentation fatigue is addressed by graduating knowledge when it's absorbed" — but graduation's corpus-state visibility (whether a practitioner can definitively query "has this corpus graduated?") is not established as a mechanical check. The corrected exception language makes a stronger observability claim than the source material supports: "graduation events are recorded in the cycle-archive" asserts a recording convention that does not yet formally exist.
- **Severity assessment:** This is a precision claim, not a logical error. The fix is structurally correct in the important sense: graduation status is a better trigger than felt fatigue because it is at least in principle observable (graduation does leave traces — archived artifacts, cycle-status entries, fold-and-archive operations). The overclaim is in calling the observation mechanism formally specified when it is currently informal. This is P3, not P2, because the direction of the fix is right and the overclaim does not create a loophole — a practitioner with a graduated corpus still cannot invoke the exception based on felt fatigue alone.
- **Recommendation:** In ADR-083 §4, soften "graduation events are recorded in the cycle-archive" to "graduation leaves observable traces in the corpus — archived artifacts, cycle-status entries, the fold-and-archive operations ADR-026 specifies — that distinguish a post-graduation corpus from a pre-graduation one." This preserves the structural trigger (graduation status) and the subjective-correlate framing (felt transition) without asserting a formal record-keeping convention the methodology has not yet established.

---

### Delta Verification — Correction 1: ADR-083 §4 Documentation-Fatigue Exception

**Prior issue (first-pass P2, Issue 2.1):** The documentation-fatigue exception conflated a structural trigger with a phenomenological one. The text described the trigger as "feels like maintenance burden" — entirely felt, with no structural markers. The four exception conditions each needed observable criteria; this one had none.

**Corrected text (ADR-083 §4, third bullet, current version):**

The corrected passage:
1. Names "graduation status" as the trigger — "the corpus has one or more graduated Scoped Cycles in its cycle-archive (per ADR-026's lifecycle: scope → cycle → graduate)."
2. Separates the felt phase transition as a subjective correlate — "The felt phase transition that ADR-026 names... is the subjective correlate of graduation status — it is how graduation presents to the practitioner, not a separate trigger."
3. States explicitly that the structural condition controls — "A practitioner whose corpus has not crossed the graduation threshold cannot invoke this exception, regardless of how the corpus feels to work in... Conversely, a corpus with graduation history admits the exception even if the practitioner does not subjectively register fatigue — the structural condition controls."
4. Explains the purpose of the separation — "This separation prevents the exception from operating as a permission to skip in-place work because the practitioner is bored with the corpus."

**Verdict on Correction 1:** Clean. The original P2 is resolved. The structural trigger and subjective correlate are now clearly separated. The logic that prevents invocation without structural condition is explicit in both directions (cannot invoke without graduation history; can invoke even without subjective fatigue if graduation history exists). The remaining P3 observation (the "cycle-archive" observability precision claim) does not reopen the P2 — it is a softer claim about naming precision, not about the trigger/correlate conflation that the P2 identified.

**Cross-check with ADR-026:** ADR-026 §Context establishes the scope → cycle → graduate lifecycle. ADR-026 §Decision formalizes Scoped Cycles and confirms "scoped cycles typically end with graduation." ADR-026 §Consequences notes "Documentation fatigue is addressed by graduating knowledge when it's absorbed." The corrected exception is consistent with ADR-026's lifecycle framing. ADR-026 describes the graduation trigger as "a felt phase transition" — the corrected ADR-083 correctly recasts this as the subjective correlate of graduation status rather than the trigger itself, which is a calibration, not a contradiction. ADR-026 does not specify what graduation status means for observability purposes, which is the source of the residual P3 precision claim. No contradiction with ADR-026 introduced.

**Cross-check with ADR-085 (relocation framing):** ADR-083's exception still composes cleanly with ADR-085. ADR-085's relocation changes where infrastructure artifacts live (`.rdd/` vs. `docs/housekeeping/`) but does not affect the cognitive-economy criterion's exception structure. The Graduation concept and Scoped Cycle concept operate at the lifecycle level, above the infrastructure-placement level. No coherence issue introduced.

---

### Delta Verification — Correction 2: ADR-067 Supersession Header

**Prior issue (first-pass P3, Issue 3.5 analogue — framing asymmetry in supersession headers):** ADR-067's supersession header lacked navigational specificity about where in ADR-067's body the amended State-C language lives, creating asymmetry with ADR-064's header (which contained specific reading-time notes).

**Corrected header (ADR-067, current version):**

The corrected ADR-067 supersession header now contains two distinct elements:
1. The summary line: "ADR-089 amends the Harness Layer row's enforcement-technique description and the decision-procedure step 2 language to reflect ADR-088's advisory demotion (v0.8.3). The Three-Tier substrate framing, the four-step decision procedure structure, and the substrate primacy ordering all remain current authority. Only the Harness Layer's enforcement-technique description and the State-C claim language are amended (block → advisory; impossibility → detectability)."
2. A reading-time note for navigating ADR-067's preserved body: "The 'only structural defense' and 'structurally impossible' language in the 'Not a priority hierarchy' subsection's Harness Layer paragraph is amended by ADR-089 §3 to read..." with the full amended text quoted.

**Comparison with ADR-064's header pattern:** ADR-064's supersession header contains two numbered reading-time notes — one on the "enforcement mode" semantic shift and one on the stale `docs/housekeeping/` paths. ADR-067's corrected header contains one reading-time note (the amended State-C language location). The structural pattern matches: both headers now provide navigational specificity about what in the preserved body is historical or amended.

**ADR-074 compliance check:** ADR-074's body-immutability rule is respected — ADR-067's body is unchanged. The supersession header is the designated mutable location for reader-navigation notes. The reading-time note does not introduce new substantive claims beyond what ADR-089's body authorizes — it quotes the amended text from ADR-089 §3 verbatim. No new architectural claims are introduced by the header expansion. ADR-074 compliance holds.

**Verdict on Correction 2:** Clean. The navigational asymmetry between ADR-064's and ADR-067's headers is resolved. The expanded header provides the same class of reading-time navigational information ADR-064 provides. No new contradictions or claims introduced.

---

### Spot-Check: Cross-ADR Coherence After Pass-3 Corrections

**ADR-083 exception conditions vs. ADR-026 (graduation authority):** The corrected third exception now cites ADR-026 explicitly by name. ADR-026's lifecycle (scope → cycle → graduate) is the grounding authority for the exception. The citation is accurate — ADR-026 does establish this lifecycle. No contradiction.

**ADR-083 exception conditions vs. ADR-085 relocation:** The relocation moves infrastructure artifacts; it does not modify the Scoped Cycle lifecycle or graduation concept. No interaction introduced by the corrections.

**ADR-067 header vs. ADR-089 body:** The header's reading-time note quotes ADR-089 §3's amended State-C language. ADR-089 §3 contains exactly that language. The header is a faithful quotation from ADR-089, not an independent claim. No contradiction introduced.

**ADR-067 header vs. ADR-074 workflow:** The header follows the "Updated by" (not "Superseded by") form, consistent with a partial supersession. The reading-time note is added content in the header, not a body edit. Body immutability is maintained. ADR-074 compliance confirmed.

**Remaining six ADRs (spot-check for corrections-induced interaction):** ADR-084, ADR-085, ADR-086, ADR-087, ADR-088, ADR-090 were not modified in pass 3. The pass-3 corrections are isolated to ADR-083 §4 (one bullet) and ADR-067's supersession header. No cross-ADR interactions from these specific edits were identified in the spot-check. The first-pass audit's cross-ADR coherence assessment remains current for these six ADRs.

---

## Section 2: Framing Audit (Pass 3 Preservation Verification)

The framing audit's role in pass 3 is limited to confirming that the three framing issues identified in the first-pass audit are present in unchanged form. The pass-3 corrections (ADR-083 §4 bullet rewrite and ADR-067 header expansion) are targeted; they do not alter the ADRs' dominant framings, content-selection logic, or the source material's relationship to the featured findings.

### Framing Issue Preservation Status

**F-P2.1 — ADR-083 §3: Bolt-on / felt-additional signal scope ambiguity (companion file overlap):**

Status: PRESERVED. ADR-083 §3 is unchanged in pass 3. The corrected passage is in §4 (the exception conditions). The first-pass observation that the bolt-on signal could catch companion files (additive by ADR-084 design) without a clarifying note distinguishing human-reading-path candidates from agent-facing companion files remains present as originally identified. The pass-3 corrections do not resolve or aggravate this issue.

**F-P2.2 — ADR-086 §Context: Essay's "candidate territory" framing for AI-as-orienter not visible in the ADR:**

Status: PRESERVED. ADR-086 is unchanged in pass 3. The framing shift from the essay's "candidate territory" posture to the ADR's resolved non-adoption disposition is still present as originally identified. No pass-3 corrections touch ADR-086.

**F-P3.1 — ADR-084: `<artifact>.agents.md` naming convention novelty relative to cited conventions:**

Status: PRESERVED. ADR-084 is unchanged in pass 3. The observation that the `<artifact>.agents.md` convention is an RDD-specific extrapolation from (not an adoption of) the `llms.txt` / `AGENTS.md` ecosystem conventions remains as originally identified. No pass-3 corrections touch ADR-084.

### Framing Audit Re-Check: Pass-3 Corrections Do Not Alter Framing

**ADR-083 §4 rewrite:** The rewrite affects one exception condition bullet. It does not change ADR-083's dominant framing (in-place-first as the default; bolt-on as failure-mode signal; exception conditions as named deviations). The three alternative framings from the first-pass framing audit (Outcome Test as User-Tooling Layer mechanism, ADR-084 as permanent named standard, ADR-087 as Tier 1 with decision-record artifact) remain unaddressed in the ADR text, as expected — these are framing observations for user awareness, not corrections the ADR is obligated to make.

The framing observation Truth C from the first-pass audit (exception conditions were entirely agent-composed and not gate-examined) remains accurate. The corrected third bullet is still agent-composed — its grounding improved (clearer citation to ADR-026, structural vs. phenomenological separation now explicit) but the agent-composition status of the four exception conditions as an enumeration is unchanged.

**ADR-067 header expansion:** The expanded header is navigational. It does not change ADR-067's dominant framing (Three-Tier Enforcement Classification as a methodology-level taxonomy; substrates as primary in their domains; not a priority hierarchy). No framing content is added by the header expansion; it quotes ADR-089 §3's already-authorized amendment language.

### Conclusion: Three Framing Issues Preserved, No New Issues Introduced

All three framing issues from the first-pass audit are present in unchanged form. The pass-3 corrections do not introduce new framing choices that would require a new framing audit cycle. The issues remain at the epistemic gate for user judgment as intended.

---

## Summary

**Verdict: CLEAN AUDIT**

**Corrections verified:**
1. ADR-083 §4 documentation-fatigue exception — the structural trigger (graduation status) and subjective correlate (felt phase transition) are now clearly separated. The logic that prevents invocation without structural condition holds in both directions. Correction is clean.
2. ADR-067 supersession header — expanded to include a reading-time note naming the specific paragraph where State-C language is amended, matching ADR-064's navigational specificity pattern. No new substantive claims introduced. ADR-074 compliance maintained. Correction is clean.

**New issue found:**
- One P3: ADR-083's "cycle-archive" observability precision claim is stronger than ADR-026 supports. The fix direction is right; the claim naming mechanism is informal. Recommend softening "graduation events are recorded in the cycle-archive" to describe what graduation traces are observable without asserting a formally specified recording convention.

**Framing audit:** All three first-pass framing issues preserved in unchanged form. No new framing issues introduced by pass-3 corrections.

**Status of prior issues:**
- Pass-1 P1 (ADR-085 stale-path consequence): Discharged — ADR-064's supersession header's second reading-time note names the stale-path consequence explicitly.
- Pass-1 P2 (ADR-083 documentation-fatigue trigger conflation): Resolved by pass-3 correction. Verified clean.
- Pass-1 P3 (ADR-067 navigational asymmetry): Resolved by pass-3 correction. Verified clean.
- Pass-1 P2 issues 2.2–2.5, P3 issues 3.1–3.4, framing issues F-P2.1, F-P2.2, F-P3.1: Unchanged (these were not addressed by pass-3 corrections and remain as noted in the first-pass audit, at their original priority levels, for user disposition).

The eight ADRs are cleared for downstream phases.
