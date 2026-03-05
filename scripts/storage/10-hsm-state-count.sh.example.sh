#!/usr/bin/env bash
set -euo pipefail

# Example: Count HSM states under a directory
# Usage:
#   ./10-hsm-state-count.sh.example <TARGET_DIR> <OUTPUT_LOG>

TARGET_DIR="${1:-<TARGET_DIR>}"
OUT="${2:-<OUTPUT_LOG_FILE>}"     # e.g. /fsx/etc_fsx/hsm_state_check.log
XARGS_N="${3:-500}"

find "${TARGET_DIR}" -type f -print0 \
| xargs -0 -n "${XARGS_N}" lfs hsm_state 2>/dev/null \
| awk '
{for(i=1;i<=NF;i++) if($i=="exists"||$i=="archived"||$i=="released"||$i=="dirty") c[$i]++}
END{for(k in c) printf "%-9s %d\n", k, c[k]}' | sort | tee "${OUT}"