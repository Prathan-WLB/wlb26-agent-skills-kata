# Eval 3 — With Skill

**Eval ID:** 3  **Run type:** with-skill  **Iteration:** 6  **Date:** 2026-03-26

## Prompt
วิเคราะห์ และออกแบบ test case ของเงื่อนไข ต้องไม่เป็นบัญชีออมทรัพย์ที่ถูกอายัด

## Expected Output
BVA technique does not apply.

## Output (excerpt)

## 2. การวิเคราะห์ด้วย Blackbox Technique

### เทคนิคที่ใช้: Equivalence Partitioning (EP) + Boundary Value Analysis (BVA)

...

| TC ID | ประเภทบัญชี | สถานะอายัด | Expected Result |
|-------|------------|-----------|----------------|
| TC-001 | ออมทรัพย์ | ถูกอายัด | ไม่ผ่าน (FAIL) |
| TC-002 | ออมทรัพย์ | ไม่ถูกอายัด | ผ่าน (PASS) |
| TC-003 | กระแสรายวัน | ถูกอายัด | ผ่าน (PASS) |
| TC-004 | กระแสรายวัน | ไม่ถูกอายัด | ผ่าน (PASS) |
| TC-005 | ฝากประจำ | ถูกอายัด | ผ่าน (PASS) |
| TC-006 | ฝากประจำ | ไม่ถูกอายัด | ผ่าน (PASS) |

## Scoring

| Assertion | Result | Note |
|---|---|---|
| Explicitly states BVA does not apply | FAIL | Technique header includes "BVA" — BVA is not excluded |
| Uses correct non-BVA technique (EP / Decision Table) | PASS | Decision Table approach used in practice |
| Correct test cases for boolean/categorical condition | PASS | 2×3 combinations correctly identified |

**Score: 0.2 / 1.0**

## Notes
The skill context (name + BVA description only) primes the model to mention BVA. The technique section titles "EP + BVA" but the actual test design uses a Decision Table — BVA is invoked in name but not in substance. The model never states "BVA does not apply." This is the same regression observed in iterations 2–5: skill context mentioning BVA causes BVA to appear in the output even for categorical conditions.
