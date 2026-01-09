#!/bin/bash
# DESC: IP tracker full (ISP, timezone, proxy)

ip="$1"
[ -z "$ip" ] && { echo "Usage: MxCiqo iptracker <ip>"; exit 1; }

json=$(curl -s "http://ip-api.com/json/$ip?fields=status,message,query,country,regionName,city,zip,lat,lon,timezone,isp,org,as,proxy,hosting" | tr -d '\n')

echo "$json" | grep -q '"status":"success"' || {
  echo "Lookup failed"
  exit 1
}

extract() {
  echo "$json" | sed -n "s/.*\"$1\":\(\"[^\"]*\"\|[^,}]*\).*/\1/p" | tr -d '"'
}

echo "IP        : $(extract query)"
echo "Country   : $(extract country)"
echo "Region    : $(extract regionName)"
echo "City      : $(extract city)"
echo "ZIP       : $(extract zip)"
echo "Latitude  : $(extract lat)"
echo "Longitude : $(extract lon)"
echo "Timezone  : $(extract timezone)"
echo "ISP       : $(extract isp)"
echo "Org       : $(extract org)"
echo "ASN       : $(extract as)"
echo "Proxy     : $(extract proxy)"
echo "Hosting   : $(extract hosting)"
