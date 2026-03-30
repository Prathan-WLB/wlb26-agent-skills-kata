# WLB26 Agent Skills

A collection of Agent Skills for Claude Code, following the [Agent Skills specification](https://agentskills.io/specification).

## Skills

| Skill | Description |
|-------|-------------|
| [wlb26-test-design-skill](./skills/wlb26-test-design-skill/) | Blackbox test design techniques (BVA) for deriving test cases from business conditions |

## Project Structure

```
wlb26-skills/
├── .claude-plugin/
│   └── marketplace.json       # Plugin marketplace configuration
├── skills/                    # All skill implementations
│   └── wlb26-test-design-skill/
│       └── SKILL.md           # Skill definition and instructions
├── spec/
│   └── agent-skills-spec.md   # Link to the Agent Skills specification
├── template/
│   └── SKILL.md               # Template for creating new skills
├── .gitignore
└── README.md
```

## Creating a New Skill

1. Copy `template/SKILL.md` into a new directory under `skills/`
2. The directory name must match the `name` field in the SKILL.md frontmatter
3. Fill in the `name`, `description`, and instructions
4. Add the skill path to `.claude-plugin/marketplace.json`

## Specification

See the full [Agent Skills specification](https://agentskills.io/specification) for details on skill structure, frontmatter fields, and best practices.
