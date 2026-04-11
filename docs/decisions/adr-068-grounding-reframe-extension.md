# ADR-068: Grounding Reframe Extension — Fire on Significant Snapshot Findings with In-Cycle Course-Correction Implications

**Status:** Proposed

## Context

ADR-059 established the Grounding Reframe as the agent's response pattern for **unassessable sycophancy risk** — situations where neither belief-mapping nor empirical contact is available, and the agent cannot determine whether user confidence is earned or reinforced. The pattern: name what is uncertain, offer concrete grounding actions, make the cost of proceeding visible, let the user choose.

Cycle 10's execution revealed that the protocol is useful in a second kind of situation the original trigger condition did not cover: **when a susceptibility snapshot returns a significant finding with in-cycle course-correction implications.** Two concrete demonstrations across the cycle:

**DISCOVER phase (2026-04-07).** The discover-phase susceptibility snapshot (`susceptibility-snapshot-014-discover.md`) returned Finding 1: framing adoption has propagated, not reversed, and the propagation had reached product-discovery vocabulary and tensions. The snapshot recommended a per-entry Grounding Reframe pass on six flagged lines in `product-discovery.md`. The pass applied the Grounding Reframe pattern at the current phase's artifacts rather than feeding the finding forward as a bias-inducing note. Three removals, one rewrite, one keep, one split-edit resulted. The discover-phase cycle status records this as the cycle's clearest in-action demonstration of the protocol applied to a concrete finding.

**MODEL phase (2026-04-08).** The MODEL → DECIDE susceptibility snapshot returned Finding 1: the Invariant 8 commitment was preference-accelerated, not belief-mapped. The recommended Grounding Reframe was a specific belief-mapping question: *"Name one Cycle 9 ADR that the backward-propagation sweep would need to amend under Invariant 8."* The user responded by naming ADR-060 (research-methods-reviewer) specifically and extending the scope to the whole methodology's mechanism inventory. The commitment was then held on grounded basis rather than on preference.

In both cases, the snapshot returned a specific, actionable finding, and the Grounding Reframe protocol was the correct response — but ADR-059 as written only authorized the protocol for "unassessable sycophancy risk," not for "concrete finding with course-correction implications." The protocol was being used beyond its documented trigger condition. Both applications were load-bearing for the cycle's outcomes (the DISCOVER pass corrected six specific lines; the MODEL belief-mapping grounded a constitutional amendment), so the right response is to extend the trigger condition rather than to narrow the protocol's use back to its original scope.

The research-phase snapshot's failure to produce a Grounding Reframe on the four documented adoption moments — it only produced one on the HB2 complexity tradeoff — is the downstream consequence of the original narrow trigger. Had the protocol been authorized for significant findings with course-correction implications, the research-phase adoption moments would have driven in-phase course correction rather than propagating into discover and model. This ADR is the structural response to that gap.

Research-phase Commitment 5 and MODEL-phase Commitment 9 both carry the protocol-codification requirement forward to DECIDE. This ADR discharges both.

## Decision

Extend ADR-059's Grounding Reframe trigger condition. The protocol now fires in two distinct situations:

1. **Unassessable sycophancy risk** (ADR-059's original trigger): the agent cannot determine whether user confidence is earned or reinforced, and no belief-mapping or empirical contact is available to ground the assessment. The Grounding Reframe converts limitation-naming from a dischargeable obligation into an actionable fork toward better ground truth.

2. **Significant susceptibility snapshot finding with in-cycle course-correction implications** (new trigger, from Cycle 10 execution): the susceptibility snapshot returns a finding that (a) names specific artifacts, decisions, or commitments in the current phase, (b) is concrete enough to drive an actionable grounding action, and (c) the action can be applied at the current phase boundary rather than feeding forward to subsequent phases. The Grounding Reframe is the protocol for acting on such findings at the boundary where they surface.

**The protocol body is unchanged.** Both triggers produce the same Grounding Reframe pattern: name what is uncertain, offer concrete grounding actions, make the cost of proceeding visible, let the user choose. The set of concrete grounding actions from ADR-059 (run a spike, write a test, consult a domain expert, belief-map the specific assumption, review the artifact trail, explicitly acknowledge unverified ground) remains the toolkit. What changes is the set of situations in which the agent is authorized to draw from the toolkit.

### "Significant" calibration

The word "significant" in the new trigger is a judgment term. This ADR does not attempt a mechanical test, but offers three properties that characterize significance in the Cycle 10 demonstrations:

1. **Specificity.** The finding names a concrete artifact, decision, commitment, or pattern in the current phase. It is not a general observation (e.g., "the user seems confident") but a specific claim (e.g., "six lines in product-discovery.md exhibit framing adoption" or "the Invariant 8 commitment was preference-accelerated").

2. **Actionability.** A concrete grounding action can be composed in direct response to the finding. If the best response is "note this and move on," the finding is not significant for Grounding Reframe purposes — it feeds forward as advisory rather than triggering the protocol.

3. **In-cycle applicability.** The action can be applied at the current phase boundary, not only at a downstream phase. If the action requires work that the current phase cannot do (e.g., "this needs a new research cycle"), the finding is a feed-forward signal rather than a Grounding Reframe trigger.

Findings that meet all three properties trigger the protocol. Findings that meet some but not all continue to be recorded as feed-forward signals in the cycle status without triggering a Grounding Reframe. The judgment is the agent's at the point of reading the snapshot, informed by these three properties.

### In-cycle course correction as the operating principle

The DISCOVER phase's in-cycle course correction principle (from DISCOVER settled premise 4, recorded in the cycle status) is the broader operating principle this extension encodes structurally: *snapshot findings drive in-cycle course correction at their own boundary, not feed-forward to subsequent phases.* Feed-forward is for information that does not warrant immediate action; Grounding Reframe is for findings that do.

The two responses are complementary, not alternatives. A single snapshot can produce some findings that feed forward and others that trigger the Grounding Reframe. The routing is: *if the finding is significant-and-in-cycle-actionable, fire the Grounding Reframe; otherwise, record as feed-forward.* The DISCOVER phase demonstrated both: Finding 1 triggered the per-entry pass (Grounding Reframe); other signals were recorded as feed-forward notes in the cycle status.

### Cycle 10 as canonical examples

Two canonical examples are recorded in this ADR for the protocol's extended use:

**Example 1 — DISCOVER per-entry pass.** Snapshot finding: framing adoption has propagated to product-discovery vocabulary and tensions. Grounding Reframe action: per-entry pass on six flagged lines. Result: three removals, one rewrite, one keep, one split-edit. The cycle's clearest demonstration of in-cycle course correction on specific artifact content.

**Example 2 — MODEL belief-mapping check.** Snapshot finding: Invariant 8 commitment was preference-accelerated, not belief-mapped. Grounding Reframe action: ask the user to name one Cycle 9 ADR that the backward-propagation sweep would need to amend under Invariant 8. Result: user named ADR-060 (research-methods-reviewer) and extended scope to the whole methodology's mechanism inventory. Constitutional commitment held on grounded basis.

Both examples demonstrate the pattern: snapshot returns specific finding → Grounding Reframe converts the finding into an actionable grounding action → user engages the action → finding is resolved in-cycle rather than propagating.

## Consequences

**Positive:**

- **The protocol fires in more of the cases where it has demonstrated value.** Cycle 10's two successful applications (DISCOVER per-entry pass, MODEL belief-mapping check) become authorized uses of the protocol rather than extensions beyond its documented trigger. The methodology's practice and its documented principle are now aligned.
- **Significant snapshot findings become actionable rather than only advisory.** Prior to this extension, the natural response to a significant snapshot finding was to record it as feed-forward and address it downstream. The Cycle 10 lesson is that some findings should drive immediate course correction; this ADR encodes that lesson.
- **The research-phase adoption-moment gap is structurally closed.** The research-phase snapshot did not produce Grounding Reframes on the four framing-adoption moments under ADR-059's original narrow trigger. Under the extended trigger, those findings would have met all three significance properties (specific artifacts, actionable grounding, in-cycle applicable) and would have triggered the protocol. The downstream discover-phase finding was the consequence of the gap; the extension prevents the same gap from recurring.
- **The "in-cycle course correction at the boundary, not feed-forward" principle from DISCOVER gets operational form.** The extension encodes DISCOVER settled premise 4 as a protocol behavior, not only a principle.
- **The Cycle 10 examples are durable canonical cases.** Future cycles that invoke the protocol can reference the two examples as calibration for what "significant with in-cycle course-correction implications" means in practice.

**Negative:**

- **Broader trigger means more Grounding Reframe events in practice.** The protocol becomes more frequent across cycles, which may feel heavier at phase boundaries where multiple findings are returned. Mitigation: the three significance properties are specifically designed to narrow the trigger from "any finding" to "significant, actionable, in-cycle." Findings that don't meet all three continue to feed forward as before.
- **"Significant" is a judgment term that the agent evaluates at snapshot-read time.** The ADR provides three properties but does not mechanize the judgment. Different agent instances may calibrate the threshold differently. Accepted tradeoff: mechanizing the judgment would require a separate classifier mechanism that itself would be subject to the same Tier 1 anchoring requirements as any other methodology mechanism, with no obvious enforcement substrate. The judgment-term status is honest about a real calibration concern rather than hiding it behind false mechanization.
- **The extension is informed by exactly two Cycle 10 demonstrations.** Both were user-present, ceremonially-attended applications. The protocol's behavior under operational (not ceremonial) conditions has not been tested at scale. This is a known limitation shared with the susceptibility snapshot mechanism itself; the extension inherits the "ceremonial vs. operational reliability" concern Cycle 10 documents.

**Neutral:**

- **ADR-059's original trigger is preserved.** This ADR is additive, not a supersession. Unassessable sycophancy risk still fires the Grounding Reframe; snapshot-finding-driven cases now do as well.
- **The protocol body (name, offer, visible cost) is unchanged.** What changes is when the protocol is authorized to run, not how it runs when it does.
- **The extension couples to ADR-066's compound defense.** The compound defense's snapshot component is the primary producer of the findings that trigger the extended Grounding Reframe. This ADR and ADR-066 reinforce each other: ADR-066 specifies what the snapshot does at phase boundaries, and this ADR specifies how the agent responds to the snapshot's significant findings.

## Provenance check

**Did this ADR's core framing originate from Essay 014, from a prior gate conversation, or from the agent's synthesis during drafting?**

- **The extension itself (protocol fires on significant snapshot findings, not only unassessable risk):** **User-surfaced at DISCOVER gate 2026-04-07.** The commitment is recorded in `docs/housekeeping/cycle-status.md` feed-forward signals from DISCOVER (Commitment 5): *"The Grounding Reframe protocol should fire for any significant snapshot finding with in-cycle course-correction implications, not only for unassessable risk. Each significant finding should produce a Reframe with concrete decision options for the current phase's artifacts."* The user's question at the DISCOVER gate — *"what is the snapshot actually for?"* — reframed the methodological response from feed-forward to in-cycle course correction, which drove the per-entry pass and produced this commitment.
- **In-cycle course correction at the boundary as the operating principle:** **User-surfaced at DISCOVER gate 2026-04-07** (DISCOVER settled premise 4 in cycle status). The principle is broader than this ADR's scope but is the umbrella under which the extension lives.
- **The DISCOVER per-entry pass as a canonical example:** In-action demonstration during DISCOVER phase execution 2026-04-07. Not agent synthesis — recorded in cycle status and in `docs/housekeeping/audits/susceptibility-snapshot-014-discover.md`.
- **The MODEL belief-mapping check as a canonical example:** In-action demonstration during MODEL phase execution 2026-04-08. Recorded in cycle status and in `docs/housekeeping/audits/susceptibility-snapshot-014-model.md`.
- **The three significance properties (specificity, actionability, in-cycle applicability):** **Agent-composed at drafting time** as a calibration tool for the judgment term "significant." The properties are derived inductively from the two Cycle 10 demonstrations: both meet all three, and the properties characterize what distinguished them from feed-forward-only findings. The composition is mechanical abstraction from the examples, not a new framing introduced at drafting time. Named explicitly as agent composition.
- **The "protocol body unchanged, trigger extended" structure:** Agent-composed at drafting time as the amendment form. Not agent synthesis of a new principle; mechanical decision about how to encode an amendment to an existing ADR without restructuring ADR-059.
- **The routing between feed-forward and Grounding Reframe ("if significant-and-in-cycle-actionable, fire the protocol; otherwise, record as feed-forward"):** Agent-composed at drafting time as the operational form of the in-cycle course correction principle applied to the extension.

**Result:** This ADR is a straightforward extension of an existing ADR driven by concrete in-cycle demonstrations. The core extension is user-surfaced at DISCOVER; the two canonical examples are in-action demonstrations at DISCOVER and MODEL; the three significance properties and the routing structure are agent-composed at drafting time as mechanical abstraction from the examples. No synthesis-moment framing adoption detected. No watch items. The ADR is the shortest and cleanest-attributed of the DECIDE-phase ADRs after ADR-067, because its substance is largely summary of in-cycle evidence rather than new architectural composition.
