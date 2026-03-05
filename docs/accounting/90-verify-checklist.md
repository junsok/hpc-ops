# Slurm Accounting Verification Checklist

Accounting 설정 후 정상 동작 여부 확인

---

# slurmdbd 상태

```bash
systemctl status slurmdbd
```

---

# Database 연결 확인

```bash
sacctmgr show cluster
```

---

# QOS 확인

```bash
sacctmgr show qos
```

---

# Account 확인

```bash
sacctmgr show account
```

---

# User 확인

```bash
sacctmgr show user
```

---

# Job Accounting 확인

```bash
sacct
```

---

# Troubleshooting

확인 항목

* slurmdbd 서비스 상태
* MariaDB 실행 여부
* munge 서비스 상태
* slurm.conf Accounting 설정