# Runbook: Compute Node Down

Compute Node 장애 발생 시 조치 절차

---

# Node Status 확인

```bash
sinfo -N
```

---

# Node 상태 확인

```bash
scontrol show node <NODE_NAME>
```

---

# Node Resume

```bash
scontrol update NodeName=<NODE_NAME> State=RESUME
```
