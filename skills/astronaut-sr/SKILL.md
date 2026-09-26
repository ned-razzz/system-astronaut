---
name: astronaut-sr
description: Create or review traceable System Requirements from confirmed User Requirements and explicit external constraints. Use for functional, quality, or constraint SR work, not architecture design.
---

# System Requirements

Create System Requirements that let a reader understand the system's purpose,
features, and behavior without additional explanation. Start from confirmed
User Requirements produced by `astronaut-ur`. Explain what the system does
and which quality conditions it must meet, never how it will be implemented.
Lead with feature understanding; use verification criteria to clarify behavior
where needed, not as a substitute for describing it.

## Workflow

1. Derive functional and non-functional SRs only from `confirmed` URs. If the
   user explicitly approves all URs or a named set, first update only the
   covered `proposed` URs to `confirmed` and report the changed IDs. Do not
   infer approval or silently resolve `open` or `conflicted` URs.
2. Report every remaining `proposed`, `open`, `conflicted`, `out-of-scope`, or
   `n/a` UR under `Unused UR Inputs`; do not derive from or modify it. If no
   UR is `confirmed`, produce no functional or non-functional SRs.
3. Analyze each confirmed User Story and its Acceptance Criteria for system
   features, sub-features, and logical data.
4. Group related functional behavior into cohesive features. Give each feature
   one unique sequential SR ID. Use Sub-SR IDs as `01`, `02` within each parent
   SR for semantically complete sub-features or behaviors, not for individual
   checks or sentences. When referring to a Sub-SR outside its table, qualify
   it with its parent SR, such as `SR_01_01`.
5. Describe conditions, actions, and observable results so a reader can follow
   the behavior. Do not invent thresholds, supported options, failure policies,
   or other decisions absent from the input. Record unresolved behavior,
   scope, terms, states, or necessary quantitative criteria under
   `Open Questions`, citing the source UR and related SR where available.
6. Perform a Quality Sweep after drafting functional SRs. Review the confirmed
   URs and drafted SRs for potentially missing, architecturally relevant
   quality requirements, such as performance, security, reliability, and
   usability. Use quality attributes as a checklist, not a required count.
   If a quality requirement is already defined in the confirmed input, derive
   a distinct non-functional SR with its own ID and source UR; do not duplicate
   one already covered. If a relevant quality need is grounded in confirmed
   functionality but its required behavior or criterion is unknown, record
   the missing decision under `Open Questions` with its
   quality attribute and any available source UR or related SR. Ignore
   irrelevant attributes. Never invent a quality target, threshold, or policy
   to complete the sweep.
7. Capture system constraints explicitly supplied outside the UR artifact
   under `System Constraints`. Give each a unique SR ID, state, and traceable
   external source. Do not derive system constraints from URs. If it is unclear
   whether a constraint is mandated, ask under `Open Questions`. Keep
   technology and deployment choices made by the designer in architecture.
8. Link each functional and non-functional SR to all confirmed URs from which
   it is derived. Link each constraint SR to the specific external input.
   Traceability is recorded at the SR level, not on every requirement bullet.
   Sub-SRs inherit their parent SR's source URs and state.

Use only `confirmed`, `proposed`, `open`, `conflicted`, `out-of-scope`, or
`n/a` as states. A newly derived SR is `proposed` unless the user explicitly
confirms the SR itself; a confirmed source UR does not automatically confirm
its derived SR. Preserve existing SR states and IDs when reviewing or
updating. Include priority only when explicitly supplied.

## Content

Write these kinds of SR:

- Functional requirements: system features and behavior.
- Non-functional requirements: necessary, verifiable quality constraints such
  as performance, safety, reliability, security, usability, or
  maintainability.
- System constraints: technical, organizational, or operating conditions
  explicitly mandated outside the UR artifact, recorded separately from
  functional and quality SRs.

Explain each feature's role in the system and overall behavior in one to three
sentences. Give each sub-feature a short explanation of its responsibility
and scope, followed by `Behavior`:

- State the conditions under which the system acts and the action or result.
- Explain order and dependencies when actions form a sequence.
- Describe relevant branches based on user input, system state, or target state.
- Include failure, interruption, or missing-target behavior when supported by
  the input and needed to understand the feature. If necessary behavior is
  undecided, raise a question rather than choosing a policy.

Add `Verification Criteria` only when a quantitative criterion or separate
verification condition is needed. Use supported values and conditions; do not
repeat Behavior as a checklist or invent metrics to fill this section.
Requirements must remain verifiable even when this section is omitted.

Add `Data` only when logical data, states, or values are needed to understand
the feature. Describe their meaning and composition, not database tables,
keys, concrete types, message formats, classes, or storage.

Keep design-selected APIs, protocols, technology choices, internal structures,
and hardware or software architecture out of SR. Record a technology or
environment only when the input explicitly mandates it as a system constraint.
Do not restate user goals as system behavior or add speculative quality
requirements.

## Output

Use the user's requested language.

### Create

When approval changes UR states, report the affected IDs under `Confirmed UR
Updates` and update the UR artifact when it is part of the requested work.
When confirmed URs exist, begin with a short system overview explaining its
purpose and how the main features relate. Do not introduce new scope. Then use
a compact metadata table and a behavior table for each functional or quality
SR. Give each behavior branch its own row so its condition and observable
result can be read together. Repeat the Sub-SR ID for additional branches of
the same sub-feature. Keep table cells concise; retain the order of dependent
actions in the result.
Use this shape:

```markdown
## SR_01 <Feature or quality requirement name>

| Item | Content |
|---|---|
| Overview | <One- to three-sentence explanation of the feature's role and overall behavior> |
| Type | Functional / Non-functional |
| State | proposed |
| Source UR | UR_01, UR_02 |

| Sub-SR and scope | Condition | System behavior and result | Verification Criteria |
|---|---|---|---|
| 01 — <Name and brief responsibility> | <Condition> | <Action or observable result> | <Supported criterion, if needed> |
| 01 | <Another branch condition, if any> | <Result for that branch> | — |
| 02 — <Name and brief responsibility> | <Condition> | <Action or observable result> | — |

### Data

| Logical data item or state | Meaning and relevant values |
|---|---|
| <Item or state> | <Meaning and relevant values> |
```

Assign IDs sequentially starting at `SR_01`; when extending an artifact, use
the next available ID. Number Sub-SRs `01`, `02`, and so on within each
parent SR. When referencing one elsewhere, combine the parent and Sub-SR
numbers (`SR_01_01`; the first Sub-SR of `SR_02` is `SR_02_01`). Preserve
existing SR and Sub-SR IDs when updating; append new IDs without renumbering
existing items. Use the same SR ID sequence for constraints. Omit the Priority
row unless supplied, and omit the Verification Criteria column and Data table
when not needed. When external constraints are present, append:

```markdown
## System Constraints

### SR_XX <Constraint name>

| Item | Content |
|---|---|
| State | proposed |
| Source | <specific external input> |
| Constraint | <Externally mandated condition> |
```

Quote or identify the external input. A new constraint SR
is `proposed` unless the user explicitly confirms that SR itself. Append only
the other applicable sections:

```markdown
## Confirmed UR Updates

- UR_01, UR_02: `proposed` → `confirmed` (explicit user approval).

## Open Questions

- <Unresolved behavior, scope, term, state, or quantitative criterion> (**Source UR:** UR_01; **Related SR:** SR_01_01)
- <Potentially missing quality requirement or criterion> (**Quality:** Performance efficiency; **Source UR:** UR_03; **Related SR:** SR_04)

## Unused UR Inputs

- UR_02 (`proposed`): not derived because it is not confirmed.
```

For quality questions, include `Quality`; include Source UR and Related SR
only when a specific confirmed UR or existing SR applies. Do not add empty
sections. If there are no confirmed URs, omit the overview and functional or
non-functional SRs; include directly supplied constraints when present.

### Review

Return prioritized findings for derivation from unconfirmed URs, missing
coverage of confirmed URs, missing or incorrect traceability, unclear feature
purpose or behavior flow, fragmented sub-features, missing conditions or
necessary exception behavior, unverifiable wording, unsupported values or
quality constraints, potentially missing architecturally relevant quality
requirements identified by the Quality Sweep, implementation details,
missing or unsupported external constraints, assumed priorities, approval
scope errors, duplicate IDs, and incorrect states. Flag verification
checklists that replace feature explanations or merely repeat Behavior. Treat
unresolved decisions as questions, not permission to supply missing policies.
Preserve the artifact and all existing IDs unless the user requests a rewrite.
