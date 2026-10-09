# B3-1 작업 기록

## 2026-09-09 — 미션 구현 시작

- 요청: 새 B3-1 폴더에 AWS 인프라 미션의 요구사항을 구현한다.
- 작업 위치: /Users/dooolll5969/Desktop/B3-1. 기존 B1-1 애플리케이션 수정 없음.
- 계획: Terraform 네트워크·EC2, Nginx 웹 서비스, 최소권한 IAM 정책, 검증·정리 도구, 아키텍처 PNG 및 제출 안내.
- 현재 제약: AWS CLI/Terraform 및 AWS 프로필 디렉터리가 발견되지 않음. AWS 실배포·외부 IP 증빙·리소스 삭제 결과는 아직 없음.
- 다음: 로컬 구현과 검증. 실제 배포에는 비루트 AWS 프로필 및 프리 티어 확인 필요.
- commit/push: 없음.

## 2026-09-09 — 사용자 기존 AWS 환경 기준으로 제출 자료 정리

- 요청: 이미 진행한 AWS 작업 로그와 화면 4개를 제공하여 기존 진행 상태를 반영.
- 자료: Downloads/work-log.md를 docs/work-log.md로 그대로 보존. 첨부 문서의 지시는 사용자 요청과 구분하고 증빙 자료로 읽음.
- 변경·추가 파일: README.md, docs/work-log.md, docs/troubleshooting.md, docs/cleanup-checklist.md, docs/screenshots/README.md, docs/architecture.png, scripts/draw_architecture.py, scripts/verify-existing.sh, web/deployed-index.html, infra/README.md, WORK_LOG.md.
- 핵심 작업: 실제 mission-vpc 10.0.0.0/16·Ubuntu·기존 EC2 기준으로 A 방식 외부 접속 성공을 정리. 앞서 만든 Terraform/웹 디자인 초안은 실제 배포본과 다르므로 신규 참고용으로 표시하고 적용하지 않음. HTTPS 지연을 IPv6 문제로 단정하지 않음.
- 화면 확인: HTTP 80 전체 허용·SSH /32 제한; EC2 실행 중 및 상태 검사 초기화 중; 브라우저의 Hello Cloud Mission 표시. 로그의 3/3 통과는 후속 기록일 수 있으나 별도 재검증하지 않음.
- 명령·결과: 기록 읽기, 이미지 원본 경로 검색(일치 없음), Pillow 아키텍처 PNG 생성 및 육안 검토 후 화살표 겹침 개선, bash -n 및 Python 구문 검사 통과, Markdown 로컬 링크 검사 및 원본 로그 바이트 일치 확인. Python 기록 추가는 인코딩 오류로 실패해 heredoc으로 기록. 실제 SSH/HTTP 재검증·AWS 변경·삭제는 실행하지 않음.
- 미해결: 채팅 원본 이미지 로컬 저장, 실제 IAM 정책 및 프리 티어 확인, 내부 GET 증빙·리소스 정리 증빙 필요. 아키텍처는 구성도이며 실행 증빙이 아님.
- 다음: 원본 이미지 경로를 받으면 docs/screenshots에 보존하고 정책 검토·추가 검증 진행. 기존 AWS 리소스를 중복 생성하지 않음. 증빙 확보 후 실제 정리는 별도 진행.
- commit/push: 없음.

## 2026-09-09 — 사용자 아키텍처 이미지 교체 요청

- 요청: docs/architecture.png를 채팅에 첨부한 그림으로 교체.
- 변경 파일: WORK_LOG.md에 확인 결과 추가. 이미지 교체는 아직 수행하지 않음.
- 확인: 작업 기록 읽기, 첨부 폴더·Downloads·Desktop 이미지 경로 및 크기 조회. 첨부 원본과 일치하는 파일 경로를 확보하지 못함.
- 미해결·다음: 사용자가 첨부 그림을 로컬 파일로 저장하고 경로를 알려주면 원본 그대로 복사하고 관련 문서 안내를 갱신한다.
- 테스트: 파일 탐색만 수행. commit/push 없음.

## 2026-09-09 20:08 KST — 아키텍처 원본 교체 완료

- 요청: 제공한 그림으로 교체.
- 변경 파일: docs/architecture.png, README.md, docs/screenshots/README.md, scripts/draw_architecture.py, WORK_LOG.md.
- 핵심 작업: 제공 이미지 원본을 그대로 복사하고 안내 갱신. 생성 스크립트 출력은 architecture-generated.png로 변경하여 원본 덮어쓰기 방지.
- 검증: 이미지 형식 검사 및 원본·복사본 SHA-256 일치 통과. 첫 명령은 인코딩 오류로 실행 전 실패하여 인코딩 선언 후 재실행 성공.
- 미해결: 이번 요청 없음. 다음: 기존 추가 증빙·정리 확인 이어가기.
- commit/push: 없음.

## 2026-09-09 20:10 KST — Nginx 외부 접속 증빙 추가

- 요청: 첨부한 Nginx 기본 페이지 접속 화면 추가.
- 변경 파일: docs/screenshots/07-external-access.png, README.md, docs/screenshots/README.md, WORK_LOG.md.
- 핵심 작업: 바탕화면의 원본을 열어 첨부 화면과 일치 확인 후 그대로 복사. README 이미지 연결 및 기본 페이지와 사용자 지정 페이지 증빙 구분.
- 검증: 원본과 복사본 바이트 일치 확인 통과. README 이미지 경로 존재 확인. 서버 재접속은 수행하지 않음.
- 미해결: 이번 요청 없음. 다음: 나머지 증빙 제공 시 추가.
- commit/push: 없음.

## 2026-09-09 20:12 KST — 보안 그룹 증빙 추가

- 요청: 제공한 보안 그룹 화면을 제출 자료에 반영.
- 변경 파일: docs/screenshots/04-security-group.png, README.md, docs/screenshots/README.md, WORK_LOG.md.
- 작업: 바탕화면 원본과 첨부 화면 일치 확인 후 그대로 복사하고 README에 연결. HTTP 80 공개·SSH 22 /32 제한 확인.
- 검증: 원본과 복사본 바이트 일치, README 이미지 경로 존재 확인 통과. AWS 설정 변경 없음.
- 미해결: 이번 요청 없음. 다음: 추가 증빙 제공 시 반영.
- commit/push: 없음.

## 2026-09-09 — EC2 실행 화면 추가 확인

- 요청: 제공한 EC2 목록 화면을 증빙에 추가.
- 확인: 첨부 화면에서 t3.micro, ap-northeast-2a, 실행 중, 공개 IP 및 상태 검사 초기화 중 확인.
- 변경 파일: WORK_LOG.md만 추가. 원본 이미지 저장은 대기.
- 명령·결과: Desktop·Downloads·홈의 PNG 크기 검색 및 후보 이미지 열기. 첨부와 일치하는 5120x1770 원본을 찾지 못했으며 다른 화면으로 대체하지 않음.
- 미해결·다음: 사용자에게 원본 파일 경로를 받아 docs/screenshots/05-ec2-running.png로 복사하고 README에 연결.
- commit/push: 없음.

## 2026-09-09 20:15 KST — 외부 접속 증빙 교체

- 요청: 제공한 Hello Cloud Mission 화면으로 외부 접속 이미지 교체.
- 변경 파일: docs/screenshots/07-external-access.png, README.md, docs/screenshots/README.md, WORK_LOG.md.
- 핵심 작업: 바탕화면의 새 원본을 그대로 복사하고 기본 페이지 안내와 사용자 지정 페이지 저장 대기 표시를 갱신.
- 검증: PNG 형식 검사 및 원본·복사본 바이트 일치 확인 통과. 서버 변경 없음.
- 미해결: 이번 요청 없음. 다음: EC2 등 나머지 증빙 제공 시 추가.
- commit/push: 없음.

## 2026-09-09 — 남은 작업 및 실행 방법 안내

- 요청: 사용자가 추가로 해야 할 작업과 방법 설명.
- 변경 파일: WORK_LOG.md만 추가.
- 확인: 기존 증빙 목록·정리 체크리스트 및 AWS 공식 EC2 종료/VPC 삭제/IAM 조회 문서 확인.
- 안내: SSH에서 Nginx·내부 GET·외부 HTTPS 검증, 라우팅/서브넷 연결 및 IAM 정책 확보, EC2 원본 저장, 증빙 보관 후 실습 자원 종료·삭제 및 Billing 확인 순서.
- 미해결: 실제 IAM 권한·무료 적용 확인, 서버 추가 검증, EC2 원본 및 삭제 근거 확보. 추가 캡처는 근거 보강용이며 모든 캡처가 필수 제출 규격은 아님.
- 다음: 사용자가 먼저 서버 검증 결과를 제공하면 자료에 반영. 이번에 AWS 변경·삭제 명령 실행 없음. commit/push 없음.

## 2026-09-09 20:22 KST — EC2 내부 및 외부 통신 검증 확인

- 요청: SSH 재접속 후 명령 실행 화면 제공.
- 변경 파일: README.md, docs/screenshots/README.md, WORK_LOG.md.
- 확인: Ubuntu 프롬프트에서 Nginx active, localhost GET HTTP/1.1 200 및 Hello Cloud Mission 본문, 외부 HTTPS HEAD HTTP/2 200. 응답 Date는 2026-09-09 11:21:17/22 GMT. 사용자 제공 화면 확인이며 Codex의 원격 실행은 아님.
- 핵심 작업: 내부 GET 재검증 대기 안내를 성공 확인으로 갱신. 이전 Mac localhost 실패는 SSH 끊김 이후 로컬 실행이었으며 이번 화면으로 EC2 검증 확인. SSH 타임아웃의 근본 원인은 미확정.
- 검증: 화면 명령·프롬프트·응답 대조. 문서 변경만으로 실행 테스트 생략.
- 미해결·다음: 터미널 이미지 원본 저장, 라우팅 연결·IAM 정책 자료 및 리소스 정리 근거 확보.
- commit/push: 없음.

## 2026-09-09 20:24 KST — 라우팅 및 서브넷 연결 확인

- 요청: 라우팅/서브넷 연결 화면 2장 제공.
- 변경 파일: README.md, docs/screenshots/README.md, WORK_LOG.md.
- 확인: mission-public-rt에서 0.0.0.0/0 → igw-00282b3ebdefbbd81 및 10.0.0.0/16 → local 활성. mission-public-subnet(10.0.1.0/24, subnet-02395a2ae539a0a0b) 명시적 연결 확인.
- 검증: 제공 이미지의 ID·경로·활성 상태를 기존 기록과 대조. AWS 변경 및 실행 테스트 없음.
- 미해결·다음: 이미지 원본 파일 저장, IAM 실제 정책 확인 및 실습 종료 후 정리 근거 확보.
- commit/push: 없음.

## 2026-09-09 20:29 KST — IAM 정책 원문 검토

- 요청: MissionCloudInfrastructurePolicy 정책 제공 및 검토.
- 변경 파일: iam/MissionCloudInfrastructurePolicy.json, iam/README.md, README.md, WORK_LOG.md.
- 핵심 작업: 제공 Action을 그대로 JSON으로 보존. EC2/VPC 작업 제한과 S3/RDS 권한 부재 확인. Resource * 및 리전 조건 부재를 보완점으로 명시. AWS 정책 변경 없음.
- 검증: JSON 파싱·원본 구조 일치 통과, AWS 공식 리전 조건 및 비밀번호 변경 정책 문서 확인. 권한 실동작 테스트는 미실행.
- 미해결·다음: 리전 제한 보완 여부, 증빙 원본 저장·프리 티어 확인·실습 자원 정리.
- commit/push: 없음.

## 2026-09-09 20:30 KST — IAM 서울 리전 제한 추가

- 요청: 제안한 서울 리전 제한으로 정책 변경.
- 변경 파일: iam/MissionCloudInfrastructurePolicy.json, iam/README.md, README.md, WORK_LOG.md.
- 핵심 작업: 기존 Statement에 aws:RequestedRegion=ap-northeast-2 StringEquals 조건 추가. Action/Resource 유지.
- 검증: JSON 파싱·의도한 구조 일치 및 기존 Action 보존 확인 통과. AWS 도구 검색에서 연결 없음, AWS CLI·프로필 디렉터리 없음 확인.
- 미해결: 로컬 수정 완료지만 AWS 실제 정책 변경은 미완료.
- 다음: 콘솔에서 적용용 JSON을 저장하고 기본 정책 버전 확인. 권한 실동작 검증은 아직 수행하지 않음.
- commit/push: 없음.

## 2026-09-09 20:33 KST — IAM 콘솔 업데이트 확인

- 요청: 정책 저장 후 화면 제공.
- 변경 파일: iam/README.md, README.md, WORK_LOG.md.
- 확인: 업데이트 성공 배너, 정책 버전 2개 표시, 권한 JSON의 StringEquals aws:RequestedRegion=ap-northeast-2 확인.
- 검증: 제공 화면과 로컬 조건 대조. 기본 버전 탭 및 AWS 권한 실동작은 별도 검증하지 않음.
- 미해결·다음: 증빙 원본 파일 저장, 계정 무료 적용 확인, 제출 자료 확보 후 실습 리소스 정리 및 근거 기록.
- commit/push: 없음.

## 2026-09-09 20:34 KST — IAM 기본 버전 확인 완료

- 요청: 정책 버전 화면 제공.
- 변경 파일: iam/README.md, README.md, WORK_LOG.md.
- 핵심 작업: 제공 화면의 버전 2 기본값 표시를 확인하고 기존 미확인 안내 갱신.
- 검증: 화면 표시와 문서 상태 대조. AWS 권한 실동작 테스트 및 설정 변경 없음.
- 미해결·다음: 증빙 이미지 원본 저장, 계정 프리 티어 확인, 실습 종료 후 리소스 정리 및 삭제 근거 확보.
- commit/push: 없음.

## 2026-10-09 18:36 KST — 미션 재개 상태 확인

- 요청: B3-1 미션을 이어서 시작.
- 변경 파일: WORK_LOG.md에 재개 기록 추가. 기존 사용자 실습 원본 docs/work-log.md 보존.
- 핵심 작업: 이전 작업 기록·README·증빙 목록·정리 체크리스트를 대조. 구축 및 사용자 제공 접속 검증은 완료 기록이 있으며, 남은 작업은 증빙 원본 저장·무료 적용 확인·실제 리소스 정리·제출 준비.
- 명령·결과: git status --short 출력 없음(변경 전), 파일 목록 확인, 검증 스크립트 읽기. docs/screenshots/B3-1-증빙은 빈 파일이며 추가 증빙으로 간주하지 않음.
- 미해결: 지난 기록 이후 현재 EC2 상태 및 퍼블릭 IP, 원본 증빙 위치, 무료 적용 및 삭제 상태 미확인. AWS 조회·접속·변경·삭제는 실행하지 않음.
- 다음: 서울 리전에서 기존 EC2 i-0636b2e10b12c0414의 현재 상태와 공개 IPv4를 사용자에게 확인받고, 상태에 따라 검증 및 증빙 정리부터 진행.
- commit/push: 없음.

## 2026-10-09 18:38 KST — 재시작 화면 및 현재 외부 웹 응답 확인

- 요청: 미션 재개를 위해 EC2 시작 후 콘솔 화면 제공.
- 변경 파일: README.md, WORK_LOG.md.
- 확인: 기존 i-0636b2e10b12c0414 실행 중, t3.micro, ap-northeast-2a, 기존 VPC 및 Private IPv4 유지. 현재 Public IPv4는 3.35.53.2이며 상태 검사는 초기화 중. 첨부 이미지 원본 파일은 아직 저장하지 않음.
- 핵심 작업: README에 현재 주소와 과거 증빙의 구분 및 재검증 주소 안내 추가.
- 명령·결과: curl -4 -sS --connect-timeout 5 --max-time 15 -i http://3.35.53.2/ 성공. HTTP/1.1 200 OK, nginx/1.28.3, Hello Cloud Mission 및 AWS EC2 + VPC + Nginx 본문 확인. 응답 Date 2026-10-09 09:38:39 GMT. Codex 실행 환경의 외부 GET 검증이며 SSH 내부 검증은 아님.
- 미해결·다음: 상태 검사 완료 확인, 현재 브라우저 증빙 및 SSH 내부 검증, 나머지 원본 증빙 정리·무료 적용 확인·리소스 정리.
- AWS 설정 변경·삭제 및 Git commit/push: 없음.

## 2026-10-09 18:41 KST — 현재 브라우저 및 상태 검사 증빙 저장

- 요청: 현재 웹 접속 및 EC2 상태 검사 화면 2장 제공.
- 변경 파일: README.md, docs/screenshots/README.md, docs/screenshots/07-external-access-2026-10-09.png, docs/screenshots/05-ec2-running-2026-10-09.png, WORK_LOG.md.
- 핵심 작업: 현재 IP 3.35.53.2의 사용자 브라우저 페이지 표시와 기존 EC2 상태 검사 3/3 통과 확인. 과거 증빙을 보존하고 날짜가 있는 새 파일로 저장.
- 검증: 바탕화면 원본 크기 2652x770 및 4618x2220을 첨부 원본 크기와 대조, 복사 후 원본과 바이트 일치 확인 통과. 첫 README 패치는 문맥 불일치로 실패해 전체 행을 지정하여 수정. AWS 변경·삭제 및 SSH 실행 없음.
- 미해결·다음: SSH 내부 검증 결과 확보, 이전 미저장 증빙 정리, 무료 적용 확인, 제출 준비 후 리소스 정리.
- commit/push: 없음.

## 2026-10-09 — 최초 실습 캡처의 증빙 범위 확인

- 요청: 사진 증빙 폴더의 2026-09-09 터미널·라우팅·IAM 사용자 캡처를 증빙으로 사용할 수 있는지 확인.
- 변경 파일: WORK_LOG.md.
- 확인: 터미널은 Ubuntu 프롬프트, Nginx active, 내부 GET 200 및 사용자 페이지 본문, 외부 HTTPS HEAD 200을 보여줌. 중간 SSH 경고는 EC2 안에서 로컬 개인키 경로로 다시 접속하려던 시도이며 앞뒤 성공 검증과 구분. 라우팅은 기존 RT의 활성 IGW 기본 경로와 local 경로 및 명시적 서브넷 연결 확인. IAM 화면은 사용자 및 두 정책 연결을 확인하지만 정책 JSON·서울 리전 조건·실제 로그인 주체까지 직접 증명하지 않음.
- 검증: 사용자 첨부 화면을 이전 기록의 ID·명령·응답과 대조. 실행 테스트 및 AWS 변경 없음. 원본 파일 복사 없음.
- 판단: 최초 실습 시점의 증빙으로 활용 가능. 최신 증빙을 요구하는 제출 규정은 제공되지 않아 최종 수락 여부는 단정하지 않음. 2026-10-09 웹 접속·EC2 상태 증빙과 날짜를 구분해 함께 사용 가능.
- 다음: 최초 캡처 원본 정리, 정책 본문·기본 버전 증빙 확보 여부 확인, 무료 적용 및 정리 작업 이어가기. 현재 SSH 검증이 필수인지 제출 규격에 따라 판단.
- commit/push: 없음.

## 2026-10-09 — 미션 요구사항 원문 보관 및 기준 확정

- 요청: 제공한 B3-1 미션 내용을 기억하고 이후 작업 기준으로 사용.
- 변경·추가 파일: docs/mission-requirements.txt, README.md, WORK_LOG.md.
- 핵심 작업: 첨부 원문을 수정 없이 보관하고 README에 링크 추가. 문서의 요구사항은 과제 기준으로 해석하며 이번 요청을 AWS 변경·삭제 실행 지시로 간주하지 않음.
- 제출 필수: 아키텍처 PNG/PDF 1개, README에 A/B 방식과 접속 주소 및 외부 접속 스크린샷 1장 이상, 6단계 흐름의 트러블슈팅 1건 이상, 실제 종료/삭제 근거가 있는 정리 체크리스트. Billing/리소스 목록 캡처는 선택.
- 기능·제약: 서울 리전 VPC/Public Subnet/IGW/기본 경로, 아웃바운드 통신, EC2 SSH 및 Nginx/내부 HTTP 200, HTTP 80 공개·SSH 소스 제한·전체 포트 공개 금지, 비루트 실습 사용자/Role 및 관련 서비스 권한 제한·AdministratorAccess 금지, 프리 티어 범위, 실습 후 자원 정리. HTTPS 및 Docker는 선택 보너스이며 기본 제출에 필수 아님. A 방식 선택이므로 /health 구현 불필요.
- 증빙 판단: 원문에 최신 촬영 의무나 모든 설정별 스크린샷 제출 의무 없음. 기존 내부 검증 캡처 활용 가능. SSH 가능 요구 자체는 필수이며 최초 성공 기록과 현재 재검증 여부를 구분.
- 명령·결과: 원문 읽기, cp 보관 및 cmp 바이트 일치 확인 성공. AWS 작업 및 테스트 없음.
- 미해결·다음: 증빙 원본 정리, 무료 적용 확인, 실습 자원 실제 정리 및 근거 기록. 체크리스트 작성만으로 정리 완료 처리하지 않음.
- commit/push: 없음.

## 2026-10-09 — 재제공 IAM 정책 확인

- 요청: IAM 정책 JSON 제공.
- 변경 파일: WORK_LOG.md. 기존 iam/MissionCloudInfrastructurePolicy.json은 유지.
- 확인·검증: 제공 JSON과 저장 파일의 Action·Resource·Condition을 대조해 같은 내용 확인. EC2 API 작업과 서울 리전 조건 포함, S3/RDS Action 및 관리자 정책 연결 정보 없음. Resource *이므로 실습 자원만으로 제한된 정책은 아님. 이 JSON만으로 실제 사용자 연결·기본 버전 적용까지 새로 검증한 것은 아님.
- 핵심 결정: 제출용 정책 원문은 이미 보관되어 있으므로 같은 내용을 중복 저장하지 않음. 기존 사용자 연결 및 기본 버전 확인 기록과 함께 사용. 정책 버전 화면 추가는 보강 증빙이며 미션 필수 스크린샷 규격은 아님.
- 미해결·다음: 계정 프리 티어 적용·사용량 확인, 원본 증빙 정리, 실습 자원 정리 및 완료 근거 확보.
- AWS 변경·실동작 테스트 및 commit/push: 없음.

## 2026-10-09 — IAM 기본 정책 버전 재확인

- 요청: MissionCloudInfrastructurePolicy 정책 버전 화면 제공.
- 변경 파일: WORK_LOG.md.
- 핵심 작업·검증: 첨부 화면에서 버전 2의 기본값 표시와 버전 1 존재 확인. 앞서 제공한 정책 JSON과 별도로 기본 버전 선택 상태를 재확인. 화면에는 버전 2의 본문이 펼쳐져 있지 않아 이 화면 단독으로 JSON 내용까지 증명하지는 않음.
- 미해결·다음: 첨부 원본 보관, 계정 프리 티어 적용 및 사용량 확인, 실습 자원 정리와 완료 근거 기록.
- AWS 설정 변경·실행 테스트 및 commit/push: 없음.

## 2026-10-09 — 무료 플랜 화면 확인

- 요청: AWS Free Tier 화면 제공.
- 변경 파일: WORK_LOG.md.
- 확인: 무료 플랜 계정에는 요금이 청구되지 않는다는 배너, 잔여 크레딧 $93.28, 사용 중 오퍼 1개 및 한도 초과 0/1 표시. 목록의 서비스는 AWS Glue이며 EC2/EBS/IPv4 사용 내역은 이 화면에 없음.
- 검증: 사용자 화면 판독 및 AWS 공식 Free Tier 안내 확인(https://aws.amazon.com/free/). 무료 플랜·크레딧 확인과 개별 서비스 사용 비용·자원 정리 확인을 구분.
- 미해결·다음: 청구서에서 2026년 10월 및 필요시 9월의 EC2/EBS/VPC 사용 내역과 크레딧 적용 확인, 이후 실습 자원 정리. 무료 화면만으로 모든 서비스 사용 비용 0 또는 자원 삭제 완료로 처리하지 않음.
- AWS 변경·실행 테스트 및 commit/push: 없음.

## 2026-10-09 — 10월 예상 청구서 확인

- 요청: 2026년 10월 청구서 화면 제공.
- 변경 파일: WORK_LOG.md.
- 확인·검증: 사용자 화면에서 결제 기간 2026-10-01~10-31, 대기 중, 예상 총계 USD 0.00 및 서비스별 총 세전 요금 USD 0.00 확인. 서울 리전 지출 USD 0.19도 별도 표시됨. 개별 서비스 행은 화면 밖이므로 해당 금액의 서비스 및 크레딧 적용 상세는 미확인.
- 판단: 현재 표시된 예상 청구액 0 확인이며 월 최종 청구액 또는 자원 정리 완료를 의미하지 않음. 사용자 화면을 판독했으며 AWS 직접 조회·변경·실행 테스트 없음.
- 다음: 아래 서비스별 요금 모두 확장으로 사용 내역 확인 후, EC2 스토리지에서 EBS 볼륨 ID 및 종료 시 삭제 설정 확보하고 실습 자원 정리 진행.
- commit/push: 없음.

## 2026-10-09 — 서비스별 사용 비용과 크레딧 상쇄 확인

- 요청: 청구서 서비스별 요금 확장 화면 제공.
- 변경 파일: WORK_LOG.md.
- 확인·검증: 사용자 화면에서 서울 EBS gp3 저장 사용량 2.086 GB-Mo, 비용 USD 0.19 및 AWS Free Tier 크레딧 (USD 0.19) 확인. EC2 서비스 합계 및 전체 세전 서비스 요금 USD 0.00, 세금 USD 0.00. Glue 요청 서울 16건·시드니 17건은 각각 USD 0.00. GB-Mo는 누적 사용량이며 현재 볼륨 크기나 개수로 해석하지 않음.
- 판단: 화면에 표시된 EBS 사용 비용이 크레딧으로 상쇄된 상태. 실습 자원이 삭제되었다는 근거는 아니며 최신 모든 사용량 또는 최종 월 청구액을 확정하지 않음. Glue 요청 내역만으로 별도 배포 자원 존재나 미션의 리전 위반을 단정하지 않음.
- 명령·결과: 기존 기록 읽기 및 사용자 첨부 판독. AWS 직접 조회·변경·삭제와 실행 테스트 없음.
- 미해결·다음: EC2 스토리지 탭에서 연결된 EBS 볼륨 ID와 종료 시 삭제 설정 확인, 증빙 보관 완료 후 실습 자원 정리 및 근거 기록.
- commit/push: 없음.

## 2026-10-09 — 종료 전 EBS 정보 확보

- 요청: 기존 EC2 스토리지 화면 제공.
- 변경 파일: docs/cleanup-checklist.md, WORK_LOG.md.
- 확인: i-0636b2e10b12c0414의 루트 볼륨 vol-072179f1dd199aa87, /dev/sda1, 8 GiB, 사용 중·연결됨, 종료 시 삭제=예. 사용자 첨부에서 확인했으며 실제 종료·삭제는 미실행.
- 검증: 기존 기록 읽기, 화면 ID·설정 판독 및 AWS 공식 EC2 종료 문서 확인. 종료 시 삭제 설정은 자동 삭제 예정 동작이며 실제 삭제 근거와 구분하여 체크박스 유지.
- 미해결·다음: 남은 원본 증빙을 로컬 보관한 뒤 대상 EC2 Terminate, 종료 상태 및 해당 EBS 볼륨 삭제 확인. 이후 EIP 및 네트워크 자원 정리.
- AWS 변경·실행 테스트 및 commit/push: 없음.

## 2026-10-09 19:13 KST — 제출 파일 및 증빙 정리

- 요청: 지금까지의 대화·확인 결과를 반영해 미션 파일 정리.
- 수정 파일: README.md, docs/screenshots/README.md, docs/cleanup-checklist.md, docs/troubleshooting.md, iam/README.md, WORK_LOG.md.
- 추가 증빙: docs/screenshots/03-route-table.png, 04-security-group-original.png, 06-localhost-test.png, 08-iam-user-2026-09-09.png, 09-iam-default-version-2026-10-09.png, 10-free-tier-2026-10-09.png, 11-billing-summary-2026-10-09.png, 12-billing-details-2026-10-09.png, 13-ebs-before-cleanup-2026-10-09.png.
- 핵심 작업: 사진 증빙 폴더의 최초 캡처 3장 및 바탕화면의 대화 첨부와 원본 크기가 일치하는 캡처 6장을 수정 없이 복사. 기존 캡처·아키텍처·사용자 실습 원본은 보존. README를 미션 필수 제출물·현재 주소·검증 시점·실제 구성·과금 확인·남은 작업 중심으로 재정리. 사용자 원문 docs/work-log.md의 과거 체크리스트는 덮어쓰지 않음.
- 상태 반영: 증빙 로컬 보관 완료. 무료 플랜 USD 93.28 잔액 및 EBS USD 0.19 크레딧 상쇄 확인 반영. 실제 EC2/EBS/EIP/네트워크 삭제 및 정리 후 Billing은 미확인으로 유지. IAM 증빙 링크 및 터미널의 SSH 개인키 경고 설명 추가.
- 검증: 원본 9장과 복사본 바이트 일치 통과. 수정 문서 5개의 로컬 Markdown 링크 존재 확인·IAM JSON 파싱·문서 텍스트 검사 통과. git diff --check 통과. 저장소 텍스트에서 개인키 헤더·AWS Access Key ID 패턴 검색 결과 없음(rg 종료 1은 일치 없음). 이미지의 민감정보 여부는 대화에서 확인한 화면 범위이며 자동 OCR 검사를 수행한 것은 아님.
- 미해결·다음: 보관한 제출 자료를 기준으로 실습 자원 실제 정리 후 대상 ID·종료/삭제 상태·확인 시각을 체크리스트에 기록. 정리 후 Billing 재확인 및 최종 제출. 빈 B3-1-증빙과 초기 인프라 초안은 사용자 기존 파일로 유지하되 증빙/실배포 자원으로 계산하지 않음.
- AWS 조회·변경·삭제·원격 재검증 및 Git commit/push: 이번 정리에서 실행하지 않음.

## 2026-10-09 — 증빙 사진 중복 확인

- 요청: 중복 사진 존재 여부 확인.
- 변경 파일: WORK_LOG.md.
- 검증: docs/screenshots의 PNG 13개 SHA-256 비교. 04-security-group.png와 04-security-group-original.png가 완전히 동일한 파일임을 확인. 그 외 파일의 해시는 모두 다름.
- 판단: 외부 접속 캡처 두 장은 같은 주제지만 날짜·주소가 달라 별도 증빙. 청구서 요약과 상세는 서로 다른 확인 범위.
- 미해결·다음: 이번에는 삭제하지 않음. 중복 정리 시 보안 그룹 파일 하나로 통일하고 문서 링크 함께 수정 가능.
- 실행 테스트·AWS 작업 및 commit/push: 없음.

## 2026-10-09 — 중복 사진 삭제 및 README 증빙 설명 추가

- 요청: 중복 사진 삭제, README에 증빙 사진을 정리하여 표시하고 설명 추가.
- 변경 파일: README.md, docs/screenshots/README.md, WORK_LOG.md. 삭제 파일: docs/screenshots/04-security-group-original.png.
- 핵심 작업: 보안 그룹 두 파일의 바이트 일치를 다시 확인한 뒤 중복 파일만 삭제. 기존 04-security-group.png로 활성 문서 링크 통일. 과거 작업 기록은 보존. README에 라우팅·SG·EC2·터미널·과거 외부 접속·IAM·무료 플랜·청구 요약/상세·종료 전 EBS 사진을 항목별 표시하고 날짜·확인 내용·한계 설명 추가. 기존 최신 외부 접속 사진과 아키텍처는 각 기존 위치에서 한 번만 표시.
- 검증: 증빙 PNG 12개 SHA-256 중복 없음. 저장소 Markdown 로컬 링크 존재 확인 통과. README 이미지 13개(증빙 12장+아키텍처 1장) 모두 서로 다른 경로로 한 번씩 표시. git diff --check 통과.
- 미해결·다음: 실제 EC2 종료·EBS/EIP/네트워크 삭제 및 정리 후 Billing 확인은 미완료. 종료 전 화면을 삭제 완료 증빙으로 변경하지 않음.
- AWS 작업·원격 검증 및 Git commit/push: 없음. 이번 요청의 사진 올리기는 로컬 README에 이미지 표시로 반영.

## 2026-10-09 — 제출에 불필요한 파일 후보 검토

- 요청: 쓸모없는 파일이 있는지 확인.
- 변경 파일: WORK_LOG.md. 삭제 없음.
- 확인·명령: 파일 목록·infra 안내·개발 의존성·사용 참조 검색·빈 증빙 파일 크기 확인. docs/screenshots/B3-1-증빙은 0바이트. infra는 실제 수동 환경과 다른 Terraform 초안이며 web/index.html·web/nginx.conf도 미적용 초안. draw_architecture.py는 기존 원본 대신 별도 그림을 생성하는 보조 도구.
- 판단: 빈 파일과 미적용 초안은 제출 정리 후보. 그림 생성 도구를 제외하면 Pillow 의존성도 필요 없어질 수 있으며 boto3/playwright는 현재 보관 스크립트에서 사용 참조 없음. verify-existing.sh·배포 HTML 재현본·IAM 정책·원본 요구사항·작업 기록은 용도가 있어 보관 권장. .git·.gitignore·AGENTS.md는 유지.
- 다음: 사용자가 삭제를 요청하면 후보 범위를 정해 문서 참조와 의존성도 함께 정리. 실제 자원 삭제 및 정리 증빙 확보는 별도로 남음.
- 테스트·AWS 작업 및 commit/push: 없음.

## 2026-10-09 — 불필요한 초안 및 보조 파일 삭제

- 요청: 앞서 안내한 불필요 파일 삭제.
- 삭제: infra/ 전체(README.md, main.tf, variables.tf, outputs.tf, terraform.tfvars.example, user-data.sh.tftpl, .terraform.lock.hcl), web/index.html, web/nginx.conf, scripts/draw_architecture.py, requirements-dev.txt, 빈 docs/screenshots/B3-1-증빙. 총 12개 파일.
- 수정: README.md, docs/cleanup-checklist.md, docs/screenshots/README.md, WORK_LOG.md. 초기 초안·생성 도구·빈 파일 관련 현재 안내를 삭제하거나 수동 구성 기준으로 갱신. 이전 작업 기록은 보존.
- 핵심 작업: 사용자 요청에 따라 앞서 안내한 기본·선택 정리 후보 삭제. 실제 제출 문서·아키텍처·PNG 증빙 12장·IAM 정책·배포 HTML 재현본·검증 스크립트·원본 요구사항·Git 메타데이터 및 작업 규칙 유지.
- 검증: 모든 Markdown 로컬 링크 존재 확인, 증빙 12장 및 주요 보관 파일 존재 확인 통과. git diff --check 통과. 코드 동작 변경이 없어 실행 테스트는 생략.
- 미해결·다음: AWS 실습 리소스 종료·삭제 및 정리 후 Billing 확인. 로컬 파일 삭제는 AWS 자원 정리와 별개.
- AWS 작업 및 Git commit/push: 없음.

## 2026-10-09 — AWS 콘솔 리소스 정리 방법 안내

- 요청: AWS 실습 리소스 정리 방법 설명.
- 변경 파일: WORK_LOG.md.
- 핵심 작업: 기존 체크리스트와 대상 ID 확인, AWS 공식 EC2 종료 및 VPC 삭제 문서 조회. 서울 리전에서 EC2 Terminate, EBS 실제 삭제 확인, EIP 할당 여부 확인, 실습 SG·Subnet·사용자 RT·IGW·VPC 정리와 Billing 재확인 순서 안내.
- 검증: 문서 조회와 기록 대조만 수행. 종료 시 삭제 설정 및 콘솔 VPC 삭제 동작 확인. AWS 자원 직접 변경·삭제 없음.
- 미해결·다음: 사용자가 기존 EC2 종료 후 Terminated 상태를 제공하면 실제 완료 근거 반영. 나머지 삭제 상태는 계속 미확인.
- commit/push: 없음.

## 2026-10-09 — EC2 종료 완료 증빙 반영

- 요청: 실습 EC2 종료 상태 화면 제공.
- 변경 파일: README.md, docs/cleanup-checklist.md, docs/screenshots/README.md, WORK_LOG.md. 추가: docs/screenshots/14-ec2-terminated-2026-10-09.png.
- 확인: 첨부에서 i-0636b2e10b12c0414 종료됨, ap-northeast-2a 및 공개 IPv4 미표시 확인. 원본 파일명 시각 19:24:28 KST이며 실제 종료 시각은 미제공.
- 핵심 작업: 대상 EC2 종료만 완료 처리. 이전 실행·접속 화면은 과거 검증 자료로 보존. EBS 자동 삭제 설정을 실제 삭제 확인으로 간주하지 않음.
- 검증: 바탕화면 5082x1154 원본을 첨부 크기와 대조 후 복사, 바이트 일치 통과. AWS 직접 종료 실행 없음.
- 미해결·다음: 서울 리전 EBS 볼륨 목록에서 vol-072179f1dd199aa87 삭제 확인, EIP 및 네트워크 정리 근거 확보.
- commit/push: 없음.

## 2026-10-09 — 종료 후 EBS 검색 결과 보관

- 요청: 대상 EBS 검색 결과 화면 제공.
- 변경: README.md, docs/cleanup-checklist.md, docs/screenshots/README.md, WORK_LOG.md. 추가: docs/screenshots/15-ebs-not-found-2026-10-09.png.
- 확인: vol-072179f1dd199aa87 검색에서 일치하는 볼륨 없음. 화면에는 리전이 표시되지 않으며 다른 미사용 실습 볼륨 여부는 이 필터로 확인할 수 없음. 체크리스트 EBS 전체 정리 완료 표시는 유지 보류.
- 검증: 4642x760 바탕화면 원본 크기 대조 및 복사 바이트 일치 통과. AWS 직접 조회·삭제 없음.
- 다음: 서울 리전 선택 상태 확인, 필터 지우고 남은 볼륨 목록 확보. 이후 Elastic IP 확인 및 네트워크 정리.
- commit/push: 없음.

## 2026-10-09 — 탄력적 IP 빈 목록 확인

- 요청: 탄력적 IP 목록 화면 제공.
- 변경: README.md, docs/cleanup-checklist.md, docs/screenshots/README.md, WORK_LOG.md. 추가: docs/screenshots/16-elastic-ip-empty-2026-10-09.png.
- 확인: 검색 조건 없는 목록에 이 리전에서 탄력적 IP 주소를 찾을 수 없음 표시. 리전 이름은 캡처에 없으므로 서울 확인 전 완료 체크 보류. 대상 없음 화면을 릴리스 실행 증빙으로 표현하지 않음.
- 검증: 바탕화면 4640x516 원본을 찾아 첨부 크기와 대조 후 복사, 바이트 일치 통과. AWS 직접 조회·변경·삭제 없음.
- 미해결·다음: 서울 리전 선택 확인 및 EBS 전체 목록 확보 후 보안 그룹·서브넷·라우팅·IGW·VPC 정리 근거 확보.
- commit/push: 없음.

## 2026-10-09 — 서울 리전 탄력적 IP 증빙 보강

- 요청: 리전 표시가 포함된 새 사진이 더 적합한지 확인.
- 변경: docs/screenshots/16-elastic-ip-empty-2026-10-09.png 교체, README.md, docs/screenshots/README.md, docs/cleanup-checklist.md, WORK_LOG.md.
- 확인: 상단 아시아 태평양(서울), 검색 조건 없는 목록 및 탄력적 IP 주소 없음이 함께 표시되어 서울 리전 할당 없음 확인 완료. Release는 해당 없음이며 실행한 것으로 표현하지 않음.
- 검증: 바탕화면 5036x708 원본 크기 대조, 교체 후 바이트 일치 통과. 기존 잘린 사진의 원본은 바탕화면에 보존. AWS 직접 조회·변경 없음.
- 미해결·다음: 서울 리전이 보이는 필터 없는 EBS 전체 목록 확보, 나머지 네트워크 자원 정리.
- commit/push: 없음.

## 2026-10-09 — 서울 리전 EBS 정리 완료 확인

- 요청: 서울 리전과 전체 볼륨 목록이 보이는 사진 확인.
- 변경: docs/screenshots/15-ebs-not-found-2026-10-09.png 교체, README.md, docs/screenshots/README.md, docs/cleanup-checklist.md, WORK_LOG.md.
- 확인: 아시아 태평양(서울) 표시, 검색 필터 없음 및 현재 이 리전에 볼륨 없음 확인. 종료 전 기록한 루트 EBS를 포함하여 서울 리전 잔여 볼륨 없음으로 EBS 정리 항목 완료 처리.
- 검증: 5112x656 바탕화면 원본 크기 대조 및 교체 바이트 일치 통과. AWS 직접 조회·삭제 없음.
- 미해결·다음: SG·Subnet·사용자 RT·IGW·VPC 등 나머지 정리와 정리 후 Billing 확인.
- commit/push: 없음.

## 2026-10-09 — 보안 그룹 이름 검색 결과 보관

- 요청: 보안 그룹 검색 화면 제공.
- 변경: README.md, docs/cleanup-checklist.md, docs/screenshots/README.md, WORK_LOG.md. 추가: docs/screenshots/17-security-group-not-found-2026-10-09.png.
- 확인: mission-web-sg 검색 결과 No matching resource found. 캡처에 리전 표시가 없고 정확한 ID 검색이 아니므로 실제 대상 삭제 완료 체크는 보류.
- 검증: 5104x774 바탕화면 원본 크기 대조 후 복사·바이트 일치 확인. AWS 직접 조회·삭제 없음.
- 다음: 서울 리전 표시와 sg-0fe3c165848b4918b 검색 결과가 함께 보이는 화면 확인. 이후 서브넷·사용자 RT·IGW·VPC 정리.
- commit/push: 없음.

## 2026-10-09 — 보안 그룹 검색 화면 리전 확인

- 요청: 상단 리전이 보이는 보안 그룹 검색 사진 제공.
- 변경: docs/screenshots/17-security-group-not-found-2026-10-09.png 교체, README.md, docs/screenshots/README.md, docs/cleanup-checklist.md, WORK_LOG.md.
- 확인: 서울 리전 표시 및 mission-web-sg 이름 검색 결과 없음. 정확한 ID 검색은 아직 아니므로 대상 ID 확인만 남김.
- 검증: 5120x944 원본 크기 대조, 교체 바이트 일치 통과. AWS 직접 조회·삭제 없음.
- 다음: 보안 그룹 ID sg-0fe3c165848b4918b 필터로 빈 결과 확인 후 SG 삭제 완료 반영.
- commit/push: 없음.

## 2026-10-09 — 보안 그룹 삭제 완료 확인

- 요청: 서울 리전 및 정확한 SG ID 검색 결과 화면 제공.
- 변경: docs/screenshots/17-security-group-not-found-2026-10-09.png 교체, README.md, docs/screenshots/README.md, docs/cleanup-checklist.md, WORK_LOG.md.
- 확인: 서울 리전에서 sg-0fe3c165848b4918b 검색 결과 No matching resource found. 기존 대상 삭제 확인 완료 처리. 최초 SG 규칙 증빙은 유지.
- 검증: 바탕화면 5120x940 원본 크기 대조 및 교체 바이트 일치, git diff --check 통과. AWS 직접 조회·삭제 없음.
- 미해결·다음: 실습 서브넷 subnet-02395a2ae539a0a0b 및 사용자 RT·IGW·VPC 정리 근거 확보. 추가 생성 자원과 정리 후 Billing 확인도 남음.
- commit/push: 없음.

## 2026-10-09 — 실습 서브넷 삭제 완료 확인

- 요청: 서브넷 삭제 결과 화면 제공.
- 변경: README.md, docs/cleanup-checklist.md, docs/screenshots/README.md, WORK_LOG.md. 추가: docs/screenshots/18-subnet-deleted-2026-10-09.png.
- 확인: 서울 리전 표시, subnet-02395a2ae539a0a0b 삭제 완료 배너 및 같은 ID 검색 결과 없음. 서브넷 삭제 항목 완료 처리. 삭제 전 라우팅 연결 증빙은 유지.
- 검증: 바탕화면 5112x730 원본 대조, 복사 후 바이트 일치 및 수정 문서 로컬 링크 존재 확인·git diff --check 통과. 원본 파일명 시각 20:00:13 KST, 실제 삭제 실행 시각은 별도 미제공. AWS 직접 삭제 없음.
- 미해결·다음: 사용자 라우팅 테이블 rtb-0993a814677ceaebd, IGW 및 VPC 정리. 추가 자원 유무·키페어 정리·정리 후 Billing 확인.
- commit/push: 없음.

## 2026-10-09 — 실습 라우팅 테이블 삭제 완료 확인

- 요청: 라우팅 테이블 삭제 결과 화면 제공.
- 변경: README.md, docs/cleanup-checklist.md, docs/screenshots/README.md, WORK_LOG.md. 추가: docs/screenshots/19-route-table-deleted-2026-10-09.png.
- 확인: 서울 리전, rtb-0993a814677ceaebd / mission-public-rt 삭제 완료 배너 및 ID 검색 결과 없음. 하단 선택 상세 화면은 남아 있지만 완료 배너와 목록을 기준으로 삭제 확인. 기본=아니요 표시도 확인.
- 검증: 바탕화면 5104x1470 원본 크기 대조, 복사 바이트 일치 및 문서 로컬 링크·git diff --check 통과. AWS 직접 삭제 실행 없음.
- 미해결·다음: IGW igw-00282b3ebdefbbd81 분리 및 삭제, VPC 삭제, 추가 생성 자원·키페어 및 정리 후 Billing 확인.
- commit/push: 없음.

## 2026-10-09 — IGW 분리 과정과 삭제 완료 기록

- 요청: IGW 분리 과정도 삭제 결과와 함께 기록.
- 변경: README.md, docs/cleanup-checklist.md, docs/screenshots/README.md, WORK_LOG.md. 추가: docs/screenshots/20-igw-detached-2026-10-09.png, 21-igw-deleted-2026-10-09.png.
- 확인: 서울 리전에서 igw-00282b3ebdefbbd81 / mission-igw 분리 완료 배너·Detached·VPC ID 없음, 후속 같은 ID 삭제 완료 배너 확인. 체크리스트 IGW 분리 및 삭제 모두 완료 처리.
- 핵심 설명: 분리는 VPC 연결 해제이며 자체 삭제와 다름. 두 단계를 사진별로 설명. 삭제 후 목록의 igw-0bb4c1cb8483fbf59는 다른 VPC에 연결된 별도 자원으로 실습 삭제 대상에서 제외.
- 검증: 바탕화면 원본 5112x1022·4978x748 대조, 복사 바이트 일치 및 수정 문서 링크 존재·git diff --check 통과. 원본 파일명 시각 20:08:42·20:09:52 KST, 실제 실행 시각은 별도 미제공. AWS 직접 변경·삭제 없음.
- 미해결·다음: 실습 VPC vpc-0e10021fd1a09e0ea 삭제, 추가 생성 자원·키페어 및 정리 후 Billing 확인.
- commit/push: 없음.

## 2026-10-09 — 실습 VPC 삭제 완료 확인

- 요청: VPC 삭제 결과 화면 제공.
- 변경: README.md, docs/cleanup-checklist.md, docs/screenshots/README.md, WORK_LOG.md. 추가: docs/screenshots/22-vpc-deleted-2026-10-09.png.
- 확인: 정확한 실습 ID vpc-0e10021fd1a09e0ea / mission-vpc 삭제 완료 배너를 근거로 완료 처리. 캡처에는 리전 이름이 보이지 않지만 정확한 대상 삭제 성공 배너가 있음. 목록의 vpc-0f1675ad64967b330은 다른 기본 VPC이며 유지. 하단 선택 화면의 Available을 현재 실습 VPC 잔존 근거로 오해하지 않도록 설명.
- 검증: 바탕화면 5120x1630 원본 크기 대조, 복사 바이트 일치·수정 문서 링크·git diff --check 통과. AWS 직접 삭제 실행 없음.
- 미해결·다음: NAT Gateway·ELB/ALB·RDS 등 추가 생성 자원 유무 확인, 실습 키페어·불필요 권한 정리, 정리 후 Billing 재확인. 해당 항목은 아직 완료 처리하지 않음.
- commit/push: 없음.

## 2026-10-09 — 실습 키 페어 삭제 완료 확인

- 요청: 키 페어 삭제 결과 화면 제공.
- 변경: README.md, docs/cleanup-checklist.md, docs/screenshots/README.md, WORK_LOG.md. 추가: docs/screenshots/23-key-pair-deleted-2026-10-09.png.
- 확인: 서울 리전, 키 페어 1개 삭제 완료 배너 및 mission-key 필터의 표시할 키 페어 없음. 키 페어 삭제 완료 반영. 기존 복합 체크리스트를 키페어 삭제와 IAM 권한 정리로 나누어 IAM은 미확인 유지.
- 검증: 5120x762 원본 대조 및 복사 바이트 일치, 수정 문서 로컬 링크·git diff --check 통과. AWS 직접 변경·삭제 없음.
- 미해결·다음: NAT Gateway·ELB/ALB·RDS 등 추가 실습 자원 유무 및 정리 후 Billing 확인. IAM 사용자/정책은 재사용 여부 확인 후 불필요 권한 정리 판단. 로컬 개인키 파일은 이번 작업에서 삭제하지 않음.
- commit/push: 없음.

## 2026-10-09 — 주요 리소스 정리 후 Billing 재확인

- 요청: 현재 청구서 사진이 필요한 자료인지 확인.
- 변경: README.md, docs/cleanup-checklist.md, docs/screenshots/README.md, WORK_LOG.md. 추가: docs/screenshots/24-billing-after-cleanup-2026-10-09.png.
- 확인: 페이지 새로고침 2026-10-09 20:18:45 KST, 10월 결제 기간·예상 총계 USD 0.00·대기 중 및 무료 플랜 배너. 서울 리전 지출 USD 0.19도 표시. 주요 자원 삭제 후 Billing 확인 항목 완료 처리하되 최종 월 청구액과 사용량 반영 완료는 미확정으로 설명.
- 검증: 5090x1840 바탕화면 원본 대조, 복사 바이트 일치·수정 문서 링크·git diff --check 통과. AWS 직접 조회·변경 없음.
- 미해결·다음: 추가 실습 NAT Gateway·ELB/ALB·RDS·스냅샷 생성 유무와 불필요 IAM 권한 확인, 최종 제출 준비. Billing 사진은 과제 선택 증빙이며 자원별 삭제 근거를 대신하지 않음.
- commit/push: 없음.

## 2026-10-09 — 추가 자원 미생성 사용자 확인

- 요청: 앞서 질문한 추가 자원을 만든 적 없다고 확인.
- 변경: README.md, docs/cleanup-checklist.md, WORK_LOG.md.
- 핵심 작업: NAT Gateway·로드 밸런서·RDS·스냅샷을 이번 실습에서 생성하지 않았다는 사용자 진술 반영. 조건부 정리 항목은 해당 없음으로 완료 표시하고 근거가 사용자 확인임을 명시. AWS 목록 직접 조회로 표현하지 않음.
- 검증: 기존 기록 및 체크리스트 대조, git diff --check 통과. AWS 자원 조회·변경·삭제 없음.
- 미해결·다음: 실습 IAM 사용자·정책 재사용 여부 및 불필요 권한 정리 판단, 최종 문서 검토와 제출. 주요 실습 자원 삭제와 정리 후 Billing 재확인은 증빙 확보 완료.
- commit/push: 없음.

## 2026-10-09 — 서울 리전 NAT Gateway 빈 목록 보강

- 요청: 서울 리전으로 바꾼 NAT Gateway 목록 화면 제공.
- 변경: README.md, docs/cleanup-checklist.md, docs/screenshots/README.md, WORK_LOG.md. 추가: docs/screenshots/25-nat-gateway-empty-2026-10-09.png.
- 확인: 서울 리전 표시, 검색 조건 없음, VPC 미선택 상태에서 NAT 게이트웨이를 찾을 수 없음. NAT Gateway 항목을 사용자 미생성 확인에 더하여 현재 서울 목록의 잔여 자원 없음 근거로 보강. 이전 미국 버지니아 북부 사진은 서울 증빙으로 사용하지 않음.
- 검증: 바탕화면 5108x1020 원본 크기 대조·복사 바이트 일치·수정 문서 로컬 링크·git diff --check 통과. AWS API 직접 조회·변경 없음.
- 다음: 다른 추가 자원은 사용자 미생성 확인으로 유지. 최종 제출 문서 검토 및 IAM 권한 재사용 판단. 추가 목록 캡처는 보강 자료이며 미션 필수 제출 규격은 아님.
- commit/push: 없음.

## 2026-10-09 — 로드 밸런서 없음 선택 증빙 보관

- 요청: 로드 밸런서 목록 사진도 필요한지 확인.
- 변경: README.md, docs/screenshots/README.md, docs/cleanup-checklist.md, WORK_LOG.md. 추가: docs/screenshots/26-load-balancer-empty-2026-10-09.png.
- 확인: 필터 없는 목록에 ap-northeast-2 로드 밸런서 없음 표시. 사용자 미생성 확인에 현재 서울 리전 목록 증빙을 보강. 필수 제출 사진으로 요구하지 않음.
- 검증: 5118x1518 바탕화면 원본 크기 대조·복사 바이트 일치·git diff --check 통과. AWS 조회·변경 없음.
- 다음: RDS·스냅샷은 사용자 미생성 확인 상태 유지. 추가 사진은 선택이며 최종 제출 검토 및 IAM 재사용 판단 남음.
- commit/push: 없음.

## 2026-10-09 — 미션 요구사항 기준 제출 파일 최종 정리

- 요청: 파일들을 미션 요구사항에 맞게 정리.
- 변경: README.md, docs/screenshots/README.md, docs/cleanup-checklist.md, docs/troubleshooting.md, iam/README.md, WORK_LOG.md.
- 핵심 작업: 필수 제출물 4종 안내와 실제 정리 완료 상태 통일. README의 종료 전 URL·현재 서버 삭제 상태·실습 당시 구성·파일 구조·필수/보조 자료 구분 명시. 기존 사진별 설명과 이미지 표시 유지. 증빙 목록을 PNG 25개 전체의 시점·확인 범위를 담은 단일 표로 재정리. 오래된 추가 확보 안내와 완료 대기 문구 수정.
- 체크리스트: 주요 자원 종료/삭제 및 해당 없음 근거 유지, 사용자 진술과 목록 확인 구분. 과제에서 요구하지 않는 IAM 권한 재사용 판단을 필수 정리 표 밖 선택 후속 관리로 이동하여 완료 여부를 왜곡하지 않음. 트러블슈팅 참고 명령과 IAM 적용 안내는 종료된 실습 환경 기준으로 갱신.
- 보존: 사용자 실습 원본 docs/work-log.md, 미션 요구사항 원문, 아키텍처·모든 증빙 사진·정책 JSON 보존. 구성도 육안 확인에서 VPC·Subnet·IGW·SG·EC2 및 HTTP/SSH 흐름 확인. 구성도의 과거 IP는 README에서 설명.
- 검증: 필수 파일 존재·A 방식과 주소·트러블슈팅 6단계·필수 정리 표 완료/해당 없음 확인. 모든 Markdown 로컬 링크 통과. 증빙 PNG 25장 해시 중복 없음, README 이미지 26개(구성도 포함) 각각 한 번 표시 확인. IAM JSON 파싱 및 서울 조건, bash -n, git diff --check 통과. 원문 두 파일 해시 확인. AWS 원격 검증은 서버 종료 상태라 실행하지 않음.
- 미해결·다음: Git/GitHub 업로드 및 과제 제출은 미실행. 선택 후속 IAM 권한 판단 및 월 최종 Billing 확인. RDS·스냅샷 미생성은 사용자 진술 범위 유지.
- AWS 변경 및 commit/push: 없음.

## 2026-10-09 — 남은 제출 작업 확인

- 요청: 추가로 해야 할 작업 확인.
- 변경: README.md의 오래된 상단 미정리 상태를 현재 확인 결과로 갱신, WORK_LOG.md.
- 확인: 필수 제출물 4종과 주요 자원 삭제 증빙 확보. 체크리스트 미확인은 보조 IAM 권한 정리 판단 한 항목. 미션은 IAM 사용자·정책 삭제 자체를 필수 제출 조건으로 요구하지 않음. RDS·스냅샷 미생성은 사용자 확인 기준 유지.
- 명령·결과: 현재 README·체크리스트·작업 기록 및 git status 조회. commit/push 미실행 확인.
- 다음: 최종 제출 자료·민감정보 검토와 Git/GitHub 업로드 및 제출. IAM 재사용 판단과 추후 Billing 확인은 보조 후속 작업.
- AWS 변경 및 commit/push: 없음.

## 2026-10-09 — 증빙 원본 위치 통합

- 요청: 바탕화면 스크린샷을 B3-1/docs/screenshots로 이동.
- 변경: WORK_LOG.md 및 원본 위치 정리. 증빙 파일명·README 링크 유지.
- 작업: 바탕화면과 사진 증빙 폴더에서 기존 제출 증빙과 해시 및 바이트가 일치하는 원본 25개를 확인. 목적지에 동일 파일이 이미 있어 중복 생성 없이 원본 위치의 복사본을 제거하여 증빙 폴더로 통합. 증빙 사진 25장은 그대로 보존.
- 검증: 원본 제거 전 목적지 바이트 일치, 증빙 25장 존재 및 모든 Markdown 로컬 링크 통과.
- 제외: 기존 증빙과 일치하지 않는 바탕화면 사진 24개는 다른 화면·초기 캡처일 수 있어 그대로 유지. 사용자 폴더 자체는 삭제하지 않음.
- 다음: Git/GitHub 업로드와 제출. AWS 작업 및 commit/push 없음.

## 2026-10-09 — 남은 바탕화면 사진 24장 검토

- 요청: 필요 없는 사진이 있는지 확인.
- 변경: WORK_LOG.md만 추가. 사진 삭제·이동 및 README 수정 없음.
- 검토: 바탕화면 PNG 24장을 육안으로 확인하고 기존 제출 증빙과 비교. 파일 바이트 중복과 별개로 같은 화면의 전체 캡처·다른 자르기·이전 상태를 구분.
- 보관 추천: 오후 6.58.37 IAM 정책 서울 리전 조건 요약, 8.02.01 라우팅 테이블 연결로 인한 삭제 차단, 8.04.09 서브넷 연결 없음, 8.07.54 IGW 분리 전 Attached 상태. 기존 완료 사진과 다른 설정·과정 증빙이며 추가 제출은 선택.
- 정리 후보: 나머지 20장. 6.58.30은 추천 IAM 사진의 전체 화면, 7.30.06·7.30.58·8.17.10은 작은 실수 캡처, 8.25.45는 IDE 파일 목록, 8.21.51은 미국 버지니아 북부 NAT 목록으로 서울 증빙에 부적합. 나머지는 기존 제출 사진으로 대체 가능.
- 검증: view_image로 24장 확인. Pillow 연락판 생성 시도는 모듈 부재로 실패하여 개별 이미지 검토로 완료. EBS 화면의 스냅샷 요약 0/0은 스냅샷 전체 목록 부재 증빙으로 해석하지 않음.
- 다음: 사용자 삭제 요청이 있으면 보관 추천 4장과 제출 증빙을 보존하고 정리 후보 처리. Git/GitHub 업로드·과제 제출 미실행. AWS 변경 및 commit/push 없음.

## 2026-10-09 20:34 KST — 프로젝트 내부 스크린샷 관련성 확인

- 요청: B3-1 내부에 미션과 상관없는 스크린샷이 있는지 확인.
- 변경: WORK_LOG.md 기록만 추가. 사진 삭제 없음.
- 검증: rg --files로 이미지 목록 확인, docs/screenshots/README.md 설명과 대조. 증빙 PNG 25장과 구성도 1장 모두 미션 관련 자료. 바탕화면의 정리 후보 20장은 프로젝트 내부 파일이 아님.
- 판단: 07-external-access.png와 11-billing-summary-2026-10-09.png는 최신 증빙이 있어 생략 가능한 과거 자료. NAT·로드 밸런서 빈 목록은 선택 보강 자료이며 무관한 사진은 아님.
- 다음: 현재 증빙 유지 가능. Git/GitHub 업로드·제출 미실행. AWS 변경 및 commit/push 없음.

## 2026-10-09 20:33 KST — 미션 무관 사진 삭제 대상 확인

- 요청: B3-1 내부에서 미션과 상관없는 사진 삭제.
- 변경: WORK_LOG.md만 추가.
- 결과: 숨김 파일을 포함한 이미지 목록을 재확인했으며 구성도 1장과 증빙 25장 모두 미션 관련 자료로 삭제 대상 0장. 과거 접속·과금 사진과 선택 보강 증빙도 관련 자료이므로 보존.
- 검증: rg --files --hidden 이미지 목록과 직전 관련성 검토 대조. 사진 삭제 및 README 링크 변경 없음.
- 다음: Git/GitHub 업로드·제출 미실행. AWS 변경 및 commit/push 없음.

## 2026-10-09 — 미션 검토 결과 세 가지 문서 수정

- 요청: 직전 검토에서 발견한 불일치 수정.
- 변경: README.md, docs/cleanup-checklist.md, iam/README.md, WORK_LOG.md.
- 작업: README 요구사항 표의 진행 중·VPC 정리 대기를 실제 완료 상태로 수정. 체크리스트에서 서브넷 삭제를 실습 RT 삭제 앞에 배치하여 캡처 순서 반영. IAM 설명에서 보관되지 않은 업데이트 성공 메시지와 실제 기본 버전 본문 동일성 단정을 제거하고 사용자 JSON·버전 화면·API 미검증을 구분.
- 검증: 전체 Markdown 로컬 링크 정상, git diff --check 통과. 최초 편집 명령은 입력 인코딩 오류로 실행 전 실패했으며 UTF-8 선언 후 수정 완료.
- 보존: 원본 작업 로그·미션 요구사항·정책 JSON·증빙 사진 변경 없음.
- 미해결·다음: 실제 IAM 기본 버전 본문은 API로 조회하지 않음. Git/GitHub 업로드와 제출 미실행. AWS 변경 및 commit/push 없음.

## 2026-10-09 — 발표용 README 구성 개편

- 요청: README를 보면서 다른 사람에게 미션을 설명할 수 있도록 앞서 제안한 순서로 수정.
- 변경: README.md, WORK_LOG.md.
- 작업: 목표·성공 화면 → 구조·요청 흐름 → 보안 그룹과 IAM → 단계별 검증 → 트러블슈팅 → 정리와 과금 → 제출 자료 순서로 본문 구성. 각 절에 읽을 수 있는 짧은 발표 문장과 역할·결과 표 추가. 구성도·외부 접속·보안 그룹·터미널 사진을 해당 설명 옆에 배치.
- 보존: 기존 상세 구성·요구사항 대응·사진별 설명·과금 내역·파일 구성은 마지막 접기 영역에 유지. 사진 25장 전체 참조 유지, 원본 파일 변경·삭제 없음. 최초/재개 시점·현재 서버 삭제·IAM 검증 한계·IPv6 원인 미확정·월 최종 청구 미확정 구분 유지.
- 검증: 전체 Markdown 로컬 링크 정상, 모든 증빙 PNG 25장 README 참조 확인, details 태그 쌍 및 A 방식/URL 확인, git diff --check 통과.
- 미해결·다음: Git/GitHub 업로드와 과제 제출 미실행. 실제 IAM 기본 버전 본문/API 동작 시험 없음. AWS 변경 및 commit/push 없음.

## 2026-10-09 20:46 KST — 실습 기준 평가문항 답변 작성

- 요청: 제공한 평가문항 사진에 대한 답을 실제 수행한 미션에 맞춰 별도 파일 작성.
- 추가: docs/evaluation-answers.md. 변경: WORK_LOG.md. README 및 기존 증빙 변경 없음.
- 작업: 항목 1~4의 17개 질문과 항목 5 보너스 답변 작성. 실제 설정·명령·결과·대상별 근거 링크를 포함하고 발표용 짧은 답변 제공. 장애 점검·IAM 권한 진단·ALB 확장·비용 추적은 가정 상황으로 구분.
- 검증: 질문 17개 및 보너스 절 존재, 새 문서 로컬 링크 정상, git diff --check 통과. 네트워크·IAM·ALB 설명은 AWS 공식 문서 검색 결과와 대조하고 해당 답변에 출처 연결.
- 한계 유지: 현재 서버 삭제, IAM 기본 버전 본문/API 미검증, 최초 HTTPS 지연 원인 미확정, RDS·스냅샷 사용자 진술, 보너스 미구현, 최종 평가 및 최종 청구액 미확정.
- 다음: 발표 연습과 Git/GitHub 업로드·과제 제출. AWS 변경 및 commit/push 없음.

## 2026-10-09 20:48 KST — 최종 파일 및 문서 검토

- 요청: B3-1 내부 불필요 파일과 수정할 부분 확인.
- 변경: WORK_LOG.md 기록만 추가. 파일 삭제 및 제출 문서 수정 없음.
- 검증: 숨김 포함 파일 목록·git status·문서 대조. 필수 제출물 존재, 전체 Markdown 로컬 링크 정상, PNG 25장 SHA-256 중복 없음, 정책 JSON 파싱 및 bash -n·git diff --check 통과. 개인키 파일·본문·AWS 액세스 키 패턴 후보 없음(완전한 민감정보 감사를 의미하지 않음).
- 개선 후보: README 파일 구조와 참고 목록에 새 evaluation-answers.md 누락. iam/README.md의 기존 정책 리전 제한 부재 문장은 현재 보관 JSON만으로 과거를 입증하지 못하므로 이력 근거 명시 또는 현재 JSON 설명으로 정리 권장. cleanup-checklist.md의 정리 후 Free Tier 사용량 재확인 완료 표현은 당시 Billing 캡처 범위보다 넓으므로 Billing 확인으로 축소 권장.
- 파일 판단: 필수 외 불필요한 파일로 확정할 대상 없음. 오래된 접속·정리 전 청구 사진, HTML 재현본·검증 스크립트는 선택 참고 자료로 유지 가능. docs/work-log.md는 오래된 원본 상태를 유지하고 WORK_LOG.md와 역할 구분.
- 다음: 위 소규모 문서 개선 여부 결정 및 Git/GitHub 업로드·과제 제출. 미추적 파일이 많아 제출 시 새 증빙·문서를 포함해야 함. AWS 변경 및 commit/push 없음.

## 2026-10-09 20:49 KST — 최종 검토 보완사항 반영

- 요청: 직전 최종 검토의 세 가지 개선사항 수정.
- 변경: README.md, iam/README.md, docs/cleanup-checklist.md, WORK_LOG.md.
- 작업: README 파일 구성 및 참고 링크에 evaluation-answers.md 추가. IAM의 근거 불명확한 과거 리전 제한 설명을 현재 보관 JSON의 서울 조건 설명으로 교체. 체크리스트 완료 항목을 정리 후 Billing 확인으로 좁혀 사진 범위와 일치시킴.
- 검증: 모든 Markdown 로컬 링크 및 git diff --check 통과. 사진·정책 JSON·원본 기록 삭제/변경 없음.
- 미해결·다음: Git/GitHub 업로드와 과제 제출 미실행. 월 최종 Billing은 추후 확인. AWS 변경 및 commit/push 없음.

## 2026-10-09 — 현재 제출 상태 GitHub 업로드

- 요청: 현재 B3-1 상태 그대로 업로드, 의도한 삭제 반영 확인 후 계속 진행 승인.
- 대상: origin https://github.com/dooolll00/B3-1.git, main 브랜치.
- 작업: 문서·평가 답변·요구사항·증빙 추가와 기존 승인된 불필요 파일 삭제를 함께 커밋. 제출 문서 내용 및 사진 추가 수정 없음.
- 검증: git fetch 성공, 커밋 전 HEAD와 origin/main 차이 0/0, git diff --check 통과. 기존 최종 검토의 링크·JSON·스크립트 검증 결과 유지.
- 커밋 메시지: docs: complete B3-1 AWS mission and cleanup evidence.
- push: 아래 커밋 후 origin/main에 실행 예정이며 실제 결과는 후속 기록으로 남김.
- 다음: 업로드 결과 확인 및 과제 제출. AWS 자원 변경 없음.

## 2026-10-09 — 업로드 시도 결과

- 실습 제출 변경 커밋: 6e0760e, docs: complete B3-1 AWS mission and cleanup evidence.
- push 실패: HTTPS GitHub 사용자 인증을 읽을 수 없음(could not read Username / Device not configured). gh 명령 미설치, Git credential helper는 osxkeychain. 인증 정보 출력·변경 없음.
- 현재: 제출 변경은 로컬 커밋 완료, GitHub 업로드 미완료. 이 결과 기록도 별도 로컬 커밋으로 보관.
- 다음: 사용자가 GitHub 인증 가능한 터미널 또는 IDE에서 main을 push. AWS 변경 없음.
