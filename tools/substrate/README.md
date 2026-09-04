# Substrate toolchain

The Substrate is one plain-JSON record per governance unit (ADR-099). Surface Views are derived from it single-source; nobody hand-edits a view.

| Where | What |
|---|---|
| `docs/substrate/<type>/<file>.json` | Records. Types: `adr` (`adr-NNN.json`; form `full` for units authored after ADR-099, `index` for legacy units), `pattern`, `term`. A record's `id` is `adr-NNN` or `<type>-<file stem>`. |
| `docs/views/overview.md`, `docs/views/<id>.md` | Surface Views (generated; Tier 2). Overview first; one drill-in per record with a "Surrounding records" footer. |
| `docs/decisions/adr-NNN-<slug>.md` | For `form: full` records only: derived ADR markdown with a header naming the record as canonical. Legacy ADR files are never written. |
| `docs/domain-model.md` between `<!-- substrate:terms:begin -->` and `<!-- substrate:terms:end -->` | One Concepts-table row per `term` record. The deriver never inserts the markers. |
| `tools/substrate/schema/*.schema.json` | Per-type schemas plus the shared link sub-schema. |

## Commands

```bash
node tools/substrate/validate.js            # every record under docs/substrate/; exit 1 lists '<path>: <field>: <message>'
node tools/substrate/derive.js              # validate, then regenerate every output (refuses on any invalid record)
node tools/substrate/derive.js --check      # write nothing; exit 1 listing outputs that differ, are missing, or are stale
node tools/substrate/derive.js --replace    # one-time: allow a prose ADR file to be replaced by its derived form
node --test 'tools/substrate/tests/*.test.js'
```

Options: `--substrate <dir>`, `--views <dir>`, `--decisions <dir>`, `--domain-model <file>` (defaults are the corpus paths, relative to the current directory).

## Rules the validator enforces

- **Note Discipline.** Every link needs a `note` unless its `type` is `references`. Any other `type` string is valid (extensible).
- **Per-type required fields.** `adr` full: `rejected_alternatives` (with reasons), `warrants` (each tagged `warrants_for`), `context`, `commitment`, `slug`; `adr` index: `canonical_source`, `summary`, `compressed: true`; `pattern`: `statement`, `applications`; `term`: `definition`, `cycle`. Optional fields may be added freely.
- **Resolution.** Link targets and pattern applications that look like record ids (`adr-`, `pattern-`, `term-`) must exist. Other targets (`invariant-0`, `external:...`) pass unresolved and render as plain text.
- **Identity.** `id` and `type` must match the file's directory and stem.

Zero dependencies; Node ≥ 18. Everything else about the design is in `docs/system-design.agents.md` §Cycle 020.
