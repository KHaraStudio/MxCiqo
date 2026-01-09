#!/bin/bash
# DESC: Password-protected passive leak finder (white-hat)

# ===== CONFIG =====
PASSWORD="khara-whitehat"   # ganti sendiri
TIMEOUT=8
COMMON_PATHS=(
  ".env"
  ".git/config"
  ".git/HEAD"
  "backup.zip"
  "backup.tar.gz"
  "db.sql"
  "database.sql"
  "config.php"
  "wp-config.php"
  "robots.txt"
  "sitemap.xml"
)

# ===== AUTH =====
read -s -p "Password: " INPUT
echo
[ "$INPUT" != "$PASSWORD" ] && { echo "[!] Access denied"; exit 1; }

# ===== TARGET =====
URL="$1"
[ -z "$URL" ] && { echo "Usage: MxCiqo leakfinder <url>"; exit 1; }

echo "[*] Passive leak scan started"
echo "[*] Target: $URL"
echo

# ===== HEADERS =====
echo "[+] Checking security headers"
curl -Is --max-time $TIMEOUT "$URL" | egrep -i \
"server:|x-powered-by:|content-security-policy|strict-transport-security|x-frame-options|x-content-type-options" \
|| echo "  (no notable headers)"
echo

# ===== COMMON FILES =====
echo "[+] Checking common exposed files"
for p in "${COMMON_PATHS[@]}"; do
  code=$(curl -o /dev/null -s -w "%{http_code}" --max-time $TIMEOUT "$URL/$p")
  if [ "$code" = "200" ]; then
    echo "  [FOUND] /$p (HTTP 200)"
  else
    echo "  [SAFE ] /$p ($code)"
  fi
done
echo

# ===== DIRECTORY LISTING =====
echo "[+] Checking directory listing"
for d in "/" "/backup/" "/uploads/" "/old/" "/test/"; do
  body=$(curl -s --max-time $TIMEOUT "$URL$d")
  echo "$body" | grep -qi "Index of" \
    && echo "  [OPEN] Directory listing at $d" \
    || echo "  [SAFE] $d"
done
echo

echo "[✓] Scan finished"