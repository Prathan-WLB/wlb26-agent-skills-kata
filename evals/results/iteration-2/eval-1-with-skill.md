# Eval 1 — With Skill

**Eval ID:** 1
**Run type:** with-skill
**Skill:** wlb26-test-design-skill
**Date:** 2026-03-26
**Iteration:** 2

## Prompt
วิเคราะห์ และออกแบบ test case ของเงื่อนไข ช่วงเวลาที่อนุญาตให้ทำรายการฝาก ได้ 09:00 - 22:00

## Expected Output
Show test case and test data in table.

## Assertions
- Test case should include Test Case ID, Business Condition, Expected Result, and Production-Likely Test Data.

## Output

### BVA Test Case Design: ช่วงเวลาที่อนุญาตให้ทำรายการฝาก (09:00 - 22:00)

**Valid Range:** 09:00 – 22:00 | **Invalid Range:** ก่อน 09:00 และ หลัง 22:00

BVA boundary points:
- **Lower:** 08:59 (invalid), 09:00 (valid min), 09:01 (valid)
- **Upper:** 21:59 (valid), 22:00 (valid max), 22:01 (invalid)
- **Nominal:** 15:30 (valid mid)

#### Test Case Table

| Test Case ID | Business Condition | Expected Result | Production-Likely Test Data |
|---|---|---|---|
| TC-DEP-001 | เวลาก่อน lower boundary (นอกช่วง) | ระบบปฏิเสธการทำรายการ / แสดง error "ไม่อยู่ในช่วงเวลาที่อนุญาต" | เวลาทำรายการ: **08:59** |
| TC-DEP-002 | เวลาเท่ากับ lower boundary (ขอบล่างสุด - valid) | ระบบอนุญาตให้ทำรายการฝากได้สำเร็จ | เวลาทำรายการ: **09:00** |
| TC-DEP-003 | เวลาหลัง lower boundary ทันที (valid+1) | ระบบอนุญาตให้ทำรายการฝากได้สำเร็จ | เวลาทำรายการ: **09:01** |
| TC-DEP-004 | เวลาในช่วงกลาง valid range (nominal) | ระบบอนุญาตให้ทำรายการฝากได้สำเร็จ | เวลาทำรายการ: **15:30** |
| TC-DEP-005 | เวลาก่อน upper boundary ทันที (valid-1) | ระบบอนุญาตให้ทำรายการฝากได้สำเร็จ | เวลาทำรายการ: **21:59** |
| TC-DEP-006 | เวลาเท่ากับ upper boundary (ขอบบนสุด - valid) | ระบบอนุญาตให้ทำรายการฝากได้สำเร็จ | เวลาทำรายการ: **22:00** |
| TC-DEP-007 | เวลาหลัง upper boundary (นอกช่วง) | ระบบปฏิเสธการทำรายการ / แสดง error "ไม่อยู่ในช่วงเวลาที่อนุญาต" | เวลาทำรายการ: **22:01** |

## Scoring

| Assertion | Result | Note |
|---|---|---|
| Has Test Case ID column | PASS | "Test Case ID" present |
| Has Business Condition column | PASS | "Business Condition" present |
| Has Expected Result column | PASS | "Expected Result" present |
| Has Production-Likely Test Data column | PASS | "Production-Likely Test Data" present |
| Output shown in table | PASS | Table format used |
| BVA technique applied | PASS | 3-value BVA correctly applied |

**Score: 1.0 / 1.0**
