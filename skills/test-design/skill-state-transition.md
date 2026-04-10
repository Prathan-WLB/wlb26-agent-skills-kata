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

When all steps are complete, follow: `skill-export.md`
