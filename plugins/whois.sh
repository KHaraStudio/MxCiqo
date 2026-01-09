#!/bin/bash
# DESC: WHOIS domain checker

target="$1"
[ -z "$target" ] && { echo "Usage: MxCiqo whois <domain>"; exit 1; }

command -v whois >/dev/null 2>&1 || {
  echo "whois belum terinstall"
  exit 1
}

whois "$target" | sed -n '
/Domain Name:/p
/Registrar:/p
/Creation Date:/p
/Updated Date:/p
/Registry Expiry Date:/p
/Name Server:/p
'
