#!/usr/bin/env bash
set -euo pipefail

# Example: Release using filelist
# Usage:
#   ./30-hsm-release-filelist.sh.example <FILELIST_TXT>

FILELIST="${1:-<FILELIST_TXT>}"

while IFS= read -r f; do
  [[ -z "${f}" ]] && continue
  lfs hsm_release "${f}"
done < "${FILELIST}"