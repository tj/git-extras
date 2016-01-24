
4.1.0 / 2016-01-25
==================

  * Merge pull request #503 from spacewander/fix_502
  * Merge pull request #507 from rstacruz/git-pr-manual
  * Regerenate git-pr.html
  * Merge pull request #506 from rstacruz/git-pr-manual
  * Update git PR manual to mention URLs
  * handle GIT_EDITOR which contains space
  * use ps -f and awk to emulate pgrep
  * Merge pull request #500 from kumon/master
  * add upstream check & bugfix
  * add example of git-sync
  * upstream is used by default
  * Merge pull request #497 from JanSchulz/win_inst2
  * add git-sync
  * Merge pull request #499 from tj/add-bsd-installation
  * Add BSD installation instructions.
  * installation.md: Update information about column.exe
  * install.cmd: add a check for write rights to the install folder
  * install.cmd: properly escape the ! in the shebang line
  * Merge pull request #496 from JanSchulz/win_inst
  * Make the win installer more robust
  * Merge pull request #494 from apjanke/fix-git-repo-inclusion
  * Merge pull request #495 from JanSchulz/patch-1
  * Update Installation.md
  * Makefile: fix inverted list of commands that use is_git_repo
  * Add Gitter badge.
  * Bump version to 4.1.0-dev.

4.0.0 / 2015-12-28
==================

  * Add David Rogers to AUTHORS.
  * Merge pull request #481 from al-the-x/multi-file-touch
  * Better USAGE message
  * Touch multiple files supplied
  * Use `$@` instead of `$*` re #467
  * Update AUTHORS.
  * Merge pull request #490 from apjanke/etc-under-prefix
  * installation: put $SYSCONFDIR (/etc) under $PREFIX by default
  * Merge pull request #489 from apjanke/customize-etcdir
  * Makefile: allow customizing of SYSCONFDIR (/etc) location
  * Merge pull request #488 from apjanke/git-clear-shebang
  * Fix missing shebang in git-clear and missing +x on others
  * Update all man pages.
  * Merge pull request #479 from JanSchulz/global_gitignore
  * Merge pull request #448 from Lee-W/master
  * Add more info how to set global gitignore
  * Regenerate git-changelog man pages (.html and .1) for #471.
  * Merge pull request #471 from JanSchulz/merge-changelog
  * git-changelog: option to only use merges
  * Merge pull request #469 from JanSchulz/windows-install
  * Merge pull request #468 from spacewander/use-real-purplish
  * Use the default installation path in install.cmd
  * use real purplish
  * Merge pull request #466 from anarcat/master
  * Merge pull request #465 from spacewander/fix-color
  * add simple sed command
  * disable color if the output is not printed to tty
  * replace wildcard '?' to literal '?'
  * git-scp: use portable terminal escape sequences
  * Merge pull request #460 from apjanke/summary-defensive-locale
  * Merge pull request #458 from apjanke/makefile-refactor-libs
  * Merge pull request #459 from apjanke/effort-portable-colors
  * git-summary: protect against character encoding issues with LC_ALL=C
  * git-effort: use portable terminal escape sequences
  * Makefile: refactor is-git-repo inclusion logic
  * Merge pull request #454 from apjanke/makefile-escape-mktemp
  * Makefile: escape $ used inside eval as shell variable
  * Merge pull request #453 from jhnns/pr-url
  * Add possibility to also checkout pull requests based on GitHub urls
  * Merge pull request #452 from akimd/summary-locale
  * summary: beware of locale issues, and pass options to line-summary
  * Merge pull request #443 from Natim/patch-1
  * Merge pull request #444 from spacewander/install_without_alias
  * Merge pull request #446 from ssssam/fix-active-days
  * Merge pull request #447 from RichardLitt/patch-1
  * Update git-ignore-io mannual
  * Replace "export" option with "replace" in git-ignore-io
  * Remove exclamation mark
  * Remove warning when search without word.
  * Fix typo
  * Add warning when there is not argument after search, append and export
  * Fix ~/.gi_list not exist problem
  * Alphabetized list
  * effort, summary: Correctly estimate the number of active days
  * Merge pull request #445 from nicolaiskogheim/straighten-up-effort
  * effort: change order of arguments to function
  * effort: add usage message
  * effort: More robust argument parsing
  * add alias conflict prompt
  * Merge pull request #440 from spacewander/features/feature-alias
  * Add full name for list option
  * Fix usage error
  * Make sure git-authors doesn't return twice the same one.
  * update git-feature docs
  * add alias to git-feature
  * Modify print_last_modified_time to make it Linux compatible
  * Merge pull request #441 from spacewander/features/remove-checkout
  * Merge branch 'master' of https://github.com/Lee-W/git-extras
  * Fix doc error for git-ignore-io
  * Fix doc error for git-ignore-io
  * Remove redundant \n in tr
  * Not to update list each time git-ignore-io is executed
  * Refactor git-ignore-io and remove .gitignore
  * Update manual and description in Commands
  * remove duplicate checkout
  * Generate manual using ronn for git-ignore-io
  * Finish manual for git-ignore-io
  * Fix typo
  * Add description to Commands.md for git-ignore-io
  * Implement search function or git-ignore-io
  * Remove help from git-ignore-io
  * Init gitignore and ignore vim osx temp files
  * Merge gi_extension project into git extras as git-ignore-io
  * Merge pull request #436 from nwinkler/patch-1
  * Merge pull request #437 from nwinkler/patch-2
  * Fixed typo in install.sh
  * Updated documentation for git-ignore
  * Merge pull request #435 from nwinkler/patch-1
  * Added details to git-pr documentation
  * Merge pull request #433 from grindhold/git-clear
  * made more precise security-question.
  * more concise implementation of git-clear
  * Fix typo in variable name
  * added git-clear to Commands.md
  * added manpage for git-clear
  * implemented git-clear
  * Merge pull request #432 from stevemao/patch-1
  * fix link of `git feature|refactor|bug|chore`
  * Merge pull request #425 from nicolaiskogheim/makefile-fix
  * Mark default task as .PHONY
  * Merge pull request #430 from spacewander/git-extras
  * make it possible to update via `git extras`
  * Merge pull request #428 from spacewander/update-commands
  * Merge pull request #429 from nicolaiskogheim/merge-into-ff-only
  * merge-into: change --ff option to --ff-only. fix #421
  * update Commands.md
  * Merge pull request #411 from Natim/add-psykorebase-command
  * Improve man page presentation.
  * Add documentation.
  * Merge pull request #426 from spacewander/update-for-new-version
  * change 'search-term' to 'search-pattern'
  * abort git-alias when too many arguments given.
  * Merge pull request #423 from nicolaiskogheim/effort-paths
  * Merge pull request #424 from nicolaiskogheim/fork-docs
  * Merge pull request #422 from nicolaiskogheim/effort-bugfix
  * effort docs: add note about omitting unsorted results
  * effort docs: add example with directories
  * effort docs: filename -> path
  * effort docs: Adjust numbers in example
  * effort: rename 'file' to 'path' to be more accurate
  * Set default make task to be install
  * fork docs: change SSH to HTTPS in example
  * effort: fix active days always 1
  * Merge pull request #419 from nicolaiskogheim/git-guilt
  * Merge pull request #420 from nicolaiskogheim/git-summary
  * line-summary: 'function f{...' -> 'f() {...'
  * line-summary: add missing quotation marks
  * line-summary: tighten regex
  * summary docs: Remove --line example
  * summary docs: explain relation to git-line-summary
  * summary docs: use correct order of arguments
  * guilt: remove --help option
  * guilt: document call without arguments
  * guilt docs: Capitalize letters
  * guilt: Adds simplified example
  * Merge pull request #418 from nicolaiskogheim/fork-bugfix
  * fork: http-urls had colon instead of slash
  * Merge pull request #416 from nicolaiskogheim/fork-docs
  * Merge pull request #415 from nicolaiskogheim/contrib-docs
  * fork: original->upstream in docs
  * contrib: update docs
  * Merge pull request #414 from nicolaiskogheim/alias-docs
  * alias: docs
  * Add completion for git-psykorebase.
  * Create a bash version of git-psykorebase — Fixes #411
  * Merge pull request #409 from nicolaiskogheim/refactor-alias
  * alias: polish the docs
  * alias: bugfix
  * Merge pull request #408 from nicolaiskogheim/refactor-contrib
  * contrib: refactor, and conform to git
  * Merge pull request #405 from nicolaiskogheim/fix-filenames-with-spaces
  * Merge pull request #404 from nicolaiskogheim/freebsd-fix
  * Merge pull request #406 from nicolaiskogheim/portable-msysgit
  * git-alias: use sed insted of colrm
  * git-changelog: use cp instead of mv
  * git-extras: use git-help instead of man
  * add install script for PortableGit(msysgit)
  * Quote variables bc of filenames with spaces
  * Guard against 'seq 0'
  * Fix error on FreeBSD with process substitution
  * Pass --import-functions if required
  * Merge pull request #403 from andreicristianpetcu/master
  * effort: documentation for git effort --since #326
  * Merge pull request #401 from nicolaiskogheim/effort-above-error-on-NaN
  * effort: error on bad value to --above
  * Merge pull request #400 from nicolaiskogheim/fix-off-by-one
  * Merge pull request #391 from nicolaiskogheim/effort-limit-commits
  * Merge pull request #388 from chernjie/release
  * Merge pull request #398 from nicolaiskogheim/git-graft
  * Merge pull request #399 from nicolaiskogheim/git-archive-file
  * archive-file: cleaner way to get current branch
  * graft: Require destination branch. Fix #23
  * effort: don't count untouched files
  * Add info about new options to man pages
  * Add completion for more options to effort
  * Do proper argument parsing
  * effort: allow sending options to log. Fix #326
  * Merge pull request #396 from tocker/bug/changelog-catch-head
  * Catch "HEAD -> master" when creating the changelog
  * Merge pull request #394 from markeissler/changelog-signal-trap
  * Remove unused var.
  * Merge pull request #390 from nicolaiskogheim/effort-color-relative-to-above
  * Handle signals in git-changelog.
  * Meke coloring respect --above. Fix 74
  * Merge pull request #392 from nicolaiskogheim/WIP-effort-parallelize
  * Avoid spawning subshell
  * Remove unnecessary call to cat
  * perf: reduce calls to git log
  * Parallelize git-effort with xargs
  * Alter options to git log. Remove pipe
  * cd man && ./manning-up.sh && git diff --stat | grep ' 2 ' | awk '{print }' | xargs git checkout --
  * Merge pull request #386 from rstacruz/patch-2
  * Use https for git-fork
  * Merge pull request #385 from gisphm/master
  * added windows installation section in the Installation.md
  * format install.cmd
  * add install.cmd for installation on windows
  * Merge pull request #383 from Somasis/master
  * Makefile: Use a more portable mktemp invocation
  * Using shorter URL
  * Merge pull request #381 from spacewander/master
  * installation with curl and bash
  * Merge pull request #380 from spacewander/master
  * keep installation silent
  * Merge pull request #378 from spacewander/master
  * update installation in `git-extras update`
  * Merge pull request #377 from go2null/master
  * FIXes location of `--` for `grep`
  * FIXes 'mktemp' to work again on Linux
  * Merge pull request #373 from zlx/feature/document_line_summary
  * Document for git-line-summary
  * Merge pull request #372 from spacewander/patch-1
  * install the latest release version of git-extras
  * Merge pull request #370 from phigoro/master
  * git-effort: replace "wc | cut" with "wc | awk"
  * Merge pull request #369 from phigoro/master
  * align hashbang of git-guilt & git-merge-into
  * Merge pull request #368 from zlx/feature/strong_line_summary
  * Fix Fatal for git-line-summary
  * Merge pull request #365 from rkennedy/bug-ignore-regex2
  * Don't treat ignored patterns as regexps

3.0.0 / 2015-04-27
==================

  * Merge pull request #363 from chernjie/pre-release-docs
  * run pre-release ./manning-up.sh
  * Merge pull request #362 from chernjie/git-scp
  * Updated documentation for git-scp and slight feature change
  * Merge pull request #359 from chernjie/docs
  * Merge pull request #361 from markeissler/better-changelog-fixes
  * Fix git tag substring extraction for bash 3.2.
  * Merge pull request #360 from spacewander/master
  * Merge pull request #355 from markeissler/better-changelog-fixes
  * Merge branch 'better-changelog-fixes' of github.com:markeissler/git-extras into better-changelog-fixes
  * add support for git version below 2.2.0
  * Fix git-changelog for compatibility for bash<4. Fixes #337, #338
  * Merge pull request #1 from spacewander/better-changelog-fixes
  * correct the broken regex
  * Rearrange documentation links, see #358
  * Merge branch 'https://github.com/tj/git-extras.wiki/master' into docs, see #358
  * Merge pull request #357 from imsky/merge-repo
  * git-merge-repo
  * git merge-repo
  * add wiki for git-guilt
  * add support for git version below 2.2.0
  * Fix git-changelog for compatibility for bash<4. Fixes #337, #338
  * Merge pull request #349 from spacewander/git-guilt
  * fix indentation errors in git guilt
  * Merge pull request #345 from spacewander/git-guilt
  * Hope to fix #341
  * Merge pull request #344 from Somasis/master
  * use argument separator for usages of `grep` which can choke on weird input
  * helper/reset-env: helper to prevent GREP_OPTIONS from causing issues
  * Merge pull request #342 from spacewander/git-guilt
  * add docs for git guilt
  * add git-guilt
  * Merge pull request #340 from spacewander/git-effort
  * sort unless there is only one item
  * Merge pull request #333 from paulschreiber/merged-branches
  * add show-merged-branches and show-unmerged-branches
  * Merge pull request #334 from paulschreiber/dont-delete-svn-branch
  * when deleting merged branches, preserve "svn" branch for git-svn Fixed #328
  * Merge pull request #324 from chernjie/git-ignore
  * Merge pull request #331 from markeissler/better-changelog-fixes
  * Fix tag trapping when HEAD and tag point to same commit.
  * Fix gitflow commit history output.
  * Merge pull request #327 from markeissler/better-changelog-completion
  * Updated bash completions for better-changelog.
  * Update docs for revised git-changelog.
  * Merge pull request #325 from markeissler/better-changelog
  * Complete rewrite to support commit ranges for pretty and list output.
  * Support ~ in add_patterns for git-ignore
  * Support ~ in show git-ignore
  * add wiki for git-merge-into
  * Merge pull request #323 from spacewander/master
  * add docs for git-merge-into
  * add merge-into to merge two branches quickly
  * Merge pull request #322 from andrewsomething/master
  * git-fresh-branch: Check for changes and prompt for input before nuking. (Issue: #142)
  * Merge pull request #308 from spacewander/git-utility
  * Merge pull request #312 from RichardLitt/feature/concat-extra-feature-names
  * Merge pull request #320 from cironunes/gh-pages-fix
  * fix gh-pages to stash and don't delete files
  * Merge pull request #319 from pfctgeorge/allow-empty-when-setup
  * Allow empty initial commit when setup repo.
  * Merge pull request #317 from jykntr/master
  * git-summary correctly displays project name
  * git scp #300
  * Merge pull request #316 from code42day/changelog-config
  * changelog: add git-config support for format and log options
  * Merge pull request #315 from code42day/consistent-editor
  * use standard git editor in git-authors & git-changelog
  * Merge pull request #314 from snowyu/feature/custom-commit-message
  * + custom commit message options supports
  * Merge pull request #300 from chernjie/git-scp
  * Merge pull request #313 from wooorm/bug/fix-missing-closing-brace
  * Fix missing closing curly brance in `bash_completion.sh`
  * Added in option to concat extra feature names
  * link to git delta
  * git delta usage
  * Merge pull request #310 from imsky/git-delta
  * git-delta
  * Add git-authors
  * Merge pull request #309 from wooorm/feature/add-git-authors
  * Add git-authors
  * Updated Commands (markdown)
  * Updated Commands (markdown)
  * Updated Commands (markdown)
  * Updated Commands (markdown)
  * Updated Commands (markdown)
  * tj#300 Added bash completion
  * extra mktemp into git_extra_mktemp
  * Merge pull request #307 from ckhall/feature/add_git_chore_workflow
  * adding git-chore
  * Merge pull request #306 from spacewander/master
  * add enough X to fix #303. GNU mktemp requires at least three X in the last part of template.
  * Merge pull request #304 from wooorm/git-ignore-typo
  * Fix typo in in `git ignore` message
  * symlink git-rscp to git-scp
  * Avoid duplicating asterisk.
  * Updated License.
  * Fix link to git feature command
  * path argument can not be optional in `rscp`; add more docs
  * OMG a spelling mistake\!
  * Merge pull request #301 from raeffs/master
  * updated documentation because git-squash does no longer delete source-branch
  * Updated man page for git-scp
  * First RFC documentation
  * Merge pull request #299 from jonanp/git-delete-branch
  * When deleting a branch check if git has config.
  * Added a footer.
  * Merge pull request #298 from timfeirg/master
  * remove stuff from readme & form a list
  * add a few keywords
  * some remaining dashes
  * roughly finished
  * Updated Commands (markdown)
  * Updated Commands (markdown)
  * Updated Commands (markdown)
  * gonna use the clean sub command for each command explanation
  * adding links turn out to be a pain, go to sleep
  * add commands page link
  * add commands page, all copy & paste
  * add screencasts
  * copy from readme
  * Updated Install (markdown)
  * Created Install (markdown)
  * adapted a more generic, customizable and friendly script
  * Copy from git-goth https://github.com/chernjie/git-goth
  * Initial Home page
  * Merge pull request #296 from spacewander/add-completion
  * add more bash completion functions
  * Merge pull request #294 from GuillaumeSeren/feature/git-missing-add-ref-completion
  * Add ref completion to git-missing.
  * Merge pull request #293 from tj/revert-291-ignore-man-generated-files
  * Revert "Ignore *.html and *.1 auto-generated files in man/"
  * Merge pull request #292 from RasmusWL/make-handle-missing-man
  * make will not assume man pages already exists
  * Merge pull request #291 from jguenther/ignore-man-generated-files
  * Ignore man/git-*.html and man/git-*.1
  * Remove auto-generated files man/git-*.html and man/git-*.1
  * Merge pull request #226 from tsldh/master
  * added changelog to release as optional flag
  * Merge pull request #289 from mavant/feature/mktemp
  * Use mktemp for temporary file creation.
  * Merge pull request #288 from dead-horse/release-hook
  * make release hook more flexible
  * Merge pull request #287 from benjaminparnell/master
  * added --no-color to git-delete-merged-branches
  * More portable she-bangs.
  * Merge pull request #283 from e28eta/patch-1
  * Use process-specific tmp file and clean up on exit
  * Merge pull request #281 from emilkje/patch-1
  * Merge pull request #280 from valeriangalliat/feature/git-info-posix
  * Update Readme.md
  * git-info: POSIX compliance
  * Merge pull request #278 from tj/delete-submodule-fix
  * Fixes #277
  * Merge pull request #276 from spacewander/master
  * modify the behavior of git-ignore, now it will cd root to find .gitignore

2.2.0 / 2014-11-18
==================

* Update `mktemp` command to work on Mac OS X
* Merged pull request #273 from spacewander/master
* New command 'git root' to show the path to root of repo
* Merged pull request #271 from bohnman/git-rename-tag-fix
* Merged pull request #272 from spacewander/master
* Correct the format of git-rebase-patch.md.
* Replaced visionmedia/git-extras to tj/git-extras
* Merged pull request #270 from kevinawoo/hotfix/git-locked
* Added git-locked to check what files have been locked.
* Merged pull request #268 from GuillaumeSeren/bug/git-missing
* Fixed #267, git-missing did not catch branch name.

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
