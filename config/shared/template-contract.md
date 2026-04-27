# Compex Template Contract

Authoritative naming conventions for the Compex PowerPoint template + skill. Template author and skill code both adhere to this.

Approved: 2026-04-17

---

## Recipes (9 total)

1. **cover** — brand hero, title/subtitle, no morph
2. **morph_zoom** — `!!hero` grows or shrinks across 2-3 slides
3. **before_after** — paired `!!` anchors show change
4. **signal_word** — accent-colored word inside body text, no morph
5. **process** — N slides, `!!step` morphs position/label per step
6. **powerbi_live** — reserved region, notes for Live mode + auto-refresh
7. **powerbi_snapshot** — reserved region, notes for Snapshot mode
8. **word_reveal** — Effect Option = Words, typography rearrangement
9. **anagram** — Effect Option = Characters, letter/number transformations

---

## Content slot names

Every content-bearing shape or placeholder in a layout uses one of these names:

| Name | Purpose |
|---|---|
| `title` | Primary headline |
| `subtitle` | Secondary headline / section label |
| `body` | Main body text |
| `body_2` | Second body block (two-column layouts) |
| `accent` | Callout word/number, styled distinctly |
| `caption` | Small secondary text (step indicator, footer, Before/After label) |
| `brand` | Logo or brand mark |
| `pbi_region` | Reserved rectangle for Power BI add-in |
| `insight` | Insight callout next to PBI region |

## Morph anchor names

Shape names that start with `!!` per Microsoft's morph convention:

| Name | Used by recipe |
|---|---|
| `!!hero` | morph_zoom, cover→morph_zoom transitions |
| `!!step` | process |
| `!!before`, `!!after` | before_after |
| `!!word` | word_reveal (slide 2 has Effect Option = Words) |
| `!!anagram` | anagram (slide 2 has Effect Option = Characters) |

## Rules

- **Dual-role shapes:** if a shape is both a content slot and a morph anchor (e.g., `!!hero` holding the headline text), name it with the `!!` version — the skill treats that as the content slot for the recipe.
- **Lookup:** the skill finds shapes by `shape.name` iteration, not placeholder index. No magic numbers.
- **Uniqueness:** each `!!name` should be unique on a slide (per Microsoft's 1:1 mapping requirement).
- **Non-`!!` names:** all other shapes can be named however the template author wants; they won't interfere with morph.
