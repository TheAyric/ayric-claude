# Voice-and-Style Interview — Run This Tomorrow

## How to use this

1. Open a **new Claude Chat conversation** (not Cowork — faster, no file overhead)
2. Paste the prompt below
3. Answer one question at a time (Claude should ask them sequentially)
4. When done, Claude will compile the result — copy/paste it into `Main/Claude/Shared/voice-and-style.md` (or wherever you want it living)
5. Reference it from the root `CLAUDE.md` so every project inherits it

## Tips before you start

- **Have 2–3 samples of your own writing ready to paste** (Slack messages, emails to your team, a good paragraph from a past report). Your actual writing — not cleaned up.
- **Have 2–3 examples of AI writing that bugs you.** Anything that sounds like ChatGPT defaults.
- Be honest about tone shifts. You probably write differently to Compex leadership vs. Korry vs. an MBA professor.
- If a question feels vague, answer with a concrete example. "Casual" is useless; "I say 'yeah' and 'honestly' a lot" is gold.
- **Budget 15–20 min.** Don't over-perfect; you can edit the file after.

---

## PASTE THIS INTO CLAUDE CHAT

You are building my voice-and-style.md file for my Claude workspace. This file teaches you how I actually write — not how AI writes.

Interview me one question at a time. Wait for my answer before asking the next one.

Ask 10-12 questions:

1. What's your natural writing tone? (formal/casual/somewhere between) Give me an example of something you wrote recently that felt like "you."
2. Paste 2–3 paragraphs of your best writing. I'll analyze them.
3. Paste 2–3 sentences that sound NOTHING like you — AI writing you'd reject on sight.
4. What words or phrases should I never use? (Banned list — be specific: "delve," "harness," "tapestry," "it's worth noting," etc.)
5. Do you use contractions? Slang? Humor? Profanity?
6. Bullet points or paragraphs? Short sentences or long?
7. How does your tone shift by audience? (Compex leadership vs. your team vs. Korry vs. a client for Ayric Intelligence vs. MBA professor)
8. What's the worst thing about default AI writing — the specific pattern that makes you cringe?
9. What formatting patterns do you prefer? (Headers, bold, lists, emoji?)
10. Any specific structures you always use? (BLUF, inverted pyramid, question-then-answer, etc.)
11. When you write something that feels like *you*, what are the telltale signs?
12. Is there a writer, podcaster, or coworker whose style you admire and why?

RULES FOR THE INTERVIEW:
- Push back on vague answers. Ask for real examples.
- Call out contradictions between answers.
- Distinguish how I actually write from how I aspire to write.
- No flattery. No "great answer." Just ask the next question.
- One question at a time. Wait for my answer.

After all questions, compile answers into a structured voice-and-style.md with these sections:

- **MY VOICE** — tone description with examples from my own writing
- **ALWAYS DO** — patterns and structures to use
- **NEVER DO** — banned words, structures, and tones
- **BANNED WORDS LIST** — specific words I never want to see
- **AUDIENCE SHIFTS** — how tone changes by audience
- **WRITING SAMPLES** — my actual paragraphs as reference

Keep it under 2,000 tokens. Output as markdown I can copy straight into a file.

---

## After the interview

1. Save the output to `Main/Claude/Shared/voice-and-style.md` (create `Shared/` folder first if needed)
2. Add this line to root `CLAUDE.md`:
   > "Before generating any written content, read `Shared/voice-and-style.md`."
3. Test it: ask Claude to draft a quick email or status update and see if it sounds like you. If not — update the file, not the prompt.
