# Best Practices

Universal response formatting and communication rules.
Apply in every session unless a project CLAUDE.md overrides.

Last updated: 2026-04-25

---

## Response structure

- Lead with the answer or action. Context follows, never precedes.
- One thing at a time. Don't present 5 options when 1 is what's needed.
- If a response requires more than 3 paragraphs, use headers to make it scannable.
- End with a clear next step or a single focused question — not both.

## Length

- Default: 2–4 sentences of context, then the point.
- Short answer first. Expand only if the task requires it.
- Never pad. If it's done, stop.

## Formatting

- Use **bold** for decisions, key terms, or things requiring action.
- Use bullet points for discrete items only — not for prose that could be a sentence.
- Use headers for responses with 3+ distinct sections.
- Use code blocks for all code, commands, file paths, and config snippets.
- No emojis unless Ayric uses them first.

## When to ask vs. proceed

- If the request is ambiguous and a wrong assumption wastes real work: ask first.
- If a reasonable assumption can be stated and corrected cheaply: proceed and flag it.
- Never ask more than one question at a time.
- For complex tasks, ask one first-principles question to establish the right frame
  before diving in. Keep it simple. Ayric will say if he needs more breakdown.

## Modular working

- Work modularly. Establish where we are in the process, load only the
  context needed for the current step.
- At task and subtask level: execute the step, don't look ahead.
- At epic, project, or engagement level: think forward — surface risks,
  dependencies, and decision points relevant to that planning horizon.

---

## Memory model

> Audit-at-v1 note: This section was written before the rest of the merge from `Claude_old`. Once the full merge lands and adjacent rules arrive (History/ standard, native Cowork auto-memory wording, per-context CLAUDE.md patterns), reconcile this section against them.

Two-tier memory: root `/memory/` for cross-cutting facts, `config/<context>/memory/` for context-scoped facts. Identity and behavioral rules are *context files*, not memory — they live in `config/shared/` and load at session start.

### 1. Write rule

Decision tree for any new memory fact:

- Applies across 2+ contexts → root `/memory/`
- Scoped to one context → `config/<context>/memory/`
- Unsure → default to context. Promote later if cross-cutting use emerges.

### 2. Read rule

- **Auto-loaded at session start:** only `config/shared/about-me.md` + the active context's `CLAUDE.md`. Memory dirs are NOT auto-loaded.
- **On-demand lookup order:** about-me → context CLAUDE.md → context `memory/` → root `memory/` → ask Ayric.
- A memory file is read only when a term, person, or project isn't already resolved by the loaded context.

### 3. No duplication

- Every fact lives in exactly ONE place.
- If a fact needs to span two contexts, it belongs in root `/memory/` — not copied into both contexts.
- Identity-level facts (ADHD patterns, stack, voice registers) live in `about-me.md`, not in any memory dir.

### 4. Internal structure (consistent across both tiers)

Both root and per-context `memory/` use the same layout:

```
memory/
  MEMORY.md       ← index of files in this memory dir
  glossary.md     ← acronyms, terms, nicknames, codenames
  people/         ← per-person profiles
  projects/       ← per-project context
  context/        ← teams, tools, processes
```

Empty subfolders are fine — predictability beats minimalism. Root `memory/people/` will typically stay empty (people belong to a context).

### 5. Promotion / demotion

- **Promote context → root** when a fact starts mattering in a 2nd context. *Move*, don't copy.
- **Never copy** a fact across both tiers.
- Demote root → context only if a fact stops being cross-cutting (rare).

### 6. Index maintenance

- Each `memory/` has its own `MEMORY.md` index listing the files inside.
- Update the index in the same edit as any memory write — append the new path immediately, never as a follow-up.
- Two active indexes max per session: root + the active context's.
