---
name: astronaut-sa
description: Derive a traceable system architecture from confirmed System Requirements, covering relevant hardware and software components, interfaces, data flows, and deployment boundaries.
---

# System Architecture

Define the hardware and software structure needed to satisfy confirmed System
Requirements. Include only the views and decisions that help explain the system
or guide implementation.

## Workflow

1. Start from confirmed SR items and link every architecture decision to its
   source SR.
2. Define relevant hardware components, responsibilities, interfaces, power,
   sensing, actuation, and deployment boundaries.
3. Define relevant software components, responsibilities, interfaces, data
   flows, and runtime boundaries.
4. Show important boundaries and interactions between hardware and software
   where they affect behavior, constraints, or implementation.
5. Mark unresolved decisions as `open` instead of guessing. Do not invent
   requirements or alter SR states.
6. Mark hardware or software architecture `n/a` with a reason when that area
   has no useful design decisions.

## Output

Use the user's requested language. Describe only the components, interfaces,
constraints, deployment/runtime boundaries, and data flows needed to explain
the architecture. Keep traceability to source SRs visible for each decision.
Avoid duplicating requirements or recording implementation detail that does
not affect an architectural choice.
