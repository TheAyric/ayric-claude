# Cowork Egress Investigation — Context for Fresh Claude Chat

## What's happening
Working inside Claude Desktop Cowork mode. WebFetch tool is returning `EGRESS_BLOCKED` for microsoft.com and other mainstream docs sites, even after I (the user) added them to what I believed was Claude Desktop's network allowlist.

## Exact error
```
{"error_type":"EGRESS_BLOCKED","domain":"support.microsoft.com","message":"Access to support.microsoft.com is blocked by the network egress proxy."}
```

Same for `docs.aspose.com`.

## Domains I tried to add to allowlist
- support.microsoft.com
- learn.microsoft.com
- docs.aspose.com
- tutorials.aspose.com
- www.slidesbysander.com
- raw.githubusercontent.com
- gramener.com

## What the agent said
The agent suggested two possibilities:
1. The Cowork sandbox has a separate egress policy from the main Claude Desktop browser context, so user-facing allowlist changes don't affect what the sandboxed session can fetch.
2. The setting I toggled is for a different purpose (e.g., navigation permissions for Claude in Chrome extension, not Cowork sandbox web fetches).

## What I want investigated
1. In **Claude Desktop**, where is the actual setting that controls what domains a **Cowork** session's sandbox can fetch via the `WebFetch` tool? Is that separate from "Claude in Chrome" navigation permissions?
2. Is there even a user-accessible setting for Cowork egress, or is that controlled at the org/account level?
3. Why would support.microsoft.com / docs.aspose.com specifically be on a default blocklist? That's unusual.
4. Is there a Claude Desktop setting panel I missed? (I added domains somewhere — where did I add them, and what do they actually control?)

## Reference
- User account: personal (not Team/Enterprise as far as I know)
- Session: Cowork mode
- OS: Windows 11 (ASUS ProArt PX13)
- Selected folder for this session: ~/.Obsidian
- Model: claude-opus-4-7

## What good answer looks like
Either:
- "The setting you're looking for is at [specific path], and it will unblock Cowork WebFetch."
- "Cowork egress is policy-controlled and users can't override it; here's the workaround."
- "You added domains to the wrong setting; the one you toggled actually controls X."
