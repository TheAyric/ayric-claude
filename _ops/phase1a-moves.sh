#!/usr/bin/env bash
# Phase 1A Mechanical Moves — ayric-claude repo merge
# Generated 2026-04-26 from Cowork session handoff
#
# RUN FROM: root of ayric-claude (where Claude_old subdirs live: Shared/, Compex/, etc.)
# REQUIRES: git bash or any POSIX shell on a path with git installed
#
# RULES:
# - Never delete. git mv preserves history.
# - DO NOT touch Compex-ReportDev-Audit/ (parked)
# - Skip Skills/ (empty) and "Compex Data & Analytics Project Memory.md" (defer to Phase 2/3)
# - Team-roster diff is surfaced at the end for HUMAN review — no auto-merge

set -u  # treat unset vars as errors; do NOT use -e so one missing file doesn't halt

# ----- sanity checks -----
if ! git rev-parse --git-dir > /dev/null 2>&1; then
  echo "ERROR: not in a git repo. cd to ayric-claude first."
  exit 1
fi

echo "=== Phase 1A: Mechanical Moves ==="
echo "Repo: $(git rev-parse --show-toplevel)"
echo

# ----- create target directories -----
mkdir -p config/shared
mkdir -p config/compex/brand
mkdir -p _ops/interviews
mkdir -p .agents/skills
mkdir -p raw/references
mkdir -p raw/internal/chat-exports/ayric-business
mkdir -p raw/internal/chat-exports/learning-mba
mkdir -p raw/internal/chat-exports/korry-pbi-audit
mkdir -p raw/internal/chat-exports/learning-fabric-ai
mkdir -p raw/internal/chat-exports/compex-bi-training
mkdir -p raw/internal/chat-exports/compex-coe

# ----- helper: safe git mv -----
moved=0
skipped=0
failed=0

safe_gitmv() {
  local src="$1"
  local dst="$2"
  if [ -e "$src" ]; then
    if git mv "$src" "$dst" 2>/dev/null; then
      echo "MOVED:   $src -> $dst"
      moved=$((moved+1))
    else
      # Fallback: file is untracked -> use plain mv
      if mv "$src" "$dst" 2>/dev/null; then
        echo "MOVED*:  $src -> $dst   (untracked, plain mv)"
        moved=$((moved+1))
      else
        echo "FAILED:  $src -> $dst"
        failed=$((failed+1))
      fi
    fi
  else
    echo "SKIP:    $src   (not found)"
    skipped=$((skipped+1))
  fi
}

# ============================================================
# A. Direct file moves
# ============================================================
echo "--- A. Direct file moves ---"

safe_gitmv "Shared/voice-and-style.md"            "config/shared/voice.md"
safe_gitmv "Shared/claude-allowlist-domains.md"   "config/shared/allowlist-domains.md"
safe_gitmv "Shared/start-here.md"                 "config/shared/start-here.md"
safe_gitmv "Shared/solo-context.md"               "config/shared/solo-context.md"
safe_gitmv "Shared/template-contract.md"          "config/shared/template-contract.md"
safe_gitmv "Shared/compex-brand.md"               "config/compex/brand/compex-brand.md"
safe_gitmv "Shared/compex-pptx-style-guide.md"    "config/compex/brand/compex-pptx-style-guide.md"
safe_gitmv "Voice-and-Style Interview Prompt.md"  "_ops/interviews/voice-and-style.md"
safe_gitmv "Guide to Configuring Claude Cowork.md" "_ops/interviews/cowork-config-guide.md"
safe_gitmv "dynamic-pptx-designer"                ".agents/skills/dynamic-pptx-designer"

# raw/references batch
safe_gitmv "Shared/cowork-egress-investigation.md" "raw/references/cowork-egress-investigation.md"
safe_gitmv "Shared/reevaluation-2026-04-17.md"     "raw/references/reevaluation-2026-04-17.md"

# Shared/archive/ - move every file inside
if [ -d "Shared/archive" ]; then
  echo "(Shared/archive/ contents):"
  for f in Shared/archive/*; do
    [ -e "$f" ] && safe_gitmv "$f" "raw/references/$(basename "$f")"
  done
  rmdir Shared/archive 2>/dev/null && echo "REMOVED empty dir: Shared/archive"
fi

# Shared/sources/ - move every file inside
if [ -d "Shared/sources" ]; then
  echo "(Shared/sources/ contents):"
  for f in Shared/sources/*; do
    [ -e "$f" ] && safe_gitmv "$f" "raw/references/$(basename "$f")"
  done
  rmdir Shared/sources 2>/dev/null && echo "REMOVED empty dir: Shared/sources"
fi

# Try to remove empty Shared/ if everything moved out
rmdir Shared 2>/dev/null && echo "REMOVED empty dir: Shared"

# ============================================================
# B. History -> chat-exports
# ============================================================
echo
echo "--- B. History -> chat-exports ---"

move_history_dir() {
  local src_dir="$1"
  local dst_dir="$2"
  if [ -d "$src_dir" ]; then
    for f in "$src_dir"/*; do
      [ -e "$f" ] && safe_gitmv "$f" "$dst_dir/$(basename "$f")"
    done
    rmdir "$src_dir" 2>/dev/null && echo "REMOVED empty dir: $src_dir"
  else
    echo "SKIP:    $src_dir   (not found)"
  fi
}

move_history_dir "Ayric-Business/History"             "raw/internal/chat-exports/ayric-business"
move_history_dir "Ayric-Learning-MBA/History"          "raw/internal/chat-exports/learning-mba"
move_history_dir "Korry-PBI-Audit-and-Improvement/History" "raw/internal/chat-exports/korry-pbi-audit"

# Ayric-Learning-Fabric-AI: chat_*.md at folder root (not in History/)
if [ -d "Ayric-Learning-Fabric-AI" ]; then
  for f in Ayric-Learning-Fabric-AI/chat_*.md; do
    [ -e "$f" ] && safe_gitmv "$f" "raw/internal/chat-exports/learning-fabric-ai/$(basename "$f")"
  done
fi

safe_gitmv "Compex-BI-Training/Claude Project - Power BI End User Training.md" \
           "raw/internal/chat-exports/compex-bi-training/Claude Project - Power BI End User Training.md"
safe_gitmv "Compex-COE/Claude Project - Leadership Coach.md" \
           "raw/internal/chat-exports/compex-coe/Claude Project - Leadership Coach.md"

# ============================================================
# Summary
# ============================================================
echo
echo "=== Phase 1A complete ==="
echo "Moved:   $moved"
echo "Skipped: $skipped"
echo "Failed:  $failed"
echo

# ============================================================
# Team-roster diff (#5) — manual review, no auto-merge
# ============================================================
echo "--- Team-roster diff (#5) — manual review, NO auto-merge ---"
if [ -f "Compex/team-roster.md" ] && [ -f "config/compex/team.md" ]; then
  echo
  diff -u "Compex/team-roster.md" "config/compex/team.md" || true
  echo
  echo "^^^ Review the diff above. Decide what to keep in each file by hand."
elif [ -f "Compex/team-roster.md" ]; then
  echo "Compex/team-roster.md exists; config/compex/team.md does NOT."
  echo "Decide: move team-roster -> team.md, or keep separate."
elif [ -f "config/compex/team.md" ]; then
  echo "config/compex/team.md exists; Compex/team-roster.md does NOT."
  echo "Nothing to merge."
else
  echo "Neither file exists. Skip."
fi

echo
echo "--- PARKED (NOT processed by this script) ---"
echo "  - Compex-ReportDev-Audit/  (parked, do not touch)"
echo "  - Skills/                  (empty in old repo)"
echo "  - Compex Data & Analytics Project Memory.md  (defer to Phase 2/3)"
echo
echo "NEXT STEPS:"
echo "  1. Run: git status     (review staged moves)"
echo "  2. Resolve team-roster diff manually"
echo "  3. Commit when satisfied"
echo "  4. Resume in a fresh Cowork session with the handoff packet"
