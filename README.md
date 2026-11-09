# Productivity

Portable, general-purpose productivity skills for Claude Code and Codex:
handoff documents another agent can pick up, a relentless interview that
stress-tests the user's plan, monitors and watchdogs that run outside the chat,
plain-language explanations with no decisions attached, the agent's own pile of
findings walked back to the user one small decision at a time, big efforts
charted as decision tickets on the issue tracker, research from primary
sources, throwaway prototypes, a living glossary with decision records, and
authoring new skills. Nothing here is tied to one person, machine, or workflow.

## Skills

| Skill | What it does | Requires |
| --- | --- | --- |
| `handoff` | Compacts the current conversation into a handoff document, saved to the OS temp folder, that a fresh agent can pick up; references existing artifacts instead of copying them and redacts secrets. | Nothing beyond the agent. |
| `grill-me` | Interviews the user about a plan or design one question at a time, each with a recommended answer, until every branch of the decision tree is resolved. | Nothing beyond the agent. |
| `watch` | Stands up a monitor, heartbeat, or overnight babysitter outside the current chat (clock-aligned ticks, explicit done and abort conditions, notify only on change) and launches long jobs fail-fast through a plan, preflight, canary, and ramp. | bash (Linux, macOS, or Git Bash on Windows) for the bundled scripts. |
| `explain` | Explains one thing in plain language with no decisions attached: the subject as observed, the mechanism, every term translated, one everyday comparison, then a dialogue that gets smaller when it does not land. Nothing is changed. | Nothing beyond the agent. |
| `untangle` | Turns the agent's own pile (findings, options, jargon, a status dump) into small plain-language decisions walked one per turn, each with a recommendation, with what is already decided kept apart from what is open. | Nothing beyond the agent. |
| `wayfinder` | Charts a piece of work too big for one session as a shared map on the issue tracker: a map issue naming the destination, child tickets that each resolve one decision, native blocking between them, and a fog-of-war section for what cannot be ticketed yet; later sessions work it one ticket at a time. User-invoked only. | An issue tracker the agent can create, label, assign, link, and close issues on (falls back to local markdown). |
| `research` | Sends a background agent to investigate a question against primary sources and write one cited markdown file where the project keeps its notes, or to a connected memory tool when there is no repository. | A background agent facility; otherwise nothing beyond the agent. |
| `prototype` | Builds a throwaway prototype that answers one design question: a single-file HTML demo of a state model, several UI variants on one route, or for non-code work a rough draft of the artifact itself. No persistence, no polish, captured on a throwaway branch when done. | A project to sit next to; the UI branch uses the project's task runner. |
| `domain-modeling` | Sharpens the project's domain model while designing: challenges and resolves terms into `GLOSSARY.md` as they land, stress-tests relationships with concrete scenarios, and records hard-to-reverse trade-offs as ADRs. | A project folder for the glossary and ADRs. |
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
