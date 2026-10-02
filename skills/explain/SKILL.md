---
name: explain
description: >-
  Explain a problem or a topic before anything is changed: what it is, why it is
  happening, and, when a change is on the table, the options with trade-offs and
  one recommendation, then stop for the user's go. Use when the user says
  "explain first", "before you fix anything", "don't fix it yet", "what's going
  on and what are our options", "help me understand X", "why does X work", or
  asks for options and a recommendation. Also use unprompted when a fix would
  touch a running system and the root cause is not yet established. Do NOT use
  for a plain "fix it" with a known cause, for stress-testing a plan the user
  already has (that is grill-me), for walking the user one at a time through a
  pile of findings, options, or open decisions the agent itself just produced
  (that is untangle), or for capturing a task.
---

# Explain

Understand before acting. The output is a brief the user can decide from, not a
change. Nothing is edited, restarted, or reconfigured until the user says go.

## Procedure

1. **Pin the subject.** State the precise problem or question, as observed, in
   one or two sentences. Cite the evidence that shows it: the error text, the log
   line, the file and line, the measurement. Facts, not impressions.
2. **Explain the mechanism.** Why it is happening, or how it works. Separate the
   root cause from the trigger and from the symptom. If forensics are needed to
   establish this, delegate the reading and keep the brief here. Do not guess.
3. **Fork on whether a change is pending.**
   - *A fix or change is on the table:* lay out two to four options. For each,
     say what it does, what it costs, whether it is reversible, and what it does
     not fix. Label a workaround as a workaround and name the real fix it defers.
     Give one recommendation and the single reason that decides it. End with
     "Your call." and wait.
   - *Nothing is pending:* keep going as a dialogue. Drop to concrete examples,
     check understanding, follow the threads the user pulls, and stop when their
     curiosity is satisfied.

## Shape of the brief (fix pending)

Problem, Mechanism, Options, Recommendation and why, then the wait. One screen.
Plain words, evidence cited inline, no code unless the diff itself is the
decision.

## Notes

- Ground it in why this is surfacing now, from the conversation, so it reads as
  a diagnosis of the user's situation rather than a generic explainer.
- The wait is the point. A recommendation is not a go, and "sounds right" is not
  a go. Proceed only on an explicit yes, and then do exactly the option chosen.
- Root cause over workaround: if only a mitigation is possible now, say so and
  say what the proper fix costs.
