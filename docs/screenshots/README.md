# 증빙 이미지 현황

채팅에서 아래 자료를 확인했습니다. 아키텍처, 보안 그룹, Hello Cloud Mission 외부 접속 원본을 저장했습니다. 나머지 화면은 아직 이 폴더에 저장하지 않았습니다.

| 채팅에서 확인한 자료 | 저장할 경로 | 확인 범위 |
|---|---|---|
| 라우팅 규칙 | 03-route-table.png (원본 저장 대기) | 기본 경로 → IGW 활성, VPC local 경로 활성 |
| 서브넷 연결 | 03-subnet-association.png (원본 저장 대기) | mission-public-subnet 10.0.1.0/24 명시적 연결 |
| 보안 그룹 화면 | 04-security-group.png (저장 완료) | HTTP 80 전체 허용, SSH 22 /32 제한 |
| 서버 검증 터미널 | 06-localhost-test.png (원본 저장 대기) | Ubuntu에서 Nginx active, 내부 GET 200·본문, 외부 HTTPS HEAD 200 확인 |
| EC2 목록 | 05-ec2-running.png | 서울 AZ·t3.micro·실행 중·공개 IP. 촬영 당시 상태 검사는 초기화 중 |
| Hello Cloud Mission 브라우저 | 07-external-access.png (저장 완료) | A 방식 · http://43.201.48.130 · 사용자 지정 페이지 표시 성공 |
| 사용자 아키텍처 | ../architecture.png (저장 완료) | VPC·Subnet·SG·IGW·EC2와 요청 흐름 |

프로젝트의 ../architecture.png는 사용자가 제공한 원본 구성도를 수정 없이 복사한 파일입니다.

추가 권장: 01-vpc.png, 02-subnet.png, 03-route-table.png, 06-localhost-test.png 및 IAM 실제 정책 화면. 개인정보·비밀값은 포함하지 않습니다.
