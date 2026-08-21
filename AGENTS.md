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
```

## Build, Test, and Development Commands

No build step is required. Validate the Skill after changing its frontmatter or layout:

```bash
python3 /home/robo/.codex/skills/.system/skill-creator/scripts/quick_validate.py system-astronaut
```

## Change Safety

Preserve the distinction between confirmed, proposed, open, conflicted,
out-of-scope, and `n/a` states. Add references, templates, or scripts only when
real usage shows that `SKILL.md` alone is insufficient.
