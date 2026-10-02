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

1. Review confirmed URs and explicit external constraints.
2. Specify coherent features, required qualities, and system constraints.
3. Review coverage, pending system decisions, and traceability.

## Derivation Principles

- Derive functional and non-functional SRs from in-scope `confirmed` URs,
  covering their User Stories and Acceptance Criteria. Excluded product goals
  remain in UR's `Excluded Scope`. Identify proposed URs as deferred inputs
  when useful. Without confirmed URs, only directly supplied constraints can
  be specified.
- Group related behavior into coherent features at a consistent level of
  detail. Use Sub-SRs for meaningful sub-features or behaviors rather than
  individual checks. A feature may derive from several URs.
- Explain each feature's role and behavior, including relevant conditions,
  actions, results, branches, dependencies, and exceptions. State obligations
  clearly, using "shall" or the equivalent in the requested language. Reuse
  another SR by reference where appropriate.
- Keep requirements verifiable. Add separate Verification Criteria only when
  they clarify a quantitative target or verification condition beyond the
  behavior itself. Preserve agreed human evaluation methods where applicable.
- Describe logical data, states, and values when needed to understand behavior.
  Concrete storage structures, APIs, protocols, and technology choices belong
  in design unless externally mandated.
- Review relevant quality needs, such as performance, security, reliability,
  and usability. Derive supported quality requirements separately; raise
  grounded gaps as questions instead of inventing targets or policies.
- Record externally mandated technical, organizational, or operating conditions
  under `System Constraints`, with a specific external source. Distinguish
  these from choices made by the designer.

## Decisions and State

Read current requirements and relevant decisions. Derive known behavior even
when some system details remain unresolved. Record missing behavior, terms,
quality criteria, priorities, or constraint decisions as questions under
`Pending System Specification Decisions`, with available source UR and related
SR IDs. Identify the quality attribute for quality-related questions.
Questions about product scope or acceptable user outcomes belong in UR;
implementation choices belong in design.

Use supported values and policies. Offer candidates when proposals are
requested, clearly distinguishing them from agreed decisions. Mark conflicting
positions as `Conflict` and retain them until resolved rather than silently
changing a confirmed requirement.

`State` is either `proposed` or `confirmed`. New SRs, including constraints,
are `proposed` unless the user confirms those SRs themselves; confirmation of
a source UR does not confirm a derived SR. Unresolved decisions are questions,
not additional states. Confirmation, priority, and implementation completion
are separate. Explain an area with no applicable requirements in a scope note.

When the user confirms source URs as part of the task, apply that decision to
the covered items with resolved product questions. Report affected IDs and the
basis for state changes; update source artifacts when included in the task.

## Traceability and Priority

Link each functional or quality SR to all confirmed URs from which it derives,
and each constraint to its external source. Sub-SRs inherit the parent SR's
sources and state.

Assign sequential IDs from `SR_01`, sharing the sequence with constraints.
Number Sub-SRs within each parent as `01`, `02`, and reference them elsewhere
as `SR_01_01`. Preserve existing IDs and append after the highest assigned
number without reusing retired IDs. For regrouping, retain viable IDs, record
changed-ID mappings, and update affected references within scope. Report
remaining downstream impacts.

Priority expresses importance within the agreed scope, not exclusion or
implementation order. Use these criteria for functional and quality items:

| Priority | Decision criterion |
|---|---|
| Must | Essential to the core goal or deployment. |
| Should | Important, but the system remains usable with a temporary workaround. |
| Could | Adds value with limited impact on the core goal if absent. |

Base priority on the input's goals, constraints, and alternatives. If the basis
is unclear, leave it undecided and record the question.

## Output

Use the requested language and format. Preserve an existing format unless a
change is requested. For new artifacts, begin with a brief system overview and
use this default structure for each functional or quality SR:

```markdown
## SR_01 <Feature or quality requirement name>

| Item | Content |
|---|---|
| Overview | <Feature role and overall behavior> |
| Type | Functional / Non-functional |
| State | proposed |
| Source UR | UR_01, UR_02 |

| Sub-SR | Function name | Requirement | Priority |
|---|---|---|---|
| 01 | <Sub-feature or quality item> | When <condition>, the system shall <action or result>. | <Must / Should / Could> |
```

Separate behavior branches into rows when that improves readability; they may
share a Sub-SR ID. Add `Verification Criteria` and `Data` when needed. Keep
these additions focused on understanding and verifying the requirement.

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
omit the feature overview and functional or quality SRs.

## Review

Evaluate coverage, clarity, verifiability, decision grounding, and traceability
against these principles, including relevant quality gaps. Report the most
consequential findings first with affected IDs and concrete improvements.
Rewrite only when requested, preserving agreed behavior, states, and sources.
