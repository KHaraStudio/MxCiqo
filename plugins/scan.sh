#!/bin/bash
# DESC: TCP port scan

main() {
  target="$1"
  [ -z "$target" ] && { echo "Usage: MxCiqo scan <ip/domain>"; exit 1; }

  for port in 21 22 80 443 3306 8080; do
    timeout 1 bash -c "echo >/dev/tcp/$target/$port" 2>/dev/null &&
      echo "[OPEN] $port"
  done
}