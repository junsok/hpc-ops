#!/usr/bin/env bash
set -euo pipefail

# EXAMPLE: Create Slurm service user/group
# - Replace placeholders before production
# - This script assumes systemd-based Linux

SLURM_USER="<SLURM_USER>"     # e.g. slurm
SLURM_GROUP="<SLURM_GROUP>"   # e.g. slurm

echo "[1/3] Create group (if not exists)"
getent group "${SLURM_GROUP}" >/dev/null 2>&1 || groupadd --system "${SLURM_GROUP}"

echo "[2/3] Create user (if not exists)"
id -u "${SLURM_USER}" >/dev/null 2>&1 || useradd \
  --system \
  --gid "${SLURM_GROUP}" \
  --home-dir "/var/lib/${SLURM_USER}" \
  --create-home \
  --shell /usr/sbin/nologin \
  "${SLURM_USER}"

echo "[3/3] Create directories (examples)"
mkdir -p <SLURM_ETC_DIR> <SLURM_LOG_DIR> <SLURM_RUN_DIR>
chown -R "${SLURM_USER}:${SLURM_GROUP}" <SLURM_LOG_DIR> <SLURM_RUN_DIR> || true

echo "DONE (example)."