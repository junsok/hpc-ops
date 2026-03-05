#!/usr/bin/env bash
set -euo pipefail

# EXAMPLE: Register Accounts and Users via sacctmgr
# - Placeholders only
# - Customize account hierarchy to your environment

ACCOUNT_NAME="<ACCOUNT_NAME>"     # e.g. research / teamA
DEFAULT_QOS="<QOS_NAME>"
USERNAME="<USERNAME>"

echo "[1/4] Add account (ignore if exists)"
sacctmgr -i add account "${ACCOUNT_NAME}" Description="<DESC>" || true

echo "[2/4] Set default QOS for account (example)"
sacctmgr -i modify account "${ACCOUNT_NAME}" set DefaultQOS="${DEFAULT_QOS}"

echo "[3/4] Add user (ignore if exists)"
sacctmgr -i add user name="${USERNAME}" account="${ACCOUNT_NAME}" || true

echo "[4/4] Optional: set user's default QOS (example)"
sacctmgr -i modify user name="${USERNAME}" set DefaultQOS="${DEFAULT_QOS}" || true

echo "DONE (example)."