# wayfinder

- Maintainer: the productivity plugin maintainers
- Submitted: 2026-11-02
- Origin: copied verbatim from Matt Pocock's skills repository
  (https://github.com/mattpocock/skills, `skills/engineering/wayfinder`),
  MIT licensed, copyright (c) 2026 Matt Pocock.

Charts a piece of work too big for one agent session as a shared map on the
repo's issue tracker: one map issue naming the destination, child tickets that
each resolve one decision (research, prototype, grilling, or task), native
blocking between them, and a fog-of-war section for what cannot be ticketed
yet. Sessions then work the map one ticket at a time until the way is clear.
Invoked explicitly by the user, never by the model on its own.

## Prerequisites

- An issue tracker the agent can create, label, assign, link, and close
  issues on. The skill falls back to a local-markdown tracker when none is
  provided.
- The skill calls sibling skills by name while working tickets: "grilling",
  "domain-modeling", "research", and "prototype". In this plugin, `grill-me`
  covers the grilling role; the others are not bundled here, so the agent
  substitutes its own research and prototyping when they are absent.
