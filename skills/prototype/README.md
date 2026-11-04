# prototype

- Maintainer: the productivity plugin maintainers
- Submitted: 2026-11-02
- Origin: copied from Matt Pocock's skills repository
  (https://github.com/mattpocock/skills, `skills/engineering/prototype`),
  at commit 4ae2317ddb22b046e26455e4f9c9b3aaaf62212d (main, 2026-10-31),
  MIT licensed, copyright (c) 2026 Matt Pocock.

Builds a throwaway prototype that answers one design question: a single-file HTML demo that pushes a state model through hard cases (LOGIC.md), or several radically different UI variants on one route (UI.md). Throwaway from day one, trivial to run, no persistence, state surfaced after every action, captured on a throwaway branch when done. One sentence was added to the original: for non-code work the prototype is a rough draft of the artifact itself, built to the same rules.

## Prerequisites

A project the prototype can sit next to. The UI branch needs the project's own task runner.
