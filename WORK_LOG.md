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
