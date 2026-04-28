#!/usr/bin/env bash
# Skill-text anchoring test: verify the migrate-to-rdd operation describes
# its idempotency check. The operation reads .rdd/.migration-version to
# detect prior migration and no-ops on re-run (ADR-085 §4 step 1).

source "$(dirname "$0")/lib.sh"
TEST_NAME="test_conform_migrate_to_rdd_idempotent"

PLUGIN_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
SKILL_FILE="${PLUGIN_ROOT}/skills/conform/SKILL.md"

if [[ ! -f "$SKILL_FILE" ]]; then
    fail "skills/conform/SKILL.md not found at $SKILL_FILE"
    report_summary
fi

# Extract the Migrate to .rdd/ operation section: from the operation heading
# through the next "## Operation" or "## IMPORTANT" heading.
# Match heading by literal substring "Migrate to" combined with "rdd"
# to avoid backtick / dot / slash escaping in awk regex.
OPERATION_SECTION="$(awk '
    /^## Operation/ && /Migrate to/ && /rdd/ { in_section = 1; print; next }
    in_section && /^## Operation/ { exit }
    in_section && /^## IMPORTANT/ { exit }
    in_section { print }
' "$SKILL_FILE")"

if [[ -z "$OPERATION_SECTION" ]]; then
    fail "could not locate Migrate to .rdd/ operation section"
    report_summary
fi

# Idempotency check is described.
if grep -qiE 'idempoten' <<<"$OPERATION_SECTION"; then
    pass "operation describes idempotency"
else
    fail "operation does not describe idempotency"
fi

# Migration marker check is described.
if grep -qE '\.rdd/\.migration-version' <<<"$OPERATION_SECTION"; then
    pass "operation references .rdd/.migration-version marker"
else
    fail "operation does not reference .rdd/.migration-version marker"
fi

# No-op behavior on re-run is described.
if grep -qiE 'already migrated|no-op|noop' <<<"$OPERATION_SECTION"; then
    pass "operation describes no-op on re-run"
else
    fail "operation does not describe no-op on re-run"
fi

# The operation writes the marker as part of completing the migration.
if grep -qiE 'writes? .*\.rdd/\.migration-version|migration-version.*current plugin version|migration-version.*plugin version' <<<"$OPERATION_SECTION"; then
    pass "operation writes .migration-version with current version"
else
    fail "operation does not describe writing .migration-version"
fi

report_summary
