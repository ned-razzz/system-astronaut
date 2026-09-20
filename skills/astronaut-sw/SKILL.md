---
name: astronaut-sw
description: Derive a traceable software architecture from confirmed System Requirements. Use when a user asks to define software components, data flows, interfaces, or deployment responsibilities.
---

# Software Architecture

Define the software components and responsibilities needed to satisfy
confirmed System Requirements.

## Workflow

1. Start from confirmed SR items and link every decision to its source SR.
2. Define components, responsibilities, interfaces, data flows, and runtime
   boundaries only as needed for implementation decisions.
3. Mark unresolved decisions as `open` instead of guessing.
4. Keep hardware-specific decisions in Hardware Architecture.

## Output

Describe component responsibilities, interfaces, important data flows,
constraints, and SR traceability. Avoid inventing requirements.
