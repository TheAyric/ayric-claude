# Ingest Log

Append-only record of wiki compile operations. The skill writes here after each ingest.

Format:

```text
## YYYY-MM-DD HH:MM

**Sources processed:**
- raw/.../file.md

**Pages created:**
- wiki/.../new-page.md

**Pages updated:**
- wiki/.../existing-page.md

**Notes:**
- Any decisions made, conflicts resolved, deferred items.
```

---

## 2026-04-24

**Sources processed:**

- `raw/notes/2026-04-24-semantic-model-primer.md`

**Pages created:**

- `wiki/concepts/semantic-model.md`
- `wiki/concepts/index.md`

**Pages updated:**

- _(none — first ingest)_

**Notes:**

- First ingest into the vault. Created the `concepts/` subdirectory referenced by `wiki/index.md`.
- Primary page is `concepts/semantic-model.md`, compiled from the primer using `templates/concept.md` structure.
- Added unresolved wikilinks for related concepts mentioned in the source but not yet compiled: [[star-schema]], [[grain]], [[dax]], [[direct-query]]. Listed as stubs in `concepts/index.md` so they show up as pending work.
- No decisions (ADRs) or dataset pages warranted — source was a general primer, not tied to a specific dataset or choice.
- Followed `CLAUDE.md` conventions (kebab-case filenames, Obsidian `[[wikilinks]]`, `_ops/ingest-log.md` for the log) rather than the skill's default (`wiki/log.md`, no topic subdirs).

## 2026-04-24 (2)

**Sources processed:**

- `raw/notes/2026-04-24-grain-primer.md`

**Pages created:**

- `wiki/concepts/grain.md`

**Pages updated:**

- `wiki/concepts/index.md` — replaced `[[grain]]` stub entry with a real summary

**Notes:**

- Resolves the `[[grain]]` stub wikilink already present in `wiki/concepts/semantic-model.md`. No edit to `semantic-model.md` was needed — Obsidian resolves `[[grain]]` by filename, so the link becomes live automatically now that `grain.md` exists.
- Cross-checked the grain primer against `semantic-model.md` for factual conflicts: both agree that grain is the most important modeling decision and that coarsening is irreversible. No contradictions; no edits required in the semantic-model page.
- New page adds detail beyond what `semantic-model.md` covers: three common grain patterns (transaction / daily snapshot / accumulating snapshot) and three downstream impacts (measure correctness, storage mode, relationship design).
- `grain.md` cross-links back to [[semantic-model]] and out to stubs [[star-schema]], [[dax]], [[direct-query]] — same stubs carried from the first ingest, still pending compilation.

## 2026-04-24 (3)

**Sources processed:**

- `raw/references/2026-04-24-tmdl-reference-summary.md`

**Pages created:**

- `wiki/concepts/tmdl.md` (~95 lines, well under the 300-line budget)

**Pages updated:**

- `wiki/concepts/semantic-model.md` — added `[[tmdl]]` to the Related section (reciprocal cross-link).
- `wiki/concepts/index.md` — added `[[tmdl]]` entry with a one-line summary.

**Notes:**

- First source from `raw/references/` rather than `raw/notes/`. Treated the same way; the raw subfolder is just organizational.
- Placed TMDL under `concepts/` alongside `semantic-model`. It's technical tooling rather than business-domain language, but there's no tooling/formats section in `wiki/index.md`, and creating one for a single page would be premature. If several tooling pages land later, revisit promoting them to their own subdirectory.
- Sections deviate from `templates/concept.md` (added Language mechanics, API and failure modes, Gotchas) because TMDL is technical enough that the generic concept template would flatten the content. Kept the template's spirit — one-line summary, What it is, Why it matters, Related, Sources.
- No conflicts with existing pages. `semantic-model.md` already mentioned measures authored in DAX, which TMDL reinforces without contradiction.
- Reciprocal cross-link: semantic-model → tmdl (Related), tmdl → semantic-model (Related + inline in the summary). Discoverable from both directions.
