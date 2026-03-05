#!/usr/bin/env bash
set -euo pipefail

# Example: Restore using filelist
# Usage:
#   ./40-hsm-restore-filelist.sh.example <FILELIST_TXT>

FILELIST="${1:-<FILELIST_TXT>}"

while IFS= read -r f; do
  [[ -z "${f}" ]] && continue
  lfs hsm_restore "${f}"
done < "${FILELIST}"