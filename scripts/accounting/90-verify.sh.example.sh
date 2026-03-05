#!/usr/bin/env bash
set -euo pipefail

# EXAMPLE: Verification checklist for Slurm Accounting

echo "== Service status (examples) =="
systemctl status munge --no-pager || true
systemctl status mariadb --no-pager || true
systemctl status slurmdbd --no-pager || true
systemctl status slurmctld --no-pager || true

echo
echo "== Accounting connectivity (examples) =="
sacctmgr show cluster || true

echo
echo "== QOS / Account / User (examples) =="
sacctmgr show qos format=Name,Priority,MaxJobsPU,MaxSubmitPU,MaxTRES || true
sacctmgr show account format=Account,Description,DefaultQOS || true
sacctmgr show user format=User,Account,DefaultQOS || true

echo
echo "== Scheduler quick checks (examples) =="
sinfo || true
squeue || true

echo
echo "DONE (example)."