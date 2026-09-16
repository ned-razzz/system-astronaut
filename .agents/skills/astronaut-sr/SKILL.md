---
name: astronaut-sr
description: Create or review traceable, implementation-neutral System Requirements from confirmed User Requirements. Use for functional or non-functional SR work;
---

# System Requirements

Create the smallest reviewable System Requirements artifact from User
Requirements produced by `astronaut-ur`. Define what the system must do and
which quality conditions it must meet, never how it will be implemented.

## Workflow

1. Derive SRs only from URs whose state is `confirmed`.
2. Report every `proposed`, `open`, `conflicted`, `out-of-scope`, or `n/a` UR
   under `Unused UR Inputs`; do not convert or modify it. If no UR is
   `confirmed`, produce no SRs.
3. Analyze each confirmed User Story and its Acceptance Criteria for system
   features, sub-features, logical data, and necessary quality constraints.
4. Group related behavior into cohesive features. Give each feature or
   independently verifiable quality requirement one unique sequential SR ID.
5. Write observable, pass/fail requirements. Do not invent thresholds,
   supported options, failure policies, or other decisions absent from the
   input. Put a decision needed for a testable SR under `Open Questions` and
   cite its source UR.
6. Link each SR to all confirmed URs from which it is derived. Traceability is
   recorded at the SR feature level, not on every requirement bullet.

Use only `confirmed`, `proposed`, `open`, `conflicted`, `out-of-scope`, or
`n/a` as states. A newly derived SR is `proposed` unless the user explicitly
confirms the SR itself; a confirmed source UR does not automatically confirm
its derived SR. Preserve existing SR states and IDs when reviewing or
updating. Use an explicitly supplied priority; otherwise use `Required`.

## Content

Write only these kinds of SR:

- Functional requirements: system features and behavior.
- Non-functional requirements: necessary, verifiable quality constraints such
  as performance, safety, reliability, security, usability, or
  maintainability.

For a functional feature, use a short description followed by sub-features
and concrete system behavior. Add a data subsection only when logical data is
needed to understand the feature. Describe data meaning and composition, not
database tables, keys, concrete types, message formats, classes, or storage.

Keep APIs, protocols, technology choices, internal structures, and hardware
or software architecture out of SR. Do not restate user goals as system
behavior or add speculative quality requirements.

## Output

Use the user's requested language.

### Create

Use this shape for each SR:

```markdown
## SR_01 <Feature or quality requirement name>

<One- or two-sentence description>

**State:** proposed
**Source UR:** UR_01, UR_02

### <Sub-feature or quality category>

- <Observable, pass/fail system requirement>

### <Logical data name>

- <Logical data item>

**Priority:** Required
```

Assign IDs sequentially starting at `SR_01`; when extending an artifact, use
the next available ID. Omit data subsections that are not needed. Append only
the applicable sections:

```markdown
## Open Questions

- <System-level decision needed for a testable SR> (**Source UR:** UR_01)

## Unused UR Inputs

- UR_02 (`proposed`): not derived because it is not confirmed.
```

Do not add empty sections. If there are no confirmed URs, return only `Unused
UR Inputs`.

### Review

Return prioritized findings for derivation from unconfirmed URs, missing
coverage of confirmed URs, missing or incorrect traceability, untestable
wording, unsupported values or quality constraints, implementation details,
duplicate IDs, and incorrect states. Preserve the artifact and all existing
IDs unless the user requests a rewrite.
