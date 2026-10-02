---
name: astronaut-ur
description: Create or review lightweight User Requirements from a project brief or product idea as user stories with testable acceptance criteria. Use for user needs, user stories, acceptance criteria, or user-level product requirements; do not use for System Requirements or architecture.
---

# User Requirements

Create a concise, reviewable User Requirements artifact without shrinking the
user's stated product scope. A UR body consists of one User Story and its
Acceptance Criteria. Its ID, title, and state are metadata, not additional
requirement content.

## Workflow

1. Extract actors, goals, user value, observable outcomes, stated scope,
   explicit exclusions, and user-facing conditions. When updating an artifact,
   read its current content and relevant decisions before asking questions.
   Historical logs may describe superseded scope; do not reopen excluded or
   already resolved items based only on an old question list. If the applicable
   decision is conflicting or ambiguous, ask the user rather than choosing an
   interpretation or assuming the newest log overrides it.
2. Preserve all explicitly stated in-scope user goals. Reduce to the smallest
   usable scope only when the user explicitly requests an MVP, prototype,
   initial release, or scope reduction. Do not infer such a request from a
   desire for a lightweight document. Omit unstated or speculative goals;
   preserve explicitly included optional or future goals with their stated
   timing or condition. Keep the whole agreed product scope visible, including
   goals implemented later. Current implementation limitations do not change
   that scope. Implementation order belongs in SR, not UR.
3. Give each UR one user goal. Split only when goals can be independently
   accepted or delivered; keep tightly coupled outcomes together.
4. Write a short User Story that identifies who wants what and why. Use the
   usual "As a / I want / So that" shape when helpful, but do not force awkward
   wording.
5. Write Acceptance Criteria that let the user judge whether the goal is met.
   Use Given-When-Then when a behavior needs explicit conditions. Qualitative
   acceptance by a person is valid: identify what they observe or compare and
   how they judge the result. Do not require numerical thresholds or automatic
   scoring when the user accepts human judgment. Describe external integration
   through the expected observable outcome, not connection alone when actual
   operation is required.
6. Preserve uncertainty and disagreement instead of inventing decisions.
   Drafted items are `proposed` unless the source explicitly confirms them. If
   a known user goal lacks a required decision, keep its draft `proposed` and
   record the question under `Pending Product Decisions`. If no UR can be
   written without guessing, ask the question without creating a speculative
   requirement row.
   Missing system-level parameters alone do not create a product decision or
   invalidate an otherwise agreed user goal.
7. Ask only for unresolved product goals, scope, or acceptance conditions.
   Use concrete task examples to clarify vague terms. Leave system start
   conditions, timing rules, failure policies, and detailed verification
   procedures for SR; leave implementation methods for design. Respect any
   narrowing of the user's task and update only the requested artifacts.
8. Apply each clear answer to the affected content and resolve only the covered
   questions. In a task to confirm URs, a clear decision that settles an item's
   remaining product questions can confirm that item without asking for the
   same approval again. Otherwise retain its state unless approval is explicit.
   Report changed IDs and their decision basis briefly. Do not infer approval
   of other URs or treat an unresolved conflict as settled.

The UR `State` field has only two values: `proposed` and `confirmed`.
`confirmed` means agreement on the requirement, not implementation or
successful execution. A missing decision stays `proposed` and is represented
as a question, not as another state. Mark a pending item `Conflict` when
sources or stakeholders disagree, and preserve the competing positions until
the user resolves them. Never change a previously confirmed requirement to
resolve a conflict silently. An empty pending-decision list does not confirm
any requirement.

Use `Excluded Scope` for goals explicitly excluded from the whole product.
Preserve each excluded item's existing ID and content there; the section itself
records its exclusion. A later implementation date or lower priority is not an
exclusion. Do not use `n/a` as a UR state; when a whole subject is outside the
artifact's applicability, say why in the relevant scope note. Keep UR IDs
sequential and never reuse IDs of excluded items.

## Boundaries

- Keep user-observable behavior and expected outcomes in UR. Specify detailed
  system behavior in SR and APIs, databases, protocols, technology choices,
  internal structures, and architecture in design.
- Keep externally imposed system constraints outside UR; they are separate
  inputs to SR.
- Keep team-wide Definition of Done rules separate from Acceptance Criteria.
- Do not document every future detail. Leave refinement to conversation and
  update the UR when decisions are made.

## Output

Use the user's requested language. Use the following default for new artifacts;
honor a requested format and preserve an existing format when updating unless
the user requests a format change.

### Create

Use one table with one row per UR. Separate multiple Acceptance Criteria within
the cell using `•` and `<br>`:

```markdown
| ID | name | User story | Acceptance Criteria | State |
|---|---|---|---|---|
| UR_01 | <User goal> | <User> wants <goal> so that <value>. | • <Observable acceptance condition><br>• <Another condition, if needed> | proposed |
```

Assign unique sequential IDs starting at `UR_01`. When extending an artifact,
use the next available ID after the highest previously assigned number,
including excluded items. Never renumber existing items or reuse retired IDs.
Always include:

```markdown
## Pending Product Decisions

- <Question about an unresolved user goal, product scope, or acceptance condition?> (**Related UR:** UR_01)
- **Conflict:** <Which source or stakeholders disagree, and what competing decisions need resolution?> (**Related UR:** UR_02)
```

Reference an existing UR when applicable; do not invent an ID for a question.
When no questions remain, write "No product decision questions are currently
registered. This does not mean all URs are confirmed." in the requested
language. When explicit exclusions exist, also include:

```markdown
## Excluded Scope

- <Explicitly excluded product goal; reference the existing UR ID when available>
```

Retain explicitly excluded URs and their IDs and content under Excluded Scope
rather than discarding their history. Do not add other empty sections, priority,
or implementation fields. When changing an existing
decision-section title, update affected links and anchors within the requested
artifact set.

### Review

Return prioritized findings for combined goals, missing user value, untestable
criteria, implementation details, scope loss, misplaced system questions,
unnecessary numeric or automatic acceptance rules, repeated resolved questions,
approval scope errors, and incorrect states. Preserve the artifact unless the
user requests changes; keep existing IDs and decision history during rewrites.
If a requested merge or split changes IDs, record the old-to-new mapping and
update affected references within scope. Report downstream impact without
silently editing SR or architecture.
