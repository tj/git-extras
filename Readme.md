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

[Brew](http://brew.sh/):

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
 - `git delete-merged-branches`
 - `git fresh-branch`
 - `git graft`
 - `git alias`
 - `git ignore`
 - `git info`
 - `git fork`
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
 - `git local-commits`
 - `git archive-file`
 - `git missing`
 - `git lock`
 - `git unlock`
 - `git reset-file`
 - `git pr`

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

This command can also take an options `--line`, will print a summary by lines

```bash
$ git summary --line

project  : git-extras
 lines    : 8420
 authors  :
 2905 Tj Holowaychuk            34.5%
 1901 Jonhnny Weslley           22.6%
 1474 nickl-                    17.5%
  653 Leila Muhtasib            7.8%
  275 Tony                      3.3%
  267 Jesús Espino             3.2%
  199 Philipp Klose             2.4%
  180 Michael Komitee           2.1%
  178 Tom Vincent               2.1%
  119 TJ Holowaychuk            1.4%
  114 Damian Krzeminski         1.4%
   66 Kenneth Reitz             0.8%
   22 Not Committed Yet         0.3%
   17 David Baumgold            0.2%
   12 Brian J Brennan           0.1%
    6 Leandro López            0.1%
    6 Jan Krueger               0.1%
    6 Gunnlaugur Thor Briem     0.1%
    3 Hogan Long                0.0%
    3 Curtis McEnroe            0.0%
    3 Alex McHale               0.0%
    3 Aggelos Orfanakos         0.0%
    2 Phally                    0.0%
    2 NANRI                     0.0%
    2 Moritz Grauel             0.0%
    1 Jean Jordaan              0.0%
    1 Daniel Schildt            0.0%
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

## git-fork

Fork the given github &lt;repo&gt;. Like clone but forks first.

```Shell
$ git fork https://github.com/LearnBoost/expect.js
```

or just:

```Shell
$ git fork LearnBoost/expect.js
```

Does the following:
- forks the repo (prompts for github username and pass)
- clones the repo into the current directory
- adds the original repo as a remote so can track upstream changes
- all remotes refs use git over ssh


```Shell
$ cd expect.js && git remote -v
origin          git@github.com:<user>/expect.js (fetch)
origin          git@github.com:<user>/expect.js (push)
original        git@github.com:LearnBoost/expect.js (fetch)
original        git@github.com:LearnBoost/expect.js (push)
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

Without any patterns, `git-ignore` displays currently ignored patterns:

```bash
$ git ignore
build
*.o
*.log
```

## git-info

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

## git-delete-merged-branches

Deletes branches that are listed in `git branch --merged`.

```bash
$ git delete-merged-branches
Deleted feature/themes (was c029ab3).
Deleted feature/live_preview (was a81b002).
Deleted feature/dashboard (was 923befa).
...
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

## git-squash &lt;src-branch|commit ref&gt; [msg]

Merge commits from `src-branch` into the current branch as a _single_ commit.
Also works if a commit reference from the current branch is provided.
When `[msg]` is given `git-commit(1)` will be invoked with that message. This is
useful when small individual commits within a topic branch are irrelevant and
you want to consider the topic as a single change.

```bash
$ git squash fixed-cursor-styling
$ git squash fixed-cursor-styling "Fixed cursor styling"
$ git squash 95b7c52
$ git squash HEAD~3
$ git squash HEAD~3 "Work on a feature"
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

## git-missing [branch1] branch2

Print out which commits are on one branch or the other but not both.

```bash
$ git missing master
< d14b8f0 only on current checked out branch
> 97ef387 only on master
```

## git-rebase-patch patch-file

Given a patch that doesn't apply to the current HEAD, find the latest commit
it applies to and do a rebase. For example:

```bash
$ git rebase-patch test.patch
Trying to find a commit the patch applies to...
Patch applied to dbcf408dd26 as 7dc8b23ae1a
First, rewinding head to replay your work on top of it...
Applying: test.patch
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Auto-merging README.txt
```

## git-lock filename

Lock a local file `filename`:

```bash
$ git lock config/database.yml
```

## git-unlock filename

Unlock a local file `filename`

## git-reset-file filename [commit]

Reset one file to `HEAD` or certain commit

Reset one file to HEAD

```bash
$ git reset-file .htaccess
```

or reset one file to certain commit

```bash
$ git reset-file .htaccess dc82b19
```

## git-pr number

Checks out a pull request from GitHub

```bash
$ git pr 226
From https://github.com/visionmedia/git-extras
 * [new ref]       refs/pulls/226/head -> pr/226
Switched to branch 'pr/226'
```
