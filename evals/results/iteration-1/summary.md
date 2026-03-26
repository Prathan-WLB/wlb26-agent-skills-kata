# Eval Results Summary — Iteration 1

**Date:** 2026-03-26
**Skill:** wlb26-test-design-skill
**Model:** claude-sonnet-4-6

## Scores

| Eval | With Skill | Baseline | Delta |
|---|---|---|---|
| Eval 1: ช่วงเวลาทำรายการฝาก (BVA time range) | 1.0 | 0.4 | +0.6 |
| Eval 2: บัญชีออมทรัพย์ถูกอายัด (BVA not applicable) | 1.0 | 0.3 | +0.7 |
| **Average** | **1.0** | **0.35** | **+0.65** |

## Scoring Rubric

Scores are 0.0–1.0 per eval based on assertion checklist:

- **1.0** — All assertions fully met
- **0.5** — Assertions partially met
- **0.0** — Assertions not met

## Eval 1 Analysis

**With skill (1.0):** Correctly applied BVA with all 4 required columns (Test Case ID, Business Condition, Expected Result, Production-Likely Test Data). Identified 7 boundary test cases with production-realistic time values.

**Baseline (0.4):** Applied BVA correctly but used non-standard column names. Missing "Business Condition" (used "Test Case Name") and "Production-Likely Test Data" (used "เวลาที่ทดสอบ"). Output was broader (14 test cases with EP+BVA combined) but did not follow required format.

## Eval 2 Analysis

**With skill (1.0):** Explicitly identified that BVA does not apply, explained the reason (Boolean/Categorical condition with no numeric boundary), and correctly offered Equivalence Partitioning as the appropriate alternative.

**Baseline (0.3):** Produced sound test cases using Decision Table and EP, but never mentioned BVA or whether it applies. The key discriminating insight — recognizing BVA inapplicability — was absent.

## Conclusion

The skill provides significant improvement on both evals (+0.65 average delta). The main value-add is:
1. **Structured output format** — enforcing required columns in the test case table
2. **BVA applicability awareness** — correctly identifying when BVA applies vs. does not apply

The skill SKILL.md currently contains only frontmatter with no actual instructions. The improvements observed reflect the skill description being passed as system context. Adding explicit instructions to SKILL.md (required columns, BVA applicability rules) would likely further improve consistency.
