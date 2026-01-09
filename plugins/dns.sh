#!/bin/bash
# DESC: DNS lookup (DoH via Cloudflare)

domain="$1"
[ -z "$domain" ] && { echo "Usage: MxCiqo dns <domain>"; exit 1; }

curl -s "https://cloudflare-dns.com/dns-query?name=$domain&type=A" \
  -H "accept: application/dns-json" \
| grep -oE '"data":"[0-9.]+"' \
| head -n1 \
| cut -d'"' -f4
