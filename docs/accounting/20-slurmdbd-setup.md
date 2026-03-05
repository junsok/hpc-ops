# SlurmDBD Setup (Example)

SlurmDBD는 Slurm Accounting 정보를 DB에 저장하는 데몬입니다.

---

# slurmdbd.conf 생성

```bash
cat <<EOF > /etc/slurm/slurmdbd.conf
AuthType=auth/munge
DbdHost=<SLURMDBD_HOST>
DbdPort=<PORT>

SlurmUser=<SLURM_USER>

StorageType=accounting_storage/mysql
StorageHost=<DB_HOST>
StorageLoc=<SLURM_ACCOUNTING_DB>
StorageUser=<DB_USER>
StoragePass=<DB_PASSWORD>

LogFile=<LOG_PATH>
PidFile=<PID_PATH>
EOF
```

---

# Permission 설정

```bash
chown <SLURM_USER>:<SLURM_USER> /etc/slurm/slurmdbd.conf
chmod 600 /etc/slurm/slurmdbd.conf
```

---

# Start Service

```bash
systemctl enable slurmdbd
systemctl start slurmdbd
```

---

# Check Status

```bash
systemctl status slurmdbd
```
