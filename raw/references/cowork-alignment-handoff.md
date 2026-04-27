# Cowork Alignment Handoff

**Purpose:** Compare Ayric's current `Main/Claude/` vault structure against the optimized Cowork configuration (synthesized from 8+ community approaches). Produce a punch list Cowork can execute.

**Rule:** Nothing gets deleted or overwritten without explicit permission. All changes are additive (new files) or merge-based (shown for approval first).

---

## Current state snapshot

### What exists and is STRONG (keep as-is)

| File / Folder | Assessment |
|---|---|
| `CLAUDE.md` (global) | Excellent. Covers identity, ADHD work style, tool routing, reading order, hard rules, privacy, skills, output defaults. Already better than most Cowork guides' global instructions. |
| `Shared/voice-and-style.md` | Best-in-class. Interview-generated, has banned words list (100+), audience shift table, writing samples, QA checklist. Exceeds what any community guide recommends. |
| `Compex Data & Analytics Project Memory.md` | Rich organizational context: team roster, stakeholder map, platform stack, tool IDs, key learnings, current state. Functions as combined about-me + my-company for Compex work. |
| `Voice-and-Style Interview Prompt.md` | Already used and completed. Good reference artifact. |
| `Guide to Configuring Claude Cowork.md` | Research synthesis from this chat. Reference doc, not an instruction file. |
| `README.md` | Clean hub explanation. |
| Project CLAUDE.md files (Compex-Governance, Compex-ReportDev-Audit, Compex-SharePoint-Cleanup) | Well-populated with real context, decisions, scope, stakeholders. |
| `Compex-COE/Template/` | Has working auto-memory pattern (MEMORY.md index + 5 memory files), custom skills (powerbi-report-designer, powerbi-workspace-manager), PROJECT_SETUP.md for portability. Most advanced Cowork pattern in the vault. |

### What exists but needs FILLING IN

These project CLAUDE.md files have good structure but empty placeholder sections:

| Project | Empty sections |
|---|---|
| `Compex-BI/CLAUDE.md` | Current priorities, Key people, Terms/acronyms, What "done" looks like. Also needs: reference to PBI skills at `Compex-COE/Template/claude/skills/` |
| `Compex-COE/CLAUDE.md` | Current priorities, Key people/stakeholders |
| `Compex-BI-Training/CLAUDE.md` | (need to verify — not in zip but folder exists) |
| `Ayric-Business/CLAUDE.md` | Current priorities, Services/offerings, Target customers, Brand voice, Key decisions/constraints |
| `Ayric-Personal/CLAUDE.md` | (need to verify) |
| `Compex-Ontology/CLAUDE.md` | (need to verify — likely minimal) |
| `Ayric-Learning-MBA/CLAUDE.md` | (need to verify) |
| `Ayric-Learning-Fabric-AI/CLAUDE.md` | (need to verify) |

### What's MISSING vs the optimized plan

| Missing element | Why it matters | Priority |
|---|---|---|
| **Global instructions in Cowork Settings** | Without this, Cowork doesn't read CLAUDE.md or voice-and-style.md automatically. This is the #1 gap. | **Critical** |
| **`outputs/` folder** | No designated write-only location for Cowork deliverables. Outputs currently scatter into project folders or Desktop. | **High** |
| **Root `Skills/` needs general task skills** | The folder exists but is empty. Project-specific PBI skills stay in Template/ — root Skills/ gets lightweight, general-purpose task skills only. | **High** |
| **`maintenance.md`** | No runbook for auditing, updating, and optimizing the workspace over time. Needed to keep the system from going stale. | **High** |
| **Per-project `memory/` folders** | Discussed (Option B chosen) but not implemented. Only Template/ has auto-memory. | **Medium** |
| **`templates/` folder** | No output skeleton library. Good outputs get lost instead of becoming reusable structures. | **Medium** |
| **Per-project `examples/` folders** | No good/bad output training. This is the compounding feedback loop the community swears by. | **Medium** |
| **`## References` sections in project CLAUDE.md files** | Most projects don't have runtime-fetchable URLs. Compex-Governance has the right pattern — replicate it. | **Medium** |
| **Standardized project template with roles** | Most project CLAUDE.md files lack a `## Role` section defining how Claude should behave. Without it, Claude defaults to generic assistant mode. See companion file: `project-template-and-roles.md`. | **High** |
| **`Links/` and `Links/Repos/` need deleting** | Empty placeholder folders. References move to project CLAUDE.md files instead. | **Low** |

---

## Punch list — ordered by priority

### CRITICAL: Paste global instructions into Cowork Settings

**Action:** Open Claude Desktop → Settings → Cowork → Global Instructions → Paste:

```
You are my working partner inside this workspace.

## BEFORE EVERY TASK
1. Read CLAUDE.md (root of this workspace).
2. Read Shared/voice-and-style.md before generating any written content.
3. If the task relates to a project, read that project's CLAUDE.md.
4. If the project has a memory/ folder, read all files in it.
5. If a matching skill exists in Skills/, read it.
6. Read "Compex Data & Analytics Project Memory.md" for any Compex-related work.

## EXECUTION RULES
- If the goal, audience, or output format is unclear: ask questions first. Do not fill gaps with guesses.
- On complex tasks: show your plan, get confirmation, then execute.
- Never delete files. Never overwrite without asking. Save new versions.
- Never invent facts, decisions, dates, numbers, or approvals. Make uncertainty visible.
- Deliver the work. Skip commentary unless asked.

## FOLDER ACCESS
- Read-only: CLAUDE.md, Shared/, Skills/, project CLAUDE.md files, memory/ folders
- Write: outputs/ for deliverables, or the project folder if I direct you there
- Off-limits: anything in Main/_Private/ or any folder named "Private"

## FILE NAMING
All files you create: project-name_content-type_v1.ext
Increment version number if file exists. Never overwrite.

## QA CHECK (before delivering written content)
- Does this match Shared/voice-and-style.md?
- No em-dashes anywhere?
- No banned words?
- No performative warmth?
- Would this need major revision, or is it ready to use?

## ADHD SUPPORT
- Finishing is the priority. Keep me moving.
- 2-3 sentences of context max, then next step.
- One thing at a time. Don't dump 5 options.
- If I'm drifting, park the tangent warmly and redirect.
- If I'm over-planning, nudge toward action.
```

### HIGH: Create `outputs/` folder

**Action:** Create this structure:

```
Claude/outputs/
├── drafts/
├── reports/
├── briefs/
└── deliverables/
```

Add a `.gitkeep` or `README.md` in each subfolder so Obsidian shows them. Suggested `outputs/README.md`:

```markdown
# Outputs

Write-only folder for Cowork deliverables. Cowork saves all finished work here.
Subfolders: drafts/, reports/, briefs/, deliverables/
```

### HIGH: Create `maintenance.md` at root

**Action:** Create `Claude/maintenance.md` — a runbook for auditing, updating, cleaning, and optimizing the entire Claude folder. Full content is in the "NEW: Create maintenance.md" section at the bottom of this document. To trigger it, tell Cowork: "Read maintenance.md and run the audit. Report findings, don't change anything without my approval."

### HIGH: Populate root `Skills/` folder with general task skills

**Action:** Add lightweight, general-purpose task skill files to root `Skills/`. Heavy, project-specific skills (powerbi-report-designer, powerbi-workspace-manager) stay where they are in `Compex-COE/Template/claude/skills/` and get referenced from project CLAUDE.md files that need them. This keeps token usage low — root skills load every session, project skills load only when relevant.

Projects that should reference PBI skills in their CLAUDE.md:
- `Compex-BI/CLAUDE.md` — primary PBI work project
- `Compex-COE/Template/` — already has them locally

Create these starter skill files:

**`Skills/email-draft.md`**
```markdown
# Email Draft

When I ask you to draft an email:

1. Identify the audience (check voice-and-style.md audience shifts table)
2. Ask who it's to and what the goal is (if not obvious)
3. Use the matching register from the audience table
4. Structure: context → key point → specific ask → sign-off

RULES:
- Match Shared/voice-and-style.md exactly
- No em-dashes. Use ellipsis for pauses.
- No banned words
- Use contractions
- Credit people by name when they did the work
- Keep it short. If it's longer than 5 paragraphs, cut it.
- Save to outputs/drafts/
```

**`Skills/status-update.md`**
```markdown
# Status Update

When I ask for a status update or team update:

Format:
- Quick summary of what shipped / what changed
- What's in progress (with owners if relevant)
- Blockers or risks
- Next steps

RULES:
- Casual team register (see voice-and-style.md)
- Bullet points, not paragraphs
- Credit people by name
- Under 300 words
- No em-dashes
- Save to outputs/drafts/
```

**`Skills/research-brief.md`**
```markdown
# Research Brief

When I ask for a research brief or analysis:

1. Start with a single-sentence bottom line (BLUF)
2. Follow with "Why it matters" (2-3 sentences)
3. Detailed analysis with evidence
4. End with "What to do about it" (actionable recommendations)

RULES:
- Cite specific sources, numbers, and dates
- Distinguish facts from opinions
- Flag uncertainty explicitly
- No hedging without cause
- Under 1,500 words unless I say otherwise
- Save to outputs/briefs/
```

### MEDIUM: Add `memory/` folders to active projects

**Action:** Create a `memory/` subfolder in each active project folder. Add this line to each project's CLAUDE.md under a new `## Project memory` section:

```markdown
## Project memory
Read all files in `memory/` before starting work on this project.
```

Projects to add memory/ to:
- `Compex-BI/memory/`
- `Compex-COE/memory/`
- `Compex-Governance/memory/`
- `Compex-ReportDev-Audit/memory/`
- `Compex-SharePoint-Cleanup/memory/`
- `Korry-PBI-Audit-and-Improvement/memory/`
- `Ayric-Business/memory/`

Each gets a starter `MEMORY.md` index file:

```markdown
# Project Memory Index
<!-- Add one line per memory file: [filename](filename) — description -->
```

### MEDIUM: Create `templates/` folder

**Action:** Create `Claude/templates/` with a README:

```markdown
# Templates

Output skeletons from past wins. When Cowork produces something excellent:
1. Strip the content, keep the structure
2. Save here as `[template-name].md`
3. Future tasks referencing this template inherit proven structure

To extract a template after a good output, tell Cowork:
"Save this as a template in templates/. Strip content, keep skeleton."
```

### MEDIUM: Add `examples/` folders to high-stakes projects

**Action:** Create `examples/` subfolders in projects where output quality matters most:

- `Compex-Governance/examples/`
- `Compex-COE/examples/`
- `Ayric-Business/examples/`
- `Korry-PBI-Audit-and-Improvement/examples/`

Save good outputs with a note at the top: `<!-- GOOD: [why this worked] -->`
Save bad outputs with: `<!-- BAD: [what went wrong] -->`

### LOW: Fill in empty project CLAUDE.md sections

**Action:** For each project with placeholder sections, fill in current priorities, key people, and terms. This is best done in Cowork using question-first flow:

```
Read [project-name]/CLAUDE.md.
The empty sections need filling in.
Ask me questions one at a time to populate them.
Save the updated version as CLAUDE_v2.md (do not overwrite the original).
```

### LOW: Delete empty `Links/` folder and add references to project CLAUDE.md files

**Action:** Delete `Links/` and `Links/Repos/` (empty placeholder folders). Instead of storing links centrally, add a `## References` section to each project's CLAUDE.md with URLs that Claude fetches at runtime. Compex-Governance already does this well — replicate that pattern.

Example `## References` section to add to each project CLAUDE.md:
```markdown
## References
<!-- URLs Claude should fetch at runtime for current info -->
- [Description](https://url) — when to use this
```

`Compex-Confluence-Cleanup/` stays — it's a real upcoming project that needs a CLAUDE.md when work begins.

---

## What NOT to change

| Element | Why it stays |
|---|---|
| Global `CLAUDE.md` | Already covers identity + rules. Don't split unless it grows past ~2,000 tokens (maintenance.md will flag this). |
| `Shared/voice-and-style.md` | Already exceeds the community standard. Don't trim for token budget — it's worth every token. |
| `Compex Data & Analytics Project Memory.md` | Functions as the combined org context file. Don't split into about-me + my-company unless you start doing significant non-Compex work in Cowork (maintenance.md will flag this). |
| Project folder structure | Your vault's project-per-folder with CLAUDE.md pattern is better than the Cowork guide's flat `projects/` structure. Keep it. |
| `Compex-COE/Template/` | Self-contained portable export with its own skills and auto-memory. Keep intact. |
| PBI skills in `Template/claude/skills/` | Project-specific, heavy skills. Stay project-scoped to avoid loading every session. Referenced from `Compex-BI/CLAUDE.md` and `Compex-COE/Template/`. |
| `Voice-and-Style Interview Prompt.md` | Reference artifact. Useful if you ever re-run the interview. |
| `History/` folders in projects | Good audit trail. Keep using this pattern. |

---

## Recommended execution order

For Cowork, one session at a time:

1. **Paste global instructions** into Cowork Settings (5 min, do it now)
2. **Create `outputs/` folder structure** (2 min)
3. **Create general task skill files** in root `Skills/` (10 min)
4. **Create `maintenance.md`** at root (2 min — content is in this doc)
5. **Delete `Links/` and `Links/Repos/`** (1 min)
6. **Add `memory/` folders** to active projects with MEMORY.md index (10 min)
7. **Create `templates/`** folder (2 min)
8. **Add `examples/`** folders to high-stakes projects (5 min)
9. **Add `## References` sections** to project CLAUDE.md files that lack them (15 min)
10. **Apply standardized template and roles** to project CLAUDE.md files (see companion file: `project-template-and-roles.md`) — one project at a time, starting with whichever you're working in next (30 min total, spread across sessions)
11. **Fill in empty CLAUDE.md sections** via question-first interviews (30 min, project by project)
12. **Run a calibration prompt** to verify Cowork absorbed everything:

```
Read every file in this workspace's root and Shared/ folder.
Summarize: what's here, what you know about me, what instructions
you'll follow, and what projects are active.
If something is unclear, ask.
```

Total estimated time: ~80 minutes across 2-3 sessions.

---

## Decisions — resolved

1. **Skills:** General task skills (email-draft, status-update, research-brief) go in root `Skills/`. Heavy project-specific skills (PBI report-designer, workspace-manager) stay in their project folders and get referenced from project CLAUDE.md files.
2. **Links/ folder:** Delete `Links/` and `Links/Repos/`. Add `## References` sections with URLs to each project CLAUDE.md. Claude fetches at runtime instead of storing locally.
3. **CLAUDE.md:** Keep identity + rules together in one file. Don't split unless it grows past ~2,000 tokens (add this as a maintenance check).
4. **Ayric Intelligence:** Leave context in `Ayric-Business/CLAUDE.md`. Break out a standalone `my-company.md` only if the file gets too large (add this as a maintenance check).
5. **Compex-Confluence-Cleanup/:** Keep — real upcoming project.

---

## NEW: Create `maintenance.md` (root-level)

**Action:** Create `Claude/maintenance.md` — a runbook for auditing, updating, cleaning, and optimizing the entire Claude folder. Cowork can be told "Run maintenance" to execute this.

```markdown
# Workspace Maintenance Runbook

Run periodically (monthly recommended) or when things feel stale. Cowork can execute this — paste: "Read maintenance.md and run the audit. Report findings, don't change anything without my approval."

---

## 1. Token health check

- [ ] Is `CLAUDE.md` under ~2,000 tokens? If growing past that, split into `about-me.md` + `operating-rules.md`.
- [ ] Is `Shared/voice-and-style.md` still accurate? Any new banned words, audience shifts, or writing samples to add?
- [ ] Is `Compex Data & Analytics Project Memory.md` current? Any stale sections (people who left, projects completed, tools changed)?
- [ ] Are any project CLAUDE.md files bloated (>1,500 tokens)? If so, move detail into project memory/ files and keep CLAUDE.md as a summary.

## 2. Project CLAUDE.md audit

For each project folder:
- [ ] Does CLAUDE.md have empty placeholder sections? Fill them or remove the section if not needed.
- [ ] Are current priorities actually current? Update or mark completed.
- [ ] Does it have a `## References` section with runtime-fetchable URLs?
- [ ] Does it have a `## Project memory` section pointing to `memory/`?
- [ ] Is there a `memory/` subfolder with a MEMORY.md index?
- [ ] Is there an `examples/` subfolder (for high-stakes projects)?

## 3. Skills audit

- [ ] Are root `Skills/` files still accurate and useful?
- [ ] Are any project-specific skills (e.g., PBI skills in Template/) outdated?
- [ ] Are there recurring tasks that deserve a new skill file? (Look for patterns: "I keep asking Claude to do X the same way")
- [ ] Do any skills reference outdated tools, formats, or processes?

## 4. Memory audit

For each project with a `memory/` folder:
- [ ] Is `MEMORY.md` index up to date?
- [ ] Are any memory files stale or contradicted by newer work?
- [ ] Are there learnings from recent sessions that should be captured as new memory files?

## 5. Outputs cleanup

- [ ] Move any loose deliverables from project folders into `outputs/` (or its subfolders)
- [ ] Archive old outputs if `outputs/` is getting crowded (create `outputs/archive/YYYY-QN/`)
- [ ] Are there excellent outputs that should be extracted as templates? Save skeletons to `templates/`

## 6. Templates audit

- [ ] Are existing templates still reflective of current best work?
- [ ] Are there new good outputs that deserve template extraction?
- [ ] Delete or archive templates that are no longer relevant

## 7. Structural health

- [ ] Any empty folders that should be deleted or populated?
- [ ] Any files in the wrong location? (e.g., deliverables sitting in project folders instead of outputs/)
- [ ] Is the README.md project list current?
- [ ] Are file names following the convention: `project-name_content-type_v1.ext`?
- [ ] Any files large enough to break out into smaller pieces? (Threshold: ~2,000 tokens for context files, ~1,500 for project CLAUDE.md)

## 8. Global instructions check

- [ ] Do the global instructions in Cowork Settings still match the workspace structure?
- [ ] Any new folders or patterns that need to be added to the reading order?
- [ ] Any rules that need tightening based on recent mistakes?

---

## After maintenance

Summarize changes made (or recommended) in a maintenance log entry:

File: `outputs/maintenance-log.md`
Format:
- Date
- What was checked
- What was changed (with before/after if relevant)
- What needs Ayric's decision
```
