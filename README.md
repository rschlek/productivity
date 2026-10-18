# Productivity

Portable, general-purpose productivity skills for Claude Code and Codex:
handoff documents another agent can pick up, a relentless interview that
stress-tests the user's plan, monitors and watchdogs that run outside the chat,
explain-before-fix briefs, the agent's own pile of findings walked back to the
user one small decision at a time, authoring new skills, and rewriting a task
into the deeper version a top professional would ask for. Nothing here is
tied to one person, machine, or workflow.

## Skills

| Skill | What it does | Requires |
| --- | --- | --- |
| `handoff` | Compacts the current conversation into a handoff document, saved to the OS temp folder, that a fresh agent can pick up; references existing artifacts instead of copying them and redacts secrets. | Nothing beyond the agent. |
| `grill-me` | Interviews the user about a plan or design one question at a time, each with a recommended answer, until every branch of the decision tree is resolved. | Nothing beyond the agent. |
| `watch` | Stands up a monitor, heartbeat, or overnight babysitter outside the current chat (clock-aligned ticks, explicit done and abort conditions, notify only on change) and launches long jobs fail-fast through a plan, preflight, canary, and ramp. | bash (Linux, macOS, or Git Bash on Windows) for the bundled scripts. |
| `explain` | Explains a problem or topic before anything changes: the problem as observed, the mechanism, and when a change is pending the options with trade-offs and one recommendation, then waits for the user's go. | Nothing beyond the agent. |
| `untangle` | Turns the agent's own pile (findings, options, jargon, a status dump) into small plain-language decisions walked one per turn, each with a recommendation, with what is already decided kept apart from what is open. | Nothing beyond the agent. |
| `write-a-skill` | Authors a new skill (a `SKILL.md` plus optional bundled files) that is portable, concise, in a generic voice, with a trigger-rich description, and reviews it with the user against a checklist. | Nothing beyond the agent. |
| `deepen` | Rewrites a task into a deeper version, not a bigger one: what a top professional would add, the rawest material to start from, the methods and tools, and an outside check on the result, then waits for the user's go. | Nothing beyond the agent. |

## Platform notes

- `watch` runs its watchers outside the chat: a background subagent where the
  harness has one, a detached `scripts/watchdog.sh`, or a scheduler entry
  (cron, Task Scheduler). Its scripts need bash and the standard `date`,
  `stat`, and `tail` tools.
- The other skills are prose only and work the same everywhere.

## Install

From a catalog that lists this plugin, install `productivity` from it. To
install this repository directly:

```bash
# Claude Code
claude plugin marketplace add https://github.com/rschlek/productivity.git
claude plugin install productivity@productivity

# Codex
codex plugin marketplace add https://github.com/rschlek/productivity.git
codex plugin add productivity@productivity
```

A local checkout works the same way: pass its folder to `marketplace add`.
Start a new session afterwards.

## License

MIT; see [LICENSE](LICENSE).
