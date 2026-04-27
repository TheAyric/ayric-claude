# PowerPoint Approach — Reevaluation

Date: 2026-04-17
Based on: Microsoft Morph tips doc, MS PBI add-in docs (install + view/present), Slides by Sander site signal, prior source audit.

---

## What actually changed vs. our prior plan

### 1. The `!!` naming convention is authoritative, confirmed
Microsoft's own support page documents it explicitly. Two objects of the same type with identical `!!names` on consecutive slides morph into each other. This is the foundation the template should be built on — not a hack, an official convention.

### 2. Morph has THREE effect modes, not one
- **Default** (object-level) — whole shapes morph
- **Words** — word-level, for typography animation
- **Characters** — character-level, creates anagram effect

Our prior recipe set only considered object-level. **Recipe set should expand to include word- and character-level morph recipes** (good for data reveals, headline emphasis, "before/after" text transformations).

### 3. Hard morph limitations (document these upfront)
- **Charts don't morph — they cross-fade.** No amount of `!!` naming fixes this.
- **Shapes with >1 hole can't geometrically morph.** Constrains SmartArt and custom shape use.
- **Edit-point mismatches break morph.** Before/after custom shapes need same point count, same orientation.

### 4. Power BI add-in has TWO data modes
- **Live** — interactive, real-time, requires viewer to have PBI access + Fabric free license (+ Pro if report not in Premium/F64+)
- **Snapshot** — static image, works for any viewer, needs Office 2312+ (Build 17126+) to create

Our prior `powerbi_exec` recipe didn't distinguish. **Split into two recipes:** `powerbi_live` (internal exec reviews) and `powerbi_snapshot` (broader distribution). Template should make the choice explicit.

### 5. Power BI styling is minimal — only an Outline
No fancy CSS, no theming of the add-in iframe. **Design the slide frame around the add-in region, not inside it.** Chrome, headlines, callouts, branding all live OUTSIDE the PBI region.

### 6. PowerPoint version requirement is real
M365 1903+ for authoring morph. PowerPoint 2016 and older iOS versions can only PLAY morph, not create it. **The template must be authored in a modern PowerPoint build.** Note this in the README.

### 7. OSS ecosystem is thinning
- Gramener archived 2026-01
- GongRzhe MCP archived 2026-03
- python-pptx morph issue #942 still open with no maintainer engagement
- Only actively maintained comparable tools: scanny/python-pptx itself, gitbrent/PptxGenJS

**Implication:** don't build the Compex skill as a dependency chain on archived repos. Vendor any patterns we borrow. Plan for python-pptx (or PptxGenJS) + our own thin layer as the ONLY external dependency.

---

## What this means for the template + skill

### Template (built manually in PowerPoint, by you)
The template is the single source of visual truth. It contains:
- **Master slides** with Compex brand system applied (colors, typography, spacing from the style guide)
- **Layouts** — one per surviving recipe (see below), each with:
  - Pre-named placeholders (`title`, `body`, `accent`, etc.) following the placeholder contract
  - Pre-named `!!anchor` shapes where morph is intended
  - The morph transition already applied to the arrival slide of each pair
- **Reserved regions** for Power BI add-in with decorative frame treatment
- **Speaker notes templates** for PBI insertion steps and Live/Snapshot guidance

### Skill / plugin (code, generates content)
- Opens the template
- Clones the right layout per slide request
- Fills named placeholders via python-pptx
- Does NOT inject morph XML — the template already carries it
- Does NOT generate masters — user owns the design
- Handles speaker notes (PBI URL injection for powerbi recipes)

This flips our original approach: **template-first, content-fill second.** No more XML mucking.

---

## Revised recipe set (proposal)

### Keep (from original 6)
1. **cover** — brand, title, subtitle. No morph. One big hero slide.
2. **morph_zoom** — 2-3 slides, `!!hero` grows/shrinks between them. Default (object-level) morph.
3. **before_after** — two slides with paired `!!` anchors. Object-level morph.
4. **signal_word** — single slide, accent-colored word inside body text. No morph per se.
5. **process** — N slides, one step per slide, `!!step` morphs position/label.

### Replace powerbi_exec with TWO recipes
6a. **powerbi_live** — reserved region, speaker notes for Live mode setup + auto-refresh rate
6b. **powerbi_snapshot** — reserved region, speaker notes for Snapshot mode + license freedom for viewers

### Add (new, from morph doc)
7. **word_reveal** — typography morph using Effect Option = Words. Two slides with same text block, words rearranged or recolored between them.
8. **anagram** — character-level morph using Effect Option = Characters. Good for number transformations ("2026 → 2027") or dramatic word-to-word reveals.

### Consider cutting
- Nothing — all 5 original + 2 PBI variants + 2 new typography-morph recipes = 9 recipes. Reasonable.

---

## Next immediate step — Task 4

Lock two decisions:
1. **Placeholder naming contract** — what names every layout will expose so the skill can target them (`title`, `body_1`, `body_2`, `accent`, `caption`, `pbi_region`, etc.)
2. **Recipe survivors** — confirm or trim the 9-recipe list above for Compex voice

Task 4 is a decisions task, no fetches needed. Recommend we knock it out next.
