#!/bin/bash
# DESC: Website speed test

url="$1"
[ -z "$url" ] && { echo "Usage: MxCiqo speedtest <url>"; exit 1; }

case "$url" in
  http://*|https://*) ;;
  *) url="https://$url" ;;
esac

echo "[*] Testing: $url"
echo

curl -L -o /dev/null -s -w \
"DNS Lookup   : %{time_namelookup}s\n\
Connect      : %{time_connect}s\n\
TLS Handshake: %{time_appconnect}s\n\
TTFB         : %{time_starttransfer}s\n\
Total Time   : %{time_total}s\n\
Download     : %{speed_download} bytes/sec\n\
HTTP Code    : %{http_code}\n" \
"$url"
