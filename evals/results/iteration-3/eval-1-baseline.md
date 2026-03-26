# Eval 1 — Baseline (No Skill)

**Eval ID:** 1
**Run type:** baseline
**Skill:** none
**Date:** 2026-03-26
**Iteration:** 3

## Prompt
วิเคราะห์ และออกแบบ test case ของเงื่อนไข ช่วงเวลาที่อนุญาตให้ทำรายการฝาก ได้ 09:00 - 22:00

## Expected Output
Show test case and test data in table.

## Assertions
- Test case should include Test Case ID, Business Condition, Expected Result, and Production-Likely Test Data.

## Output

Uses BVA + EP. Table columns: `TC# | Test Case ID | ประเภท | เวลาที่ทดสอบ | Partition | ผลลัพธ์ที่คาดหวัง | หมายเหตุ` (17 test cases including edge cases)

| TC# | Test Case ID | ประเภท | เวลาที่ทดสอบ | Partition | ผลลัพธ์ที่คาดหวัง |
|---|---|---|---|---|---|
| 1 | TC-DEP-001 | BVA | 00:00 | EP1 | ไม่อนุญาต |
| 3 | TC-DEP-003 | BVA | 08:59 | EP1 | ไม่อนุญาต |
| 4 | TC-DEP-004 | BVA | 09:00 | EP2 | อนุญาต |
| 5 | TC-DEP-005 | BVA | 09:01 | EP2 | อนุญาต |
| 9 | TC-DEP-009 | BVA | 22:00 | EP2 | อนุญาต |
| 10 | TC-DEP-010 | BVA | 22:01 | EP3 | ไม่อนุญาต |
| ... | ... | ... | ... | ... | ... |

## Scoring

| Assertion | Result | Note |
|---|---|---|
| Has Test Case ID column | PASS | "Test Case ID" column explicitly present |
| Has Business Condition column | FAIL | No "Business Condition" column — uses "หมายเหตุ" (remarks) instead |
| Has Expected Result column | PASS | "ผลลัพธ์ที่คาดหวัง" present |
| Has Production-Likely Test Data column | FAIL | "เวลาที่ทดสอบ" is raw input data, not labeled as production-likely test data |
| Output shown in table | PASS | Table format used |
| BVA technique applied | PASS | BVA boundaries and EP partitions correctly used |

**Score: 0.4 / 1.0**

**Notes:** Consistent with iterations 1 and 2. "Test Case ID" column name is now correct, but "Business Condition" and "Production-Likely Test Data" column labels remain absent.
