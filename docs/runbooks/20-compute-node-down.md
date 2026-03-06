Compute Node 장애 발생 시 복구 절차

---

## 1. Node 상태 확인
```bash
sinfo -N -l

# 또는

scontrol show nodes
```

## 2. 특정 노드 확인
```bash
scontrol show node <NODE_NAME>

# 상태 예
DOWN
DRAIN
NOT_RESPONDING

```
## 3. SSH 접속 확인
```bash
ssh <NODE_NAME>
```
접속 불가 시

- instance 상태 확인
- network 문제 확인

## 4. Slurmd 상태 확인
```bash
systemctl status slurmd
```

## 5. Slurmd 재시작
```bash
systemctl restart slurmd
```

## 6. Node Resume
```bash
scontrol update NodeName=<NODE_NAME> State=RESUME
```

## 7. Node 상태 재확인
```bash
sinfo
```
