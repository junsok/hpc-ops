HeadNode 장애 발생 시 복구 절차

---

## 1. EC2 상태 확인
AWS 콘솔 또는 CLI에서 HeadNode 상태 확인
```bash
aws ec2 describe-instances --instance-ids <HEADNODE_ID>
```

또는 콘솔에서
EC2 → Instances → HeadNode

---

## 2. SSH 접속 확인
```bash
ssh ec2-user@<HEADNODE_IP>
```

접속 불가 시
- Security Group 확인
- Network ACL 확인
- Instance 상태 확인

---

## 3. Slurm Controller 상태 확인
```bash
systemctl status slurmctld
```

# Controller 응답 확인
```bash
scontrol ping

# 결과
Slurmctld(primary) is UP
```

## 4. Slurm 서비스 재시작
```bash
systemctl restart slurmctld
```

## 5. Node 상태 확인
```bash
sinfo

# 또는

scontrol show nodes
```

## 6. Job 상태 확인
```bash
squeue
```

## 7. 로그 확인
```bash
journalctl -u slurmctld

# 또는

/var/log/slurmctld.log
```




