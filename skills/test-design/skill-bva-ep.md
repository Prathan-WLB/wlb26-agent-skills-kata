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

When all steps are complete, follow: `skill-export.md`
