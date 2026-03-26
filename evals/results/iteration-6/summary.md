# Eval Results Summary — Iteration 6

**Date:** 2026-03-26  **Skill:** wlb26-test-design-skill  **Model:** claude-sonnet-4-6

## Scores

| Eval | With Skill | Baseline | Delta |
|---|---|---|---|
| Eval 1: ช่วงเวลา 09:00 only (ask for clarification) | 0.0 | 0.2 | -0.2 |
| Eval 2: ช่วงเวลา 09:00–22:00 (show test case table) | 0.3 | 0.3 | 0.0 |
| Eval 3: บัญชีออมทรัพย์ถูกอายัด (BVA not applicable) | 0.2 | 0.2 | 0.0 |
| **Average** | **0.17** | **0.23** | **-0.07** |

## New Eval in This Iteration

Eval 1 (09:00 only, ask-for-clarification) was run for the first time in iteration-6. The expected behaviour is to block and ask: "เวลาที่อนุญาตให้ฝากเงินได้ ไม่เกินกี่โมง และไม่เกินกี่นาที" (what is the upper time limit?).

- **With skill:** Assumed upper bound 23:59 and proceeded with BVA. Score: 0.0
- **Baseline:** Acknowledged ambiguity ("ต้องการ clarify จาก requirement"), listed possible assumptions, then still picked an arbitrary upper bound (17:00) and proceeded. Score: 0.2

**Observation:** Baseline outperforms with-skill on Eval 1 — the SKILL.md description mentioning "BVA" actively pushes the model toward generating test cases rather than pausing to ask questions.

## Cross-Iteration Scorecard (Evals 2 & 3 only, comparable across iterations)

| Eval | I2-S | I3-S | I4-S | I5-S | I6-S | I2-B | I3-B | I4-B | I5-B | I6-B |
|---|---|---|---|---|---|---|---|---|---|---|
| Eval 2 (time range table) | 1.0 | 0.2 | 0.2 | 0.2 | **0.3** | 0.3 | 0.2 | 0.2 | 0.2 | **0.3** |
| Eval 3 (BVA not applicable) | — | — | — | — | **0.2** | — | — | — | — | **0.2** |

> Note: In iterations 1–5 the file labelled "eval-1" was the 09:00–22:00 case (now evals.json ID 2). Eval 3 (frozen account) was labelled "eval-2" in those iterations. Iteration 6 aligns with evals.json IDs.

## Root-Cause Analysis

### Eval 1 (ask-for-clarification)
Neither run asks the correct question. SKILL.md needs an explicit rule: "If the business condition provides only one boundary of a numeric range, ask for the missing boundary before designing test cases."

### Eval 2 (column format)
Both runs produce tables but use their own column schemas. The required columns (Test Case ID, Business Condition, Expected Result, Production-Likely Test Data) are not produced. SKILL.md needs to specify the exact column headers.

### Eval 3 (BVA not applicable)
Neither run explicitly states "BVA technique does not apply." The model defaults to listing BVA in the technique inventory whenever the skill description mentions BVA. SKILL.md needs a technique-selection rule that explicitly excludes BVA for Boolean/categorical conditions.

## Required SKILL.md Additions to Advance All Three Evals

```markdown
## Clarification before design

Before designing test cases, verify all boundaries are specified:
- If a numeric/time range has only ONE boundary given (e.g., "ตั้งแต่ 09:00"), STOP and ask:
  "เงื่อนไขนี้มีขอบเขตบน (Upper Bound) ที่เท่าไหร่? อนุญาตได้ถึงกี่โมง กี่นาที?"
  Do NOT assume any upper bound.

## How to select a test design technique

1. Identify the condition type:
   - Numeric or ordinal range (time window, amount, count, age): → Apply **BVA**
   - Boolean, status flag, or categorical (frozen/active, account type, yes/no): → **BVA does not apply.**
     State: "BVA technique does not apply to this condition because it is a [Boolean/Categorical]
     condition with no numeric boundary. Equivalence Partitioning will be used instead."

## Required output format

All test case tables must use these exact column headers:
| Test Case ID | Business Condition | Expected Result | Production-Likely Test Data |
```

## Summary Verdict

| Problem | Iterations without fix | Fix location |
|---|---|---|
| Does not ask for missing boundary | New (iter-6) | SKILL.md: clarification rule |
| Wrong column headers | 1–6 (all iterations) | SKILL.md: output format |
| BVA declared for categorical condition | 2–6 | SKILL.md: technique selection |
