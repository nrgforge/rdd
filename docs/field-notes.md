# Field Notes

**Play session:** 2026-03-27
**Practitioner:** Nathan Green (methodology author)

## Stakeholder: Organization / Management

**Super-Objective:** Determine if structured thinking investment produces better outcomes than shipping faster without it
**Point of Concentration:** ORIENTATION.md as entry point for resource allocation decision

### Epistemic distance too great for productive play
**Category:** Challenged assumption
**Observation:** Inhabiting Org/Management produced boredom rather than discovery. The practitioner read ORIENTATION.md as its author evaluating quality, not as a manager evaluating time investment. The play frame alone could not bridge the distance to a stakeholder whose concerns (cost justification, resource allocation) are fundamentally different from the practitioner's concerns (understanding, building). Deterding's epistemic distance critique applies here — some stakeholder roles may be too far from the builder's experience for play to be generative without a human gamemaster who actually holds that perspective.
**Feeds back to:** DISCOVER (as challenged assumption — the assumption that all stakeholders in the map are equally inhabitable)

### ORIENTATION.md reads well for evaluative audiences
**Category:** Delight
**Observation:** Despite the inhabitation not fully working, the practitioner noted that ORIENTATION.md provides enough for an organizational evaluator to decide whether to dive deeper or stop. The "Who It Serves" section with reading paths gives each audience a clear entry point. The artifact serves an audience it was not primarily designed for.
**Feeds back to:** SYNTHESIS

### Playing with play itself is the degenerate case
**Category:** Challenged assumption
**Observation:** The gamemaster's facilitation prompts — role proposals, points of concentration, complications — are themselves the artifact under examination in this session. The practitioner is evaluating the gamemaster's behavior while the gamemaster is performing it, which collapses the play frame. There is no distance between the facilitation and the thing being facilitated. The real test of the play skill would be: the gamemaster facilitating play against a *different* skill (e.g., `/rdd-research` or `/rdd-decide`) where the facilitation mechanics are not simultaneously the object of study. Playing with other, established skill files in situ could be productive — the practitioner would encounter those skills' behavior through an unfamiliar stakeholder lens, and the gamemaster's facilitation would be a tool rather than the subject. The issue is not meta-projects generally, nor freshness — it is that evaluating a facilitator's prompts while the facilitator is prompting is structurally recursive in a way that prevents genuine encounter.
**Feeds back to:** RESEARCH (new question — what are the boundary conditions for productive play? The recursive case where the play artifact is simultaneously the object of play is degenerate. Does this generalize to other self-referential contexts?)

## Simulated Play: Zani Project (agent self-play)

**Super-Objective:** Evaluate the play skill's facilitation quality by running it against a real built application (Zani, a terminal writing app)
**Point of Concentration:** Quality of gamemaster prompts, Invariant 3 boundary adherence, simulated vs. real encounter

### Gamemaster structure produces useful complications
**Category:** Delight
**Observation:** The Stanislavski framing (super-objective + complications from product discovery) generated genuinely useful prompts: cold-start discoverability gap for non-builder writers, vim-accident failure mode for non-vim users, dimming-contrast-ratio loophole for low-vision writers. These emerged from inhabiting non-builder stakeholders and are real findings that map to gaps in Zani's scenario coverage.
**Feeds back to:** SYNTHESIS

### Agent consistently crosses the Invariant 3 boundary in practice
**Category:** Challenged assumption
**Observation:** Despite the play skill stating "shapes attention, not conclusions," the simulated gamemaster repeatedly crossed the boundary: asserting "highest-risk gap in the product" (editorial judgment), narrating "the text is literally invisible" (conclusion not observation), inventing consequences ("writing quality dips at chapter boundaries") rather than directing attention toward something to observe. The agent's natural tendency to narrate and analyze overrides the stated principle. The current skill text states the boundary but does not provide enough operational guardrails to prevent violation during facilitation.
**Feeds back to:** Interaction specs (interaction gap — the play skill needs stronger operational guardrails against conclusion-generation, not just the principle statement)

### Simulated self-play cannot produce genuine encounter
**Category:** Challenged assumption
**Observation:** The simulation generated complications deductively from the value tension document — predictable derivations, not emergent surprises. Real play requires the built system pushing back in ways the gamemaster did not script. The field notes from the simulation read like a senior QA engineer's review (analytical, clean, categorized in real time) rather than discoveries from encounter (messy, uncertain, settling into shape over time). The play skill's structure is a good container and useful as gamemaster preparation. It needs a real participant and a real system to fill it.
**Feeds back to:** RESEARCH (new question — can the play skill's instructions better distinguish preparation from facilitation? The structure works for planning which stakeholders and complications to propose; the actual session needs different instructions emphasizing silence, following the participant, and raw observation)

### Human gamemaster would stay silent longer
**Category:** New question
**Observation:** A UX researcher would propose one complication and spend 20 minutes in it. The simulated session named six complications and explored none to the point of surprise. The most important facilitation skill is watching without narrating — letting silence carry the discovery. The play skill's instructions emphasize what the gamemaster should *do* (propose roles, introduce complications, react to discoveries) but not what the gamemaster should *refrain from doing* (interpreting, concluding, categorizing in real time, filling silences with analysis).
**Feeds back to:** Interaction specs (interaction gap — the play skill needs "refrain from" instructions alongside "do" instructions)

---

## Cross-Cutting Reflection

**Which stakeholder had the hardest time?** Org/Management on RDD itself — the distance was too great and the recursive nature of playing with play provided no interaction surface. In the Zani simulation, the non-builder Writer surfaced the most concrete gaps (cold-start, vim-accident).

**What did play reveal that specs missed?** Two structural findings: (1) The recursive case where the built artifact is the play phase itself is degenerate — the gamemaster cannot facilitate discovery about its own facilitation. (2) The play skill's Invariant 3 boundary principle is stated but operationally underspecified — the agent's natural tendency to narrate and analyze overrides it in practice. The skill needs "refrain from" instructions (don't interpret, don't conclude, don't categorize in real time, don't fill silences) alongside "do" instructions (propose roles, introduce complications).

**How has the practitioner's understanding shifted?** The play skill's structure works well as a preparation tool — the Stanislavski framing generates genuinely useful complications. But the facilitation instructions need to better distinguish preparation (what to plan before the session) from in-session behavior (what to do and not do during encounter). The agent needs stronger guardrails against its own tendency to narrate, and explicit instruction to stay silent and follow the practitioner rather than driving the session.
