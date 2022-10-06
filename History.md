6.5.0 / 2022-10-06
==================

  * git root: show '.' when using with -r in the root dir (#995)
  * git standup: work as expected when no configured (#996)
  * rephrase question depending on switch (#984)
  * Include revert conflicts in git abort (#992)
  * fix(git-effort):fork: retry: Resource temporarily unavailable #979 (#990)
  * git-sync --force will sync without interaction (#989)
  * fix(git-cp): keep the history of the files
  * git-bulk: previous refactor redirected $PWD to stderr by mistake
  * Fix lazy loading bash_completion from XDG_DATA_DIRS
  * Minor changes to man/git-standup.md
  * Replaced -g and -A with -F gpg|authordate
  * fix(bin/git-browse): fix commit hash
  * fix(bin/git-browse): fix bitbucket url
  * feat: open website at file & line number or range
  * #970 standup added -A flag for author date
  * update docs due to formatting error in git-utimes man page
  * update per shellcheck advice
  * update git-utimes.{1,html} to add --newer flag
  * Don't read git-extras.standup.implicit-week twice in git standup
  * quote mod_s and git_s integer vars
  * updates per request of spacewander
  * Update Commands.md
  * allow modification date updates for symbolic links
  * add --newer flag and ignore files in the working tree or index
  * Documented config git-extras.standup.implicit-week
  * Minor change to git standup -w documentation
  * Improved check if -w or -d was given to git standup
  * Renamed config git-extras.standup.implicit-week from git-extras.standup-implicit-week
  * Documented weekend behaviour of git standup -w
  * docs(instllation): replace `git.io`
  * Bump version to 6.5.0-dev
  * Added config git-extras.standup-implicit-week for git standup
  * Document git standup -w option

6.4.0 / 2022-04-22
==================

  * Merge pull request #964 from spacewander/bro
  * git-browse/browse-ci: use powershell.exe only when it is available
  * Merge pull request #944 from SimonTate/feature/sem-ver-prefix
  * Merge pull request #957 from jackwasey/quiet-or-stderr
  * git-release: Add prefix to semver
  * Merge pull request #959 from pbnj/feat/git-browse-ci
  * fix: fix stderr & stdout redirect
  * Merge pull request #962 from spacewander/gicc
  * git-ignore-io: make sure .gi_list is created before access
  * git-ignore: the directory of target file may not exist
  * fix(git-browse-ci): set pipefail
  * docs: fix docs
  * chore: update docs & completions
  * feat: implement git-browse-ci
  * quiet option, errors to stderr
  * Merge pull request #956 from tfendin/xargs-conflicting-args
  * Removed xargs from git-effort
  * Merge pull request #955 from katrinleinweber/summary-highlight-path-opt
  * Highlight path option more
  * Merge pull request #951 from tfendin/local-commits-all-remotes
  * Updated manual for git local-commits, must track a branch
  * Merge pull request #946 from tfendin/default_branch_logic
  * Made local-commits work with all remotes
  * Updated Readme.md after review
  * Merge pull request #949 from tfendin/git-ignore-ensure-newline
  * Added section about main branch to the Readme file
  * Merge pull request #947 from tfendin/git-unlock-synopsis-fix
  * Merge pull request #948 from tfendin/git-ignore-core-excludesFile
  * Clarified comment of when newline should be added
  * Updated git-extras manual after review.
  * git-ignore: ensure new patterns comes after a newline
  * Fixed bug in git-ignore which ignored config core.excludeFiles
  * Spell corr in git-unlock synopsis
  * Consider init.defaultBranch in git_extra_default_branch, changed default branch to main.
  * Merge pull request #885 from spacewander/add_pkg
  * doc: add packaging status
  * Merge pull request #940 from overengineer/feature/magic
  * Ignored error when git restore --staged fails when there is no commit
  * Merge branch 'master' into merge/magic
  * Added git-magic command
  * Bump version to 6.4.0-dev

6.3.0 / 2021-10-02
==================

  * Merge pull request #942 from spacewander/ffgd
  * git-delete-squashed-branches: fail fast if can't checkout
  * Merge pull request #939 from SimonTate/feature/force-clear
  * git-clear: add force option
  * Merge pull request #936 from tfendin/multiline_synopsis_fix
  * Merge pull request #937 from tfendin/dedup_email_case_insensitive
  * Merge pull request #934 from tfendin/no-merge-summary
  * Adopted git --dedup-by-email to the project coding style
  * summary --dedup-by-email now compares email adresses case insensitive.
  * Updated lines under Synopsis in the manuals so they are commonly formatted
  * Add incompability check for git summary --line --no-merges, split synopsis in its manual.
  * Merge pull request #935 from ax1036/git-un-lock
  * fix git (un)lock with spaced filenames
  * Updated completion for git summary
  * Updated documentation for git-summary --no-merges
  * Added option --no-merges to git summary
  * Merge pull request #932 from spacewander/git-su
  * git-summary: support filtering `--line` with path
  * Merge pull request #865 from pkitszel/pkitszel-git-abort
  * Add git-abort
  * Merge pull request #928 from duckunix/master
  * Update point to github docs for forks from API
  * update working
  * git-fork | Update man/md/html pages to talk about need of the github personal access token
  * Updated documentation (AUTHORS)
  * bin/git-fork | updating for feedback from PR #928
  * git-fork | update to match REST-API auth standards as of 2021-06
  * Merge pull request #926 from nicokosi/patch-1
  * Update install doc: Homebrew is not just for macOS
  * Merge pull request #924 from allejo/feature/delete-squashed-branches
  * delete-squashed-branches: Make side-effect clear in docs
  * delete-squashed-branches: Make branch checkout side effect clear
  * Add delete-squashed-branches command
  * Merge pull request #923 from CleanMachine1/patch-1
  * Picture is broken
  * Merge pull request #920 from matan129/patch-1
  * Ignore checked-out branches on different worktrees
  * Merge pull request #917 from heirecka/remove-git-line-summary-man-page
  * Bump version to 6.3.0-dev
  * doc: Remove man page for git-line-summary

6.2.0 / 2021-03-26
==================

  * Merge pull request #915 from spacewander/typo
  * Merge pull request #914 from spacewander/xch
  * Merge pull request #916 from spacewander/utimes
  * fix(git-utimes): make sure it work under OS X.
  * chore: fix typo
  * fix(git-ignore): use $XDG_CONFIG_HOME only when it is defined
  * Merge pull request #910 from 0xflotus/patch-1
  * fixed small error
  * Merge pull request #908 from nodeg/fix_installation
  * Fix grammer
  * Correct macOS spelling
  * Correct openSUSE spelling and update Version
  * Merge pull request #907 from bbenzikry/zinit-docs
  * Update zinit docs
  * Merge pull request #906 from prestontim/master
  * Remove bug|refactor|chore from documentation
  * Merge pull request #899 from spacewander/git-summary
  * git-summary: reject invalid option
  * ci: use checkout@v2
  * Merge pull request #897 from spacewander/ga
  * ci: move to GitHub Action
  * Merge pull request #882 from vt-alt/git-utimes
  * Merge pull request #896 from Aloxaf/fix_completion
  * fix: zsh completion of git-coauthor command
  * Merge pull request #895 from vanpipy/feature/optional-start-point-when-creeate-branch
  * doc: add the usage of the parameter `--from` for create-branch and feature
  * feat(feature): checkout from start point if exists
  * feat(create-branch): add optional --from to set the start point
  * Merge pull request #894 from alessandro308/merge-into-stashed
  * Merge-into: add stash before to checkout
  * Merge pull request #892 from equt/#891
  * Merge pull request #888 from equt/master
  * Merge pull request #889 from vanpipy/feature/delete-tag
  * [ fix #891 ] Cast branch output if HEAD not exists
  * [ feat ] Quote the default_path var
  * [ fix ] Quote env var
  * [ fix ] Quote the XDG_CACHE_HOME
  * [ feat ] Use default global ignore file
  * [ refactor ] Optimize var not existing check
  * [ fix ] Fix hardcode ignore list file path
  * [ feat ] Add XDG_CACHE_HOME check
  * Merge pull request #890 from zhujian0805/master
  * adding a format for git-contrib
  * git-utimes: Change files modification time to their last commit date
  * feat(delete-tag): get default remote from git config if exists
  * Merge pull request #884 from elonderin/fix-squash-help
  * squash help: re-ran make for extras and squash
  * squash help: ran make man/git-extras.{html,1}
  * squash help: ran make man/git-squash.{html,1}
  * squash help: corrects option name in PR
  * Merge remote-tracking branch 'u/master' into HEAD
  * Merge pull request #886 from TheTechOddBug/master
  * Fixing summary for --squash-msg option.
  * Updates git-squash.md: fixes help which was unclear and had remnants from copied template it appears
  * Bump version to 6.2.0-dev

6.1.0 / 2020-09-26
==================

  * Merge pull request #878 from spacewander/default_br
  * Merge pull request #880 from spacewander/fix_bsd_sed_regex
  * git-info: fix regex for bsd sed
  * Merge pull request #879 from spacewander/pass_arg
  * feat: pass origin argument down to git execution
  * change: migrate default branch
  * Merge pull request #872 from yuravg/pr_typo
  * doc: fix typo
  * Merge pull request #869 from spacewander/typo
  * git-back: removed
  * fix typo
  * Merge pull request #868 from spacewander/zsh_completion
  * sort completion in alphabetical order
  * remove incorrect completion
  * git-info: add zsh completion
  * Merge pull request #867 from yuravg/pr2source
  * doc: fix argument description
  * git-info: moved argument checking
  * git-info: fix namespace
  * doc: update derived git-info files
  * doc: add description for git-info
  * Add bash completion for git-info
  * git-info: colorized headers
  * git-info: extend configuration and commit information
  * git-info: remove notes about git-log, git-show
  * git-info: add info about submodules
  * git-info: fix indentation, remove comment
  * Merge pull request #864 from v-y-a-s/pr
  * Grammar correction
  * Remove $user
  * corrections
  * Update doc
  * fix config message name
  * Remove comments
  * PR test
  * Merge pull request #860 from soraxas/implement-fish-completions
  * implement fish completions file
  * Merge pull request #853 from bethesque/feat/git-browse-with-multiple-remotes
  * feat(browse): automatically select origin remote if one exists, fallback to first otherwise
  * Merge pull request #854 from bethesque/fix/git-browse-sed-on-mac
  * fix(browse): update sed pattern to work on mac
  * Bump version to 6.1.0-dev

6.0.0 / 2020-06-22
==================

  * doc: remove gitter
  * git-cp: remove trailing space
  * Merge pull request #849 from vr8hub/undodoc
  * Merge pull request #850 from vr8hub/newundo
  * Tighten numeric regex
  * Cleanup code
  * Modify to work when only a single commit, add parameter checks
  * Correct undo documentation to match code order of parameters
  * Merge pull request #847 from Amorymeltzer/patch-1
  * docs: Note flag for git extra --version
  * Merge pull request #846 from spacewander/note
  * doc: add a note about the package maintainer.
  * Merge pull request #844 from ihoro/installation-via-freebsd-pkg
  * Merge pull request #843 from spacewander/remove_git_feature
  * break change: remove docs and other stuff of git-feature's alias
  * Merge pull request #845 from alerque/remove-feature-aliases
  * Remove scripts that are mere alias wrappers for git-feature
  * docs: mention installation via FreeBSD pkg
  * Merge pull request #840 from spacewander/archive-invalid
  * Merge pull request #841 from sgleizes/bugfix/git-release-zsh-completion
  * Fix missing newline escapes in git-release zsh completion
  * git-archive-file: rename invalid chars in the output filename
  * Merge pull request #837 from jldugger/jldugger/pr-remote-default
  * Merge pull request #836 from jldugger/jldugger/feature-config
  * add a default for the remote to fetch a pr from
  * add a config setting for prefix
  * Merge pull request #829 from cpradog/master
  * update zsh completion for bug and refactor commands
  * updated zsh completion script
  * updated git-feature documentation
  * add squash option to git-feature
  * add squash option to git-feature
  * Merge pull request #826 from Natim/feature/825/add-git-cp
  * Simplify the code.
  * Signal if the destination already exists.
  * @spacewander review.
  * Merge pull request #827 from Natim/fix-man-page-for-git-psykorebase
  * Fix checks.
  * Update man page export for git-psykorebase with ronn-ng 0.9.0
  * @mschneiderwind review.
  * Add documentation.
  * Add first version of git-cp
  * Merge pull request #824 from mapitman/master
  * Fix documentation for git-browse
  * Merge pull request #823 from mapitman/master
  * Implement suggested changes from code review
  * Add git-browse command
  * Merge pull request #820 from spacewander/deprecate_git_back
  * change: deprecate git-back
  * Merge pull request #817 from bric3/adds-git-brv
  * Fixes #770: Adds git-brv
  * Merge pull request #816 from spacewander/git-sed-pathspec
  * git-sed: limit paths via pathspec
  * Bump version to 5.2.0-dev.

5.1.0 / 2019-12-21
==================

  * git-bulk: support cloning from a relative path
  * git-standuo: clarify the -a option
  * git-paste: check pastebinit before running it
  * git-coauthor: quote variable in the comparison
  * git-bulk: don't disappoint shellcheck
  * Merge pull request #812 from spacewander/git-sed-escape
  * git-sed: escape special characters for tr
  * Merge pull request #811 from eli-schwartz/portability
  * build: do not require the nonstandard and unpredictable 'which' utility
  * add repositories to workspace from source (#804)
  * Merge pull request #810 from roxchgt/read-not-need-repo
  * read COMMANDS_WIHOUT_REPO from not_need_git_repo file
  * Merge pull request #806 from spacewander/retire_make_with_msys
  * Merge pull request #808 from drasill/master
  * git-ignore: support non-default .git directory
  * retire the msysgit installation script
  * Merge pull request #802 from spacewander/fix-git-bulk-arg-count
  * git-bulk: line break is need in the SYNOPSIS doc section
  * fix bug in allowedargcount() to not execute command if wrong args count
  * Merge pull request #801 from spacewander/fix-delete-submodule
  * git-delete-submodule: don't remove the history of deleted submodule
  * Merge pull request #798 from wolviecb/signed_release
  * Add flags -s and -u for signed tags
  * Merge pull request #795 from spacewander/git-squash-commit-msg
  * Merge pull request #793 from spacewander/git-standup-group-by-branch
  * git-squash: miss completion script change
  * git-squash: clean up shellcheck warnings
  * git-squash: add --squash-messages to concat commit messages into one.
  * git-standup: add option to limit the number of commit
  * Merge pull request #789 from go2null/delete-empty-gitmodules
  * git-delete-submodule: comment the DUMMY prefix and ignore the output of grep -v.
  * git-standup: add separate newline between the output
  * add PR changes
  * add --force option to continue on error
  * improve readability
  * display git submodule status output before exiting
  * check git submodule status before declaring success
  * reorganize flow
  * delete empty .gitmodules
  * git-standup: add option '-B' to group the commits by branch
  * Merge pull request #792 from spacewander/git-summary-cleanup
  * git-summary: clean up other shellcheck warnings
  * git-summary: fix incorrect active days when commits range is given
  * git-summary: remove useless result function.
  * Merge pull request #790 from spacewander/git-summary-merge-email
  * git-summary: add --dedup-by-email to remove duplicate users
  * Merge pull request #788 from spacewander/doc_git_summary_line
  * git-summary: add missing example of --line option
  * Merge pull request #787 from rvbuelow/patch-1
  * Merge pull request #786 from mbologna/patch-1
  * Use GIT_DIR environment variable to to set .git directory
  * Docs: add OpenSUSE distribution information
  * Merge pull request #784 from spacewander/git-effort-col-len
  * git-effort: adjust column limit according to the paths
  * Merge pull request #708 from pabs3/git-paste
  * Regenerate docs
  * Add git-paste for sending patches to pastebin
  * Merge pull request #778 from pabs3/cleanups
  * Switch from using /tmp to using mktemp
  * Switch http URLs to https where possible
  * Fix typos
  * Fix an indefinite article in the documentation
  * Merge pull request #776 from spacewander/update_git_pr_doc
  * Merge pull request #777 from fengkx/zplugin-install-completion
  * docs(Installation): :memo: add src in zplugin ice modifier to source the completion file
  * git-pr: mention the limitation of -m option
  * Merge pull request #772 from jacobherrington/add-git-coauthor
  * Add conditional logic for linebreaks
  * Ensure arguments exist
  * Add git coauthor command
  * improve the quality of the integrity check.
  * Merge pull request #774 from jacobherrington/patch-2
  * Bump version to 5.1.0-dev.
  * Link to the contributing document

5.0.0 / 2019-08-16
==================

  * Merge pull request #769 from spacewander/no_line_summary
  * git-line-summary: should be the history
  * Merge pull request #768 from bric3/fix-more-character-encoding-issues
  * git-guilt: protect against encoding issues with LC_ALL=C
  * Merge pull request #767 from spacewander/rename_branch_order
  * git-rename-branch: change branch argument order
  * Merge pull request #765 from spacewander/column_dependency
  * Makefile: check dependencies before installation.
  * Installation.md: add dependencies section.
  * man/Readme.md: we don't need to update git-extras docs separately
  * Merge pull request #763 from spacewander/strict_check_integrity
  * check_integrity.sh: check more strickly.
  * Merge pull request #762 from spacewander/pr_merge
  * Merge pull request #761 from btmurrell/preference-for-create-branch
  * implements remote pref for create-branch
  * git-pr: add -m|--merge option to check out a merge commit
  * impl for checking remote pref
  * Merge pull request #754 from spacewander/prompt_passwd_before_2fa
  * git-fork: prompt for password before 2FA code.
  * check_integrity.sh: improve readability.
  * Merge pull request #753 from tiemonl/GH-752_update_reauthor_documentation
  * GH-752 updated documentation to show rename workaround
  * Merge pull request #751 from timfeirg/master
  * git-mv-remote: rename a remote regardless of any existing remotes
  * Installation instructions added for CRUX (#746)
  * Merge pull request #723 from bittner/feature/git-undo-soft-leave-changes-staged
  * Merge pull request #744 from spacewander/git-guilt-identation
  * git-guilt: avoid exceeding 80 columns.
  * Bump version to 4.8.0-dev.
  * Make `git undo -s` restore the staging area

4.7.0 / 2019-02-09
==================

  * git-pr: emphasized that the remote is required when pulling multiple PRs.
  * Merge pull request #743 from spacewander/allow_multiple_pr
  * git-pr: accepted multiple GitHub URL or ID with remote.
  * git-pr: added <[remote]:pr number> option.
  * Merge pull request #740 from spacewander/tweak_man_readme
  * doc: clarify the current working directory when building the docs.
  * Merge pull request #739 from sleagon/master
  * feat: Add -s(--soft) for git sync
  * Merge pull request #738 from StuartFeldt/add-symlinks-to-bulk-command
  * Adding support for symlink directories in bulk command
  * Merge pull request #737 from smancill/standup-ensure-colors
  * git-standup: ensure color usage
  * Merge pull request #736 from spacewander/git_force_clone_not_need_git_repo
  * misc: sort command list in alphabetical order
  * git-force-clone: should not need git repo
  * Merge pull request #734 from zentarul/master
  * Fix missing double quotes after %DEBUG%
  * install.cmd: tweak comments
  * Merge pull request #732 from sachin-gupta/sg-mods
  * Fix: Dev: `/E` option required with MORE for working on higher version of Windows 10 (**_Build 17134_**)
  * Merge pull request #729 from orestisf1993/patch-1
  * git-rename-branch: Don't fail if remote doesn't exist
  * Bump version to 4.7.0-dev.

4.6.0 / 2018-08-11
==================

  * Merge pull request #727 from spacewander/strip_caret
  * Makefile: change the installed manpage destination in FreeBSD (#725)
  * git-changelog: should remove ^0 suffix from the commit description.
  * Merge pull request #722 from spacewander/git_changelog_start_commit
  * git-changelog: add --start-commit option, like --start-tag but for commit
  * Merge pull request #721 from spacewander/git_changelog_list_newline
  * git-changelog: add missing newline to the plain output
  * Merge pull request #713 from pabs3/docs
  * Merge pull request #717 from flatcap/ignore-private
  * optimisation of mkdir
  * Ensure info dir exists
  * add: git-ignore -p (private to repo)
  * Merge pull request #716 from francoism90/patch-1
  * Added Arch Linux
  * Merge pull request #714 from spacewander/fix_detect_sed_i_support
  * Documentation rebuild: git-sed.* flags argument
  * Documentation rebuild: git-clear.html whitespace removal
  * Documentation rebuild: git-extras.* updates
  * Documentation rebuild: index.txt updates
  * Documentation rebuild: dates and headers
  * Remove one of the documentation building tools
  * Remove some trailing whitespace
  * Merge pull request #715 from tjaartvdwalt/master
  * Major/Minor release should reset minor/patch versions to 0
  * Fix greedy match of version number
  * git-sed: fix previous bsd sed workaround
  * Merge pull request #712 from spacewander/detect_sed_i_support
  * git-sed: detect sed -i support and work around for the BSD sed
  * Merge pull request #709 from pabs3/git-sed
  * git-sed: discover a separator when the / character is used in arguments
  * git-sed: pass the -r option to the xargs command
  * git-sed: Allow the flags to be passed as a third argument
  * Merge pull request #706 from MontakOleg/delete-branch
  * Fix deleting branches without upstream
  * Merge pull request #704 from ramlev/master
  * Remove double path delimiters in zsh description
  * Merge pull request #703 from psprint/master
  * Installation.md: Zsh-plugin method which doesn't require root access
  * Bump version to 4.6.0-dev.

4.5.0 / 2018-02-18
==================

  * git-release: show message if nothing given after --semver
  * doc: update git-extras index
  * Merge pull request #639 from spacewander/avoid_deleting_local_upstream
  * Merge pull request #693 from xakraz/fix-mktemp-pattern
  * git-release: add --no-empty-commit for empty commit hater
  * git-release: create an empty release commit if there is nothing to commit
  * git-summary: unescape tab for linux column utility
  * git-undo: add confirmation when `-h` is specified
  * Fixed mktemp template to support busybox (and Alpine linux)
  * Merge pull request #691 from koppor/patch-1
  * Remove trailing dot of German Windows
  * Merge pull request #690 from dominicbarnes/release-push-tags-first
  * feat(git-release): push tags first to help ci tools not miss them
  * Merge pull request #687 from spacewander/add_semver
  * git-release: handle extra non-numeric prefix in tag with --semver
  * Merge pull request #686 from spacewander/add_semver
  * git-release: add --semver option
  * Merge pull request #684 from spacewander/ignore_unknown_arg
  * git-release: function usage doesn't exist, ignore unknown argument instead
  * Merge pull request #681 from EdwardBetts/master
  * Fix so 'git rebase-patch' is described once.
  * Merge pull request #680 from lhernanz/master
  * Preserve the existing user_commands in the git completion system
  * Merge pull request #679 from spacewander/update_git_changelog_doc
  * Merge pull request #678 from timhwang21/devs/thwang/docs-update
  * Mention how to control changelog format in docs of git-changelog
  * Docs> Add -- in front of cmd for git log
  * Merge pull request #676 from gormac/master
  * Fix 'Invalid code page' error when resetting code page at end of script
  * Merge pull request #675 from quite/effort-cursor
  * git-effort: restore normal (visible) cursor properly
  * Merge pull request #674 from tj/pull-request-two-factor-auth
  * Add GitHub two-factor auth support to git-pull-request
  * Merge pull request #672 from mehandes/patch-1
  * Added Nix/NixOS method of installation
  * Merge pull request #671 from sambostock/improve-ignore-io
  * Use local variables & format strings
  * Fix omission when alphabetically printing ignores
  * Remove arbitrary column limit on ignore-io
  * Merge pull request #670 from zeeshanu/patch-1
  * Fix typo
  * Merge pull request #668 from isaacm/patch-1
  * Fix typos, remove trailing whitespace
  * install: submit brew patch to upstream
  * Bump version to 4.5.0-dev.
  * git-delete-branch: avoid deleting local upstream

4.4.0 / 2017-07-15
==================

  * install: display absolute path of zsh completion script
  * zsh: update completion of git bug|chore|feature|refactor|create-branch
  * git summary: use more common way to cd to top level directory
  * Merge pull request #664 from mapitman/master
  * Update man page for `create-branch`
  * Update man pages
  * Update docs for new behavior
  * Use "$@" instead of $@
  * Consolidate feature/bug/chore/refactor logic
  * Allow -r parameter to be in any order in command line
  * Add ability to specify a remote
  * Fix Issue #186
  * fix a wrong name in installation message
  * Merge pull request #662 from nschlimm/master
  * Added git-bulk to not_need_git_repo
  * fix various typos
  * Merge pull request #659 from bersace/mr
  * Add git-mr to checkout GitLab merge requests
  * Merge pull request #656 from dueringa/patch-1
  * Fix typo in git-extras
  * Merge pull request #654 from spacewander/replace-xargs-r
  * git-delete-merged-branches: replace xargs -r option
  * Bump version to 4.4.0-dev.

4.3.0 / 2017-05-05
==================

  * git-authors: remove trailing spaces
  * Merge pull request #649 from adriaanzon/patch-1
  * Merge pull request #651 from spacewander/pass-arguments-to-hooks
  * git-release: add pre-release failure message
  * git release: stop if pre-release hook fails
  * git-release: update docs
  * pass release arguments to pre/post-release scripts
  * git-fork: Let curl exit with error code on fail
  * Merge pull request #647 from SMillerDev/patch-1
  * Add BSD cat support
  * Merge pull request #646 from spacewander/upgrade-git-standup
  * git-standup: update zsh completion
  * git-standup: also update the docs
  * git-standup: add sanity check to -d option and overwrite -w option
  * git-standup: upgrade interface to catch up with kamranahmedse/git-standup
  * Merge pull request #642 from nschlimm/git-bulk-command
  * Typos again
  * Corrected repository location print out and docs ws-root-directory absolute path
  * Codereview Spacewander - whitespaces in workspace locations
  * Merge pull request #643 from jonyamo/git-pr_clean-git-config
  * Review from spacewander
  * Remove slashes from git-config command
  * Merge branch 'master' into git-bulk-command
  * Merge pull request #636 from spacewander/fix_rename_branch
  * Merge pull request #641 from tj/fix_pull_request_upstream
  * git-rename-branch: use detected upstream remote
  * git-pull-request: use detected upstream remote
  * Better behaviour in non workspace directories
  * Current workspace is default target of bulk operations
  * Even shorter
  * Code refactor
  * bug fix in single ws mode
  * code formatting
  * Fix in git-bulk head
  * New Command git-bulk initial commit
  * Merge pull request #635 from spacewander/fix_rename_branch
  * fix syntax & name variables better in rename-branch
  * Merge pull request #633 from nschlimm/columnsflex
  * taken out duplicate columns setting
  * Optimized file length calculation
  * Columns in git-effort adopt to file length
  * Merge pull request #630 from jjlin/rhel/centos
  * Add RHEL/CentOS installation
  * Merge pull request #629 from dankilman/fix-git-effort
  * Fix git-effort for paths starting with dash
  * Merge pull request #626 from jldugger/jldugger/email-fallback
  * fall back to EMAIL when user.email is not configured
  * Merge pull request #619 from spacewander/git-summary-separator
  * Merge pull request #624 from spacewander/has_git_commit
  * Check commit existed before running some commands
  * Merge pull request #615 from techjacker/master
  * Adds SSH prompt to git fork
  * use U+266A instead of comma as separator
  * Merge pull request #610 from nicolaiskogheim/fix-spelling
  * spelling: {a,an} archive. Fix #609
  * Merge pull request #606 from spacewander/fix-git-extras-update
  * fix git-extras update and tweak Windows detection
  * Merge pull request #585 from tardypad/stamp
  * Merge pull request #578 from tardypad/count_fix_extra_arguments
  * stamp: show real looking results in Commands.md doc
  * stamp: add warning in documentation about corner case
  * stamp: add zsh autocompletion
  * stamp: remove non used multiple lines error messages
  * stamp: the message consists in all terms after the identifier
  * stamp: identifier is case insensitive for the replacement
  * stamp: add to Commands doc
  * stamp: add manual
  * stamp: add bash autocompletion
  * stamp: add replace option
  * stamp: display new full message as result
  * stamp: add extra optional message parameter
  * stamp: add basic script
  * Merge pull request #601 from richardfearn/git-sed-spaces-in-filenames
  * Merge pull request #603 from richardfearn/git-clear-consistent-defaults
  * Merge pull request #602 from richardfearn/git-delete-merged-branches-fix
  * git-clear-soft: change default yes/no option to "no" (as with git-clear)
  * git-delete-merged-branches: use "xargs -r" to prevent error when there are no branches to delete
  * git-sed: use "git grep -z" and "xargs -0" to cope with spaces in filenames
  * Merge pull request #600 from richardfearn/git-fresh-branch-fix
  * Merge pull request #599 from richardfearn/improve-yes-no-prompts
  * git-fresh-branch: fix handling of 'yes' response when there are changes
  * git-{clear,clear-soft,sync}: improve yes/no prompts
  * Merge pull request #598 from richardfearn/fix-git-sed-typo
  * Merge pull request #597 from richardfearn/commands-md-improvements
  * git-sed: fix 'unkonwn' typo
  * Commands.md: add link to 'git summary' in 'git line-summary' documentation
  * Commands.md: add links to "git bug", etc. to index
  * Commands.md: add 'git rscp' link to 'git scp' documentation
  * Commands.md: put commands in alphabetical order
  * Merge pull request #596 from richardfearn/archive-file-typo-fix
  * Fix typo in archive-file documentation
  * Merge pull request #595 from aaguilera/master
  * fix: git-squash docs. Replaced 'actual' with 'current'
  * Merge pull request #592 from spacewander/fix_integrity
  * Add travis ci
  * Merge pull request #594 from spacewander/fix_release
  * show all commit messages if no tag found
  * strip out branches like trap-effort-signals
  * Add git-reauthor to completion script
  * Relax #! format check
  * Merge pull request #591 from nottrobin/force-clone
  * Be explicit about only resetting git directories
  * Fix branch option parsing
  * Fix usage
  * Use LC_ALL=C for locale consistency
  * Remove unnecessary check
  * git-force-clone
  * Merge pull request #590 from bbbco/changelog-tmp-file-fix
  * Need to remove the temp file regardless
  * Merge pull request #589 from yelinaung/yla/typo-fixes
  * Spelling fixes for the roon file and html files
  * Spelling fixes
  * Merge pull request #588 from spacewander/no-email
  * Add --no-email to git-author
  * Bump version to 4.3.0-dev.
  * count: remove usage of extra arguments for detailed display

4.2.0 / 2016-10-08
==================

  * remove contributors' email addresses to avoid #544
  * promote two maintainers
  * Merge pull request #584 from grindhold/fix-583
  * fixes #583
  * update docs to clarify rename-branch (#581)
  * Make git-pr set up branch for pulling (#570)
  * add link to ronn git repo (#575)
  * add rename-branch command (#576)
  * Merge pull request #569 from nicolaiskogheim/docs/repl-cleanup
  * git-repl: improve and clean up docs
  * Merge pull request #568 from wcmonty/master
  * Add 'exit' to git-repl command documentation
  * Add built in 'exit' command to git-repl
  * Merge pull request #567 from nicolaiskogheim/git-pull-request-fix#546
  * pull-request: should read local config if present
  * Merge pull request #566 from nfischer/fix-man-page-typo
  * git-release: fix typo in documentation
  * Merge pull request #565 from nicolaiskogheim/git-missing-argument-parsing
  * git-missing: do proper argument parsing. Fix #562
  * Merge pull request #563 from lukechilds/improve-fork
  * Update git-fork man page
  * Merge pull request #564 from sorbits/patch-3
  * Remove a non-contributor from AUTHORS
  * Update docs to reflect new git-fork behaviour
  * Set fork remotes using ssh if available
  * Add git reauthor (#548)
  * Merge pull request #555 from spacewander/contributing
  * modify CONTRIBUTING.md again
  * Merge pull request #557 from spacewander/check_integrity
  * Merge pull request #561 from lukechilds/improve-json-encoding
  * Clean up git-pull-request
  * Improve JSON encoding
  * Merge pull request #560 from lukechilds/patch-2
  * Merge pull request #559 from lukechilds/patch-1
  * Fix incorrect comment in git-fork
  * Fix typo in Installation.md
  * Merge pull request #558 from spacewander/fix_legacy_problem
  * add doc for git-pull-request and others
  * modify CONTRIBUTING.md
  * update check_integrity with nicolaiskogheim's patch
  * add git-release-patch to Commands.md
  * add git-back to Commands.md
  * regenerate git-obliterate doc
  * follow common shebang
  * add git-show-(un)merged-branches to Commands.md
  * Add check integrity script
  * Add contributing guideline
  * Merge pull request #554 from npcode/fork-origin
  * fork: Fetch `origin` after forking
  * fork: Quote refs by backtick rather than single quote
  * fork: Add git-fork.html removed by accident
  * Merge pull request #553 from npcode/fork-origin
  * fork: Describe the behavior if current dir is repo
  * fork: Rename 'origin' to 'upstream' after forking
  * Merge pull request #552 from npcode/fork-origin
  * fork: Fork 'origin' remote repo if repo is not given
  * Merge pull request #551 from spacewander/zsh-completion
  * submit zsh completion script to upstream
  * update the title of git-clear-soft
  * Merge pull request #550 from phuu/patch-1
  * Add note about overwriting git aliases
  * Merge pull request #547 from svanburen/patch-1
  * Fix typo
  * Merge pull request #545 from spacewander/via_ssh
  * fix git-fork by removing '.git'
  * Merge pull request #543 from spacewander/via_ssh
  * fix the support for forking via ssh
  * Merge pull request #412 from spacewander/git-obliterate
  * Merge pull request #536 from spacewander/delete_submodule
  * Merge pull request #537 from vigilancer/master
  * update documentation. fix "git ignore-io" flags
  * Update the way to delete submodule
  * Merge pull request #533 from Addvilz/add-git-clear-soft-modify-git-clear
  * Edit description of git clear-soft to indicate hard reset
  * Add git-clear-soft command 	Modify git-clear to indicate default behavior of removing git ignored files
  * Merge pull request #513 from lgastako/master
  * Merge pull request #525 from spacewander/git-standup
  * Merge pull request #526 from carrodher/patch-1
  * Add Ubuntu installation
  * add docs for git standup
  * add git-standup
  * Merge pull request #519 from ifdattic/patch-1
  * Fix typo: typess => types
  * Merge pull request #515 from ammarnajjar/fedora-install
  * Add Fedora package-manager installation instruction
  * Add -m flag to git-setup to set the initial commit message.
  * Merge pull request #512 from Lee-W/master
  * Merge pull request #1 from tj/master
  * Fix ignore-io searching bug
  * Merge pull request #508 from pra85/patch-1
  * Mention initial copyright year and add contributors to copyright
  * Merge pull request #509 from supercrabtree/master
  * Fix typo in git-clear documentation
  * Bump version to 4.2.0-dev.
  * add missing git-obliterate documentation
  * now we can specify a commit range for git-obliterate

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
 * Fix feature|refactor|bug testing argument for string length
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
