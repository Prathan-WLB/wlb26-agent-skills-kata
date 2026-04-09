---
name: test-design
description: Skills for analysis and design test cases and test scenarios with the blackbox test design techniques from the business conditions. The blackbox techniques: BVA (Boundary Value Analysis), EP (Equivalence Partitioning), Decision Table, State Transition
license: CC-BY-NC-ND-4.0
metadata: 
  author: welovebug 2026
  version: "1.2.0"
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

## Step 6: State Transition — Design Stateful Test Cases

Apply this step when the business conditions describe an entity with states that change in response to events/actions (e.g., order, subscription, document workflow, user account).

### 6.1 Identify States and Events

List all possible states and the events that can trigger transitions.

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

This step is **mandatory** and must always be performed as the final action of every test design session. Do not end the session without asking the export question — even if the user did not mention exporting.

Immediately after the last applicable step (Step 5 or Step 6) finishes, perform the following:

1. Ask the user for confirmation before exporting:
   > "Do you want me to export all test cases to a Markdown file? (yes/no) If yes, please confirm the file path or filename."
2. Wait for the user's confirmation. Do not export until the user explicitly agrees.
3. If the user declines, acknowledge and end the session. The export question itself is required; the export action is not.
4. If confirmed, **before** writing the file, gather real values for the metadata header by running these Bash commands:

   **a. Get the current date (real wall-clock):**
   ```bash
   date "+%Y-%m-%d"
   ```

   **b. Get the total session duration** from the same JSONL transcript by computing the difference between the first and last entry's `timestamp` field:
   ```bash
   PROJECT_DIR="$HOME/.claude/projects/$(pwd | sed 's|/|-|g')"
   SESSION_FILE=$(ls -t "$PROJECT_DIR"/*.jsonl 2>/dev/null | head -1)
   jq -rs '
     [.[] | .timestamp // empty] as $ts
     | ($ts | min) as $start
     | ($ts | max) as $end
     | (($end | fromdateiso8601) - ($start | fromdateiso8601)) as $secs
     | "\($secs | floor / 3600 | floor)h \(($secs | floor / 60 | floor) % 60)m \($secs | floor % 60)s (\($secs | floor)s total)"
   ' "$SESSION_FILE"
   ```

   **c. Get the total tokens used in the current session** by reading Claude Code's session transcript. Find the most recently modified JSONL file in the current project's session directory and sum every API call's usage fields:
   ```bash
   PROJECT_DIR="$HOME/.claude/projects/$(pwd | sed 's|/|-|g')"
   SESSION_FILE=$(ls -t "$PROJECT_DIR"/*.jsonl 2>/dev/null | head -1)
   jq -s '
     [.[] | .message.usage // empty
       | { input: (.input_tokens // 0),
           output: (.output_tokens // 0),
           cache_creation: (.cache_creation_input_tokens // 0),
           cache_read: (.cache_read_input_tokens // 0) }]
     | { input: (map(.input) | add),
         output: (map(.output) | add),
         cache_creation: (map(.cache_creation) | add),
         cache_read: (map(.cache_read) | add),
         total: (map(.input + .output + .cache_creation + .cache_read) | add) }
   ' "$SESSION_FILE"
   ```

   If either command fails (e.g., `jq` not installed, no session file), fall back to the best available value and label it as approximate.

5. Write a single Markdown file containing **all** generated artifacts in this order:
   - **Metadata header** — at the very top of the file, include the real values captured above:
     - **Date:** YYYY-MM-DD (from the `date` command)
     - **Total Duration:** session length in `Hh Mm Ss` format (from the duration command in step 4b)
     - **Tokens Used:** total token count from the JSONL sum, with a breakdown of input / output / cache_creation / cache_read on separate lines
   - Input Variables (Step 1)
   - Technique Selection (Step 2)
   - BVA Boundaries and Test Cases (Step 3) — one section per condition
   - EP Partitions and Test Cases (Step 4) — one section per condition
   - Decision Table — Success Scenarios and Alternative Scenarios (Step 5)
   - State Transition — States, Events, Transition Table, Valid and Invalid Transition Test Cases (Step 6)
6. Preserve all tables exactly as generated. Do not summarize or collapse rows.
7. After writing, report the file path back to the user.

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

### State Transition
- Apply State Transition only when the business conditions describe an entity with distinct states and events that change those states
- List every state and every event explicitly — do not omit terminal or error states
- The state transition table must cover every (state, event) pair, marking invalid transitions explicitly
- Generate one test case per valid transition (success) and one per invalid transition (alternative)
- For every valid transition to a next state, define the expected outputs (e.g., notifications sent, fields updated, side effects, return values) — a transition is not fully specified without them
- Use the business conditions as the single source of truth for states, events, and allowed transitions
- If the business conditions are unclear about whether an event is allowed in a given state, ask the user to confirm before generating test cases

### Export
- Step 7 is **mandatory**. A test design session is not complete until the export confirmation question has been asked, regardless of whether the user mentioned exporting
- Always ask the user for confirmation before exporting — never write the Markdown file automatically
- Only export after all applicable steps (1–6) have been completed
- Include every generated table and section; do not omit, summarize, or collapse content
- Use the file path or filename provided by the user; if none is given, ask before choosing a default
- Every exported file must begin with a metadata header containing Date, Total Duration, and Tokens Used
- Total Duration must be computed from the first and last `timestamp` entries in the current session's JSONL transcript, not estimated
- Date must come from the actual `date` command, not from system context or a placeholder
- Tokens Used must come from summing the current session's JSONL transcript via `jq`, not from a guess. Only fall back to an approximate value if the JSONL or `jq` is genuinely unavailable, and label it as approximate
