# 10-mount-options.conf.example
# Example only. Replace placeholders before production.

FSX_DNS="<FSX_DNS_NAME>"          # e.g. fs-xxxx.fsx.<region>.amazonaws.com
MOUNT_POINT="<MOUNT_POINT>"       # e.g. /fsx

# Mount type is always lustre for FSx for Lustre client
FSTYPE="lustre"

# Optional mount options (example)
MOUNT_OPTS="<MOUNT_OPTIONS>"      # e.g. noatime,flock