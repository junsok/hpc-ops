# Runbook: HeadNode Down Recovery

HeadNode 장애 발생 시 복구 절차

---

# Check Controller

```bash
systemctl status slurmctld
```

---

# Restart Controller

```bash
systemctl restart slurmctld
```

---

# Verify Cluster

```bash
sinfo
```

---

# Verify Jobs

```bash
squeue
```
