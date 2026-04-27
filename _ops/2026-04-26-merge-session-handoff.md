# Merge session handoff — 2026-04-26

> Handoff packet from a Cowork session (desktop) to a Dispatch session (iPhone).
> Goal: continue the merge of `Claude_old` into `ayric-claude` without re-doing the intake.

---

## Where we are right now

- **Goal:** merge two Claude instruction repos into one effective Claude OS.
- **Source repo:** `C:\Users\Ayric\.Obsidian\Ayric\Claude_old` (legacy Cowork project knowledge — 17 folders + 5 root files, plus `CLAUDE.zip` backup made today).
- **Target repo:** `C:\Users\Ayric\.repos\ayric-claude` (new — Karpathy llm-wiki structure + per-context configs + command-center EA).
- **Current artifact:** the merge plan below, plus three updates from a full read of `Guide to Configuring Claude Cowork.md` (24 KB, the philosophy doc behind the new repo's structure).
- **Last action taken:** wrote merge plan; Ayric paused to migrate to Dispatch before any moves are executed.

---

## Parked (do not work on yet)

- **`Compex-ReportDev-Audit/`** (~hundreds of `dbo.dv_*.md` files in `ReportDev_View_Subpages/`). Ayric's call: "needs more work." Three forks were on the table — distill into `wiki/datasets/compex-views/`, spin out as its own repo, or archive verbatim. **Do not pick one without Ayric's explicit decision.**

---

## Open decisions awaiting Ayric

1. **Cleanup projects** (`Compex-Confluence-Cleanup`, `Compex-SharePoint-Cleanup`) — archive verbatim or are they still active?
2. **Old root `CLAUDE.md`** — read and diff against new root, or assume new wins and skip?
3. **`_archive/` location** — inside the new repo (`ayric-claude/_archive/`) or outside (`~/.archive/`)?
4. **Execution venue** — Phase 1 (mechanical moves) in this Cowork session, or first generate the missing interview prompts (about-me, my-company) for Ayric to run in Chat?

---

## Last question asked (the one Ayric was about to answer when he paused)

> "Do you want me to start Phase 1 (mechanical moves — voice file, brand, team roster, skills bundle) in this session, or first draft the missing about-me and my-company interview prompts so you can run them in Chat?"

---

## Three updates added to the plan after reading the Cowork-config guide

The 24 KB guide turned out to be the philosophy doc behind the new repo's architecture. Three plan deltas baked in:

1. **Promote, don't archive.** `Voice-and-Style Interview Prompt.md` AND the Cowork-config guide itself are *generators* — they create context files via interview. Belong in `_ops/interviews/` (or similar), NOT in `_archive/`. The guide also surfaces two interview prompts that don't yet exist for Ayric: about-me and my-company.

2. **Fill the stubs.** `config/shared/about-me.md` is currently a one-line stub. Guide is emphatic: under 2,000 tokens, generated via interview not hand-written. Same pattern needed for per-context `my-company.md` (Compex + Ayric Intelligence).

3. **Add explicit access boundaries to root `CLAUDE.md`.** The pattern already exists in `command-center/CLAUDE.md`'s `<write_permissions>` block — generalize read-only/write-only to the rest of the repo.

---

## Intake disclosure (what's been read vs not)

**Read end-to-end (verified):**
- New repo: `CLAUDE.md`, `README.md`, `command-center/CLAUDE.md`, `config/compex/CLAUDE.md`, `config/ayric-intelligence/CLAUDE.md`, `config/shared/honesty.md`, `config/shared/about-me.md` (stub), `.gitignore`, `skills-lock.json`
- Old repo: `Guide to Configuring Claude Cowork.md` (24 KB)
- Both repos: full structural listing (folder + file names)

**NOT yet read (will need to be read in execution):**
- All other per-project `CLAUDE.md` files in old repo (`Ayric-Business`, `Ayric-Personal`, `Ayric-Learning-*`, `Compex-*`, etc.)
- `Compex Data & Analytics Project Memory.md` (9 KB)
- `Voice-and-Style Interview Prompt.md` (4 KB) — known to exist, not yet read
- `Shared/*` files (voice-and-style, brand, mcp-reference, etc.)
- `Compex-BI/TMDL-Bible.md`, `Compex-Governance/*` docs, `Compex-Ontology/*`
- All chat exports under `Ayric-Learning-Fabric-AI/`
- The audit folder contents (parked)
- Old repo root `CLAUDE.md` (open decision #2)

This handoff is built on structural mapping (folder names) plus the few files actually read. Folder-to-folder routing in the plan is **assumed** and needs a second pass once contents are read.

---

# The merge plan (full)

## Thesis

**The new repo is the OS chassis. The old repo is content.** They are not symmetric.

The new repo already has:
- A clean instruction layer (`CLAUDE.md` + `command-center/CLAUDE.md` + `config/<context>/CLAUDE.md` referencing `config/shared/*`)
- A Karpathy llm-wiki ingest pattern (`wiki/` compiled, `raw/` sources, `templates/`, `_ops/ingest-log.md`)
- A skill bundled (`.agents/skills/karpathy-llm-wiki/`)
- Git history on `main`

The old repo is legacy Cowork project-knowledge files — flat, per-project folders, each with its own `CLAUDE.md` and supporting docs. Most of that content needs to be distilled into the new repo's structure, not copy-pasted.

**Default: new repo's structure wins.** Old content gets routed into one of four destinations: `config/`, `wiki/`, `raw/`, or `_archive/`.

---

## Routing rules

| Old repo location | New repo home | Mode |
|---|---|---|
| `CLAUDE.md` (root) | — | Diff against new root CLAUDE.md; preserve any unique behavior rules in `config/shared/best-practices.md`; archive the rest |
| `Compex Data & Analytics Project Memory.md` | `config/compex/CLAUDE.md` (extend) + `wiki/compex/` (history) | Distill |
| `Guide to Configuring Claude Cowork.md` | `_ops/interviews/cowork-config-guide.md` (it's a generator, not just reference) | Promote, then distill key principles into `config/shared/` |
| `Voice-and-Style Interview Prompt.md` + `Shared/voice-and-style.md` | `_ops/interviews/voice-and-style.md` + `config/shared/voice.md` | Promote interview prompt; merge generated content into shared |
| `Shared/compex-brand.md`, `compex-pptx-style-guide.md` | `config/compex/brand/` | Direct move |
| `Shared/mcp-reference.md` | `wiki/tooling/mcp-reference.md` | Distill |
| `Shared/claude-allowlist-domains.md` | `config/shared/allowlist-domains.md` | Direct move |
| `Shared/start-here.md`, `solo-context.md`, `template-contract.md` | `config/shared/` | Read first, then route |
| `Shared/cowork-egress-investigation.md`, `reevaluation-2026-04-17.md` | `_archive/` | Archive (one-time investigations) |
| `Compex/team-roster.md` | `config/compex/team.md` | Merge into existing |
| `Compex-BI/TMDL-Bible.md` | extend `wiki/concepts/tmdl.md`, possibly split into `wiki/patterns/tmdl/*` | Distill — bible likely too long for one wiki page (≤300 line rule) |
| `Compex-Governance/` (Current-State, Gap, Target-State) | `wiki/architecture/governance-*.md` + `wiki/decisions/` | Distill into wiki — exactly what wiki/ is for |
| `Compex-Ontology/` | `wiki/concepts/` | Distill |
| `Compex-COE/` | `config/compex/coe/` + `wiki/decisions/` | Split: project context → config, decisions → wiki |
| `Compex-FY27-Goals/` | `config/compex/goals.md` | Distill |
| `Compex-BI-Training/` | `config/compex/bi-training/` | Per-project context |
| `Compex-Confluence-Cleanup/`, `Compex-SharePoint-Cleanup/` | `_archive/cleanup-projects/` | Archive (open decision #1 — confirm dead) |
| `Compex-ReportDev-Audit/` | **PARKED — Ayric's call needed** | — |
| `Ayric-Business/` | `config/ayric-intelligence/` | Distill into existing CLAUDE.md + per-engagement files |
| `Ayric-Learning-Fabric-AI/` | `raw/learning/fabric-ai/` (chat exports) + `wiki/` (distilled concepts) | Split: raw goes raw, compiled goes wiki |
| `Ayric-Learning-MBA/` | `config/learning-mba/CLAUDE.md` (new context) | Add |
| `Ayric-Personal/` | `config/personal/CLAUDE.md` (new context) | Add |
| `Korry-PBI-Audit-and-Improvement/` | `config/ayric-intelligence/clients/korry/` | Per-engagement project context |
| `Links/Repos/` | `wiki/index.md` or `config/shared/repos.md` | Compile |
| `Skills/`, `dynamic-pptx-designer/` | `.agents/skills/` | Direct move; register in `skills-lock.json` if applicable |

---

## Phased order

**Phase 0 — Safety net.** Branch the new repo: `git checkout -b legacy-import`. Tag the old repo's current state if it's a git repo (haven't checked).

**Phase 1 — Direct moves (low risk, no distillation).**
- `Shared/voice-and-style.md` → `config/shared/voice.md`
- `Shared/claude-allowlist-domains.md` → `config/shared/allowlist-domains.md`
- `Shared/compex-brand.md`, `compex-pptx-style-guide.md` → `config/compex/brand/`
- `Compex/team-roster.md` → merge into `config/compex/team.md`
- `Skills/` and `dynamic-pptx-designer/` → `.agents/skills/`
- `Voice-and-Style Interview Prompt.md` + `Guide to Configuring Claude Cowork.md` → `_ops/interviews/`
- Populate `config/shared/about-me.md` (currently a stub) from old repo's `solo-context.md` + answers to the about-me interview

**Phase 2 — Per-context CLAUDE.md migration.**
For each old project folder (Ayric-Business, Ayric-Personal, Compex-COE, Compex-BI-Training, etc.), read the folder's CLAUDE.md and extend or create the matching `config/<context>/CLAUDE.md`. Reuse the existing pattern (`@../shared/*` imports + context block).

**Phase 3 — Knowledge → wiki distillation.**
- `Compex-Governance/*` → `wiki/architecture/`, `wiki/decisions/`
- `Compex-Ontology/` → `wiki/concepts/`
- `Compex-BI/TMDL-Bible.md` → extend `wiki/concepts/tmdl.md` (split if >300 lines)
- `Compex-FY27-Goals/` → `config/compex/goals.md`
- `Shared/mcp-reference.md` → `wiki/tooling/mcp-reference.md`

**Phase 4 — Raw archival + ingest.**
- Chat exports (`Ayric-Learning-Fabric-AI/chat_*.md`, `Compex-COE/Claude Project*.md`, etc.) → `raw/internal/chat-exports/`
- Run `karpathy-llm-wiki` ingest operation to compile chat exports into wiki pages where useful

**Phase 5 — Borderline decisions.**
- Audit folder treatment (parked — needs Ayric)
- Stale cleanup projects → `_archive/`
- Old repo's root `CLAUDE.md` — diff and reconcile

**Phase 6 — Decommission.**
- Tag old repo final state, then archive (`mv .Obsidian/Ayric/Claude_old ~/.archive/Claude_old_2026-04-26`).
- Update new repo README with merge completion note + ingest log entry.
- Commit + push.

---

## Anti-goals (what NOT to do)

- Do not bulk-copy old repo into new repo's `_legacy/` and call it merged. The new repo's CLAUDE.md ingest rules say "distill, don't copy" — applying that to the merge itself.
- Do not duplicate Notion territory into the wiki. New repo's CLAUDE.md is explicit: structured records (tasks, dataset registry, refresh tracker) belong in Notion. If old content is structured-record-like, route to Notion handoff packets via the Command Center EA, not into `wiki/`.
- Do not preserve project folders that are dead. `_archive/` exists so the wiki/config layer stays signal-rich.

---

## Resume instructions for the Dispatch session

1. Read this file end-to-end (it's self-contained — no prior session context required).
2. Confirm intake by listing the open decisions back to Ayric.
3. Wait for Ayric to answer at least the execution-venue decision (open #4) before doing any moves.
4. **Do not touch the audit folder.** Parked.
5. Honesty rules apply (see new repo `config/shared/honesty.md`): label every claim Verified / Assumed / Unknown, disclose any incomplete intake before asserting anything.
