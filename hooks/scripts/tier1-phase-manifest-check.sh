#!/usr/bin/env bash
# Stop hook: Tier 1 phase manifest compound check
# Consumes a per-phase manifest (ADR-063) and verifies required Tier 1
# artifacts exist and match structural assertions before allowing the
# agent to stop. Cross-references against the dispatch log (ADR-064)
# to detect sophisticated State C (fabricated audit artifacts).
#
# Invoked by Claude Code on the Stop event. Receives hook input JSON as $1.
#
# Exit codes:
#   0 — always. A broken hook must never wedge the agent.
#   On self-failure, emits allow with stderr diagnostic.

set -uo pipefail

PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-.}"
MANIFEST_PATH="${PLUGIN_ROOT}/hooks/manifests/tier1-phase-manifest.yaml"
REPO_ROOT="$(pwd)"
CYCLE_STATUS_POST="${REPO_ROOT}/docs/housekeeping/cycle-status.md"
CYCLE_STATUS_PRE="${REPO_ROOT}/docs/cycle-status.md"
# Post-migration path takes precedence
if [[ -f "$CYCLE_STATUS_POST" ]]; then
    CYCLE_STATUS="$CYCLE_STATUS_POST"
else
    CYCLE_STATUS="$CYCLE_STATUS_PRE"
fi
DISPATCH_LOG="${REPO_ROOT}/docs/housekeeping/dispatch-log.jsonl"
MIGRATION_MARKER="${REPO_ROOT}/docs/housekeeping/.migration-version"
ADVISORY_MARKER="/tmp/rdd-advisory-notice-$$"

INPUT="${1:-}"

# --- Fail-safe wrappers ------------------------------------------------------

# Output conventions (Claude Code hook semantics):
#   - plain stdout + exit 0      → advisory context injection, no schema check
#   - empty stdout + exit 0      → silent allow
#   - {"decision":"block",...}   → schema-validated blocking output
# The decision field accepts only "approve" | "block"; emitting "allow"
# fails schema validation (Claude Code rejects the entire envelope and the
# advisory notice is lost).

die_open() {
    local msg="$1"
    cat >&2 <<EOF
rdd-hook: internal error in tier1-phase-manifest-check
methodology continues to function; verification unavailable for this turn.
please file an issue if convenient:
  https://github.com/nrgforge/rdd/issues/new?template=hook-failure.md
diagnostic: $msg
EOF
    exit 0
}

allow() { exit 0; }

allow_with_message() {
    local msg="$1"
    printf '%s\n' "$msg"
    exit 0
}

block() {
    local reason="$1"
    jq -nc --arg r "$reason" '{"decision":"block","reason":$r}'
    exit 0
}

# --- Check for RDD context ---------------------------------------------------
# Only run if this looks like an RDD project (cycle-status exists)
[[ -f "$CYCLE_STATUS" ]] || allow

# --- Determine advisory vs enforcement mode ----------------------------------
# Advisory: docs/housekeeping/.migration-version absent
# Enforcement: marker file present

ENFORCEMENT_MODE=false
if [[ -f "$MIGRATION_MARKER" ]]; then
    ENFORCEMENT_MODE=true
fi

# --- Advisory mode notice (once per session) ----------------------------------
if ! $ENFORCEMENT_MODE; then
    # Session-scoped suppression: use session_id from input to create marker
    SESSION_ID="$(printf '%s' "$INPUT" | jq -r '.session_id // empty' 2>/dev/null)"
    NOTICE_MARKER="/tmp/rdd-advisory-${SESSION_ID:-unknown}"

    if [[ ! -f "$NOTICE_MARKER" ]] && [[ -n "$SESSION_ID" ]]; then
        touch "$NOTICE_MARKER" 2>/dev/null
        cat >&2 <<'EOF'
rdd-hook: advisory mode (pre-migration corpus)
Compound-check verification is disabled for this corpus because the
housekeeping directory structure has not been applied yet.

Your cycle continues to work without harness-layer verification. To
enable the compound check and the Tier 1 artifact verification it
provides, run /rdd-conform to migrate your corpus.
EOF
    fi
fi

# --- Determine current phase from cycle-status.md ----------------------------
# Try canonical **Phase:** marker first, fall back to **Current phase:** parsing

CURRENT_PHASE=""

# Canonical: **Phase:** build
CURRENT_PHASE="$(grep -E '^\*\*Phase:\*\*' "$CYCLE_STATUS" 2>/dev/null \
    | tail -1 \
    | sed -E 's/^\*\*Phase:\*\*[[:space:]]*([A-Za-z_-]+).*/\1/' \
    | tr '[:upper:]' '[:lower:]')"

# Fallback: parse **Current phase:** to find the phase marked as "next" or "In Progress"
if [[ -z "$CURRENT_PHASE" ]]; then
    CURRENT_PHASE_LINE="$(grep -E '^\*\*Current phase:\*\*' "$CYCLE_STATUS" 2>/dev/null | tail -1)"
    if [[ -n "$CURRENT_PHASE_LINE" ]]; then
        # Look for a phase marked with "next" or "In Progress" (case insensitive)
        # Format: "RESEARCH ... complete; DISCOVER ... complete; BUILD next"
        CURRENT_PHASE="$(printf '%s' "$CURRENT_PHASE_LINE" \
            | grep -oiE '[A-Z_-]+[[:space:]]+(next|▶|in progress)' \
            | head -1 \
            | sed -E 's/[[:space:]]+(next|▶|in progress)//i' \
            | tr '[:upper:]' '[:lower:]')"
    fi
fi

[[ -z "$CURRENT_PHASE" ]] && allow

# --- Determine current cycle number ------------------------------------------
# Canonical: **Cycle number:** 014
CURRENT_CYCLE="$(grep -E '^\*\*Cycle number:\*\*' "$CYCLE_STATUS" 2>/dev/null \
    | tail -1 \
    | sed -E 's/^\*\*Cycle number:\*\*[[:space:]]*([0-9]+).*/\1/')"

# Fallback: highest NNN prefix in docs/essays/
if [[ -z "$CURRENT_CYCLE" ]]; then
    CURRENT_CYCLE="$(ls "${REPO_ROOT}/docs/essays/" 2>/dev/null \
        | grep -E '^[0-9]{3}-' \
        | sed -E 's/^([0-9]{3}).*/\1/' \
        | sort -n | tail -1)"

    if [[ -n "$CURRENT_CYCLE" ]]; then
        printf 'rdd-hook: cycle number inferred from essay prefix (%s); consider adding **Cycle number:** field to cycle-status.md\n' "$CURRENT_CYCLE" >&2
    fi
fi

[[ -z "$CURRENT_CYCLE" ]] && allow

# --- Load and parse manifest --------------------------------------------------
[[ -f "$MANIFEST_PATH" ]] || die_open "manifest not found at $MANIFEST_PATH"

MANIFEST_JSON="$(python3 -c "
import sys, json, yaml
with open(sys.argv[1]) as f:
    print(json.dumps(yaml.safe_load(f)))
" "$MANIFEST_PATH" 2>/dev/null)" || die_open "could not parse manifest YAML"

# --- Extract phase entry ------------------------------------------------------
PHASE_ENTRY="$(printf '%s' "$MANIFEST_JSON" \
    | jq -c --arg p "$CURRENT_PHASE" '.phases[$p] // empty')"

# No obligations for this phase -> allow
[[ -z "$PHASE_ENTRY" || "$PHASE_ENTRY" == "null" ]] && allow

# --- Iterate required mechanisms ----------------------------------------------
FAILURES=()
REMINDERS=()

while IFS= read -r mech; do
    mechanism="$(printf '%s' "$mech" | jq -r '.mechanism')"
    path_tmpl="$(printf '%s' "$mech" | jq -r '.path_template')"
    min_bytes="$(printf '%s' "$mech" | jq -r '.min_bytes // 500')"

    # Substitute template tokens: {cycle} and {phase}
    path="${path_tmpl//\{cycle\}/$CURRENT_CYCLE}"
    path="${path//\{phase\}/$CURRENT_PHASE}"
    full_path="${REPO_ROOT}/${path}"

    # --- Structural assertions (ADR-063) ------------------------------------

    # E1: file exists
    if [[ ! -f "$full_path" ]]; then
        # Check dispatch log for cross-reference
        DISPATCHED=false
        if [[ -f "$DISPATCH_LOG" ]]; then
            if grep -q "\"mechanism\":\"${mechanism}\"" "$DISPATCH_LOG" 2>/dev/null; then
                DISPATCHED=true
            fi
        fi

        if $DISPATCHED; then
            FAILURES+=("${mechanism}: mechanism was dispatched but did not produce its expected artifact at ${path}")
        else
            FAILURES+=("${mechanism}: mechanism was not dispatched at all; expected artifact at ${path}")
        fi
        continue
    fi

    # S1: size floor
    actual_bytes="$(wc -c < "$full_path" | tr -d ' ')"
    if (( actual_bytes < min_bytes )); then
        FAILURES+=("${mechanism}: artifact at ${path} is too small (${actual_bytes}B < ${min_bytes}B min) — likely empty or truncated")
        continue
    fi

    # S2: required headers
    required_headers="$(printf '%s' "$mech" | jq -r '.required_headers[]?' 2>/dev/null)"
    while IFS= read -r hdr; do
        [[ -z "$hdr" ]] && continue
        if ! grep -qF "$hdr" "$full_path" 2>/dev/null; then
            FAILURES+=("${mechanism}: artifact at ${path} missing required header '${hdr}'")
        fi
    done <<< "$required_headers"

    # S3: required field labels
    required_fields="$(printf '%s' "$mech" | jq -r '.required_fields[]?' 2>/dev/null)"
    while IFS= read -r field; do
        [[ -z "$field" ]] && continue
        if ! grep -qF "$field" "$full_path" 2>/dev/null; then
            FAILURES+=("${mechanism}: artifact at ${path} missing required field '${field}'")
        fi
    done <<< "$required_fields"

    # --- Compound check (ADR-064) — enforcement mode only -------------------
    if $ENFORCEMENT_MODE; then
        DISPATCH_LOGGED=false
        if [[ -f "$DISPATCH_LOG" ]]; then
            # Check for a dispatch log entry matching both mechanism and path
            # Each JSONL line is a separate JSON object; grep for lines with both fields
            if grep "\"mechanism\":\"${mechanism}\"" "$DISPATCH_LOG" 2>/dev/null \
                | grep -q "\"expected_path\":\"${path}\"" 2>/dev/null; then
                DISPATCH_LOGGED=true
            fi
        fi

        if ! $DISPATCH_LOGGED; then
            FAILURES+=("${mechanism}: artifact exists at ${path} but no corresponding dispatch was logged; this may indicate fabricated audit output")
        fi
    fi

    # --- Revision-aware re-audit reminder (ADR-064) -------------------------
    audited_docs="$(printf '%s' "$mech" | jq -r '.audited_documents[]?' 2>/dev/null)"
    if [[ -n "$audited_docs" ]] && [[ -f "$DISPATCH_LOG" ]]; then
        # Get the most recent dispatch timestamp for this mechanism
        LAST_DISPATCH_TS="$(grep "\"mechanism\":\"${mechanism}\"" "$DISPATCH_LOG" 2>/dev/null \
            | jq -r '.timestamp // empty' 2>/dev/null \
            | sort | tail -1)"

        if [[ -n "$LAST_DISPATCH_TS" ]]; then
            # Convert dispatch timestamp to epoch for comparison
            DISPATCH_EPOCH="$(date -j -f "%Y-%m-%dT%H:%M:%SZ" "$LAST_DISPATCH_TS" +%s 2>/dev/null || \
                             date -d "$LAST_DISPATCH_TS" +%s 2>/dev/null || echo "")"

            if [[ -n "$DISPATCH_EPOCH" ]]; then
                while IFS= read -r doc_pattern; do
                    [[ -z "$doc_pattern" ]] && continue
                    # Substitute {cycle} in the document pattern
                    doc_pattern="${doc_pattern//\{cycle\}/$CURRENT_CYCLE}"
                    # Glob-expand to find actual files
                    for doc_file in ${REPO_ROOT}/${doc_pattern}; do
                        [[ -f "$doc_file" ]] || continue
                        DOC_MTIME="$(stat -f %m "$doc_file" 2>/dev/null || stat -c %Y "$doc_file" 2>/dev/null || echo "")"
                        if [[ -n "$DOC_MTIME" ]] && (( DOC_MTIME > DISPATCH_EPOCH )); then
                            REL_PATH="${doc_file#${REPO_ROOT}/}"
                            REMINDERS+=("${mechanism}: audited document ${REL_PATH} was modified after the most recent dispatch (last dispatch: ${LAST_DISPATCH_TS}). If the modification is substantial, re-audit is required (Invariant 4, research-phase Commitment 5).")
                        fi
                    done
                done <<< "$audited_docs"
            fi
        fi
    fi

done < <(printf '%s' "$PHASE_ENTRY" | jq -c '.required_mechanisms[]?')

# --- Emit reminders (non-blocking, model-visible) ----------------------------
if (( ${#REMINDERS[@]} > 0 )); then
    REMINDER_MSG="rdd-hook: re-audit reminder"$'\n'
    for r in "${REMINDERS[@]}"; do
        REMINDER_MSG+="  - ${r}"$'\n'
    done
    REMINDER_MSG+=$'\n'"Determine whether the modification is substantial enough to warrant re-auditing before the phase completes."
    printf '%s\n' "$REMINDER_MSG" >&2
fi

# --- Emit decision ------------------------------------------------------------
if (( ${#FAILURES[@]} == 0 )); then
    allow
fi

# In advisory mode, report but do not block
if ! $ENFORCEMENT_MODE; then
    MSG="rdd-hook: advisory-mode check for phase '${CURRENT_PHASE}' (cycle ${CURRENT_CYCLE}). The following Tier 1 artifacts are missing or non-compliant (this is informational — the compound check is not active until corpus migration):"$'\n'
    for f in "${FAILURES[@]}"; do
        MSG+="  - ${f}"$'\n'
    done
    allow_with_message "$MSG"
fi

# In enforcement mode, block
REASON="Tier 1 manifest check failed for phase '${CURRENT_PHASE}' (cycle ${CURRENT_CYCLE}). The phase cannot complete until the following artifacts are produced by their dispatched specialist subagents:"$'\n\n'
for f in "${FAILURES[@]}"; do
    REASON+="  - ${f}"$'\n'
done
REASON+=$'\n'"Do NOT fabricate these artifacts in your own context. The mechanism's value is that the artifact comes from an isolated subagent dispatch, not that a file of the expected shape exists. If the dispatch previously failed, surface the failure to the user explicitly and stop."

block "$REASON"
