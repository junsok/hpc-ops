# Slurm Commands

Slurm 운영 시 자주 사용하는 명령어 모음입니다.

---

## 1. Partition / Node 상태 확인

```bash
sinfo
```

-> 출력 예시
```bash
PARTITION AVAIL TIMELIMIT NODES STATE NODELIST
compute*  up    infinite   10   idle  node[01-10]
```

## 2. Job 상태 확인
```bash
squeue
```

-> 특정 사용자 Job 조회
```bash
squeue -u <USER>
```

## 3. Job 상세 정보 확인
```bash
scontrol show job <JOB_ID>
```

## 4. Node 상태 확인
```bash
scontrol show nodes
```

-> 특정 필드만 확인
```bash
scontrol show nodes | grep -E "NodeName|State|CfgTRES"
```

## 5. Job 취소

```bash
scancel <JOB_ID>
```

-> 특정 사용자 Job 취소
```bash
scancel -u <USER>
```

## 6. Slurm 로그 확인
```bash
journalctl -u slurmctld
journalctl -u slurmd
```

## 7. Slurm compute node daemon 확인
```bash
systemctl status slurmd
```

## 8. Job 제출 테스트
```bash
sbatch test.sh
```

-> test.sh 예시
```bash
#!/bin/bash
hostname
sleep 30
```