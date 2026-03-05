# Runbook: All Nodes Down

전체 노드가 DOWN 상태일 때 조치 절차

---

# Check Controller

```bash
systemctl status slurmctld
```

---

# Restart Services

```bash
systemctl restart slurmctld
systemctl restart slurmd
```

---

# Verify Nodes

```bash
sinfo
```
