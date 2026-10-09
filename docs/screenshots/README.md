# 증빙 목록

필수 외부 접속 증빙은 **A 방식**의 [2026-10-09 브라우저 사진](07-external-access-2026-10-09.png)입니다. 나머지 사진은 설정·검증·과금·정리 근거를 보강합니다. 모든 사진은 원본을 보관했으며, 촬영 시점의 결과로 해석합니다.

구성도는 [architecture.png](../architecture.png), 사진별 설명은 [프로젝트 README](../../README.md), 종료·삭제 판단은 [정리 체크리스트](../cleanup-checklist.md)를 참고합니다.

| 시점 | 파일 | 확인 범위 |
|---|---|---|
| 2026-09-09 | [03-route-table.png](03-route-table.png) | 라우팅·명시적 서브넷 연결 |
| 최초 실습 | [04-security-group.png](04-security-group.png) | HTTP 80 공개·SSH 22 /32 제한 |
| 2026-10-09 | [05-ec2-running-2026-10-09.png](05-ec2-running-2026-10-09.png) | EC2 실행 중·3/3 통과 |
| 2026-09-09 | [06-localhost-test.png](06-localhost-test.png) | Nginx active·내부 GET 200·외부 HTTPS 200 |
| 최초 실습 | [07-external-access.png](07-external-access.png) | A 방식·이전 주소 43.201.48.130 |
| 2026-10-09 | [07-external-access-2026-10-09.png](07-external-access-2026-10-09.png) | 필수 외부 접속·A 방식·3.35.53.2 |
| 2026-09-09 | [08-iam-user-2026-09-09.png](08-iam-user-2026-09-09.png) | IAM 사용자 정책 연결 |
| 2026-10-09 | [09-iam-default-version-2026-10-09.png](09-iam-default-version-2026-10-09.png) | 정책 버전 2 기본값 |
| 2026-10-09 | [10-free-tier-2026-10-09.png](10-free-tier-2026-10-09.png) | 무료 플랜·잔액 USD 93.28 |
| 2026-10-09 | [11-billing-summary-2026-10-09.png](11-billing-summary-2026-10-09.png) | 정리 전 10월 예상 총계 USD 0.00 |
| 2026-10-09 | [12-billing-details-2026-10-09.png](12-billing-details-2026-10-09.png) | EBS USD 0.19 크레딧 상쇄 |
| 2026-10-09 | [13-ebs-before-cleanup-2026-10-09.png](13-ebs-before-cleanup-2026-10-09.png) | 종료 전 EBS ID·8 GiB·종료 시 삭제=예 |
| 2026-10-09 | [14-ec2-terminated-2026-10-09.png](14-ec2-terminated-2026-10-09.png) | EC2 종료됨 |
| 2026-10-09 | [15-ebs-not-found-2026-10-09.png](15-ebs-not-found-2026-10-09.png) | 서울·필터 없는 EBS 전체 목록 비어 있음 |
| 2026-10-09 | [16-elastic-ip-empty-2026-10-09.png](16-elastic-ip-empty-2026-10-09.png) | 서울·EIP 할당 없음 |
| 2026-10-09 | [17-security-group-not-found-2026-10-09.png](17-security-group-not-found-2026-10-09.png) | 서울·정확한 SG ID 검색 결과 없음 |
| 2026-10-09 | [18-subnet-deleted-2026-10-09.png](18-subnet-deleted-2026-10-09.png) | 서울·서브넷 삭제 완료 |
| 2026-10-09 | [19-route-table-deleted-2026-10-09.png](19-route-table-deleted-2026-10-09.png) | 서울·실습 RT 삭제 완료 |
| 2026-10-09 | [20-igw-detached-2026-10-09.png](20-igw-detached-2026-10-09.png) | 서울·IGW 분리 완료·Detached |
| 2026-10-09 | [21-igw-deleted-2026-10-09.png](21-igw-deleted-2026-10-09.png) | 서울·IGW 삭제 완료 |
| 2026-10-09 | [22-vpc-deleted-2026-10-09.png](22-vpc-deleted-2026-10-09.png) | 실습 VPC ID 삭제 완료 배너 |
| 2026-10-09 | [23-key-pair-deleted-2026-10-09.png](23-key-pair-deleted-2026-10-09.png) | 서울·mission-key 삭제 완료 |
| 2026-10-09 | [24-billing-after-cleanup-2026-10-09.png](24-billing-after-cleanup-2026-10-09.png) | 정리 후 20:18:45 KST·예상 총계 USD 0.00 |
| 2026-10-09 | [25-nat-gateway-empty-2026-10-09.png](25-nat-gateway-empty-2026-10-09.png) | 서울·NAT Gateway 없음 |
| 2026-10-09 | [26-load-balancer-empty-2026-10-09.png](26-load-balancer-empty-2026-10-09.png) | 서울·로드 밸런서 없음 |

## 해석 범위

- 최초 실습과 재개 시점 IP를 구분합니다. 현재 서버는 종료되어 접속 검증을 다시 실행하지 않습니다.
- 터미널의 중간 SSH 개인키 경고는 EC2 내부에서 재접속을 시도한 기록이며 앞뒤 curl 성공과 구분합니다. 개인키 내용은 포함되지 않습니다.
- IAM 세부 권한은 [정책 JSON](../../iam/MissionCloudInfrastructurePolicy.json)으로 확인합니다. 기본 버전 화면에는 본문이 펼쳐져 있지 않습니다.
- 삭제 성공 배너와 대상 ID를 기준으로 확인합니다. 삭제 직후 하단에 남은 선택 정보는 현재 자원 목록과 구분합니다.
- RDS·스냅샷 미생성은 사용자 확인 기준이며 해당 목록 캡처는 없습니다. NAT Gateway·로드 밸런서는 서울 리전 빈 목록을 추가 확인했습니다.
- Billing은 확인 시점의 예상 청구액이며 월 최종 청구액이나 모든 사용량 반영 완료를 확정하지 않습니다.
