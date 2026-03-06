# FSx Lustre 관련 문제 발생 시 점검 절차

---

## 1. 파일시스템 마운트 확인
```bash
mount | grep lustre

# 또는

df -h
```

## 2. Lustre 상태 확인
```bash
lfs df -h
lfs df -i
```

## 3. OST / MDT 상태 확인
```bash
lfs osts
lfs mdts
```

## 4. IO 상태 확인
```bash
lctl get_param obdfilter.*.stats
```

## 5. Metadata 상태 확인
```bash
lctl get_param mdt.*.md_stats
```

## 6. FSx mount 재시도
```bash
mount -t lustre <FSX_DNS>@tcp:/fsx /fsx
```

## 7. CloudWatch 확인

AWS 콘솔
FSx → Monitoring

확인 항목

- DataReadBytes
- DataWriteBytes
- MetadataOps

---

## 8. 로그 확인
```bash
dmesg | grep lustre

# 또는

/var/log/messages
```