# Bash Orchestration Assignment

## Overview

This assignment teaches how **Bash** is used in real software development by having you extend a collection of Git utilities. You will read existing scripts, debug simplified buggy versions, and implement one new command. All work is done in this repository.

**Estimated time:** 8–10 hours (assuming you use AI tools where allowed).

---

## Before you start

You **must** give **[AI_RULES.md](AI_RULES.md)** to your AI assistant **before** you ask it for help on this assignment:

- Paste the full text of AI_RULES.md into your **first** message to the AI, or  
- Attach AI_RULES.md as context so the AI reads it.

Your AI must follow the rules in that document (e.g. it must not fix the buggy scripts for you or write full solutions). If you use more than one AI tool, give each one the same document at the start. Then begin with Step 1 below.

---

## Learning goals

By completing this assignment you will have used:

- **Orchestration:** Running Git and other CLI tools from Bash and using their output.
- **Environment variables:** Reading or setting variables to configure script behavior (e.g. default limits or output format).
- **File iteration / bulk operations:** Looping over files, lines, or refs (e.g. `while read`, `for` over arrays).
- **Error handling:** Checking exit codes, validating arguments, and exiting with clear messages (e.g. to stderr) when something fails.
- **Build and artifacts:** Running the project’s build (e.g. `make` for man pages) and understanding where generated artifacts go.
- **CI awareness:** How shell scripts are used in continuous integration (e.g. in [.github/workflows/ci.yml](../.github/workflows/ci.yml)).

Optional: at the end you may add a short reflection (one example per goal you used).

---

## Step 1 — Clone, setup, explore

1. Clone this repository (or the one your instructor assigned).
2. Make the commands available:
   - Either add the repository’s `bin/` directory to your `PATH`, or run the install process (see [Installation.md](../Installation.md)).
3. From the repo root, run at least three existing commands (e.g. `git count`, `git summary`, `git authors`) in a real Git repo and note what they do.
4. In one or two sentences, describe **how** you made the commands available (PATH, symlink, or install script).

**Optional:** Read the first 20–30 lines of [install.sh](../install.sh). What is the role of the `PREFIX` variable?

**Optional (CI):** Open [.github/workflows/ci.yml](../.github/workflows/ci.yml). Identify one or two steps that run shell commands. In one sentence: what would happen to your new command (from Step 3) if CI ran `./check_integrity.sh` on it?

---

## Step 2 — Analyze five commands

You will analyze these five commands (scripts in `bin/`):

| Command        | Script           |
|----------------|------------------|
| `git count`    | [bin/git-count](../bin/git-count) |
| `git summary`  | [bin/git-summary](../bin/git-summary) |
| `git authors`  | [bin/git-authors](../bin/git-authors) |
| `git effort`   | [bin/git-effort](../bin/git-effort) |
| `git bulk`     | [bin/git-bulk](../bin/git-bulk) |

For **each** of the five:

1. List which **Git commands** (or other external commands) the script runs.
2. Describe in one or two sentences how **inputs** (arguments, options) are handled and how **output** is produced.
3. In at least **one** of the five scripts, find a place that **iterates over multiple items** (e.g. a `while read` loop, or a `for` over an array, or a pipeline over `git ls-files`). Copy the relevant 3–5 lines and explain in one sentence what is being iterated and why.

Deliverable: a short write-up (can be in your PR description or a file in the repo) that covers the above for all five commands.

---

## Step 2b — Debug five buggy scripts

The five commands **`git count`**, **`git authors`**, **`git summary`**, **`git effort`**, and **`git bulk`** in this repository are **buggy** versions (in **`bin/git-count`**, **`bin/git-authors`**, **`bin/git-summary`**, **`bin/git-effort`**, **`bin/git-bulk`**). Each has **exactly one** intentional bug. Your task is to find and fix each bug in place.

1. Run each script (see table below for how and where).
2. Observe any wrong output or failure.
3. Locate the bug in the script.
4. Fix the bug in place and confirm the script behaves correctly.
5. For **each** of the five scripts, write 2–3 sentences explaining what was wrong and why your fix is correct.

**How and where to run each script:**

| Script | Run where |
|--------|-----------|
| `bin/git-count` | Inside a git repo (`git count` or `./bin/git-count`) |
| `bin/git-authors` | Inside a git repo (`git authors` or `./bin/git-authors`) |
| `bin/git-summary` | Inside a git repo (`git summary` or `./bin/git-summary`) |
| `bin/git-effort` | Inside a git repo (`git effort` or `./bin/git-effort`) |
| `bin/git-bulk` | No git repo needed; feed a line like `bulkworkspaces.myws /path/to/dir` on stdin (e.g. `echo "bulkworkspaces.myws /path" \| ./bin/git-bulk`) |

Make scripts executable with `chmod +x bin/git-count bin/git-authors bin/git-summary bin/git-effort bin/git-bulk` if needed.

Deliverable: your fixes (patched scripts or a short description of the change) and the five explanations. Include this in your pull request (e.g. in the PR description or in a file such as `assignment/DEBUGGING.md`).

---

## Step 3 — Implement one new command (same problem for everyone)

Implement a new command that **combines ideas** from the codebase and satisfies the requirements below. **Everyone solves the same problem**, but you may use different strategies (e.g. different ways to call Git or format output).

### Problem: `git summary-authors`

Implement **`git summary-authors`** so that it:

1. **Lists repository authors with their commit count** (e.g. one line per author, sorted by commits, e.g. `42  Alice`, `10  Bob`). Use Git plumbing (e.g. `git shortlog`) and any text processing you need.
2. **Uses at least one environment variable** to control behavior (e.g. `GIT_SUMMARY_AUTHORS_LIMIT=10` to show at most 10 authors by default). Document the variable in the man page.
3. **Checks at least one error condition:** exit with a clear message to **stderr** and non-zero exit code if:
   - the command is not run inside a Git repository, or
   - an optional numeric option (e.g. `-n 5`) is given but is not a positive integer.
4. **Iterates over at least one collection:** your script must include a loop (e.g. `while read`, or `for` over an array) that processes multiple items (e.g. lines from `git shortlog`, or a list of refs or files).
5. **Integrates with the project:** add `bin/git-summary-authors` (shebang `#!/usr/bin/env bash`), man page, entry in [Commands.md](../Commands.md), and completion in [etc/git-extras-completion.zsh](../etc/git-extras-completion.zsh), following [CONTRIBUTING.md](../CONTRIBUTING.md).

Different implementations (e.g. different option names, or different ways to apply the limit) are acceptable as long as the requirements above are met.

---

## Step 4 — Build, validate, document

1. Build the man page for your command (see [man/Readme.md](../man/Readme.md)). From the repo root you can run `make docs` to build all man pages, or build only your command’s `.1` and `.html` as described in the man Readme.
2. Run the integrity checker for your command:
   ```bash
   ./check_integrity.sh summary-authors
   ```
   Fix any reported issues until it passes.
3. Optionally: write a small script that removes only the **built** man pages for your command (e.g. `man/git-summary-authors.1` and `man/git-summary-authors.html`) without deleting the `.md` source. This illustrates artifact management.

---

## Step 5 — Explanation in the pull request

Open **one** pull request that includes all deliverables. In the PR (or in a linked document in the repo) provide:

1. **What the command does:** one short paragraph.
2. **How to run it:** synopsis and 1–2 example invocations with sample output.
3. **What you changed or added:** list of files (e.g. `bin/git-summary-authors`, `man/git-summary-authors.md`, `Commands.md`, completion).
4. **How it orchestrates commands:** which Git (or other) commands are called and how their output is used (pipes, variables, loops).
5. **Environment variable:** which variable you used and how the script reads it (e.g. `${VAR:-default}`).
6. **Error handling:** which checks you added and what message the user sees when a check fails.
7. **File iteration:** where the script loops over multiple items and what it does with each.

Optional: which of the learning goals you used and one example per goal.

---

## Deliverables checklist

Submit **one pull request** that includes:

- [ ] **Code:** `bin/git-summary-authors` and any other modified files (man, Commands.md, completion).
- [ ] **Build:** man page built so that `./check_integrity.sh summary-authors` passes.
- [ ] **Usage doc:** what the command does, how to run it, 1–2 examples (in PR or in repo).
- [ ] **Explanation:** the seven items listed in Step 5 (what it does, how to run it, what you changed, orchestration, env var, error handling, iteration).
- [ ] **Step 2 write-up:** analysis of the five commands and the iteration example.
- [ ] **Step 2b:** fixes and explanations for the five buggy scripts.

---

## References

- [CONTRIBUTING.md](../CONTRIBUTING.md) — how to add a new command
- [check_integrity.sh](../check_integrity.sh) — validation script
- [.github/workflows/ci.yml](../.github/workflows/ci.yml) — CI workflow
- [man/Readme.md](../man/Readme.md) — how to build man pages
- [Commands.md](../Commands.md) — list and short docs of all commands
