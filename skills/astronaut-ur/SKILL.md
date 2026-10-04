---
name: astronaut-ur
description: Create or review User Requirements as user stories with observable acceptance criteria from a confirmed project brief.
---

# User Requirements

Describe user goals and observable acceptance conditions in a concise,
reviewable artifact. Each UR contains a User Story and Acceptance Criteria,
with an ID, name, and state as metadata.

## Workflow

Before authoring or deriving requirements, check every item in every source
document. Proceed only when all source items are `confirmed`. A `proposed`,
missing, or unclear state blocks the whole task; do not select only confirmed
items or produce a partial artifact. For a project brief without item states,
require explicit user confirmation covering all of its source items; do not
infer confirmation merely because the brief was supplied. On failure, report
the source document and affected items and stop without writing the output or
automatically confirming inputs. Reference examples and the target artifact
being reviewed, revised, or confirmed are not upstream source documents.

1. Understand the input, actual users, product scope, and relevant decisions.
2. Identify complete user outcomes and group their steps, means, and conditions
   before drafting requirements.
3. Draft User Stories and observable Acceptance Criteria, preserving supported
   scope and the meaning of each goal.
4. Review coverage and record unresolved product decisions as questions. Apply
   user answers before confirming the affected requirements.

## Principles

- Preserve the stated product scope, including explicitly included future or
  optional goals and their conditions. A lightweight document does not imply
  an MVP or a smaller product. Reduce scope only when requested.
- Give each UR one complete product-level user goal. Group steps, means, and
  conditions that achieve the same outcome, retaining necessary details in
  Acceptance Criteria. Split when items provide distinct user outcomes;
  separate execution or implementation modules alone do not justify a split.
- Write from the perspective of the person receiving the product's value.
  Distinguish that user from the product and any character, device, or other
  object it controls. Follow agreed role names and domain terminology.
- Explain who wants what and why. Choose natural wording; use "As a / I want /
  So that" or Given-When-Then when they improve clarity.
- Make acceptance observable. Use quantitative criteria or human judgment as
  appropriate to the agreed goal; describe what is observed and how success
  is judged. Preserve the goal's meaning and strength; do not replace it with
  an easier proxy or invent thresholds. Include relevant recovery, stopping,
  and notification outcomes alongside normal success conditions.
- Keep user goals and outcomes in UR, detailed system behavior and externally
  mandated system constraints in SR, and implementation choices in design.
- Development, integration, and research or evaluation work are user goals only
  when the product itself provides that capability to an actual user. Who
  implements a feature does not determine whether it belongs in product scope.
- Distinguish acceptance conditions from detailed test setup, repetition,
  evidence collection, and analysis. Keep team-wide Definition of Done separate
  from Acceptance Criteria.

## Decisions and Scope

Read the current artifact and relevant decisions when updating it. Organizing
requirements is an authoring decision; do not invent or change product
commitments while doing so. Leave unresolved user goals, support scope, and
acceptance conditions for user decision. Missing system details alone do not
invalidate an agreed user goal.

When using a completed artifact as a writing example, do not treat its product
decisions or confirmed states as agreement on new requirements.

`State` is either `proposed` or `confirmed`. Use `proposed` for drafts and
requirements whose user goal, scope, or acceptance conditions still require
agreement. Use `confirmed` only when the source or user establishes agreement
on that requirement. In a confirmation task, an answer settling the remaining
product questions can establish that agreement. Having no pending questions
alone does not establish confirmation. Confirmation concerns the requirement,
not implementation completion.

Record unresolved decisions as specific questions under
`Pending Product Decisions`, linking existing UR IDs when applicable. If no
requirement can be drafted without guessing, record only the question. Apply
user answers to the affected requirements and revise or remove only resolved
questions. Mark disagreements as `Conflict` outside `State` and retain the
competing positions until resolved; a conflicting input does not silently
replace a confirmed requirement.

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

Keep the artifact focused on product requirements. Include
`Pending Product Decisions`; briefly indicate when there are no pending
questions. Include `Excluded Scope` when explicit exclusions exist.
Do not include drafting notes, change histories, ID mappings, or follow-up
work in the requirements artifact.

Assign sequential IDs from `UR_01`. Preserve existing IDs and append after the
highest assigned number, including excluded or retired items. When a merge or
split requires changed IDs, update affected references within the requested
artifact set.

## Review

Evaluate the artifact against these principles. Report the most consequential
findings first, with the affected IDs and concrete improvements. Rewrite only
when requested, preserving agreed scope, decisions, and traceability.
