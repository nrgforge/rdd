# ADR-035: Skill Activator for Explicit Workflow Requests

**Status:** Proposed

## Context

When a user says "use RDD" or "let's do RDD research," the superpowers brainstorming skill intercepts because it mandates brainstorming "before any creative work." RDD research *is* the brainstorming/exploration phase for RDD workflows — the intercept adds friction without value.

The Claude Code plugin system provides UserPromptSubmit hooks that can inject additional context before the agent responds. The hyperpowers plugin demonstrates this pattern with a skill-activator hook that matches keywords and intent patterns.

Hook ordering between plugins is not guaranteed by the Claude Code runtime. A context-injection approach may be fragile if another plugin's hook fires first. The more reliable fix is an upstream change to superpowers: explicit user requests for a named workflow should override default process.

## Decision

Two-level solution:

1. **Immediate (self-contained):** The RDD plugin ships a UserPromptSubmit hook (the skill activator, ADR-033) that detects RDD-related patterns and injects context: "The user has explicitly requested an RDD workflow. RDD research serves as the brainstorming/exploration phase. Proceed directly to the requested RDD phase."

2. **Upstream (principled):** Propose a general rule to the superpowers system: if the user explicitly names a skill or workflow, that request takes precedence over the brainstorm-first requirement. This is not RDD-specific — any plugin with its own exploration phase benefits.

The upstream change is the durable fix. The hook is the interim mechanism.

## Consequences

**Positive:**
- Users who say "use RDD" get RDD, not brainstorming
- The upstream principle benefits all plugins with exploration phases

**Negative:**
- The hook mechanism depends on the agent respecting injected context over the brainstorming mandate — may be fragile. Hook ordering between plugins is not guaranteed, so there is no fallback if another plugin's hook fires first
- The upstream change requires engagement with the superpowers maintainer
- Until the upstream change lands, users can work around failures by explicitly invoking `/rdd-research` rather than saying "use RDD"

**Neutral:**
- If superpowers is not installed, the hook is unnecessary but harmless
