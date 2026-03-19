#!/bin/bash
# PostToolUse hook: remind to regenerate ORIENTATION.md after key artifact changes
# Fires on Write operations; checks if the target is a key artifact

INPUT="$1"

# Key artifacts that should trigger orientation regeneration
if echo "$INPUT" | grep -qE '"(system-design\.md|domain-model\.md|scenarios\.md|product-discovery\.md)"'; then
  echo "REMINDER: A key artifact was just modified. Consider dispatching the orientation-writer agent to regenerate ORIENTATION.md so it reflects the current state of the artifact corpus."
fi
