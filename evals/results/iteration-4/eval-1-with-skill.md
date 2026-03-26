# Eval 1 — With Skill

**Eval ID:** 1  **Run type:** with-skill  **Iteration:** 4  **Date:** 2026-03-26

## Output

| Test Case ID | Business Condition | Expected Result | Production-Likely Test Data |
|---|---|---|---|
| TC-DEP-001 | เวลาก่อนขอบล่าง 1 นาที (Lower - 1) | ระบบปฏิเสธรายการฝาก แสดงข้อความ "ไม่อยู่ในช่วงเวลาที่อนุญาต" | เวลาทำรายการ: **08:59** |
| TC-DEP-002 | เวลาที่ขอบล่างพอดี (Lower Boundary) | ระบบอนุญาตให้ทำรายการฝากได้สำเร็จ | เวลาทำรายการ: **09:00** |
| TC-DEP-003 | เวลาหลังขอบล่าง 1 นาที (Lower + 1) | ระบบอนุญาตให้ทำรายการฝากได้สำเร็จ | เวลาทำรายการ: **09:01** |
| TC-DEP-004 | เวลาก่อนขอบบน 1 นาที (Upper - 1) | ระบบอนุญาตให้ทำรายการฝากได้สำเร็จ | เวลาทำรายการ: **21:59** |
| TC-DEP-005 | เวลาที่ขอบบนพอดี (Upper Boundary) | ระบบอนุญาตให้ทำรายการฝากได้สำเร็จ | เวลาทำรายการ: **22:00** |
| TC-DEP-006 | เวลาหลังขอบบน 1 นาที (Upper + 1) | ระบบปฏิเสธรายการฝาก แสดงข้อความ "ไม่อยู่ในช่วงเวลาที่อนุญาต" | เวลาทำรายการ: **22:01** |

## Scoring

| Assertion | Result | Note |
|---|---|---|
| Has Test Case ID column | PASS | Present |
| Has Business Condition column | PASS | Present |
| Has Expected Result column | PASS | Present |
| Has Production-Likely Test Data column | PASS | Present |
| Output shown in table | PASS | Table format used |
| BVA technique applied | PASS | Lower/Upper boundary ±1 correctly applied |

**Score: 1.0 / 1.0**
