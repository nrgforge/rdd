#!/bin/bash
# PostToolUse hook: remind to regenerate ORIENTATION.md after key artifact changes
# Fires on Write operations; checks if the target is a key artifact.
#
# The regex matches the basename portion of a JSON-quoted file_path value, so
# absolute paths (the normal Write tool input shape) match correctly. The
# leading character class accepts either '/' (path separator) or '"' (string
# value boundary, for the unusual case of a bare filename), and the trailing
# '"' anchors to the JSON value's closing quote so similarly-named files do
# not over-match (system-design-foo.md does not match).
#
# Cycle 017 (WP-B): added system-design.agents.md per ADR-084 Pattern B —
# the companion file is part of the artifact set whose changes warrant an
# ORIENTATION.md regeneration prompt.

# Claude Code delivers hook input via stdin, not as a command-line argument.
INPUT="${1:-}"
if [[ -z "$INPUT" && ! -t 0 ]]; then
    INPUT="$(cat)"
fi

# Key artifacts that should trigger orientation regeneration
if echo "$INPUT" | grep -qE '[/"](system-design\.agents\.md|system-design\.md|domain-model\.md|scenarios\.md|product-discovery\.md)"'; then
  echo "REMINDER: A key artifact was just modified. Consider dispatching the orientation-writer agent to regenerate ORIENTATION.md so it reflects the current state of the artifact corpus."
fi
