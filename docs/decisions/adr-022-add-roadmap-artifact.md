# ADR-022: Add Roadmap Artifact with Dependency Classification

**Status:** Proposed

## Context

The system design's current Build Sequence section (Phases 0-3, the prescriptive format this ADR replaces) prescribes implementation order, dictating what to build when. Essay 005 identifies this as the wrong document type for the purpose: developers should own their sequencing decisions (Invariant 0). TOGAF distinguishes between an Architecture Roadmap ("the definition, but not the activities") and an Implementation Plan. RDD has the latter embedded in the system design but lacks the former.

The team lead scoping use case (product discovery) needs to communicate how the work might be approached — which work packages depend on which, what intermediate states look like, where decisions remain open. The solo developer needs enough context to sequence their own build without being told what to do.

## Decision

Add a **Roadmap** document as a Tier 2 artifact in the artifact hierarchy. The roadmap contains:

- **Work packages** — logical groups of changes derived from the system design's module decomposition
- **Classified dependencies** — each dependency edge labeled as hard dependency (structural necessity), implied logic (suggested ordering), or open choice (genuinely independent)
- **Transition states** — intermediate architectures that are coherent on their own
- **Open decision points** — where the builder must choose based on context

The roadmap does not contain: detailed task lists, timelines, step-by-step instructions, or single-commit prescriptions.

The system design links to the roadmap for sequencing context. The system design may still note hard structural dependencies inline (these are architectural facts), but the strategic sequencing view belongs in the roadmap.

The roadmap is a pragmatic artifact (Invariant 3): agent-generated from the system design and ADRs, user-validated, updated reflexively when architecture changes. No epistemic gate is introduced because the roadmap is generated within the ARCHITECT phase, not at a new phase transition (Invariant 2 applies to phase transitions).

## Consequences

**Positive:**
- Developers own their sequencing decisions rather than following prescribed build order
- Team leads can hand off a strategic view of the work alongside the system design
- Dependency classification makes explicit what is structural necessity vs. suggestion vs. choice
- Transition states show that partial progress produces a coherent system

**Negative:**
- One more artifact to maintain (mitigation: reflexive maintenance model, same as orientation document)
- Risk that dependency graphs are read as prescribed build order despite classification (mitigation: explicit classification scheme and framing)
- Requires judgment about which dependencies are hard vs. implied vs. open

**Neutral:**
- If the system design contains a Build Sequence section, it becomes a link to the roadmap rather than inline content. If not, the roadmap is linked from the system design without replacing any existing content
- Roadmap generation becomes part of the ARCHITECT phase output
