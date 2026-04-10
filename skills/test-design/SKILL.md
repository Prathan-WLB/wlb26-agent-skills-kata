---
name: test-design
description: Skills for analysis and design test cases and test scenarios with the blackbox test design techniques from the business conditions. The blackbox techniques: BVA (Boundary Value Analysis), EP (Equivalence Partitioning), Decision Table, State Transition
license: CC-BY-NC-ND-4.0
metadata: 
  author: welovebug 2026
  version: "1.3.0"
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

Then proceed to Step 3 for BVA variables, Step 4 for EP variables, and Step 6 for State Transition behavior.

## Step 3: BVA — Determine Boundaries

For each BVA-selected variable, identify boundary values:

| Point | Description | Example (age: 18–60) |
|-------|-------------|----------------------|
| Min-  | Just below minimum (invalid) | 17 |
| Min   | Minimum boundary (valid) | 18 |
| Min+  | Just above minimum (valid) | 19 |
| Max-  | Just below maximum (valid) | 59 |
| Max   | Maximum boundary (valid) | 60 |
| Max+  | Just above maximum (invalid) | 61 |

Then generate BVA test cases **for each condition separately**. Each condition has its own table:

- One test case per boundary point per variable
- Use business conditions as the single source of truth for ranges
- If a condition has only one boundary (upper or lower), ask the user to confirm the missing boundary before generating test cases

### Condition: {condition name}

| TC ID | Variable | Value | Boundary | Expected | Success/Alternative |
|-------|----------|-------|----------|----------|---------------------|

## Step 4: EP — Define Equivalence Partitions

For each EP-selected variable, divide the input domain into partitions where all values in a partition are expected to be treated the same way:

| Partition Type | Description | Example (age: 18–60) |
|----------------|-------------|----------------------|
| Valid | Values within the accepted range/set | 18–60 |
| Invalid (below) | Values below the valid range | < 18 |
| Invalid (above) | Values above the valid range | > 60 |

For non-numeric or set-based inputs, define partitions by category:

| Partition Type | Description | Example (role: admin, user, guest) |
|----------------|-------------|-------------------------------------|
| Valid | A value from the valid set | admin |
| Invalid | A value not in the valid set | unknown |

Then select one representative value from each partition and generate EP test cases **for each condition separately**. Each condition has its own table:

- Do not duplicate coverage with BVA boundary values — EP focuses on the "middle" of each partition
- For discrete valid sets (enums, categories), treat each valid value as its own partition and add one invalid partition

### Condition: {condition name}

| TC ID | Variable | Partition | Representative Value | Expected | Success/Alternative |
|-------|----------|-----------|----------------------|----------|---------------------|

## Step 5: Decision Table — Design Test Scenarios

After all test cases from Step 3 and Step 4 are complete, combine conditions into test scenarios using Decision Table. Generate **all combinations** of condition values and separate into two tables:

### Success Scenarios

All conditions use valid values. Generate all combinations of valid test case values across conditions. Each rule is a unique combination.

For N conditions with V1, V2, ..., VN valid values respectively, the total number of success rules = V1 × V2 × ... × VN.

|                     | Rule 1 | Rule 2 | Rule 3 | ... | Rule (V1×V2×...×VN) |
|---------------------|--------|--------|--------|-----|----------------------|
| **Conditions**      |        |        |        |     |                      |
| Condition 1         | valid value A | valid value A | valid value B | ... | ... |
| Condition 2         | valid value X | valid value Y | valid value X | ... | ... |
| ...                 | ...    | ...    | ...    | ... | ... |
| **Expected Result** | result | result | result | ... | result |

### Alternative Scenarios

Each rule has at least one invalid condition. Generate all combinations where at least one condition uses an invalid test case value. Use valid values for the remaining conditions. Every invalid test case from Step 3 and Step 4 must appear in at least one alternative rule.

|                     | Rule 1 | Rule 2 | Rule 3 | ... |
|---------------------|--------|--------|--------|-----|
| **Conditions**      |        |        |        |     |
| Condition 1         | invalid value | valid value | invalid value | ... |
| Condition 2         | valid value | invalid value | invalid value | ... |
| ...                 | ...    | ...    | ...    | ... |
| **Expected Result** | error/reject | error/reject | error/reject | ... |

## Step 6: State Transition — Design Stateful Test Cases

Apply this step when the business conditions describe an entity with states that change in response to events/actions (e.g., order, subscription, document workflow, user account).

### 6.1 Identify States and Events

List all possible states and the events that can trigger transitions.

List every state and event explicitly — do not omit terminal or error states. If the business conditions are unclear about whether an event is allowed in a given state, ask the user to confirm before generating test cases.

**States:**

| State | Description |
|-------|-------------|
| {state name} | {what it means} |

**Events:**

| Event | Description |
|-------|-------------|
| {event name} | {what triggers it} |

### 6.2 Build the State Transition Table

Map every (current state, event) pair to its next state. Use `—` (or "invalid") when the event is not allowed in that state.

| Current State \ Event | Event 1 | Event 2 | ... |
|-----------------------|---------|---------|-----|
| State A               | State B | —       | ... |
| State B               | —       | State C | ... |
| ...                   | ...     | ...     | ... |

### 6.3 Generate State Transition Test Cases

Create test cases for **all valid transitions** and **all invalid transitions** (events not allowed in a given state).

#### Valid Transitions

| TC ID | Current State | Event | Expected Next State | Expected Outputs | Success/Alternative |
|-------|---------------|-------|---------------------|------------------|---------------------|

#### Invalid Transitions

| TC ID | Current State | Event | Expected Result (error/no change) | Success/Alternative |
|-------|---------------|-------|-----------------------------------|---------------------|

## Step 7: Export Test Cases to Markdown

This step is mandatory. When all steps are complete, load and follow: `skill-export.md`
