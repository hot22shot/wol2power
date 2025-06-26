#!/bin/sh

if [ $# -ne 1 ]; then
  echo "Usage: $0 <MAC>  # formats: aa:bb:cc:dd:ee:ff  aa-bb-cc-dd-ee-ff  aabbccddeeff" >&2
  exit 1
fi

MAC_RAW=$(printf '%s' "$1" | tr -d ':-' | tr '[:upper:]' '[:lower:]')

if [ ${#MAC_RAW} -ne 12 ] || echo "$MAC_RAW" | grep -q '[^0-9a-f]'; then
  echo "Invalid MAC: $1" >&2
  exit 1
fi

PREFIX=$'\xff\xff\xff\xff\xff\xff'
T=$PREFIX
i=0
while [ $i -lt 12 ]; do
  byte=${MAC_RAW:$i:2}
  T="$T"$(printf "\\x$byte")
  i=$((i+2))
done
export T

exec socat -u UDP4-RECVFROM:9,reuseaddr,fork \
  SYSTEM:"dd bs=1 count=102 2>/dev/null | grep -Fq \"\$T\" && /root/power_script.sh"
