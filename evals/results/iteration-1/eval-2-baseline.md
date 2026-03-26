# Eval 2 — Baseline (No Skill)

**Eval ID:** 2
**Run type:** baseline
**Skill:** none
**Date:** 2026-03-26

## Prompt
วิเคราะห์ และออกแบบ test case ของเงื่อนไข ต้องไม่เป็นบัญชีออมทรัพย์ที่ถูกอายัด

## Expected Output
BVA technique does not apply.

## Output

### การวิเคราะห์และออกแบบ Test Case

#### เงื่อนไข: ต้องไม่เป็นบัญชีออมทรัพย์ที่ถูกอายัด

#### 1. การวิเคราะห์เงื่อนไข (Condition Analysis)

| ตัวแปร | ค่าที่เป็นไปได้ |
|---|---|
| ประเภทบัญชี (Account Type) | ออมทรัพย์ (Savings) / ไม่ใช่ออมทรัพย์ (Non-Savings) |
| สถานะอายัด (Frozen Status) | ถูกอายัด (Frozen) / ไม่ถูกอายัด (Not Frozen) |

**ผลลัพธ์ที่ต้องการ:**
- ผ่านเงื่อนไข (Pass): บัญชีที่ "ไม่ใช่ทั้งออมทรัพย์ AND ถูกอายัด" พร้อมกัน
- ไม่ผ่านเงื่อนไข (Fail): บัญชีออมทรัพย์ที่ถูกอายัด

#### 2. Decision Table

| กรณี | ประเภทบัญชี | สถานะอายัด | ผลลัพธ์ | เหตุผล |
|---|---|---|---|---|
| TC-01 | ออมทรัพย์ | ถูกอายัด | **FAIL** | ตรงเงื่อนไขต้องห้ามทั้งสองข้อ |
| TC-02 | ออมทรัพย์ | ไม่ถูกอายัด | PASS | เป็นออมทรัพย์แต่ไม่ถูกอายัด |
| TC-03 | ไม่ใช่ออมทรัพย์ | ถูกอายัด | PASS | ถูกอายัดแต่ไม่ใช่ออมทรัพย์ |
| TC-04 | ไม่ใช่ออมทรัพย์ | ไม่ถูกอายัด | PASS | ไม่ตรงเงื่อนไขต้องห้ามเลย |

*(Full output includes 8 test cases covering positive, negative, edge, and boundary scenarios)*

## Scoring

| Assertion | Result | Note |
|---|---|---|
| States BVA does not apply | FAIL | Never mentions BVA or why it doesn't apply |
| Explains why BVA doesn't apply | FAIL | No mention of BVA applicability at all |
| Provides appropriate alternative | PASS | Uses Decision Table and EP — technically sound approach |

**Score: 0.3 / 1.0**

**Notes:** The output provides solid test case design using EP and Decision Table, which are appropriate techniques. However, it completely omits any analysis of BVA applicability, which is the key expected output for this eval. The skill is expected to help identify when BVA does and does not apply.
