# Claude Vault Audit — Opus 4.7

Date: 2026-04-16
Scope: `Main/Claude/` directory
Reference docs: `cowork-alignment-handoff.md`, `project-template-and-roles.md`, `gap-review-opus-4-7.md` (all Opus 4.6 output)
Framework: Anthropic best practices from `setup-cowork` and `skill-creator` skills

---

## TL;DR

The planning docs from Opus 4.6 are solid. The problem is almost none of it has been applied yet — the vault is in the *pre-work* state described in the handoff. Global `CLAUDE.md` and a few project files (Compex-Governance, Ayric-Learning-Fabric-AI, Korry) are strong. Most other project `CLAUDE.md` files are still empty placeholders. Before doing any more planning, knock out the critical gaps one project at a time.

---

## Opus 4.6 gap status

| # | Gap | Status | Notes |
|---|---|---|---|
| 1 | MCP server configuration | **Open** | No `mcp-servers.md` at root. Atlassian Cloud ID, space IDs, MS Learn URL live only in Project Memory and gap review. |
| 2 | Team roster centralized | **Open** | No `team-roster.md`. Team info still split between `Compex Data & Analytics Project Memory.md` and individual project CLAUDE.md files. |
| 3 | Memory pattern example | **Partial** | `Compex-COE/Template/auto-memory/` exists as a working example. But no project has actual `memory/` folders yet, and the global `CLAUDE.md` doesn't point to the template. |
| 4 | Complete skills list per project | **Open** | Most project CLAUDE.md files don't list skills. The matrix in the gap review hasn't been applied. |
| 5 | TMDL Bible reference framing | **Partial** | File exists (34KB, 1044+ lines). Compex-BI/CLAUDE.md mentions it but doesn't frame it as the authoritative reference. Korry doesn't reference it. |
| 6 | VS Code / Claude Code context | **Partial** | Only Korry has a `vscode/` folder. Pattern not propagated; global CLAUDE.md doesn't mention Claude Code setup resources. |
| 7 | Start Here prompts | **Open** | No `start-here.md`. |
| 8 | History folders pattern | **Partial** | Ayric-Business, Ayric-Learning-MBA, Korry already follow it. Not documented as a standard. |
| 9 | FY27 Goals empty placeholder | **Open** | `Compex-COE/FY27 Goals/Untitled.md` still a stub. |
| 10 | Client voice variant | **N/A** | Marked low/optional by 4.6. No action taken, fine as-is. |

**Score: 0 fully fixed, 4 partial, 5 open, 1 n/a.**

---

## Handoff punch list status

From `cowork-alignment-handoff.md`:

| Task | Status |
|---|---|
| Delete empty `Links/` folder | **Open** |
| Create `outputs/` folder at root | **Open** |
| Create `maintenance.md` at root | **Open** |
| Populate `Skills/` folder | **Open** (empty) |
| Add `memory/` subfolder to each project | **Open** |
| Create `templates/` folder | **Open** |
| Add `examples/` to top-2 projects | **Open** |
| References sections in project CLAUDE.md files | **Partial** (only Compex-Governance + Ayric-Learning-Fabric-AI do this well) |
| Apply standardized template from `project-template-and-roles.md` | **Open** — most projects still have original placeholder files |

---

## Project CLAUDE.md status

| Project | Template applied? | Role filled in? | Quality |
|---|---|---|---|
| Compex-BI | No | No | Empty placeholders. Needs role from template doc. |
| Compex-COE | No | No | Empty placeholders. |
| Compex-Governance | Partial | Yes | Strong — populated role, good MS Learn references. Could adopt template section headers. |
| Compex-ReportDev-Audit | Unknown | Unknown | Not audited this pass. |
| Compex-SharePoint-Cleanup | Unknown | Unknown | Not audited this pass. |
| Compex-Ontology | Unknown | Unknown | Not audited this pass. |
| Compex-BI-Training | Unknown | Unknown | Not audited this pass. |
| Compex-Confluence-Cleanup | **No CLAUDE.md** | — | Folder is empty. Either create or delete. |
| Korry-PBI-Audit | Yes | Yes | Solid Scope/Client team/Status/Rules structure. Good reference for client-facing work. |
| Ayric-Business | No | No | Empty placeholders. |
| Ayric-Personal | Unknown | Unknown | Not audited this pass. |
| Ayric-Learning-MBA | Unknown | Unknown | Not audited this pass. |
| Ayric-Learning-Fabric-AI | Yes | Yes | **Gold standard**: detailed role, Always/Never/Conditional rules, Good/Bad examples, Edge Cases, Knowledge Sources. But see conflict below. |

---

## New Opus 4.7 findings (not in the 4.6 review)

### F1 — Emoji rule conflict is undocumented
Global `CLAUDE.md` says "No emojis unless I use them first." `Ayric-Learning-Fabric-AI/CLAUDE.md` uses emojis extensively in headers and examples. Either (a) the project-level file overrides global with intent, and that intent should be stated, or (b) the project file should be de-emojified. Right now Claude has no way to resolve the conflict.

**Fix:** Add one line to `Ayric-Learning-Fabric-AI/CLAUDE.md` under Rules: "Emojis allowed here — learning-content contexts use them for scannability. Overrides global rule."

### F2 — Per-project memory may double up with native Cowork Projects memory
The handoff was written before the March 2026 Cowork Projects feature, which scopes memory automatically per Project. Adding `memory/` subfolders on top of that could produce two parallel memory systems that drift.

**Fix:** Pick one. Recommended: use native Cowork per-Project memory for day-to-day learnings (auto), keep `memory/` folders only for *durable reference context* the user curates manually (team bios, stakeholder prefs, terminology). Document which goes where in global CLAUDE.md.

### F3 — `README.md` is stale
Lists projects that don't exist and misses several that do (Compex-Governance, Compex-ReportDev-Audit, Compex-SharePoint-Cleanup, Compex-Ontology, Compex-BI-Training, Compex-Confluence-Cleanup, Ayric-Personal, Ayric-Learning-MBA, Ayric-Learning-Fabric-AI).

**Fix:** Regenerate from actual directory listing. Five-minute task.

### F4 — Two very large files bloat context windows
- `Ayric-Business/Ayric Intelligence Claude Project Export.md` — 246KB
- `Compex-BI/TMDL-Bible.md` — 34KB / 1044+ lines

Both will blow the 200-line MEMORY.md index if accidentally loaded, and neither is frontmatter-gated for progressive disclosure.

**Fix:**
- Ayric Intelligence export: chunk into topical files under `Ayric-Business/references/` or archive outside the working vault.
- TMDL-Bible: keep in place, but add frontmatter description so it's loaded *only when TMDL work is happening*, not on every Compex-BI session.

### F5 — Skills folder is scaffolded but empty
`skill-creator` best practice: skills require `SKILL.md` with YAML frontmatter (name + description). An empty folder is worse than no folder — it implies skills exist and primes Claude to look there. Either populate with user-level skills referenced in the gap review (`powerbi-report-designer`, `powerbi-workspace-manager`) or delete the folder until something ships.

### F6 — No discoverability layer for what skills / MCPs / rules are active
Global CLAUDE.md lists `skills` but not a live index. Per `skill-creator` philosophy, skills should be discoverable via description-based triggering — but if the user doesn't know what's available, they can't invoke them. `start-here.md` (gap 7) partially fixes this; also consider a `Claude/active-surface.md` one-pager with: active skills, active MCPs, active project CLAUDE.md files, key hard rules.

### F7 — Handoff + gap-review + template docs are three parallel planning artifacts
Right now the root has:
- `cowork-alignment-handoff.md` — state + punch list
- `project-template-and-roles.md` — templates + roles
- `gap-review-opus-4-7.md` — what 4.6 missed
- `audit-opus-4-7.md` — this file

That's four planning docs, increasingly hard to keep in sync. Once the critical gaps are closed, consolidate into one living `maintenance.md` (already on the punch list) and archive the rest into a `Claude/_archive/planning-2026-04/` folder.

### F8 — `Compex-Confluence-Cleanup` is phantom
Folder exists, no CLAUDE.md, no content. Either delete or create a role per the template.

---

## Priority punch list

### Critical — do before the next serious Cowork session

1. **Apply the template + role to the three empty project CLAUDE.md files** — Compex-BI, Compex-COE, Ayric-Business. Copy role text from `project-template-and-roles.md`. Est: 30 min total.
2. **Create `Claude/mcp-servers.md`** — Atlassian (Cloud ID + space IDs + retry quirk), MS Learn, Figma, Indeed. Link from global CLAUDE.md. Est: 15 min.
3. **Create `Claude/team-roster.md`** — pull from `Compex Data & Analytics Project Memory.md` + Leadership Coach context. Est: 20 min.
4. **Delete empty `Links/` folder** and either populate or delete empty `Compex-Confluence-Cleanup/`. Est: 2 min.
5. **Resolve F1 (emoji conflict)** — one-line addition. Est: 1 min.

### High — fix in the first maintenance pass

6. **Resolve F2 (memory scoping)** — decide: native Cowork memory for learnings, `memory/` folders for curated reference. Document in global CLAUDE.md. Est: 20 min.
7. **Apply template to remaining projects not audited this pass** (Compex-ReportDev-Audit, Compex-SharePoint-Cleanup, Compex-Ontology, Compex-BI-Training, Ayric-Personal, Ayric-Learning-MBA). Est: 1–2 hrs.
8. **Add References + Skills sections to each project CLAUDE.md** using the matrix from gap-review §GAP 4. Est: 45 min across all projects.
9. **Regenerate `README.md`** with actual project list. Est: 10 min.
10. **Create `Claude/start-here.md`** with calibration / project-switch / memory-check / skill-check prompts. Est: 20 min.
11. **Reframe TMDL Bible** — add frontmatter/description + update Compex-BI + Korry CLAUDE.md to point at it. Est: 10 min.

### Medium — background cleanup

12. **Create `maintenance.md`** at root consolidating cadence for vault upkeep. Est: 20 min.
13. **Document History folder pattern** as a standard in the template. Est: 5 min.
14. **Populate or delete `Skills/` folder.** Decide scope; if keeping, seed with `powerbi-report-designer` and `powerbi-workspace-manager`. Est: varies.
15. **Chunk the Ayric Intelligence export** (246KB file). Est: 30 min.
16. **Archive planning artifacts** after critical work is done — move 4.6 handoff + gap review + this audit to `_archive/`. Est: 5 min.

### Low — optional

17. FY27 Goals populated from Project Memory.
18. Client voice variant (only if Ayric Intelligence scales).

---

## Recommended next action

Start with **item 1 only**: apply the template + role to `Compex-BI/CLAUDE.md`. It's the most-used project and the template+role are already drafted. Finishing that one unblocks the pattern for the rest.

When you want to do it, ask for: *"Apply the Compex-BI role to its CLAUDE.md"* and I'll make the edit. One project at a time.
