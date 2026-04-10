## Step 7: Export Test Cases to Markdown

This step is **mandatory** and must always be performed as the final action of every test design session. Do not end the session without asking the export question — even if the user did not mention exporting.

Immediately after the last applicable step (Step 5 or Step 6) finishes, perform the following:

1. Ask the user for confirmation before exporting:
   > "Do you want me to export all test cases to a Markdown file? (yes/no) If yes, please confirm the file path or filename."
2. Wait for the user's confirmation. Do not export until the user explicitly agrees.
3. If the user declines, acknowledge and end the session. The export question itself is required; the export action is not.
4. If confirmed, **before** writing the file, run `.claude/skills/test-design/export-metadata.sh` to collect metadata values. The script outputs three labeled sections:
   - `=== Date ===` — current date in YYYY-MM-DD format
   - `=== Duration ===` — session length in `Hh Mm Ss` format (computed from JSONL transcript timestamps)
   - `=== Tokens ===` — JSON object with input, output, cache_creation, cache_read, and total token counts

   If any value shows "unavailable", label it as approximate in the exported file.

5. Write a single Markdown file containing **all** generated artifacts in this order:
   - **Metadata header** — at the very top of the file, include the real values captured above:
     - **Date:** YYYY-MM-DD (from the `date` command)
     - **Total Duration:** session length in `Hh Mm Ss` format (from the duration command in step 4b)
     - **Tokens Used:** total token count from the JSONL sum, with a breakdown of input / output / cache_creation / cache_read on separate lines
   - Input Variables (Step 1)
   - Technique Selection (Step 2)
   - BVA Boundaries and Test Cases (Step 3) — one section per condition
   - EP Partitions and Test Cases (Step 4) — one section per condition
   - Decision Table — Success Scenarios and Alternative Scenarios (Step 5)
   - State Transition — States, Events, Transition Table, Valid and Invalid Transition Test Cases (Step 6)
6. Preserve all tables exactly as generated. Do not summarize or collapse rows.
7. After writing, report the file path back to the user.

## Export Rules

- Always ask the user for confirmation before exporting — never write the Markdown file automatically
- Only export after all applicable steps (1-6) have been completed
- Include every generated table and section; do not omit, summarize, or collapse content
- Use the file path or filename provided by the user; if none is given, ask before choosing a default
- Every exported file must begin with a metadata header containing Date, Total Duration, and Tokens Used
- All metadata values (Date, Duration, Tokens) must come from running `.claude/skills/test-design/export-metadata.sh`, not from estimates or placeholders. Only label a value as approximate if the script outputs "unavailable"
