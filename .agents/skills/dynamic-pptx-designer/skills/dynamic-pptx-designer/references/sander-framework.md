# The Sander framework — 10 programmable design moves

Sander's style is deliberately stripped down. The magic is restraint
plus a few high-impact mechanics. These ten moves cover ~90% of what
makes those decks feel alive.

## 1. One idea per slide
No bullet stacks. A slide holds a single thought — a headline, a
number, a before/after. If there's a second idea, it gets its own slide.

**How the skill enforces this:** recipes like `signal_word` and
`morph_zoom` each carry exactly one idea. No multi-bullet layouts in
the cookbook.

## 2. Type hierarchy that shouts
Headlines are **huge** (44–96pt). Sub-text is small and quiet. No
middle sizes, no "medium-importance" text.

**Enforced via:** `_TYPE_SCALE` in `master_apply.py`. Hero = 96pt,
headline = 44pt, body = 18pt. No 24pt limbo.

## 3. Morph for storytelling
Morph isn't decoration; it's a camera move. Use it when the next slide
is the same thing viewed differently — zoomed in, evolved, reframed.

**Enforced via:** `morph_zoom`, `before_after`, `process` recipes. All
use `!!`-prefixed shape names so PowerPoint auto-pairs.

## 4. Negative space is the design
The space around a headline does the work. Push text to ~2/3 of slide
height, leave the rest empty.

**Enforced via:** all recipes use left-aligned headlines at 2400000
EMU vertical (~38% down), with nothing filling the bottom unless
intentional.

## 5. Custom shapes over SmartArt
SmartArt looks like SmartArt. Bespoke shapes — a single rectangle, a
circle, a precisely-placed text block — look considered.

**Enforced via:** recipes build with `MSO_SHAPE` primitives, never
SmartArt.

## 6. Process evolution, not diagrams
A 4-step process shouldn't be a single cluttered slide. It's 4 slides
that morph forward — like a camera panning along a timeline.

**Enforced via:** `process` recipe. One step per slide; the `!!step`
anchor morphs between them.

## 7. Color as signal, not decoration
One primary, one accent, plus neutrals. The accent only shows up when
something needs to be noticed.

**Enforced via:** default palette has exactly 3 color roles (primary,
accent, neutrals). `highlight_signal_word` reserves the accent for
literal signal words.

## 8. Signal-word highlight
One word in a sentence gets the accent treatment to anchor the reader's
eye. The rest stays neutral.

**Enforced via:** `signal_word` recipe + `highlight_signal_word`
helper.

## 9. Cinematic reveal
Full-bleed background, tiny text subhead, massive headline. Feels like
a movie title card.

**Enforced via:** `cover` recipe — full-slide colored rectangle
backdrop, massive headline + quiet subhead.

## 10. Data respects narrative
Charts (Power BI) live on slides that explicitly frame what to look at.
The visualization is supported by a one-sentence insight callout.

**Enforced via:** `powerbi_exec` recipe. Reserved region for the add-in
plus a forced "Key insight" callout.
