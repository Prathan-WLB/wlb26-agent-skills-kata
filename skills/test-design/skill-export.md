## Step 7: Export Test Cases to Markdown

This step is **mandatory** and must always be performed as the final action of every test design session. Do not end the session without asking the export question — even if the user did not mention exporting.

Immediately after the last applicable step (Step 5 or Step 6) finishes, perform the following:

1. Ask the user for confirmation before exporting:
   > "Do you want me to export all test cases to a Markdown file? (yes/no) If yes, please confirm the file path or filename."
2. Wait for the user's confirmation. Do not export until the user explicitly agrees.
3. If the user declines, acknowledge and end the session. The export question itself is required; the export action is not.
4. If confirmed, **before** writing the file, gather real values for the metadata header by running these Bash commands:

   **a. Get the current date (real wall-clock):**
   ```bash
   date "+%Y-%m-%d"
   ```

   **b. Get the total session duration** from the same JSONL transcript by computing the difference between the first and last entry's `timestamp` field:
   ```bash
   PROJECT_DIR="$HOME/.claude/projects/$(pwd | sed 's|/|-|g')"
   SESSION_FILE=$(ls -t "$PROJECT_DIR"/*.jsonl 2>/dev/null | head -1)
   jq -rs '
     [.[] | .timestamp // empty] as $ts
     | ($ts | min) as $start
     | ($ts | max) as $end
     | (($end | fromdateiso8601) - ($start | fromdateiso8601)) as $secs
     | "\($secs | floor / 3600 | floor)h \(($secs | floor / 60 | floor) % 60)m \($secs | floor % 60)s (\($secs | floor)s total)"
   ' "$SESSION_FILE"
   ```

   **c. Get the total tokens used in the current session** by reading Claude Code's session transcript. Find the most recently modified JSONL file in the current project's session directory and sum every API call's usage fields:
   ```bash
   PROJECT_DIR="$HOME/.claude/projects/$(pwd | sed 's|/|-|g')"
   SESSION_FILE=$(ls -t "$PROJECT_DIR"/*.jsonl 2>/dev/null | head -1)
   jq -s '
     [.[] | .message.usage // empty
       | { input: (.input_tokens // 0),
           output: (.output_tokens // 0),
           cache_creation: (.cache_creation_input_tokens // 0),
           cache_read: (.cache_read_input_tokens // 0) }]
     | { input: (map(.input) | add),
         output: (map(.output) | add),
         cache_creation: (map(.cache_creation) | add),
         cache_read: (map(.cache_read) | add),
         total: (map(.input + .output + .cache_creation + .cache_read) | add) }
   ' "$SESSION_FILE"
   ```

   If either command fails (e.g., `jq` not installed, no session file), fall back to the best available value and label it as approximate.

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
- Total Duration must be computed from the first and last `timestamp` entries in the current session's JSONL transcript, not estimated
- Date must come from the actual `date` command, not from system context or a placeholder
- Tokens Used must come from summing the current session's JSONL transcript via `jq`, not from a guess. Only fall back to an approximate value if the JSONL or `jq` is genuinely unavailable, and label it as approximate
