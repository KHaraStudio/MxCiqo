#!/bin/bash
# DESC: HTTP status & headers

main() {
  url="$1"
  [ -z "$url" ] && { echo "Usage: MxCiqo http <url>"; exit 1; }
  curl -I --max-time 3 "$url"
}