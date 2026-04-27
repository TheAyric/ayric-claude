# The definitive guide to configuring Claude Cowork

**Claude Cowork, properly configured, is a fundamentally different tool than Cowork out of the box.** Every major guide — from Artificial Corner to Ruben Hassid to Chris Bailey — independently converges on the same conclusion: unconfigured Cowork produces mediocre, generic output, while a 30–60 minute setup transforms it into an autonomous work partner that sounds like you, follows your rules, and delivers polished results. The gap is entirely about **context engineering**: building the right folder structure, writing high-signal context files (via Claude interviews, never manually), and setting precise global instructions. Below is a synthesis of 8+ distinct approaches from the community, followed by an optimized configuration that combines the best elements from each.

---

## Eight approaches compared side by side

The community has converged on a remarkably consistent pattern — **context files + rules + outputs separation** — but disagrees on the details. Here are the major approaches:

**Frank Andrade (Artificial Corner)** uses a 4-folder structure (`system/`, `context/`, `projects/`, `outputs/`) with two core files: `HOW-I-WORK.md` (who you are) and `SYSTEM-RULES.md` (how Claude should behave). Both are generated through a rigorous **~50 question interview** across three blocks — work context, voice/style/thinking, and system behavior. His global instructions tell Claude to read both files before every task and ask questions when missing context could weaken results. The key innovation here is the **question-first flow**: prompts like "Read the project folder first, then ask me questions before you execute" consistently produce better outputs than letting Claude run immediately.

**Ryan Stax (AI Handbook)** uses a similar 4-folder structure but renames `system/` to `ground-rules/` and splits context into two files: `operator-profile.md` and `voice-rules.md`, plus a separate `ground-rules.md`. His distinctive contribution is **explicit access boundaries** — `context/` and `ground-rules/` are read-only, `outputs/` is write-only, and `projects/` is read-only unless told otherwise. He also introduces a **file naming convention** (`project-name_content-type_v1.ext`) enforced via global instructions, and three separate interviews (12–15, 8–10, and 8–10 questions respectively) rather than one mega-interview.

**Ruben Hassid (How to AI)** takes a minimalist 3-folder approach (`ABOUT ME/`, `OUTPUTS/`, `TEMPLATES/`) with three files: `about-me.md`, `anti-ai-writing-style.md`, and `my-company.md`. His critical insight is **token discipline** — he initially had a 22,000-word about-me file that devoured the context window, then trimmed it to under **2,000 tokens**. His `anti-ai-writing-style.md` bans 80+ AI-sounding words (delve, harness, tapestry) and kills reframe patterns. The `TEMPLATES/` folder stores skeletons of successful outputs that Claude reuses for structural consistency.

**Alex Banks (The Signal)** skips folder hierarchy entirely and uses three flat context files: `about-me.md`, `voice-and-style.md`, and `working-rules.md`. His philosophy: "Memory is fragments captured over time; context files are deliberately designed knowledge." He emphasizes that **context files compound** — each tweak based on a mistake Claude makes improves every future session.

**Sid Bharath** introduces **task-specific output folders** (`Daily/`, `Weekly/`, `Expenses/`, `Projects/Q2-Launch/`) rather than a single `outputs/` bucket, and separates global instructions (short behavioral rules, always enforced) from context files (detailed reference knowledge, consulted when relevant). He also recommends organizing work into just **three Cowork Projects**: Work, Content, and Personal.

**Excellent AI Prompts** adds a `skills/` directory alongside `context/`, `inputs/`, and `outputs/`. Each skill is a Markdown file defining a specific task format — like `weekly-update.md` with exact section headers, tone rules, and length constraints. This modular skill approach lets you build a library of reusable task definitions.

**Chris Bailey** treats the setup as a mental model rather than a file structure. His 10-tip framework emphasizes: start with intention, dictate prompts via voice (he dictated 132,000 words in 54 days using Wispr Flow), plan alongside Claude before execution, and treat every task as an optimization problem. His most actionable insight: **"When something goes wrong, fix the system, not the robot"** — update the skill file or context rather than re-prompting.

**JJ Englert (Tenex/Lenny's Newsletter)** introduces the **anti-to-do list**: catalog every repetitive task you hate (first-drafting emails, meeting prep, file organizing) and convert each into a Cowork skill. He also uses **good/bad example training** — save outputs you love as positive examples and annotate bad outputs with "Don't do this again" so Claude learns subjective preferences over time.

| Dimension | Andrade | Ryan Stax | Hassid | Banks | Bharath | Excellent Prompts |
|-----------|---------|-----------|--------|-------|---------|-------------------|
| Folders | 4 | 4 | 3 | Flat | Flexible | 4 |
| Core files | 2 | 3 | 3 | 3 | 3 | 1 + skills |
| Interview Qs | ~50 | ~30 | 20 | Manual | Manual | Via Chat |
| Token budget | Unset | Unset | <2K | Unset | Unset | Unset |
| Rules location | system/ | ground-rules/ | Global | File | Global + file | Global |
| Templates | In projects/ | In projects/ | TEMPLATES/ | None | /Templates/ | skills/ |
| Unique strength | Question-first flow | Access boundaries | Token discipline | Simplicity | Task-specific outputs | Modular skills |

---

## What every approach agrees on

Despite structural differences, **seven principles appear in virtually every guide**:

1. **Never use Cowork without context files.** This is the universal #1 mistake. Generic output is a setup problem, not a model problem.
2. **Use interviews, not manual writing, to build context files.** Four of six detailed guides explicitly warn against hand-writing about-me files — the interview process surfaces deeper truths about how you actually work.
3. **Separate read-only context from write-only outputs.** Claude should never modify your identity files or rules — only write deliverables to a designated output area.
4. **Use a dedicated workspace folder.** Never point Cowork at Documents, Desktop, or your home directory. One guide reports a VC losing family photos after granting broad delete permissions.
5. **Set global instructions that require reading context files first.** Without this, Claude skips your carefully crafted context.
6. **Use question-first prompting.** Tell Claude to ask clarifying questions before executing. This single pattern is cited as the biggest quality lever across multiple sources.
7. **Include "never delete files" as a hard rule.** Multiple guides treat this as non-negotiable safety hygiene.

---

## The optimized workspace: synthesized from all approaches

The configuration below cherry-picks the strongest elements from each approach. It uses Andrade's question-first flow, Stax's access boundaries and naming conventions, Hassid's token discipline and anti-AI writing file, Banks' compounding context philosophy, Bharath's task-specific output folders, Excellent Prompts' modular skills, and Bailey/Englert's good/bad example training.

### Folder structure

```
COWORK-HQ/
├── context/                    # READ-ONLY — who you are
│   ├── about-me.md             # Identity, role, priorities, working style
│   ├── voice-and-style.md      # How you write, banned words, real samples
│   └── my-company.md           # Business context, strategy, audience
├── rules/                      # READ-ONLY — how Claude should behave
│   └── operating-rules.md      # Behavioral rules, boundaries, QA checklist
├── skills/                     # READ-ONLY — reusable task definitions
│   ├── weekly-update.md        # Format template for weekly status updates
│   ├── email-draft.md          # Email drafting rules and structure
│   └── research-brief.md       # Research synthesis format
├── projects/                   # READ-ONLY unless told to edit
│   └── [project-name]/
│       ├── brief.md            # Project goals, audience, constraints
│       ├── references/         # Source materials, links, data
│       ├── examples/           # Good outputs to emulate + bad outputs to avoid
│       └── notes.md            # Running notes, decisions, context
├── templates/                  # READ-ONLY — output skeletons from past wins
│   └── [template-name].md
└── outputs/                    # WRITE-ONLY — all deliverables go here
    ├── drafts/
    ├── reports/
    ├── briefs/
    └── daily/
```

### Global instructions

Paste this into **Settings → Cowork → Global Instructions**:

```
You are my working partner inside this workspace.

## BEFORE EVERY TASK
1. Read all files in context/ — no task starts without this.
2. Read rules/operating-rules.md.
3. If the task relates to a project, read the matching subfolder in projects/.
4. If a skill exists for this task type, read the matching file in skills/.

## FOLDER ACCESS RULES
Read-only (never create, edit, or delete files here):
- context/
- rules/
- skills/
- projects/
- templates/

Write-only (all deliverables go here):
- outputs/

## EXECUTION RULES
- If the goal, audience, or output format is unclear, ask questions first. Do not fill gaps with guesses.
- Do not execute immediately on complex tasks. Show your plan, then proceed after confirmation.
- Do not invent facts, decisions, dates, numbers, or approvals. Make uncertainty visible.
- Never delete files anywhere. Save outputs as new files.
- Deliver the work. Skip commentary unless I ask for it.

## FILE NAMING
All files you create: project-name_content-type_v1.ext
Examples: newsletter_draft_v1.md, q2-launch_report_v2.docx
Increment version if a file with the same name exists.

## QUALITY CHECK (before delivering any output)
- Does this match the voice in context/voice-and-style.md?
- Does this follow the rules in rules/operating-rules.md?
- Did I use any banned words or patterns from voice-and-style.md?
- Would this need major revision, or is it ready to use?

Use workspace files as the main source of truth.
Save all final outputs in outputs/ with appropriate subfolder.
```

### Core file: `context/about-me.md`

Generate this through a Claude interview. Start a new Cowork session and paste the following interview prompt:

```
You are building my about-me.md file for my Cowork workspace.
This file will be read by Claude at the start of every session.
It must be concise and high-signal — under 2,000 tokens.

Interview me one question at a time using AskUserQuestion.
Ask 15-18 questions across these blocks:

BLOCK A — WHO I AM (5 questions)
- What do you do? Role, company, industry.
- Who do you serve? Audience, clients, stakeholders.
- What are your current top 3 priorities?
- What does a good week look like for you?
- What decisions have you already made that I should build on?

BLOCK B — HOW I WORK (5 questions)
- What tools do you use daily?
- Walk me through how you typically approach a new task.
- What does "done" look like for your most common deliverables?
- How do you review and QA your own work?
- What's your process when you're stuck?

BLOCK C — WHAT MATTERS (5-8 questions)
- What's the best output you've produced recently? Why was it good?
- What separates great work from average work in your field?
- What do you react negatively to in AI-generated output?
- What are your hard lines — things that should never happen?
- What are you saying no to right now? (strategic constraints)
- Any contrarian beliefs or things you think are overrated?

RULES FOR THE INTERVIEW:
- Push back on vague answers. Ask for real examples.
- Call out contradictions between answers.
- Distinguish how they actually work from how they aspire to work.
- No flattery. No "great answer." Just ask the next question.

After all questions, compile answers into a structured about-me.md
with sections: Who I am, How I work, What good looks like,
What I hate, My rules, Instructions for Claude.
Keep it under 2,000 tokens. Save to context/about-me.md.
```

### Core file: `context/voice-and-style.md`

Generate via a separate interview:

```
You are building my voice-and-style.md file for my Cowork workspace.
This file teaches you how I actually write — not how AI writes.

Interview me one question at a time using AskUserQuestion.
Ask 10-12 questions:

1. What's your natural writing tone? (formal/casual/somewhere between)
2. Paste 2-3 paragraphs of your best writing. I'll analyze them.
3. Paste 2-3 sentences that sound NOTHING like you.
4. What words or phrases should I never use?
5. Do you use contractions? Slang? Humor? Profanity?
6. Bullet points or paragraphs? Short sentences or long?
7. How does your tone change by audience? (team vs client vs public)
8. What's the worst thing about default AI writing?
9. What formatting patterns do you prefer? (headers, bold, lists)
10. Any specific structures you always use? (BLUF, inverted pyramid, etc.)

After all questions, compile into voice-and-style.md with:
- MY VOICE: tone description with examples
- ALWAYS DO: patterns and structures to use
- NEVER DO: banned words, structures, and tones
- BANNED WORDS LIST: specific words I never want to see
- WRITING SAMPLES: my actual paragraphs as reference

Save to context/voice-and-style.md.
```

### Core file: `context/my-company.md`

Generate via interview:

```
You are building my-company.md for my Cowork workspace.
This file captures business context so Claude understands the
strategic environment behind every task.

Interview me (6-8 questions):
1. What's your company/business? What do you sell or do?
2. Who are your customers? What do they care about most?
3. What's your strategy for the next 6-12 months?
4. What platforms or channels matter most?
5. What are you explicitly saying no to?
6. Who are your competitors and how do you differentiate?
7. What metrics define success for you?
8. Any brand guidelines or positioning statements to follow?

Compile into my-company.md under 1,500 tokens.
Update quarterly. Save to context/my-company.md.
```

### Core file: `rules/operating-rules.md`

Generate via interview:

```
You are building operating-rules.md for my Cowork workspace.
This file defines exactly how you should behave as my AI partner.

Interview me (10-12 questions):
1. Should I ask clarifying questions before starting, or just go?
2. What's the threshold between "just do it" and "ask first"?
3. What should I never assume or make up?
4. What file formats do you prefer for different output types?
5. How detailed should responses be? (concise vs comprehensive)
6. What does "finished" look like — when is something ready to deliver?
7. What AI mistakes have burned you before? What should I prevent?
8. Are there topics, tools, or approaches I should avoid entirely?
9. How should I handle conflicting information from different sources?
10. When you say "draft," do you mean rough or polished?
11. Should I explain my reasoning, or just deliver output?
12. What's your pre-delivery checklist — what must be true before I call something done?

Compile into operating-rules.md with sections:
- Core principles
- Before every task (when to ask vs execute)
- During execution (how to handle ambiguity, conflicts, uncertainty)
- Delivery standards (what "done" means)
- Hard boundaries (what never to do)
- Pre-delivery checklist

Save to rules/operating-rules.md.
```

### Example skill file: `skills/weekly-update.md`

```markdown
# Weekly Status Update

When I ask for a weekly update, follow this format:

## What shipped this week
- List completed work with brief descriptions

## What's in progress
- Current projects with expected completion dates

## Blockers
- Anything slowing down work

## Next week's priorities
- Top 3 focus areas

RULES:
- Professional but conversational tone
- No corporate jargon
- Use bullet points
- Total length: under 500 words
- Pull from project folders and any connected tools
- Flag items that are overdue or at risk
```

### Example skill file: `skills/research-brief.md`

```markdown
# Research Brief

When I ask for a research brief or analysis:

1. Start with a single-sentence bottom line (BLUF)
2. Follow with "Why it matters" (2-3 sentences)
3. Then provide detailed analysis with evidence
4. End with "What to do about it" (actionable recommendations)

RULES:
- Cite specific sources, numbers, and dates
- Distinguish facts from opinions
- Flag uncertainty explicitly ("evidence is mixed" not "possibly")
- No hedging without cause — take a position
- Under 1,500 words unless I specify otherwise
- Save to outputs/briefs/
```

### Project template: `projects/[project-name]/brief.md`

```markdown
# Project: [Name]

## Goal
What is the desired outcome? One sentence.

## Audience
Who will see this? What do they care about?

## Constraints
- Deadline:
- Format:
- Length:
- Tone:

## Key inputs
- [Link or file reference]
- [Data source]

## What success looks like
How will I know this is done well?

## What to avoid
Specific pitfalls for this project.
```

---

## Making outputs higher quality: seven advanced patterns

**Question-first prompting** is the single most cited quality lever. Instead of "Write me a report on X," use: "Read the project folder first. Then ask me questions before you execute. I want a decision brief, not a generic summary." Andrade demonstrates that three different projects trigger three completely different question sets — Claude adapts its information-gathering to the task.

**Good/bad example training** creates a feedback loop. Save your best outputs to `projects/[name]/examples/` with a note explaining why they're good. Save disappointing outputs with annotations like "Too generic — needed specific numbers" or "Wrong tone — this sounds like a press release." Claude references these calibration examples on future tasks within that project.

**Calibration prompts** at the start of each new project verify Claude absorbed your context correctly. Use: "Read every file in the folder. Then summarize what you know about this workspace: what's here, what I probably use it for, and what instructions you'll follow. If something is unclear, use AskUserQuestion." If the summary doesn't match reality, your context files need updating.

**Template extraction** turns one-off wins into reusable structures. After Claude produces something excellent, say: "Save this as a template in templates/[name]. Strip the content, keep the skeleton — sections, order, format, length." Future tasks referencing that template inherit proven structure.

**Stakes framing** dramatically changes output quality. Tell Claude who will see the output, what failure looks like, and what the consequences are. Per The AI Corner's best practices guide: "Making AI take the work seriously is one of the most underrated shifts."

**Context window monitoring** prevents quality degradation. Ruben Hassid discovered that his **22,000-word** about-me file was consuming so much context window that output quality suffered. Keep identity files under 2,000 tokens each. When session context reaches ~90% capacity, outputs measurably worsen.

**Chunked skills** outperform monolithic ones. Don't build one mega-skill file. Use separate, composable skills — an overall voice skill, a format-specific skill, a domain skill — that Claude combines as needed. Karo Zieminski's testing of 56 tips confirmed that modular skills produce more consistent results.

---

## Obsidian and knowledge management integration

Obsidian's vault is just a folder of Markdown files, which means **Cowork reads it natively without any plugin**. Point Cowork at your vault folder and it can analyze topics, find connections between notes, identify orphaned notes, and create Maps of Content. Several practitioners report using Cowork to reorganize chaotic vaults using PARA + Zettelkasten frameworks in a single 3-hour session.

For deeper integration, place a `CLAUDE.md` file at your vault root as persistent context. Frank Anaya's tutorial recommends storing skills in `.claude/skills/` within the vault and using SessionStart hooks that inject today's date and recent file changes automatically. Chained skill workflows — like Sunday Reset → weekly-review → inbox-process → link-audit — create powerful recurring automation. One critical constraint from multiple sources: always include "Do not add anything I didn't write" to prevent model interpolation in your notes, and scope file access to specific paths rather than vault-wide sweeps for large vaults.

Kyle Gao's workflow automates Obsidian's most tedious maintenance: adding wiki-links to people/places/books, formatting book reviews, and filing notes with appropriate backlinks. Rosie Bryce on Medium describes skills as SOPs and memory as institutional knowledge, noting the setup takes 1–2 days but compounds indefinitely after that.

---

## Fourteen mistakes to avoid

The most damaging mistakes, synthesized from all sources: **Pointing Cowork at your Documents or Desktop folder** instead of a dedicated workspace (security risk and context pollution). **Not including "never delete files"** in global instructions — one documented case involved a VC losing family photos. **Writing context files manually** instead of using Claude's interview process (you'll describe how you aspire to work, not how you actually work). **Building one giant skill file** instead of modular, composable skills. **Using Cowork for simple chat-worthy tasks** — Cowork consumes 20x+ more tokens than regular Claude Chat, so reserve it for multi-step autonomous work. **Neglecting to update context files** as your role evolves — stale instructions produce stale output. **Writing 500-word prompts** into the prompt box, which signals your context files aren't doing their job. **Not testing with a calibration prompt** after setup to verify Claude actually absorbed your context. **Skipping the question-first pattern** and letting Claude execute immediately on ambiguous tasks. **Using the browser extension heavily** — Jeff Su reports it's slow, unreliable, and burns usage. Per Ryan Stax: "If you're still writing novels into the prompt box, your context files aren't pulling their weight."

---

## Conclusion: context engineering is the entire game

The gap between mediocre and exceptional Cowork output has nothing to do with the model and everything to do with what you put around it. The optimized configuration above — six folders, four interview-generated context files, modular skills, explicit access boundaries, question-first prompting, and good/bad example training — represents the convergent wisdom of the most sophisticated Cowork users in the community. Three actions matter most: **run the four interviews** to generate your context files (this alone is worth more than switching models), **enforce the question-first pattern** in your global instructions, and **treat every disappointing output as a signal to update your system files** rather than re-prompt. The workspace compounds. Every file you add, every rule you refine, and every template you extract makes every future session better. Start with the interviews, build the folder structure, paste the global instructions, and run a calibration prompt. The whole setup takes under an hour. The payoff is permanent.