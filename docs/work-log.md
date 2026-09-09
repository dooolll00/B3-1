# AWS Cloud Infrastructure 작업 로그

## 1. 프로젝트 목표

AWS 서울 리전(`ap-northeast-2`)에서 VPC, Public Subnet, Internet Gateway, Route Table, Security Group, EC2를 직접 구성하고 Nginx 웹 서버를 실행하여 외부 브라우저에서 접속 가능한 웹 서비스를 구축한다.

---

## 2. IAM 및 리전 설정

- 실습용 IAM 사용자: `mission-cloud-user`
- Root 계정이 아닌 별도 IAM 사용자로 실습 진행
- 관리자 전체 권한(`AdministratorAccess`)을 사용하지 않고 EC2/VPC/Security Group 실습에 필요한 범위로 권한 제한
- AWS Region: Asia Pacific (Seoul) / `ap-northeast-2`

---

## 3. VPC 생성

- 이름: `mission-vpc`
- CIDR: `10.0.0.0/16`
- VPC ID: `vpc-0e10021fd1a09e0ea`
- 결과: 생성 완료

---

## 4. Public Subnet 생성

- 이름: `mission-public-subnet`
- CIDR: `10.0.1.0/24`
- Availability Zone: `ap-northeast-2a`
- Subnet ID: `subnet-02395a2ae539a0a0b`
- EC2 생성 시 Public IPv4 자동 할당 사용
- 결과: 생성 완료

---

## 5. Internet Gateway 생성 및 연결

- 이름: `mission-igw`
- Internet Gateway ID: `igw-00282b3ebdefbbd81`
- 연결 대상: `mission-vpc`
- 상태: Attached
- 결과: 연결 완료

---

## 6. Route Table 구성

- 이름: `mission-public-rt`
- Route Table ID: `rtb-0993a814677ceaebd`
- 연결 Subnet: `mission-public-subnet`

라우팅 규칙:

```text
10.0.0.0/16 → local
0.0.0.0/0   → mission-igw
```

- 결과: Public Subnet에서 Internet Gateway로 외부 통신 가능한 경로 구성 완료

---

## 7. Security Group 구성

- 이름: `mission-web-sg`
- Security Group ID: `sg-0fe3c165848b4918b`

Inbound Rules:

```text
HTTP / TCP / 80 → 0.0.0.0/0
SSH  / TCP / 22 → My IP (/32)
```

Outbound Rules:

```text
All traffic → 0.0.0.0/0
```

- 모든 포트를 인터넷 전체에 개방하지 않음
- SSH는 지정된 사용자 IP에서만 허용
- 결과: 설정 완료

---

## 8. Network ACL 확인

- Network ACL ID: `acl-0863745d086008a2b`
- `mission-public-subnet`에 연결된 기본 Network ACL 확인
- 기본 허용 규칙 확인
- 별도의 불필요한 NACL 수정은 하지 않음

---

## 9. EC2 인스턴스 생성

- 이름: `mission-web-server`
- Instance ID: `i-0636b2e10b12c0414`
- Instance Type: `t3.micro`
- OS: Ubuntu Server 26.04 LTS
- Availability Zone: `ap-northeast-2a`
- Storage: 8 GiB gp3
- Key Pair: `mission-key`
- Security Group: `mission-web-sg`
- Private IPv4: `10.0.1.211`
- Public IPv4: `43.201.48.130`
- 상태 검사: `3/3 검사 통과`
- 결과: 실행 완료

---

## 10. SSH 접속

Mac에서 개인 키 권한 설정:

```bash
chmod 400 ~/mission-key.pem
```

SSH 접속:

```bash
ssh -i ~/mission-key.pem ubuntu@43.201.48.130
```

결과:

```text
ubuntu@ip-10-0-1-211:~$
```

- EC2 SSH 접속 성공
- `.pem` 개인 키 내용은 저장소나 문서에 포함하지 않음

---

## 11. EC2 외부 인터넷 연결 확인

### 11-1. IPv4 네트워크 확인

실행:

```bash
ping -c 4 8.8.8.8
```

결과:

```text
4 packets transmitted, 4 received, 0% packet loss
```

→ EC2에서 외부 IPv4 인터넷 통신 정상 확인

### 11-2. DNS 확인

실행:

```bash
getent hosts example.com
```

결과 예시:

```text
2606:4700:10::6814:179a example.com
2606:4700:10::ac42:93f3 example.com
```

→ DNS 이름 해석 정상 확인

### 11-3. HTTP/HTTPS 외부 접속 확인

처음 실행:

```bash
curl https://example.com
```

증상:

- 응답이 바로 출력되지 않아 중단함

IPv4를 명시하여 재확인:

```bash
curl -4 https://example.com
```

결과:

```text
Example Domain
```

→ IPv4를 이용한 외부 인터넷 접속 정상 확인

이 과정은 `docs/troubleshooting.md`에 별도로 정리한다.

---

## 12. 패키지 목록 업데이트

실행:

```bash
sudo apt update
```

결과:

- Ubuntu 패키지 저장소에서 패키지 목록 정상 다운로드
- 외부 통신 정상 재확인

---

## 13. Nginx 설치

실행:

```bash
sudo apt install nginx -y
```

결과:

- `nginx`
- `nginx-common`

정상 설치 완료

---

## 14. Nginx 실행 상태 확인

실행:

```bash
sudo systemctl status nginx
```

확인 결과:

```text
Active: active (running)
```

→ Nginx 서비스 정상 실행 확인

---

## 15. EC2 내부 웹 서버 테스트

실행:

```bash
curl -I http://localhost
```

결과:

```text
HTTP/1.1 200 OK
Server: nginx/1.28.3 (Ubuntu)
```

→ EC2 내부에서 Nginx가 HTTP 200 응답을 반환함을 확인

---

## 16. 외부 브라우저 접속 테스트

외부 접속 증빙 방식:

- **A 방식: 웹 브라우저에서 Public IPv4로 접속**

접속 주소:

```text
http://43.201.48.130
```

초기 결과:

- `Welcome to nginx!` 페이지 정상 표시

→ 인터넷 → Internet Gateway → Public Subnet → Security Group → EC2 → Nginx 통신 성공

---

## 17. 사용자 웹 페이지 적용

EC2에서 실행:

```bash
echo '<h1>Hello Cloud Mission</h1><p>AWS EC2 + VPC + Nginx</p>' | sudo tee /var/www/html/index.html
```

브라우저에서 다시 접속하여 다음 내용 확인:

```text
Hello Cloud Mission
AWS EC2 + VPC + Nginx
```

→ 사용자 지정 웹 페이지 외부 접속 성공

외부 접속 증빙 스크린샷 파일명:

```text
07-external-access.png
```

---

## 18. 아키텍처 구성

아키텍처에 포함하는 주요 구성 요소:

```text
External User
     ↓ HTTP :80
Internet
     ↓
Internet Gateway (mission-igw)
     ↓
VPC (mission-vpc / 10.0.0.0/16)
     ↓
Public Subnet (mission-public-subnet / 10.0.1.0/24)
     ↓
Security Group (mission-web-sg)
     ↓
EC2 (mission-web-server)
     ↓
Nginx :80
```

Security Group 정책:

```text
HTTP 80 → 0.0.0.0/0
SSH 22  → My IP only
```

제출 파일:

```text
docs/architecture.png
```

---

## 19. 제출용 프로젝트 구조

최종적으로 다음과 같은 구조로 정리한다.

```text
cloud-mission/
├── README.md
└── docs/
    ├── architecture.png
    ├── troubleshooting.md
    ├── cleanup-checklist.md
    ├── work-log.md
    └── screenshots/
        ├── 01-vpc.png
        ├── 02-subnet.png
        ├── 03-route-table.png
        ├── 04-security-group.png
        ├── 05-ec2-running.png
        ├── 06-localhost-test.png
        └── 07-external-access.png
```

---

## 20. 현재 완료 상태

- [x] IAM 실습 사용자 사용
- [x] 서울 리전 사용
- [x] VPC 생성
- [x] Public Subnet 생성
- [x] Internet Gateway 생성 및 VPC 연결
- [x] Route Table 구성
- [x] `0.0.0.0/0 → IGW` 경로 확인
- [x] Security Group 구성
- [x] HTTP 80 외부 허용
- [x] SSH 22 사용자 IP로 제한
- [x] EC2 생성
- [x] Public IPv4 할당
- [x] SSH 접속
- [x] EC2 외부 인터넷 통신 확인
- [x] Nginx 설치
- [x] Nginx 실행 상태 확인
- [x] `localhost` HTTP 200 확인
- [x] 외부 브라우저 접속 성공
- [x] 사용자 지정 웹 페이지 표시 성공
- [x] 외부 접속 증빙 확보
- [x] Architecture 작성 준비
- [x] Troubleshooting 문서 작성
- [ ] Cleanup Checklist 작성
- [ ] README 최종 작성
- [ ] 모든 증빙 파일 정리
- [ ] Git/GitHub 업로드
- [ ] 제출 자료 확인 후 AWS 리소스 정리

---

## 21. Cleanup 시 주의사항

**제출용 스크린샷과 문서를 모두 확보하기 전에는 AWS 리소스를 삭제하지 않는다.**

최종 제출 자료를 확인한 뒤 다음 항목을 점검한다.

```text
EC2
EBS Volume
Elastic IP (생성한 경우)
Security Group
Route Table
Subnet
Internet Gateway
VPC
```

Internet Gateway는 VPC에서 분리(Detach)한 후 삭제한다.

EC2는 단순 Stop이 아니라 최종적으로 Terminate 여부를 확인한다.

---

## 22. 보안 주의사항

다음 정보는 GitHub 또는 제출 문서에 올리지 않는다.

- AWS Root 비밀번호
- IAM 비밀번호
- AWS Access Key / Secret Access Key
- MFA 코드
- `mission-key.pem` 내용 또는 개인 키 파일
- 결제 정보

Public IPv4와 리소스 구성 정보는 과제 증빙에 필요한 범위에서만 사용한다.
