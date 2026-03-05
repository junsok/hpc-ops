#!/usr/bin/env bash
set -euo pipefail

# Example: Archive using filelist
# Usage:
#   ./20-hsm-archive-filelist.sh.example <FILELIST_TXT>

FILELIST="${1:-<FILELIST_TXT>}"

while IFS= read -r f; do
  [[ -z "${f}" ]] && continue
  lfs hsm_archive "${f}"
done < "${FILELIST}"