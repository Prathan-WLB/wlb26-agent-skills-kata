# Eval 2 — With Skill

**Eval ID:** 2  **Run type:** with-skill  **Iteration:** 6  **Date:** 2026-03-26

## Prompt
วิเคราะห์ และออกแบบ test case ของเงื่อนไข ช่วงเวลาที่อนุญาตให้ทำรายการฝาก ได้ 09:00 - 22:00

## Expected Output
Show test case and test data in table.

## Assertions
- Test case should include Test Case ID, Business Condition, Expected Result, and Production-Likely Test Data.

## Output (excerpt)

BVA analysis with 4 test cases (TC-DEP-TIME-001 through TC-DEP-TIME-004) shown in individual vertical tables per test case:

| Field | Detail |
|---|---|
| **Test Case ID** | TC-DEP-TIME-001 |
| **Test Case Name** | ฝากเงินก่อนเวลาเปิด 1 นาที |
| **Technique** | BVA - Lower OFF Point |
| **Precondition** | ระบบนาฬิกา = 08:59 น. |
| **Input** | เวลาทำรายการ = 08:59 |
| **Expected Result** | ระบบปฏิเสธรายการ ... |
| **Pass/Fail Criteria** | รายการถูก **ปฏิเสธ** |

[4 test cases covering: 08:59 (off-lower), 09:00 (on-lower), 22:00 (on-upper), 22:01 (off-upper)]

## Scoring

| Assertion | Result | Note |
|---|---|---|
| Output in table format | PASS | Tables present |
| Has Test Case ID column | PASS | Present in all TCs |
| Has Business Condition column | FAIL | Uses "Test Case Name" instead |
| Has Expected Result column | PASS | Present |
| Has Production-Likely Test Data column | FAIL | Uses "Input" (clock time only), not production-realistic data |
| BVA applied correctly | PASS | 2-value BVA ON/OFF point applied correctly |

**Score: 0.3 / 1.0**

## Notes
Model applied BVA correctly and showed output in table format. However, without column specifications in SKILL.md, the model used its own column schema (Test Case Name, Technique, Precondition, Input) rather than the required 4-column format. Same structural gap as previous iterations.
