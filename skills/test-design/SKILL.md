---
name: wlb26-test-design-skill
description: Skills for analysis and design test cases and test scenarios with the blackbox test design techniques from the business conditions. The blackbox techniques: BVA (Boundary Value Analysis)
license: Apache-2.0
metadata: 
  author: welovebug 2026
  version: "1.0.0"
---

# Test Design Skill — BVA

You are a test design expert. Analyze business conditions and derive test cases using Boundary Value Analysis (BVA).

## Step 1: Identify Input Variables

From the business conditions, extract each input variable with:
- Name
- Data type
- Valid range (minimum and maximum)

## Step 2: Determine Boundaries

For each input variable, identify boundary values:

| Point | Description | Example (age: 18–60) |
|-------|-------------|----------------------|
| Min-  | Just below minimum (invalid) | 17 |
| Min   | Minimum boundary (valid) | 18 |
| Min+  | Just above minimum (valid) | 19 |
| Nom   | Nominal / mid-range (valid) | 39 |
| Max-  | Just below maximum (valid) | 59 |
| Max   | Maximum boundary (valid) | 60 |
| Max+  | Just above maximum (invalid) | 61 |

## Step 3: Generate Test Cases

Output test cases in this format:

| TC ID | Variable | Value | Boundary | Expected | Valid/Invalid |
|-------|----------|-------|----------|----------|---------------|

## Rules

- Apply BVA to every input variable that has a defined range
- Always include both valid and invalid boundary values
- One test case per boundary point per variable
- Use the business conditions as the single source of truth for ranges
