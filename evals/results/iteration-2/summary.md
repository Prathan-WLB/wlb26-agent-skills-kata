# Eval Results Summary — Iteration 2

**Date:** 2026-03-26
**Skill:** wlb26-test-design-skill
**Model:** claude-sonnet-4-6

## Scores

| Eval | With Skill | Baseline | Delta |
|---|---|---|---|
| Eval 1: ช่วงเวลาทำรายการฝาก (BVA time range) | 1.0 | 0.4 | +0.6 |
| Eval 2: บัญชีออมทรัพย์ถูกอายัด (BVA not applicable) | 0.2 | 0.2 | 0.0 |
| **Average** | **0.6** | **0.3** | **+0.3** |

## Comparison with Iteration 1

| Eval | Iter-1 Skill | Iter-2 Skill | Iter-1 Baseline | Iter-2 Baseline |
|---|---|---|---|---|
| Eval 1 | 1.0 | 1.0 | 0.4 | 0.4 |
| Eval 2 | 1.0 | 0.2 | 0.3 | 0.2 |
| **Average** | **1.0** | **0.6** | **0.35** | **0.3** |

## Key Finding: Regression on Eval 2 (With Skill)

In iteration-1, the skill-run correctly identified BVA as inapplicable. In iteration-2, the same prompt returned an output that force-applied BVA to a boolean condition by framing it as "Boundary of Valid/Invalid Partition".

**Root cause:** The SKILL.md contains only a description in frontmatter with no actual instructions. The skill context ("BVA technique") primes the model toward applying BVA, and without explicit rules about when NOT to use BVA, behavior is inconsistent across runs.

**Eval 1 is stable** (1.0 both iterations) because the skill context correctly scopes BVA to a time-range condition where it is genuinely applicable.

## Recommended SKILL.md Changes

To stabilise eval 2 results, the skill needs explicit decision logic:

```
1. Identify condition type:
   - Numeric range (e.g. time, amount, age) → Apply BVA
   - Boolean / Categorical (e.g. status flag, account type) → State "BVA does not apply", use Equivalence Partitioning

2. Required output format:
   Table with columns: Test Case ID | Business Condition | Expected Result | Production-Likely Test Data
```

## Scoring Rubric

- **1.0** — All assertions fully met
- **0.5** — Assertions partially met
- **0.0** — Assertions not met
