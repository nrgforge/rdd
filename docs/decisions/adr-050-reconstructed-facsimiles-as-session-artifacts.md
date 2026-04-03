# ADR-050: Reconstructed Facsimiles as Written Session Artifacts

**Status:** Proposed

## Context

In context-reconstructive mode, the build skill produces lightweight versions of what upstream phases normally provide: stakeholder context (from discover), vocabulary (from model), testable behaviors (from decide), and work decomposition (from architect/roadmap). These are Reconstructed Facsimiles — enough to orient and operate, not full pipeline artifacts.

The product discovery value tension (Cycle 6) identifies the design choice: "These could be ephemeral (part of the conversation) or written as lightweight session artifacts that stewardship can check against. The roadmap reconstruction is the most consequential — without work packages, the build loop has nothing to iterate through."

Two forces pull in opposite directions. Conversation-only facsimiles are simple but vulnerable to context compression in long sessions — exactly the sessions where stewardship needs a stable reference. Written facsimiles are durable but risk polluting the permanent artifact trail with ephemeral session state.

## Decision

Reconstructed facsimiles are **written as lightweight markdown files** during Context Gathering. They are session artifacts — clearly marked as non-permanent, distinct from the RDD artifact trail.

**What gets written:**
- **Work decomposition** (always) — the build loop iterates through these; stewardship checks against them. This is the most consequential facsimile.
- **Orientation summary** (always) — the synthesized answers to the five Orientation Questions, validated by the user. Referenced by stewardship and inner skills.
- **Vocabulary and testable behaviors** (when the session is expected to be substantial) — optional facsimiles that enrich the build context.

**Where they live:** A `session/` directory within the project, gitignored by default. The skill creates it if needed. Files use a frontmatter marker (`session-artifact: true`) to distinguish them from permanent artifacts.

**Lifecycle:** The skill does not automatically clean up session artifacts. After the session, the user decides: discard (the typical case), promote to a permanent artifact (when the facsimile proved valuable enough to keep), or leave in place for future sessions.

**Rejected alternative:** Conversation-only facsimiles (no files). Rejected because: (1) context compression in long sessions can lose the work decomposition the build loop depends on; (2) stewardship checkpoints need a stable reference that survives context compression.

**Note on ADR-031:** Session artifacts are intentionally outside ADR-031's scope. ADR-031 governs artifact-mediated communication for provenance and durability — specialist subagents producing durable, inspectable records. Session artifacts are working-memory externalization, not provenance records. The motivation for writing them to files is pragmatic (surviving context compression), not architectural (provenance durability).

**Rejected alternative:** Write facsimiles to the permanent artifact trail (e.g., `./docs/`). Rejected because: session artifacts are ephemeral by nature — mixing them with permanent artifacts creates cleanup burden and blurs the artifact hierarchy.

## Consequences

**Positive:**
- Stewardship has a stable reference to check against, even in long sessions
- Work decomposition persists through context compression
- Consistent with artifact-mediated communication principles
- Promotion path lets valuable facsimiles become permanent when warranted

**Negative:**
- Requires a `session/` directory convention and gitignore configuration
- Some cleanup effort after sessions (minimal — a few small files)

**Neutral:**
- In pipeline mode, this ADR does not apply — the full artifact corpus provides orientation directly
