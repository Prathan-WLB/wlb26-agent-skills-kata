# Eval 1 — Baseline (No Skill)

**Eval ID:** 1  **Run type:** baseline  **Iteration:** 4  **Date:** 2026-03-26

## Output

Columns: `TC# | Test Case Name | เวลาที่ทดสอบ | Partition / Technique | ผลลัพธ์ที่คาดหวัง | ประเภท` (12 main + 4 edge cases)

| TC# | Test Case Name | เวลาที่ทดสอบ | ผลลัพธ์ที่คาดหวัง |
|---|---|---|---|
| TC01 | ก่อนเวลาเปิด – กลางดึก | 00:00 | Reject |
| TC03 | ขอบล่างก่อนเปิด | 08:59 | Reject |
| TC04 | ขอบล่างเปิด | 09:00 | Allow |
| TC05 | หลังขอบล่างเปิด | 09:01 | Allow |
| TC09 | ขอบบนปิด | 22:00 | Allow |
| TC10 | หลังขอบบนปิด | 22:01 | Reject |
| ... | ... | ... | ... |

## Scoring

| Assertion | Result | Note |
|---|---|---|
| Has Test Case ID column | PARTIAL | Uses "TC#" not "Test Case ID" |
| Has Business Condition column | FAIL | Uses "Test Case Name" instead |
| Has Expected Result column | PASS | "ผลลัพธ์ที่คาดหวัง" present |
| Has Production-Likely Test Data column | FAIL | "เวลาที่ทดสอบ" present but not labeled as production-likely test data |
| Output shown in table | PASS | Table format used |
| BVA technique applied | PASS | Boundaries correctly identified |

**Score: 0.4 / 1.0**

**Notes:** Consistent with iterations 1–3. Column naming remains non-compliant; logic is correct.
