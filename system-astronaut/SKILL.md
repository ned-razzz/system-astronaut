---
name: system-astronaut
description: Turn a service idea into traceable User Requirements, System Requirements, Hardware Architecture, and Software Architecture for an individual or small agile team. Use when a user asks to clarify a product idea, draft or review UR/SR, derive architecture from requirements, or assess the impact of a requirement change.
---

# System Astronaut

Guide an idea through a reviewable architecture flow. Keep the smallest set of
artifacts that makes the next engineering decision possible.

## Workflow

Read [references/workflow.md](references/workflow.md) before starting. Read
[references/artifact-contracts.md](references/artifact-contracts.md) whenever
creating or updating project artifacts.

1. Capture the user's description as a User Requirements draft.
2. Surface missing, ambiguous, conflicting, or out-of-scope items. Do not
   silently supply them.
3. Establish a user-confirmed UR baseline before deriving System Requirements.
4. Establish an SR baseline before deriving Hardware or Software Architecture.
5. Record architecture decisions and keep requirement links current.
6. Revisit only affected downstream artifacts when an upstream item changes.

## Interaction Rules

- Treat user-confirmed statements as facts.
- Label every unresolved statement instead of guessing it.
- Offer a proposal only when it helps the user decide; keep it non-authoritative
  until confirmed.
- Explain when a requested direction conflicts with confirmed requirements.
- Ask the smallest useful set of questions, then pause for answers before
  advancing a gated stage.
- Mark Hardware Architecture as `N/A` with a reason when the system has no
  meaningful hardware or deployment-topology decision.

## Project Artifacts

Copy [assets/project](assets/project) into the project's chosen documentation
location when the user asks for files. Otherwise, draft the active artifact in
the conversation.

Use the artifact IDs and state labels from `artifact-contracts.md`. Do not
declare a baseline until its open items are resolved or explicitly accepted as
out of scope.
