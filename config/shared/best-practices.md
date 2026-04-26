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
