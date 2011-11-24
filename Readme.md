# Git Extras

Little git extras.

## Installation

Clone / Tarball:

```bash
     $ make install
```

One-liner:

```bash
$ curl https://raw.github.com/visionmedia/git-extras/master/bin/git-extras | INSTALL=y sh
```

[Brew](github.com/mxcl/homebrew/) (buggy):

```bash
$ brew install git-extras
```

## Commands

 - `git extras`
 - `git summary`
 - `git changelog`
 - `git commits-since`
 - `git pull-request`
 - `git count`
 - `git create-branch`
 - `git apply-branch`
 - `git delete-branch`
 - `git delete-submodule`
 - `git delete-tag`
 - `git fresh-branch`
 - `git graft`
 - `git alias`
 - `git ignore`
 - `git release`
 - `git contrib`
 - `git repl`
 - `git undo`
 - `git gh-pages`
 - `git setup`
 - `git touch`
 - `git feature`
 - `git refactor`
 - `git bug`

## extras

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


## gh-pages

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


## git-pull-request &lt;number&gt;

Pull a GitHub pull-request `number`, and apply it
via `git am`. 

The git config `github.user` must be present, and the dirname must 
map to `https://github.com/<github.user>/<dirname>`.

```bash
git pull-request 604
```

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

project: git-extras
commits: 163
files  : 93
authors: 
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
  
  - Commits changes (to changelog etc) with message "Release &lt;tag&gt;"
  - Tags with the given &lt;tag&gt;
  - Push the branch / tags

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

## git-graft &lt;src-branch&gt; &lt;dest-branch&gt;

Merge commits from `src-branch` into `dest-branch`. (`dest-branch` defaults to `master`.)

```bash
$ git graft new_feature dev
$ git graft new_feature
```

## git-changelog

Populate a file whose name matches `change|history -i_` with commits
since the previous tag.  (If there are no tags, populates commits since the project began.) 

Opens the changelog in `$EDITOR` when set.

```bash
$ git changelog && cat History.md

n.n.n / 2010-08-05
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
