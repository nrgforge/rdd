#!/usr/bin/env bash
# WP-B (ADR-085): Backward-compatibility fallback. The Stop hook's manifest
# check resolves manifest path_template values against either the canonical
# .rdd/... location (post-migration) or the legacy docs/housekeeping/...
# location (pre-migration).
#
# This test exercises the legacy-fallback branch: artifacts exist at
# docs/housekeeping/ but the manifest specifies .rdd/ paths. The hook must
# still find them and the compound check must still succeed (matching the
# log entry against either canonical or legacy expected_path).

source "$(dirname "$0")/lib.sh"
TEST_NAME="test_hook_reads_rdd_path_with_legacy_fallback"

setup_fake_repo

# Strip .rdd/ created by setup_fake_repo and re-create at the legacy location.
# This simulates a pre-ADR-085 corpus that has run /rdd-conform migrate
# (ADR-070) but not /rdd-conform migrate-to-rdd (ADR-085).
rm -rf "${FAKE_REPO}/.rdd"
mkdir -p "${FAKE_REPO}/docs/housekeeping/audits"
mkdir -p "${FAKE_REPO}/docs/housekeeping/gates"

# Migration marker at the legacy location (ADR-070 placement).
printf '0.7.1\n' > "${FAKE_REPO}/docs/housekeeping/.migration-version"

write_manifest

# Gate reflection note and susceptibility snapshot at the legacy locations.
# (write_gate_reflection / write_susceptibility_snapshot from lib.sh write
# to .rdd/ — re-create them inline here at the legacy paths.)
cat > "${FAKE_REPO}/docs/housekeeping/gates/016-build-gate.md" <<EOF
# Gate Reflection: Cycle 016 build → next

**Date:** 2026-04-23
**Phase boundary:** build → next
**Cycle:** Legacy-Path Test Cycle 016

## Belief-mapping question composed for this gate

What would you need to believe for the alternative framing to be the right
call here, and what evidence would shift confidence between the two? The
question is composed against specific artifact content rather than reciting
a template; it references the cycle's actual decisions and surfaces the
unexamined assumption rather than arguing a position.

## User's response

Test fixture response — a reasoned position articulating the settled premises,
the open questions, and the specific commitments being carried forward. The
response engages with the belief-mapping question directly, names what would
have to hold for the alternative framing to be right, and identifies which
assumptions are being carried forward versus left open. Padded to clear the
800-byte minimum required by the manifest's size floor for the gate
reflection note artifact.

## Pedagogical move selected

Probe. Surfaced a specific artifact decision for the user's take without
narrating engagement back to them.

## Commitment gating outputs

**Settled premises (going into next phase):**
- Example settled premise one.
- Example settled premise two.

**Open questions (held into next phase):**
- Example open question one.

**Specific commitments carried forward:**
- Example commitment one.
EOF

cat > "${FAKE_REPO}/docs/housekeeping/audits/susceptibility-snapshot-016-build.md" <<EOF
# Susceptibility Snapshot

Phase evaluated: build
Cycle: 016

## Observed Signals

Assertion density: nominal. Solution-space narrowing: nominal. Framing
adoption: nominal. Confidence markers: nominal. Engagement with alternatives:
present and substantive across the phase. No drift in register or in the
user's posture across the gate conversation. Padded content to clear the
400-byte minimum size floor required by the manifest.

## Recommendation

Advance. No Grounding Reframe required. The snapshot observed no significant
findings at this boundary.
EOF

# Dispatch log at the legacy location with legacy expected_path. This tests
# the dispatch_log_has_entry helper's two-form match.
cat > "${FAKE_REPO}/docs/housekeeping/dispatch-log.jsonl" <<EOF
{"timestamp":"2026-04-23T00:00:00Z","mechanism":"susceptibility-snapshot-evaluator","expected_path":"docs/housekeeping/audits/susceptibility-snapshot-016-build.md"}
EOF

write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: Legacy-Path Fallback Test

**Cycle number:** 016
**Started:** 2026-04-15
**Current phase:** BUILD (next)
**Cycle type:** batch
'

run_hook test-legacy-fallback

# All artifacts present at legacy location → hook's resolve_artifact_path
# fallback finds them; dispatch_log_has_entry matches the legacy expected_path;
# compound check passes; hook allows silently.
assert_exit_zero "$HOOK_EXIT" "legacy-path fallback"
assert_no_block "$HOOK_STDOUT"
assert_stdout_empty "$HOOK_STDOUT"

report_summary
