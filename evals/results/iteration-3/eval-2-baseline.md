# Eval 2 — Baseline (No Skill)

**Eval ID:** 2
**Run type:** baseline
**Skill:** none
**Date:** 2026-03-26
**Iteration:** 3

## Prompt
วิเคราะห์ และออกแบบ test case ของเงื่อนไข ต้องไม่เป็นบัญชีออมทรัพย์ที่ถูกอายัด

## Expected Output
BVA technique does not apply.

## Output

Uses Decision Table + EP + State Transition + BVA. Explicitly lists "Boundary Value Analysis" as one of the applied techniques at the end, covering TC-03 and TC-05. No mention of BVA applicability analysis.

Produces 7 detailed test cases covering: frozen savings (FAIL), active savings (PASS), non-savings frozen (PASS), non-savings active (PASS), partial freeze (edge), state transition, null data.

## Scoring

| Assertion | Result | Note |
|---|---|---|
| States BVA does not apply | FAIL | Lists BVA as an applied technique |
| Explains why BVA doesn't apply | FAIL | No discussion of BVA applicability |
| Provides appropriate alternative | PASS | Decision Table and EP correctly used |

**Score: 0.2 / 1.0**

**Notes:** Consistent with iterations 1 and 2. Baseline never addresses BVA applicability — scores 0.2–0.3 across all iterations.
