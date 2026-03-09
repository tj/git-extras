# Instructor Notes — Bash Orchestration Assignment

Use this document to set up the assignment, grade submissions, and check debugging answers. Keep this file separate from the student-facing [exercise.md](exercise.md).

---

## 1. Setup checklist (before giving to students)

- [ ] **Assignment and AI rules:** Point students to [exercise.md](exercise.md). They must give [AI_RULES.md](AI_RULES.md) to their AI assistant **before** they start working so the AI follows the usage limits (no full solutions, no fixing buggy scripts for them, etc.).
- [ ] **Buggy scripts:** The four commands `bin/git-count`, `bin/git-authors`, `bin/git-summary`, and `bin/git-effort` are the buggy versions; students fix them in place. `bin/git-bulk` has no intentional bug (analyze only). Run instructions are in [exercise.md](exercise.md) Step 2b.

---

## 2. Five commands for analysis

These are the five commands students must analyze in Step 2. Each covers at least one of: orchestration, file iteration, env vars, error handling, build/CI.

| Command       | Script          | Topics covered |
|---------------|-----------------|----------------|
| **git count** | `bin/git-count` | Orchestration: `git shortlog`, `git rev-list --count`; simple option handling. |
| **git summary** | `bin/git-summary` | Orchestration + **file iteration**: `git log`, `git shortlog`, `git ls-files`, `git blame`; functions like `single_file` / `lines` loop over files. |
| **git authors** | `bin/git-authors` | Orchestration: `git shortlog -sne`; option parsing; writing output to a file. |
| **git effort** | `bin/git-effort` | **Error handling**: `usage()`, validation of `--above`, exit codes; **iteration** over paths (`git ls-files` or arguments). |
| **git bulk** | `bin/git-bulk` | **Iteration** over workspaces and repos; **error handling**: `usage`, `cdfail`, `checkWSName`; **env/config**: `bulkworkspaces` and variable dereference in `parseWsName`. |

Build/CI is covered in the assignment flow (Step 1: read `.github/workflows/ci.yml`; Step 4: run `make` and `check_integrity.sh`), not as a sixth command.

For Step 2b, the first four scripts above are the buggy versions; `bin/git-bulk` has no bug. Bug locations and correct fixes are in section 3 below.

---

## 3. Bug locations and correct fixes (Step 2b — do not share with students)

The four scripts **`bin/git-count`**, **`bin/git-authors`**, **`bin/git-summary`**, and **`bin/git-effort`** are the buggy versions; each has exactly one bug. **`bin/git-bulk`** has no intentional bug. Use the details below to verify student fixes and grade their explanations.

---

### 3.1 git-count

- **Bug location:** Line 8. The script uses `git rev-list --count HEAD^` instead of `git rev-list --count HEAD`.
- **Why it’s wrong:** `HEAD^` is the first parent of the current commit, so the count excludes the current commit. The intended behavior (matching `bin/git-count`) is to count all commits reachable from HEAD, including HEAD itself.
- **How to see the bug:** Run the script in a repo: `./bin/git-count` or `git count`. The “total” line will be one less than the true commit count (e.g. 99 instead of 100). Running `git rev-list --count HEAD` in the same repo gives the correct number.
- **Correct fix:** Change `HEAD^` to `HEAD` on line 8. The line must read:  
  `echo total "$(git rev-list --count HEAD)"`
- **How to verify:** In any repo, run the fixed script and compare “total” to `git rev-list --count HEAD`; they must match.
- **Wrong fixes to reject:** Changing anything else (e.g. only the `--all` branch), or “fixing” by adding 1 in the echo instead of changing the ref.
- **What a good explanation mentions:** That the script was counting the wrong ref (parent instead of HEAD), or that the total was off by one because the current commit was excluded.

---

### 3.2 git-authors

- **Bug location:** Line 21. The test uses unquoted `$LIST`: `if [ $LIST != true ]; then`. `LIST` is never initialized at the top—it is only set to `true` when the user passes `-l` or `--list`.
- **Why it’s wrong:** When you run without `-l` (e.g. `./bin/git-authors` or `git authors AUTHORS`), `LIST` is unset. Then `[ $LIST != true ]` becomes `[ != true ]`, which is a syntax error (unary operator expected). In Bash, variables in `[ ]` must be quoted so the test always gets the right number of arguments; when unquoted and empty/unset, the expansion yields nothing and the test is invalid.
- **How to see the bug:** Run `./bin/git-authors` or `git authors` with no `-l` flag. The bug triggers immediately because `LIST` is unset. You get an error like `bash: [: !=: unary operator expected`.
- **Correct fix:** Initialize `LIST=false` at the top (with the other defaults) and quote the variable in the test: change line 21 to `if [ "$LIST" != true ]; then`.
- **How to verify:** Run without `-l` (e.g. `./bin/git-authors`); the fixed script runs and appends to AUTHORS or the given file. Run with `-l`; output goes to stdout. No syntax error in either case.
- **Wrong fixes to reject:** Only changing the test logic without quoting or initializing `LIST`, or fixing a different line.
- **What a good explanation mentions:** That `LIST` is only set when `-l`/`--list` is used, so it is unset on normal runs; unquoted `$LIST` in `[ ]` then becomes `[ != true ]`; the fix is to initialize `LIST=false` and quote `"$LIST"` in the test.

---

### 3.3 git-summary

- **Bug location:** Two places. (1) Line 13: the case matches `"x$arg"` instead of `"$arg"` — i.e. `case "x$arg" in`. So the value being matched is literally `x--line`, `x--dedup-by-email`, etc., and no pattern (`--line`, `--full-path`, `-*`, etc.) ever matches; every argument falls through to the default branch. (2) In the `*)` branch (lines 33–36), the line `set -- "$@" "$arg"` is commented out, so positional arguments (refs, paths) are never added back to the list and are lost after the loop.
- **Why it’s wrong:** All command-line arguments are ignored. No option (e.g. `--line`, `--dedup-by-email`, `--no-merges`, `--output-style`, `--full-path`) is ever recognized because the case value is never equal to the patterns. Ref and path arguments are also ignored because they are not added back to the positional parameters, so `commit` stays `HEAD` and `paths` stays empty.
- **How to see the bug:** Run `git summary --line` — it behaves as plain `git summary` (no line summary). Run `git summary main` — the ref is ignored and output is for HEAD. Run `git summary --dedup-by-email` — dedup is not applied. Any combination of options and refs/paths is ignored.
- **Correct fix:** (1) Change line 13 from `case "x$arg" in` to `case "$arg" in`. (2) In the `*)` branch, uncomment `set -- "$@" "$arg"` so that non-option arguments are added back. Both changes are required.
- **How to verify:** Run with options (e.g. `./bin/git-summary --line`, `./bin/git-summary --dedup-by-email`) and with a ref (e.g. `./bin/git-summary main`). Output must reflect the options and the ref.
- **Wrong fixes to reject:** Fixing only one of the two issues (e.g. only restoring `case "$arg" in` but leaving `set --` commented out, or only uncommenting `set --` but leaving `case "x$arg" in`).
- **What a good explanation mentions:** That the case was matching the wrong value (e.g. `"x$arg"` instead of `"$arg"`), so no option pattern matched and all arguments fell through to the default; and that positional arguments must be added back in the default branch so that refs and paths are preserved.

---

### 3.4 git-effort

- **Bug location:** Line 101. The condition uses `-lt` (strict less than): `test "$commits" -lt "$above" && exit 0`.
- **Why it’s wrong:** The comment says “Ignore paths with commits <= above.” So we should skip (exit 0) when commits is *less than or equal to* above. With `-lt` we only skip when commits is *strictly less than* above. When `commits == above`, we should skip, but the buggy script does not skip and prints that path. So paths with exactly `above` commits are incorrectly shown.
- **How to see the bug:** Run with `--above 2` and ensure the repo has at least one file with exactly 2 commits. The buggy script will print that file; the correct behavior is to hide it. Example: `./bin/git-effort --above 2` or `git effort --above 2` — any path with exactly 2 commits should not appear in the output.
- **Correct fix:** Change `-lt` to `-le` on line 101:  
  `test "$commits" -le "$above" && exit 0`  
  so that paths with commits less than or equal to `above` are skipped.
- **How to verify:** Run with `--above N` in a repo where at least one path has exactly N commits. The fixed script must not list that path; the buggy script lists it.
- **Wrong fixes to reject:** Changing the logic in a different way (e.g. changing the comparison in the wrong direction), or only adjusting the comment without fixing the test.
- **What a good explanation mentions:** That the condition should be “less than or equal to” (skip when commits ≤ above), not “less than,” so that paths with exactly `above` commits are hidden.

---

## 4. Single problem (Step 3) — grading checklist

All students implement **`git recent-committers`** with the same requirements (full problem is in [exercise.md](exercise.md) Step 3). Accept different approaches (e.g. different option names, or different ways to specify the time window) as long as:

- [ ] Command is `git recent-committers` and lives in `bin/git-recent-committers`.
- [ ] At least one environment variable controls behavior (e.g. default number of days) and is documented.
- [ ] At least one explicit error check (repo or option validation) with stderr message and non-zero exit.
- [ ] Script contains a loop that iterates over multiple items (e.g. shortlog or log lines for the time window).
- [ ] `./check_integrity.sh recent-committers` passes (script, man, Commands.md, completion).

---

## 5. Rubric (suggested)

| Category | What to check |
|----------|----------------|
| **Implementation** | `bin/git-recent-committers` exists, executable, shebang correct; env var used; at least one error check; at least one loop; behavior matches problem (committers in time window + commit count). |
| **Integration** | Man page present and built; Commands.md updated; completion updated; `./check_integrity.sh recent-committers` passes. |
| **Documentation** | Usage and examples clear; explanation (what it does, how to run, changes, orchestration, env var, errors, iteration) complete. |
| **Step 2 (analysis)** | All four commands analyzed; at least one iteration example identified and explained. |
| **Step 2b (debugging)** | All four buggy scripts (git-count, git-authors, git-summary, git-effort) fixed correctly; each fix explained in 2–3 sentences. |
| **Reflection (optional)** | If provided, one example per learning goal used. |

---

## 6. Optional elements

Students may optionally:

- Read the install script and explain `PREFIX`.
- Describe or add a CI step that runs `check_integrity.sh` for their command.
- Write a small script to clean only built man pages for their command.
- Use `set -e` or explicit per-command checks and explain in the documentation.

These can be noted in grading but are not required for full marks.
