# dynamic-pptx-designer

Advanced PowerPoint designer plugin. Produces dynamic, Sander-style
decks using morph transitions, bold typography, custom shapes, and
Power BI-ready layouts.

## What's in the box

- **Skill** — `dynamic-pptx-designer` — triggers on "design a deck",
  "make this dynamic", "apply morph transitions", and similar requests.
- **Command** — `/design-deck` — fast trigger; collects minimum inputs
  then builds.
- **Scripts** — `build_deck.py`, `morph.py`, `master_apply.py` — produce
  `.pptx` files with morph transitions wired via the Microsoft `!!name`
  custom-naming convention.
- **References** — `sander-framework.md` (10 programmable moves),
  `morph-cookbook.md` (6 recipes with outline JSON examples).
- **Examples** — `test-outline.json` covers all six recipes.

## Morph — how it works

PowerPoint's Morph transition pairs shapes by name when names start
with `!!`. The skill:
1. Names anchor shapes (`name_shape(shape, "!!hero")`).
2. On the destination slide, injects a
   `<p159:prstTrans option="byObject"/>` inside `mc:AlternateContent`
   — the exact XML form PowerPoint writes when you set Morph via the UI.
3. The result: PowerPoint morphs the named shape from the previous
   slide into its counterpart on arrival.

The authoritative XML template was reverse-engineered from
[gramener/gramex pptgen2 config.yaml](https://github.com/gramener/gramex/blob/master/gramex/pptgen2/config.yaml).

## Dependencies

```
pip install python-pptx --break-system-packages
```

## Scope of v0.2

- 6 recipes: cover, morph_zoom, before_after, signal_word, process,
  powerbi_exec
- Default type scale + color ramp (overridable via `meta.brand_colors`
  / `meta.fonts`)
- Morph via `!!name` + single-file `.pptx` output
- Power BI embed handoff via speaker-notes

## Future (v1+)

- `by-word` / `by-char` morph modes (currently uses `by-object`)
- Custom diagram library (org charts, funnels, value chains) without
  SmartArt
- Brand template ingestion (read master slide from user-supplied pptx)

## Credits

- Technique inspiration: Slides by Sander
- Morph `!!` convention: Microsoft-documented
- Morph XML template: gramener/gramex pptgen2
- Stack: `python-pptx` by Steve Canny
