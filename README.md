# WLB26 Agent Skills

A collection of Agent Skills for Claude Code, following the [Agent Skills specification](https://agentskills.io/specification).

## Skills

| Skill | Description |
|-------|-------------|
| [test-design](./skills/test-design/) | Blackbox test design techniques (BVA, EP, Decision Table, State Transition) for deriving test cases from business conditions |

## Project Structure

```
wlb26-skills/
├── scripts/
│   └── deploy.sh              # Deploy skills to validate-skills for testing
├── skills/
│   └── test-design/
│       ├── SKILL.md            # Router — Step 1 (Identify Variables) + Step 2 (Select Technique)
│       ├── skill-bva-ep.md     # Step 3 (BVA) + Step 4 (EP) + Step 5 (Decision Table)
│       ├── skill-state-transition.md  # Step 6 (State Transition)
│       ├── skill-export.md     # Step 7 (Export to Markdown)
│       ├── export-metadata.sh  # Bash script for session metadata collection
│       └── LICENSE.txt         # CC-BY-NC-ND-4.0
├── template/
│   └── SKILL.md               # Template for creating new skills
├── .gitignore
└── README.md
```

## test-design: Modular Architecture

The test-design skill uses a **router pattern** — only the entry point (`SKILL.md`) is loaded initially. Technique-specific files are loaded on-demand based on Step 2's technique selection:

```
SKILL.md (Step 1–2: identify variables, select technique)
  ├── skill-bva-ep.md          (loaded if BVA / EP / BVA+EP selected)
  ├── skill-state-transition.md (loaded if State Transition selected)
  └── skill-export.md          (always loaded last)
        └── export-metadata.sh (collects date, duration, tokens from session)
```

**Known limitation:** `export-metadata.sh` finds the active session by picking the most recently modified JSONL in `~/.claude/projects/`. If multiple Claude Code sessions are open simultaneously, it may pick the wrong session file.

## Deployment

Deploy a skill to `../validate-skills/.claude/skills/` for testing:

```bash
./scripts/deploy.sh test-design   # deploy one skill
./scripts/deploy.sh               # deploy all skills
```

## Creating a New Skill

1. Copy `template/SKILL.md` into a new directory under `skills/`
2. The directory name must match the `name` field in the SKILL.md frontmatter
3. Fill in the `name`, `description`, and instructions
4. Add the skill path to `.claude-plugin/marketplace.json`

## Contributing

See [Commit Message Convention](./docs/commit-message-convention.md) for commit message guidelines.

## Specification

See the full [Agent Skills specification](https://agentskills.io/specification) for details on skill structure, frontmatter fields, and best practices.
