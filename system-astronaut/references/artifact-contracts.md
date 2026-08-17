# Artifact Contracts

## States

| State | Meaning |
| --- | --- |
| `confirmed` | User accepted the statement or decision. |
| `open` | Information is missing or ambiguous. |
| `proposed` | A candidate supplied for user review. |
| `conflicted` | The item contradicts another confirmed item. |
| `out-of-scope` | Deliberately excluded from the current baseline. |
| `n/a` | The artifact section does not apply; record why. |

## IDs and Links

- Assign `UR-###` to User Requirements and `SR-###` to System Requirements.
- Assign `HWA-###` and `SWA-###` to architecture decisions or components only
  when they need a requirement link.
- Link each SR to one or more URs, and each architecture item to one or more
  SRs.
- Keep unresolved items in the active artifact's Open Items section.

## Baselines

- Mark a document `baseline` only after its open and conflicted items are
  resolved or explicitly accepted as out of scope.
- Record changed baselines and their downstream impact in `decisions.md`.
