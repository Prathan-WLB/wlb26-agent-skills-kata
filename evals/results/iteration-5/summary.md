# Eval Results Summary — Iteration 5

**Date:** 2026-03-26  **Skill:** wlb26-test-design-skill  **Model:** claude-sonnet-4-6

## Scores

| Eval | With Skill | Baseline | Delta |
|---|---|---|---|
| Eval 1: ช่วงเวลาทำรายการฝาก (BVA time range) | 1.0 | 0.4 | +0.6 |
| Eval 2: บัญชีออมทรัพย์ถูกอายัด (BVA not applicable) | 0.2 | 0.2 | 0.0 |
| **Average** | **0.6** | **0.3** | **+0.3** |

## All-Iteration Scorecard (5 runs)

| Eval | I1-S | I2-S | I3-S | I4-S | I5-S | I1-B | I2-B | I3-B | I4-B | I5-B |
|---|---|---|---|---|---|---|---|---|---|---|
| Eval 1 | 1.0 | 1.0 | 1.0 | 1.0 | **1.0** | 0.4 | 0.4 | 0.4 | 0.4 | **0.4** |
| Eval 2 | 1.0 | 0.2 | 0.2 | 0.2 | **0.2** | 0.3 | 0.2 | 0.2 | 0.2 | **0.2** |
| Avg | 1.0 | 0.6 | 0.6 | 0.6 | **0.6** | 0.35 | 0.3 | 0.3 | 0.3 | **0.3** |

## Notable Observation: Iter-5 BVA Justification Recycled

The model has now exhausted novel BVA justifications and recycled iter-3's exact framing:
- Iter-2: "Boundary of Valid/Invalid Partition"
- Iter-3: "State Transition Boundary" (on-point/off-point/in-point)
- Iter-4: "Boolean Boundary BVA"
- Iter-5: "State Transition Boundary" (on-point/off-point/in-point) ← **repeat of iter-3**

This confirms the behaviour is a sampling distribution over a small set of forced-BVA rationalisations, not a path toward correct output.

## Final Conclusion

After 5 iterations with an empty SKILL.md, scores are fully converged:
- **Eval 1 with skill: 1.0** (stable — column format reliably enforced)
- **Eval 1 baseline: 0.4** (stable — correct logic, wrong columns)
- **Eval 2 with skill: 0.2** (stable regression — skill primes BVA application)
- **Eval 2 baseline: 0.2** (stable — BVA not addressed)

**No further iteration will change these scores without modifying SKILL.md.**

## Required SKILL.md Content to Advance

```markdown
## How to select a test design technique

1. Check the condition type:
   - If the condition is a **numeric or ordinal range** (time window, amount range, age limit, count threshold): → Apply BVA
   - If the condition is **Boolean, status flag, or categorical** (frozen/active, account type, yes/no): → **BVA does not apply.** State this explicitly. Use Equivalence Partitioning instead.

2. When BVA does not apply, write:
   > "BVA technique does not apply to this condition because it is a [Boolean/Categorical] condition with no numeric boundary. Equivalence Partitioning will be used instead."

## Required output format
All test case tables must use these exact column headers:
| Test Case ID | Business Condition | Expected Result | Production-Likely Test Data |
```
