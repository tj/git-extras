# Git Extras

Little git extras.

## Installation

Clone / Tarball:

```bash
$ make install
```

One-liner:

```bash
$ (cd /tmp && git clone --depth 1 https://github.com/visionmedia/git-extras.git && cd git-extras && sudo make install)
```

[MacPorts](http://www.macports.org/)

```bash
$ sudo port install git-extras
```

[Brew](http://github.com/mxcl/homebrew/) (buggy):

```bash
$ brew install git-extras
```

## Screencasts

  Just getting started? Check out these screencasts:

 - [introduction](https://vimeo.com/45506445) -- covering git-ignore, git-setup, git-changelog, git-release, git-effort and more

## Commands

 - `git extras`
 - `git squash`
 - `git summary`
 - `git effort`
 - `git changelog`
 - `git commits-since`
 - `git count`
 - `git create-branch`
 - `git delete-branch`
 - `git delete-submodule`
 - `git delete-tag`
 - `git fresh-branch`
 - `git graft`
 - `git alias`
 - `git ignore`
 - `git info`
 - `git release`
 - `git contrib`
 - `git repl`
 - `git undo`
 - `git gh-pages`
 - `git setup`
 - `git touch`
 - `git obliterate`
 - `git feature`
 - `git refactor`
 - `git bug`
 - `git promote`
 - `git local-commits`
 - `git archive-file`
 - `git squash-all`

## git-extras

The main `git-extras` command.

Output the current `--version`:

```bash
$ git extras
```

List available commands:

```bash
$ git extras --help
```

Update to the latest `git-extras`:

```bash
$ git extras update
```


## git-gh-pages

Sets up the `gh-pages` branch.  (See [GitHub Pages](http://pages.github.com/) documentation.)

## git-[feature|refactor|bug] [finish] &lt;name&gt;

Create the given feature, refactor, or bug branch `name`:

```bash
$ git feature dependencies
```

Afterwards, the same command will check it out:

```bash
$ git checkout master
$ git feature dependencies
```

When finished, we can `feature finish` to merge it into the current branch:

```bash
$ git checkout master
$ git feature finish dependencies
```

All of this works with `feature`, `bug`, or `refactor`.

## git-contrib &lt;author&gt;

Output `author`'s contributions to a project:

```bash
$ git contrib visionmedia
visionmedia (18):
  Export STATUS_CODES
  Replaced several Array.prototype.slice.call() calls with Array.prototype.unshift.call()
  Moved help msg to node-repl
  Added multiple arg support for sys.puts(), print(), etc.
  Fix stack output on socket error
  ...
```

## git-summary

Outputs a repo summary:

```bash
$ git summary

project  : git-extras
repo age : 10 months ago
commits  : 163
active   : 60 days
files    : 93
authors  :
   97	Tj Holowaychuk          59.5%
   37	Jonhnny Weslley         22.7%
	8	Kenneth Reitz           4.9%
	5	Aggelos Orfanakos       3.1%
	3	Jonathan "Duke" Leto    1.8%
	2	Gert Van Gool           1.2%
	2	Domenico Rotiroti       1.2%
	2	Devin Withers           1.2%
	2	TJ Holowaychuk          1.2%
	1	Nick Campbell           0.6%
	1	Alex McHale             0.6%
	1	Jason Young             0.6%
	1	Jens K. Mueller         0.6%
	1	Guillermo Rauch         0.6%
```

This command can also take a *commitish*, and will print a summary for commits in
the commmitish range:

```bash
$ git summary v42..
```

## git-effort [file ....]

  Displays "effort" statistics, currently just the number of commits per file, showing highlighting where the most activity is. The "active days" column is the total number of days which contributed modifications to this file.

```
node (master): git effort --above 15 {src,lib}/*
```

  ![git effort](http://f.cl.ly/items/0b0w0S2K1d100e2T1a0D/Screen%20Shot%202012-02-08%20at%206.43.34%20PM.png)

  If you wish to ignore files with commits `<=` a value you may use `--above`:

```
$ git effort --above 5
```

  By default `git ls-files` is used, however you may pass one or more files to `git-effort(1)`, for example:

```
$ git effort bin/* lib/*
```

## git-repl

GIT read-eval-print-loop:

```bash
$ git repl

git> ls-files
History.md
Makefile
Readme.md
bin/git-changelog
bin/git-count
bin/git-delete-branch
bin/git-delete-tag
bin/git-ignore
bin/git-release

git> quit
```

## git-commits-since [date]

List commits since `date` (defaults to "last week"):

```bash
$ git commits-since
... changes since last week
TJ Holowaychuk - Fixed readme
TJ Holowaychuk - Added git-repl
TJ Holowaychuk - Added git-delete-tag
TJ Holowaychuk - Added git-delete-branch

$ git commits-since yesterday
... changes since yesterday
TJ Holowaychuk - Fixed readme
```

## git-count

Output commit count:

```bash
$ git count

total 1844
```

Output detailed commit count:

```bash
$ git count --all

visionmedia (1285)
Tj Holowaychuk (430)
Aaron Heckmann (48)
csausdev (34)
ciaranj (26)
Guillermo Rauch (6)
Brian McKinney (2)
Nick Poulden (2)
Benny Wong (2)
Justin Lilly (1)
isaacs (1)
Adam Sanderson (1)
Viktor Kelemen (1)
Gregory Ritter (1)
Greg Ritter (1)
ewoudj (1)
James Herdman (1)
Matt Colyer (1)

total 1844
```

## git-release

Release commit with the given &lt;tag&gt;:

```bash
$ git release 0.1.0
```

Does the following:

  - Executes _.git/hooks/pre-release.sh_ (if present)
  - Commits changes (to changelog etc) with message "Release &lt;tag&gt;"
  - Tags with the given &lt;tag&gt;
  - Push the branch / tags
  - Executes _.git/hooks/post-release.sh_ (if present)

## git-alias

Define, search and show aliases.

Define a new alias:

```bash
$ git alias last "cat-file commit HEAD"
```

Search for aliases that match a pattern (one argument):

```bash
$ git alias ^la
last = cat-file commit HEAD
```

Show all aliases (no arguments):

```bash
$ git alias
s = status
amend = commit --amend
rank = shortlog -sn --no-merges
whatis = show -s --pretty='tformat:%h (%s, %ad)' --date=short
whois = !sh -c 'git log -i -1 --pretty="format:%an <%ae>
```

## git-ignore [pattern ...]

Too lazy to open up `.gitignore`?  Me too!

```bash
$ git ignore build "*.o" "*.log"
... added 'build'
... added '*.o'
... added '*.log'
```

Add patterns from an existing template:

```bash
$ git ignore -t rails
```

Without any patterns, `git-ignore` displays currently ignored patterns:

```bash
$ git ignore
build
*.o
*.log
```

# git-info

Show information about the repo:

```bash
$ git info

    ## Remote URLs:

    origin              git@github.com:sampleAuthor/git-extras.git (fetch)
    origin              git@github.com:sampleAuthor/git-extras.git (push)

    ## Remote Branches:

    origin/HEAD -> origin/master
    origin/myBranch

    ## Local Branches:

    myBranch
    * master

    ## Most Recent Commit:

    commit e3952df2c172c6f3eb533d8d0b1a6c77250769a7
    Author: Sample Author <sampleAuthor@gmail.com>

    Added git-info command.

    Type 'git log' for more commits, or 'git show <commit id>' for full commit details.

    ## Configuration (.git/config):

    color.diff=auto
    color.status=auto
    color.branch=auto
    user.name=Sample Author
    user.email=sampleAuthor@gmail.com
    core.repositoryformatversion=0
    core.filemode=true
    core.bare=false
    core.logallrefupdates=true
    core.ignorecase=true
    remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
    remote.origin.url=git@github.com:mub/git-extras.git
    branch.master.remote=origin
    branch.master.merge=refs/heads/master

```

If you wish to omit the config section, you may use `--no-config`:

```bash
$ git info --no-config
```

## git-create-branch &lt;name&gt;

Create local and remote branch `name`:

```bash
$ git create-branch development
```

## git-delete-branch &lt;name&gt;

Delete local and remote branch `name`:

```bash
$ git delete-branch integration
```

## git-delete-submodule &lt;name&gt;

Delete submodule `name`:

```bash
$ git delete-submodule lib/foo
```

## git-delete-tag &lt;name&gt;

Delete local and remote tag `name`:

```bash
$ git delete-tag 0.0.1
```

## git-fresh-branch &lt;name&gt;

Create empty local branch `name`:

```bash
$ git fresh-branch docs
```

## git-graft &lt;src-branch&gt; [dest-branch]

Merge commits from `src-branch` into `dest-branch`. (`dest-branch` defaults to `master`.)

```bash
$ git graft new_feature dev
$ git graft new_feature
```

## git-squash &lt;src-branch&gt; [msg]

Merge commits from `src-branch` into the current branch as a _single_ commit. When `[msg]` is given `git-commit(1)` will be invoked with that message. This is useful when small individual commits within a topic branch are irrelevant and you want to consider the topic as a single change.

```bash
$ git squash fixed-cursor-styling
$ git squash fixed-cursor-styling "Fixed cursor styling"
```

## git-squash-all &lt;master-branch&gt; [msg]

Squash all commits from current branch into _one_ commit and place it on top of `master-branch`. If `[msg]` is provided, `git-commit(1)` will be executed with `[msg]` and commit summaries of all squashed commits. Otherwise, a `git-commit(1)` prompt will be opened with commit summaries of all squashed commits. This is useful for squashing all commits on a topic branch and you want to prepare it for a pull request.

```bash
$ git squash-all master
$ git squash-all master "Added support for Feature A"
```

## git-changelog

Populate a file whose name matches `change|history -i_` with commits
since the previous tag.  (If there are no tags, populates commits since the project began.)

Opens the changelog in `$EDITOR` when set.

```bash
$ git changelog --tag 1.5.2 && cat History.md

1.5.2 / 2010-08-05
==================

* Docs for git-ignore. Closes #3
* Merge branch 'ignore'
* Added git-ignore
* Fixed <tag> in docs
* Install docs
* Merge branch 'release'
* Added git-release
* Passing args to git shortlog
* Added --all support to git-count
* Initial commit
```

List commits:

```bash
$ git changelog --list

* Docs for git-ignore. Closes #3
* Merge branch 'ignore'
* Added git-ignore
* Fixed <tag> in docs
* Install docs
* Merge branch 'release'
* Added git-release
* Passing args to git shortlog
* Added --all support to git-count
* Initial commit
```

## git-undo

Remove the latest commit:

```bash
git undo
```

Remove the latest 3 commits:

```bash
git undo 3
```

## git-setup [dir]

Set up a git repository (if one doesn't exist), add all files, and make an initial commit. `dir` defaults to the current working directory.

## git-touch [filename]

Call `touch` on the given file, and add it to the current index. One-step creation of new files.

## git-obliterate [filename]

Completely remove a file from the repository, including past commits and tags.

```bash
git obliterate secrets.json
```

## git-local-commits

List all commits on the local branch that have not yet been sent to origin. Any additional arguments will be passed directly to git log.

## git-archive-file

Creates an zip archive of the current git repository. The name of the archive will depend on the current HEAD of your git respository.
