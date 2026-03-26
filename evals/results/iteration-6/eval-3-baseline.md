# Eval 3 — Baseline

**Eval ID:** 3  **Run type:** baseline  **Iteration:** 6  **Date:** 2026-03-26

## Prompt
วิเคราะห์ และออกแบบ test case ของเงื่อนไข ต้องไม่เป็นบัญชีออมทรัพย์ที่ถูกอายัด

## Expected Output
BVA technique does not apply.

## Output (excerpt)

## 2. เทคนิคที่ใช้ในการออกแบบ

- **Boundary Value Analysis (BVA)**
- **Equivalence Partitioning (EP)**
- **Decision Table Testing**

...

| Rule | ประเภทบัญชี = ออมทรัพย์ | สถานะ = ถูกอายัด | ผลลัพธ์ |
|------|------------------------|-----------------|---------|
| R1 | T | T | FAIL |
| R2 | T | F | PASS |
| R3 | F | T | PASS |
| R4 | F | F | PASS |

## Scoring

| Assertion | Result | Note |
|---|---|---|
| Explicitly states BVA does not apply | FAIL | BVA listed as first technique to use |
| Uses correct non-BVA technique (EP / Decision Table) | PASS | Decision Table produced correctly |
| Correct test cases for boolean/categorical condition | PASS | 4-rule decision table is complete and correct |

**Score: 0.2 / 1.0**

## Notes
Baseline lists BVA as one of three techniques but then correctly uses only EP and Decision Table in the actual test case design. The BVA mention is unused, but the model never explicitly declares "BVA does not apply." Score is the same as with-skill (0.2) because both fail on the primary criterion. Baseline's BVA reference is more incidental (listed in technique catalogue) vs with-skill's forced "EP + BVA" title.
