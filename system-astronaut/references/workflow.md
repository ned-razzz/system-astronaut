# Architecture Workflow

## Stages

| Stage | Input | Output | Gate |
| --- | --- | --- | --- |
| Discovery | Service description | UR draft | Questions and conflicts are visible. |
| User Requirements | Confirmed discovery decisions | UR baseline | User confirms scope and priorities. |
| System Requirements | UR baseline | SR baseline | Each SR links to a UR and is reviewable. |
| Architecture | SR baseline | HW and SW architecture | Design elements link to SRs. |
| Change review | Changed artifact | Updated affected artifacts | Links and decisions remain consistent. |

## Transitions

- Do not turn an open UR into an SR requirement.
- Do not treat a proposed SR as an architecture constraint.
- Run Hardware and Software Architecture after SR is stable; either may expose
  an upstream gap and return the workflow to that stage.
- Preserve confirmed decisions unless the user changes them.
