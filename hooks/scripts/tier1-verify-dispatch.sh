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

# Claude Code delivers hook input via stdin, not as a command-line
# argument. Read stdin if available; fall back to $1 for direct invocation
# (test harnesses, manual debugging).
INPUT="${1:-}"
if [[ -z "$INPUT" && ! -t 0 ]]; then
    INPUT="$(cat)"
fi
[[ -z "$INPUT" ]] && exit 0

REPO_ROOT="$(pwd)"
DISPATCH_LOG="${REPO_ROOT}/docs/housekeeping/dispatch-log.jsonl"

# Tier 1 mechanism set — only these are logged
TIER1_MECHANISMS="research-methods-reviewer citation-auditor argument-auditor susceptibility-snapshot-evaluator"

# --- Extract subagent_type ---------------------------------------------------
SUBAGENT_TYPE="$(printf '%s' "$INPUT" | jq -r '.tool_input.subagent_type // empty' 2>/dev/null)"
[[ -z "$SUBAGENT_TYPE" ]] && exit 0

# --- Normalize plugin namespace prefix ---------------------------------------
# Claude Code dispatches plugin-provided subagents using a namespaced form
# such as "rdd:susceptibility-snapshot-evaluator". The canonical Tier 1
# mechanism name in the manifest and in the tier1-phase-manifest-check.sh
# Stop hook's matching logic is the bare form ("susceptibility-snapshot-
# evaluator"). Strip the plugin prefix so the mechanism name stored in the
# dispatch log matches what downstream verification expects. The original
# subagent_type is preserved in a separate field for forensic purposes.
MECHANISM="${SUBAGENT_TYPE#*:}"
# If no colon was present (bare name), parameter expansion returns the
# original string unchanged, so both forms work.

# --- Check if this is a Tier 1 dispatch --------------------------------------
IS_TIER1=false
for m in $TIER1_MECHANISMS; do
    if [[ "$MECHANISM" == "$m" ]]; then
        IS_TIER1=true
        break
    fi
done
$IS_TIER1 || exit 0

# --- Extract Output path from prompt -----------------------------------------
# The canonical prompt skeleton (ADR-065) includes a line:
#   Output path: docs/housekeeping/audits/some-artifact.md
# Match against common markdown-formatted variants agent-authored prompts
# produce naturally — bold label, backticked path, wrapped backticks, list
# item — so the Stop hook's compound check doesn't treat legitimate
# dispatches as fabrication-suspicious (Issue #15). Negative: prose
# prescriptions without the "Output path:" label do not match.
#
# Match filter (grep): line contains "Output path:" after optional leading
# whitespace, list marker (- or *), markdown bold (**), or wrapping backtick.
# Extraction (sed): strip list marker, wrapping backticks, markdown bold
# around the label, then take everything after "Output path:", strip
# backticks around the path, strip trailing whitespace.
PROMPT="$(printf '%s' "$INPUT" | jq -r '.tool_input.prompt // empty' 2>/dev/null)"
EXPECTED_PATH="$(printf '%s' "$PROMPT" \
    | grep -E '^[[:space:]]*([-*][[:space:]]+)?(\*\*)?`?Output path:' \
    | head -1 \
    | sed -E '
        s/^[[:space:]]*[-*][[:space:]]+//
        s/^`(.*)`$/\1/
        s/\*\*Output path:\*\*/Output path:/
        s/^.*Output path:[[:space:]]*//
        s/^`//
        s/`$//
        s/[[:space:]]+$//
    ' || true)"

# --- Extract identifiers -----------------------------------------------------
SESSION_ID="$(printf '%s' "$INPUT" | jq -r '.session_id // empty' 2>/dev/null)"
TOOL_USE_ID="$(printf '%s' "$INPUT" | jq -r '.tool_use_id // empty' 2>/dev/null)"
TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

# --- Ensure dispatch log directory exists ------------------------------------
mkdir -p "$(dirname "$DISPATCH_LOG")" 2>/dev/null || exit 0

# --- Append JSONL entry ------------------------------------------------------
# Use jq to produce valid JSON (handles escaping). expected_path is emitted as
# JSON null when the prompt did not contain an "Output path:" line, so that
# downstream queries (e.g., `jq '.expected_path == null'`) work as expected.
if [[ -n "$EXPECTED_PATH" ]]; then
    EP_ARG=(--arg ep "$EXPECTED_PATH")
    EP_EXPR='$ep'
else
    EP_ARG=(--argjson ep 'null')
    EP_EXPR='$ep'
fi

jq -nc \
    --arg ts "$TIMESTAMP" \
    --arg sid "$SESSION_ID" \
    --arg mech "$MECHANISM" \
    --arg sat "$SUBAGENT_TYPE" \
    "${EP_ARG[@]}" \
    --arg tuid "$TOOL_USE_ID" \
    "{timestamp:\$ts, session_id:\$sid, mechanism:\$mech, subagent_type:\$sat, expected_path:${EP_EXPR}, tool_use_id:\$tuid}" \
    >> "$DISPATCH_LOG" 2>/dev/null || true

exit 0
