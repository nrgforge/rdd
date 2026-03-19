#!/bin/bash
# Stop hook: remind about epistemic gate if in an RDD phase
# Fires on all Stop events; checks context for RDD phase indicators

INPUT="$1"

# Check if conversation context suggests an active RDD phase
# The hook injects a reminder — it cannot enforce, only advise (Invariant 2)
if echo "$INPUT" | grep -qi 'rdd\|epistemic gate\|/rdd'; then
  echo "REMINDER: If you are in an active RDD phase, ensure the epistemic gate has been completed before stopping. Every phase transition requires the user to produce something — an explanation, prediction, reconstruction, or articulation — not merely approve (Invariant 2)."
fi
