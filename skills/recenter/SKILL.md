---
name: recenter
description: >-
  Reorient a chat around what it was opened to do: restate the original
  purpose, name where the conversation drifted, ledger what is done and what is
  open, give each open thread a destination (finish here, drop, park on the task
  list, new chat, long-term memory), and end with one verdict, continue with a
  short agenda or close. Use when the user comes back to a chat and asks "where
  were we", "what were we working on", "where do we stand", "recenter", "what's
  left", "are we done here", or "how do I close this out". Do NOT use to walk
  the agent's own pile of decisions one at a time (that is untangle), to write
  the document another agent picks up (that is handoff), or to save one specific
  item to memory.
---

# Recenter

A chat that has run long, or that the user reopened on another device, has the
purpose its first message stated and the shape its later turns gave it. The two
rarely match. Hand the user both, and a way to finish.

## Procedure

1. **Restate the purpose.** Reread the first user message, and the opening
   turns if it took a few to settle. State the purpose in one plain sentence,
   in the user's own words where possible. If the user redirected the chat on
   purpose later ("actually, let's ..."), the later purpose is the one that
   counts; say that it moved.
2. **Name the threads.** List the distinct pieces of work the chat took on, in
   order. Mark each as serving the purpose or as a drift. A drift is not a
   mistake; it is work that belongs somewhere else.
3. **Ledger each thread.** One of: done and verified, done but only claimed, in
   progress (where exactly it stopped), or waiting on the user (which
   decision). Point at the evidence in the chat: the turn, file, or result.
   Never grade from impression.
4. **Give each open thread one destination.**
   - *finish here*: it serves the purpose and fits in this chat;
   - *drop*: say why it no longer matters;
   - *park*: one task with enough context to pick up cold, on the task tracker
     the agent can write to if one is connected, otherwise handed to the user
     for their own list;
   - *new chat*: a drift large enough to deserve its own context; handoff
     writes the document;
   - *memory*: a settled decision or finding worth keeping, not a task.
   Propose all destinations in one table. The user corrects the table rather
   than approving items one by one.
5. **Verdict.** The ledger usually makes it obvious; the user can flip it.
   - *Continue*: list the finish-here items as a short agenda, in order, and
     start on the first. If more than three of them are open decisions for the
     user, walk them with untangle.
   - *Close*: nothing left belongs in this chat. Apply the parks, start the
     handoffs, then seal the session: durable knowledge to long-term memory
     and in-flight state to a file, through the tool for that where one is
     installed, otherwise a short note in the OS temp folder. Say when it is
     done.
6. **Report.** Purpose, thread count with drift count, the verdict, and what
   went where. Short enough to read on a phone.

## Notes

- The ledger comes from the chat, not from memory. Memory holds what is
  already kept; the chat holds what happened. Consult memory only to check
  whether a memory destination is already saved.
- On a continue verdict, offer the sealing step when durable things landed. A
  chat reopened on another device is exactly the one that never got a proper
  close.
- Same procedure whether the user wants to resume or to finish; only the
  verdict differs. Do not ask which they want up front.
- Difference from untangle: untangle looks at the agent's last pile and walks
  decisions; recenter looks at the whole arc and routes threads. Recenter may
  hand to untangle; untangle never sends work out of the chat.
