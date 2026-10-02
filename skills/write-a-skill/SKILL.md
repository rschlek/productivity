---
name: write-a-skill
description: >-
  Author a new agent skill (a SKILL.md plus optional bundled files) to the
  user's conventions: portable, generic voice, concise, with a trigger-rich
  description. Use when the user wants to create, write, draft, or rewrite a
  skill, in any plugin or repository. Do NOT use for authoring an agent
  definition, or for a passing edit to an existing skill's prose.
---

# Write a Skill

## Process

1. **Pin the job.** One sentence: what the skill does and the literal phrases
   that should trigger it. If an existing skill or agent already covers the job,
   say so before drafting.
2. **Draft** `SKILL.md` from the target repository's skill template if it has one,
   otherwise from the shape below. Add a reference file only when the body would
   pass about 100 lines; add a script only when a step is deterministic.
3. **Review with the user** against the checklist, then hand back the draft.

## Conventions

- **Generic voice.** "The user", never a person's name. Describe the *pattern*,
  never a real host, account, project, or file. Placeholder data in examples.
- **Portable.** No absolute paths, no cross-plugin assumptions. Bundled files are
  referenced by paths relative to the skill's own folder (`scripts/...`), never
  through one harness's variable. Sibling skills in the same plugin may
  name each other. A skill *outside* the plugin is named in exactly two cases: it
  owns a setup or install step this skill depends on, or it is the nearest
  neighbor in a "Do NOT use" line. Either way write it fully qualified as
  `plugin:skill`, so a validator can catch a dangling name.
- **Concise.** Under 100 lines, one idea per step, no time-sensitive facts.
  Rarely needed depth goes one level down in a reference file.
- **The description is the trigger.** Third person, under 1024 characters.
  First sentence: what it does. Second: "Use when ..." with the literal phrases.
  Third: "Do NOT use for ..." naming the nearest neighbors.

## Shape

```md
---
name: skill-name            # equals the directory name
description: >-
  What it does. Use when [phrases]. Do NOT use for [neighbors].
---

# Skill Name

## Procedure
1. ...

## Notes
- caveats, edge cases
```

## Checklist

- [ ] `name` equals the directory name; description has Use when and Do NOT use
- [ ] under 100 lines, generic voice, placeholder data only
- [ ] no absolute paths; no named projects or systems; an external skill only
      under the portability rule above, fully qualified as `plugin:skill`
- [ ] references at most one level deep; scripts only for deterministic steps
- [ ] validated, committed by path, and pushed when the target repository has that flow
