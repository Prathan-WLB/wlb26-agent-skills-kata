# Eval 2 — Baseline (No Skill)

**Eval ID:** 2  **Run type:** baseline  **Iteration:** 5  **Date:** 2026-03-26

## Expected Output
BVA technique does not apply.

## Output

Uses EP + Decision Table + State Transition + BVA. Explicitly lists "Boundary Value Analysis" as one of 4 design techniques:

> "Boundary Value Analysis: ตรวจสอบกรณีเปลี่ยนสถานะ (ปลดอายัด) เพื่อให้แน่ใจว่า Boundary ของการเปลี่ยนแปลงสถานะถูกต้อง"

6 test cases covering: frozen savings (FAIL), active savings (PASS), non-savings frozen (PASS), non-savings active (PASS), state-transition unfreeze, null status.

## Scoring

| Assertion | Result | Note |
|---|---|---|
| States BVA does not apply | FAIL | Lists BVA as an applicable technique |
| Explains why BVA doesn't apply | FAIL | No discussion |
| Provides appropriate alternative | PASS | EP and Decision Table correctly used |

**Score: 0.2 / 1.0**
