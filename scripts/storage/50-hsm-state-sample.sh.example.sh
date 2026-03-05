#!/usr/bin/env bash
set -euo pipefail

# Example: Check HSM state for a sample file
# Usage:
#   ./50-hsm-state-sample.sh.example <SAMPLE_FILE>

SAMPLE_FILE="${1:-<SAMPLE_FILE>}"

lfs hsm_state "${SAMPLE_FILE}"