# Agent guidance

<!-- project-guide:base start (0.7.0) -->
## Working in this repo

This repo follows the project-guide standard, version 0.7.0
(https://github.com/rschlek/project-guide). This block is replaced when the
standard updates; put project-specific guidance in the section below it.

- Read `README.md` and `project.yaml` first: what this is, who it is for,
  and where related things live.
- Before changing `project.yaml`, `README.md`, `AGENTS.md`, `CLAUDE.md`, or
  the repo's layout, read `docs/project-conventions.md` and keep to it.
- Make one change for one purpose, and run the checks this repo documents
  before proposing it.
- Commit only the files you changed, by path. Never commit credentials,
  tokens, or data extracts.
- If `project.yaml` says `visibility: public`, anyone can read this repo:
  write no person, employer, team, host, or machine names into it.
- If it says `visibility: internal`, everyone in the organization that
  hosts this repo can read it: the organization's own names are fine,
  other people's personal details are not.
- Documents are for someone who opens this repo without the user's memory.
  If `project.yaml` says `shared: true` or sets `visibility`, write the plan
  for a piece of work and the decisions a reader needs into the repo: plans
  in `docs/plan/`, decisions in `docs/decisions.md`. Otherwise write such
  documents only when asked.
- Never track progress in a document: no checkboxes, status lines, or live
  handoff files. Read `docs/project-conventions.md` before writing or moving
  anything under `docs/`, and leave existing documents as they are.
- In a repo other people use, changes go in through its review process,
  not straight to the main branch.
- Keep work in progress in a worktree under `.claude/worktrees/`, one
  session per worktree, and push its branch before leaving it.
- Do not move or rename the repo, and keep `project.yaml` true when the
  project changes.
<!-- project-guide:base end -->

## This project

This repository is the single source of the productivity skills. Every catalog
that offers them references this repository on the `stable` ref; no catalog
keeps a copy. Fix a skill here, never in a consumer.

### Public repository

Everything here is public and generic. Write for "the user". No person,
username, host name, employer, team, or internal product; no absolute paths
from any machine; no names of skills or plugins from other catalogs; no real
tokens. The exceptions are the `author` field in the plugin manifests (and the
owner of the single-plugin catalog) and this repository's own URL. A skill
here may say that a neighboring job belongs elsewhere (opening a new chat,
saving to long-term memory), but describes that job in plain words rather than
naming another plugin's skill.

### Layout

- `.claude-plugin/plugin.json`, `.codex-plugin/plugin.json`: the manifests.
  Skills are auto-discovered from `skills/`.
- `.claude-plugin/marketplace.json`, `.agents/plugins/marketplace.json`:
  single-plugin catalogs for direct install.
- `skills/<name>/`: `SKILL.md`, `README.md` (maintainer and date),
  `agents/openai.yaml`, and any bundled files.
- `skills/watch/LAUNCH.md`: the fail-fast launch ladder. `skills/watch/scripts/`:
  `next-tick.sh` (seconds to the next clock boundary) and `watchdog.sh` (the
  clock-aligned monitor, which calls `next-tick.sh` from its own folder).

### Two harnesses, no hooks

Every skill must work in Claude Code and Codex from the same `SKILL.md`. Refer
to bundled files by paths relative to the skill's directory, add no hooks, and
keep skill bodies short and harness-neutral.

### Checks

- After a change to a script under `skills/watch/scripts/`, run `bash -n` on
  it, run `bash skills/watch/scripts/next-tick.sh 5` (prints a number of
  seconds) and `bash skills/watch/scripts/watchdog.sh --check 'echo ok' --once
  --log <temp file>` (one tick, exit 0), on Linux or macOS and under Git Bash.
  Keep both scripts executable.

### Releases

Consumers track `stable`. A release bumps `version` in both manifests, tags
`vX.Y.Z`, and advances `stable` to the tag after validation. When to release
is the owner's decision.
