# Lustre HSM Batch Automation

대량 파일을 대상으로 HSM 작업을 수행할 때 사용하는 batch 예시입니다.

운영 환경에서는 수천~수백만 파일을 대상으로 Archive / Release / Restore 작업을
자동화하여 실행하는 경우가 많습니다.

---

## File List 기반 Archive Batch

파일 목록을 기반으로 Archive 수행

```bash
cat <FILELIST_TXT> | while read -r f; do
  lfs hsm_archive "$f"
done
```

# FILELIST_TXT 예시
/fsx/data/file1
/fsx/data/file2
/fsx/data/file3

# File List 기반 Release Batch
```bash
cat <FILELIST_TXT> | while read -r f; do
  lfs hsm_release "$f"
done
```

# File List 기반 Restore Batch
```bash
cat <FILELIST_TXT> | while read -r f; do
  lfs hsm_restore "$f"
done
```

# 특정 디렉토리 Archive Batch
```bash
find <TARGET_DIR> -type f -print0 | while IFS= read -r -d '' f; do
  lfs hsm_archive "$f"
done
```

# 특정 디렉토리 Release Batch
```bash
find <TARGET_DIR> -type f -print0 | while IFS= read -r -d '' f; do
  lfs hsm_release "$f"
done
```

# HSM 상태 통계 확인 (예시)
-> 대량 파일의 HSM 상태를 집계할 때 사용합니다.
```bash
find <TARGET_DIR> -type f -print0 \
| xargs -0 -n 500 lfs hsm_state 2>/dev/null \
| awk '
{for(i=1;i<=NF;i++) if($i=="exists"||$i=="archived"||$i=="released"||$i=="dirty") c[$i]++}
END{for(k in c) printf "%-9s %d\n", k, c[k]}' | sort
```

-> 출력예시
archived   105299
exists     523
released   16

# HSM 상태 로그 파일 저장 (예시)
```bash
find <TARGET_DIR> -type f -print0 \
| xargs -0 -n 500 lfs hsm_state 2>/dev/null \
| awk '
{for(i=1;i<=NF;i++) if($i=="exists"||$i=="archived"||$i=="released"||$i=="dirty") c[$i]++}
END{for(k in c) printf "%-9s %d\n", k, c[k]}' | sort > <OUTPUT_LOG_FILE>
```