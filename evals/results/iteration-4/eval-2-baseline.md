# Eval 2 — Baseline (No Skill)

**Eval ID:** 2  **Run type:** baseline  **Iteration:** 4  **Date:** 2026-03-26

## Expected Output
BVA technique does not apply.

## Output

Uses Decision Table + EP + State Transition. Coverage matrix lists: "Equivalence Partitioning", "Decision Table Testing", "Boundary / Edge Case", "State Transition Testing". Does not mention BVA by name, but includes "Boundary/Edge Case" as a category. Does not state BVA is inapplicable.

9 test cases covering: frozen savings (FAIL), active savings (PASS), frozen current (PASS), active current (PASS), frozen fixed deposit (PASS), null frozenStatus, null accountType, state transitions.

## Scoring

| Assertion | Result | Note |
|---|---|---|
| States BVA does not apply | FAIL | No mention of BVA applicability |
| Explains why BVA doesn't apply | FAIL | No discussion |
| Provides appropriate alternative | PASS | EP and Decision Table correctly used |

**Score: 0.2 / 1.0**

**Notes:** Slightly better than iter-3 in that it doesn't explicitly list "BVA" as a technique, but still does not address the expected key output.
