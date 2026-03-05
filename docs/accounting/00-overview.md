# Slurm Accounting Overview (Example)

이 문서는 Slurm Accounting 환경 구성 절차를 정리한 예시 가이드입니다.

실제 환경 정보(노드명, 비밀번호, 정책 값 등)는 포함하지 않으며
모든 값은 `<PLACEHOLDER>` 형태로 작성됩니다.

---

# Architecture

Slurm Accounting 구성 요소

```
Compute Nodes
      │
      ▼
   slurmctld
      │
      ▼
    slurmdbd
      │
      ▼
    MariaDB
```

구성 요소 설명

| Component | Description               |
| --------- | ------------------------- |
| slurmctld | Slurm Controller          |
| slurmdbd  | Accounting daemon         |
| MariaDB   | Accounting database       |
| sacctmgr  | Accounting management CLI |

---

# Configuration Flow

Slurm Accounting 구성 순서

1. MariaDB 설치
2. SlurmDBD 설정
3. slurmdbd 서비스 실행
4. slurm.conf Accounting 설정
5. sacctmgr로 QOS / Account / User 등록
6. 검증 수행

---

# Important Notes

* 실제 비밀번호는 Git에 저장하지 않습니다.
* 실제 노드 이름은 `<NODE_NAME>` 형식으로 작성합니다.
* 정책 수치는 `<INT>` 형식으로 작성합니다.