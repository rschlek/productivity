---
name: handoff
description: >-
  Compact the current conversation into a handoff document for another agent to
  pick up. Use when the user says "hand this off", "write a handoff", "handoff
  doc", "/handoff", or "package this up for another agent". Do NOT use to open
  the next chat itself in a new tab, or to save the session's durable knowledge
  to long-term memory before context is lost (each is a different job), or to
  sort the agent's own open decisions for the user (that is untangle).
argument-hint: "What will the next session be used for?"
---

Write a handoff document summarising the current conversation so a fresh agent can continue the work. Save to the temporary directory of the user's OS - not the current workspace.

Include a "suggested skills" section in the document, which suggests skills that the agent should invoke.

Do not duplicate content already captured in other artifacts (PRDs, plans, ADRs, issues, commits, diffs). Reference them by path or URL instead.

Redact any sensitive information, such as API keys, passwords, or personally identifiable information.

If the user passed arguments, treat them as a description of what the next session will focus on and tailor the doc accordingly.
