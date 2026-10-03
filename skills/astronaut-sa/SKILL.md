---
name: astronaut-sa
description: Create or review a software architecture from confirmed System Requirements, showing software responsibilities, execution hosts, process boundaries, and communication in a traceable Mermaid diagram. Use for architecture design, not requirements authoring or detailed implementation.
---

# System Architecture

Show which software components fulfill confirmed System Requirements, where
they execute, and how they communicate. Start with an overall deployment and
process diagram; add detail only when it explains an important design choice.

## Workflow

1. Read confirmed SRs, their Sub-SRs, explicit constraints, existing architecture,
   agreed terminology, and latest design decisions. Separate established choices
   from unresolved questions.
2. Identify the diagram's scope and level: overall software structure and host
   placement by default, internal modules or runtime interactions when requested
   or needed to explain a requirement.
3. Group responsibilities, place components within their execution hosts, and
   describe meaningful connections. Preserve agreed boundaries and names.
4. Check requirement coverage, source links, and consistency between the diagram
   and its explanation. Record unresolved design decisions as specific questions.

## Design Principles

- Use in-scope `confirmed` SRs as requirement grounds, including their qualities
  and constraints. Proposed SRs are deferred inputs, not established obligations.
  Without confirmed SRs, do not derive a requirements-based architecture; describe
  only explicitly supplied structure and identify the missing confirmed input.
- Group related responsibilities at a consistent level. One SR does not imply
  one process, service, class, or module. Several SRs may be implemented by one
  process. Split components when responsibilities, execution location, isolation,
  lifecycle, or an agreed interface justify a real boundary.
- Distinguish logical areas, physical or virtual hosts, executable processes,
  and internal modules. Use nested groups for host placement; do not present an
  internal function as an independently deployed process. Logical areas such as
  UI or Service are useful labels, not a mandatory layer scheme.
- Show the execution hosts relevant to software deployment. Represent external
  devices or systems when software interacts with them; do not invent devices
  to fill an empty area. Hardware engineering details such as power and wiring
  are outside the default software architecture scope.
- Keep remote and same-host communication distinguishable through placement.
  Label important edges with direction and communication purpose; include a
  protocol when it is established or clearly identified as a design proposal.
  Bidirectional arrows mean communication in both directions, not merely that
  two components depend on one another. Do not assume TCP, HTTP, a message broker,
  or another technology solely to complete the diagram.
- State each component's responsibility briefly and relate it to relevant SRs.
  Do not copy the SR specification or expand the overall diagram into classes,
  API endpoints, database schemas, or algorithms without a need at that level.
  Explain quality-driven boundaries when they affect the structure.
- When one host represents multiple instances, explain what repeats and which
  components connect to each instance. Do not infer instance counts, redundancy,
  or scaling policies from a representative drawing.
- Preserve agreed supporting tools and explain their purpose and decision source.
  A developer monitor is not automatically a product requirement. Do not assign
  it an unrelated SR or add it merely because a reference example contains one.

## Decisions and Traceability

Make design proposals within confirmed requirements, distinguishing them from
existing agreements. Architecture authoring permits proposing a structure; it
does not establish that the user accepted its deployment, protocol, or technology
choices. A completed reference diagram reflects decisions for that project and
does not settle these choices for a new project.

Keep supported structure visible while questions remain. Record consequential
unresolved choices under `Pending Architecture Decisions`, with related
components, connections, and SR IDs. Offer a candidate and rationale when useful,
clearly marking it as proposed. An undecided protocol may be omitted from an edge
or labeled undecided; do not hide uncertainty behind a concrete technology.

Questions about product outcomes belong in UR, and questions about required
behavior or quality belong in SR. Identify those gaps without resolving them
through architecture assumptions or rewriting confirmed requirements. Mark
conflicting requirements or design decisions as `Conflict` and retain the
conflicting positions until resolved. Apply explicit answers across the diagram
and explanation, removing or revising resolved questions.

Link each core component and important requirement-driven connection or decision
to the relevant SR IDs; use Sub-SR references such as `SR_01_02` when precision
helps. Keep explicitly supplied design choices distinguishable from requirement
sources. Preserve existing component names, IDs, and source references when
updating an architecture. Traceability can live in a small responsibility table
or diagram annotations; a separate mapping document is unnecessary.

## Output

Use the requested language and format. Preserve an existing format unless a
change is requested. For a new architecture, put a Mermaid `flowchart TB` after
the document title, showing the overall software structure:

- Use subgraphs for execution hosts, optionally grouped into meaningful logical
  areas. Place process nodes inside the hosts where they run. Distinguish any
  internal module view from this deployment view.
- Use stable Mermaid node identifiers and quoted readable labels. Match names,
  host placement, and edge directions to the accompanying explanation.
- Label established protocols and important interaction purposes on edges.
  Keep external systems and devices outside the application's process boundary.
- Use readable visual distinctions between areas, hosts, and processes. Follow
  requested styling; a dark theme or a particular palette is not a design rule.

Add a compact table when needed to expose responsibilities and source links:

```markdown
| Component | Execution host | Responsibility | Source SR / design decision |
|---|---|---|---|
| <Process name> | <Host> | <Responsibility summary> | <SR IDs; explicit design source if applicable> |
```

Use a short note for repeated deployments, important connection semantics, or
quality-related rationale that the diagram cannot convey. Include pending
architecture questions when any remain. Explain a relevant but inapplicable
view or area as `n/a` with a reason; omit empty diagram groups. A software system
without separate devices can still require host deployment information.

The artifact contains architecture and its necessary explanation. Do not add
work reports, editing histories, ID mappings, follow-up tasks, or exhaustive
view catalogs. Add sequence diagrams, data-flow views, or internal decomposition
only when requested or needed to explain the current architecture.

## Review

Check that in-scope confirmed SRs have responsible components at the selected
level, quality obligations are supported by the structure or identified as open,
and no excluded or proposed requirement has become an established capability.
Check actual process and host boundaries, interaction directions, representative
instances, source links, and pending decisions. Verify Mermaid syntax and render
the diagram when a renderer is available; keep diagram and text consistent.

For a review request, report consequential findings with affected components
and SR IDs and suggest concrete improvements. Rewrite only when requested,
preserving agreed structure and requirement scope.
