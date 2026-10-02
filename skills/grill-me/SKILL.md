---
name: grill-me
description: Interview the user relentlessly about a plan or design until reaching shared understanding, resolving each branch of the decision tree. Use when user wants to stress-test a plan, get grilled on their design, or mentions "grill me". Do NOT use for explaining a problem before a fix (that is explain), or for handing the agent's own pile back to the user as small decisions (that is untangle).
---

# Grill Me

The plan is the user's; the agent's job is to test it by asking. Keep asking
until both sides understand the plan the same way.

## Procedure

1. **Interview the user relentlessly** about every aspect of the plan, until
   reaching a shared understanding of it.
2. **Walk down each branch of the design tree**, resolving dependencies between
   decisions one by one.
3. **Give a recommended answer with each question.**
4. **Ask the questions one at a time.**
5. **If a question can be answered by exploring the codebase, explore the
   codebase instead of asking.**
