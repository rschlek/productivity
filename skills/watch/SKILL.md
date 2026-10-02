---
name: watch
description: Stand up a monitor, heartbeat, or overnight babysitter OUTSIDE the current chat - clock-aligned ticks, explicit stop and abort conditions, notify-only-on-change - and launch long jobs fail-fast under that watchdog. Use when the user wants something watched, polled, babysat, or checked "every N minutes", when a job will run longer than ~30 minutes unattended, or when the agent is about to put a sleep/poll loop or a recurring tick inside the main session. Do NOT use for a one-off status check (just run it) or for scheduling human reminders.
---

# watch

A monitor that lives inside the chat eats context on every tick, forces
compactions, and hallucinates state across them. A monitor that lives outside
the chat costs nothing until something happens. This skill always picks the
second.

## Procedure

1. **Write the watch contract** (five lines, confirm with the user if any is a guess):
   - **Check**: one command whose output decides state (bounded: `--tail`, `--since`, `2>/dev/null`).
   - **Interval**: proportional to the job - a 5-minute task gets 1-minute ticks, an overnight run 15-30. Ticks land on the clock (`:00/:05/:10` for 5-min, `:00/:30` for 30-min), never "N seconds from now".
   - **Done**: the condition that ends the watch successfully.
   - **Abort**: conditions that kill the job and escalate - no successful unit in N minutes, error rate above X%, output file not growing, projected finish past the budget.
   - **Notify**: where state changes go (push, message, file) - and *only* state changes. Silence means healthy.
2. **Launching a job too?** Follow [LAUNCH.md](LAUNCH.md) first: preflight, one-unit canary with a real-output assertion, ~5-unit ramp for rate and ETA, then the full run. "It started" is never a checkpoint.
3. **Pick the venue - never the main session.** The bundled scripts `scripts/watchdog.sh` and `scripts/next-tick.sh` live in this skill's folder and are always called by absolute path (that folder plus `scripts/...`), never a relative one; `scripts/...` below is shorthand for those paths.
   - *Runs while this session is open, result wanted back here*: a background subagent on a small, cheap model running `scripts/watchdog.sh`; the main session receives exactly one notification when it stops.
   - *Outlives the session / overnight*: `scripts/watchdog.sh` detached on the host nearest the job (`setsid nohup ... > log 2>&1 < /dev/null &`), or a scheduler entry (cron / Task Scheduler) with an aligned expression such as `0,15,30,45 * * * *`. Never a relative `*/30` started at an odd minute, never a sleep loop in the chat.
   - A self-re-arming wakeup inside the chat is acceptable only for short, few-tick watches on a **2-minute-or-coarser grid**; then every delay is `scripts/next-tick.sh <interval-min>` from the real clock, computed in the same turn as the call and aimed ~5s short of the boundary (the clock moves between computing a delay and the call landing, and drift always pushes the landing late), and the wakeup carries a "resolved - do not redo" ledger in a *file*, not in the prompt. A 1-minute watch does not go in the chat at all - in-chat wakeups are rounded up to the next whole minute, so a 1-minute grid cannot be held; give it a background subagent or `scripts/watchdog.sh`.
4. **Hand the watcher its brief**: the contract, the log path, the notify command. The watcher reports state changes and the final verdict; it does not narrate healthy ticks.
5. **Close out**: on done or abort, the watcher stops itself, preserves partial output and the log, notifies once, and the main session records the outcome.

## Rules the scripts enforce so nobody re-derives them

- Ticks are computed from the real clock to the next boundary; an overrun skips to the following boundary rather than firing late.
- Every status line carries the wall-clock time from `date`, progress `n/total`, marginal rate, and ETA.
- No busy-wait in the chat (`sleep N && cmd`, `until [ $SECONDS -ge ... ]`).
- Never overwrite a running script in place; copy to a temp path and `mv`.

## Quick start

```sh
# W = the absolute path of this skill's folder
# seconds until the next 15-minute boundary
"$W/scripts/next-tick.sh" 15

# watch a job: check every 10 min on the clock, done when the marker file exists,
# abort if the log hasn't grown in 30 min, notify via a command
"$W/scripts/watchdog.sh" --interval 10 \
  --check 'tail -n 5 /tmp/job.log' \
  --done  'test -f /tmp/job.done' \
  --stall-file /tmp/job.log --stall-min 30 \
  --max-min 480 \
  --notify 'curl -s -d "$WATCH_MSG" https://notify.example/topic' \
  --log /tmp/job.watch.log
```

Run the watchdog with `--help` (same absolute path) for every flag; see [LAUNCH.md](LAUNCH.md) for the fail-fast launch ladder.
