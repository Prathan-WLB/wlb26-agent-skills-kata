# Eval 2 — With Skill

**Eval ID:** 2
**Run type:** with-skill
**Skill:** wlb26-test-design-skill
**Date:** 2026-03-26
**Iteration:** 2

## Prompt
วิเคราะห์ และออกแบบ test case ของเงื่อนไข ต้องไม่เป็นบัญชีออมทรัพย์ที่ถูกอายัด

## Expected Output
BVA technique does not apply.

## Output

The response does **not** state that BVA does not apply. Instead it attempts to force-apply BVA by framing partitions as "boundary between valid/invalid":

> "เนื่องจากเงื่อนไขนี้เป็น Discrete / Categorical Condition ไม่ใช่ช่วงตัวเลข BVA จึงถูกประยุกต์ใช้ในรูปแบบ Boundary of Valid/Invalid Partition"

It then produces 5 test cases (TC-001 to TC-005) labeling them with "Technique: BVA", including a partial freeze edge case.

## Scoring

| Assertion | Result | Note |
|---|---|---|
| States BVA does not apply | FAIL | Explicitly claims BVA can be applied via "Boundary of Valid/Invalid Partition" framing |
| Explains why BVA doesn't apply | FAIL | Acknowledges categorical/discrete nature but then proceeds to use BVA anyway |
| Provides appropriate alternative | PARTIAL | Provides test cases but mislabels them as BVA |

**Score: 0.2 / 1.0**

**Notes:** Regression from iteration-1 (score was 1.0). The skill description mentions BVA as the primary technique but does not include explicit rules about when BVA does NOT apply. This causes the model to attempt stretching BVA onto a boolean condition rather than recognising its inapplicability. The SKILL.md needs explicit instructions: "When the business condition is Boolean/Categorical (not a numeric range), state that BVA does not apply and use Equivalence Partitioning instead."
