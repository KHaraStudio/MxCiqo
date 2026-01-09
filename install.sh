#!/data/data/com.termux/files/usr/bin/bash
set -e

APP="MxCiqo"
BASE="$HOME/.MxCiqo"
BIN="$PREFIX/bin/$APP"

DEPS=(curl whois dnsutils)

echo "[*] Checking dependencies..."
for pkg in "${DEPS[@]}"; do
  if ! command -v "${pkg%%utils}" >/dev/null 2>&1 && ! command -v "$pkg" >/dev/null 2>&1; then
    echo "[+] Installing $pkg"
    pkg install -y "$pkg"
  fi
done

echo "[*] Installing files..."
mkdir -p "$BASE/home" "$BASE/plugins"
cp -r . "$BASE"

chmod +x "$BASE/$APP"
chmod +x "$BASE/plugins/"*.sh 2>/dev/null || true
chmod +x "$BASE/home/"*.sh 2>/dev/null || true

ln -sf "$BASE/$APP" "$BIN"

echo "[✓] Installed MxCiqo (Termux)"
echo "→ Ketik: MxCiqo --help"