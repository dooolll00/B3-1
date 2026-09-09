#!/usr/bin/env bash
# 기존 Ubuntu 서버의 상태만 조회한다. 설치·설정 변경·삭제 없음.
set -euo pipefail
cd "$(dirname "$0")/.."
key=${1:?Usage: bash scripts/verify-existing.sh /path/to/private-key public-ip}
host=${2:?Public IPv4 required}
python3 - "$host" <<'PY'
import ipaddress,sys
ip=ipaddress.ip_address(sys.argv[1])
if ip.version != 4 or not ip.is_global:
    raise SystemExit('공인 IPv4 주소가 필요합니다.')
PY
[[ -f "$key" ]] || { echo '개인키 파일이 없습니다.' >&2; exit 1; }
mkdir -p docs/evidence
log="docs/evidence/verify-$(date -u +%Y%m%dT%H%M%SZ).txt"
{
  date -u
  echo "Target: $host (user-supplied existing instance)"
  ssh -i "$key" -o ConnectTimeout=10 -o StrictHostKeyChecking=ask "ubuntu@$host" 'bash -se' <<'REMOTE'
set -euo pipefail
systemctl is-active nginx
local_code=$(curl -4 -sS --connect-timeout 5 --max-time 20 -o /dev/null -w '%{http_code}' http://localhost/)
printf 'Local GET HTTP %s\n' "$local_code"
[[ "$local_code" == 200 ]]
curl -4 -fsS --connect-timeout 5 --max-time 20 https://example.com >/dev/null
echo 'Outbound IPv4 HTTPS: PASS'
REMOTE
  tmp=$(mktemp)
  trap 'rm -f "$tmp"' EXIT
  code=$(curl -4 -sS --connect-timeout 5 --max-time 20 -o "$tmp" -w '%{http_code}' "http://$host/")
  printf 'External GET http://%s/ HTTP %s\n' "$host" "$code"
  [[ "$code" == 200 ]]
  python3 - "$tmp" <<'PY'
import sys
from pathlib import Path
body=Path(sys.argv[1]).read_text()
assert 'Hello Cloud Mission' in body, 'Expected page text missing'
print('Expected page text: PASS')
PY
  echo 'All checks: PASS'
} 2>&1 | tee "$log"
