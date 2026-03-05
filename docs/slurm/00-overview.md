# Slurm Overview

Slurm(Simple Linux Utility for Resource Management)은 HPC 환경에서 사용되는 작업 스케줄러입니다.

주요 기능

- Job Scheduling
- Resource Allocation
- Cluster Resource Management

---

## Slurm 주요 구성 요소

### slurmctld

Cluster 전체를 관리하는 controller daemon

### slurmd

각 compute node에서 실행되는 daemon

### slurmdbd

Slurm accounting 정보를 저장하는 daemon

---

## 주요 명령어

| 명령어 | 설명 |
|------|------|
| sinfo | 노드 및 파티션 상태 |
| squeue | 실행 중 Job 확인 |
| scontrol | Slurm 상태 제어 |
| sacct | Job accounting 조회 |
| scancel | Job 취소 |

---

## 문서 구성

| 문서 | 설명 |
|-----|-----|
| 10-slurm-commands.md | 기본 Slurm 명령어 |
| 20-partitions-qos.md | Partition / QoS 설정 |
| 30-job-debugging.md | Job 문제 디버깅 |
| 90-slurm-verify-checklist.md | Slurm 상태 점검 |