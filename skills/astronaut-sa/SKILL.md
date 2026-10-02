---
name: astronaut-sa
description: Derive a traceable system architecture from confirmed System Requirements, covering relevant hardware and software components, interfaces, data flows, and deployment boundaries.
---

# System Architecture

Define the hardware and software structure needed to satisfy confirmed System
Requirements. Choose the views and level of detail that help explain the
system or guide implementation.

## Principles

- Ground architecture items and decisions in confirmed SRs, keeping their
  source links visible.
- Describe relevant components, responsibilities, interfaces, data flows,
  and runtime or deployment boundaries. Include hardware concerns such as
  power, sensing, and actuation where applicable.
- Explain important interactions and boundaries, including those between
  hardware and software, and why the chosen structure meets the requirements.
- Make design choices within the confirmed requirements. Present unresolved
  choices as open questions or clearly identified candidates; changes to
  requirements need a requirement decision.
- Mark a view or applicability area `n/a` with a reason when it has no relevant
  design content.

## Output

Use the requested language and format. Select prose, tables, or diagrams to
make architectural choices and their implications clear. Keep detail relevant
to those choices and reference requirements rather than duplicating them.
