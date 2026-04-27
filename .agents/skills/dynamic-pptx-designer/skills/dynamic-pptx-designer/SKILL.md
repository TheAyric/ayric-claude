---
name: dynamic-pptx-designer
description: Advanced PowerPoint designer that produces dynamic, Sander-style decks with morph transitions, bold typography, custom shapes, and Power BI-ready layouts. Trigger on "design a deck", "make this dynamic", "apply morph transitions", "build a sander-style presentation", or any request for high-impact slide design beyond a normal PPT.
---

# dynamic-pptx-designer

Build high-impact, visually dynamic PowerPoint decks. This skill combines
a Sander-inspired framework (10 programmable design moves) with a recipe
cookbook of pre-wired morph-transition layouts.

## When to use

Trigger when the user asks for any of:
- "Design a deck" / "make this dynamic" / "apply morph transitions"
- "Sander-style" or "cinematic" presentations
- A PowerPoint with morph sequences, before/after, zoom reveals, or
  signal-word highlights
- A deck with an embedded Power BI placeholder

## Workflow

1. **Gather inputs** (keep it tight — ADHD-friendly):
   - Core message in one sentence
   - Audience
   - Rough length (default 8 slides)
   - Brand colors/fonts if they exist
   - Power BI URLs if Power BI slides are wanted

2. **Map content to recipes.** See
   [references/morph-cookbook.md](references/morph-cookbook.md) for the
   six recipes: `cover`, `morph_zoom`, `before_after`, `signal_word`,
   `process`, `powerbi_exec`.

3. **Construct outline JSON** matching the shape documented at the top
   of `scripts/build_deck.py`.

4. **Build with script:**
   ```bash
   python scripts/build_deck.py outline.json out.pptx
   ```

5. **Deliver** via a `computer://` link. Tell the user which recipes
   were used and on which slides morph applies.

## Why this works (the morph detail)

PowerPoint's Morph transition pairs shapes by **name** when names start
with `!!`. The skill handles this automatically via `name_shape(shape,
"!!hero")`. The transition itself is injected as a `<p159:prstTrans
option="byObject"/>` element wrapped in `mc:AlternateContent` — the
exact XML form PowerPoint writes when you set Morph via the UI.

This is pure-OSS via `python-pptx`. No Aspose, no SmartArt, no MCP fork.

## Files

- `scripts/morph.py` — morph transition injector (`!!name` + XML)
- `scripts/master_apply.py` — design tokens, type scale, text helpers
- `scripts/build_deck.py` — 6 recipes, main entrypoint
- `references/sander-framework.md` — 10 design moves
- `references/morph-cookbook.md` — recipe specs with outline examples
- `examples/test-outline.json` — reference input covering all 6 recipes
- `examples/sample-deck.pptx` — verified output with morph wired

## Dependencies

`pip install python-pptx --break-system-packages`

## Verification

To confirm morph is wired, open the deck in PowerPoint, go to the
Transitions tab, and check the flagged slides. Morph should be
selected. If not, close PowerPoint fully (it caches), then reopen.
