# Storage Verify Checklist

Lustre filesystem 운영 상태 점검 체크리스트입니다.
스토리지 작업 후 정상 동작 여부를 확인할 때 사용합니다.

예

- FSx mount 확인
- OST / MDT 상태 확인
- HSM 상태 확인
- Archive / Release / Restore 테스트

---

## 1. Lustre Mount 확인

```bash
mount | grep lustre
```

## 2. Filesystem 사용량 확인
```bash
lfs df -h
```
→ OST 디스크 사용량 확인

```bash
lfs df -i
```
→ inode 사용량 확인

## 3. OST / MDT 상태 확인
```bash
lfs osts
```
→ Object Storage Target 상태 확인

```bash
lfs mdts
```
→ Metadata Target 상태 확인

## 4. Lustre 장치 상태 확인
```bash
lctl dl
```
→ Lustre 디바이스 상태를 확인합니다.

## 5. HSM 상태 확인
```bash
lfs hsm_state <SAMPLE_FILE>
```
→ 파일의 HSM 상태를 확인합니다.

## 6. Archive 테스트
```bash
lfs hsm_archive <SAMPLE_FILE>
```
→ 파일을 backend storage로 archive 합니다.

## 7. Release 테스트
```bash
lfs hsm_release <SAMPLE_FILE>
```
→ Lustre filesystem에서 파일을 제거하고 backend storage만 유지합니다.

## 8. Restore 테스트
```bash
lfs hsm_restore <SAMPLE_FILE>
```
→ backend storage에서 Lustre filesystem으로 파일을 복구합니다.

## 9. Lustre 로그 확인
```bash
dmesg | grep lustre
journalctl -u lustre
```
→ Lustre 관련 오류 메시지를 확인합니다.

## 10. HSM 상태 통계 확인
```bash
find <TARGET_DIR> -type f -print0 \
| xargs -0 -n 500 lfs hsm_state 2>/dev/null \
| awk '
{for(i=1;i<=NF;i++) if($i=="exists"||$i=="archived"||$i=="released"||$i=="dirty") c[$i]++}
END{for(k in c) printf "%-9s %d\n", k, c[k]}' | sort
```
