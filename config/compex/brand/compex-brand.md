# Compex Brand Reference

Single source of truth for Compex visual brand elements used in Claude-generated deliverables. Update here, not in individual project CLAUDE.md files.

---

## Slide template (REQUIRED starting point for all Compex decks)

**File:** `Shared/compex-slide-template.pptx`

When creating any Compex-branded .pptx, you MUST open this template as the starting file and edit existing slides, NOT generate a new deck from scratch with pptxgenjs. Generating from scratch bypasses Compex master slides, fonts, and layouts — Ayric has flagged this as a recurring failure mode.

**Workflow:** follow the pptx skill's `editing.md` path (unpack template → manipulate slides → edit content → clean → pack), not `pptxgenjs.md`.

**If the template is missing or unreadable:** stop and ask Ayric before falling back to from-scratch generation.

---

## Primary colors

| Role | Hex | Notes |
|---|---|---|
| Primary (navy) | `#041B45` | Headings, primary accents, dark backgrounds |
| Secondary (teal) | `#00A2D5` | Links, highlights, secondary accents |
| Neutral background (cream) | `#FAF7EE` | Light backgrounds, slide backdrops, body canvas |

## Typography

Default to system-safe sans-serif (Segoe UI, Calibri, or Arial) unless a specific deck template is provided. Body text in dark-navy-on-cream for published documents.

## Where this applies

- PowerPoint decks (`pptx`) — Compex-branded leadership reviews, training decks, rollout decks
- Word documents (`docx`) — when a stakeholder-facing doc needs Compex color accents (sparingly)
- Dashboards and report themes — DO NOT apply directly; Power BI theme files follow a separate, longer spec (see `Compex-BI/` for the theme authoring pattern)

## Where this does NOT apply

- Ayric Intelligence consulting deliverables (Korry, other client work) — use Ayric Intelligence branding, not Compex
- Personal / MBA / Learning content — no brand styling
- Internal working drafts — skip brand styling until the doc is stakeholder-ready

---

## How to reference from a project CLAUDE.md

Use a one-liner like:

> `pptx` — Compex template **required**: `Shared/compex-slide-template.pptx`. Brand details: `Shared/compex-brand.md`.

Don't inline the hex codes in project briefs anymore.
