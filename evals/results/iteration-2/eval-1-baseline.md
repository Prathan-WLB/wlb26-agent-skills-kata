# Eval 1 — Baseline (No Skill)

**Eval ID:** 1
**Run type:** baseline
**Skill:** none
**Date:** 2026-03-26
**Iteration:** 2

## Prompt
วิเคราะห์ และออกแบบ test case ของเงื่อนไข ช่วงเวลาที่อนุญาตให้ทำรายการฝาก ได้ 09:00 - 22:00

## Expected Output
Show test case and test data in table.

## Assertions
- Test case should include Test Case ID, Business Condition, Expected Result, and Production-Likely Test Data.

## Output

Uses EP + BVA. Table columns: `TC ID | กลุ่ม | เวลาที่ทดสอบ | คำอธิบาย | ผลลัพธ์ที่คาดหวัง | เทคนิค` (12 test cases)

| TC ID | กลุ่ม | เวลาที่ทดสอบ | คำอธิบาย | ผลลัพธ์ที่คาดหวัง | เทคนิค |
|---|---|---|---|---|---|
| TC-001 | EP1 / BVA | 08:59 | ก่อนเปิดทำการ 1 นาที (Lower Boundary - 1) | ไม่อนุญาต | BVA |
| TC-002 | EP2 / BVA | 09:00 | เวลาเปิดทำการพอดี (Lower Boundary) | อนุญาต | BVA |
| TC-003 | EP2 / BVA | 09:01 | หลังเปิดทำการ 1 นาที (Lower Boundary + 1) | อนุญาต | BVA |
| TC-004 | EP2 | 12:00 | กลางวัน (ตัวแทน EP Valid) | อนุญาต | EP |
| TC-005 | EP2 | 15:30 | บ่ายสาม (ตัวแทน EP Valid) | อนุญาต | EP |
| TC-006 | EP2 / BVA | 21:59 | ก่อนปิดทำการ 1 นาที (Upper Boundary - 1) | อนุญาต | BVA |
| TC-007 | EP2 / BVA | 22:00 | เวลาปิดทำการพอดี (Upper Boundary) | อนุญาต | BVA |
| TC-008 | EP3 / BVA | 22:01 | หลังปิดทำการ 1 นาที (Upper Boundary + 1) | ไม่อนุญาต | BVA |
| TC-009 | EP3 | 23:00 | กลางคืน (ตัวแทน EP Invalid หลังปิด) | ไม่อนุญาต | EP |
| TC-010 | EP1 | 00:00 | เที่ยงคืน (ตัวแทน EP Invalid ก่อนเปิด) | ไม่อนุญาต | EP |
| TC-011 | EP1 | 03:00 | ตีสาม (ตัวแทน EP Invalid ก่อนเปิด) | ไม่อนุญาต | EP |
| TC-012 | EP3 | 23:59 | ก่อนเที่ยงคืน 1 นาที (ตัวแทน EP Invalid หลังปิด) | ไม่อนุญาต | EP |

## Scoring

| Assertion | Result | Note |
|---|---|---|
| Has Test Case ID column | PASS | "TC ID" present (equivalent) |
| Has Business Condition column | FAIL | Uses "คำอธิบาย" — describes the test scenario, not the business condition label |
| Has Expected Result column | PASS | "ผลลัพธ์ที่คาดหวัง" present |
| Has Production-Likely Test Data column | FAIL | "เวลาที่ทดสอบ" is a raw value column, not labeled as production-likely test data |
| Output shown in table | PASS | Table format used |
| BVA technique applied | PASS | BVA correctly applied |

**Score: 0.4 / 1.0**

**Notes:** Technically correct BVA application with 12 comprehensive test cases, but column naming does not follow required format. "Business Condition" and "Production-Likely Test Data" columns absent — consistent with iteration-1 baseline behavior.
