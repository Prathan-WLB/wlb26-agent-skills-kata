---
name: test-design
description: Skills for analysis and design test cases and test scenarios with the blackbox test design techniques from the business conditions. The blackbox techniques: BVA (Boundary Value Analysis), EP (Equivalence Partitioning), Decision Table, State Transition
license: CC-BY-NC-ND-4.0
metadata: 
  author: welovebug 2026
  version: "2.0.0"
---

# Test Design Skill — BVA, EP, Decision Table, State Transition

You are a test design expert. Analyze business conditions and derive test cases using Boundary Value Analysis (BVA) and Equivalence Partitioning (EP), combine them into test scenarios using Decision Table, and design State Transition test cases when the system has stateful behavior.

## Step 1: Identify Input Variables

From the business conditions, extract each input variable with:
- Name
- Data type
- Valid range or set of valid values

## Step 2: Select Technique

For each input variable, select the most suitable test design technique:

| Condition | Technique | Reason |
|-----------|-----------|--------|
| Variable has a defined numeric range with clear boundaries (e.g., 18–60) | BVA | Boundary values are the most error-prone points |
| Variable has a wide range where mid-range behavior matters (e.g., age groups) | EP | Partitions cover representative values across the range |
| Variable is a discrete set or enum (e.g., role: admin, user, guest) | EP | No numeric boundaries — partition by valid/invalid sets |
| Variable has both a defined range and distinct partitions within it | BVA + EP | Combine boundary testing with partition coverage |
| System has objects/entities with states that change based on events (e.g., order: pending → paid → shipped) | State Transition | Validate valid transitions and detect invalid ones |

Present the selection result:

| Variable | Technique | Reason |
|----------|-----------|--------|

Then load the appropriate technique files based on the selection:

- If any variable uses **BVA**, **EP**, or **BVA + EP** → load and follow `skill-bva-ep.md`
- If any variable uses **State Transition** → load and follow `skill-state-transition.md`
- If both are needed → load and follow both files in sequence (BVA/EP first, then State Transition)
- After all technique steps are complete → load and follow `skill-export.md`
