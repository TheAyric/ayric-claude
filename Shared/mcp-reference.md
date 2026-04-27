# MCP Reference — Shared Configuration

Single source of truth for MCP server configuration used across projects. Update here, not in individual project CLAUDE.md files.

---

## Atlassian Rovo MCP (Compex)

- **Cloud ID:** `0ac67caa-2d48-43a8-a8e5-3a3b6e416b8a`
- **Confluence spaces:**
  - BIS (internal D&A team space): `479428659`
  - BIA (stakeholder-facing): `152207435`
- **Jira projects of interest:** `ROAD` (roadmap initiatives, incl. ROAD-525 FY27 D&A), `DA` (Data & Analytics epics/stories)

### Known quirks
- **`createConfluencePage` silent-fail:** the first call may silently fail. Retry the identical call once to resolve. Do not add logic hoping to detect the failure — just retry.
- **File attachments not supported:** the MCP does not support attachment uploads. Attachments must be done manually via drag-and-drop in the Confluence UI.
- **ADF vs markdown:** `responseContentFormat: "markdown"` gives cleaner text for most workflows; use `"adf"` only when preserving mentions / panels / Smart Links matters.

---

## Web content — use Claude for Chrome (NOT WebFetch, NOT MS Learn MCP)

**Status (2026-04-17):** Anthropic has closed the `WebFetch` tool and the Microsoft Learn MCP for personal/consumer accounts. Any CLAUDE.md instruction that says "fetch MS Learn" or "fetch from the web" should be read as **"open via Claude for Chrome"** unless the domain is reachable by another connected MCP.

**How to get web content now:**
1. **Claude for Chrome extension** (`mcp__Claude_in_Chrome__*`) — primary method for any URL. DOM-aware, handles docs sites cleanly.
2. **Dedicated MCP** — if a connected MCP covers the source (Atlassian for Confluence/Jira, Azure DevOps for repos), use it.
3. **Ask Ayric to paste content** — fallback if Chrome extension isn't connected in the current session.

**Do NOT** try `WebFetch`, `web_fetch`, or shell-based `curl`/`wget` to pull URLs. They're either blocked or disabled.

### Microsoft Learn specifically

Fabric / Power BI / DAX / TMDL / Purview docs still live at `learn.microsoft.com`. Open via Claude for Chrome before drafting policy, governance, or teaching content. Training-data knowledge goes stale within months on this stack — don't skip the lookup just because the MCP is gone.

---

## Azure DevOps MCP (Compex)

- **Known repos of interest:** `da.MSFabric.solution`, `da.business.pbi`
- **Known limitations:**
  - Code search is not enabled — don't rely on `search_code` for this org.
  - Commit keyword search is unreliable — treat results as a starting point, not authoritative.
- **Work items:** Jira is primary for Compex D&A; Azure DevOps work items are used in the Fabric/PBI solution repos.

---

## How to reference from a project CLAUDE.md

Use a one-liner like:

> **Atlassian Rovo MCP** — Confluence BIS space is primary for this project. Config and quirks: see `Shared/mcp-reference.md`.

Keep only project-specific context inline (e.g., "this project writes to BIS, not BIA"). Don't repeat the Cloud ID or the silent-fail quirk — link here.
