# B3-1 · AWS Cloud Mission

서울 리전에 VPC·Public Subnet·Internet Gateway·보안 그룹·EC2를 구성하고 Nginx 웹 페이지를 공개한 실습입니다. 사용자가 직접 구축한 환경과 제공한 작업 로그·스크린샷을 기준으로 정리했습니다.

## 외부 접속 결과

- 선택: **A 방식 — 외부 브라우저 접속**
- 접속 URL: **http://43.201.48.130**
- 제공된 화면의 결과: `Hello Cloud Mission` / `AWS EC2 + VPC + Nginx` 표시.
- 이 결과는 사용자가 제공한 촬영 당시의 증빙입니다. 현재 서버 응답을 별도로 재검증하지 않았습니다.
- 사용자 지정 페이지 `Hello Cloud Mission`의 외부 접속 원본 화면을 `docs/screenshots/07-external-access.png`에 저장했습니다.

![Hello Cloud Mission 외부 접속 증빙](docs/screenshots/07-external-access.png)
- 인스턴스 종료 후 URL이 동작하지 않는 것은 정상입니다. 자동 할당 IPv4는 변경되거나 해제될 수 있습니다.

## 실제 구성

| 항목 | 설정 |
|---|---|
| 리전 / AZ | ap-northeast-2 / ap-northeast-2a |
| IAM 사용자 | mission-cloud-user (사용자 화면 및 제공 정책 JSON 확인) |
| VPC | mission-vpc · 10.0.0.0/16 · vpc-0e10021fd1a09e0ea |
| Public Subnet | mission-public-subnet · 10.0.1.0/24 · subnet-02395a2ae539a0a0b |
| IGW | mission-igw · igw-00282b3ebdefbbd81 |
| Route Table | mission-public-rt · rtb-0993a814677ceaebd · 0.0.0.0/0 → IGW |
| Security Group | mission-web-sg · sg-0fe3c165848b4918b |
| HTTP 인바운드 | TCP 80 · 0.0.0.0/0 |
| SSH 인바운드 | TCP 22 · 학습자 IPv4 /32 (제공 화면에서 확인) |
| 아웃바운드 | 전체 허용 (사용자 로그 기준) |
| EC2 | mission-web-server · i-0636b2e10b12c0414 · t3.micro |
| OS / EBS | Ubuntu Server 26.04 LTS · 8 GiB gp3 (사용자 로그 기준) |
| IP | Private 10.0.1.211 / Public 43.201.48.130 |
| 키페어 | mission-key · 개인키 미포함 |

![아키텍처](docs/architecture.png)

## 요구사항 확인

| 요구사항 | 확인 근거 / 현재 상태 |
|---|---|
| VPC·Subnet·IGW·기본 경로 | 로그 및 제공 화면에서 기본 경로 0.0.0.0/0 → IGW 활성, mission-public-subnet(10.0.1.0/24) 명시적 연결 확인. 원본 이미지 저장 대기 |
| 아웃바운드 인터넷 | 사용자 터미널 화면에서 EC2의 `curl -4 -I --max-time 20 https://example.com` → HTTP/2 200 확인 |
| EC2·SSH·Nginx | EC2 실행 화면 및 Ubuntu 터미널의 `systemctl is-active nginx` → active 확인 |
| 내부 HTTP 200 | 사용자 EC2 터미널 화면에서 GET → HTTP/1.1 200 OK 및 Hello Cloud Mission 본문 확인 (응답 시각 2026-09-09 11:21:17 GMT) |
| HTTP 공개·SSH 제한 | 제공한 보안 그룹 화면에서 확인. 전체 포트 공개 인바운드 없음 |
| IAM 최소권한·비루트 | 사용자 화면·정책 JSON 검토 완료. EC2/VPC 작업 제한 확인; 사용자 콘솔 화면에서 정책 업데이트 성공·서울 리전 조건 및 버전 2 기본값 확인. Resource *는 보완점. [검토 결과](iam/README.md) |
| 외부 웹 접속 | A 방식 Hello Cloud Mission 페이지 원본 저장 완료 |
| 아키텍처 PNG | docs/architecture.png 사용자 원본으로 교체 완료 |
| 트러블슈팅 보고서 | docs/troubleshooting.md 작성 완료 |
| 리소스 정리 | 체크리스트 작성 완료. 실제 종료·삭제 및 근거 확보는 미완료 |
| 프리 티어 범위 | 계정 적용 여부·사용량 확인 대기 |

![보안 그룹 인바운드 증빙](docs/screenshots/04-security-group.png)

HTTP TCP 80은 `0.0.0.0/0`, SSH TCP 22는 학습자 IP의 `/32`로 제한되어 있습니다. 촬영 화면에서 인바운드 규칙 2개를 확인했습니다.

## 파일 안내

- [실습 원본 기록](docs/work-log.md): 사용자가 제공한 문서를 그대로 보존. 문서 안의 예정 작업은 실제 완료로 간주하지 않습니다.
- [트러블슈팅](docs/troubleshooting.md): 확인된 현상과 아직 입증되지 않은 원인 구분.
- [정리 체크리스트](docs/cleanup-checklist.md): 실습 종료 후 실제 리소스 상태와 근거 기록.
- [증빙 목록](docs/screenshots/README.md): 필요한 원본 파일과 확인 범위.
- `scripts/verify-existing.sh`: 기존 Ubuntu 서버에서 읽기 전용 검증을 실행하는 도구.
- `scripts/draw_architecture.py`: 이전 구성도 생성 코드. 출력은 `docs/architecture-generated.png`이며 사용자 원본을 덮어쓰지 않습니다.
- `web/deployed-index.html`: 작업 로그에 나온 실제 배포 HTML의 재현본. 서버에서 다운로드한 파일은 아닙니다.
- `web/index.html`, `web/nginx.conf`, `infra/`: 로그를 받기 전 작성한 신규 환경 초안. 현재 서버에는 적용하지 않았습니다. **현재 진행에서는 Terraform apply/destroy를 실행하지 않습니다.**

## 기존 서버 재검증

프로젝트 루트에서 실행합니다. 개인키는 저장소 외부에 보관합니다.

```bash
bash scripts/verify-existing.sh "$HOME/mission-key.pem" 43.201.48.130
```

SSH 호스트키가 처음 나오면 EC2 콘솔에서 확인한 지문과 대조합니다. 스크립트는 호스트키 검증을 끄지 않습니다. 현재 접속 IP가 보안 그룹의 /32와 일치해야 합니다.
결과는 `docs/evidence/verify-날짜시간.txt`에 저장됩니다. 로컬 GET 200, Nginx 실행, 외부 HTTPS, 외부 GET 200 및 페이지 문구를 확인하며 실패 시 0이 아닌 종료 코드를 반환합니다.

## 설명할 핵심

VPC는 네트워크 경계이고 Subnet은 그 안의 주소 범위입니다. Route Table은 목적지별 경로를 정하며, IGW는 VPC와 인터넷을 연결합니다. 공개 IPv4와 IGW 경로, HTTP 허용 규칙, 실행 중인 웹 서버가 함께 있어야 외부 접속이 됩니다.
Security Group은 인스턴스 네트워크 트래픽을 제어하며, IAM은 AWS 리소스를 만들거나 삭제하는 API 권한을 제어합니다. 현재 로그의 전체 허용 아웃바운드는 전체 공개 인바운드와 다릅니다. IAM 정책 검토에서는 EC2/VPC에 필요한 작업만 허용하는지, AdministratorAccess나 무관한 S3/RDS 권한이 없는지 확인해야 합니다.

EC2 실행 시간, EBS 보관, 퍼블릭 IPv4 등은 과금 확인 대상입니다. 무료 적용은 계정 생성 시점과 플랜·사용량에 따라 다르므로 t3.micro라는 이유만으로 무료 완료로 표시하지 않습니다. [AWS EC2 프리 티어 안내](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-free-tier-usage.html)

## 남은 제출 작업

1. 채팅의 원본 스크린샷을 증빙 목록의 경로에 저장.
2. 계정 프리 티어 적용 확인. 서울 리전 조건은 사용자 콘솔 화면에서 저장 확인 완료. 내부 GET 검사 성공은 확인했으며 터미널 캡처 원본 파일 저장 필요.
3. 제출 자료를 확보한 뒤 체크리스트에 따라 리소스 정리 및 삭제 근거 기록.
4. 증빙에 개인키·비밀번호·토큰·결제정보가 없는지 확인한 뒤 제출. Git commit/push는 아직 수행하지 않았습니다.
