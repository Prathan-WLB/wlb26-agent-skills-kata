# Eval Results Summary — Iteration 3

**Date:** 2026-03-26
**Skill:** wlb26-test-design-skill
**Model:** claude-sonnet-4-6

## Scores

| Eval | With Skill | Baseline | Delta |
|---|---|---|---|
| Eval 1: ช่วงเวลาทำรายการฝาก (BVA time range) | 1.0 | 0.4 | +0.6 |
| Eval 2: บัญชีออมทรัพย์ถูกอายัด (BVA not applicable) | 0.2 | 0.2 | 0.0 |
| **Average** | **0.6** | **0.3** | **+0.3** |

## Cross-Iteration Comparison

| Eval | Iter-1 Skill | Iter-2 Skill | Iter-3 Skill | Iter-1 Base | Iter-2 Base | Iter-3 Base |
|---|---|---|---|---|---|---|
| Eval 1 | 1.0 | 1.0 | 1.0 | 0.4 | 0.4 | 0.4 |
| Eval 2 | 1.0 | 0.2 | 0.2 | 0.3 | 0.2 | 0.2 |
| **Avg** | **1.0** | **0.6** | **0.6** | **0.35** | **0.3** | **0.3** |

## Observations

### Eval 1 — Stable and reliable
- With skill: **1.0 across all 3 iterations** — consistent column output (Test Case ID, Business Condition, Expected Result, Production-Likely Test Data) and correct BVA application
- Baseline: **0.4 across all 3 iterations** — correct BVA logic but wrong column labels every time

### Eval 2 — Confirmed regression pattern
- With skill: **1.0 (iter-1) → 0.2 (iter-2, iter-3)** — the skill context primes BVA application, and without explicit "do not apply BVA" rules in SKILL.md, the model invents stretched justifications (iter-2: "Boundary of Valid/Invalid Partition", iter-3: "State Transition Boundary") rather than stating BVA is inapplicable
- Baseline: **stable at 0.2–0.3** — never addresses BVA applicability at all

### Root Cause (confirmed across 2 iterations)
The SKILL.md is empty (frontmatter only). The skill description string "BVA (Boundary Value Analysis)" passed as context creates a commitment bias: the model looks for ways to apply BVA rather than evaluate whether it should. Iter-1's correct output was likely a one-off sampling variation.

## Required Fix

Add explicit decision logic to SKILL.md:

```markdown
## When to apply BVA
- **Apply BVA** when the condition involves a numeric/ordinal range (time, amount, age, count, date)
- **Do NOT apply BVA** when the condition is Boolean, categorical, or enum-based (status flags, account types, yes/no conditions)
  - In these cases, state explicitly: "BVA technique does not apply to this condition"
  - Use Equivalence Partitioning (EP) instead

## Required output format
All test case tables must include these exact columns:
| Test Case ID | Business Condition | Expected Result | Production-Likely Test Data |
```
