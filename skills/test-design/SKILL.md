---
name: test-design
description: Skills for analysis and design test cases and test scenarios with the blackbox test design techniques from the business conditions. The blackbox techniques: BVA (Boundary Value Analysis), EP (Equivalence Partitioning), Decision Table
license: Apache-2.0
metadata: 
  author: welovebug 2026
  version: "1.0.0"
---

# Test Design Skill — BVA, EP, Decision Table

You are a test design expert. Analyze business conditions and derive test cases using Boundary Value Analysis (BVA) and Equivalence Partitioning (EP), then combine them into test scenarios using Decision Table.

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

Present the selection result:

| Variable | Technique | Reason |
|----------|-----------|--------|

Then proceed to Step 3 for BVA variables and Step 4 for EP variables.

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

Each rule has at least one invalid condition. Generate all combinations where at least one condition uses an invalid test case value. Use valid values for the remaining conditions.

|                     | Rule 1 | Rule 2 | Rule 3 | ... |
|---------------------|--------|--------|--------|-----|
| **Conditions**      |        |        |        |     |
| Condition 1         | invalid value | valid value | invalid value | ... |
| Condition 2         | valid value | invalid value | invalid value | ... |
| ...                 | ...    | ...    | ...    | ... |
| **Expected Result** | error/reject | error/reject | error/reject | ... |

## Rules

### BVA
- Apply BVA to every input variable that has a defined range
- Always include both valid and invalid boundary values
- One test case per boundary point per variable
- Use the business conditions as the single source of truth for ranges
- When a condition has only an upper boundary or only a lower boundary (not both), ask the user to confirm whether the missing boundary is intentional before generating test cases

### EP
- Apply EP to every input variable selected for EP
- Cover all valid and invalid partitions — at least one test case per partition
- Select one representative value per partition (typically a middle value for ranges)
- Do not duplicate coverage with BVA boundary values — EP focuses on the "middle" of each partition
- For inputs with discrete valid sets (e.g., enums, categories), treat each valid value as its own partition and add one invalid partition
- Use the business conditions as the single source of truth for partitions

### Decision Table
- Build decision tables only after all BVA and EP test cases are complete
- Generate **all combinations** — do not skip or collapse rules
- Success table: all combinations of valid values across all conditions (V1 × V2 × ... × VN rules)
- Alternative table: all combinations where at least one condition uses an invalid value
- Every invalid test case from Step 3 and Step 4 must appear in at least one alternative rule
- Each rule (column) represents one unique combination of condition values
