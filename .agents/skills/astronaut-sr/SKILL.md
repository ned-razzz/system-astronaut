---
name: astronaut-sr
description: Derive traceable System Requirements from confirmed User Requirements. Use when a user asks to create or review SR, or to structure functional and quality requirements.
---

# System Requirements

Transform confirmed User Requirements into implementation-neutral System
Requirements.

## Workflow

1. Use only confirmed UR items as derivation input.
2. Split outcomes into testable system behavior and constraints.
3. Give every item a unique SR ID and link it to its source UR.
4. Preserve unresolved, conflicting, and out-of-scope items explicitly.

## Output

For each SR, use `SR ID`, `Name`, `Description`, `Priority`, `State`, and
`Source UR`. Do not choose hardware or software architecture here.
