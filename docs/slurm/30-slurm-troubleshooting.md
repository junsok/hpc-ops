# Slurm Troubleshooting Guide

이 문서는 Slurm 클러스터 운영 중 발생할 수 있는 주요 문제와 해결 방법을 정리한 문서이다.

---

# 1. Slurm Controller 상태 확인
HeadNode에서 Slurm Controller 상태 확인

```bash
systemctl status slurmctld
```

## 2. Controller 응답 확인
```bash
scontrol ping

# 정상 통신 결과 예시
Slurmctld(primary) at <hostname> is UP

# 문제발생 시
Slurmctld(primary) at <hostname> is DOWN
```

# 조치 진행
```bash
systemctl restart slurmctld
```

## 3. Node 상태 이상 (Down/DRAIN)

# 노드 상태 확인
```bash
sinfo -N -l
```

# 특정 노드 상세 확인
```bash
scontrol show node <NODE_NAME>
```

# 주요 상태
| 상태    | 의미            |
| ----- | ------------- |
| idle  | 사용 가능         |
| idle~ | suspend 상태    |
| alloc | Job 실행 중      |
| down  | 노드 장애         |
| drain | 관리자에 의해 사용 중지 |

# 노드 복구
```bash
scontrol update NodeName=<NODE_NAME> State=RESUME
```

## 4. Job Pending 문제

# Job 상태확인
```bash
squeue
```

# Pending 이유 확인
```bash
squeue -o "%.18i %.9P %.8j %.8u %.2t %.10M %.6D %R"
```

# 대표적인 Pending 원인
| Reason                | 의미                |
| --------------------- | ----------------- |
| Resources             | 리소스 부족            |
| Priority              | 우선순위 대기           |
| ReqNodeNotAvail       | 요청 노드 unavailable |
| QOSMaxCpuPerUserLimit | QOS 제한            |

## 5. 대량 Node Job 제출 시 Scheduler 문제

# 현상
대량 Node 사용 Job 제출 시 Job 실행 지연 발생

# 사례 예시
```bash
sbatch --nodes=70 job.sh
```

# 가능 원인
Scheduler cycle delay
Node provisioning delay
AWS instance launch delay

# 잡 확인
```bash
scontrol show job <JOB_ID>
```

# Slurm Scheduler Diagnostic
Slurm 스케줄러가 얼마나 바쁘고 정상적으로 돌아가는지 확인하는 진단 명령어
```bash
sdiag
```

# 체크 포인트
Scheduler cycle 시간
Job scheduling 통계
RPC 통계
Backfill 상태
Slurm controller load 

# 사용 사례
Job이 오래 pending 된다
Scheduler 느리다
slurmctld CPU 높다
Cluster job throughput 확인
RPC overload 확인

## 6. Dynamic Node 생성 실패
ParallelCluster 환경에서 Dynamic Node 생성 실패 발생 가능

# 현상
```bash
job pending (Resources)
```

# Node 상태 확인
```bash
sinfo
```

# 확인 사항
AWS instance quota
instance capacity
subnet IP 부족

# Parallelcluster Log 확인
```bash
/var/log/parallelcluster/slurm_resume.log
```

또는

```bash
/var/log/slurm_resume.log
```

## 7. Slurm Accounting 미구성

# 현상
```bash
sacct command not available
```

# 원인 
Slurm Accounting 설정 미구성


# 확인
```bash
systemctl status slurmdbd
```

# Cluster 등록 확인
```bash
sacctmgr list cluster
```

# Account 확인
```bash
sacctmgr list account
```

## 8. Slurm Log 확인

# HeadNode
```bash
/var/log/slurmctld.log
```

# Compute Node
```bash
/var/log/slurmd.log
```

# 실시간 로그
```bash
journalctl -u slurmctld -f
journalctl -u slurmd -f
```

## 9. GPU Resource 인식 문제

# GPU 확인
```bash
nvidia-smi
```

# Slurm GPU 설정 확인
```bash
scontrol show nodes | grep Gres

# 출력 예시
Gres=gpu:4
```

## 10. MPI / EFA 문제
MPI 실행 시 성능 문제 또는 오류 발생 가능

# 확인
```bash
fi_info -p efa
```

# EFA 테스트
```bash
fi_pingpong -p efa
```

# MPI 실행 테스트
```bash
mpirun -np 2 hostname
```

## 11. Slurm Configuration 확인
현재 설정 확인
```bash
scontrol show config
```

# Partition 확인
```bash
scontrol show partition
```

## 12. AWS Instance Capacity 부족

# 현상
- Dynamic node 생성 실패
```bash
job pending (Resources)
```
# 확인
```bash
pcluster describe-cluster

# 또는

aws ec2 describe-instance-type-offerings
```

# 해결 방안
AZ 변경
quota 증가 요청

## 13. FSx Lustre Performance Issue

# 현상
Job은 정상 실행되지만 속도가 느림

# 확인
```bash
lfs df -h
lfs df -i

lctl get_param obdfilter.*.stats
```

# 가능 원인
OST imbalance
metadata bottleneck
striping 문제

## 14. Dynamic Node 에서 Slurm Node Suspend 오래걸림

# 현상
```bash
# Node 상태
idle~
```

# 원인
설정 문제
```bash
SuspendTime
SuspendProgram
```

# 확인
```bash
scontrol show config | grep Suspend
```