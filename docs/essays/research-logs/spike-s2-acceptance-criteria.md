# Spike S2: Acceptance Criteria for Tier 1 Mechanisms
*2026-04-06*

## Spike Question

What atomic, testable acceptance criteria can distinguish a correctly-fired Cycle 9 Tier 1 mechanism from a silently-failed one — in a form that the Stop hook proposed in Spike S1 can consume directly?

The three-state discriminator is load-bearing: the criteria must distinguish **State A** (fired and effective), **State B** (didn't fire, visibly didn't fire), and **State C** (fired-but-fake — the "grading my own homework" case where the agent produced an artifact-shaped output in-context after a silent dispatch failure). State B is recoverable because file absence is observable; State C is the worst because it gives the user false confidence. The hardest job is producing assertions that distinguish A from C.

## Method

Read spikes S1 and S4 in full; grep-searched the lit review on telemetry/acceptance criteria for the NIST conformance methodology and AgentGuard references. Read three recent `citation-audit-*.md` files (010, 012, 013) and their matching `argument-audit-*.md` files plus the cycle-9 decide argument audit (`argument-audit-decide-055-062.md`), plus `research-design-review-014.md` (the only research-methods-reviewer output in the corpus — this is itself a data point). Sampled first 12 lines across four more audits of each type to confirm structural regularity. Read ADRs 057 and 060 for formal mechanism definitions, and `SKILL.md` lines 180–240 in the installed rdd plugin for the susceptibility-snapshot dispatch text. Wrote a manifest in YAML, a reference Stop hook in bash, and a test harness; ran the hook against six synthetic scenarios in scratch; all six passed with expected allow/block outputs. Scratch directory deleted before writing this file.

## Empirical Foundation: What Real Subagent Outputs Look Like

### research-methods-reviewer outputs

Only one example exists (`research-design-review-014.md`), so structural generalization is tentative. What that one example shows, though, is striking and useful:

- **Length: 272 lines.** Substantially longer than any citation or argument audit in the corpus. A research-design review that is dramatically shorter than this would be suspect.
- **Distinctive top-level heading: `# Research Design Review: Cycle N (topic)`**, followed by `## Reviewer summary`, `## Per-question audit`, then per-question subheadings (`### Q1`, etc.).
- **Belief-mapping phrasing appears verbatim per question.** Every audited question contains a paragraph beginning with "**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?" This is a signature phrase from ADR-060's scope specification — it is in the agent definition, not the prompt, and a fresh-context subagent can be expected to emit it reliably.
- **Reflexive risk note section.** The single example includes a `## Reflexive risk note` section that directly discusses the limits of its own execution ("this review may be well-formed but unfired," "this review may exhibit the embedded conclusion problem it audits"). That kind of meta-commentary is natural for a dedicated, fresh-context agent reading from a clean slate; an in-context fabrication under task immersion is less likely to produce it because the fabricating agent is the one *not* noticing the problem.
- **Evaluation vocabulary is procedural, not conclusory.** Flags are marked "Mild flag," "Flagged," or "None flagged" — a short, closed vocabulary. Suggested reformulations are phrased as "Suggested reformulation:" followed by the new wording.

### citation-auditor outputs

Sample: citation-audit-008 through -013 (six files). All six exhibit a near-identical skeleton:

- **First line always `# Citation Audit Report`.**
- **Metadata block starting with `**Audited document:**`** and usually `**Evidence trail:**` or `**Evidence trails:**`, then `**Date:**`.
- **`## Summary` section with exactly these bullet fields:** `Total references checked:`, `Verified:`, and usually `Issues found:`.
- **Prioritized issues in `## Issues`** with `### P1 — Must Fix`, `### P2 — Should Fix`, `### P3 — Consider` subsections (not all three always present).
- **Per-issue schema: `**Issue N:**`, `**Location:**`, `**Claim:**`, `**Finding:**`, `**Recommendation:**`.** This is a fill-in-the-blank structure that the subagent template has internalized.
- **Length: 70–128 lines.** Tight range. A citation audit of <50 lines is unusual unless the essay had very few references; >150 lines is unusual unless the audit found many issues.
- **Verified-references list at the end** enumerating references that passed.
- **Language is source-forensic**: "The paper exists. The DOI is correct. However, the lead author is..." This is the voice of an agent doing actual lookups.

### argument-auditor outputs

Sample: argument-audit-008 through -013, argument-audit-012, argument-audit-decide-037-039, argument-audit-decide-055-062 (eight files). Pattern is even tighter than citation audits:

- **First line always `# Argument Audit Report`.**
- **Metadata: `**Audited document:**` or `**Audited documents:**` (plural for multi-ADR audits), `**Evidence trail:**` or `**Evidence layer:**`, `**Date:**`.
- **`## Summary` section with:** `Argument chains mapped:` and `Issues found:` as explicit bullet fields.
- **Argument chain enumeration** in a `## Argument Chains Mapped` or `## Argument Chain Map` section, typically numbered Chain 1 → Chain N with an arrow-chained prose description ("X → Y → Z → conclusion").
- **Per-issue schema:** `**Issue P1-A/P2-A/etc**`, `**Location:**`, `**Claim:**`, `**Evidence gap:**`, `**Recommendation:**`. The `Evidence gap` field is the argument-auditor-specific signature — citation audits use `Finding:` in the same slot.
- **Length: 111–195 lines.** Slightly longer than citation audits on average.
- **`## Overall Assessment`** at the end summarizing the argument's major gaps.

### Discriminator findings

**State B (not fired) is trivially detected.** A `test -f` on the expected path, or equivalently a `[[ -s ... ]]` check for non-zero size, catches every case where nothing happened. This is cheap and reliable.

**State A vs. State C: the honest finding is that fully reliable discrimination is not tractable without system metadata that does not currently exist.** An in-context fabrication by an agent that has read enough of its own audit artifacts can reproduce the section headings, the field names, the evaluative vocabulary, the length, and even the structural pattern. Everything on the page is producible by a competent language model with access to prior examples. This is the AID cycle problem (S1 item 5) applied to artifacts instead of prose: if the fabricator and the verifier are the same model with the same training, textual discriminators are in principle circumventable.

That said, there is a spectrum of tractability. Discriminators fall into three buckets:

1. **Cheap and partially effective** (weak State C signal, strong State B signal):
   - File exists at expected path.
   - File size above a reasonable floor (catches trivial stubs: the Case 3 test where an agent fabricated `# stub` for a "dispatch" fails instantly on the 2000-byte floor).
   - Required top-level heading present (`# Citation Audit Report` etc.).
   - Required field labels present (`**Audited document:**`, `Total references checked:`, `Argument chains mapped:`).
   - Minimum section count (Summary + Issues + either Verified References or Overall Assessment).
   
   These catch State B and trivial State C. They would have caught the Cycle 9 item 4 failure as it actually occurred, **if** the agent's in-context fallback was a brief summary rather than a full fabrication. We don't know empirically which kind of fallback happened.

2. **Medium-cost, weakly effective** (somewhat stronger State C signal):
   - Count of `###` subsections above a minimum (real citation audits have ≥3; real argument audits have chain enumeration plus issues).
   - Length within the empirical band per audit type (70–195 lines for citation/argument audits).
   - Presence of audit-specific signature phrases (`Belief-mapping.` for research-design-reviews; `Evidence gap:` for argument-audits; `Verified References` section for citation-audits).
   - Field cardinality: a real citation audit has many `Issue N:` entries for a long essay; a single-issue fabrication for a heavily cited essay is anomalous.
   
   An adversarial fabricator can satisfy all of these by pattern-matching on prior audits in the repo. A non-adversarial drift — an agent that "just writes a summary" rather than dispatching — would typically fail these because the agent producing a summary is not attempting to pass a conformance check.

3. **Would discriminate reliably but requires metadata that does not currently exist** (strong State A signal, not implementable today):
   - **Subagent provenance stamp in the artifact frontmatter.** If the dispatched agent writes a frontmatter block (`---\nsubagent_type: citation-auditor\nagent_id: <session-derived>\nmodel: sonnet-4\ndispatched_from_session: <parent-session-id>\ntimestamp: ...\n---`), and the dispatching harness injects this automatically from the `tool_response` metadata, then an in-context fabrication by the parent agent either cannot produce the provenance (because it doesn't have the parent-session-id from outside its own context) or must forge it — and forgery becomes another structural failure the hook can detect. **This requires either (a) the subagent template itself to include frontmatter writing as a mandatory first step, or (b) a harness-side post-processor that stamps the artifact on successful Task return.** Neither exists today.
   - **Cross-check against the Task tool's `tool_response` content.** Spike S1 noted that `AgentOutput` includes a `content` array (the subagent's final message) but no `output_file` field for synchronous completions. If the hook layer could compare the artifact file's content to a known-hash-in-the-tool-response, it could verify the file was written by the subagent reporting it. The hash linkage does not exist currently; it would have to be added either by the subagent (compute and emit hash at end of its final message) or by the harness.
   - **Distinct file-system actor.** On Unix, the subagent's Write tool calls might register under a distinguishable process ancestry, but Claude Code runs subagents in the same process tree as the parent, so this does not discriminate.
   - **Timing assertions.** A real citation audit takes minutes of wall-clock time for the subagent's tool calls (Read of essay + Read of research log + WebSearch for references); an in-context fabrication takes seconds. If the hook could check that the artifact's mtime lags the dispatch time by at least N seconds, State C becomes slightly harder to produce — but this is easily defeated by padding, and conflates legitimate fast dispatches with fabrications.

**The honest conclusion:** without frontmatter provenance (a system change not addressed by this spike or S1), State A vs. State C discrimination is best-effort using structural heuristics. The structural heuristics are worth implementing — they catch State B fully and raise the bar for State C from "trivial" to "requires pattern-matching the audit corpus" — but they are a mitigation, not a solution. **The cycle's essay must not claim that the hook+manifest layer distinguishes State A from State C in general. What it can claim is that (a) State B is fully detected and (b) silent in-context fabrication is pushed from trivially easy to requiring active, structure-aware effort — which is a meaningful increase in resistance without being a proof of isolation.**

The complementary move, which S1 already noted, is that the PostToolUse-on-`Agent` hook catches the moment of successful dispatch. If that hook records a "dispatched at T, expected artifact P" event in a session-local state file, the Stop hook can check not only that the artifact exists but that the PostToolUse event fired for it. State C then requires both fabricating the artifact *and* somehow inducing a fake PostToolUse event — which is structurally impossible because the agent can't inject hook events. **This compound check (PostToolUse-dispatch-log + Stop-manifest-check) is materially stronger than either alone and is the right production recommendation.** This spike's manifest is the Stop-side half of that compound check.

## Atomic Testable Assertions per Mechanism

Following NIST conformance testing methodology, each assertion is one observable property, machine-checkable, narrowly focused.

### research-methods-reviewer

Expected path: `docs/housekeeping/audits/research-design-review-{cycle}.md`.

**Existence assertions (detect State B):**
- E1: File exists at the expected path.

**Structural assertions (detect trivial State C and baseline State A):**
- S1: File size ≥ 2000 bytes. (The one example is ~20KB; a 2KB floor is conservative and still catches stubs.)
- S2: First non-empty line matches `^# Research Design Review`.
- S3: Contains `## Per-question audit` section heading.
- S4: Contains the literal phrase `Belief-mapping` somewhere in the body (ADR-060 signature phrase).

**Provenance/discrimination assertions (attempt State A vs C):**
- P1 (aspirational, not implementable today): Contains a `---` frontmatter block with `subagent_type: research-methods-reviewer` and a session-linked `agent_id`. **Requires subagent template change or harness post-processor to stamp artifacts. Flagged as future work.**
- P2 (heuristic, weak): Contains at least N `### Q` or `### A`/`### C` per-question subheadings where N is the number of questions in the dispatched question set. This requires the hook to know the question count, which it can approximate from the latest research log. Tractable but fragile.
- P3 (heuristic, weak): Mean line length and vocabulary diversity within typical ranges for real reviews. Not worth the implementation cost; flagged as future work if the corpus grows.

### citation-auditor

Expected path: `docs/housekeeping/audits/citation-audit-{cycle}.md`.

**Existence assertions:**
- E1: File exists at expected path.

**Structural assertions:**
- S1: File size ≥ 1500 bytes.
- S2: First non-empty line is `# Citation Audit Report`.
- S3: Contains `**Audited document:**` metadata field.
- S4: Contains `## Summary` section heading.
- S5: Contains `Total references checked:` literal field.
- S6: Contains `Verified:` literal field.
- S7 (optional): Contains at least one `### P` subsection (P1/P2/P3) OR `## Verified References` section.

**Provenance/discrimination assertions:**
- P1 (aspirational): Frontmatter `subagent_type: citation-auditor` and session linkage. Flagged.
- P2 (heuristic): File length in 70–150 line band (empirical range ±margin). Weakly discriminative; a long essay may produce a longer audit.
- P3 (heuristic): Count of `**Issue N:**` or `**Finding:**` substrings roughly matches the declared `Total references checked` minus `Verified`. Tractable but requires parsing the declared summary values and comparing — a production-level implementation would be worth it.

### argument-auditor

Expected paths: `docs/housekeeping/audits/argument-audit-{cycle}.md` (research) or `docs/housekeeping/audits/argument-audit-decide-{cycle}.md` (decide). The decide variant is distinguished because argument audits on ADRs are a separate dispatch site.

**Existence assertions:**
- E1: File exists at expected path.

**Structural assertions:**
- S1: File size ≥ 1500 bytes.
- S2: First non-empty line is `# Argument Audit Report`.
- S3: Contains `**Audited document:**` or `**Audited documents:**` field.
- S4: Contains `## Summary` section.
- S5: Contains `Argument chains mapped:` literal field.
- S6: Contains `Issues found:` literal field.
- S7: Contains a `## Argument Chain Map` or `## Argument Chains Mapped` section heading.

**Provenance/discrimination assertions:**
- P1 (aspirational): Frontmatter linkage. Flagged.
- P2 (heuristic, moderate): Contains `Evidence gap:` substring at least once. This is the argument-auditor-specific per-issue field (citation audits use `Finding:` in the same slot), and its presence discriminates argument audits from citation audits that were renamed or mislabeled. Cheap and worth including.
- P3 (heuristic, weak): Count of `Chain N` references in body matches declared `Argument chains mapped:` count. Again, cheap once you parse the summary.

### susceptibility-snapshot-evaluator

Expected path: **proposed convention** `docs/housekeeping/audits/susceptibility-snapshot-{cycle}-{phase}.md`. (The current ADR-057 and SKILL.md do not fix a path; S1 flagged this as a softspot. This spike proposes the convention above: cycle number + phase name so one snapshot exists per phase boundary.)

**Existence assertions:**
- E1: File exists at the phase-specific path.
- E2 (cross-phase): The snapshot file's mtime is newer than the mtime of the last cycle-status.md edit, ensuring the snapshot belongs to this phase transition and not a stale prior one. (This is the watchdog property S1's Stop hook discussion emphasized.)

**Structural assertions:**
- S1: File size ≥ 400 bytes. (Snapshots are smaller than audits; 400 is a floor that catches stubs but allows genuinely brief snapshots.)
- S2: First non-empty line matches `^# Susceptibility Snapshot`.
- S3: Contains `**Phase:**` field.
- S4: Contains a `Signals observed:` or equivalent field.

**Provenance/discrimination assertions:**
- P1 (aspirational): Frontmatter with `subagent_type: susceptibility-snapshot-evaluator`. Flagged.
- P2 (heuristic, weak): Snapshot content references at least one signal from the ADR-057 canonical list (assertion density, solution-space narrowing, framing adoption, confidence markers at artifact-production, declining alternative engagement). Tractable but requires maintaining the vocabulary in the manifest.

**Critical caveat on path convention.** Proposing a path convention is not the same as establishing it. For this manifest to work, the susceptibility-snapshot dispatch text in `rdd/SKILL.md` (line 202 area) needs to be updated to include the specific path template in the dispatch prompt, and the subagent definition needs to be updated to write to that path. This is a skill-text and agent-definition change that is out of scope for this spike but is a precondition for the manifest's susceptibility-snapshot entries to be meaningful. **The manifest currently encodes an aspirational convention; production adoption requires the skill/agent update first.**

## Per-Phase Manifest Format

### Format specification

```yaml
# Tier 1 Phase Manifest — which artifacts must exist at each phase boundary
# Consumed by: the Stop hook (hooks/scripts/tier1-phase-manifest-check.sh)
# Format version: 1
#
# Path templates use the literal token {cycle} for the current cycle/essay
# number (zero-padded three digits). The hook substitutes this at check time.
#
# min_bytes is a size floor. It catches State B (empty) and trivial State C
# (brief fabricated stub). It is NOT a reliable discriminator of a well-faked
# in-context fabrication — see the Discriminator findings section above.

format_version: 1

phases:
  <phase-name>:                    # e.g. research, discover, decide, ...
    description: >
      Human-readable explanation of which Tier 1 obligations this phase has
      and why. Used in the block reason that reaches the model.
    required_mechanisms:
      - mechanism: <canonical-name>          # subagent_type identifier
        path_template: <path with {cycle}>   # expected output path
        min_bytes: <int>                     # size floor in bytes
        required_headers:                    # must all appear in the file
          - "<literal line prefix>"
        required_fields:                     # must all appear somewhere
          - "<literal field label>"
```

Design properties:

- **Per-phase structure.** The top-level `phases` dictionary is keyed by the phase names used in `docs/housekeeping/cycle-status.md` (`research`, `discover`, `model`, `decide`, `architect`, `build`, `play`, `synthesize`). The hook looks up the current phase and iterates only that phase's requirements. Adding a new phase means adding a new key.
- **Per-mechanism encoding.** Each required mechanism lists the canonical name (matching the `subagent_type` the PostToolUse hook checks), the path template, a size floor, and assertion lists. This keeps each mechanism's obligations in one place and makes the PostToolUse-side and Stop-side checks use the same identifiers.
- **Cycle-aware via template substitution.** The `{cycle}` token in path templates resolves to the current cycle number at check time. The hook infers the cycle from `ls docs/essays/` taking the highest `NNN-` prefix. This is fragile if essays can be started out of order but matches the project's current convention.
- **Extensible.** Adding a new Tier 1 mechanism is a single new entry under the relevant phase(s). Adding a new phase is a new top-level key.

### Concrete manifest for the current pipeline

```yaml
format_version: 1

phases:

  research:
    description: >
      Before a research phase may complete, the current cycle must have:
      a research design review (from research-methods-reviewer, dispatched
      BEFORE the first research loop), a citation audit, and an argument
      audit (the latter two dispatched after the essay is written and after
      any revision in response to audit findings).
    required_mechanisms:
      - mechanism: research-methods-reviewer
        path_template: docs/housekeeping/audits/research-design-review-{cycle}.md
        min_bytes: 2000
        required_headers:
          - "# Research Design Review"
          - "## Per-question audit"
        required_fields:
          - "Belief-mapping"
      - mechanism: citation-auditor
        path_template: docs/housekeeping/audits/citation-audit-{cycle}.md
        min_bytes: 1500
        required_headers:
          - "# Citation Audit Report"
          - "## Summary"
        required_fields:
          - "Total references checked:"
          - "Verified:"
          - "Audited document:"
      - mechanism: argument-auditor
        path_template: docs/housekeeping/audits/argument-audit-{cycle}.md
        min_bytes: 1500
        required_headers:
          - "# Argument Audit Report"
          - "## Summary"
        required_fields:
          - "Argument chains mapped:"
          - "Issues found:"
          - "Audited document:"
      - mechanism: susceptibility-snapshot-evaluator
        path_template: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-research.md
        min_bytes: 400
        required_headers:
          - "# Susceptibility Snapshot"
        required_fields:
          - "Phase:"
          - "Signals observed:"

  decide:
    description: >
      Before decide may complete, the ADRs for this cycle must have been
      argument-audited (and re-audited after any revision). A susceptibility
      snapshot for the decide phase transition must also exist.
    required_mechanisms:
      - mechanism: argument-auditor
        path_template: docs/housekeeping/audits/argument-audit-decide-{cycle}.md
        min_bytes: 1500
        required_headers:
          - "# Argument Audit Report"
          - "## Summary"
        required_fields:
          - "Argument chains mapped:"
          - "Issues found:"
      - mechanism: susceptibility-snapshot-evaluator
        path_template: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-decide.md
        min_bytes: 400
        required_headers:
          - "# Susceptibility Snapshot"
        required_fields:
          - "Phase:"
          - "Signals observed:"

  discover:
    required_mechanisms:
      - mechanism: susceptibility-snapshot-evaluator
        path_template: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-discover.md
        min_bytes: 400
        required_headers: ["# Susceptibility Snapshot"]
        required_fields: ["Phase:"]

  model:
    required_mechanisms:
      - mechanism: susceptibility-snapshot-evaluator
        path_template: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-model.md
        min_bytes: 400
        required_headers: ["# Susceptibility Snapshot"]
        required_fields: ["Phase:"]

  architect:
    required_mechanisms:
      - mechanism: susceptibility-snapshot-evaluator
        path_template: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-architect.md
        min_bytes: 400
        required_headers: ["# Susceptibility Snapshot"]
        required_fields: ["Phase:"]

  build:
    required_mechanisms:
      - mechanism: susceptibility-snapshot-evaluator
        path_template: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-build.md
        min_bytes: 400
        required_headers: ["# Susceptibility Snapshot"]
        required_fields: ["Phase:"]

  play:
    required_mechanisms:
      - mechanism: susceptibility-snapshot-evaluator
        path_template: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-play.md
        min_bytes: 400
        required_headers: ["# Susceptibility Snapshot"]
        required_fields: ["Phase:"]

  synthesize:
    required_mechanisms:
      - mechanism: argument-auditor
        path_template: docs/housekeeping/audits/argument-audit-synthesize-{cycle}.md
        min_bytes: 1500
        required_headers: ["# Argument Audit Report"]
      - mechanism: susceptibility-snapshot-evaluator
        path_template: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-synthesize.md
        min_bytes: 400
        required_headers: ["# Susceptibility Snapshot"]
        required_fields: ["Phase:"]
```

**Confidence notes per phase:**

- **research and decide:** high confidence. These are the phases with the clearest Tier 1 dispatch sites in current skill text and with the most audit examples to derive assertions from.
- **discover, model, architect, build, play:** the only load-bearing Tier 1 obligation is the susceptibility snapshot at phase boundary, per ADR-057. All other mechanisms in these phases are Tier 2 or are conversational (AID cycle) and fall outside the hook layer per S1.
- **synthesize:** includes a synthesis-phase argument audit because synthesize produces an outline/roadmap that warrants its own audit pass. This is partially speculative — current `synthesize/SKILL.md` may not currently mandate an argument audit; if not, the manifest should drop the first entry until the skill text requires it.

## Reference Stop Hook Script

The script below was implemented and tested against six synthetic scenarios in scratch (all passed). It is syntactically valid bash with `set -uo pipefail`, uses `jq` and `python3+PyYAML` as its only dependencies (both present in the project's existing tooling — `jq` is standard in the hook stack per ADR-033; `python3+PyYAML` ships with the pyenv setup already in use). It deliberately fails safe: internal hook errors emit `allow` with a stderr log rather than wedging the agent.

```bash
#!/usr/bin/env bash
# Reference Stop hook: tier1-phase-manifest-check
# Consumes a per-phase manifest and verifies required Tier 1 artifacts exist
# and match structural assertions before allowing the agent to stop.
#
# Invoked by Claude Code on the Stop event. Reads hook input JSON on stdin,
# emits a JSON decision object on stdout.
#
# Exit codes:
#   0 — emit JSON decision (allow or block) to stdout
#   The hook never exits nonzero: a broken hook must never wedge the agent.
#   On self-failure, it emits allow-with-warning and logs to stderr.

set -uo pipefail

MANIFEST_PATH="${CLAUDE_PLUGIN_ROOT:-.}/hooks/manifests/tier1-phase-manifest.yaml"
REPO_ROOT="$(pwd)"
CYCLE_STATUS="${REPO_ROOT}/docs/housekeeping/cycle-status.md"

# --- Fail-safe wrappers ------------------------------------------------------
die_open() {
    local msg="$1"
    printf 'tier1-phase-manifest-check: internal failure: %s\n' "$msg" >&2
    printf '{"decision":"allow","reason":"hook self-failed: %s"}\n' "$msg"
    exit 0
}

allow() { printf '{"decision":"allow"}\n'; exit 0; }

block() {
    local reason="$1"
    jq -nc --arg r "$reason" '{decision:"block", reason:$r}'
    exit 0
}

# --- Read hook input ---------------------------------------------------------
INPUT="$(cat)" || die_open "could not read stdin"
SESSION_ID="$(printf '%s' "$INPUT" | jq -r '.session_id // empty')"

# --- Determine current phase from cycle-status.md ---------------------------
# The Stop hook input does NOT carry phase directly. We read it from the
# project's canonical phase marker. If absent, fail safe (allow).
if [[ ! -f "$CYCLE_STATUS" ]]; then
    allow
fi

CURRENT_PHASE="$(grep -E '^\*\*Phase:\*\*' "$CYCLE_STATUS" | tail -1 \
    | sed -E 's/^\*\*Phase:\*\*[[:space:]]*([A-Za-z_-]+).*/\1/' \
    | tr '[:upper:]' '[:lower:]')"
[[ -z "$CURRENT_PHASE" ]] && allow

# --- Determine current cycle number -----------------------------------------
# Highest NNN in docs/essays/NNN-*.md is the canonical cycle counter.
CURRENT_CYCLE="$(ls "${REPO_ROOT}/docs/essays/" 2>/dev/null \
    | grep -E '^[0-9]{3}-' \
    | sed -E 's/^([0-9]{3}).*/\1/' \
    | sort -n | tail -1)"
[[ -z "$CURRENT_CYCLE" ]] && allow

# --- Load and parse manifest -------------------------------------------------
[[ -f "$MANIFEST_PATH" ]] || die_open "manifest not found at $MANIFEST_PATH"

MANIFEST_JSON="$(python3 -c '
import sys, json, yaml
with open(sys.argv[1]) as f:
    print(json.dumps(yaml.safe_load(f)))
' "$MANIFEST_PATH" 2>/dev/null)" || die_open "could not parse manifest YAML"

# --- Extract phase entry -----------------------------------------------------
PHASE_ENTRY="$(printf '%s' "$MANIFEST_JSON" \
    | jq -c --arg p "$CURRENT_PHASE" '.phases[$p] // empty')"

# No obligations for this phase → allow.
[[ -z "$PHASE_ENTRY" || "$PHASE_ENTRY" == "null" ]] && allow

# --- Iterate required mechanisms --------------------------------------------
FAILURES=()

while IFS= read -r mech; do
    mechanism="$(printf '%s' "$mech" | jq -r '.mechanism')"
    path_tmpl="$(printf '%s' "$mech" | jq -r '.path_template')"
    min_bytes="$(printf '%s' "$mech" | jq -r '.min_bytes // 500')"
    required_headers="$(printf '%s' "$mech" | jq -r '.required_headers[]? // empty')"
    required_fields="$(printf '%s' "$mech" | jq -r '.required_fields[]? // empty')"

    # Substitute the {cycle} template token.
    path="${path_tmpl//\{cycle\}/$CURRENT_CYCLE}"
    full_path="${REPO_ROOT}/${path}"

    # E1: file exists
    if [[ ! -f "$full_path" ]]; then
        FAILURES+=("$mechanism: expected artifact missing at $path")
        continue
    fi

    # S1: size floor
    actual_bytes="$(wc -c < "$full_path" | tr -d ' ')"
    if (( actual_bytes < min_bytes )); then
        FAILURES+=("$mechanism: artifact at $path is too small (${actual_bytes}B < ${min_bytes}B min) — likely empty or truncated")
        continue
    fi

    # S2: required headers
    while IFS= read -r hdr; do
        [[ -z "$hdr" ]] && continue
        if ! grep -qF "$hdr" "$full_path"; then
            FAILURES+=("$mechanism: artifact at $path missing required header '$hdr'")
        fi
    done <<< "$required_headers"

    # S3: required field labels
    while IFS= read -r field; do
        [[ -z "$field" ]] && continue
        if ! grep -qF "$field" "$full_path"; then
            FAILURES+=("$mechanism: artifact at $path missing required field '$field'")
        fi
    done <<< "$required_fields"
done < <(printf '%s' "$PHASE_ENTRY" | jq -c '.required_mechanisms[]?')

# --- Emit decision -----------------------------------------------------------
if (( ${#FAILURES[@]} == 0 )); then
    allow
fi

REASON="Tier 1 manifest check failed for phase '${CURRENT_PHASE}' (cycle ${CURRENT_CYCLE}). The phase cannot complete until the following artifacts are produced by their dispatched specialist subagents:"$'\n\n'
for f in "${FAILURES[@]}"; do
    REASON+="  - ${f}"$'\n'
done
REASON+=$'\n'"Do NOT fabricate these artifacts in your own context. The mechanism's value is that the artifact comes from an isolated subagent dispatch, not that a file of the expected shape exists. If the Task dispatch previously failed, surface the failure to the user explicitly and stop."

block "$REASON"
```

**Test harness results (all passed):**

| # | Scenario | Expected | Observed |
|---|---|---|---|
| 1 | No essay yet, no artifacts (cycle indeterminate) | allow (fail-safe) | allow |
| 2 | Research phase, essay 014 exists, no audits | block naming all 4 missing artifacts | block, 4 failures listed |
| 3 | Research phase, 7-byte stub audits | block on size floor | block, 4 size-floor failures |
| 4 | Research phase, realistic synthesized audits with correct headers | allow | allow |
| 5 | Research phase, all audits present except susceptibility snapshot | block naming only the snapshot | block, 1 failure listed |
| 6 | Unknown phase (not in manifest) | allow | allow |

The complete test harness is in the spike's scratch directory (now deleted); reproducible by recreating the manifest and running the six synthetic cases.

## Validation Against Issue #9

### Item 4: subagent dispatches silently fell back to in-context

**What happened:** The orchestrator dispatched argument-auditor / citation-auditor, the Task tool call (apparently) failed or was never made, and the agent produced audit-shaped output in its own context. The user's confidence that the mechanism had fired was false.

**State B coverage (did it fire at all):** **fully caught.** If no file exists at `docs/housekeeping/audits/argument-audit-014.md`, the Stop hook's E1 check fails and emits a block naming the missing file. The test harness's Case 2 demonstrates this concretely.

**State C coverage (fired-but-fake):** **partially caught, honestly.** A brief in-context summary (a few hundred bytes, no structural headers, no field labels) fails the size floor and structural assertions — test harness's Case 3 demonstrates this for 7-byte stubs. A full-effort fabrication by a task-immersed agent, though, would likely satisfy the current structural assertions because an agent under task immersion producing audit-shaped output is drawing on its memory of prior audits in the repo and can reasonably reproduce the heading/field patterns. **The manifest's structural assertions raise the bar from "agent writes three sentences and calls it done" to "agent has to reproduce the full skeleton" — a meaningful increase in friction, but not a proof of isolation.** The only complete State C defense is the compound check (PostToolUse-dispatch-log AND Stop-manifest-check) that S1 recommends; the manifest on its own is half of that compound.

**Would the manifest have caught the specific Cycle 9 item 4 failure?** Almost certainly yes, because the retrospective descriptions of that failure suggest the fallback was abbreviated — the user noticed the mechanism hadn't fired *because the artifact looked thin*, not because a full fabrication was undetectable. The manifest's size and structural floors would have caught thin fabrications at the Stop boundary before the user had to notice.

### Item 5: susceptibility snapshot never ran

**What happened:** The susceptibility snapshot mechanism did not fire at any phase boundary during the cycle. No file was produced. The user did not notice until the cycle was well along.

**Catch path:** **fully caught**, but contingent on the path-convention adoption. The manifest's `susceptibility-snapshot-{cycle}-{phase}.md` entry is in every phase's `required_mechanisms` list. At every phase boundary where the agent attempts to stop, the Stop hook reads the current phase from `cycle-status.md`, looks up the snapshot requirement, runs E1, and emits a block naming the missing snapshot.

**Concretely,** the block reason would be:
> Tier 1 manifest check failed for phase 'discover' (cycle 014). The phase cannot complete until the following artifacts are produced by their dispatched specialist subagents:
>
>   - susceptibility-snapshot-evaluator: expected artifact missing at docs/housekeeping/audits/susceptibility-snapshot-014-discover.md
>
> Do NOT fabricate these artifacts in your own context. The mechanism's value is that the artifact comes from an isolated subagent dispatch...

The agent receives this on its next turn, unavoidably, because Stop `decision: "block"` genuinely prevents stopping (per S1). The agent cannot ignore it; it must either produce the snapshot (via actual dispatch) or surface the failure to the user. This is the strongest case the manifest handles and it handles it well.

**Precondition:** the susceptibility-snapshot dispatch in `rdd/SKILL.md` needs to be updated to specify the phase-keyed path template, and the susceptibility-snapshot-evaluator agent needs to know to write to that path. Without that update, the subagent writes to some other path (or no path), and the manifest's E1 check fails even on legitimate runs. **This is a skill/agent change that is out of scope for S2 but must happen before the manifest's susceptibility-snapshot entries are enforceable.**

### Item 6: belief-mapping at user pushback

**Not addressable by the manifest. Explicit acknowledgment per S1's finding.**

Belief-mapping at user pushback is a conversational move with no expected file artifact. There is nothing to put in the manifest. The manifest does not pretend to handle this mechanism; its absence from the manifest is not an oversight but a statement of scope. Per S1 and ADR-062, this category of mechanism lives entirely inside the agent's own conversational output, has no transport layer to instrument, and is not reachable by the hook layer. It has to be addressed (if at all) by model-level training or by Tier 1 structural backstops that catch its downstream consequences — neither of which is S2's subject.

The cycle's essay should be precise about this boundary: the manifest+hook covers items 1–3 fully (dispatch-existence side) and item 4 fully (susceptibility snapshot side, given the path convention update). Items 5 and 6 from Issue #9's numbering remain open — item 5 because the problem is conversational, not dispatched, and item 6 because the trigger is a semantic pattern in user input. Three out of five Issue #9 items get catch-path coverage from this work; the remaining two require different layers.

## Open Implementation Questions

The following need to be resolved before the manifest+hook approach is production-ready. The spike cannot answer these alone.

**Q1. How does the Stop hook determine the current phase?**

The spike's hook reads `docs/housekeeping/cycle-status.md` for a `**Phase:**` line, but this depends on the project's convention of keeping that file current. If phase transitions lag the status file, the hook checks the wrong phase's requirements. Alternatives:
- Require the orchestrator to write the phase marker *before* any other phase work (tightening the `cycle-status.md` convention into a hard precondition).
- Pass the phase explicitly in the Stop hook input via a `sessionMessage` the orchestrator emits at phase-start. The Claude Code hooks spec does not currently propagate custom session messages this way; this would need a design.
- Infer the phase from the most recently edited artifact in the current cycle's directory, which is heuristic and fragile.

The production recommendation is option 1: tighten the `cycle-status.md` convention and audit adherence. This is the same recommendation S1 made for the PostToolUse-on-`Edit`(`cycle-status.md`) approach.

**Q2. How does the hook determine the current cycle (essay number)?**

The spike's hook uses the highest `NNN-` prefix in `docs/essays/`. This works when essays are added monotonically but breaks if a cycle starts and reuses an older number, or if cycles are branched. A more robust solution is to put the cycle number explicitly in `cycle-status.md` (the status file already carries a `Cycle:` field in practice). The hook should read that field.

**Q3. How should the compound check (PostToolUse + Stop) be wired?**

The manifest alone is the Stop half. Full State C defense needs the PostToolUse-on-`Agent` hook to log "dispatched mechanism X, expected path Y, time T" to a session-scoped state file, and the Stop hook to check that every manifest entry has a matching log entry. This requires:
- A convention for the state file path (per-session, cleared on SessionStart, kept in `$CLAUDE_PLUGIN_DATA` or equivalent).
- An agreement on what the PostToolUse hook writes and when (on successful dispatch only? also on permission-deny?).
- A policy on stale log entries across sessions.

Nothing here is hard, but none of it is decided yet. This spike's manifest is compatible with all of it — the manifest schema doesn't change — but the hook script needs extension.

**Q4. How are State A vs State C false positives and false negatives handled?**

The structural assertions will produce false positives (an unusually brief but legitimate audit gets blocked) and false negatives (a sophisticated fabrication passes). The production recommendation is:
- **Errors should lean toward false positive**, because a false positive is recoverable (re-dispatch, or manual override with an explicit user acknowledgment) while a false negative leaves the user with confidence in a failure that didn't occur. This matches the watchdog pattern: bias toward alarm.
- **Size floors should be calibrated to the corpus** and revisited periodically (once per major version) rather than fixed forever. The numbers in this manifest are derived from a corpus of 6 citation audits, 8 argument audits, and 1 research-methods review — small sample.
- **The manifest should include a per-mechanism `override_marker` field** (future extension) that allows the user to mark a specific artifact as "manually verified, pass" with a comment. This converts a false positive from a block into a review step.

**Q5. Meta-failure mode: what if the hook script itself has a bug?**

The spike's hook emits `allow` on any internal failure (missing manifest, YAML parse error, etc.) and logs to stderr. This is the right default because wedging the agent on a hook bug is worse than missing a check. But it means a subtle bug in the hook becomes a silent failure of the enforcement layer — and the failure looks identical to a correct allow. Mitigations:
- The hook's stderr output should be captured somewhere visible (per-session log file the user can inspect).
- A periodic `hook self-test` (running the hook against a known-good and known-bad synthetic manifest at SessionStart) would catch the most likely classes of bug.
- The project should keep the hook simple — complexity budget is the enemy of correctness.

This is the same meta-reliability question every reliability layer eventually faces (who guards the guards?) and the production answer is "test the guard continuously, not once."

**Q6. Precondition: path convention adoption for susceptibility snapshots.**

Out of scope for S2 but required before deployment: `rdd/SKILL.md` line 202 dispatch instructions need to specify the `susceptibility-snapshot-{cycle}-{phase}.md` path, and the `susceptibility-snapshot-evaluator` agent definition needs to accept and honor that path. This is a skill-text + agent-definition change that should be bundled with the hook's introduction, not left for later.

## Implications for Cycle 10

### What S2 contributes to the cycle's recommendation

The cycle's essay now has a concrete, referenceable deliverable: a per-phase manifest format and a reference hook that proves the format is consumable. This is not a sketch — it is a tested format, a tested script, and a validation walkthrough against the Issue #9 evidence. When the essay argues that the methodology graduates from "well-written instructions" to "instructions plus harness-structural enforcement," it can point at this manifest as the specific shape the harness-structural layer takes.

The manifest is also the anchor S1 predicted it would be. S1 recommended a sixth hook (PostToolUse on Agent) and a strengthened Stop hook with a phase manifest; S2 delivers the manifest in a form the Stop hook can consume today, with a working reference implementation. The two spikes are now genuinely complementary: S1 established feasibility and architecture; S2 established the data format and reference consumer. Together they constitute a buildable recommendation.

### Honest limits of the acceptance-criteria approach

**What the manifest catches:**
- State B (nothing fired) for all four hook-feasible Tier 1 mechanisms.
- Trivial State C (brief fabricated stubs) via size and header floors.
- The specific Issue #9 item 5 failure (susceptibility snapshot never ran), given the path convention.
- The Issue #9 item 4 failure as it plausibly occurred in practice (thin in-context fallback).

**What the manifest does not catch:**
- Sophisticated State C: a task-immersed agent drawing on prior audits in the repo to reproduce the full audit skeleton in-context. Structural assertions raise the bar meaningfully but are circumventable by a motivated fabricator. The complete defense requires a PostToolUse dispatch log (the compound check, Open Question Q3) and, aspirationally, artifact provenance frontmatter (a system change this spike cannot make alone).
- Issue #9 item 5 (AID cycle). No artifact, no manifest entry.
- Issue #9 item 6 (belief-mapping at user pushback). Conversational trigger, no artifact, no manifest entry.
- Phase transitions that happen in prose without a corresponding `cycle-status.md` edit — the hook only sees the transition once the file is updated, and if the agent silently skips the update, the hook checks the wrong phase's requirements. The production fix is tightening the convention so the cycle-status update is a hard precondition.

**Coverage tally against Issue #9's six items:**

| Item | Description | Manifest coverage |
|---|---|---|
| 1 | research-methods-reviewer not dispatched | **Full State B; partial State C** |
| 2 | citation-auditor not dispatched | **Full State B; partial State C** |
| 3 | argument-auditor not dispatched / re-audit skipped | **Full State B for primary dispatch; re-audit requires compound check** |
| 4 | Subagent silent fallback to in-context | **Partial: catches the actual observed failure, doesn't catch a hypothetical high-effort fabrication** |
| 5 | Susceptibility snapshot never ran | **Full, contingent on path convention adoption** |
| 6 | Belief-mapping at user pushback | **None — structurally out of scope** |

Three items (1, 2, 5) fully covered; two items (3, 4) partially covered with the remaining gap addressable by the compound check; one item (6) explicitly out of scope. This is a meaningful claim, and it is narrower than "hooks solve Tier 1," which would be overclaiming.

The cycle's essay should make this coverage boundary explicit. The methodology graduation S1 named is real — the reliability claim is moving from prose alone to prose plus harness verification — but it is bounded by what hooks can see. Hooks can see artifact files and tool calls. They cannot see conversational moves the agent makes in its own voice. Items 5 and 6 of Issue #9 are the shape of that boundary, and honestly naming it is more valuable than pretending the manifest covers them.
