# Productivity

A small set of general tools for Claude Code and Codex, usable in any agent
process: monitors and watchdogs that run outside the chat, authoring new
skills, and handoff documents another agent can pick up. Nothing here is tied
to one person, machine, or workflow.

Version 2.0.0 moved the planning and workflow skills to the
[playbook](https://github.com/rschlek/playbook) plugin: `wayfinder`,
`grill-me`, `research`, `prototype`, and `untangle` live there under the same
names, and `domain-modeling` lives there as `glossary`. `explain` was retired.

## Skills

| Skill | What it does | Requires |
| --- | --- | --- |
| `handoff` | Compacts the current conversation into a handoff document, saved to the OS temp folder, that a fresh agent can pick up; references existing artifacts instead of copying them and redacts secrets. | Nothing beyond the agent. |
| `watch` | Stands up a monitor, heartbeat, or overnight babysitter outside the current chat (clock-aligned ticks, explicit done and abort conditions, notify only on change) and launches long jobs fail-fast through a plan, preflight, canary, and ramp. | bash (Linux, macOS, or Git Bash on Windows) for the bundled scripts. |
| `write-a-skill` | Authors a new skill (a `SKILL.md` plus optional bundled files) that is portable, concise, in a generic voice, with a trigger-rich description, and reviews it with the user against a checklist. | Nothing beyond the agent. |

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
