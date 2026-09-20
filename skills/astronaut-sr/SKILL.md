---
name: astronaut-sr
description: Create or review feature-oriented System Requirements from confirmed User Requirements, explaining system behavior with traceability and implementation neutrality. Use for functional or non-functional SR work, not architecture design.
---

# System Requirements

Create System Requirements that let a reader understand the system's purpose,
features, and behavior without additional explanation. Start from confirmed
User Requirements produced by `astronaut-ur`. Explain what the system does
and which quality conditions it must meet, never how it will be implemented.
Lead with feature understanding; use verification criteria to clarify behavior
where needed, not as a substitute for describing it.

## Workflow

1. Derive SRs only from URs whose state is `confirmed`.
2. Report every `proposed`, `open`, `conflicted`, `out-of-scope`, or `n/a` UR
   under `Unused UR Inputs`; do not convert or modify it. If no UR is
   `confirmed`, produce no SRs.
3. Analyze each confirmed User Story and its Acceptance Criteria for system
   features, sub-features, logical data, and necessary quality constraints.
4. Group related behavior into cohesive features. Give each feature or
   distinct quality requirement one unique sequential SR ID. Within it, use
   Sub-SR IDs for semantically complete sub-features or behaviors, not for
   individual checks or sentences.
5. Describe conditions, actions, and observable results so a reader can follow
   the behavior. Do not invent thresholds, supported options, failure policies,
   or other decisions absent from the input. Record unresolved behavior,
   scope, terms, states, or necessary quantitative criteria under
   `Open Questions`, citing the source UR and related SR where available.
6. Link each SR to all confirmed URs from which it is derived. Traceability is
   recorded at the SR feature level, not on every requirement bullet.
   Sub-SRs inherit their parent SR's source URs and state.

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

Keep APIs, protocols, technology choices, internal structures, and hardware
or software architecture out of SR. Do not restate user goals as system
behavior or add speculative quality requirements.

## Output

Use the user's requested language.

### Create

Begin with a short system overview explaining its purpose and how the main
features relate, grounded in the confirmed URs. Do not introduce new scope.
Then use this shape for each SR:

```markdown
## SR_01 <Feature or quality requirement name>

<One- to three-sentence explanation of the feature's role and overall behavior>

- **Type:** Functional | Non-functional
- **State:** proposed
- **Source UR:** UR_01, UR_02
- **Priority:** Required

### SR_01.1 <Sub-feature or behavior name>

<Short explanation of this sub-feature's responsibility and scope>

#### Behavior

- Under <condition>, the system shall <action or observable result>.

#### Verification Criteria

- <Supported quantitative criterion or separate verification condition, if needed>

### Data

- <Logical data item or state>: <Meaning and relevant values>
```

Assign IDs sequentially starting at `SR_01`; when extending an artifact, use
the next available ID. Number Sub-SRs within their parent (`SR_01.1`,
`SR_01.2`). Preserve existing SR and Sub-SR IDs when updating; append new IDs
without renumbering existing items. Omit Verification Criteria and Data when
not needed. Append only the applicable sections:

```markdown
## Open Questions

- <Unresolved behavior, scope, term, state, or quantitative criterion> (**Source UR:** UR_01; **Related SR:** SR_01.1)

## Unused UR Inputs

- UR_02 (`proposed`): not derived because it is not confirmed.
```

Omit Related SR when no SR has been assigned. Do not add empty sections. If
there are no confirmed URs, return only `Unused UR Inputs`, without an overview
or SRs.

### Review

Return prioritized findings for derivation from unconfirmed URs, missing
coverage of confirmed URs, missing or incorrect traceability, unclear feature
purpose or behavior flow, fragmented sub-features, missing conditions or
necessary exception behavior, unverifiable wording, unsupported values or
quality constraints, implementation details, duplicate IDs, and incorrect
states. Flag verification checklists that replace feature explanations or
merely repeat Behavior. Treat unresolved decisions as questions, not permission
to supply missing policies. Preserve the artifact and all existing IDs unless
the user requests a rewrite.
