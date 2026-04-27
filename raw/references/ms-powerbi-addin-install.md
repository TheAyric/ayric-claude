# Add live Power BI data to PowerPoint — Microsoft Learn

Source: https://learn.microsoft.com/en-us/power-bi/collaborate-share/office-integration/service-power-bi-powerpoint-add-in-install
Fetched: 2026-04-17 via Claude in Chrome

## What the add-in does
Lets you embed **live** Power BI report pages or individual visuals inside PowerPoint slides. Data stays live — not exported. Any filter/selection state persists across presentation sessions.

## Three insertion paths

### 1. Create new presentation from PBI service
From a report or visual in the PBI service:
- Select Share (if report) or More options → Share (if visual)
- Set access, check "Include my changes" to embed current state
- Choose Apply → Open in PowerPoint → new deck opens with add-in pre-loaded

Alternative: Export → PowerPoint → "Embed live data" → Open in PowerPoint. (The "Export" UI is misleading — nothing is actually exported; data stays in PBI.)

### 2. Add to existing presentation
- Insert → Get Add-ins → search "Microsoft Power BI" → Add
- Paste a report/visual URL, or let add-in suggest content from slide title
- Add-in converts direct link → shareable link automatically

### 3. Direct URL (three sources)
- From Share dialog (use this for reliable multi-viewer access)
- From Export dialog
- From browser address bar (viewer permissions vary)

## Prerequisites
- Same work account signed into **both** Power BI and PowerPoint add-ins
- WebView2 installed (add-in depends on it; "Cannot run Power BI" error = missing WebView2)
- Admin-managed add-ins appear in a separate ribbon

## Notes / gotchas
- "Open in PowerPoint" and "Export" options **not available in national/regional clouds**
- For best cross-viewer reliability, use **Share method** — guarantees all viewers can see the report
- Data is NEVER embedded in the pptx file itself; it remains in PBI

## Implications for Compex template
- `recipe_powerbi_exec` layout needs a **reserved rectangular region** where users will drop the add-in manually
- Speaker-notes should carry the PBI URL for user to paste
- Region should be sized to common report page ratios (our current 16:9 with 9:5 embed region is reasonable)
- Template should include a brief note slide or speaker-note block explaining the "Insert → Add-ins → Power BI → paste URL" flow
