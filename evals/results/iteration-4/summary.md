# Eval Results Summary — Iteration 4

**Date:** 2026-03-26  **Skill:** wlb26-test-design-skill  **Model:** claude-sonnet-4-6

## Scores

| Eval | With Skill | Baseline | Delta |
|---|---|---|---|
| Eval 1: ช่วงเวลาทำรายการฝาก (BVA time range) | 1.0 | 0.4 | +0.6 |
| Eval 2: บัญชีออมทรัพย์ถูกอายัด (BVA not applicable) | 0.2 | 0.2 | 0.0 |
| **Average** | **0.6** | **0.3** | **+0.3** |

## All-Iteration Summary

| Eval | Iter-1 Skill | Iter-2 Skill | Iter-3 Skill | Iter-4 Skill | Iter-1 Base | Iter-2 Base | Iter-3 Base | Iter-4 Base |
|---|---|---|---|---|---|---|---|---|
| Eval 1 | 1.0 | 1.0 | 1.0 | **1.0** | 0.4 | 0.4 | 0.4 | **0.4** |
| Eval 2 | 1.0 | 0.2 | 0.2 | **0.2** | 0.3 | 0.2 | 0.2 | **0.2** |
| **Avg** | **1.0** | **0.6** | **0.6** | **0.6** | **0.35** | **0.3** | **0.3** | **0.3** |

## Confirmed Stable Patterns (4 iterations)

### Eval 1 — Fully stable
- **Skill: 1.0 in all 4 iterations.** The skill context reliably produces the required 4-column table format with correct BVA application.
- **Baseline: 0.4 in all 4 iterations.** BVA logic is always correct; column labels are always wrong (no "Business Condition", no "Production-Likely Test Data").

### Eval 2 — Confirmed failure pattern (iterations 2–4)
The skill invents a new BVA justification each iteration rather than rejecting it:
- Iter-2: "Boundary of Valid/Invalid Partition"
- Iter-3: "State Transition Boundary"
- Iter-4: "Boolean Boundary BVA"

This is a **commitment bias** caused by the BVA mention in the skill description with no counteracting rule.

## Conclusions

1. **Eval 1 skill improvement is reliable** (+0.6 over baseline, stable across 4 runs). Column format enforcement is the key value of the skill.

2. **Eval 2 skill score of 1.0 in iter-1 was an outlier**, not representative behaviour. True stable score is 0.2.

3. **Skill score plateaus at 0.6 average** without changes to SKILL.md. Further iterations will produce identical results.

## Recommended Next Step

Update SKILL.md with explicit instructions to break the plateau:

```markdown
## Technique Selection Rules

**Step 1: Identify condition type**
| Condition Type | Example | Technique |
|---|---|---|
| Numeric/ordinal range | time, amount, age, count | Apply BVA |
| Boolean / status flag | อายัด/ไม่อายัด, active/inactive | **BVA does not apply** → use EP |
| Categorical / enum | account type, product code | **BVA does not apply** → use EP |

When BVA does not apply, explicitly state: "BVA technique does not apply to this condition because [reason]. Using Equivalence Partitioning instead."

**Step 2: Required output table columns**
| Test Case ID | Business Condition | Expected Result | Production-Likely Test Data |
```
