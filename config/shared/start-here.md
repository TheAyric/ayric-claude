# Start Here — Calibration Prompts

Copy-paste prompts for the start of any Cowork or Chat session. Use these to verify Claude has loaded the right context before kicking off real work.

Last updated: 2026-04-16

---

## 1. New session calibration (paste at the start of every new Cowork session in a Project)

```
Before we start:

1. Read now (if you haven't this session):
   - Global Main/Claude/CLAUDE.md
   - Shared/voice-and-style.md
   - This project's CLAUDE.md
   - Any referenced team-roster or solo-context

2. Tell me in 2-3 sentences:
   - What project am I in?
   - What role are you playing?
   - What voice/register should you use?

3. Flag any context files you couldn't find or that looked incomplete.

Don't start work until I confirm your read is right.
```

---

## 2. Project switch confirmation (use when moving between projects mid-session)

```
We're switching projects. Before doing anything in the new one:

1. State the new project name and its role (from its CLAUDE.md)
2. Tell me what changes vs. the last project:
   - Voice/register
   - Team roster vs. solo
   - Active MCPs
   - Active skills

3. Wait for my go-ahead before starting the new task.
```

---

## 3. Memory check

```
What do you remember about [topic/person/project]?

Source each fact:
- Is it from a file you just read? Name the file.
- Is it from auto-memory? Say "from memory: [memory name]".
- Is it from general knowledge? Say so explicitly.

If anything conflicts, flag the conflict — don't silently pick one.
```

---

## 4. Skill availability check

```
List the skills that are relevant to the current project and available to invoke. For each, give me:

- Skill name and trigger
- One-sentence summary of what it does
- When it would fit the work I'm doing today

Don't list skills that aren't a fit for this project.
```

---

## 5. Pre-deliverable calibration (use before creating any stakeholder-facing output)

```
Before generating this:

1. Who is the audience? (specific name, role)
2. What voice row in voice-and-style.md applies?
3. What format does Ayric want? (ask if not specified)
4. Any hard rules active for this audience? (no em-dashes for Don, no emojis globally, etc.)

Answer all four, wait for my confirmation, then generate.
```

---

## 6. Stuck / drifting

```
I'm losing the thread. Do this:

1. Tell me what we were trying to accomplish (primary task).
2. List anything I've parked during this conversation.
3. Suggest the single next action to finish the primary task.

Don't give me options — pick one.
```

---

## 7. End-of-session wrap

```
Before we close:

1. What did we actually finish today?
2. What's still open (with next action for each)?
3. Anything worth saving to memory? (ask me yes/no per item, don't save autonomously)
4. Anything that belongs in a History file for this project?
```

---

## Notes

- Always prefer Prompt #1 when opening a new session. Skipping calibration = drift.
- Prompts #5 and #6 are the highest-value ones for ADHD-driven workflow — use them liberally.
- If a prompt doesn't fit the situation, modify it. These are defaults, not scripts.
