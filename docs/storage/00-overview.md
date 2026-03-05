# Lustre Storage Overview

이 디렉토리는 Lustre filesystem 운영과 관련된 문서를 정리합니다.

Lustre는 HPC 환경에서 대규모 병렬 I/O를 처리하기 위해 사용되는 분산 파일 시스템입니다.  
AWS 환경에서는 주로 **FSx for Lustre** 형태로 사용됩니다.

---

## Lustre 주요 구성 요소

### MDS (Metadata Server)
파일 메타데이터를 관리합니다.

### MDT (Metadata Target)
파일 이름, 권한, 디렉토리 구조 등 메타데이터 저장 영역입니다.

### OSS (Object Storage Server)
실제 데이터를 저장하는 서버입니다.

### OST (Object Storage Target)
파일 데이터가 저장되는 스토리지 영역입니다.

---

## HSM (Hierarchical Storage Management)

Lustre HSM은 파일을 외부 스토리지(S3 등)에 아카이브하고 필요 시 복구하는 기능입니다.

주요 작업 흐름

1. Archive
2. Release
3. Restore

---

## 문서 구성

| 문서 | 설명 |
|-----|-----|
| 10-lustre-commands.md | Lustre 기본 명령어 |
| 20-hsm-commands.md | HSM 관련 명령어 |
| 30-hsm-batch-automation.md | HSM batch 작업 |
| 90-storage-verify-checklist.md | 스토리지 점검 체크리스트 |