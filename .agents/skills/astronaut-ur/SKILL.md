---
name: astronaut-ur
description: Create or review lightweight User Requirements from a project brief or product idea as user stories with testable acceptance criteria. Use for user needs, user stories, acceptance criteria, or user-level product requirements; do not use for System Requirements or architecture.
---

# User Requirements

Create the smallest reviewable User Requirements artifact. A UR body consists
of one User Story and its Acceptance Criteria. Its ID, title, and state are
metadata, not additional requirement content.

## Workflow

1. Extract actors, goals, user value, observable outcomes, and stated scope.
2. Keep only goals needed for the smallest usable scope supported by the
   input. Omit speculative, optional, and future goals unless the user asks for
   broader scope.
3. Give each UR one user goal. Split only when goals can be independently
   accepted or delivered; keep tightly coupled outcomes together.
4. Write a short User Story that identifies who wants what and why. Use the
   usual "As a / I want / So that" shape when helpful, but do not force awkward
   wording.
5. Write observable, pass/fail Acceptance Criteria. Use Given-When-Then only
   when a behavior needs explicit conditions.
6. Preserve uncertainty and disagreement instead of inventing decisions.
   Drafted items are `proposed` unless the source explicitly confirms them. If
   a known user goal lacks a required decision, mark it `open`. If no testable
   UR can be written without guessing, record the decision under Open Questions
   instead of forcing it into the UR template.

Use only `confirmed`, `proposed`, `open`, `conflicted`, `out-of-scope`, or
`n/a` as states. Preserve existing excluded items as `out-of-scope`; use `n/a`
only when the source explicitly makes an item inapplicable.

## Boundaries

- Keep APIs, databases, protocols, technology choices, internal structures,
  system behavior, and architecture out of UR. Leave them for SR or design.
- Keep team-wide Definition of Done rules separate from Acceptance Criteria.
- Do not document every future detail. Leave refinement to conversation and
  update the UR when decisions are made.

## Output

Use the user's requested language.

### Create

Use this shape for each UR:

```markdown
## UR_01 <User goal>

State: proposed

### User Story

<User> wants <goal> so that <value>.

### Acceptance Criteria

- <Observable pass/fail condition>
```

Assign unique sequential IDs starting at `UR_01`. When needed, append only the
applicable section:

```markdown
## Open Questions

- <Decision required before a testable UR can be written>

## Excluded Scope

- <Explicitly deferred or excluded goal>
```

Do not add empty sections, priority, or implementation fields.

### Review

Return prioritized findings for combined goals, missing user value, untestable
criteria, implementation details, and incorrect states. Preserve the artifact
and all existing IDs unless the user requests a rewrite. Give newly requested
URs the next available ID.
