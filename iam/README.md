# 사용자 제공 IAM 정책 검토

MissionCloudInfrastructurePolicy.json은 사용자 제공 정책에 서울 리전 조건을 추가한 적용용 파일입니다. 사용자가 AWS 콘솔에서 저장한 뒤 제공한 화면에서 업데이트 성공 메시지와 aws:RequestedRegion = ap-northeast-2 조건을 확인했습니다. Codex가 AWS API로 직접 변경하거나 권한 동작을 시험한 것은 아닙니다.

- 모든 Action은 EC2 API이며 VPC·Subnet·IGW·Route·SG·EC2 생성/관리 및 정리 중심입니다. S3/RDS 권한이나 Action 전체 허용은 없습니다.
- 사용자 화면에는 이 정책과 IAMUserChangePassword 두 개가 직접 연결되어 있고 권한 경계는 미설정입니다. AdministratorAccess는 목록에 보이지 않습니다.
- 기존 제공 정책은 리전 제한이 없었습니다. 수정 파일은 서울 리전에서만 해당 Statement가 허용됩니다. Resource *는 유지되어 서울의 다른 EC2/VPC 자원도 나열된 작업의 대상입니다(다른 정책의 제한은 별도).
- 적용한 변경: Condition / StringEquals / aws:RequestedRegion: ap-northeast-2 추가. 기존 Action 및 Resource는 유지했습니다. 다른 정책이 부여하는 권한을 명시적으로 거부하는 정책은 아닙니다.
- 리소스 제한을 더 강화하려면 조회·생성·수정/삭제를 분리하고 API별 지원에 맞춰 ARN/태그 조건을 설계해야 합니다. Resource *를 VPC ARN 하나로 일괄 치환하지 않습니다.
- IAMUserChangePassword는 본인 비밀번호 변경 등을 위한 AWS 관리형 정책이며 관리자 전체 권한이 아닙니다.
- 이번 검증은 JSON 구문과 제공 문서의 정적 검토입니다. 정책 시뮬레이터나 AWS API 권한 테스트는 수행하지 않았습니다.

공식 참고: [EC2 리전 조건](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-policies-for-amazon-ec2.html), [IAMUserChangePassword](https://docs.aws.amazon.com/aws-managed-policy/latest/reference/IAMUserChangePassword.html).

## AWS 콘솔에 반영

IAM → 정책 → MissionCloudInfrastructurePolicy → 편집 → JSON에서 같은 폴더의 MissionCloudInfrastructurePolicy.json 전체 내용을 붙여넣고 검토·저장합니다. 새 정책 버전이 기본 버전으로 설정됐는지 확인합니다. 정책 편집 권한이 없으면 이 정책을 관리하는 권한 소유자가 반영해야 합니다. 현재는 사용자 제공 권한 탭의 업데이트 성공 메시지 및 JSON 조건을 확인한 상태입니다. 후속 사용자 화면에서 버전 2의 기본값 표시를 확인했습니다. 서울 리전 조건을 포함한 새 정책 버전이 기본 버전입니다. AWS API를 통한 권한 동작 시험은 수행하지 않았습니다.
