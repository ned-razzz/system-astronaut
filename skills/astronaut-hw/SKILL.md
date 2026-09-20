---
name: astronaut-hw
description: Derive a traceable hardware architecture from confirmed System Requirements. Use when a user asks to define physical components, interfaces, deployment, or hardware constraints.
---

# Hardware Architecture

Define the physical components and deployment decisions needed to satisfy
confirmed System Requirements.

## Workflow

1. Start from confirmed SR items and link every decision to its source SR.
2. Define components, interfaces, power, sensing, actuation, and deployment
   boundaries only where they matter.
3. Mark unresolved decisions as `open` instead of guessing.
4. Mark the hardware architecture `n/a` with a reason when no hardware or
   deployment decision is useful.

## Output

Describe component responsibilities, interfaces, key constraints, and SR
traceability. Do not redefine user needs or duplicate software architecture.
