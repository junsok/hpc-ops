# configs (Examples)

이 폴더는 Slurm/SlurmDBD/systemd 설정을 **예시 템플릿**으로 보관합니다.

원칙:
- 실제 노드명/호스트/경로/계정/비밀번호/정책 수치는 커밋하지 않습니다.
- 모든 값은 `<PLACEHOLDER>` 형태로 작성합니다.
- 단위/형식(예: TIME 포맷, MB 단위, hostlist 포맷)은 주석으로 남깁니다.

구조:
- `slurm/slurm.conf.d/*.example` : slurm.conf 조각 템플릿
- `slurmdbd/slurmdbd.conf.example` : SlurmDBD 설정 템플릿
- `systemd/*.service.example` : systemd 서비스 유닛 템플릿