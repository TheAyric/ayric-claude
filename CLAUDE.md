# Claude Code instructions for DataWiki

This is a compiled knowledge base for Microsoft Fabric + Power BI work, following Karpathy's llm-wiki pattern. It is the canonical memory for data-engineering and analytics knowledge.

## What this vault is for

- **Compiled prose knowledge** — concepts, architecture, patterns, decisions
- Cross-linked via Obsidian-style `[[wikilinks]]`
- Sourced from material in `raw/`, distilled into pages under `wiki/`

## What this vault is NOT for

- **Structured records** (tasks, tickets, dataset registry, refresh tracker) — those live in Notion
- **Executable code** — DAX/SQL/notebooks live in their own repos; reference them, don't duplicate
- **Data itself** — rows and query results live in the warehouse

## Conventions

- All pages are markdown under `wiki/`. Use `[[Page Name]]` for cross-links.
- New pages follow templates in `templates/`. Match the closest template type.
- Every claim in a page should be traceable to a source in `raw/` — cite with a relative link or `raw/notes/2026-04-21-refresh-design-call.md` style.
- Filenames use kebab-case: `semantic-model-design.md`, not `Semantic Model Design.md`.
- Decisions (ADRs) get a monotonically increasing number: `0001-direct-query-for-finance.md`.

## Workflow operations

The `karpathy-llm-wiki` skill provides three operations:

1. **Ingest** — read new files in `raw/`, create or update pages in `wiki/`, add cross-references, append an entry to `_ops/ingest-log.md`.
2. **Query** — answer questions using `wiki/` pages as primary context; cite pages linked.
3. **Lint** — check for broken wikilinks, orphan pages, stale sources, and inconsistent terminology.

## When writing wiki pages

- Start each page with a one-line summary.
- Use `## Sources` at the bottom listing what was compiled from.
- Link aggressively to other pages. A new concept almost always relates to an existing one.
- Prefer short, dense pages over long sprawling ones. **Compile to ≤300 lines per page.** Split when approaching this limit.

## Ingest rules (how sources become wiki pages)

- **Distill, don't copy.** A wiki page must be shorter than its source. If the compiled page mirrors the source's structure and length, the ingest is wrong — redo it.
- **Ingest through a lens.** Capture (a) the principle in Ayric's words, (b) why it matters for his work (Compex BI, Ayric Intelligence, MBA/Fabric learning), (c) when to deviate. The lens is the value-add; the source's original wording is not.
- **For external canonical docs (MS Learn, Fabric docs, DAX Patterns, etc.):** summarize + link to the source URL. Do not reproduce content. The wiki holds the interpretation; the source URL holds the reference text.
- **One topic → one page.** A single ~300-line "Fabric security best practices" page beats 50 pages cloned from individual MS Learn articles.
- **Guardrails:** if `wiki/<section>/` accumulates > 15 pages, add a sub-index. If a page approaches 500 lines, split it.

## Coordination with Notion

When information has a structured home in Notion (a dataset entry, a task, a project record), the wiki page should reference it by name/ID rather than duplicate its fields. Example: `See Notion > Datasets > FinanceMart for refresh schedule and owner; this page describes the design rationale.`

## Known issues / parking lot

- **Skill auto-invocation.** The `karpathy-llm-wiki` skill installed at `.agents/skills/karpathy-llm-wiki/` is not registered as an invocable skill in Claude Code — the workflow is executed manually from reading the skill's docs. Same result, but registration is the real fix. Tracked in `claude-os-project.md` open questions.
- **Tooling vs. concepts subfolder.** `wiki/` currently has only business-domain folders (concepts, architecture, patterns, decisions, datasets, people). Tooling / API reference pages (e.g., `tmdl.md`) don't fit cleanly. Parked in `concepts/` for now. Revisit when 3+ tooling pages accumulate — likely answer is a new `wiki/tooling/` or `wiki/reference/` folder.
