# Bash Orchestration Assignment

## Overview

This assignment teaches how **Bash** is used in real software development by having you extend a collection of Git utilities. You will read existing scripts, debug simplified buggy versions, and implement one new command. All work is done in this repository.

**Estimated time:** 8–10 hours (assuming you use AI tools where allowed).

---

## Before you start

You **must** give **[AI_RULES.md](AI_RULES.md)** to your AI assistant **before** you ask it for help on this assignment:

- Paste the full text of AI_RULES.md into your **first** message to the AI, or  
- Attach AI_RULES.md as context so the AI reads it.
- Export the chats with the AI assistant, and hand them in as a part of the pull request.

Your AI must follow the rules in that document (e.g. it must not fix the buggy scripts for you or write full solutions). If you use more than one AI tool, give each one the same document at the start. Then begin with Step 1 below.

---

## Learning goals

By completing this assignment you will have used:

- **Orchestration:** Running Git and other CLI tools from Bash and using their output.
- **Environment variables:** Reading or setting variables to configure script behavior (e.g. default limits or output format).
- **File iteration / bulk operations:** Looping over files, lines, or refs (e.g. `while read`, `for` over arrays).
- **Error handling:** Checking exit codes, validating arguments, and exiting with clear messages (e.g. to stderr) when something fails.

---

## Step 1 — Clone, setup, explore

1. Clone this repository (or the one your instructor assigned).
2. Make the commands available:
   - Run the install process from your cloned repository (see [Installation.md](../Installation.md)).
3. From the repo root, run at least three existing commands of you choosing in a real Git repo and note what they do, while writing their outputs to files names "<command-name>_output.txt and hand them in. 





---

## Step 2 — Analyze and debug four commands

You will work with these four commands (scripts in `bin/`): **`git count`**, **`git summary`**, **`git authors`**, and **`git effort`**. They are **buggy** versions—each has **exactly one** intentional bug. Do the following instructions for **each** of the four scripts:- 

| Command        | Script           |
|----------------|------------------|
| `git count`    | [bin/git-count](../bin/git-count) |
| `git summary`  | [bin/git-summary](../bin/git-summary) |
| `git authors`  | [bin/git-authors](../bin/git-authors) |
| `git effort`   | [bin/git-effort](../bin/git-effort) |

1. List which **Git commands** or **Bash commands** the script runs, and document above each one what it does and what its flags mean.
2. Run the script and observe any wrong output or failure.
3. Locate the bug in the script.
4. Fix the bug in place and confirm the script behaves correctly.
5. **In the script, add 2–3 lines of comments** at the exact place that used to have the bug, briefly explaining what was wrong and how your fix addresses it.


---

## Step 3 — Implement one new command (same problem for everyone)

Implement a new command that **combines ideas** from the codebase and satisfies the requirements below.

**Use the existing shell scripts in this repository for help.** The scripts in `bin/` (e.g. [bin/git-count](../bin/git-count), [bin/git-authors](../bin/git-authors), [bin/git-summary](../bin/git-summary), [bin/git-effort](../bin/git-effort)) show how to run Git commands, handle options, and iterate over output. Study them for patterns (e.g. how to check for a repo, how to use `git shortlog` or `git log`, how to loop over lines) and adapt those ideas in your implementation.

### Problem: `git recent-committers`

Implement **`git recent-committers`** so that it:

1. **Lists people who made at least one commit in the last N days**, with their commit count in that period (e.g. one line per committer: `5  Alice`, `2  Bob`). Use Git plumbing (e.g. `git shortlog` with a date range, or `git log --since=...`) and any text processing you need.
2. **Uses at least one environment variable** to control behavior (e.g. `GIT_RECENT_COMMITTERS_DAYS=7` to use the last 7 days by default). Document the variable in the man page.
3. **Checks at least one error condition:** exit with a clear message to **stderr** and non-zero exit code if:
   - the command is not run inside a Git repository, or
   - an optional numeric option (e.g. `-n 5` for 5 days) is given but is not a positive integer.
4. **Iterates over at least one collection:** your script must include a loop (e.g. `while read`, or `for` over an array) that processes multiple items (e.g. lines from `git shortlog` or `git log` for the time window).


Different implementations (e.g. different option names, or different ways to specify the time window) are acceptable as long as the requirements above are met.

---

## Step 4 — Modification exercise: extend `git alias` (Bonus 10 points)

As a **modification** exercise, extend the existing [bin/git-alias](../bin/git-alias) command so that it supports **removing** aliases in addition to listing and adding them.

Implement the following while handling edge cases:

1. **Remove a single alias by name**  
   Add a way to remove one alias (e.g. `git alias --remove <alias-name>` or `git alias -r <alias-name>`). Respect `--global` and `--local` so the alias is removed from the same config scope used for listing/adding. If the alias does not exist, exit with a clear message to **stderr** and a non-zero exit code.

2. **Remove all aliases**  
   Add a way to remove every alias in the current scope (e.g. `git alias --remove-all` or `git alias --clear`). Again respect `--global` and `--local`. Your script must **iterate** over the existing aliases (e.g. using the same config listing as for “list all”) and unset each one.

3. Document your changes in [Commands.md](../Commands.md) under the `git alias` entry.
   
---

## Step 5 — Build, validate, document (Bonus 5 points)

1. Build the man page for your command (see [man/Readme.md](../man/Readme.md)). From the repo root you can run `make docs` to build all man pages, or build only your command’s `.1` and `.html` as described in the man Readme.
2. Run the integrity checker for your command:
   ```bash
   ./check_integrity.sh recent-committers
   ```
   Fix any reported issues until it passes.
3. Optionally: write a small script that removes only the **built** man pages for your command (e.g. `man/git-recent-committers.1` and `man/git-recent-committers.html`) without deleting the `.md` source. This illustrates artifact management.

---

## References

- [CONTRIBUTING.md](../CONTRIBUTING.md) — how to add a new command
- [check_integrity.sh](../check_integrity.sh) — validation script
- [.github/workflows/ci.yml](../.github/workflows/ci.yml) — CI workflow
- [man/Readme.md](../man/Readme.md) — how to build man pages
- [Commands.md](../Commands.md) — list and short docs of all commands
