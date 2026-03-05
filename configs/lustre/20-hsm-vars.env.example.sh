# 20-hsm-vars.env.example
# Example only. Do not commit secrets. Use placeholders.

# Target paths
TARGET_DIR="<TARGET_DIR>"                 # e.g. /fsx/Backup
FILELIST_TXT="<FILELIST_TXT>"             # e.g. /fsx/etc_fsx/filelist.txt

# Logging
LOG_DIR="<LOG_DIR>"                       # e.g. /fsx/etc_fsx
STATE_LOG="<STATE_LOG>"                   # e.g. /fsx/etc_fsx/hsm_state_check.log

# xargs batch size
XARGS_N="<XARGS_N>"                       # e.g. 500