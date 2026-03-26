# Eval 2 — With Skill

**Eval ID:** 2
**Run type:** with-skill
**Skill:** wlb26-test-design-skill
**Date:** 2026-03-26
**Iteration:** 3

## Prompt
วิเคราะห์ และออกแบบ test case ของเงื่อนไข ต้องไม่เป็นบัญชีออมทรัพย์ที่ถูกอายัด

## Expected Output
BVA technique does not apply.

## Output

States the condition is "Discrete Boolean" with no numeric range, then instead of concluding BVA doesn't apply, pivots to forcing BVA via "State Transition Boundary":

> "เนื่องจากเงื่อนไขนี้เป็น Discrete Boolean ไม่มีช่วงค่าตัวเลข BVA จึงเน้นที่ขอบเขตของ State Transition Boundary"

Labels test cases TC-001 through TC-007 with BVA points ("On Boundary", "Just Outside Boundary", "Transition Boundary").

## Scoring

| Assertion | Result | Note |
|---|---|---|
| States BVA does not apply | FAIL | Acknowledges discrete/boolean nature then force-applies BVA via state transition framing |
| Explains why BVA doesn't apply | FAIL | Explains discrete nature but uses it to justify a stretched BVA application |
| Provides appropriate alternative | PARTIAL | Produces EP-based test cases but mislabels them as BVA |

**Score: 0.2 / 1.0**

**Notes:** Second consecutive iteration (iter-2 and iter-3) where skill-run fails this eval. The skill context ("BVA technique") consistently primes the model to find a way to apply BVA rather than reject it. The SKILL.md has no explicit inapplicability rules — this is the root cause of the regression from iter-1 (1.0) to iter-2/3 (0.2).
