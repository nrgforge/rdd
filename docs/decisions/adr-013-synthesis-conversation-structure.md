# ADR-013: Synthesis Conversation Structure and Outline Deliverable

**Status:** Proposed

## Context

Essay 003 §6 describes the synthesis phase as an inversion of the typical AI-human dynamic: in earlier phases, the agent generates and the user engages at gates. In synthesis, the user has the material (their own experience, surprises, evolving understanding) and the agent's role is to help the writer become more generative — not to generate itself.

The agent functions as a discovery journalist: reading the full artifact trail, identifying candidate discovery sites using five novelty signals, and conducting a structured conversation that helps the user find their story. The user's reflections during the epistemic gate conversations (003 reflections) sharpened this: the agent catalyzes the writer's generative capacity without doing the generative work.

The domain model defines five novelty signals the agent uses as a detection sweep: explicit surprise statements, reframing events (Dorst Abduction-2), assumption denials (Davis "That's Interesting!"), negative case integrations, and superseded decisions.

## Decision

The synthesis conversation moves through three phases, with the agent mining the artifact trail beforehand:

**Pre-conversation: Artifact Trail Mining.**
The agent reads the full artifact trail and applies the five novelty signals to produce a ranked list of candidate discoveries ordered by interestingness. This is pragmatic work (Invariant 3) — detection, not interpretation.

**Phase 1: Journey Review.**
The agent walks through the artifact trail chronologically, pointing to specific moments — a research question that led somewhere unexpected, a domain model concept that emerged from tension, an ADR that superseded an earlier position, a reflection that surfaced an unanticipated connection. At each moment, the agent asks the user to recall and articulate what was happening. The agent catalyzes; the user generates.

**Phase 2: Novelty Surfacing.**
The agent presents its ranked candidate discoveries and asks the user to react. Which feel genuinely important? Which were surprising then but obvious now? Which carry unresolved tension? The user's reactions are the primary data: genuine engagement signals a live discovery; polite agreement signals a dead one.

**Phase 3: Framing Conversation.**
The agent and user co-produce the essay's central question, volta, and structural form. The agent offers narrative frameworks as lenses to try on — ABT sentence, story spine, braided structure — not templates to fill in. The writer may adopt, modify, or discard any of these in favor of their own structural impulse. The outline format should get the writer going, not constrain them.

During framing, the agent asks whether the volta or key discoveries resonate with the writer's other work or interests — not by accessing other project trails (which the agent cannot do), but by inviting the writer to draw connections. Cross-project insight lives in the writer's mind, not in files. The agent creates conversational space for it.

**The outline is the deliverable — and it must be an exciting springboard.** The writer should be able to open it and start writing with minimal friction. This means:

- **Non-formulaic structure.** The outline identifies whatever the writer needs to start writing — the central question, the key turns, the threads, the opening scene, the closing implication — in whatever form serves the writer's impulse.
- **Pre-populated references and works-cited.** The agent extracts relevant citations from the research log, essays, and reflections — full quotes, proper attribution, source context. The writer should not have to go back and hunt for the material that supports their argument.
- **Citation audit.** Before finalizing the outline, the agent runs a citation audit (via `/citation-audit`) on all pre-populated references to verify they exist, are properly attributed, and that quoted material is accurate. No hallucinated sources reach the writer's desk.

The user writes the synthesis essay on their own time, outside the pipeline.

## Consequences

**Positive:**
- Three-phase structure provides scaffolding without prescribing outcome
- Novelty signals give the agent a concrete detection procedure (not impressionistic reading)
- Non-formulaic outline respects the writer's creative authority
- Clean separation: agent mines and catalyzes (pragmatic), user generates and writes (epistemic)
- Pre-populated references lower the friction between outline and writing — the writer opens a document ready to work from, not a skeleton to fill in
- Citation audit prevents hallucinated sources from undermining the writer's credibility
- Cross-project prompting during framing lets the writer draw connections the agent cannot see

**Negative:**
- Three-phase conversation may feel long (mitigated: bounded at 30-60 minutes per ADR-012)
- Novelty signal detection depends on artifact quality — sparse or formulaic artifacts produce sparse signals
- Non-formulaic outline means quality varies — but that reflects actual insight quality, not a methodology failure
- The journey review depends on the user's recall of their experience. The artifacts serve as external memory cues (the agent points to specific moments), but subjective experience — what felt surprising, what shifted understanding — degrades over time. Synthesis works best relatively close to the cycle, not months later

**Neutral:**
- The five novelty signals are a detection heuristic, not a guarantee — the agent may miss signals or surface false positives; user reactions correct for this
