---
name: astronaut-sr
description: Create or review System Requirements for behavior and quality from confirmed User Requirements.
---

# System Requirements

Explain the system's purpose, features, behavior, and required qualities so a
reader can understand what it must do. Derive requirements from confirmed URs,
keeping implementation choices in detailed design.

## Workflow

Author or derive SRs only when all URs in the source documents are `confirmed`.

1. Review confirmed URs, current requirements, agreed terminology, and latest
   user decisions.
2. Outline each feature's start, progression, result checks, repetition or
   transition, ending, and relevant exceptions before writing Sub-SRs.
3. Extract shared responsibilities into coherent SRs and retain each feature's
   own outcomes. Specify meaningful Sub-SRs as conditions, actions, and results.
4. Review coverage, duplication, and traceability. Record unresolved system
   decisions as questions and apply user answers to the affected requirements.

## Derivation Principles

- Derive functional and non-functional SRs from in-scope `confirmed` URs,
  covering their User Stories and Acceptance Criteria.
- Derive supporting behavior needed to fulfill confirmed goals; do not simply
  copy UR names into SRs. Distinguish necessary behavior from policies or
  capabilities that require a user decision.
- Group related behavior into coherent features at a consistent level of
  detail. Extract behavior shared by several features when it forms a distinct
  responsibility, and remove duplicate specifications from those features.
  Preserve their business outcomes and transitions. A feature may derive from
  several URs; the grouping does not prescribe processes, classes, or modules.
- Use Sub-SRs for meaningful stages, responsibilities, or behaviors, not each
  low-level operation or individual check. A feature using another feature does
  not by itself require merging them.
- Explain each feature's role and behavior, including relevant conditions,
  actions, results, branches, dependencies, and exceptions. State obligations
  clearly, using "shall" or the equivalent in the requested language. Describe
  feature relationships when they explain the behavior; avoid repetitive
  statements that another SR must be followed. Preserve source traceability.
- Write requirements so their fulfillment can be checked. Detailed test
  procedures, such as test environments, repetition counts, and evidence
  collection, belong in a separate validation plan. Include execution-result
  and recovery checks that the system must perform in SR as system behavior.
  Preserve agreed quality targets and human evaluation methods.
- Include supported failure handling, permitted recovery, resumption, and final
  stopping behavior. Do not assume recovery scope, retry limits, or notification
  policies that have not been agreed.
- Review relevant quality needs, such as performance, security, reliability,
  and usability. Derive supported quality requirements separately; raise
  grounded gaps as questions instead of inventing targets or policies.

## Decisions and State

Read current requirements and relevant decisions. Derive known behavior even
when some system details remain unresolved. Do not fill gaps with assumed
policies, thresholds, support scope, or responsibility assignments. A completed
reference artifact reflects decisions for that case; its policies and priorities
do not settle decisions for new requirements.

Record missing behavior, terms, or quality criteria as
concise questions under `Pending System Specification Decisions`. Use one
bullet per question, prefixed with related SR IDs when available; otherwise
write only the question.
Questions about product scope or acceptable user outcomes belong in UR;
implementation choices belong in detailed design, and test procedures in validation
planning. Ask for values or policies when needed to define required behavior
or quality.

Use supported values and policies. Offer candidates when proposals are
requested, clearly distinguishing them from agreed decisions. Apply explicit
user changes to all affected requirements and revise or remove only resolved
questions.

`State` is `open`, `proposed`, `confirmed`, or `conflict`.

- Use `open` when required behavior or quality contains ambiguity or unresolved
  system specification decisions.
- Use `proposed` when those questions are resolved and the requirement is
  clear but has not yet been agreed.
- Use `confirmed` when the source or user establishes agreement on the SR
  and no system specification questions remain.
- Use `conflict` when requirement decisions conflict, retaining the competing
  positions until resolved.

Confirmation concerns the requirement, not implementation completion.
Confirmed URs do not automatically confirm the SRs derived from them.

Explain an area with no applicable requirements in a scope note.

## Traceability and Priority

Link each functional or quality SR to all confirmed URs from which it derives.
Sub-SRs inherit the parent SR's sources.

Assign sequential IDs from `SR_01`.
Number Sub-SRs within each parent as `01`, `02`, and reference them elsewhere
as `SR_01_01`. Preserve existing IDs and append after the highest assigned
number without reusing retired IDs. For regrouping, retain viable IDs and
update affected references within scope.

Priority expresses importance within the agreed scope, not exclusion or
implementation order. Use the
MoSCoW priorities `Must`, `Should`, and `Could`:

- `Must`: Essential to fulfill agreed user goals.
- `Should`: Important, but an acceptable workaround or temporary deferral exists.
- `Could`: Desirable, with limited impact if deferred.

Preserve agreed priorities using this scale. For SRs without a priority, assign
a draft priority based on contribution to user goals, functional dependencies,
and failure impact. Mark AI-assigned priorities as proposals with a brief reason
in the same metadata entry so the user can review and revise them.

## Output

Use the requested language and format. Preserve an existing format unless a
change is requested. For new artifacts, use a `Features` section with this
structure for each functional or quality SR. Include `Priority` in the metadata
table, respecting a requested or existing format.

```markdown
## Features

### SR_01 <Feature or quality requirement name>

| Item | Content |
|---|---|
| Overview | <Feature role and overall behavior> |
| State | <open / proposed / confirmed / conflict> |
| Priority | <Value; identify an AI proposal and briefly explain its basis> |
| Source UR | UR_01, UR_02 |

| Sub-SR | Name | Requirement |
|---|---|---|
| 01 | <Meaningful behavior or quality item> | When <condition>, the system shall <required behavior and outcome>. |
```

Use one row per meaningful Sub-SR, keeping its related conditions and branches
together.
Add separate sections or columns only when the requested format needs them.
The default artifact contains requirements, sources, states, priorities, and unresolved
specification decisions. Do not include drafting notes, change histories, ID
mappings, or follow-up work.

Include `Pending System Specification Decisions`, briefly indicating when no
questions remain.

## Review

Evaluate coverage, clarity, verifiability, decision grounding, and traceability
against these principles, including relevant quality gaps. Report the most
consequential findings first with affected IDs and concrete improvements.
Rewrite only when requested, preserving agreed behavior, states, and sources.
