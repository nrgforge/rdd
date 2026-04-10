#!/usr/bin/env bash
# PostToolUse hook: log Tier 1 subagent dispatches to the dispatch log
# Fires on PostToolUse for the Agent tool. Extracts subagent_type and
# Output path from the prompt, appends a JSONL entry to the dispatch log.
#
# This hook NEVER blocks — it is append-only verification infrastructure.
# The Stop hook (tier1-phase-manifest-check.sh) consumes the log.
#
# Fails-Safe-to-Allow: on any internal error, exit silently.

set -uo pipefail

INPUT="${1:-}"
[[ -z "$INPUT" ]] && exit 0

REPO_ROOT="$(pwd)"
DISPATCH_LOG="${REPO_ROOT}/docs/housekeeping/dispatch-log.jsonl"

# Tier 1 mechanism set — only these are logged
TIER1_MECHANISMS="research-methods-reviewer citation-auditor argument-auditor susceptibility-snapshot-evaluator"

# --- Extract subagent_type ---------------------------------------------------
SUBAGENT_TYPE="$(printf '%s' "$INPUT" | jq -r '.tool_input.subagent_type // empty' 2>/dev/null)"
[[ -z "$SUBAGENT_TYPE" ]] && exit 0

# --- Check if this is a Tier 1 dispatch --------------------------------------
IS_TIER1=false
for m in $TIER1_MECHANISMS; do
    if [[ "$SUBAGENT_TYPE" == "$m" ]]; then
        IS_TIER1=true
        break
    fi
done
$IS_TIER1 || exit 0

# --- Extract Output path from prompt -----------------------------------------
# The canonical prompt skeleton (ADR-065) includes a line:
#   Output path: docs/housekeeping/audits/some-artifact.md
# Extract it via regex. If absent, log with expected_path: null.
PROMPT="$(printf '%s' "$INPUT" | jq -r '.tool_input.prompt // empty' 2>/dev/null)"
EXPECTED_PATH="$(printf '%s' "$PROMPT" | grep -oE '^Output path: .+$' | head -1 | sed 's/^Output path: //' || true)"
[[ -z "$EXPECTED_PATH" ]] && EXPECTED_PATH="null"

# --- Extract identifiers -----------------------------------------------------
SESSION_ID="$(printf '%s' "$INPUT" | jq -r '.session_id // empty' 2>/dev/null)"
TOOL_USE_ID="$(printf '%s' "$INPUT" | jq -r '.tool_use_id // empty' 2>/dev/null)"
TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

# --- Ensure dispatch log directory exists ------------------------------------
mkdir -p "$(dirname "$DISPATCH_LOG")" 2>/dev/null || exit 0

# --- Append JSONL entry ------------------------------------------------------
# Use jq to produce valid JSON (handles escaping)
jq -nc \
    --arg ts "$TIMESTAMP" \
    --arg sid "$SESSION_ID" \
    --arg mech "$SUBAGENT_TYPE" \
    --arg sat "$SUBAGENT_TYPE" \
    --arg ep "$EXPECTED_PATH" \
    --arg tuid "$TOOL_USE_ID" \
    '{timestamp:$ts, session_id:$sid, mechanism:$mech, subagent_type:$sat, expected_path:$ep, tool_use_id:$tuid}' \
    >> "$DISPATCH_LOG" 2>/dev/null || true

exit 0
