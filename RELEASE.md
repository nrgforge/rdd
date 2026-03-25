# Release Process

## Versioning

Semver. The version lives in `.claude-plugin/plugin.json`.

| Bump | When |
|------|------|
| **Major** | Breaking changes to skill behavior, artifact formats, or workflow conventions |
| **Minor** | New skills/agents/hooks, new capabilities, non-breaking enhancements |
| **Patch** | Bug fixes, doc improvements, wording changes |

Pre-1.0, minor bumps may include breaking changes — note them in release notes.

## Cutting a Release

1. **Ensure main is clean and tested.**
   Run the plugin locally (`claude --plugin-dir ./`) and verify skills load without errors (`/doctor`).

2. **Update the version.**
   ```bash
   # Edit .claude-plugin/plugin.json — bump "version" field
   ```

3. **Update CHANGELOG.md.**
   Add a section for the new version with a summary of changes. Use `git log` since the last tag for reference:
   ```bash
   git log $(git describe --tags --abbrev=0 2>/dev/null || echo --root)..HEAD --oneline
   ```

4. **Commit and tag.**
   ```bash
   git add .claude-plugin/plugin.json CHANGELOG.md
   git commit -m "release: v0.X.Y"
   git tag v0.X.Y
   ```

5. **Push.**
   ```bash
   git push origin main --tags
   ```

6. **Create a GitHub release.**
   ```bash
   gh release create v0.X.Y --title "v0.X.Y" --notes-file - <<< "$(cat CHANGELOG.md | sed -n '/^## v0.X.Y/,/^## v/p' | head -n -1)"
   ```
   Or write the notes manually — just make sure they match the changelog.

## What Gets Released

Everything on `main` at the tagged commit. The marketplace cache pulls from the repo, so the tag is the release.
