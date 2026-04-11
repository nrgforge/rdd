#!/bin/bash
# Stop hook: remind about epistemic gate if in an RDD phase
# Fires on all Stop events; checks context for RDD phase indicators

# Claude Code delivers hook input via stdin, not as a command-line argument.
INPUT="${1:-}"
if [[ -z "$INPUT" && ! -t 0 ]]; then
    INPUT="$(cat)"
fi

# Play and synthesis subsume their gates — the activity itself is the epistemic act
# (ADR-016, ADR-038). Do not fire "missing gate" reminder for these phases.
if echo "$INPUT" | grep -qi 'rdd-play\|rdd-synthesize\|/rdd-play\|/rdd-synthesize'; then
  exit 0
fi

# Check if conversation context suggests an active RDD phase
# The hook injects a reminder — it cannot enforce, only advise (Invariant 2)
# Recognizes both fixed-template gates (legacy) and AID cycle adaptive prompts (ADR-040)
if echo "$INPUT" | grep -qi 'rdd\|epistemic gate\|reflection time\|/rdd'; then
  echo "REMINDER: If you are in an active RDD phase, ensure reflection time has been completed before stopping. Run the Attend-Interpret-Decide cycle: read engagement signals from the conversation, interpret the user's understanding, and select the appropriate pedagogical move (challenge, probe, teach, clarify, or re-anchor). Every phase transition requires the user to produce something — not merely approve (Invariant 2). Time spent must be productive, not merely brief (Invariant 4)."
fi
