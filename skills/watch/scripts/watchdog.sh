#!/usr/bin/env bash
# watchdog.sh - clock-aligned monitor with explicit done/abort conditions.
# Runs OUTSIDE the chat: detach it (setsid nohup ... &) or hand it to a
# background subagent. Silent while healthy; notifies only on state change.
#
# Flags:
#   --interval MIN      tick interval in minutes; ticks land on clock boundaries (default 15)
#   --check  CMD        shell command run every tick; its stdout is the status line (required)
#   --done   CMD        exit 0 => job finished successfully -> stop (optional)
#   --abort  CMD        exit 0 => abort condition met -> stop with failure (optional)
#   --stall-file PATH   abort if this file has not grown for --stall-min minutes
#   --stall-min MIN     (default 30)
#   --max-min MIN       abort if the watch has run longer than this (time budget)
#   --notify CMD        run on state change; the message is in $WATCH_MSG (optional)
#   --log PATH          append every status line here (default ./watchdog.log)
#   --on-abort CMD      run once when aborting, e.g. to stop the job (optional)
#   --once              run a single tick and exit (for canaries / dry runs)
#
# Every log line: ISO time from the real clock, state, and the check output.
set -uo pipefail
interval=15; check=""; done_cmd=""; abort_cmd=""; stall_file=""; stall_min=30
max_min=0; notify=""; log="./watchdog.log"; on_abort=""; once=0
while [[ $# -gt 0 ]]; do
  case "$1" in
    --interval) interval=$2; shift 2;;  --check) check=$2; shift 2;;
    --done) done_cmd=$2; shift 2;;      --abort) abort_cmd=$2; shift 2;;
    --stall-file) stall_file=$2; shift 2;; --stall-min) stall_min=$2; shift 2;;
    --max-min) max_min=$2; shift 2;;    --notify) notify=$2; shift 2;;
    --log) log=$2; shift 2;;            --on-abort) on_abort=$2; shift 2;;
    --once) once=1; shift;;
    -h|--help) sed -n '2,20p' "$0"; exit 0;;
    *) echo "unknown flag: $1" >&2; exit 2;;
  esac
done
[[ -z "$check" ]] && { echo "--check is required" >&2; exit 2; }
here=$(cd "$(dirname "$0")" && pwd)
start=$(date +%s); last_size=-1; last_growth=$start; state="starting"
say() { printf '%s [%s] %s\n' "$(date -Is)" "$1" "$2" | tee -a "$log"; }
notify_change() {  # $1 new state, $2 message
  [[ "$1" == "$state" ]] && return
  state=$1
  if [[ -n "$notify" ]]; then WATCH_MSG="[$state] $2" bash -c "$notify" >/dev/null 2>&1 || true; fi
}
finish() { say "$1" "$2"; notify_change "$1" "$2"; [[ "$1" == "abort" && -n "$on_abort" ]] && bash -c "$on_abort"; exit "$3"; }

say "start" "interval=${interval}m stall=${stall_min}m max=${max_min}m"
while :; do
  out=$(bash -c "$check" 2>&1 | tail -n 20); rc=$?
  now=$(date +%s); elapsed_min=$(( (now - start) / 60 ))
  say "tick" "elapsed=${elapsed_min}m rc=$rc :: ${out//$'\n'/ | }"
  if [[ -n "$done_cmd" ]] && bash -c "$done_cmd" >/dev/null 2>&1; then finish "done" "finished after ${elapsed_min}m" 0; fi
  if [[ -n "$abort_cmd" ]] && bash -c "$abort_cmd" >/dev/null 2>&1; then finish "abort" "abort condition met after ${elapsed_min}m" 1; fi
  if [[ -n "$stall_file" ]]; then
    size=$(stat -c %s "$stall_file" 2>/dev/null || stat -f %z "$stall_file" 2>/dev/null || echo 0)
    if [[ "$size" != "$last_size" ]]; then last_size=$size; last_growth=$now
    elif (( (now - last_growth) / 60 >= stall_min )); then finish "abort" "$stall_file has not grown for ${stall_min}m" 1; fi
  fi
  if (( max_min > 0 && elapsed_min >= max_min )); then finish "abort" "time budget of ${max_min}m exceeded" 1; fi
  [[ "$rc" -ne 0 ]] && notify_change "degraded" "check failed rc=$rc: ${out:0:200}" || notify_change "healthy" "ok"
  (( once )) && exit 0
  sleep "$("$here/next-tick.sh" "$interval")"   # aligned: overruns land on the next boundary
done
