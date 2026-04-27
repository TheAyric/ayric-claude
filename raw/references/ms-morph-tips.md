# Morph transition: Tips and tricks — Microsoft Support

Source: https://support.microsoft.com/en-us/office/morph-transition-tips-and-tricks-bc7f48ff-f152-4ee8-9081-d3121788024f
Fetched: 2026-04-17 via Claude in Chrome

## Headline rule — `!!` custom-naming scheme

> "Morph now gives you more control over which objects do and don't morph. Our custom naming scheme lets you match two objects on successive slides and force one to morph into the other. The naming scheme is simply to begin an object name with !! (two exclamation points) and to assign the same custom name to the two objects."

Example: circle named `!!Shape1` on slide 7 + square named `!!Shape1` on slide 8 → applying Morph to slide 8 makes the circle morph into the square.

## How to rename objects (Selection Pane)
- Windows: Home → Editing → Select → Selection Pane
- Mac: Home → Arrange → Selection Pane
- Click name once to select, click again to edit. `Ctrl+A` selects the name, type `!!` + rest.

## What `!!` enables
- Force different shapes to morph (circle ↔ square)
- Force two instances of the same shape with different text
- Force two images to morph
- Force any two objects of the same type (table/table, SmartArt/SmartArt)
- **Exception: charts don't morph — they cross-fade.**

## Rules
- Morph won't match a `!!` object with a non-`!!` object
- 1:1 mapping expected — a specific `!!Name` should be unique on a slide
- Non-`!!` names still work normally (Morph falls back to its own matching)

## Custom shapes / edit points
- Shapes with **more than one hole** can't geometrically morph
- Before/after should have roughly the same number of edit points
- Edit points should positionally correspond
- Shapes should be drawn with the same orientation (both clockwise or both counterclockwise)

## Version requirements (minimum)
| Product | Min version |
|---|---|
| PowerPoint for M365 Windows, Current Channel | 1903 |
| PowerPoint for M365 Windows, Semi-Annual Ent. | 1908 |
| PowerPoint for M365 Mac | 16.23 |
| PowerPoint 2019 Windows | 1908 |
| PowerPoint 2016 Windows | 16.0.4888 (play only, no authoring) |
| PowerPoint iOS | 2.24 (play only) |
| PowerPoint Mobile | 1903 (play only) |

## Effect Options on the Transitions tab
Applies to slide 2 of the pair. Three modes:
- **Default** (object-level) — whole objects morph
- **Words** — word-level morph, for typography animations
- **Characters** — character-level morph, creates anagram effect

## Recipes enumerated in the doc
1. **Motion + emphasis** — duplicate slide, move/rotate/resize/flip/recolor the object on slide 2
2. **Entrance/exit** — add or delete an object on slide 2; or move it off-canvas for fly-in/fly-out
3. **Animate words** — set Effect Option = Words, move text between slides
4. **Anagram** — set Effect Option = Characters, rearrange letters
5. **Zoom/scroll/crop images** — background image extended off-canvas, or moved vertically between slides
6. **3-D rotation** — Drawing Tools → Shape Effects → 3D rotation set differently on each slide

## Implications for the Compex template
- Template must be built in **PowerPoint ≥ M365 1903 / PowerPoint 2019 build 1908+** for authoring morph transitions
- The `!!` convention is the authoritative anchor system — our plugin uses this naming too
- Each morph-anchor shape on a layout needs the same `!!name` across paired slides
- Charts are a known limitation — don't expect them to morph; they cross-fade
- If we want multi-hole geometric shapes, we need to chain multiple morphs or use cross-fade fallback
