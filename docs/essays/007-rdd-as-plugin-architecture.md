# RDD as Plugin: From Monolithic Skills to a Four-Layer Architecture
*2026-03-18*

## Abstract

Research-Driven Development currently operates as a collection of nine monolithic skills, each responsible for orchestration, specialist work, artifact production, and cross-cutting enforcement simultaneously. This essay investigates whether the Claude Code plugin architecture — which separates concerns into skills (orchestration), agents (isolated specialist work), hooks (passive enforcement), and commands (entry points) — offers a principled restructuring path. Through analysis of the official plugin specification, the hyperpowers reference implementation, and a detailed mapping of RDD's current responsibilities against the four-layer model, the investigation concludes that extracting six specialist agents, five cross-cutting hooks, and a skill-activator mechanism would extend RDD's existing artifact-mediated communication pattern to specialist work, enable model-appropriate task routing, and eliminate repeated logic across phase skills. The migration path from the current skill-only structure to a publishable plugin under the `nrgforge/rdd` repository is tractable: the artifact corpus is self-contained, the plugin format accommodates it directly, and the restructuring can proceed incrementally without breaking the existing pipeline.

## The Problem: Monolithic Phase Skills

Each RDD phase skill currently carries four distinct responsibilities:

1. **Orchestration** — sequencing steps, managing user interaction, routing to the next phase
2. **Specialist work** — citation checking, argument analysis, literature synthesis, codebase scanning
3. **Artifact production** — writing essays, ADRs, scenarios, system designs
4. **Cross-cutting enforcement** — reading invariants before acting, regenerating ORIENTATION.md, checking document sizing

This conflation creates three problems. First, specialist work communicates with the orchestration layer through conversation context — an ephemeral, uninspectable medium — rather than through artifacts, which is how RDD phases already communicate with each other. When a citation audit runs inline, its findings exist only in the conversation; they cannot be reviewed later, referenced by future cycles, or read independently of the session that produced them. With 1M token context windows, this is not primarily a space constraint — it is an architectural inconsistency. RDD communicates between phases via durable artifacts (essays, domain models, ADRs); specialist work within a phase should follow the same pattern. Second, all work runs at whatever model the user has selected, even when mechanical tasks (scanning, regenerating) would perform adequately on a smaller, faster model. Third, cross-cutting logic — invariant checking, epistemic gate reminders, orientation regeneration — is copy-pasted across multiple skills, creating maintenance burden and drift risk.

## The Plugin Architecture as Design Pattern

The Claude Code plugin specification separates concerns into four layers, each with distinct execution characteristics.

**Skills** are directories containing a `SKILL.md` file. They activate automatically based on task context or are invoked by name. Skills run in the main conversation context, have full access to conversation history, and handle user interaction directly. Their natural role is orchestration — sequencing steps, making decisions, guiding the user through a process.

**Agents** (subagents) are markdown files with YAML frontmatter that run in isolated context windows. Each agent receives a custom system prompt, restricted tool access, and a model selection independent of the main conversation. Agents cannot spawn other agents. Their natural role is specialist work — self-contained tasks that read input artifacts, perform analysis or generation, and produce output artifacts. The agent's isolation makes artifacts the natural communication medium: the agent has no conversation history to fall back on, so everything it needs must come from files, and everything it produces must go to files.

**Hooks** are JSON-configured event handlers that fire on system events (PreToolUse, PostToolUse, UserPromptSubmit, Stop, SessionStart, SubagentStart, SubagentStop, and others). Hook scripts receive structured JSON on stdin and can block operations, inject context, or trigger side effects. Their natural role is passive enforcement — cross-cutting concerns that should apply regardless of which skill or agent is active.

**Commands** are simple markdown entry points, now considered legacy in favor of skills.

The hyperpowers plugin demonstrates this separation in practice. Its test-runner agent runs on Haiku, captures all test output internally, and returns only summary statistics plus failure details — a pattern of asymmetric verbosity where success is compressed and failure is preserved in full. Its skill-activator hook fires on every UserPromptSubmit, matches against keyword and intent patterns, and suggests relevant skills before the agent responds. Its Stop hook reminds about TDD and verification without embedding that logic in every workflow skill.

## Mapping RDD to the Four Layers

### What Becomes an Agent

Six pieces of specialist work currently embedded in RDD skills have the properties that make agent extraction beneficial: they operate on well-defined input artifacts, they produce output that should be durable and inspectable (not ephemeral conversation content), and they can run on a model appropriate to their complexity rather than inheriting the orchestrator's model.

The **citation auditor** currently runs inline during research and synthesis phases. It checks every reference in an essay against verifiable sources — a thorough process that generates substantial trace output. As an agent running on Sonnet, it reads the essay file and research log, performs verification in its own context, and writes an audit report artifact: total references checked, verified count, and a prioritized list of issues (reference not found, claim-source mismatch, missing seminal work) with specific line numbers and recommendations. The phase skill reads this audit artifact and acts on it.

The **argument auditor** follows the same pattern. It reads the essay and its evidence trail (research log, prior findings), maps inferential chains from evidence to conclusions, and writes an audit report artifact with prioritized issues — logical gaps, hidden assumptions, overreaching claims.

The **literature reviewer** is web-search-intensive. As an agent on Sonnet, it receives a research question, performs systematic searches, evaluates source quality, and writes a synthesis narrative with citations to the research log. The raw search results and source evaluations stay in agent context; the durable output is the log entry.

The **conformance scanner** performs mechanical comparison of the codebase against ADR declarations. As an agent on Sonnet, it reads ADRs and writes a debt table artifact mapping each decision to conformance status with file:line references for violations.

The **orientation writer** regenerates ORIENTATION.md from the current artifact state — a synthesis task that reads multiple files and writes one output. As an agent on Sonnet, it reads the current artifact inventory and produces an updated ORIENTATION.md directly.

The **spike runner** already has the properties of an isolated agent: it works in a scratch directory, answers a single focused question, and its code is deleted after findings are recorded. As an agent inheriting the parent model, it receives a spike question and writes prose findings to the research log.

### What Stays in Skills

Phase orchestration, epistemic gate conversations, ADR writing, scenario authoring, and system design composition all require sustained access to conversation context, user interaction, and the accumulated understanding that builds through a phase. These remain in skills.

The key principle: if the work requires back-and-forth with the user or benefits from seeing the full conversation history, it belongs in a skill. If the work reads input artifacts, produces output artifacts, and communicates results through files rather than conversation, it belongs in an agent.

### What Becomes a Hook

Five cross-cutting concerns currently replicated across skills can be enforced passively through hooks.

An **invariant reminder** hook fires on PreToolUse when Write or Edit targets files in `docs/`. It reminds the agent to verify against domain-model.md invariants before modifying artifacts. This replaces the "read invariants first" instruction currently duplicated in every phase skill.

An **epistemic gate enforcer** fires on Stop events during RDD phases. If the agent attempts to stop without having conducted the epistemic gate conversation, the hook injects a reminder. This prevents the most common failure mode: a phase completing without the mandatory user-generation step.

A **skill activator** fires on UserPromptSubmit. It matches RDD-related keywords and intent patterns, suggests the appropriate phase skill, and — critically — injects context that prevents the superpowers brainstorming skill from intercepting explicit RDD requests. This solves the priority conflict where "use RDD" triggers brainstorming instead of RDD research.

An **orientation trigger** fires on PostToolUse when Write targets key artifacts (system-design.md, domain-model.md, scenarios.md). It signals that ORIENTATION.md should be regenerated, dispatching the orientation-writer agent.

A **document sizing check** fires on PostToolUse when Write targets any file in `docs/`. It flags documents that exceed the sizing heuristics (the five cascading rules defined in the orchestrator), catching bloat before it propagates.

## Agent Design: Artifacts as Interface

RDD already communicates between phases through artifacts. The research phase produces an essay; the model phase reads it. The decide phase produces ADRs; the architect phase reads them. No phase passes its understanding to the next via conversation context — the artifact IS the interface.

Agent extraction extends this pattern to specialist work within a phase. A citation auditor agent reads the essay file and the research log file, performs its analysis, and writes a structured report to an audit artifact. The phase skill then reads that audit artifact. The communication medium is the same one RDD already uses between phases: durable, inspectable files.

This matters more than context savings. With 1M token context windows, a citation audit's trace output is not a space crisis. But an audit report that exists only in conversation context is ephemeral — it cannot be reviewed later, referenced by future cycles, or read independently of the session that produced it. An audit report written to `docs/essays/audits/citation-audit-007.md` is addressable, persistent, and inspectable. It becomes part of the artifact trail.

The hyperpowers plugin's test-runner agent demonstrates a related pattern — asymmetric verbosity, where success is compressed and failure is preserved in full. For RDD's agents, the principle is similar but artifact-mediated: the agent produces a structured report (summary counts, prioritized issues with locations, evidence, and recommendations), and the full analysis trace remains available if the agent is resumed for follow-up.

The phase skill routes the report appropriately: P1 issues get fixed immediately in the artifact, P2 issues surface at the epistemic gate for user judgment, P3 issues may be noted or deferred.

Agents must receive sufficient upstream context through files, not conversation. A citation auditor checking an essay needs the research log (the evidence trail) as a file reference, not a context blob. An argument auditor needs the research findings that the essay's claims rest on. The agent reads these files directly — it has no conversation history to fall back on, which makes the file-based communication pattern not just preferable but necessary.

## The Plugin Structure

The target repository structure for `nrgforge/rdd`:

```
rdd/
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
│   ├── decisions/
│   ├── essays/
│   └── references/
└── CHANGELOG.md
```

The plugin manifest requires only a name. The `rdd` name provides clean namespacing: `/rdd:research`, `/rdd:decide`, `/rdd:build`. Skills, agents, and hooks are auto-discovered from their default directories.

The self-referential artifact corpus ships with the plugin. At approximately 800KB, this is negligible for distribution. The corpus serves three audiences: plugin users get ORIENTATION.md and the field guide as operational reference; contributors get the full decision trail (ADRs, essays, research logs) for understanding design rationale; and the corpus itself demonstrates that RDD works by showing the complete trail of its own development.

Over time, the conformance audit's graduation operation — already defined as a capability of `/rdd-conform` — can condense process artifacts (reflections, research logs) into reference material, reducing the corpus to its durable core. This is a natural lifecycle, not a migration crisis.

## Security Constraints and Workarounds

Plugin-provided agents cannot define hooks, MCP servers, or permission modes in their frontmatter — a security constraint enforced by the Claude Code runtime. For RDD's agents, this is acceptable because the constraints are behavioral rather than security-critical.

The citation auditor and argument auditor are read-only by nature: they analyze text and return findings. The orientation writer targets a single file. The spike runner's directory constraint (operate only in `./scratch/spike-*/`) can be enforced through its system prompt — agents follow their prompts reliably, and the worst case for a prompt violation (writing a file in the wrong directory) is recoverable.

If hard enforcement becomes necessary — for instance, if the spike runner is extended to run untrusted code — plugin-level PreToolUse hooks in `hooks/hooks.json` can validate Bash commands against directory patterns. The hook fires for all agents but can discriminate by inspecting tool input patterns. This is less elegant than per-agent hooks but provides mechanical enforcement when prompt-based constraints are insufficient.

## The Brainstorming Override

The most immediately felt friction in the current system is the conflict between the superpowers brainstorming skill and explicit RDD requests. When a user says "use RDD," the brainstorming mandate intercepts because it fires before any domain-specific skill check.

The solution operates at two levels. The RDD plugin ships a UserPromptSubmit hook that detects RDD-related patterns ("use RDD," "RDD research," "/rdd") and injects additional context: "The user has explicitly requested an RDD workflow. RDD research serves as the brainstorming/exploration phase. Proceed directly to the requested RDD phase." This is self-contained — no changes to superpowers required. However, hook ordering between plugins is not guaranteed by the Claude Code runtime, so this mechanism may be fragile if another plugin's hook fires first and claims the interaction.

The principled fix, proposed as an upstream change to superpowers, is a general rule: if the user explicitly names a skill or workflow, that request takes precedence over the brainstorm-first requirement. This is not RDD-specific. Any plugin that includes its own exploration or design phase would benefit from the same principle. The user's explicit intent should override default process — this is consistent with the superpowers system's own instruction priority hierarchy, which places user instructions above skill mandates.

## Migration Path

The restructuring proceeds incrementally:

1. **Create the `nrgforge/rdd` repository** with the plugin directory structure and manifest.
2. **Copy existing skills** unchanged. The pipeline works today; the first release should preserve that.
3. **Extract agents** from existing skills. Start with citation-auditor and argument-auditor (highest-impact, clearest boundary). Update the research, decide, and synthesis skills to dispatch to agents instead of invoking skills inline.
4. **Implement hooks.** Start with the skill-activator (solves the brainstorming override immediately) and the epistemic gate enforcer (prevents the most common failure mode).
5. **Move the artifact corpus.** Copy `docs/` as-is. Update ORIENTATION.md to reflect the plugin structure.
6. **Test** by installing via `claude --plugin-dir` and running a full RDD cycle. Verify that agents return structured reports, hooks fire at the right events, and skill namespacing works.
7. **Publish** to a marketplace for installation.

Each step produces a working system. The pipeline never breaks because skills continue to work; agents and hooks are additive improvements. Agent dispatch does add latency — spinning up a new context, loading the system prompt, performing the work, and returning results takes longer than inline execution. For RDD's use cases, the benefits — durable audit artifacts, model-appropriate task routing, and cross-cutting enforcement via hooks — outweigh this cost, but the tradeoff should be measured during testing.

## What This Essay Does Not Address

Several questions remain open for downstream phases:

- **The research log archival timing** — the current research skill archives the previous cycle's log at the start of the next cycle, rather than at the end of the current one. This should be corrected so logs are archived as part of the cycle that produced them.
- **Agent memory** — subagents support persistent memory directories. Should RDD's agents accumulate knowledge across cycles? The conformance scanner might benefit from remembering prior scan results; the citation auditor might cache verified references.
- **Cross-project synthesis** — the plugin architecture opens the possibility of portfolio-level RDD, where multiple projects share agents and accumulated knowledge. This is described but not operationalized in the current system.
- **The `using-superpowers` upstream change** — proposing Option D (explicit user requests override default process) requires engagement with the superpowers maintainer.

## Sources

- Claude Code Plugins Reference. https://code.claude.com/docs/en/plugins-reference
- Claude Code Subagents. https://code.claude.com/docs/en/sub-agents
- Claude Code Plugins (creation guide). https://code.claude.com/docs/en/plugins
- Claude Code Plugin Marketplaces. https://code.claude.com/docs/en/plugin-marketplaces
- Hyperpowers plugin (Ryan Stortz). https://github.com/withzombies/hyperpowers
