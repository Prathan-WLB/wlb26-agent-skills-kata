# Eval 1 — With Skill

**Eval ID:** 1
**Run type:** with-skill
**Skill:** wlb26-test-design-skill
**Date:** 2026-03-26
**Iteration:** 3

## Prompt
วิเคราะห์ และออกแบบ test case ของเงื่อนไข ช่วงเวลาที่อนุญาตให้ทำรายการฝาก ได้ 09:00 - 22:00

## Expected Output
Show test case and test data in table.

## Assertions
- Test case should include Test Case ID, Business Condition, Expected Result, and Production-Likely Test Data.

## Output

| Test Case ID | Business Condition | Expected Result | Production-Likely Test Data |
|---|---|---|---|
| TC-DEP-001 | ทำรายการฝากก่อนเวลาเปิด (Lower Boundary - 1 นาที) | ไม่อนุญาต — แสดง error "ไม่อยู่ในช่วงเวลาที่ให้บริการ" | เวลา 08:59 น. |
| TC-DEP-002 | ทำรายการฝากพอดีเวลาเปิด (Lower Boundary) | อนุญาต — ทำรายการฝากได้สำเร็จ | เวลา 09:00 น. |
| TC-DEP-003 | ทำรายการฝากหลังเวลาเปิด (Lower Boundary + 1 นาที) | อนุญาต — ทำรายการฝากได้สำเร็จ | เวลา 09:01 น. |
| TC-DEP-004 | ทำรายการฝากในช่วงเวลาปกติ (Nominal) | อนุญาต — ทำรายการฝากได้สำเร็จ | เวลา 15:30 น. |
| TC-DEP-005 | ทำรายการฝากก่อนเวลาปิด (Upper Boundary - 1 นาที) | อนุญาต — ทำรายการฝากได้สำเร็จ | เวลา 21:59 น. |
| TC-DEP-006 | ทำรายการฝากพอดีเวลาปิด (Upper Boundary) | อนุญาต — ทำรายการฝากได้สำเร็จ | เวลา 22:00 น. |
| TC-DEP-007 | ทำรายการฝากหลังเวลาปิด (Upper Boundary + 1 นาที) | ไม่อนุญาต — แสดง error "ไม่อยู่ในช่วงเวลาที่ให้บริการ" | เวลา 22:01 น. |

## Scoring

| Assertion | Result | Note |
|---|---|---|
| Has Test Case ID column | PASS | "Test Case ID" present |
| Has Business Condition column | PASS | "Business Condition" present |
| Has Expected Result column | PASS | "Expected Result" present |
| Has Production-Likely Test Data column | PASS | "Production-Likely Test Data" present |
| Output shown in table | PASS | Table format used |
| BVA technique applied | PASS | Lower/Upper boundary ±1 correctly identified |

**Score: 1.0 / 1.0**
