# Research Log: RDD Plugin Architecture

## Question 1: What is the Claude Code plugin format, and how do agents, hooks, commands, and skills relate?

**Method:** Web fetch of hyperpowers repo, official Claude Code docs (plugins-reference, sub-agents)

**Findings:**

A Claude Code plugin is a self-contained directory with this canonical structure:

```
my-plugin/
├── .claude-plugin/
│   └── plugin.json          # Manifest (only required field: name)
├── skills/                  # Directories with SKILL.md
│   └── my-skill/
│       └── SKILL.md
├── commands/                # Simple markdown files (legacy; use skills/)
├── agents/                  # Markdown files with YAML frontmatter
│   └── my-agent.md
├── hooks/
│   └── hooks.json           # Event handlers
├── scripts/                 # Hook and utility scripts
├── settings.json            # Default settings when plugin is enabled
├── .mcp.json                # MCP server definitions
└── .lsp.json                # LSP server configs
```

Key architectural distinctions:

1. **Skills** = orchestration workflows. Directories with `SKILL.md`. Invoked via `/pluginName:skillName`. Can include supporting files. Activate automatically based on task context OR are invoked by name.

2. **Agents** (subagents) = isolated specialist workers. Markdown files with YAML frontmatter. Run in their own context window with: custom system prompt, restricted tool access, model selection (`model: haiku|sonnet|opus|inherit`), optional hooks scoped to agent lifecycle, optional persistent memory, optional MCP servers, optional skill preloading via `skills` field, and `isolation: worktree` for git-isolated work. Cannot spawn other subagents.

3. **Hooks** = passive event handlers. JSON config mapping events to shell commands, prompts, or agent verifiers. Events include: PreToolUse, PostToolUse, UserPromptSubmit, Stop, SessionStart, SubagentStart, SubagentStop, PreCompact, PostCompact, TaskCompleted, and more.

4. **Commands** = simple markdown entry points (legacy; skills are preferred).

Plugin manifest (`plugin.json`) requires only `name`. Environment variables `${CLAUDE_PLUGIN_ROOT}` (install dir) and `${CLAUDE_PLUGIN_DATA}` (persistent data dir) available for path references.

Security constraint: Plugin-provided agents cannot use `hooks`, `mcpServers`, or `permissionMode` frontmatter. Workaround: define hooks at plugin level in `hooks/hooks.json`.

**Hyperpowers reference implementation:**
- Skills orchestrate multi-step workflows
- Agents handle isolated specialist tasks (test-runner on Haiku, code-reviewer on Sonnet)
- A `UserPromptSubmit` hook (`skill-activator.js`) reads user input, matches against `skill-rules.json` patterns, and suggests relevant skills
- `PostToolUse` hooks track file edits
- `Stop` hooks deliver reminders (TDD, verification)
- test-runner agent implements "asymmetric verbosity" — captures all output, returns only summary + failures

**Implications:** RDD maps naturally to this architecture. The agent model solves context bloat — citation audits and argument audits can run as agents. Hooks can enforce cross-cutting concerns (invariant checks, epistemic gate reminders) without embedding them in every skill. The `skills` frontmatter field means agents can be pre-loaded with RDD domain knowledge.

## Question 2: What RDD work should delegate to agents vs. stay in skills?

**Method:** Analytical — mapping current responsibilities against the 4-layer model

**Findings:**

Each RDD phase skill currently does everything: reads upstream artifacts, orchestrates workflow, does specialist work, produces output, and runs epistemic gates. This creates context bloat and prevents model optimization.

### Proposed agent extractions

| Agent | Current location | Why delegate | Model |
|-------|-----------------|--------------|-------|
| `citation-auditor` | `/citation-audit` skill called inline | Produces large output, summary is what matters | sonnet |
| `argument-auditor` | `/argument-audit` skill called inline | Analyzes full essay + evidence trail, returns prioritized issues | sonnet |
| `lit-reviewer` | `/lit-review` skill called inline | Web search heavy, produces synthesis | sonnet |
| `conformance-scanner` | `/rdd-decide` Step 3.5, `/rdd-conform` | Mechanical codebase scanning against ADRs | sonnet |
| `orientation-writer` | Multiple phases | Regenerates ORIENTATION.md, mechanical synthesis | sonnet |
| `spike-runner` | `/rdd-research` | Runs in scratch dir, deleted after — natural isolation | inherit |

### Proposed hooks

| Hook | Event | Purpose |
|------|-------|---------|
| Invariant reminder | `PreToolUse` (Write/Edit on docs/) | Check domain-model.md invariants |
| Epistemic gate enforcer | `Stop` | Remind about gate before stopping during RDD phase |
| Skill activator | `UserPromptSubmit` | Match RDD-related prompts to phase skills |
| Orientation trigger | `PostToolUse` (Write on key artifacts) | Trigger ORIENTATION.md regeneration |
| Sizing check | `PostToolUse` (Write on docs/) | Flag documents exceeding sizing heuristics |

### What stays in skills (not delegated)

- Epistemic gate conversations (require sustained user interaction)
- ADR writing (deeply contextual)
- Scenario writing (requires domain model understanding + user validation)
- System design composition (needs coherent vision)
- Phase workflow orchestration
- Backward propagation coordination

**Implications:** Biggest wins are citation-auditor, argument-auditor, and lit-reviewer — highest-volume isolated tasks. The spike-runner is a natural fit. Hooks solve the "every skill repeats cross-cutting logic" problem.

## Question 3: What's the migration path from current skills to plugin structure?

**Method:** Analytical

**Findings:**

### Current state
- 9 RDD skills in `~/.claude/skills/rdd-*` and `~/.claude/skills/rdd/`
- 3 supporting skills (`citation-audit`, `argument-audit`, `lit-review`)
- 55 artifact files in `~/.claude/skills/rdd/docs/` (~796 KB)

### Target plugin structure

```
research-driven-development/
├── .claude-plugin/
│   └── plugin.json
├── skills/
│   ├── rdd/SKILL.md              # Orchestrator
│   ├── rdd-research/SKILL.md
│   ├── rdd-product/SKILL.md
│   ├── rdd-model/SKILL.md
│   ├── rdd-decide/SKILL.md
│   ├── rdd-architect/SKILL.md
│   ├── rdd-build/SKILL.md
│   ├── rdd-synthesis/SKILL.md
│   └── rdd-conform/SKILL.md
├── agents/
│   ├── citation-auditor.md
│   ├── argument-auditor.md
│   ├── lit-reviewer.md
│   ├── conformance-scanner.md
│   ├── orientation-writer.md
│   └── spike-runner.md
├── hooks/
│   ├── hooks.json
│   └── scripts/
│       ├── skill-activator.js
│       ├── invariant-reminder.sh
│       ├── epistemic-gate.sh
│       └── sizing-check.sh
├── settings.json
├── docs/                          # Self-referential artifact corpus
│   ├── ORIENTATION.md
│   ├── domain-model.md
│   ├── system-design.md
│   ├── product-discovery.md
│   ├── roadmap.md
│   ├── scenarios.md
│   ├── decisions/ (30 ADRs)
│   ├── essays/ (6 essays + reflections + logs)
│   └── references/field-guide.md
└── CHANGELOG.md
```

### Migration sequence

1. Create repo (`nrgforge/research-driven-development`)
2. Move skills — copy SKILL.md files, update cross-references for plugin namespacing
3. Extract agents — convert citation-audit, argument-audit, lit-review skills into agent definitions; create new agents
4. Create hooks — implement skill-activator, invariant-reminder, epistemic-gate-enforcer, sizing-check
5. Move artifact corpus — copy docs/ as-is
6. Update skill cross-references — skills that call `/citation-audit` now dispatch to agents
7. Add plugin manifest and settings.json
8. Test — install via `claude --plugin-dir` and run a full RDD cycle

### Open questions

1. **Namespacing**: `rdd` (short: `/rdd:research`) vs `research-driven-development` (verbose)?
2. **Artifact corpus**: Should docs/ ship with the plugin or live separately?
3. **Agent return detail**: How much should auditor agents summarize vs. return full analysis?
4. **Hook security**: Plugin agents can't use hooks/mcpServers/permissionMode in frontmatter — must use plugin-level hooks.json instead.
5. **Brainstorming override**: When user says "use RDD," superpowers brainstorming intercepts. Needs fix in skill-activator or superpowers system.

## Question 4: How does the plugin repo work, and what happens to non-skill files like docs/?

**Method:** Web fetch of official Claude Code docs (plugins, plugin-marketplaces)

**Findings:**

Plugin distribution works through **marketplaces** — git repos containing a `.claude-plugin/marketplace.json` that catalogs available plugins. When a user installs a plugin, Claude Code **copies the entire plugin directory** to a local cache at `~/.claude/plugins/cache/`. The plugin must be self-contained — it cannot reference files outside its directory.

Key mechanics:
- Marketplace repos are cloned; individual plugins within them are copied to cache
- **Everything** in the plugin directory gets copied — skills, agents, hooks, AND any other files (including `docs/`)
- Version bumps trigger re-copying; cache is the working copy
- `${CLAUDE_PLUGIN_DATA}` provides a persistent data directory that survives updates (for generated state, caches, etc.)

**What this means for RDD's docs/ corpus:**

The ~796KB artifact corpus (30 ADRs, 6 essays, scenarios, domain model, etc.) would ship with every plugin installation. This is the plugin's own design documentation — unusual but not problematic for distribution. However, there are three audiences:

1. **Plugin users** — need ORIENTATION.md and field-guide.md (operational reference). Don't need ADRs, essays, or research logs.
2. **Plugin contributors** — need the full corpus to understand design decisions and extend RDD.
3. **Historical record** — the self-referential corpus IS the proof that RDD works.

**Recommendation:** Ship the full corpus in the plugin repo (contributors need it). It adds ~800KB to the cache, which is negligible. If size becomes a concern later, the build-phase graduation process (already defined in `/rdd-conform`) can migrate durable knowledge into the skills themselves and archive the rest.

The user's instinct about graduation is sound: essays, reflections, and research logs are process artifacts that can graduate into condensed reference material over time. The conformance audit's graduation operation already handles this.

**Implications:** The plugin name should be `rdd` (user preference confirmed). The repo is `nrgforge/rdd`. The marketplace entry points to this repo. Users install via `/plugin install rdd@nrgforge`.

## Question 5: How much detail should auditor agents return vs. summarize?

**Method:** Analytical — informed by hyperpowers' asymmetric verbosity pattern and current audit skill behavior

**Findings:**

The core pattern from hyperpowers' test-runner: **asymmetric verbosity** — capture everything internally, return only what the caller needs to act. The test-runner keeps full output in its context but returns only summary statistics + complete failure details.

For RDD's auditor agents, the same principle applies but with a domain-specific twist: the caller (the phase skill) needs enough detail to either (a) fix issues inline or (b) present them to the user at the epistemic gate. The agent should NOT return the full analysis trace.

**Proposed return structure for citation-auditor:**

```markdown
## Citation Audit Summary
- **Total references checked:** 14
- **Verified:** 11
- **Issues found:** 3

### Issues (by priority)

#### P1: Reference does not exist
- [Line 47] "Smith et al., 2024, Journal of X" — no matching publication found
  - **Recommendation:** Remove or replace with [verified alternative]

#### P2: Claim-source mismatch
- [Line 83] Claim: "X increases performance by 40%" — source says "up to 30%"
  - **Recommendation:** Soften to "up to 30%" per source

#### P3: Missing seminal work
- Section on event sourcing doesn't cite Fowler (2005) — foundational reference
  - **Recommendation:** Add citation in context paragraph
```

**Proposed return structure for argument-auditor:**

```markdown
## Argument Audit Summary
- **Logical gaps found:** 2
- **Hidden assumptions:** 1
- **Overreaching claims:** 3

### Issues (by priority)

#### P1: Logical gap
- [Section 3 → Section 4] Conclusion that "X follows from Y" but the essay doesn't establish the causal link.
  - **Evidence in research log:** Question 2 findings suggest Z, not Y.
  - **Recommendation:** Add bridging argument or soften to correlation.

#### P2: Overreaching claim
- [Line 62] "This approach eliminates the problem" — evidence supports "reduces" not "eliminates"
  - **Recommendation:** Replace "eliminates" with "substantially reduces"
```

The phase skill receives this structured report and can:
1. Fix P1 issues immediately (in the essay)
2. Present P2/P3 issues to the user during the epistemic gate for judgment
3. Skip the full analysis trace (which stays in the agent's context)

**For lit-reviewer:** Return the synthesis narrative (what was learned, key sources, implications) — this IS the deliverable. But keep the raw search results and source evaluation in agent context.

**For conformance-scanner:** Return a debt table (ADR → codebase conformance status) with specific file:line references for violations. Keep the full scan trace in agent context.

**Implications:** The agent definitions should specify these return formats in their system prompts. The phase skills need to be updated to consume structured reports rather than running the audit inline.

## Question 6: What are the implications of plugin agents not being able to define their own hooks?

**Method:** Analytical — informed by official Claude Code docs on plugin security constraints

**Findings:**

The constraint: "Plugin subagents do not support the `hooks`, `mcpServers`, or `permissionMode` frontmatter fields. These fields are ignored when loading agents from a plugin."

This affects two proposed agents:
1. **spike-runner** — ideally would have a PreToolUse hook to validate that Bash commands only operate in `./scratch/spike-*` directories
2. **conformance-scanner** — might benefit from PostToolUse hooks to track what it scans

**Workarounds:**

1. **Plugin-level hooks with SubagentStart/SubagentStop matchers.** The `hooks/hooks.json` at plugin root can define hooks that fire when specific agents start/stop. This handles setup/teardown but not per-tool-call validation during agent execution.

2. **Plugin-level PreToolUse hooks that check agent context.** Hook scripts receive JSON on stdin. While they don't directly know which agent is running, the `${CLAUDE_AGENT_NAME}` env var (if available) or tool input patterns can discriminate. For example: a PreToolUse hook on Bash that only blocks when the command targets directories outside `./scratch/`.

3. **User copies agent to `~/.claude/agents/`.** Non-plugin agents DO support hooks in frontmatter. The docs suggest this workaround explicitly. Power users who need hook-scoped agents can copy the agent file out of the plugin.

4. **Encode constraints in the agent's system prompt instead.** Rather than a hook that blocks dangerous commands, the agent's system prompt instructs it to only operate in specific directories. Less enforceable but simpler. For a well-crafted agent prompt, this is usually sufficient — agents follow their prompts reliably.

**Practical assessment:** For RDD's agents, option 4 (prompt-based constraints) is sufficient for most cases. The spike-runner should be told in its system prompt to only create files in `./scratch/spike-*/` and delete them after. The citation-auditor and argument-auditor are read-only by nature (they analyze, not modify). The orientation-writer only writes to `ORIENTATION.md`. Prompt constraints are adequate here.

If hard enforcement is needed later, option 2 (plugin-level PreToolUse hooks with pattern discrimination) provides it without requiring users to copy agent files.

**Implications:** Start with prompt-based constraints in agent definitions. Add plugin-level PreToolUse hooks only for operations that must be mechanically enforced (e.g., preventing accidental writes outside designated directories).

## Question 7: How can the brainstorming override problem be handled?

**Method:** Analytical — informed by hyperpowers' skill-activator pattern and Claude Code hook mechanics

**Findings:**

The problem: The `superpowers:using-superpowers` skill mandates brainstorming "before any creative work." When a user says "use RDD," the brainstorming skill intercepts, adding unnecessary friction.

**Option A: UserPromptSubmit hook in RDD plugin**

The RDD plugin's `hooks/hooks.json` includes a `UserPromptSubmit` hook that detects RDD-related keywords ("use RDD", "RDD research", "/rdd", etc.) and injects `additionalContext` stating:

```
The user has explicitly requested an RDD workflow. RDD research serves as the
brainstorming/exploration phase. Proceed directly to the requested RDD phase
without invoking superpowers:brainstorming.
```

This context is seen by the agent before it decides to invoke brainstorming. The hook fires on every user prompt but only adds context when RDD patterns are detected.

**Pros:** Self-contained within the RDD plugin. No changes to superpowers needed.
**Cons:** Relies on the agent respecting additionalContext over the brainstorming mandate. Could be fragile if superpowers' mandate is strongly worded.

**Option B: Modify superpowers:using-superpowers to recognize equivalent phases**

Add to the using-superpowers skill:

```markdown
## Skills That Satisfy the Brainstorm-First Requirement

The following skills serve as the brainstorming/exploration phase for their
respective domains. If one of these is being invoked, it satisfies the
brainstorm-first requirement:

- rdd:rdd-research — Research-Driven Development research phase
- rdd:rdd — RDD orchestrator (routes to appropriate phase)
```

**Pros:** Clean, explicit, authoritative. Works regardless of hook ordering.
**Cons:** Requires modifying a skill the user doesn't own (superpowers is a third-party plugin). Creates a coupling between superpowers and RDD.

**Option C: Priority-based skill activation**

The RDD plugin's skill-activator hook assigns `critical` priority to RDD skills when RDD keywords are detected, matching the priority level used by superpowers' own critical skills (TDD, verification). The skill activator outputs both skills as options but with RDD first.

**Pros:** Works within the existing priority system.
**Cons:** Still leaves the final decision to the agent; brainstorming may still intercept.

**Option D: Modify using-superpowers to recognize explicit user requests**

Add a general rule: "If the user explicitly names a skill or workflow, that request takes precedence over the brainstorm-first requirement." This isn't RDD-specific — it's a general principle that the user's explicit intent overrides default process.

**Pros:** General solution. Benefits any plugin that has its own exploration phase.
**Cons:** Still requires modifying superpowers.

**Recommendation:** Use **Option A + Option D together**. Option A is immediate and self-contained (ship it with the RDD plugin). Option D is the principled fix that should be proposed upstream to superpowers. The two aren't mutually exclusive — A handles RDD's needs now, D prevents the problem for all plugins.

For Option A, the hook implementation:

```json
{
  "hooks": {
    "UserPromptSubmit": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "${CLAUDE_PLUGIN_ROOT}/hooks/scripts/skill-activator.js"
          }
        ]
      }
    ]
  }
}
```

The `skill-activator.js` reads stdin JSON, checks for RDD patterns, and returns additionalContext when matched.

**Implications:** The RDD plugin should ship with a UserPromptSubmit hook. Additionally, the using-superpowers skill should be updated with the general principle from Option D — propose this as an upstream change.

## Sources

- Claude Code Plugins Reference: https://code.claude.com/docs/en/plugins-reference
- Claude Code Subagents: https://code.claude.com/docs/en/sub-agents
- Claude Code Plugins (creation): https://code.claude.com/docs/en/plugins
- Claude Code Plugin Marketplaces: https://code.claude.com/docs/en/plugin-marketplaces
- Hyperpowers plugin: https://github.com/withzombies/hyperpowers
