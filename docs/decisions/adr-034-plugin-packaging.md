# ADR-034: Package RDD as Plugin `rdd` under `nrgforge`

**Status:** Proposed

## Context

RDD currently exists as standalone skills in `~/.claude/skills/`, requiring manual file management for installation and updates. The Claude Code plugin system provides a distribution mechanism: plugins are self-contained directories with auto-discovered skills, agents, hooks, and artifact files. Plugins are installed from marketplaces, versioned with semver, and copied to a local cache (`~/.claude/plugins/cache/`).

The plugin name determines skill namespacing. The Claude Code runtime uses hyphen separators — a plugin named `rdd` with a skill directory `research/` produces `/rdd-research`. (Earlier drafts assumed colon separators `/rdd:research`; this was corrected during build when testing revealed the actual runtime behavior.) The self-referential artifact corpus (~800KB, 55 files) ships with the plugin — it serves contributors (design rationale), users (ORIENTATION.md, field guide), and demonstrates that RDD was built with RDD.

## Decision

Package RDD as a plugin with:
- **Name:** `rdd`
- **Repository:** `nrgforge/rdd` on GitHub
- **Namespacing:** `/rdd-research`, `/rdd-decide`, `/rdd-build`, etc. (hyphen separator, not colon)

Plugin structure:
```
rdd/
├── .claude-plugin/plugin.json
├── skills/          (9 phase skills)
├── agents/          (6 specialist subagents)
├── hooks/hooks.json (5 cross-cutting hooks)
├── hooks/scripts/   (hook implementations)
├── settings.json    (default permissions)
├── docs/            (artifact corpus)
└── CHANGELOG.md
```

The artifact corpus ships with the plugin. Over time, the conformance audit's graduation operation condenses process artifacts (reflections, research logs) into reference material, reducing the corpus to its durable core.

## Consequences

**Positive:**
- One-command installation for users
- Versioned releases with semver
- Identical tooling for all users of a given version
- Artifact corpus available for contributors and users

**Negative:**
- Users with existing standalone skills in `~/.claude/skills/rdd-*` must remove them after installing the plugin to avoid duplicate skill registrations (the plugin produces identical `/rdd-research` names)
- ~800KB of artifact corpus ships with every installation (negligible but non-zero)
- Plugin security constraints apply to agents (no hooks/mcpServers/permissionMode in agent frontmatter)

**Neutral:**
- Marketplace distribution requires a marketplace repo or submission to the official Anthropic marketplace
- `claude --plugin-dir ./rdd` available for local development and testing
