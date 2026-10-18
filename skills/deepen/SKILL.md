---
name: deepen
description: >-
  Rewrite a task or prompt into a deeper version of itself, not a bigger one:
  before doing the work, say what a top professional would do that was not
  asked for, the rawest material they would start from, the methods and tools
  they would use, and what outside the agent and the user would show the result
  is right, then rewrite the request to ask for exactly that and stop for the
  user's go. Use when the user says "deepen", "deepen this", "a deeper version",
  "deeper, not bigger", "what would a pro do here", "how would an expert
  approach this", or "make this prompt better" for a task about to be run. Do NOT
  use for stress-testing a plan the user already has (that is grill-me), for
  explaining a problem before a fix (that is explain), or for widening a task's
  scope.
---

# Deepen

Same question, asked the way the best person in the field would ask it.

## Procedure

1. **Pin the task.** One line: what is being asked and the field it belongs to
   (the kind of professional who does this for a living). The task is the one
   the user just gave or points at; if there is none in view, ask for it.
2. **Answer the four questions**, each specific to this task, a few lines each:
   1. **The professional's move.** What would a top practitioner do here that
      the user is not asking for? Name the one to three moves that most change
      the quality of the result.
   2. **The rawest material.** What would they start from instead of what has
      already been digested: the dataset rather than the dashboard, the logs
      rather than the summary, the primary source rather than the write-up, the
      code rather than its docs. Say whether that material is reachable here.
   3. **Methods and tools.** Name the specific techniques and tools they would
      use, not a category.
   4. **The outside check.** What, other than the agent or the user, would show
      the result is right: a test that can fail, a source of record to reconcile
      against, a measurement, a prediction checked later, an independent
      reviewer. "Re-reading the work" does not count.
3. **Rewrite the request** to ask for exactly that, in one block the user can
   run or paste. Keep the original goal and deliverable; fold in the move, the
   starting material, the methods, and the check as instructions.
4. **Stop.** Offer three choices: run the rewrite, edit it, or keep the
   original. Do the work only on an explicit go, and then do the version chosen.

## Shape of the reply

The pinned task, the four answers under their headings, the rewritten request
in one block, then the choice. One screen.

## Notes

- Deeper, not bigger. Test every addition: does it improve the answer to the
  same question, or does it add a new deliverable? Cut the second kind.
- Be concrete. A named source, tool, or test beats a principle. If unsure
  whether a source or tool exists or is reachable, check before naming it.
- If the task is already deep, say so and change little. A rewrite that only
  rephrases is a failure.
- When the outside check cannot run here, the rewrite says so and names who or
  what could run it later.
