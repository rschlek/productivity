---
name: explain
description: >-
  Explain one thing in plain language so the user understands it, with no
  decisions attached: a problem, a mechanism, a topic, or a piece of the
  agent's own output. Changes register out loud, gives the whole picture in a
  few plain paragraphs with every term translated and one everyday comparison,
  then follows the user's questions and makes it smaller when it does not
  land. Use when the user says "explain", "explain first", "help me understand
  X", "why does X work", "what's going on here", "what does this mean", "plain
  English", "I don't understand", or "don't fix it yet, just explain". Also use
  unprompted when a fix would touch a running system and the root cause is not
  yet established. Do NOT use for stress-testing a plan the user already has
  (that is grill-me), for walking the user through decisions one at a time
  (that is untangle), for proposing options or a recommendation, or for
  capturing a task.
---

# Explain

Understanding is the whole deliverable. No options, no recommendation, no
decisions, and nothing is edited, restarted, or reconfigured. If the user wants
a change afterwards, they ask for it in a separate turn.

## Procedure

1. **Change register, out loud.** One line that says so ("Let me back up and
   say this plainly"). If a mix-up was the agent's, name it in that line.
2. **Pin the subject.** The precise problem or question, as observed, in one or
   two sentences. For a problem, cite the evidence that shows it: the error
   text, the log line, the file and line, the measurement. Facts, not
   impressions.
3. **Give the whole picture in plain words.** Three short paragraphs at most:
   what this thing is, why it is happening or how it works, and why it matters
   to the user. Separate the root cause from the trigger and from the symptom.
   Every term is translated or dropped. One everyday comparison is worth more
   than a second paragraph of detail. If forensics are needed to establish the
   mechanism, delegate the reading and keep the explanation here. Do not guess.
4. **Keep going as a dialogue.** Drop to concrete examples, check
   understanding, follow the threads the user pulls, and stop when their
   curiosity is satisfied. One idea per turn; do not preview what comes next.
5. **If it did not land, make it smaller.** Split the idea, define the one term
   in the way, or give a concrete example. Never repeat the same explanation at
   greater length.
6. **Keep decisions out.** If the explanation surfaces choices the user will
   have to make, say in one line that there are some and how many, and leave
   them for a separate walk, one at a time. Do not list them, rank them, or
   recommend.

## Never

- Offer options, a recommendation, or a plan. Those are a different job.
- Explain with shorthand: bare dates, ticket or decision numbers, acronyms, or
  labels coined earlier in the session. Restate the thing itself.
- Pad with everything known about the subject. Explain the user's situation,
  not the general topic.
- Slide back into a bulk reply. Once the user asks for plain language, that
  holds for the rest of the session.

## Notes

- Ground it in why this is surfacing now, from the conversation, so it reads as
  a diagnosis of the user's situation rather than a generic explainer.
- If the cause is not established, say what is known, what is not, and what
  would settle it, without proposing the fix.
- The same shape fits reviewing long material: one section per turn, with what
  that section is for stated in plain words directly above it.
- Direction is the difference from untangle: untangle hands the agent's pile
  back as decisions; this hands back understanding and no decisions. When a
  decision walk needs something understood first, do that here, then return to
  the walk.
