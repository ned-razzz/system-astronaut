---
name: astronaut-sr
description: Create or review traceable System Requirements from confirmed User Requirements and explicit external constraints. Use for functional, quality, or constraint SR work, not architecture design.
---

# System Requirements

Explain the system's purpose, features, behavior, and required qualities so a
reader can understand what it must do. Derive requirements from confirmed URs
and explicitly supplied external constraints, keeping implementation choices
in design.

## Workflow

1. Review confirmed URs, current requirements, agreed terminology, latest user
   decisions, and explicit external constraints.
2. Outline each feature's start, progression, result checks, repetition or
   transition, ending, and relevant exceptions before writing Sub-SRs.
3. Extract shared responsibilities into coherent SRs and retain each feature's
   own outcomes. Specify meaningful Sub-SRs as conditions, actions, and results.
4. Review coverage, duplication, and traceability. Record unresolved system
   decisions as questions and apply user answers to the affected requirements.

## Derivation Principles

- Derive functional and non-functional SRs from in-scope `confirmed` URs,
  covering their User Stories and Acceptance Criteria. Excluded product goals
  remain in UR's `Excluded Scope`. Identify proposed URs as deferred inputs
  when useful. Without confirmed URs, only directly supplied constraints can
  be specified.
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
- Keep required behavior and qualities verifiable without adding test
  procedures to the default artifact. The system checking an action's result
  or confirming recovery is runtime behavior and belongs in SR. Test setup,
  repetitions, evidence collection, and analysis belong in a validation plan
  when requested. Preserve agreed quality targets and human evaluation methods;
  separating test procedures does not remove the underlying obligations.
- Describe logical data, states, and values when needed to understand behavior.
  Concrete storage structures, APIs, protocols, and technology choices belong
  in design unless externally mandated. Distinguish unknown values, temporary
  interruption, recovery, normal completion, and failure when behavior depends
  on them. Specify when settings take effect if relevant; leave undecided
  timing or policies as questions.
- Include supported failure handling, permitted recovery, resumption, and final
  stopping behavior. Do not assume recovery scope, retry limits, or notification
  policies that have not been agreed.
- Review relevant quality needs, such as performance, security, reliability,
  and usability. Derive supported quality requirements separately; raise
  grounded gaps as questions instead of inventing targets or policies.
- Record externally mandated technical, organizational, or operating conditions
  under `System Constraints`, with a specific external source. Distinguish
  these from choices made by the designer.

## Decisions and State

Read current requirements and relevant decisions. Derive known behavior even
when some system details remain unresolved. Do not fill gaps with assumed
policies, thresholds, support scope, or responsibility assignments. A completed
reference artifact reflects decisions for that case; its policies, priorities,
and confirmed states do not settle decisions for new requirements.

Record missing behavior, terms, quality criteria, or constraint decisions as
specific questions under `Pending System Specification Decisions`, with
available source UR and related SR IDs. Identify the quality attribute for
quality-related questions.
Questions about product scope or acceptable user outcomes belong in UR;
implementation choices belong in design, and test procedures in validation
planning. Ask for values or policies when needed to define required behavior
or quality; do not mix these questions with implementation or test choices.

Use supported values and policies. Offer candidates when proposals are
requested, clearly distinguishing them from agreed decisions. Apply explicit
user changes to all affected requirements and revise or remove only resolved
questions. Do not accumulate superseded decisions. Deferral does not establish
a confirmed capability or permanent exclusion. Mark conflicting positions as
`Conflict` outside `State` and retain them until resolved rather than silently
changing a confirmed requirement.

`State` is either `proposed` or `confirmed`. New SRs, including constraints,
are `proposed` unless the user confirms those SRs themselves; confirmation of
a source UR does not confirm a derived SR. Unresolved decisions are questions,
not additional states. Having no pending questions does not confirm an SR.
Confirmation, priority, and implementation completion are separate. Explain
an area with no applicable requirements in a scope note.

When the user confirms source URs as part of the task, apply that decision to
the covered items with resolved product questions; update source artifacts
when included in the task.

## Traceability and Priority

Link each functional or quality SR to all confirmed URs from which it derives,
and each constraint to its external source. Sub-SRs inherit the parent SR's
sources and state.

Assign sequential IDs from `SR_01`, sharing the sequence with constraints.
Number Sub-SRs within each parent as `01`, `02`, and reference them elsewhere
as `SR_01_01`. Preserve existing IDs and append after the highest assigned
number without reusing retired IDs. For regrouping, retain viable IDs and
update affected references within scope.

Priority expresses importance within the agreed scope, not exclusion or
implementation order. Record priority only when explicitly supplied. Preserve
the user's values and placement; otherwise omit it. Propose priorities only
when requested, without presenting those proposals as agreed decisions.

## Output

Use the requested language and format. Preserve an existing format unless a
change is requested. For new artifacts, use a `Features` section with this
structure for each functional or quality SR. Add an explicitly supplied
`Priority` to the metadata table; omit it when none is supplied.

```markdown
## Features

### SR_01 <Feature or quality requirement name>

| Item | Content |
|---|---|
| Overview | <Feature role and overall behavior> |
| State | proposed |
| Source UR | UR_01, UR_02 |

| Sub-SR | Name | Requirement |
|---|---|---|
| 01 | <Meaningful behavior or quality item> | When <condition>, the system shall <required behavior and outcome>. |
```

Use one row per meaningful Sub-SR, keeping its related conditions and branches
together. Include necessary logical data and state definitions in the behavior.
Add separate sections or columns only when the requested format needs them.
The default artifact contains requirements, sources, states, and unresolved
specification decisions. Do not include drafting notes, change histories, ID
mappings, or follow-up work.

For externally supplied constraints, include:

```markdown
## System Constraints

### SR_XX <Constraint name>

| Item | Content |
|---|---|
| State | proposed |
| Source | <Specific external input> |
| Constraint | <Externally mandated condition> |
```

Include `Pending System Specification Decisions`, briefly indicating when no
questions remain. List deferred UR inputs when useful. Without confirmed URs,
omit the `Features` section.

## Review

Evaluate coverage, clarity, verifiability, decision grounding, and traceability
against these principles, including relevant quality gaps. Report the most
consequential findings first with affected IDs and concrete improvements.
Rewrite only when requested, preserving agreed behavior, states, and sources.
