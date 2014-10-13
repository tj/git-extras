
2.1.0 / 2014-10-13
==================

 * Fixes #266
 * Merge pull request #264 from jamesmanning/patch-1
 * fixed descriptions: match required/optional params
 * Merge pull request #263 from Yitsushi/bug/180-does-not-check-out-branch-if-it-already-exists
 * fix #180 and #232 feature|bug|refactor checkout
 * Merge pull request #262 from rstacruz/gh-259-git-pr
 * Implement git-pr
 * Merge pull request #261 from sanusart/master
 * FIX: representation of git-info
 * Merge pull request #260 from brandondrew/patch-1
 * import changes *from* a branch
 * Merge pull request #258 from spacewander/master
 * use mixin to add 'is git repo' check for some commands
 * Merge pull request #255 from sanusart/master
 * Bump version in `bin/git-extras`
 * Changelogs for version 2.0.0

n.n.n / 2014-10-13
==================

 * Fixes #266
 * Merge pull request #264 from jamesmanning/patch-1
 * fixed descriptions: match required/optional params
 * Merge pull request #263 from Yitsushi/bug/180-does-not-check-out-branch-if-it-already-exists
 * fix #180 and #232 feature|bug|refactor checkout
 * Merge pull request #262 from rstacruz/gh-259-git-pr
 * Implement git-pr
 * Merge pull request #261 from sanusart/master
 * FIX: representation of git-info
 * Merge pull request #260 from brandondrew/patch-1
 * import changes *from* a branch
 * Merge pull request #258 from spacewander/master
 * use mixin to add 'is git repo' check for some commands
 * Merge pull request #255 from sanusart/master
 * Bump version in `bin/git-extras`
 * Changelogs for version 2.0.0

2.0.0 / 2014-09-20
==================

 * Merge pull request #254 from spacewander/master
 * add welcome in git-repl
 * Merge pull request #253 from tailored-tunes/master
 * Added option to specify base
 * Merge pull request #252 from sorbits/patch-1
 * Update homebrew URL and remove ‘buggy’ label
 * Merge pull request #250 from sanusart/master
 * ADD: git-reset-file
 * Merge pull request #248 from rstacruz/patch-1
 * Readme: document git-delete-merged-branches
 * Merge pull request #247 from visionmedia/perm_fix
 * File perms fix.
 * Merge pull request #242 from sanusart/fix_feature_refactor_bug
 * Merge pull request #244 from toksea/patch-1
 * Merge pull request #243 from sanusart/issue234
 * Fix wrong git-info heading level in Readme.md
 * Revert 2 commits to `git-changelog`
 * Fix feature|refactor|bug testing argument for string lenght
 * Merge pull request #240 from egrim/bug/delete-merged-branches-clobbers-master
 * Update docs to match `git-delete-merged-branches` behavior
 * Exempt `master` from deleted branches
 * Merge pull request #239 from bruno-/refactor_git_squash
 * Refactor and improve `git squash`
 * Merge pull request #238 from techjacker/feature/git-fork
 * add git-fork
 * Merge pull request #236 from jbnicolai/align-authors-git-summary
 * Uses column -t to align summary output in a table.
 * Merge pull request #221 from zlx/feature/git-summary-doc
 * Merge pull request #224 from StewartJarod/patch-1
 * Merge pull request #189 from rhacker/patch-1
 * Merge pull request #235 from sanusart/patch-1
 * FIX: check if un-pushed commits
 * Merge pull request #202 from julionc/protecting-files
 * Update Readme.md with lock and unlock commands
 * git-unlock Unlock local files in git repository
 * git-lock Lock files in git repository
 * Merge pull request #100 from niklasf/rebase-patch
 * Add git-rebase-patch
 * Merge pull request #200 from emkay/patch-1
 * Merge pull request #195 from carlcasbolt/patch-1
 * Merge pull request #181 from zeroDivisible/feature/handle-misspellings
 * Merge pull request #193 from pzelnip/git-setup-no-overwrite
 * Merge pull request #183 from chernjie/master
 * Merge pull request #220 from sanusart/master
 * Merge pull request #63 from justone/git_missing
 * Merge pull request #173 from accerqueira/master
 * Merge pull request #194 from makeusabrew/patch-1
 * Merge pull request #216 from stephenmathieson/fix/changelog-large-versions
 * Merge pull request #188 from twolfson/dev/add.multi.delete.squashed
 * Merge pull request #219 from jhoffmann/patch-1
 * Merge pull request #222 from jsipprell/pull/filenames-containing-spaces
 * Merge pull request #223 from mwoc/master
 * Merge pull request #229 from yggdr/master
 * Merge pull request #231 from petersohn/master
 * Make git-obliterate work if there are whitespaces in filename
 * invoke bash via /usr/bin/env for portability
 * improved Makefile with BINPREFIX
 * fixed Makefile uninstall target for man files
 * Letter spacing in author list
 * Use two-space indents for log entry output, so it again is debian changelog compatible (as before commit 1235e4a5)
 * git effort: handle filenames containing whitespace cleanly
 * Add line-summary as an options --line  & doc
 * Add check for no changes in the tree (no sub-modules)
 * Update Readme.md
 * Fix changelog formatting for large version numbers
 * removing `git promote`
 * Update Readme.md
 * Fix git-squash typo
 * Address issue #190, git-setup should test for existing .git in target directory
 * Add comment for the code
 * Added multi-delete for git-delete-branch and git-delete-tag Correcting typos Compiled latest documentation Applying changes from delete-tag to delete-branch for consistency Removed unnecessary string quotes (thanks `git` ref design) and everything works Tags are not being found with string concatenation Updated delete-tag to accept multiple tags Corrections for delete-branch Updating docs for delete-tag Added 'Todd Wolfson' to AUTHORS Updated documentation for delete-branch Moved deletions to concatenate strings and delete in one fell swoop Reworking delete-branch to delete multiple branches in series
 * git-create-branch: bug fix for branch creation use HEAD instead of origin
 * changed the code for git bug|feature|refactor to only accept single argument when not finishing a bug|feature|refactor. This is an easy solution to avoid misspelings of the word 'finish'
 * allow options to be passed through to git log
 * adding git-missing command

1.9.1 / 2014-06-21
==================

 * add --no-merges option to changelog
 * fix git-changelog errors when multiple files match change|history
 * fix git-changelog errors on first usage
 * update git-changelog docs for --no-merges option

1.9.0 / 2013-06-18
==================

 * git-squash: add --me flag to flatten the current branch
 * Make repository_age() "history rewrite safe"
 * add git-line-summary

1.8.0 / 2013-05-15
==================

  * add `git-archive-file(1)`
  * add --tag support to git-changelog(1) to reduce manual editing
  * add !cmd support to git-repl
  * change: git-delete-merged-branches: use -D instead of delete-branch

1.7.0 / 2012-06-11
==================

  * Added repo age to `git-summary` [muhtasib]

1.6.0 / 2012-06-04
==================

  * Added `git-rename-tag`
  * Added current branch to `git-repl`
  * Fixed: use dirname for `git extras update` [wilmoore]

1.5.1 / 2012-03-15
==================

  * Reverted 1.5.0 changes, breaks git-changelog

1.4.0 / 2012-02-08
==================

  * Added: allow files to be passed to `git-effort(1)`. Closes #71
  * Added: hide/show cursor for `git-effort(1)`
  * Changed: color `git-effort(1)` commits / active days independently

1.3.0 / 2012-02-08
==================

  * Added active days to `git-effort(1)` output

1.2.0 / 2012-02-08
==================

  * Added a greater color range to `git-effort(1)`
  * Added `--above <n>` to `git-effort(1)`

1.1.0 / 2012-02-07
==================

  * Added `git-effort(1)` (not yet complete)

1.0.0 / 2012-02-04
==================

  * Added `git-squash BRANCH [MSG]` to merge as a single commit

0.9.0 / 2012-01-15
==================

  * Added bash completion support [jweslley]

0.8.1 / 2011-12-30
==================

  * Removed `git-promote`

0.8.0 / 2011-12-08
==================

  * Added `pre-release` and `post-release `hooks to git-release
  * Added `git-promote`
  * Fixed: "git extra update" errors when pwd includes whitespace

0.7.0 / 2011-08-24
==================

  * Added percentages to `git-summary`

0.6.0 / 2011-06-24
==================

  * Added `git-back` command for soft undos [Kenneth Reitz]

0.5.1 / 2011-05-20
==================

  * revert `git-ignore` but retain argc == 0 as showing .gitignore contents
  * revert broken `git-release`

0.5.0 / 2011-05-19
==================

  * Added `git-alias` [jweslley]
  * Added `git-create-branch` [jweslley]
  * Fixed one-liner due to `git extras update` change
  * Fixed; `git-setup` creates a directory if the provided one does not exist [jweslley]
  * Fixed; `git-setup` support for directories with spaces [jweslley]
  * Fixed; `git-ignore` with no args no longer fails if `.gitignore` does not exist [jweslley]

0.4.1 / 2011-04-05
==================

  * Changed; `git-graft` now defaults to current branch instead of master [Kenneth Reitz]

0.4.0 / 2011-04-05
==================

  * Added `git-refactor`
  * Added `git-bug`
  * Added `git-feature`

0.3.0 / 2011-03-29
==================

  * Added `git-pull-request`

0.2.0 / 2011-03-27
==================

  * Added `git-extras`
  * Added __LICENSE__
  * Removed `git-extras-version`, use `git extras --version`
  * Removed `git-extras-update`, use `git extras update`
  * Changed; make sure to get the last chronological tag, instead of relying on the bogus `git tag` sorting. [guillermo]

0.1.0 / 2011-02-10
==================

  * Added `gh-pages` command

0.0.7 / 2010-10-31
==================

  * Added man pages.
  * Added `make clean`.
  * Added `make docs`.
  * Added -d -> -D. Closes #15.
  * Added git-delete-submodule for delete submodules easily.
  * Added; `git-ignore` now shows the contents of _./.git-ignore_ if no args are present.

0.0.6 / 2010-10-22
==================

  * Added command `git-touch`.
  * Use a shallow clone in `git-update-extras`.
  * Create History.md if git-changelog can't find a target. Fixes #14.

0.0.5 / 2010-10-08
==================

  * Added `git-delete-submodule`.
  * Added; `git-ignore` without pattern shows .gitignore contents.
  * Added; `git-setup` argument is now optional, defaulting to the CWD.
  * Added REPL alias "ls" as ls-files.

0.0.4 / 2010-09-10
==================

  * Added: `git-delete-branch`: Also delete the remote branch.
  * Added `git-summary` commitish support.
  * Added `git-graft` dest branch default of _master_.
  * Added `git-setup`.
  * Added `git-graft`.
  * Added `git-undo` for removing recent commits.
  * Fixed `git-delete-branch`: Don't fail if the local branch doesn't exist.
  * Fixed __PREFIX__ to respect env vars.
  * Fixed shift in `git-count`.

0.0.3 / 2010-08-27
==================

  * Added `git-extras-version`.
  * Added `git-update-extras`.
  * Fixed `git-contrib` issue when the username is in a commit msg.
  * Fixed: delete remote tag only if local was deleted.
  * Fixed: delete remote branch only if local was deleted.
  * Fixed printing of authors for git-summary's on Ubuntu.
  * Fixed: read doesn't have the -e option in SH on my machine at least.

0.0.2 / 2010-08-24
==================

  * Added `git-summary`.
  * Added `git-commits-since`.
  * Added `git-repl`.
  * Added `git-delete-tag`.
  * Added `git-delete-branch`.
  * Added `git-contrib`.
  * Fixed handling off spaces in contributor's name for `git-contrib`.
  * Fixed spaces in `git-release` names/numbers.
  * Fixed readme.

0.0.1 / 2010-08-05
==================

  * Docs for `git-ignore`. Closes #3.
  * Merge branch 'ignore'.
  * Added `git-ignore`.
  * Readme typo.
  * Fixed <tag> in docs.
  * Install docs.
  * Merge branch 'release'.
  * Added `git-release`.
  * Fixed readme.
  * Readme.
  * Passing args to git shortlog.
  * Added --all support to git-count.
  * Initial commit.
