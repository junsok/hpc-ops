#!/usr/bin/env bash
set -euo pipefail

# EXAMPLE: Generate slurmdbd.conf using placeholders
# Replace placeholders before production

OUT="${1:-./slurmdbd.conf}"

cat > "${OUT}" <<'EOF'
# slurmdbd.conf (EXAMPLE)
AuthType=auth/munge

DbdHost=<SLURMDBD_HOST>
DbdPort=<PORT>

SlurmUser=<SLURM_USER>

StorageType=accounting_storage/mysql
StorageHost=<DB_HOST>
StorageLoc=<DB_NAME>
StorageUser=<DB_USER>
StoragePass=<DB_PASSWORD>

LogFile=<LOG_PATH>
PidFile=<PID_PATH>
EOF

echo "Generated: ${OUT}"
echo "Next (example):"
echo "  chown <SLURM_USER>:<SLURM_GROUP> ${OUT}"
echo "  chmod 600 ${OUT}"