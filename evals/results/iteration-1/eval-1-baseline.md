# Eval 1 — Baseline (No Skill)

**Eval ID:** 1
**Run type:** baseline
**Skill:** none
**Date:** 2026-03-26

## Prompt
วิเคราะห์ และออกแบบ test case ของเงื่อนไข ช่วงเวลาที่อนุญาตให้ทำรายการฝาก ได้ 09:00 - 22:00

## Expected Output
Show test case and test data in table.

## Assertions
- Test case should include Test Case ID, Business Condition, Expected Result, and Production-Likely Test Data.

## Output

### การวิเคราะห์เงื่อนไข: ช่วงเวลาที่อนุญาตให้ทำรายการฝาก (09:00 - 22:00)

#### เทคนิคที่ใช้
- **Boundary Value Analysis (BVA)** — ทดสอบค่าขอบเขต
- **Equivalence Partitioning (EP)** — แบ่งกลุ่มข้อมูลที่มีพฤติกรรมเหมือนกัน

#### Equivalence Partitions

| Partition | ช่วงเวลา | ผลลัพธ์ที่คาดหวัง |
|---|---|---|
| EP1 (Invalid - ก่อนเปิด) | 00:00 – 08:59 | ปฏิเสธรายการ |
| EP2 (Valid) | 09:00 – 22:00 | อนุมัติรายการ |
| EP3 (Invalid - หลังปิด) | 22:01 – 23:59 | ปฏิเสธรายการ |

#### Test Case Table

| TC# | Test Case Name | เทคนิค | เวลาที่ทดสอบ | Partition | ผลลัพธ์ที่คาดหวัง | ประเภท |
|---|---|---|---|---|---|---|
| TC01 | ทำรายการก่อนเปิดทำการ (กลางดึก) | EP | 00:00 | EP1 | ปฏิเสธ - "นอกเวลาทำการ" | Negative |
| TC02 | ทำรายการก่อนเปิดทำการ (ตี 3) | EP | 03:00 | EP1 | ปฏิเสธ - "นอกเวลาทำการ" | Negative |
| TC03 | ทำรายการก่อนเปิดทำการ (เช้าตรู่) | EP | 06:30 | EP1 | ปฏิเสธ - "นอกเวลาทำการ" | Negative |
| TC04 | ขอบเขตล่าง -1 นาที (ก่อนเปิด 1 นาที) | BVA | 08:59 | EP1 | ปฏิเสธ - "นอกเวลาทำการ" | Negative |
| TC05 | ขอบเขตล่าง (เวลาเปิดทำการพอดี) | BVA | 09:00 | EP2 | อนุมัติ - ทำรายการสำเร็จ | Positive |
| TC06 | ขอบเขตล่าง +1 นาที (หลังเปิด 1 นาที) | BVA | 09:01 | EP2 | อนุมัติ - ทำรายการสำเร็จ | Positive |
| TC07 | ทำรายการช่วงกลางวัน | EP | 12:00 | EP2 | อนุมัติ - ทำรายการสำเร็จ | Positive |
| TC08 | ทำรายการช่วงบ่าย | EP | 15:30 | EP2 | อนุมัติ - ทำรายการสำเร็จ | Positive |
| TC09 | ทำรายการช่วงเย็น | EP | 18:45 | EP2 | อนุมัติ - ทำรายการสำเร็จ | Positive |
| TC10 | ขอบเขตบน -1 นาที (ก่อนปิด 1 นาที) | BVA | 21:59 | EP2 | อนุมัติ - ทำรายการสำเร็จ | Positive |
| TC11 | ขอบเขตบน (เวลาปิดทำการพอดี) | BVA | 22:00 | EP2 | อนุมัติ - ทำรายการสำเร็จ | Positive |
| TC12 | ขอบเขตบน +1 นาที (หลังปิด 1 นาที) | BVA | 22:01 | EP3 | ปฏิเสธ - "นอกเวลาทำการ" | Negative |
| TC13 | ทำรายการหลังปิดทำการ (ค่ำ) | EP | 23:00 | EP3 | ปฏิเสธ - "นอกเวลาทำการ" | Negative |
| TC14 | ทำรายการก่อนเที่ยงคืน | EP | 23:59 | EP3 | ปฏิเสธ - "นอกเวลาทำการ" | Negative |

## Scoring

| Assertion | Result | Note |
|---|---|---|
| Has Test Case ID column | PARTIAL | Uses "TC#" not "Test Case ID" |
| Has Business Condition column | FAIL | Uses "Test Case Name" — describes the test, not the business condition |
| Has Expected Result column | PASS | Column "ผลลัพธ์ที่คาดหวัง" present |
| Has Production-Likely Test Data column | FAIL | Uses "เวลาที่ทดสอบ" (test time) — not labeled as production-likely test data |
| Output shown in table | PASS | Table format used |
| BVA technique applied | PASS | BVA boundaries correctly identified |

**Score: 0.4 / 1.0**

**Notes:** Output is technically correct and BVA is applied, but the table columns do not match the required format. Missing "Business Condition" and "Production-Likely Test Data" as distinct, labeled columns.
