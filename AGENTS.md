# Repository Guidelines

## Project Structure

This repository contains four independent Agent Skills. Keep each workflow in
its own `SKILL.md`; do not merge them into a single conditional Skill.

```text
.
├── AGENTS.md
├── README.md
├── .agents/
│   └── skills/
│       ├── astronaut-ur/SKILL.md
│       ├── astronaut-sr/SKILL.md
│       ├── astronaut-hw/SKILL.md
│       └── astronaut-sw/SKILL.md
└── tests/
    └── astronaut-ur/
        ├── cases.yaml
        └── fixtures/
```

The workflow is:

```text
Project Brief → User Requirements → System Requirements
                                      ├→ Hardware Architecture
                                      └→ Software Architecture
```

Do not add an orchestration Skill, references, assets, or per-Skill test
scaffolding until repeated use demonstrates that they are needed.

## Validation

Validate every changed Skill after modifying its frontmatter or layout:

```bash
python3 /home/robo/.codex/skills/.system/skill-creator/scripts/quick_validate.py .agents/skills/<skill-name>
```

## Change Safety

Preserve the distinction between `confirmed`, `proposed`, `open`,
`conflicted`, `out-of-scope`, and `n/a` states. Keep traceability from UR to
SR and from SR to architecture items. Do not silently invent unresolved
decisions.
