# View and Present Live Power BI Data in PowerPoint — Microsoft Learn

Source: https://learn.microsoft.com/en-us/power-bi/collaborate-share/office-integration/service-power-bi-powerpoint-add-in-view-present
Fetched: 2026-04-17 via Claude in Chrome

## Interactivity
- Embedded report/visual is **fully interactive** in both Edit and Slideshow modes (unless frozen as static image)
- Left-nav pane from PBI service is NOT included
- Page navigation visuals inside the report still work

## Two data modes
- **Live data** — pulls latest from PBI service, interactive, requires viewer to have PBI access
- **Snapshot** — static image, works offline, viewable by anyone who opens the deck

### Switching modes
- View menu → Live data / Snapshot
- **Snapshot requires Office 2312+ (Build 17126+)** — older versions can only do Save as image
- Can only switch modes in desktop PowerPoint; web version honors the last desktop-side choice

## Auto-refresh in slideshow
- Add-in options → Slide show settings → check "Automatic refresh in slide show"
- Set frequency as desired
- Only fires in slideshow mode, not during edit
- Requires minimum Office version (not specified here)

## Styling
- Only supported style currently: **Outline** (border around add-in)
- Configure via Style options → Outline → color, width, style, transparency

## Data-point annotations
Preview feature — add contextual callouts to specific data points that persist across slides.

## Sharing requirements for viewers
- PBI account with Microsoft Fabric free license
- Access to the underlying data (RLS, workspace membership)
- If report is **not** in Premium capacity / Fabric F64+, viewers also need **Pro license**

## Implications for Compex template
- For Live mode: need slideshow-time refresh rate in speaker notes per PBI slide
- For Snapshot mode: still need the placeholder region, but snapshot image can be pasted directly as a picture — no add-in required to view
- Build a **Decision slide** into template notes: "Live or Snapshot?" with the prerequisite checklist
- Styling options are limited → design the slide frame around the add-in region, not inside it
- If adoption is broad, Snapshot is the safer default (no license dependency for viewers)
