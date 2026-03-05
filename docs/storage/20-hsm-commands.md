# Lustre HSM Commands

Lustre HSM(Hierarchical Storage Management)은
파일을 외부 스토리지(S3, tape 등)에 아카이브하고
필요 시 복구하는 기능입니다.

이 문서는 Lustre HSM 관련 기본 명령어를 정리합니다.

```bash
lfs hsm_state <FILE_OR_DIR>
```

# 가능한 상태 예시
exists
→ 파일이 Lustre에 존재

archived
→ backend storage에 archive 완료

released
→ Lustre에서 제거되고 backend에만 존재

dirty
→ 파일 수정되어 archive와 불일치

# Archive 요청
```bash
lfs hsm_archive <FILE_OR_DIR>
```
→ 파일을 backend storage로 아카이브합니다.

# Release 요청
```bash
lfs hsm_release <FILE_OR_DIR>
```
→ Lustre에서 파일을 제거하고 backend storage만 유지합니다.

# Restore 요청
```bash
lfs hsm_restore <FILE_OR_DIR>
```
→ backend storage에서 Lustre로 파일을 복구합니다.

# HSM Action 확인
```bash
lfs hsm_action <FILE_OR_DIR>
```
→ 현재 진행 중인 HSM 작업을 확인합니다.

# Cancel 요청
```bash
lfs hsm_cancel <FILE_OR_DIR>
```
→ 진행 중인 HSM 작업을 취소합니다.

# 상태 확인 테스트
```bash
lfs hsm_state <SAMPLE_FILE>
```

# Archive 테스트
```bash
lfs hsm_archive <SAMPLE_FILE>
```

# Release 테스트
```bash
lfs hsm_release <SAMPLE_FILE>
```