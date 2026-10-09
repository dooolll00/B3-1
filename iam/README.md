# 사용자 제공 IAM 정책 검토

## 보관한 증빙

- [IAM 사용자 정책 연결](../docs/screenshots/08-iam-user-2026-09-09.png): mission-cloud-user에 실습 정책 및 IAMUserChangePassword 직접 연결 확인.
- [2026-10-09 정책 버전](../docs/screenshots/09-iam-default-version-2026-10-09.png): 버전 2 기본값 확인. 화면에서 본문은 펼쳐져 있지 않습니다.
- [정책 JSON](MissionCloudInfrastructurePolicy.json): 사용자가 재제공한 내용과 동일하며 EC2 Action·서울 리전 조건 포함. 사용자 연결 화면만으로 모든 작업의 로그인 주체나 유효 권한 전체를 증명하지는 않습니다.

MissionCloudInfrastructurePolicy.json은 사용자가 제공한 서울 리전 조건 포함 정책을 보관한 파일입니다. JSON에서 aws:RequestedRegion = ap-northeast-2 조건을 확인할 수 있고, 보관한 정책 버전 화면에서는 버전 2가 기본값임을 확인할 수 있습니다. 버전 화면에 JSON 본문이 펼쳐져 있지 않아 이 사진만으로 버전 2의 본문이 보관한 JSON과 동일하다고 확인할 수는 없습니다. AWS API로 정책 본문을 조회하거나 권한 동작을 시험하지 않았습니다.

- 모든 Action은 EC2 API이며 VPC·Subnet·IGW·Route·SG·EC2 생성/관리 및 정리 중심입니다. S3/RDS 권한이나 Action 전체 허용은 없습니다.
- 사용자 화면에는 이 정책과 IAMUserChangePassword 두 개가 직접 연결되어 있고 권한 경계는 미설정입니다. AdministratorAccess는 목록에 보이지 않습니다.
- 보관한 정책 JSON의 해당 Statement는 서울 리전 요청만 허용합니다. Resource *는 유지되어 서울의 다른 EC2/VPC 자원도 나열된 작업의 대상입니다(다른 정책의 제한은 별도).
- 보관한 JSON의 제한: Condition / StringEquals / aws:RequestedRegion: ap-northeast-2. 다른 정책이 부여하는 권한을 명시적으로 거부하는 정책은 아닙니다.
- 리소스 제한을 더 강화하려면 조회·생성·수정/삭제를 분리하고 API별 지원에 맞춰 ARN/태그 조건을 설계해야 합니다. Resource *를 VPC ARN 하나로 일괄 치환하지 않습니다.
- IAMUserChangePassword는 본인 비밀번호 변경 등을 위한 AWS 관리형 정책이며 관리자 전체 권한이 아닙니다.
- 이번 검증은 JSON 구문과 제공 문서의 정적 검토입니다. 정책 시뮬레이터나 AWS API 권한 테스트는 수행하지 않았습니다.

공식 참고: [EC2 리전 조건](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-policies-for-amazon-ec2.html), [IAMUserChangePassword](https://docs.aws.amazon.com/aws-managed-policy/latest/reference/IAMUserChangePassword.html).

## 적용 이력 및 참고 방법

실습 당시 적용 경로는 IAM → 정책 → MissionCloudInfrastructurePolicy → 편집 → JSON에서 같은 폴더의 MissionCloudInfrastructurePolicy.json 전체 내용을 붙여넣고 검토·저장합니다. 새 정책 버전이 기본 버전으로 설정됐는지 확인합니다. 정책 편집 권한이 없으면 이 정책을 관리하는 권한 소유자가 반영해야 합니다. 보관한 사용자 화면에서는 버전 2의 기본값 표시를 확인했습니다. 서울 리전 조건은 사용자 제공 JSON 기준이며, 업데이트 성공 메시지는 현재 보관한 증빙 목록에 포함되어 있지 않습니다. 실제 기본 버전의 본문 조회와 AWS API를 통한 권한 동작 시험은 수행하지 않았습니다.

실습 서버·네트워크는 정리 완료했습니다. 현재 정책 재적용은 제출 준비에 필요하지 않습니다. 사용자·정책의 재사용 또는 권한 제거 여부는 선택 후속 관리입니다.
