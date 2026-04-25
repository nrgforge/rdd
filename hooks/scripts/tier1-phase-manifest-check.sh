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

# Claude Code delivers hook input via stdin, not as a command-line argument.
# Read stdin if available; fall back to $1 for direct invocation (test
# harnesses, manual debugging).
INPUT="${1:-}"
if [[ -z "$INPUT" && ! -t 0 ]]; then
    INPUT="$(cat)"
fi

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

# Session ID from hook input — used by advisory, pause, and other
# session-scoped notice markers to avoid per-Stop spam.
SESSION_ID="$(printf '%s' "$INPUT" | jq -r '.session_id // empty' 2>/dev/null)"

# --- Advisory mode notice (once per session) ----------------------------------
if ! $ENFORCEMENT_MODE; then
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

# --- Extract active entry from Cycle Stack (ADR-078) -------------------------
# If the file has a '## Cycle Stack' header, extract the top entry (the first
# '### Active:' section) and scope all subsequent field parsing to that entry.
# Legacy single-entry files (no stack header) are treated as a one-entry stack:
# the whole file body is the single entry. This satisfies ADR-078 scenario 6
# (backward compatibility) and scenario 4 (hook reads only the top entry).

if grep -qE '^## Cycle Stack[[:space:]]*$' "$CYCLE_STATUS" 2>/dev/null; then
    ACTIVE_ENTRY="$(awk '
        /^## Cycle Stack/ { in_stack = 1; next }
        in_stack && /^### Active:/ { in_entry = 1; next }
        in_entry && /^### (Active|Paused):/ { exit }
        in_entry { print }
    ' "$CYCLE_STATUS")"
else
    ACTIVE_ENTRY="$(cat "$CYCLE_STATUS")"
fi

# --- Legacy pre-ADR-072 detection (ADR-081) ----------------------------------
# If no cycle-shape fields (Skipped phases, Paused, Cycle type) are present,
# the entry predates ADR-072 and gets grandfathered advisory enforcement —
# regardless of the corpus-level .migration-version state.
LEGACY_PRE_ADR_072=false
if ! grep -qE '^\*\*(Skipped phases|Paused|Cycle type):\*\*' <<<"$ACTIVE_ENTRY"; then
    LEGACY_PRE_ADR_072=true
    GRAND_MARKER="/tmp/rdd-grandfathered-${SESSION_ID:-unknown}"
    if [[ ! -f "$GRAND_MARKER" ]] && [[ -n "$SESSION_ID" ]]; then
        touch "$GRAND_MARKER" 2>/dev/null
        cat >&2 <<'EOF'
rdd-hook: grandfathered cycle (pre-ADR-072 format)
This cycle's cycle-status.md predates the cycle-shape field schema (ADR-072).
Manifest checks run in advisory mode for this cycle; run /rdd-conform
cycle-shape audit to migrate it to the current schema. See ADR-081.
EOF
    fi
    ENFORCEMENT_MODE=false
fi

# --- Paused cycle short-circuit (ADR-072, applied to active entry) -----------
# If the active entry declares the cycle paused, all manifest checks are
# bypassed until the **Paused:** field is removed. Emit a one-time advisory
# notice per session (marker distinct from advisory-mode and in-progress-gate
# markers to avoid collision).
PAUSED_VALUE="$(grep -E '^\*\*Paused:\*\*' <<<"$ACTIVE_ENTRY" 2>/dev/null \
    | tail -1 \
    | sed -E 's/^\*\*Paused:\*\*[[:space:]]*(.*)$/\1/')"

if [[ -n "$PAUSED_VALUE" ]]; then
    PAUSE_NOTICE_MARKER="/tmp/rdd-pause-notice-${SESSION_ID:-unknown}"
    if [[ ! -f "$PAUSE_NOTICE_MARKER" ]] && [[ -n "$SESSION_ID" ]]; then
        touch "$PAUSE_NOTICE_MARKER" 2>/dev/null
        cat >&2 <<EOF
rdd-hook: cycle paused (${PAUSED_VALUE})
Manifest checks are bypassed until the **Paused:** field is removed from the
active entry in cycle-status.md. See ADR-072.
EOF
    fi
    allow
fi

# --- In-progress gate predicate (ADR-079) ------------------------------------
# When the active entry carries **In-progress gate:** <source> → <target>, the
# gate-reflection-note check for the source phase is skipped (other checks
# continue to run). The predicate is applied later in the mechanism-iteration
# loop where per-entry artifact_type is available.
IN_PROGRESS_GATE="$(grep -E '^\*\*In-progress gate:\*\*' <<<"$ACTIVE_ENTRY" 2>/dev/null \
    | tail -1 \
    | sed -E 's/^\*\*In-progress gate:\*\*[[:space:]]*(.*)$/\1/')"
IN_PROGRESS_GATE_SOURCE=""
if [[ -n "$IN_PROGRESS_GATE" ]]; then
    IN_PROGRESS_GATE_SOURCE="$(printf '%s' "$IN_PROGRESS_GATE" \
        | sed -E 's/[[:space:]]*(->|→).*$//' \
        | tr -d '[:space:]' \
        | tr '[:upper:]' '[:lower:]')"
    GATE_MARKER="/tmp/rdd-gate-notice-${SESSION_ID:-unknown}"
    if [[ ! -f "$GATE_MARKER" ]] && [[ -n "$SESSION_ID" ]]; then
        touch "$GATE_MARKER" 2>/dev/null
        cat >&2 <<EOF
rdd-hook: in-progress gate (${IN_PROGRESS_GATE})
Gate-reflection-note checks for the source phase are bypassed until the
**In-progress gate:** field is cleared. Other checks continue to fire. See ADR-079.
EOF
    fi
fi

# --- Determine current phase from active entry -------------------------------
# Try canonical **Phase:** marker first, fall back to **Current phase:** parsing.
# The fallback tolerates optional parens around the next/in-progress marker
# (accepts both "BUILD next" and "BUILD (next)" and "BUILD ▶ In Progress").

CURRENT_PHASE="$(grep -E '^\*\*Phase:\*\*' <<<"$ACTIVE_ENTRY" 2>/dev/null \
    | tail -1 \
    | sed -E 's/^\*\*Phase:\*\*[[:space:]]*([A-Za-z_-]+).*/\1/' \
    | tr '[:upper:]' '[:lower:]')"

if [[ -z "$CURRENT_PHASE" ]]; then
    CURRENT_PHASE_LINE="$(grep -E '^\*\*Current phase:\*\*' <<<"$ACTIVE_ENTRY" 2>/dev/null | tail -1)"
    if [[ -n "$CURRENT_PHASE_LINE" ]]; then
        CURRENT_PHASE="$(printf '%s' "$CURRENT_PHASE_LINE" \
            | grep -oiE '[A-Z_-]+[[:space:]]+\(?(next|▶|in progress)\)?' \
            | head -1 \
            | sed -E 's/[[:space:]]+\(?(next|▶|in progress)\)?.*//i' \
            | tr '[:upper:]' '[:lower:]')"
    fi
fi

[[ -z "$CURRENT_PHASE" ]] && allow

# --- In-progress phase predicate (v0.8.2) -----------------------------------
# When the active entry carries **In-progress phase:** <phase> and the phase
# names the currently-active phase, the entire manifest check short-circuits.
# The manifest check is phase-EXIT verification; during the phase the agent is
# producing artifacts in workflow order and cannot satisfy phase-exit
# obligations yet. Blocking every mid-phase turn-end produces a runaway Stop
# loop at pre-dispatch steps where the agent is awaiting user input (see
# v0.8.2 release notes).
#
# Orchestrator discipline (see skills/rdd/SKILL.md): set **In-progress phase:**
# when entering the phase; remove the line when ready for phase-exit
# verification. The subsequent Stop fires the manifest check against the
# then-current phase. Legacy cycles without the field retain prior behavior.
IN_PROGRESS_PHASE="$(grep -E '^\*\*In-progress phase:\*\*' <<<"$ACTIVE_ENTRY" 2>/dev/null \
    | tail -1 \
    | sed -E 's/^\*\*In-progress phase:\*\*[[:space:]]*([A-Za-z_-]+).*/\1/' \
    | tr '[:upper:]' '[:lower:]')"

if [[ -n "$IN_PROGRESS_PHASE" && "$IN_PROGRESS_PHASE" == "$CURRENT_PHASE" ]]; then
    IN_PROGRESS_PHASE_MARKER="/tmp/rdd-in-progress-phase-${SESSION_ID:-unknown}"
    if [[ ! -f "$IN_PROGRESS_PHASE_MARKER" ]] && [[ -n "$SESSION_ID" ]]; then
        touch "$IN_PROGRESS_PHASE_MARKER" 2>/dev/null
        cat >&2 <<EOF
rdd-hook: in-progress phase (${IN_PROGRESS_PHASE})
Manifest check is bypassed while **In-progress phase:** names the current phase.
Remove the line from the active entry in cycle-status.md when ready for
phase-exit verification. Introduced in v0.8.2.
EOF
    fi
    allow
fi

# --- Determine current cycle number ------------------------------------------
CURRENT_CYCLE="$(grep -E '^\*\*Cycle number:\*\*' <<<"$ACTIVE_ENTRY" 2>/dev/null \
    | tail -1 \
    | sed -E 's/^\*\*Cycle number:\*\*[[:space:]]*([0-9]+).*/\1/')"

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

# --- Parse cycle type and parent cycle (ADR-080 applicable_when substrate) --
CYCLE_TYPE="$(grep -E '^\*\*Cycle type:\*\*' <<<"$ACTIVE_ENTRY" 2>/dev/null \
    | tail -1 \
    | sed -E 's/^\*\*Cycle type:\*\*[[:space:]]*([A-Za-z_-]+).*/\1/' \
    | tr '[:upper:]' '[:lower:]')"
PARENT_CYCLE="$(grep -E '^\*\*Parent cycle:\*\*' <<<"$ACTIVE_ENTRY" 2>/dev/null \
    | tail -1 \
    | sed -E 's/^\*\*Parent cycle:\*\*[[:space:]]*([0-9]+).*/\1/')"

# --- Skipped phases short-circuit (ADR-072, per active entry) ----------------
SKIPPED_PHASES_RAW="$(grep -E '^\*\*Skipped phases:\*\*' <<<"$ACTIVE_ENTRY" 2>/dev/null \
    | tail -1 \
    | sed -E 's/^\*\*Skipped phases:\*\*[[:space:]]*(.*)$/\1/' \
    | tr ',' ' ' \
    | tr '[:upper:]' '[:lower:]')"

if [[ -n "$SKIPPED_PHASES_RAW" ]]; then
    for skipped in $SKIPPED_PHASES_RAW; do
        skipped="$(printf '%s' "$skipped" | tr -d '[:space:]')"
        if [[ -n "$skipped" && "$skipped" == "$CURRENT_PHASE" ]]; then
            allow
        fi
    done
fi

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
    # mechanism_type: "subagent" (default, artifact from isolated Agent dispatch)
    # or "user-tooling" (artifact produced by the orchestrator in-context, e.g.
    # the AID cycle gate reflection note — no dispatch log entry expected,
    # compound check does not apply).
    mechanism_type="$(printf '%s' "$mech" | jq -r '.mechanism_type // "subagent"')"
    # artifact_type: optional canonical identifier used by ADR-079's in-progress
    # gate predicate to single out the aid-cycle-gate-reflection entry.
    artifact_type="$(printf '%s' "$mech" | jq -r '.artifact_type // empty')"
    path_tmpl="$(printf '%s' "$mech" | jq -r '.path_template')"
    min_bytes="$(printf '%s' "$mech" | jq -r '.min_bytes // 500')"

    # Substitute template tokens: {cycle} and {phase}
    path="${path_tmpl//\{cycle\}/$CURRENT_CYCLE}"
    path="${path//\{phase\}/$CURRENT_PHASE}"
    full_path="${REPO_ROOT}/${path}"

    # --- In-progress gate predicate (ADR-079) -------------------------------
    # When the active entry's **In-progress gate:** names the current phase
    # as the source, the gate-reflection-note check for that phase is skipped.
    # All other mechanism checks continue to run.
    if [[ -n "$IN_PROGRESS_GATE_SOURCE" ]] \
        && [[ "$CURRENT_PHASE" == "$IN_PROGRESS_GATE_SOURCE" ]] \
        && [[ "$artifact_type" == "aid-cycle-gate-reflection" ]]; then
        continue
    fi

    # --- applicable_when precondition evaluation (ADR-080) ------------------
    # When any listed precondition fails, the mechanism check is skipped and
    # the skip is recorded in the dispatch log. All conditions must hold for
    # the check to run. Supported primitives: cycle_type_in, cycle_type_not_in,
    # phase_not_skipped, parent_cycle_present, parent_cycle_absent.
    applicable_when="$(printf '%s' "$mech" | jq -c '.applicable_when // empty')"
    if [[ -n "$applicable_when" && "$applicable_when" != "null" ]]; then
        skip_reason=""
        while IFS= read -r precond; do
            [[ -z "$precond" || "$precond" == "null" ]] && continue
            primitive="$(printf '%s' "$precond" | jq -r 'keys[0]')"
            case "$primitive" in
                cycle_type_in)
                    if ! printf '%s' "$precond" \
                        | jq -e --arg ct "$CYCLE_TYPE" '.cycle_type_in | any(. == $ct)' >/dev/null 2>&1; then
                        skip_reason="cycle_type_in"
                    fi
                    ;;
                cycle_type_not_in)
                    if printf '%s' "$precond" \
                        | jq -e --arg ct "$CYCLE_TYPE" '.cycle_type_not_in | any(. == $ct)' >/dev/null 2>&1; then
                        skip_reason="cycle_type_not_in"
                    fi
                    ;;
                phase_not_skipped)
                    target="$(printf '%s' "$precond" | jq -r '.phase_not_skipped')"
                    for sk in $SKIPPED_PHASES_RAW; do
                        sk="$(printf '%s' "$sk" | tr -d '[:space:]')"
                        [[ "$sk" == "$target" ]] && { skip_reason="phase_not_skipped"; break; }
                    done
                    ;;
                parent_cycle_present)
                    [[ -z "$PARENT_CYCLE" ]] && skip_reason="parent_cycle_present"
                    ;;
                parent_cycle_absent)
                    [[ -n "$PARENT_CYCLE" ]] && skip_reason="parent_cycle_absent"
                    ;;
            esac
            [[ -n "$skip_reason" ]] && break
        done < <(printf '%s' "$applicable_when" | jq -c '.[]')

        if [[ -n "$skip_reason" ]]; then
            # Record the skip in the dispatch log (best-effort; create dir if needed)
            if mkdir -p "$(dirname "$DISPATCH_LOG")" 2>/dev/null; then
                printf '{"timestamp":"%s","mechanism":"%s","skipped":"applicable_when condition %s not met"}\n' \
                    "$(date -u +%Y-%m-%dT%H:%M:%SZ)" "$mechanism" "$skip_reason" \
                    >> "$DISPATCH_LOG" 2>/dev/null
            fi
            continue
        fi
    fi

    # --- Structural assertions (ADR-063) ------------------------------------

    # E1: file exists
    if [[ ! -f "$full_path" ]]; then
        if [[ "$mechanism_type" == "user-tooling" ]]; then
            FAILURES+=("${mechanism}: note was not produced at expected path ${path}")
        else
            # Check dispatch log for cross-reference. Match on mechanism AND the
            # substituted expected_path — matching on mechanism alone produces
            # misleading "dispatched but no artifact" messages when a prior-cycle
            # dispatch for the same mechanism exists in the log.
            DISPATCHED=false
            if [[ -f "$DISPATCH_LOG" ]]; then
                if grep "\"mechanism\":\"${mechanism}\"" "$DISPATCH_LOG" 2>/dev/null \
                    | grep -q "\"expected_path\":\"${path}\"" 2>/dev/null; then
                    DISPATCHED=true
                fi
            fi

            if $DISPATCHED; then
                FAILURES+=("${mechanism}: mechanism was dispatched but did not produce its expected artifact at ${path}")
            else
                FAILURES+=("${mechanism}: mechanism was not dispatched at all; expected artifact at ${path}")
            fi
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

    # --- Compound check (ADR-064) -------------------------------------------
    # User-tooling mechanisms (e.g., aid-cycle-gate-reflection) are produced
    # in-context by the orchestrator, not by an isolated subagent dispatch,
    # so they have no dispatch log entry and the compound check's isolation
    # assumption does not apply. The structural floor (E1/S1/S2/S3) is the
    # complete check for these mechanisms; the Susceptibility Snapshot at the
    # same phase boundary is the complementary content-level defense
    # (orchestrator SKILL.md, "compound defense at phase boundaries").
    #
    # As of v0.8.3 the compound check fires in all modes (it is information,
    # not enforcement — see "Advisory-only manifest check" note at the bottom
    # of this file).
    if [[ "$mechanism_type" != "user-tooling" ]]; then
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
# Advisory-only manifest check (v0.8.3).
#
# Prior versions emitted a Stop-hook block decision in enforcement mode when
# any FAILURES were collected. In practice the block was processable by the
# agent (Claude Code feeds the reason back as next-turn context, not as a
# wall) so the "structural prevention" property the block claimed was always
# more cosmetic than load-bearing. The block's real cost was a runaway loop
# at any Stop event during a phase where the manifest's required artifacts
# could not yet exist (RESEARCH Step 1.1 was the canonical example).
#
# v0.8.3 demotes the manifest check to always-advisory. The methodology's
# real defenses remain:
#   - skill text (always-firing guidance to dispatch audits, write notes, etc.)
#   - dispatch-log compound check (now firing in all modes — see above)
#   - audits run in isolated subagent contexts (architectural isolation)
#
# The advisory message contains the same content the block would have, so
# the agent and user still see what is missing. They are no longer wedged.

if (( ${#FAILURES[@]} == 0 )); then
    allow
fi

MSG="rdd-hook: phase manifest advisory for phase '${CURRENT_PHASE}' (cycle ${CURRENT_CYCLE}). The following Tier 1 artifacts are missing or non-compliant:"$'\n'
for f in "${FAILURES[@]}"; do
    MSG+="  - ${f}"$'\n'
done
MSG+=$'\n'"Do NOT fabricate these artifacts in your own context. Specialist subagents must produce them via isolated dispatch. The methodology relies on advisory verification + skill discipline + the dispatch-log compound check, not on a hard hook block (v0.8.3 change)."

allow_with_message "$MSG"
