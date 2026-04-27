# Morph cookbook — six recipes

Each recipe has a JSON shape, which slides it creates, and which anchor
names it uses. Anchors starting with `!!` are morph pairing targets.

## cover
Opening slide — full-bleed brand background, massive headline, quiet
subhead. Headline is `!!hero` so it can morph into the next slide.

```json
{
  "recipe": "cover",
  "headline": "Why churn is our 2026 story",
  "subhead": "Exec review — April 16, 2026"
}
```

## morph_zoom
Sequence of N frames (slides) that share the `!!hero` anchor. The hero
morphs between frames — great for "start wide → zoom in → resolve".

```json
{
  "recipe": "morph_zoom",
  "frames": [
    {"hero": "2%"},
    {"hero": "2%", "detail": "Our Q1 churn — lowest since 2023."},
    {"hero": "2%"}
  ]
}
```

## before_after
Two slides: "Before" (neutral) and "After" (accent-colored). The
headline is `!!hero` on both so the change is animated via morph.

```json
{
  "recipe": "before_after",
  "before": {"headline": "12% churn", "body": "Q4 2025"},
  "after":  {"headline": "2% churn",  "body": "Q1 2026 — new onboarding"}
}
```

## signal_word
One sentence. One word in the sentence is rendered in the accent
color + bold. Use for stat callouts, punchlines.

```json
{
  "recipe": "signal_word",
  "body": "Our churn dropped to 2% — the lowest since 2023.",
  "accent": "2%"
}
```

## process
One slide per step. Each step label uses the `!!step` anchor so the
label morphs between steps — feels like a camera panning along a
timeline.

```json
{
  "recipe": "process",
  "steps": ["Raw signal", "Root cause", "Fix", "Measure"]
}
```

## powerbi_exec
Reserved placeholder region for the Power BI add-in + a "Key insight"
callout on the right. Speaker notes carry the report URL and manual
insertion steps (PowerPoint's Power BI add-in requires a runtime sign
in; the skill prepares the slide, user inserts at present time).

```json
{
  "recipe": "powerbi_exec",
  "title": "Q1 churn by cohort",
  "insight": "New-onboarding cohort churns 6x less than legacy.",
  "pbi_url": "https://app.powerbi.com/reportEmbed?reportId=EXAMPLE"
}
```

## Morph mechanics reminder

PowerPoint morphs shapes that:
1. Share a name starting with `!!`
2. Appear on **consecutive** slides
3. The **destination** slide has a morph transition applied

The skill's `name_shape()` and `apply_morph()` handle all three.
