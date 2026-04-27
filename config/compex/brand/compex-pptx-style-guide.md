# Compex PowerPoint Style Guide

PowerPoint-native style guide for the Compex slide template. Derived from the authoritative Power BI Style Guide (`da.business.pbi` repo → `/Templates/Compex_Style_Guide.html`) and translated into deck-appropriate rules.

Version: draft-1
Date: 2026-04-17

---

## Scope

This guide governs:
- The Compex master slides and layouts in `compex-slide-template.pptx`
- All Compex-branded decks generated from that template
- Claude skills / plugins that populate that template

It does NOT govern:
- Power BI report themes (see `Compex-BI/` — different spec)
- Ayric Intelligence client decks
- Personal / MBA / learning decks

---

## Canvas

| Property | Value | Why |
|---|---|---|
| Aspect | 16:9 | Standard modern projector + Teams |
| Dimensions | 13.333" × 7.5" (33.87cm × 19.05cm) | PowerPoint default widescreen |
| Safe area | 0.5" margin all sides | Keeps content off clipping edge in Teams share |

Do NOT mirror the PBI canvas (1800×900 px) — that's screen-pixel, PBI-native. PowerPoint decks use inches and the 16:9 default.

---

## Color tokens

Mirror of `compex-brand.md`. Do NOT inline additional hex codes elsewhere.

| Token | Hex | PowerPoint theme slot | Primary use |
|---|---|---|---|
| `compex-navy` | `#041B45` | Text 2 / Accent 1 | Headings, primary accents, dark backgrounds |
| `compex-teal` | `#00A2D5` | Accent 2 | Callouts, links, data highlights, hero accents |
| `compex-cream` | `#FAF7EE` | Background 2 | Slide canvas, body backdrops |
| `compex-white` | `#FFFFFF` | Background 1 | Reserved for PBI region fills + clean slides |
| `compex-gunmetal` | `#3D4F5F` | Text 1 (alt) | Body text when navy is too heavy |
| `compex-silver` | `#8C9196` | Accent 5 / disabled | Disabled states, caption text, subtle rules |
| `compex-ink` | `#041B45` | = navy, reuse | Hover states, pressed states |

**Rules:**
- Body text: `compex-navy` on `compex-cream` by default.
- Accent color on any slide: ONE of `compex-teal` or `compex-navy`, never both fighting for emphasis.
- Never put `compex-cream` text on any background — it's a backdrop color only.

---

## Typography

PowerPoint is not Power BI — we prioritize legibility at projection distance and Teams-share readability.

### Font stack
Primary: **Segoe UI** (matches PBI + Microsoft ecosystem)
Fallback: Calibri → Arial
Never: Times New Roman, Comic Sans, any serif

### Size scale (PowerPoint)

PBI scale was 10/11/12/16. PowerPoint decks need bigger text — screens are further away and audiences are glancing, not reading.

| Role | Size | Weight | Color |
|---|---|---|---|
| Title (headline) | 40pt | Semibold | `compex-navy` |
| Subtitle | 24pt | Regular | `compex-gunmetal` |
| Body (main) | 20pt | Regular | `compex-navy` |
| Body (dense) | 18pt | Regular | `compex-navy` |
| Accent / callout | 32-54pt | Bold | `compex-teal` |
| Caption / step label | 14pt | Regular | `compex-silver` |
| Footer | 10pt | Regular | `compex-silver` |

**Rules:**
- Minimum body size: 18pt. If it won't fit at 18pt, cut content — do not shrink type.
- Line height: 1.15 minimum for body, 1.0 for titles.
- Paragraph spacing: 6pt before paragraphs, 0pt after.
- Never underline for emphasis — use weight or color.

---

## Layout grid

PowerPoint doesn't expose a grid natively, so these are guide-ruler positions. Template guides should be set to match.

- **Top margin:** 0.5"
- **Bottom margin:** 0.5"
- **Left/right margins:** 0.75"
- **Title baseline:** 0.9" from top
- **Body top:** 1.75" from top
- **Footer baseline:** 7.15" from top (fixed, all slides)
- **Brand mark (logo):** bottom-right, 0.75" from right edge, 0.35" from bottom

### Footer

Every slide except `cover` gets a footer. PBI footer is 25px tall — deck footer equivalent is a 0.25" strip at bottom.

| Element | Position | Content |
|---|---|---|
| Logo | right | Compex mark, 0.35" tall |
| Page number | center | `3 / 12` format, 10pt silver |
| Slide title (muted) | left | Optional, 10pt silver |

### Cover slide
No footer. Full-bleed `compex-navy` or `compex-cream` background. Title + subtitle + brand mark only.

---

## Chrome rules (carried over from PBI style guide)

1. **Chrome never shows titles.** Images, shapes, and textboxes used as layout scaffolding don't get auto-labels. Only charts and data tables show titles.
2. **Logo:** fixed height, aspect-preserved width, right-aligned with 0.75" edge margin.
3. **Header strip (on section dividers):** rounded-tab top corners (matches PBI `tabRoundTopCorners`), 25% corner radius, `compex-navy` fill, full-width.
4. **Dividers / rules:** 1pt `compex-silver` lines, never thicker. Use whitespace before a rule.

---

## Charts and data visualizations

Default chart colors in order:
1. `compex-teal` `#00A2D5`
2. `compex-navy` `#041B45`
3. `compex-gunmetal` `#3D4F5F`
4. `compex-silver` `#8C9196`
5. `#7AC8E5` (lighter teal, tint)
6. `#5A6B7B` (muted gunmetal)

**Rules:**
- Never use more than 5 categorical colors in one chart.
- Always show axis labels at 14pt.
- Remove gridlines unless absolutely needed; if needed, use `compex-silver` at 30% opacity.
- Chart title: 18pt, `compex-navy`, left-aligned.

---

## Buttons and interactive elements (if any)

Deck slides rarely have buttons, but if a link/CTA shape is used, follow the PBI action-button pattern:

| State | Fill | Outline | Text |
|---|---|---|---|
| Default | `compex-teal` | none | White, bold |
| Hover (in edit) | `compex-ink` | none | White, bold |
| Disabled | `compex-silver` | none | White |

---

## Power BI add-in regions (when recipe is `powerbi_live` or `powerbi_snapshot`)

- **Region fill:** `compex-white` (no color, not cream — PBI chrome needs neutral)
- **Region outline:** 1pt `compex-navy` (matches PBI add-in's only supported style = Outline)
- **Region size:** 9" wide × 4.75" tall, centered
- **Region position:** x=2.17", y=1.5"
- **Caption below region:** 14pt `compex-silver`, "Data: [source] · Updated: [cadence]"

---

## Motion / morph (applies to `morph_zoom`, `before_after`, `process`, `word_reveal`, `anagram`)

- Default transition: **Morph**, 1.00s duration.
- Effect Option per recipe (set by template author, per `template-contract.md`):
  - `morph_zoom`, `before_after`, `process`: Default (object)
  - `word_reveal`: Words
  - `anagram`: Characters
- NEVER use Fade, Push, or Wipe on a Compex deck. Either Morph or no transition.
- Slide advance: On Click only. Auto-advance is disabled.

---

## Accessibility

- Contrast: navy on cream = ~14:1 (AAA). Teal on cream = ~3.8:1 — fails AA for small text. **Teal is accent only, not body text.**
- Alt text required on every image and chart.
- Don't rely on color alone to distinguish data series — pair with shape/pattern.
- Font size minimum is 18pt for body — keeps readable at projection distance.

---

## What the template must ship with (checklist for Task 6)

- [ ] One master slide carrying these colors as theme colors (Accent 1-6)
- [ ] Font theme set to Segoe UI (Headings + Body)
- [ ] 9 layouts per `template-contract.md` (cover, morph_zoom, before_after, signal_word, process, powerbi_live, powerbi_snapshot, word_reveal, anagram)
- [ ] Each layout's content shapes named per the contract (`title`, `body`, `accent`, etc.)
- [ ] Morph anchors (`!!hero`, `!!step`, `!!before/after`, `!!word`, `!!anagram`) placed where the recipe requires
- [ ] Morph transition applied on the arrival slide of each morph pair/sequence
- [ ] Effect Option set to Words on `word_reveal` arrival slide
- [ ] Effect Option set to Characters on `anagram` arrival slide
- [ ] Footer + logo placed on master (not on every layout)
- [ ] Cover layout suppresses the footer
- [ ] Guides set to the layout grid positions above

---

## Logo variants (official, 5 total)

Source files live in `Shared/logos/`. Template should embed the variant that matches each layout's background.

| File (proposed name) | Appearance | Use on |
|---|---|---|
| `compex-logo-teal.png` | Teal wordmark, transparent bg | Cream or white backgrounds (most slides) |
| `compex-logo-teal-on-black.png` | Teal wordmark, black bg | Reserved — only if a black-bg slide is needed |
| `compex-logo-silver-on-black.png` | Silver wordmark, black bg | Low-emphasis / subdued dark slides |
| `compex-logo-white-on-black.png` | White wordmark, black bg | Navy-background cover slides (wordmark reads as white on navy) |
| `compex-logo-black-mask.png` | Solid black silhouette | Masking / effects only, not brand mark |

**Rule:** master slide uses `compex-logo-teal.png` on cream. Cover layout with navy background uses `compex-logo-white-on-black.png` (the black fill disappears against navy — renders as a clean white wordmark).

---

## Open questions to resolve during Task 6

1. ~~Light-on-dark logo variant~~ — **answered:** 5 variants confirmed. See logo table above.
2. Do we want a section-divider layout in addition to the 9 recipes, or does `cover` double as that? (Recommend: `cover` doubles.)
3. Font licensing — is Segoe UI acceptable on viewer machines outside Windows/M365? (Recommend: yes, ubiquitous enough; fall back to Calibri → Arial.)
