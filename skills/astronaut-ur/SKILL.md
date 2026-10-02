---
name: astronaut-ur
description: Create or review lightweight User Requirements from a project brief or product idea as user stories with testable acceptance criteria. Use for user needs, user stories, acceptance criteria, or user-level product requirements; do not use for System Requirements or architecture.
---

# User Requirements

Describe user goals and observable acceptance conditions in a concise,
reviewable artifact. Each UR contains a User Story and Acceptance Criteria,
with an ID, name, and state as metadata.

## Workflow

1. Understand the input, user goals, and product scope.
2. Draft User Stories and observable Acceptance Criteria.
3. Review coverage and clarify pending product decisions and requirement states.

## Principles

- Preserve the stated product scope, including explicitly included future or
  optional goals and their conditions. A lightweight document does not imply
  an MVP or a smaller product. Reduce scope only when requested.
- Give each UR one coherent user goal. Split independently acceptable goals;
  keep tightly coupled outcomes together.
- Explain who wants what and why. Choose natural wording; use "As a / I want /
  So that" or Given-When-Then when they improve clarity.
- Make acceptance observable. Use quantitative criteria or human judgment as
  appropriate to the agreed goal; describe what is observed and how success
  is judged.
- Keep user goals and outcomes in UR, detailed system behavior and externally
  mandated system constraints in SR, and implementation choices in design.
  Keep team-wide Definition of Done separate from Acceptance Criteria.

## Decisions and Scope

Read the current artifact and relevant decisions when updating it. Clarify
unresolved product goals, scope, or acceptance conditions using concrete
examples when helpful. Missing system details alone do not invalidate an
agreed user goal.

`State` is either `proposed` or `confirmed`. Use `proposed` for drafts and
items with unresolved product decisions. Use `confirmed` when the source or
user establishes agreement on that requirement. In a confirmation task, an
answer settling the remaining product questions can establish that agreement.
Confirmation concerns the requirement, not implementation completion.

Record unresolved decisions as questions under `Pending Product Decisions`,
linking existing UR IDs when applicable. If no requirement can be drafted
without guessing, record only the question. Mark disagreements as `Conflict`
and retain the competing positions until resolved. Apply decisions to the
items they cover; a conflicting input does not silently replace a confirmed
requirement.

Keep explicitly excluded product goals under `Excluded Scope`, retaining their
existing IDs and content. Later delivery or lower importance does not imply
exclusion. Explain any area outside the artifact's applicability in a scope
note rather than assigning another requirement state.

## Output and Updates

Use the requested language and format. For new artifacts, default to one table
with one row per UR; preserve an existing format unless a change is requested.

```markdown
| ID | name | User story | Acceptance Criteria | State |
|---|---|---|---|---|
| UR_01 | <User goal> | <User> wants <goal> so that <value>. | <Observable acceptance conditions> | proposed |
```

Keep the artifact focused on user goals and acceptance. Include
`Pending Product Decisions`; briefly indicate when there are no pending
questions. Include `Excluded Scope` when explicit exclusions exist.

Assign sequential IDs from `UR_01`. Preserve existing IDs and append after the
highest assigned number, including excluded or retired items. When a merge or
split requires changed IDs, record the mapping and update affected references
within the requested artifact set. Briefly report state changes with their
decision basis and any downstream impact requiring follow-up.

## Review

Evaluate the artifact against these principles. Report the most consequential
findings first, with the affected IDs and concrete improvements. Rewrite only
when requested, preserving agreed scope, decisions, and traceability.
