#!/bin/bash
# PreToolUse hook: remind agent to check invariants before modifying docs/
# Fires on Write|Edit operations

# Claude Code delivers hook input via stdin, not as a command-line argument.
INPUT="${1:-}"
if [[ -z "$INPUT" && ! -t 0 ]]; then
    INPUT="$(cat)"
fi

# Check if the target file is in docs/
if echo "$INPUT" | grep -q '"docs/'; then
  echo "REMINDER: Before modifying this artifact, check domain-model.md § Invariants. Invariants are the constitutional authority — the highest-precedence statements in the artifact set. If this change would contradict an invariant, flag it to the user."
fi
