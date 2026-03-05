# sacctmgr: QOS / Account / User Management

Slurm Accounting은 `sacctmgr` 명령어를 사용하여 관리합니다.

---

# Add QOS

```bash
sacctmgr -i add qos <QOS_NAME>
```

---

# Modify QOS

Priority

단위: 정수

```bash
sacctmgr -i modify qos <QOS_NAME> set Priority=<INT>
```

---

# Set Job Limits

예시 옵션

| Option               | Description  |
| -------------------- | ------------ |
| MaxJobsPerUser       | 유저당 실행 Job 수 |
| MaxSubmitJobsPerUser | 유저당 제출 Job 수 |
| MaxTRESPerJob        | Job당 GPU 제한  |

```bash
sacctmgr -i modify qos <QOS_NAME> \
set MaxJobsPerUser=<INT> \
MaxSubmitJobsPerUser=<INT> \
MaxTRESPerJob=gres/gpu=<GPU_COUNT>
```

---

# Create Account

```bash
sacctmgr -i add account <ACCOUNT_NAME>
```

---

# Set Default QOS

```bash
sacctmgr -i modify account <ACCOUNT_NAME> set DefaultQOS=<QOS_NAME>
```

---

# Add User

```bash
sacctmgr -i add user name=<USERNAME> account=<ACCOUNT_NAME>
```

---

# Verify

```bash
sacctmgr show qos
sacctmgr show account
sacctmgr show user
```
