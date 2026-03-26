# Eval 2 — Baseline (No Skill)

**Eval ID:** 2
**Run type:** baseline
**Skill:** none
**Date:** 2026-03-26
**Iteration:** 2

## Prompt
วิเคราะห์ และออกแบบ test case ของเงื่อนไข ต้องไม่เป็นบัญชีออมทรัพย์ที่ถูกอายัด

## Expected Output
BVA technique does not apply.

## Output

Lists BVA as one of 4 techniques to use:
> "เทคนิคที่ใช้: EP, BVA, Decision Table Testing, Negative Testing"

Produces 10 detailed test cases. TC-006 labels a partial-freeze case as "BVA". Does not mention whether BVA is applicable or not.

## Scoring

| Assertion | Result | Note |
|---|---|---|
| States BVA does not apply | FAIL | Lists BVA as an applicable technique |
| Explains why BVA doesn't apply | FAIL | No discussion of BVA applicability |
| Provides appropriate alternative | PASS | Uses Decision Table and EP which are appropriate |

**Score: 0.2 / 1.0**

**Notes:** Same score as with-skill this iteration. Baseline consistently applies BVA to boolean conditions without questioning its applicability — consistent with iteration-1 baseline (0.3). Slight score reduction this iteration because the output more strongly asserts BVA as one of the design techniques, whereas iteration-1 baseline simply omitted BVA mention entirely.
