---
name: recenter
description: >-
  Untangle for the whole session, not one pile: reorient a chat around what it
  was opened to do, give the plain picture from the first message on, sort the
  threads into done, open, and not this chat, then walk the open ones one per
  turn, each with a recommended destination (finish here, drop, park on the
  task list, new chat, long-term memory), and end with one verdict, continue
  with a short agenda or close and seal the session. Use when the user comes
  back to a chat and asks "where were we", "what were we working on", "where do
  we stand", "recenter", "what's left", "are we done here", or "how do I close
  this out". Do NOT use to walk the agent's own last pile of decisions (that is
  untangle), to write the document another agent picks up (that is handoff), or
  to save one specific item to memory.
---

# Recenter

Untangle for the whole session, not one pile. Read `../untangle/SKILL.md`
first: this skill is that procedure with four substitutions. Everything
untangle says about register, plain words, one item per turn, no shorthand, no
stacked questions, and no sliding back into bulk delivery holds here.

## What changes from untangle

1. **The input is the chat from its first message**, not the agent's last
   pile. The plain picture (untangle step 2) says what the chat was opened to
   do, in the user's own words where possible; what happened since, in plain
   words; and where it stopped. If the user redirected the chat on purpose
   later ("actually, let's ..."), the later purpose counts; say that it moved.
2. **The unit is a thread, not a decision.** The three buckets (untangle step
   3) become: *done* (verified, or only claimed, and say which), *open and the
   user's*, and *not this chat* (work that drifted from the purpose; not a
   mistake, just work that belongs somewhere else). Evidence comes from the
   chat, never from impression. Memory is consulted only to check what is
   already saved there.
3. **The answer to each open thread is a destination, not a choice.** Each
   walked item (untangle step 5) carries one recommended destination and the
   single reason for it:
   - *finish here*: it serves the purpose and fits in this chat;
   - *drop*: say why it no longer matters;
   - *park*: one task with enough context to pick up cold, on the task tracker
     the agent can write to if one is connected, otherwise handed to the user
     for their own list;
   - *new chat*: a drift large enough to deserve its own context; handoff
     writes the document;
   - *memory*: a settled decision or finding worth keeping, not a task.
   Three of the five send work out of the chat; untangle never does.
4. **The close (untangle step 8) ends with a verdict, not a go.**
   - *Continue*: the finish-here items as a short agenda, in order; start on
     the first.
   - *Close*: nothing left belongs in this chat. Apply the parks, start the
     handoffs, then seal the session: durable knowledge to long-term memory,
     and in-flight state somewhere the user's next device can read, through
     the tool for that where one is installed, otherwise a note in the OS temp
     folder. Say when it is done.
   On continue, still offer the sealing step when durable things landed. A
   chat reopened on another device is exactly the one that never got a proper
   close.

## Notes

- Same procedure whether the user wants to resume or to finish. The verdict is
  the user's and is usually obvious from the ledger; do not ask which they
  want up front.
- The opening is the picture, the three buckets with counts, and the first
  open thread. Never the whole routing in one table; that is the pile the
  user came here to escape.
- A chat the user reopens elsewhere is the common case. Nothing load-bearing
  may live only in a file on the machine they are leaving.
