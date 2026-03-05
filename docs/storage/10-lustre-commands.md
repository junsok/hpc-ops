# Lustre Commands

Lustre filesystem 상태 확인 및 운영에 사용하는 기본 명령어입니다.

---

## Filesystem 상태 확인

```bash
mount | grep lustre
```
→ Lustre mount 여부 확인

```bash
lfs df -h
```
→ OST 디스크 사용량 확인

```bash
lfs df -i
```
→ inode 사용량 확인

```bash
lfs osts
```
→ OST 상태 확인

```bash
lfs mdts
```
→ MDT 상태 확인


# Striping 확인
```bash
lfs getstripe <PATH_OR_FILE>
```
→ 파일 또는 디렉토리의 stripe 정보를 확인합니다.

#Striping 설정 (예시)
# 설명
#<STRIPE_COUNT> : stripe 개수 (정수)
#<STRIPE_SIZE> : stripe 크기 (예: 1M, 4M)

```bash
lfs setstripe -c <STRIPE_COUNT> -S <STRIPE_SIZE> <DIR>
```

# Lustre 상태 확인
```bash
lctl dl
```
→ Lustre 디바이스 상태 확인

```bash
lctl get_param -n <PARAM>
```
→ Lustre 파라미터 조회