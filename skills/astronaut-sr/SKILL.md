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

1. Derive functional and non-functional SRs only from in-scope `confirmed`
   URs. Read `Excluded Scope` and do not derive SRs from those excluded goals.
   If the user explicitly approves all URs or a named set, first update only
   the covered `proposed` URs to `confirmed` and report the changed IDs. A UR
   with unresolved product decisions stays `proposed`; do not infer approval
   or resolve its pending questions silently.
2. List remaining in-scope `proposed` URs under `Unused UR Inputs` with a reason
   when useful. Excluded goals remain documented in `Excluded Scope` and are
   not unused derivation inputs. If no in-scope UR is `confirmed`, produce no
   functional or non-functional SRs.
3. Read current requirements and relevant user decisions before relying on
   historical logs. Ask the user about conflicting or ambiguous decisions
   rather than assuming a resolution from log dates. Analyze each confirmed
   User Story and its Acceptance Criteria for features, sub-features, and
   logical data. Missing detailed
   system criteria do not move a confirmed UR to `Unused UR Inputs`: derive
   its known behavior and record the remaining specification decisions.
4. Group related behavior into complete user-facing features before assigning
   IDs; do not mechanically create one SR per UR. Compare top-level functional
   SRs for consistent granularity: avoid mixing a complete feature with a
   similar feature's individual steps. Keep quality SRs and constraints
   distinct. Give each feature one SR ID and use Sub-SR IDs as `01`, `02` for
   semantically complete sub-features or behaviors, not individual checks or
   sentences. Outside the table, qualify the ID as `SR_01_01`.
5. Describe conditions, actions, and observable results so a reader can follow
   the behavior. Do not invent thresholds, supported options, failure policies,
   or other decisions absent from the input. Record unresolved system behavior
   within the agreed product scope, such as supported cases, terms, states, or
   necessary quantitative criteria, under `Pending System Specification
   Decisions`, citing the source UR and related SR where available. Write each
   entry as a question. Propose new numerical
   values or policies only when the user requests proposals, and distinguish
   candidates from agreed decisions. Existing proposed values retain their
   status; preserving them does not approve them.
6. Perform a Quality Sweep after drafting functional SRs. Review the confirmed
   URs and drafted SRs for potentially missing, architecturally relevant
   quality requirements, such as performance, security, reliability, and
   usability. Use quality attributes as a checklist, not a required count.
   If a quality requirement is already defined in the confirmed input, derive
   a distinct non-functional SR with its own ID and source UR; do not duplicate
   one already covered. If a relevant quality need is grounded in confirmed
   functionality but its required behavior or criterion is unknown, record
   the missing decision under `Pending System Specification Decisions` with its
   quality attribute and any available source UR or related SR. Ignore
   irrelevant attributes. Never invent a quality target, threshold, or policy
   to complete the sweep.
7. Capture system constraints explicitly supplied outside the UR artifact
   under `System Constraints`. Give each a unique SR ID, state, and traceable
   external source. Do not derive system constraints from URs. If it is unclear
   whether a constraint is mandated, ask under
   `Pending System Specification Decisions`. Keep technology and deployment
   choices made by the designer in architecture. A reference note or old
   implementation idea is not evidence that a constraint was mandated; retain
   the actual external source even if its location has changed.
8. Link each functional and non-functional SR to all confirmed URs from which
   it is derived. Link each constraint SR to the specific external input.
   Traceability is recorded at the SR level, not on every requirement bullet.
   Sub-SRs inherit their parent SR's source URs and state.
9. Apply answers only to the affected requirements and questions. Questions
   about whether a user goal or feature belongs in the product, or what user
   outcome is acceptable, belong in UR's `Pending Product Decisions`. Questions
   about how a confirmed feature behaves within that product scope, quality
   criteria, and external constraints belong here. Implementation methods
   belong in design. Respect a narrowed task and update other artifacts only
   within the user's scope.
   Report changed IDs and the user decision supporting each state change;
   do not request the same approval again or infer approval of other items.

For URs and SRs, `State` has only two values: `proposed` and `confirmed`.
A newly derived SR is `proposed` unless the user explicitly confirms the SR
itself; a confirmed source UR does not automatically confirm its derived SR.
Keep unresolved system decisions in `Pending System Specification Decisions`,
not in the State field. Mark conflicting sources or stakeholder positions with
`Conflict` in that section and preserve both positions; never resolve them by
changing an agreed requirement silently. Exclude product goals in UR's
`Excluded Scope` rather than assigning them an SR state. Use `n/a` only to
explain why an architecture view or applicability area has no relevant
requirements; it is not a UR or SR state. Agreement, implementation order, and
implementation completion are separate. An empty pending decision list does
not confirm the SRs.

Priority denotes importance within the whole agreed product scope; it does not
mean that lower-priority requirements are excluded. For functional and quality
SRs, assign `Must`, `Should`, or `Could` using these criteria:

| Priority | Decision criterion |
|---|---|
| **Must** | Without it, the core goal cannot be achieved or the system cannot be deployed. |
| **Should** | It is important, but the system remains usable without it and a temporary workaround exists. |
| **Could** | It adds value, but its absence has little impact on the core system. |

Base the classification on explicit goals, constraints, and alternatives in the
input. If the importance or existence of a workaround is unclear, ask under
`Pending System Specification Decisions` and leave the Priority cell empty
until it is resolved. Do not use Priority to invent scope or implementation
order within a category.

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
sentences. Explain feature relationships in Overview, referring to another SR
when its behavior is reused instead of defining the same behavior twice.
For each sub-feature, provide a short name and a concise `Requirement`:

- State the condition and required action or observable result together in
  one or two sentences. Express obligations as "shall" or the equivalent in
  the requested language, such as "~해야 한다" in Korean. Avoid repeating the
  name or Overview as a separate responsibility description.
- Explain order and dependencies when supported by the source. Table numbering
  alone does not prescribe execution order.
- Describe relevant branches based on user input, system state, or target state.
- Include failure, interruption, or missing-target behavior when supported by
  the input and needed to understand the feature. If necessary behavior is
  undecided, raise a question rather than choosing a policy. For recovery or
  interruption, retain the supported conditions and completion outcomes;
  an attempted action does not itself prove that the intended result occurred.

Add `Verification Criteria` only when a quantitative criterion or separate
verification condition is needed. Use supported values and conditions; do not
repeat Requirement as a checklist or invent metrics to fill this section.
Requirements must remain verifiable even when this section is omitted. Not
every requirement needs a numerical measure or automatic acceptance decision;
preserve a confirmed human evaluation method when that is the intended result.

Add `Data` only when logical data, states, or values are needed to understand
the feature. Describe their meaning and composition, not database tables,
keys, concrete types, message formats, classes, or storage.

Keep design-selected APIs, protocols, technology choices, internal structures,
and hardware or software architecture out of SR. Record a technology or
environment only when the input explicitly mandates it as a system constraint.
Do not restate user goals as system behavior or add speculative quality
requirements.

## Output

Use the user's requested language. Use the following default for new artifacts;
honor a requested format and preserve an existing format when updating unless
the user requests a format change. This is a project convention, not a claim
that an international standard mandates these columns.

### Create

When approval changes UR states, report the affected IDs under `Confirmed UR
Updates` and update the UR artifact when it is part of the requested work.
When confirmed URs exist, begin with a short system overview explaining its
purpose and how the main features relate. Do not introduce new scope. Then use
a compact metadata table and a requirement table for each functional or quality
SR. Give each behavior branch its own row, combining its condition and required
behavior in Requirement. Repeat the Sub-SR ID and name for additional branches
of the same sub-feature. In quality SRs, Function name identifies the quality
item being evaluated. Keep table cells concise; retain supported dependencies.
Use this shape:

```markdown
## SR_01 <Feature or quality requirement name>

| Item | Content |
|---|---|
| Overview | <One- to three-sentence explanation of the feature's role and overall behavior> |
| Type | Functional / Non-functional |
| State | proposed |
| Source UR | UR_01, UR_02 |

| Sub-SR | Function name | Requirement | Priority |
|---|---|---|---|
| 01 | <Short name> | When <condition>, the system shall <action or observable result>. | <Must / Should / Could> |
| 01 | <Same name> | When <another branch condition>, the system shall <result>. | <Must / Should / Could> |
| 02 | <Short name> | The system shall <required behavior>. | <Must / Should / Could> |

### Data

| Logical data item or state | Meaning and relevant values |
|---|---|
| <Item or state> | <Meaning and relevant values> |
```

Assign IDs sequentially starting at `SR_01`; when extending an artifact, use
the next available ID. Number Sub-SRs `01`, `02`, and so on within each
parent SR. When referencing one elsewhere, combine the parent and Sub-SR
numbers (`SR_01_01`; the first Sub-SR of `SR_02` is `SR_02_01`). Preserve
existing SR and Sub-SR IDs when updating; append new IDs after the highest
previously assigned number without renumbering existing items or reusing
retired IDs. If a requested regrouping changes a parent or merges or splits
items, preserve viable parent IDs and record the old-to-new mapping for changed
IDs. Preserve behavior, criteria, and states; update Source UR, Data, pending
decision references, and affected document links within scope. Report remaining
downstream references rather than silently editing architecture.

Use the same SR ID sequence for constraints. Always retain Priority in the
functional and quality requirement tables, with no duplicate metadata row.
When a separate verification condition is needed, add `Verification Criteria`
after Priority and ensure every row matches the header. Omit Data when not
needed. When external constraints are present, append:

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
is `proposed` unless the user explicitly confirms that SR itself. Always include
the pending decision section; include the other sections below only when
applicable:

```markdown
## Confirmed UR Updates

- UR_01, UR_02: `proposed` → `confirmed` (explicit user approval).

## Pending System Specification Decisions

- <Question about unresolved system behavior, terms, states, or a necessary criterion?> (**Source UR:** UR_01; **Related SR:** SR_01_01)
- <Question about a potentially missing quality requirement or criterion?> (**Quality:** Performance efficiency; **Source UR:** UR_03; **Related SR:** SR_04)
- **Conflict:** <Which source or stakeholders disagree, and what competing decisions need resolution?> (**Source UR:** UR_02; **Related SR:** SR_02)

## Unused UR Inputs

- UR_02 (`proposed`): derivation deferred because it is not confirmed; this does not exclude it from the product scope.

## Excluded UR Inputs

- UR_03: excluded from product scope; not used to derive SRs.
```

For quality questions, include `Quality`; include Source UR and Related SR
only when a specific confirmed UR or existing SR applies. When no questions
remain, write "No system specification decision questions are currently
registered. This does not mean all SRs are confirmed." in the requested
language. Do not add other empty sections. When changing an existing
decision-section title, update affected links and anchors within the requested
artifact set. If there are no confirmed URs, omit the overview and functional
or non-functional SRs; include directly supplied constraints when present.

### Review

Return prioritized findings for derivation from unconfirmed URs, missing
coverage of confirmed URs, missing or incorrect traceability, unclear feature
purpose or behavior flow, inconsistent top-level granularity, fragmented
sub-features, duplicated behavior across features, missing conditions or
necessary exception behavior, unverifiable wording, unsupported values or
quality constraints, potentially missing architecturally relevant quality
requirements identified by the Quality Sweep, implementation details,
missing or unsupported external constraints, assumed priorities, approval
scope errors, misplaced product or design questions, lost ID mappings or
references, mismatched table columns, duplicate IDs, and incorrect states.
Flag verification checklists that replace feature explanations or merely
repeat Requirement. Treat unresolved decisions as questions, not permission
to supply missing policies. Preserve the artifact unless the user requests
changes; apply the ID and traceability rules above during rewrites.
