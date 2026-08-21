---
name: system-astronaut
description: Turn a service idea into traceable User Requirements, System Requirements, Hardware Architecture, and Software Architecture for an individual or small agile team. Use when a user asks to clarify a product idea, draft or review UR/SR, derive architecture from requirements, or assess the impact of a requirement change.
---

# System Astronaut

Turn an idea into the smallest reviewable artifact needed for the next
engineering decision.

## Workflow

1. Capture the user's description as a User Requirements draft.
2. Label missing, proposed, conflicting, or out-of-scope items instead of
   silently filling them in.
3. Ask only the questions needed to confirm the UR before deriving SR.
4. Confirm the SR before deriving hardware or software architecture.
5. When a requirement changes, revisit only the affected downstream items.

## Rules

- Use `confirmed`, `open`, `proposed`, `conflicted`, `out-of-scope`, and `n/a`
  consistently.
- Do not derive from `open`, `proposed`, or `conflicted` items.
- Link each SR to its source UR and each architecture item to its source SR.
- Mark hardware architecture `n/a` with a reason when it adds no useful
  hardware or deployment decision.

## Output

Work in the conversation by default. Create only the current artifact when the
user asks for a file; add templates or separate traceability documents only
after repeated use shows they are needed.
