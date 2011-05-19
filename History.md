
0.0.8 / 2011-02-22 
==================

  * Added `git-create-branch`.
  * Refactoring to adopt uniq code style across the scripts.
  * git-release: Use annotated tags to release commits instead of lightweight tags.
  * git-setup: Create a directory if the provided one doesn't exist yet.
  * Fixed `git-ignore`: Don't fail if `.gitignore` file doesn't exist yet.

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
