---
description: Generate a dynamic, Sander-style PowerPoint deck from an outline with morph transitions, bold design, and Power BI support.
---

# /design-deck

Launch the `dynamic-pptx-designer` skill to build a high-impact deck.

## Instructions to Claude

When this command runs:

1. Invoke the `dynamic-pptx-designer` skill immediately.
2. Ask for the minimum viable inputs (keep it tight — ADHD-friendly):
   core message in one sentence, audience, approximate length. Default
   to 8 slides if unspecified.
3. Capture brand colors / fonts if the user has them, otherwise use
   defaults.
4. Capture Power BI report URLs if Power BI slides are wanted.
5. Map the content to recipes from
   `skills/dynamic-pptx-designer/references/morph-cookbook.md` — cover,
   morph_zoom, before_after, signal_word, process, powerbi_exec.
6. Build an outline JSON and run `scripts/build_deck.py`.
7. Save the `.pptx` to the user's outputs and return a `computer://`
   link.
8. Summarize which recipes were applied in 2–3 sentences. No filler.

Do NOT over-explain before generating. Get the minimum inputs, then build.
