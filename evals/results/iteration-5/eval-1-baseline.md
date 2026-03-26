# Eval 1 — Baseline (No Skill)

**Eval ID:** 1  **Run type:** baseline  **Iteration:** 5  **Date:** 2026-03-26

## Output

Columns: `TC# | Test Case ID | หมวดหมู่ | เวลาที่ทดสอบ | ประเภท | ผลลัพธ์ที่คาดหวัง | หมายเหตุ` (10 test cases)

| TC# | Test Case ID | เวลาที่ทดสอบ | ผลลัพธ์ที่คาดหวัง |
|---|---|---|---|
| 1 | TC-DEP-001 | 08:59 | ไม่อนุญาต |
| 2 | TC-DEP-002 | 09:00 | อนุญาต |
| 3 | TC-DEP-003 | 09:01 | อนุญาต |
| 4 | TC-DEP-004 | 15:30 | อนุญาต |
| 5 | TC-DEP-005 | 21:59 | อนุญาต |
| 6 | TC-DEP-006 | 22:00 | อนุญาต |
| 7 | TC-DEP-007 | 22:01 | ไม่อนุญาต |
| ... | ... | ... | ... |

## Scoring

| Assertion | Result | Note |
|---|---|---|
| Has Test Case ID column | PASS | Explicit "Test Case ID" column present |
| Has Business Condition column | FAIL | Uses "หมวดหมู่" (category) — not the same as Business Condition |
| Has Expected Result column | PASS | "ผลลัพธ์ที่คาดหวัง" present |
| Has Production-Likely Test Data column | FAIL | "เวลาที่ทดสอบ" is the test input time, not labeled as production-likely test data |
| Output shown in table | PASS | Table format used |
| BVA technique applied | PASS | All 6 boundary values correctly covered |

**Score: 0.4 / 1.0**

**Notes:** 5th consecutive iteration with same score — "Test Case ID" column name is now consistent, but "Business Condition" and "Production-Likely Test Data" labels remain absent.
