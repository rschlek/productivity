#!/usr/bin/env bash
# next-tick.sh INTERVAL_MIN [--at]
# Prints the number of seconds from now until the next wall-clock boundary that
# is a multiple of INTERVAL_MIN minutes past the hour (e.g. 15 -> :00/:15/:30/:45).
# With --at, prints the boundary time (HH:MM) instead.
# Never "N seconds from now": the delay is always measured from the real clock,
# so a loop that overruns simply lands on the following boundary.
set -euo pipefail
iv=${1:-}
[[ -z "$iv" || ! "$iv" =~ ^[0-9]+$ || "$iv" -lt 1 ]] && { echo "usage: next-tick.sh INTERVAL_MIN [--at]" >&2; exit 2; }
mode=${2:-}
# one clock read so epoch and H:M:S agree (separate date calls drift on slow shells)
IFS=: read -r now H M S < <(date +%s:%H:%M:%S)
# seconds since midnight local
sod=$(( 10#$H * 3600 + 10#$M * 60 + 10#$S ))
step=$(( iv * 60 ))
next=$(( (sod / step + 1) * step ))
delay=$(( next - sod ))
if [[ "$mode" == "--at" ]]; then
  date -d "@$(( now + delay ))" +%H:%M 2>/dev/null || date -r $(( now + delay )) +%H:%M
else
  echo "$delay"
fi
