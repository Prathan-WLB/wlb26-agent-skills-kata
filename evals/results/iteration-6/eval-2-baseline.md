# Eval 2 — Baseline

**Eval ID:** 2  **Run type:** baseline  **Iteration:** 6  **Date:** 2026-03-26

## Prompt
วิเคราะห์ และออกแบบ test case ของเงื่อนไข ช่วงเวลาที่อนุญาตให้ทำรายการฝาก ได้ 09:00 - 22:00

## Expected Output
Show test case and test data in table.

## Assertions
- Test case should include Test Case ID, Business Condition, Expected Result, and Production-Likely Test Data.

## Output (excerpt)

BVA analysis with 6 boundary values (08:59, 09:00, 09:01, 21:59, 22:00, 22:01) shown as individual vertical tables:

| Field | Detail |
|---|---|
| **Test Case ID** | TC-DEP-TIME-001 |
| **Test Case Name** | ฝากเงินก่อนเวลา 09:00 (Boundary -1) |
| **Precondition** | ผู้ใช้ล็อกอินแล้ว, มียอดเงินพร้อมฝาก |
| **Input** | เวลาระบบ = **08:59** |
| **Steps** | 1. ตั้งเวลาระบบ... |
| **Expected Result** | ระบบแสดง error ... |
| **Technique** | BVA - Lower Boundary -1 |

[6 test cases: 08:59, 09:00, 09:01, 21:59, 22:00, 22:01 — 3-value BVA per boundary]

## Scoring

| Assertion | Result | Note |
|---|---|---|
| Output in table format | PASS | Tables present |
| Has Test Case ID column | PASS | Present |
| Has Business Condition column | FAIL | Uses "Test Case Name" instead |
| Has Expected Result column | PASS | Present |
| Has Production-Likely Test Data column | FAIL | Uses "Input" with clock time, not production-realistic data |
| BVA applied correctly | PASS | 3-value BVA applied (boundary ±1) |

**Score: 0.3 / 1.0**

## Notes
Baseline and with-skill outputs are structurally identical — both use their own column schemas without the 4 required columns. Baseline applied 3-value BVA (b-1, b, b+1) vs with-skill's 2-value (ON/OFF point) — both are valid BVA variants. Without SKILL.md column specification, neither variant produces the required schema.
