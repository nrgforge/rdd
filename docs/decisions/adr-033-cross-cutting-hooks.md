# ADR-033: Cross-Cutting Hooks at Plugin Level

**Status:** Proposed

## Context

Five cross-cutting concerns are currently duplicated across multiple RDD phase skills: reading invariants before modifying artifacts, enforcing epistemic gates before phase completion, suggesting the appropriate phase skill, triggering ORIENTATION.md regeneration, and checking document sizing. This duplication creates maintenance burden and drift risk — when one skill is updated, the others may not follow.

Claude Code's hook system provides passive event handlers that fire on system events (PreToolUse, PostToolUse, UserPromptSubmit, Stop, etc.). Hooks are configured in `hooks/hooks.json` at the plugin root and apply across all skills and agents in the plugin.

Plugin-provided agents cannot define hooks in their own frontmatter (Claude Code security constraint). All hooks must therefore live at the plugin level. This is not a current limitation for any proposed specialist subagent but constrains future designs.

## Decision

Implement five hooks in `hooks/hooks.json`:

| Hook | Event | Matcher | Purpose |
|------|-------|---------|---------|
| Invariant reminder | PreToolUse | Write\|Edit on `docs/` | Remind agent to check domain-model.md invariants before modifying artifacts |
| Epistemic gate enforcer | Stop | — | If in an RDD phase, remind about epistemic gate before stopping |
| Skill activator | UserPromptSubmit | — | Match RDD-related prompts, suggest appropriate phase skill (see ADR-035) |
| Orientation trigger | PostToolUse | Write on key artifacts | Remind the orchestrating agent to dispatch the orientation-writer subagent after system-design.md, domain-model.md, or scenarios.md changes |
| Document sizing check | PostToolUse | Write on `docs/` | Flag documents exceeding sizing heuristics |

Hook scripts live in `hooks/scripts/` and receive structured JSON on stdin per Claude Code's hook specification.

## Consequences

**Positive:**
- Cross-cutting logic maintained in one place instead of duplicated across nine skills
- Hooks fire passively — no skill needs to remember to call them
- New cross-cutting concerns can be added without modifying skills

**Negative:**
- Hook scripts must be maintained and tested
- Hook ordering between plugins is not guaranteed

**Neutral:**
- The epistemic gate enforcer uses reminder injection rather than blocking. Claude Code's Stop hooks support exit code 2 (blocking), but blocking a Stop event would prevent the agent from completing at all — the desired behavior is to resume the phase with a gate reminder, not to prevent completion indefinitely. This is a design choice, not a capability limit. The tension with Invariant 2 ("no phase transition may consist solely of approval") is acknowledged: the hook can remind but cannot guarantee compliance. Enforcement ultimately depends on the agent respecting the reminder
