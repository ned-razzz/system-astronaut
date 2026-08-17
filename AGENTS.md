# Repository Guidelines

## Project Structure & Module Organization

The repository is a self-contained Codex Skill package; there is no application
source tree or test suite.

```text
.
├── AGENTS.md                         # Contributor instructions
├── README.md                         # Skill purpose and UR → SR → architecture flow
└── system-astronaut/                 # Main Codex Skill package
    ├── SKILL.md                      # Trigger metadata and operating workflow
    ├── agents/
    │   └── openai.yaml               # UI-facing name and default prompt
    ├── references/
    │   ├── artifact-contracts.md     # States, IDs, links, and baselines
    │   └── workflow.md               # Stage inputs, outputs, and gates
    └── assets/
        └── project/                  # Copyable project-document templates
            ├── decisions.md          # Architecture and scope decisions
            ├── hardware-architecture.md # Hardware design placeholder
            ├── software-architecture.md # Software design placeholder
            ├── system-requirements.md  # SR document placeholder
            ├── traceability.md       # UR/SR/HW/SW relationship table
            └── user-requirements.md  # UR document placeholder
```

## Build, Test, and Development Commands

No build step is required. Validate the Skill after changing its frontmatter or layout:

```bash
python3 /home/robo/.codex/skills/.system/skill-creator/scripts/quick_validate.py system-astronaut
```

## Change Safety

Preserve the distinction between confirmed, proposed, open, conflicted, out-of-scope, and `n/a` states. Changes to IDs, stage gates, or traceability rules can affect every project template; update the related reference and templates together, then run validation.
