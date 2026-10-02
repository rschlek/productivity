# watch

- Maintainer: the productivity plugin maintainers
- Submitted: 2026-10-02

Stands up a monitor, heartbeat, or overnight babysitter outside the current
chat, from a five-line contract (check, interval, done, abort, notify), with
ticks aligned to the clock and notifications only on a change of state. Long
jobs launch through a fail-fast ladder (`LAUNCH.md`): plan, preflight, a
one-unit canary that asserts on real output, a short ramp, then the full run
under the bundled `scripts/watchdog.sh`.

## Prerequisites

bash (Linux, macOS, or Git Bash on Windows) with `date`, `stat`, and `tail`
for the bundled scripts. A background subagent, a detached process, or a
scheduler (cron, Task Scheduler) to run the watcher in.
