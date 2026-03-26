# Eval 1 — With Skill

**Eval ID:** 1
**Run type:** with-skill
**Skill:** wlb26-test-design-skill
**Date:** 2026-03-26

## Prompt
วิเคราะห์ และออกแบบ test case ของเงื่อนไข ช่วงเวลาที่อนุญาตให้ทำรายการฝาก ได้ 09:00 - 22:00

## Expected Output
Show test case and test data in table.

## Assertions
- Test case should include Test Case ID, Business Condition, Expected Result, and Production-Likely Test Data.

## Output

### BVA Analysis: ช่วงเวลาที่อนุญาตให้ทำรายการฝาก (09:00 - 22:00)

#### Boundary Identification

| Boundary Point | Value | Zone |
|---|---|---|
| Lower Boundary - 1 | 08:59 | Outside (Before open) |
| Lower Boundary | 09:00 | Inside (Open) |
| Lower Boundary + 1 | 09:01 | Inside |
| Nominal (Middle) | 15:30 | Inside |
| Upper Boundary - 1 | 21:59 | Inside |
| Upper Boundary | 22:00 | Inside (Close) |
| Upper Boundary + 1 | 22:01 | Outside (After close) |

#### Test Case Table

| Test Case ID | Business Condition | Expected Result | Production-Likely Test Data |
|---|---|---|---|
| TC-DEP-001 | เวลาก่อนเปิดรับฝาก 1 นาที (Lower Boundary - 1) | ระบบปฏิเสธรายการ / แสดงข้อความแจ้งเตือนว่าอยู่นอกเวลาทำการ | เวลาทำรายการ: 08:59 น. |
| TC-DEP-002 | เวลาเปิดรับฝากพอดี (Lower Boundary) | ระบบอนุญาตให้ทำรายการฝากได้สำเร็จ | เวลาทำรายการ: 09:00 น. |
| TC-DEP-003 | เวลาหลังเปิดรับฝาก 1 นาที (Lower Boundary + 1) | ระบบอนุญาตให้ทำรายการฝากได้สำเร็จ | เวลาทำรายการ: 09:01 น. |
| TC-DEP-004 | เวลากลางช่วง — Nominal Value | ระบบอนุญาตให้ทำรายการฝากได้สำเร็จ | เวลาทำรายการ: 15:30 น. |
| TC-DEP-005 | เวลาก่อนปิดรับฝาก 1 นาที (Upper Boundary - 1) | ระบบอนุญาตให้ทำรายการฝากได้สำเร็จ | เวลาทำรายการ: 21:59 น. |
| TC-DEP-006 | เวลาปิดรับฝากพอดี (Upper Boundary) | ระบบอนุญาตให้ทำรายการฝากได้สำเร็จ | เวลาทำรายการ: 22:00 น. |
| TC-DEP-007 | เวลาหลังปิดรับฝาก 1 นาที (Upper Boundary + 1) | ระบบปฏิเสธรายการ / แสดงข้อความแจ้งเตือนว่าอยู่นอกเวลาทำการ | เวลาทำรายการ: 22:01 น. |

#### หมายเหตุ
- **BVA Technique ที่ใช้:** 2-value BVA (Boundary ± 1 unit) โดยมี unit = 1 นาที
- **สมมติฐาน:** เงื่อนไข `09:00 - 22:00` หมายถึง **inclusive** ทั้งสองฝั่ง
- หากระบบกำหนดให้ 22:00 เป็น exclusive ควรปรับ TC-DEP-006 เป็น Expected Result: ปฏิเสธรายการ

## Scoring

| Assertion | Result | Note |
|---|---|---|
| Has Test Case ID column | PASS | Column present: "Test Case ID" |
| Has Business Condition column | PASS | Column present: "Business Condition" |
| Has Expected Result column | PASS | Column present: "Expected Result" |
| Has Production-Likely Test Data column | PASS | Column present: "Production-Likely Test Data" |
| Output shown in table | PASS | Table format used |
| BVA technique applied | PASS | BVA boundaries correctly identified (boundary ±1) |

**Score: 1.0 / 1.0**
