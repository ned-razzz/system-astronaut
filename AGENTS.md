# Repository Guidelines

## Project Structure

This repository contains three independent Agent Skills. Keep each workflow in
its own `SKILL.md`.

```text
.
├── AGENTS.md
├── README.md
├── skills/
│   ├── astronaut-ur/SKILL.md
│   ├── astronaut-sr/SKILL.md
│   └── astronaut-sa/SKILL.md
└── tests/
    └── astronaut-ur/
        ├── cases.yaml
        └── fixtures/
```

The workflow is:

```text
Project Description → User Requirements → System Requirements → System Architecture
```

Do not add an orchestration Skill, references, assets, or per-Skill test
scaffolding until repeated use demonstrates that they are needed.

## Validation

Validate every changed Skill after modifying its frontmatter or layout:

```powershell
python "$env:USERPROFILE\.codex\skills\.system\skill-creator\scripts\quick_validate.py" .\skills\<skill-name>
```

## Change Safety

For UR and SR, use `confirmed` and `proposed` as the only requirement state
values. Preserve the other distinctions separately: record unresolved
decisions as questions, mark conflicts explicitly, retain excluded product
goals under Excluded Scope. Keep traceability from UR to SR and from SR to
architecture items. Do not silently invent unresolved decisions.
