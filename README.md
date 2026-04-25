# DataWiki

Your compiled knowledge base for Microsoft Fabric + Power BI work. Built on Karpathy's llm-wiki pattern using Astro-Han's Agent Skill.

## What lives here vs Notion

| Lives here (DataWiki) | Lives in Notion |
|---|---|
| Metric definitions, business logic | Task tracker |
| Architecture & lineage narratives | Dataset registry (rows/statuses) |
| DAX / SQL / M patterns | Refresh schedule tracker |
| Decision logs (why we did X) | Stakeholder map |
| Glossary / domain concepts | Deal/project log |
| Compiled docs from sources | Anything with fields + filters |

**Rule of thumb:** If it has rows and statuses → Notion. If it's prose that compounds when linked → here.

## Setup (do these once)

### 1. Pick a location

Put this folder wherever you want your Obsidian vault to live. Suggested:
- Windows: `C:\Users\<you>\Obsidian\DataWiki`
- Make it a git repo: `git init`

### 2. Install the wiki skill in Claude Code

Open VS Code in this folder, open the Claude Code panel, and run this in a terminal:

```bash
npx add-skill Astro-Han/karpathy-llm-wiki
```

This installs the skill locally so Claude Code can run the ingest / query / lint operations.

### 3. Open the vault in Obsidian

File → Open folder as vault → pick this directory. Obsidian will index the `wiki/` folder automatically.

### 4. Start feeding it

Drop source material into `raw/` (PDFs, markdown notes, transcripts, exports). Then in Claude Code, say something like:

> "Ingest the new sources in raw/ into the wiki."

The skill reads them, writes or updates pages in `wiki/`, and logs the operation in `_ops/ingest-log.md`.

## Folder layout

```
DataWiki/
├── README.md                 ← you are here
├── CLAUDE.md                 ← instructions Claude Code reads on every session
├── wiki/                     ← compiled pages (the skill writes here)
│   ├── index.md
│   ├── concepts/             ← business terms, metric definitions
│   ├── architecture/         ← Fabric/PBI topology, lineage
│   ├── patterns/             ← DAX / SQL / M idioms
│   ├── decisions/            ← ADRs — why we did X
│   ├── datasets/             ← per-dataset pages
│   └── people/               ← owners, stakeholders (light)
├── raw/                      ← source material to compile
│   ├── docs/                 ← Fabric/PBI official docs, PDFs
│   ├── notes/                ← meeting notes, call transcripts
│   ├── internal/             ← internal wikis, exports
│   └── references/           ← books, articles, URLs
├── templates/                ← Obsidian templates for new pages
│   ├── dataset.md
│   ├── metric.md
│   ├── decision.md
│   └── concept.md
└── _ops/                     ← skill operation logs
    └── ingest-log.md
```

## Daily loop

1. **Capture** — drop anything worth remembering into `raw/` (or paste into Obsidian, tag `#inbox`).
2. **Ingest** — ask Claude Code to compile `raw/` → `wiki/`.
3. **Query** — ask Claude Code questions; answers cite wiki pages.
4. **Lint weekly** — ask Claude Code to run the lint op to catch broken links and stale pages.

## First sources to feed in

Pick one to start — don't do all five day one:

1. Microsoft Fabric "Get Started" docs (the ones you actually reference)
2. Your internal semantic model design notes
3. A representative Power BI project handoff doc
4. DAX pattern references you use
5. Meeting transcripts about data architecture decisions

## Current status

Last verified: 2026-04-24.

- **Skill installed:** `karpathy-llm-wiki` at `.agents/skills/karpathy-llm-wiki/`. Auto-invocation not registered yet — Claude Code reads the skill docs and runs the workflow manually. Same output.
- **VS Code workspace:** `DataWiki.code-workspace` in `..\VSCodeWorkspaces\`. Open that in VS Code for correct skill loading.
- **Pages compiled:** 3 concept pages
  - `wiki/concepts/semantic-model.md`
  - `wiki/concepts/grain.md`
  - `wiki/concepts/tmdl.md` (tooling — parked in concepts/ for now)
- **Open stubs** (wikilinks that don't resolve yet): `[[star-schema]]`, `[[dax]]`, `[[direct-query]]`, `[[fact-table]]`, `[[measure]]`, `[[lakehouse]]`
- **Ingest log:** `_ops/ingest-log.md` — read this to see what's been done and when.

## Resuming in a new session

1. Open the `DataWiki.code-workspace` in VS Code
2. Say to Claude Code: *"Read CLAUDE.md and the last few entries of _ops/ingest-log.md so you know where we are."*
3. Then either ingest a new source or run a lint/query operation.
