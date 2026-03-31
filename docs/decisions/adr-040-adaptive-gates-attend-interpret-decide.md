# ADR-040: Replace Fixed-Template Gates with Attend-Interpret-Decide Cycle

**Status:** Proposed

## Context

After four cycles of practice, epistemic gates feel formulaic. Essay 009 diagnoses the structural cause: the current gate protocol replicates the Initiation-Response-Evaluation (IRE) pattern — the most criticized discourse structure in educational research (Sinclair & Coulthard, 1975; Mehan, 1979). The agent asks a predetermined prompt drawn from a table mapping pedagogical frameworks to phases, the user responds, the agent evaluates and proceeds. The prompts inject artifact-specific content (per ADR-003), but they are engagement-blind — the same framework-assigned prompt runs regardless of whether the user deeply engaged during the cycle or passively approved artifacts.

The teacher noticing framework (Jacobs, Lamb & Philipp, 2010) provides the alternative: Attend (read engagement signals), Interpret (form a hypothesis about the user's understanding), Decide (choose a contingent response). The contingent shift principle (Wood, Bruner & Ross, 1976) provides the mechanism: increase support on struggle, decrease on success.

Invariant 4 was amended (Amendment 13) to shift the constraint from duration to waste: "Epistemic cost must be productive, not merely brief." This decision and the Invariant 4 amendment are co-dependent — the prior "5-10 minute" constraint would conflict with the iterative teaching exchanges this cycle enables. Neither is coherent without the other.

## Decision

Replace the fixed-template epistemic gate protocol across all skill files with an Attend-Interpret-Decide (AID) cycle. At each gate:

1. **Attend** — the agent reads the cycle's conversation history for engagement signals: questions asked, concepts engaged with or avoided, challenges raised, connections made, approval patterns.

2. **Interpret** — the agent forms a hypothesis about the user's engagement: deeply engaged, adequately engaged, surface-engaged, confused, or disengaged.

3. **Decide** — the agent selects a pedagogical move:
   - **Deep engagement → Challenge**: surface a tension, apply the Inversion Principle, reframe the problem space. "The architecture cleanly separates X and Y. Where does this design break?"
   - **Adequate engagement → Probe**: ask for reasoning and specificity. "You mentioned the domain model's distinction between A and B — what makes that important for what you are building?"
   - **Surface engagement → Teach**: explain the key choice in the artifact, why it was made, then ask for the user's take.
   - **Confusion → Clarify**: back up, address the misunderstanding, re-approach.
   - **Disengagement → Re-anchor**: "It seems like the responses are not as in-depth as they could be — is this a good time to take a break? Otherwise, are there ways to reframe the work to serve your current goals better?"

The gate remains iterative: the agent's subsequent turns are contingent on the user's response (contingent shift). If a probe response is thin, shift toward teaching. If teaching demonstrates understanding, shift toward challenge. The gate ends when shared understanding is established, not after a fixed number of turns.

The existing invariants hold: epistemic acts remain mandatory (Invariant 2), the user must produce something (Invariant 1), the AID cycle itself is a pragmatic action (Invariant 3 — the agent reads signals and selects prompts, which is diagnostic, not epistemic).

## Alternatives Considered

**Keep fixed templates with better prompts.** Improve the prompt quality without changing the protocol structure. Rejected because the structural problem is engagement-blindness, not prompt quality — better prompts applied uniformly still replicate the IRE pattern.

**Fully adaptive with no structured intent.** Let the LLM freely choose what to ask based on conversational context. Rejected because hybrid dialogue research (2025) found that full adaptivity produces "repetitiveness and misalignment in prompts" — too much flexibility loses pedagogical intent. The AID cycle preserves structured intent (what the gate must accomplish) with adaptive execution (how it gets there).

**User self-assessment.** Ask the user to rate their own understanding before the gate selects a move. Rejected because self-assessment adds friction and provides weaker signal than the conversation history the agent already has access to. Self-assessment is also vulnerable to fluency illusions — users may overestimate understanding when AI output is polished (Bjork, Essay 001) — though this is a secondary concern compared to the practical advantage of conversation-based signals.

## Consequences

**Positive:**
- Gates respond to how the user actually engaged, not just what artifact was produced
- The agent-as-teacher role emerges naturally when gaps are detected
- Deep engagement is rewarded with challenge, not easy passage
- Anti-sycophancy is structural: the protocol resists validation as a default response
- Aligns with amended Invariant 4: time spent is productive, not merely brief

**Negative:**
- Gate behavior becomes less predictable — the user cannot anticipate what will be asked
- The agent's interpretation may be wrong (misreading brevity as disengagement, or politeness as deep engagement)
- Implementation complexity increases for skill file authors
- Calibration against real usage patterns is needed before the model can be considered validated

**Neutral:**
- The existing engagement signals (conversation history) are already available to the agent; no new data collection is required
- The five pedagogical moves are a starting framework — they may evolve with practice
