# ADR-056: Research-Grounded Question Toolkit for AID Cycle

**Status:** Proposed
**Extends:** ADR-040 (Replace Fixed-Template Gates with Attend-Interpret-Decide Cycle)

## Context

ADR-040 established the AID cycle with five pedagogical moves (challenge, probe, teach, clarify, re-anchor) but did not specify the *instruments* those moves deploy. The moves describe what posture the agent takes; the question forms describe what the agent actually says.

The Cycle 9 research (Essay 013) and product discovery identified six research-grounded question forms, each with empirical backing for its mechanism. The DISCOVER phase established a hard design constraint: these forms are *types* the agent composes with phase content and conversation state, not scripts to recite. The non-formulaic requirement is a first-order design constraint — if the forms become templates, they become Performative Structural Resistance (satisfiable without addressing Content Selection).

## Decision

The AID cycle's pedagogical moves deploy from a toolkit of six research-grounded question forms:

1. **Belief-mapping** — "What would I need to believe for [alternative] to be right?" Maps the belief space rather than advocating. Near-zero preference-driven divergence (spike finding). Primary form for the Inversion Principle (ADR-055).

2. **Pre-mortem** — "Assume [this artifact/decision] led the project astray — what would have caused that?" Exploits prospective hindsight (Mitchell et al. 1989). Forces the user to generate failure modes the artifact doesn't address.

3. **Warrant elicitation** — "What principle justifies [this inference/decision]?" (Toulmin). Makes the warrant connecting evidence to conclusion explicit. Surfaces assumptions that feel obvious but may not be shared.

4. **Rebuttal elicitation** — "Under what conditions would [this claim/decision] fail?" (Toulmin). Forces explicit articulation of boundary conditions. Complements belief-mapping (which maps what would make the alternative right; rebuttal maps what would make the current choice wrong).

5. **Commitment gating** — "Which premises are you building on, and which remain open?" (from Khurana et al.'s premise governance). Requires the user to explicitly distinguish settled from unsettled. Prevents silent hardening of tentative positions into assumed facts.

6. **Open-question reframing** — "What's the open question behind [this assertion]?" Converts assertions with embedded conclusions into genuine questions. Particularly useful when the assertion-detection hook (ADR-062) fires.

**Phase-specific mapping (initial — to be refined through practice):**
- RESEARCH: pre-mortem + open-question reframing
- DISCOVER: belief-mapping + commitment gating
- MODEL: warrant elicitation
- DECIDE: rebuttal elicitation + belief-mapping on rejected alternatives
- BUILD: commitment gating at stewardship checkpoints

**Non-formulaic requirement:** The forms are types, not scripts. The agent composes each form with:
- The specific phase content (what artifact was just produced, what decision was just made)
- The conversation state (what the user engaged with, what they avoided)
- The AID cycle's interpretation (what pedagogical move is warranted)

A belief-mapping question at the RESEARCH gate about a framing choice sounds different from a belief-mapping question at the DECIDE gate about a rejected alternative. The form is the same; the content is contextual. Spirit over letter.

**Triple duty:** Each question form serves simultaneously as sycophancy resistance (constrains Content Selection), confidence diagnosis (the user's response reveals whether confidence is earned), and epistemic advancement (the question itself builds understanding). The forms are not overhead added to the gates — they are the gates working better.

## Consequences

**Positive:**
- Equips the AID cycle with specific, research-grounded instruments rather than leaving question generation to the agent's unconstrained judgment
- The triple-duty property means sycophancy resistance is not added cost — it is better gate design
- Phase-specific mapping gives DECIDE downstream phases a starting point for calibration
- Non-formulaic requirement prevents the forms from becoming Performative Structural Resistance

**Negative:**
- Six forms may be more repertoire than needed for any single gate. Mitigated: the agent selects from the toolkit based on AID interpretation, not applies all six
- The non-formulaic requirement is a hard constraint that cannot be mechanically verified — the agent must exercise judgment about contextual composition. Mitigated: pattern degradation (forms becoming templates) is itself a signal that the Conformance Audit can detect through stylistic analysis
- The phase-specific mapping is initial and unvalidated — real practice may reveal different phase-form affinities

**Neutral:**
- The forms draw from established frameworks (Toulmin, Mitchell et al., Khurana et al.) — the contribution is the integration into the AID cycle, not the forms themselves
- ADR-055 specifies belief-mapping as the primary Inversion Principle operationalization; this ADR specifies it as one of six tools in a broader toolkit. The two are complementary, not redundant
- **Known limitation:** The spike evidence for belief-mapping's effectiveness is directional (N=1 per cell, compressed pipeline). The other five forms are adopted from established frameworks but have not been tested within the RDD pipeline context. Phase-form affinities are hypotheses derived from the mechanisms each form exploits, not from empirical testing — pre-mortem at RESEARCH and commitment-gating at DISCOVER are theoretical; practice may reveal different affinities
