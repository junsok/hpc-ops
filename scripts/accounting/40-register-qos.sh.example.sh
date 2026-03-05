#!/usr/bin/env bash
set -euo pipefail

# EXAMPLE: Register QOS via sacctmgr
# - Requires: slurmdbd running + slurmctld accounting configured
# - Uses placeholders only

QOS_NAME="<QOS_NAME>"

# Examples of tunables:
# Priority: relative integer (dimensionless)
# MaxJobsPerUser / MaxSubmitJobsPerUser: integers
# GPU limits: MaxTRESPerJob=gres/gpu=<N>
#
# NOTE: Adjust list to match your policy.

echo "[1/2] Add QOS (ignore if exists)"
sacctmgr -i add qos "${QOS_NAME}" || true

echo "[2/2] Modify QOS (example options)"
sacctmgr -i modify qos "${QOS_NAME}" set \
  Priority=<INT> \
  MaxJobsPerUser=<INT> \
  MaxSubmitJobsPerUser=<INT> \
  MaxTRESPerJob=gres/gpu=<GPU_COUNT>

echo "DONE (example)."