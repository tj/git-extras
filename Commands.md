
 - [`git alias`](#git-alias)
 - [`git archive-file`](#git-archive-file)
 - [`git authors`](#git-authors)
 - [`git changelog`](#git-changelog)
 - [`git clear`](#git-clear)
 - [`git commits-since`](#git-commits-since)
 - [`git contrib`](#git-contrib)
 - [`git count`](#git-count)
 - [`git create-branch`](#git-create-branch)
 - [`git delete-branch`](#git-delete-branch)
 - [`git delete-merged-branches`](#git-delete-merged-branches)
 - [`git delete-submodule`](#git-delete-submodule)
 - [`git delete-tag`](#git-delete-tag)
 - [`git delta`](#git-delta)
 - [`git effort`](#git-effort)
 - [`git extras`](#git-extras)
 - [`git feature|refactor|bug|chore`](#git-featurerefactorbugchore)
 - [`git fork`](#git-fork)
 - [`git fresh-branch`](#git-fresh-branch)
 - [`git gh-pages`](#git-gh-pages)
 - [`git graft`](#git-graft)
 - [`git guilt`](#git-guilt)
 - [`git ignore`](#git-ignore)
 - [`git ignore-io`](#git-ignore-io)
 - [`git info`](#git-info)
 - [`git line-summary`](#git-line-summary)
 - [`git local-commits`](#git-local-commits)
 - [`git lock`](#git-lock)
 - [`git locked`](#git-locked)
 - [`git merge-into`](#git-merge-into)
 - [`git merge-repo`](#git-merge-repo)
 - [`git missing`](#git-missing)
 - [`git obliterate`](#git-obliterate)
 - [`git pr`](#git-pr)
 - [`git psykorebase`](#git-psykorebase)
 - [`git release`](#git-release)
 - [`git repl`](#git-repl)
 - [`git reset-file`](#git-reset-file)
 - [`git root`](#git-root)
 - [`git scp`](#git-scp)
 - [`git sed`](#git-sed)
 - [`git setup`](#git-setup)
 - [`git standup`](#git-standup)
 - [`git squash`](#git-squash)
 - [`git summary`](#git-summary)
 - [`git sync`](#git-sync)
 - [`git touch`](#git-touch)
 - [`git undo`](#git-undo)
 - [`git unlock`](#git-unlock)

## git extras

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
## git gh-pages

Sets up the `gh-pages` branch.  (See [GitHub Pages](http://pages.github.com/) documentation.)

## git feature|refactor|bug|chore

Create/Merge the given feature, refactor, bug or chore branch `name`:

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

All of this works with `feature`, `bug`, `chore` or `refactor`.

## git contrib

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

## git summary

Outputs a repo summary:

```bash
$ git summary

project  : git-extras
repo age : 10 months ago
commits  : 163
active   : 60 days
files    : 93
authors  :
   97   Tj Holowaychuk          59.5%
   37   Jonhnny Weslley         22.7%
    8   Kenneth Reitz           4.9%
    5   Aggelos Orfanakos       3.1%
    3   Jonathan "Duke" Leto    1.8%
    2   Gert Van Gool           1.2%
    2   Domenico Rotiroti       1.2%
    2   Devin Withers           1.2%
    2   TJ Holowaychuk          1.2%
    1   Nick Campbell           0.6%
    1   Alex McHale             0.6%
    1   Jason Young             0.6%
    1   Jens K. Mueller         0.6%
    1   Guillermo Rauch         0.6%
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

## git line-summary

  WARNING: git line-summary has been replaced by git summary --line and will be removed in a future release. 

## git effort

  Displays "effort" statistics, currently just the number of commits per file, showing highlighting where the most activity is. The "active days" column is the total number of days which contributed modifications to this file.

```
node (master): git effort --above 15 {src,lib}/*
```

  ![git effort](http://f.cl.ly/items/0b0w0S2K1d100e2T1a0D/Screen%20Shot%202012-02-08%20at%206.43.34%20PM.png)

  If you wish to ignore files with commits `<=` a value you may use `--above`:

```
$ git effort --above 5
```

  If you wish to see only the commits in the last month you may use `--since` (it supports the same syntax like `git log --since`):
  
```
 $ git effort --since='last month'
```

  By default `git ls-files` is used, however you may pass one or more files to `git-effort(1)`, for example:

```
$ git effort bin/* lib/*
```

## git repl

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

## git commits-since

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

## git count

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

## git fork

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
upstream        git@github.com:LearnBoost/expect.js (fetch)
upstream        git@github.com:LearnBoost/expect.js (push)
```


## git release

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

## git alias

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

## git ignore

Too lazy to open up `.gitignore`?  Me too!

```bash
$ git ignore build "*.o" "*.log"
... added 'build'
... added '*.o'
... added '*.log'
```

Without any patterns, `git-ignore` displays currently ignored patterns in both your global and your local `.gitignore` files:

```bash
$ git ignore
Global gitignore: /Users/foo/.gitignore_global
*~
.metadata
---------------------------------
Local gitignore: .gitignore
build
*.o
*.log
```

To show just the global or just the local file's contents, you can use the following optional parameters:

* `-g` or `--global` to show just the global file
* `-l` or `--local` to show just the local file
 
```bash
$ git ignore -g
Global gitignore: /Users/foo/.gitignore_global
*~
.metadata
```

```bash
$ git ignore -l
Local gitignore: .gitignore
build
*.o
*.log
```

## git ignore-io

Generate sample gitignore file from [gitignore.io](https://www.gitignore.io)  

Without option, `git ignore-io <type>` shows the sample gitignore of specified types on screen.  

```bash
$ git ignore-io vim

    # Created by https://www.gitignore.io/api/vim

    ### Vim ###
    [._]*.s[a-w][a-z]
    [._]s[a-w][a-z]
    *.un~
    Session.vim
    .netrwhist
    *~
```
  
To export it to `.gitignore` file you can use the following options:  

* `-a` or `--append` to append the result to `.gitignore`
* `-e` or `--export` to replace `.gitignore` with the result

```bash
$ git ignore-io vim python
```

For efficiency, `git ignore-io` store all available types at `~/.gi_list`.  
To list all the available types:

* `-l` or `-L` : These two options will show the list in different format. Just try it.
  
You can also search type from the list by:

* `-s <word>` or `--search <word>`

```bash
$ git ignore-io -s ja

    django
    jabref
    java
    ninja
```


## git info

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

## git create-branch

Create local and remote branch `name`:

```bash
$ git create-branch development
```

## git delete-branch

Delete local and remote branch `name`:

```bash
$ git delete-branch integration
```

## git delete-submodule

Delete submodule `name`:

```bash
$ git delete-submodule lib/foo
```

## git delete-tag

Delete local and remote tag `name`:

```bash
$ git delete-tag 0.0.1
```

## git delete-merged-branches

Deletes branches that are listed in `git branch --merged`.

```bash
$ git delete-merged-branches
Deleted feature/themes (was c029ab3).
Deleted feature/live_preview (was a81b002).
Deleted feature/dashboard (was 923befa).
...
```

## git fresh-branch

Create empty local branch `name`:

```bash
$ git fresh-branch docs
```

## git guilt

Calculate the change in blame between two revisions

```bash
# Find blame delta over the last three weeks
$ git guilt `git log --until="3 weeks ago" --format="%H" -n 1` HEAD
Paul Schreiber                +++++++++++++++++++++++++++++++++++++++++++++(349)
spacewander                   +++++++++++++++++++++++++++++++++++++++++++++(113)
Mark Eissler                  ++++++++++++++++++++++++++
CJ                            +++++
nickl-                        -
Jesse Sipprell                -
Evan Grim                     -
Ben Parnell                   -
hemanth.hm                    --
```

## git merge-into

Merge `src` branch into `dest`, and keep yourself on current branch. If `src` branch not given, it will merge current one to `dest`:

```bash
$ git merge-into [src] dest
```

## git graft

Merge commits from `src-branch` into `dest-branch`.

```bash
$ git graft new_feature master
```

## git squash

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

## git authors

Populates the file matching `authors|contributors -i` with the authors of commits, according to the number of commits per author.

Opens the file in `$EDITOR` when set.

See the ["MAPPING AUTHORS" section](http://git-scm.com/docs/git-shortlog#_mapping_authors) of **git-shortlog**(1) to coalesce together commits by the same person.

Updating AUTHORS file:

```bash
$ git authors && cat AUTHORS

TJ Holowaychuk <tj@vision-media.ca>
Tj Holowaychuk <tj@vision-media.ca>
hemanth.hm <hemanth.hm@gmail.com>
Jonhnny Weslley <jw@jonhnnyweslley.net>
nickl- <github@jigsoft.co.za>
Leila Muhtasib <muhtasib@gmail.com>
```

Listing authors:

```bash
$ git authors --list

TJ Holowaychuk <tj@vision-media.ca>
Tj Holowaychuk <tj@vision-media.ca>
hemanth.hm <hemanth.hm@gmail.com>
Jonhnny Weslley <jw@jonhnnyweslley.net>
nickl- <github@jigsoft.co.za>
Leila Muhtasib <muhtasib@gmail.com>
```

## git changelog

Generates a changelog from git(1) tags (annotated or lightweight) and commit messages. Existing changelog files with filenames that begin with _Change_ or _History_ will be identified automatically with a case insensitive match pattern and existing content will be appended to the new output generated--this behavior can be disabled by specifying the prune option (-p|--prune-old). The generated file will be opened in **$EDITOR** when set.

If no tags exist, then all commits are output; if tags exist, then only the most-recent commits are output up to the last identified tag. This behavior can be changed by specifing one or both of the range options (-f|--final-tag and -s|--start-tag).

The following options are available:

```bash
  -a, --all                 Retrieve all commits (ignores --start-tag, --final-tag)
  -l, --list                Display commits as a list, with no titles
  -t, --tag                 Tag label to use for most-recent (untagged) commits
  -f, --final-tag           Newest tag to retrieve commits from in a range
  -s, --start-tag           Oldest tag to retrieve commits from in a range
  -n, --no-merges           Suppress commits from merged branches
  -p, --prune-old           Replace existing Changelog entirely with new content
  -x, --stdout              Write output to stdout instead of to a Changelog file
  -h, --help, ?             Usage help
```

Type `git changelog --help` for basic usage or `man git-changelog` for more information.

**NOTE:** By default, `git changelog` will concatenate the content of any detected changelog to its output. Use the `-p` option to prevent this behavior.

### Examples

Generate a new changelog consisting of all commits since the last tag, use the tag name _1.5.2_ for the title of this recent commits section (the date will be generated automatically as today's date):

```bash
$ git changelog --tag 1.5.2 && cat History.md

1.5.2 / 2015-03-15
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
```

List all commits since the last tag:

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
```

List all commits since the beginning:

```bash
$ git changelog --list --all

* Docs for git-ignore. Closes #3
* Merge branch 'ignore'
* Added git-ignore
* Fixed <tag> in docs
* Install docs
* Merge branch 'release'
* Added git-release
* Passing args to git shortlog
* Added --all support to git-count
...
<many many commits>
...
* Install docs.
* Merge branch 'release'.
* Added 'git-release'.
* Fixed readme.
* Passing args to git shortlog.
* Initial commit
```

## git undo

Remove the latest commit:

```bash
git undo
```

Remove the latest 3 commits:

```bash
git undo 3
```

## git sed

Run grep as directed but replace the given files with the pattern.

## git setup

Set up a git repository (if one doesn't exist), add all files, and make an initial commit. `dir` defaults to the current working directory.

## git scp

A convenient way to copy files from the current working tree to the working directory of a remote repository. If a `<commits>...` is provided, only files that has changed within the commit range will be copied.

Internally this script uses `rsync` and not `scp` as the name suggests. 

`git-rscp` - The reverse of `git-scp`. Copies specific files from the working directory of a remote repository to the current working directory.

### Examples

 Copy unstaged files to remote. Useful when you want to make quick test without making any commits

    $ git scp staging

 Copy staged and unstaged files to remote

    $ git scp staging HEAD

 Copy files that has been changed in the last commit, plus any staged or unstaged files to remote

    $ git scp staging HEAD~1

 Copy files that has been changed between now and a tag

    $ git scp staging v1.2.3

 Copy specific files

    $ git scp staging index.html .gitignore .htaccess

 Copy specific directory

    $ git scp staging js/vendor/

## git standup

Recall what you did or find what someone else did in a given range of time.
For instance, recall John's commits since last week:
```
git standup John "last week"
```

## git touch

Call `touch` on the given file, and add it to the current index. One-step creation of new files.

## git obliterate

Completely remove a file from the repository, including past commits and tags.

```bash
git obliterate secrets.json
```

## git local-commits

List all commits on the local branch that have not yet been sent to origin. Any additional arguments will be passed directly to git log.

## git archive-file

Creates an zip archive of the current git repository. The name of the archive will depend on the current HEAD of your git respository.

## git missing

Print out which commits are on one branch or the other but not both.

```bash
$ git missing master
< d14b8f0 only on current checked out branch
> 97ef387 only on master
```

## git rebase-patch

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

## git lock

Lock a local file `filename`:

```bash
$ git lock config/database.yml
```

## git locked

List local locked files:

```bash
$ git locked
config/database.yml
```

## git unlock

Unlock a local file `filename`

```bash
$ git unlock config/database.yml
```

## git reset-file

Reset one file to `HEAD` or certain commit

Reset one file to HEAD

```bash
$ git reset-file .htaccess
```

or reset one file to certain commit

```bash
$ git reset-file .htaccess dc82b19
```

## git pr

Checks out a pull request from GitHub

```bash
$ git pr 226
From https://github.com/tj/git-extras
 * [new ref]       refs/pulls/226/head -> pr/226
Switched to branch 'pr/226'
```

To use a remote other than `origin`, e.g. `upstream` if you're working in a fork, specify it as the second parameter:

```bash
$ git pr 226 upstream
From https://github.com/tj/git-extras
 * [new ref]       refs/pulls/226/head -> pr/226
Switched to branch 'pr/226'
```

You can also checkout a pull request based on a GitHub url

```bash
$ git pr https://github.com/tj/git-extras/pull/453
From https://github.com/tj/git-extras
 * [new ref]         refs/pull/453/head -> pr/453
Switched to branch 'pr/453'
```

To remove all local pull request branches, provide the magic `clean` parameter:

```bash
$ git pr clean
Deleted branch 'pr/226' (was 1234567).
```

## git root

show the path to root directory of git repo

```bash
$ pwd
.../very-deep-from-root-directory
$ cd `git root`
$ git add . && git commit
```

## git delta

Lists files that differ from another branch.

```bash
$ touch README.md
$ git setup
$ git checkout -b hello
$ echo hello >> README.md
$ git delta
README.md
$ touch Makefile
$ git add Makefile
$ git delta
Makefile
README.md
```

## git clear

Does a hard reset and deletes all untracked files from the working directory

## git merge-repo

Merges two repository histories.

```bash
$ git merge-repo other-repo.git master new_dir
```

The above merges `other-repo.git`'s  `master` branch into the current repository's `new_dir` directory.

```bash
$ git merge-repo git@github.com:tj/git-extras.git master .
```

The above merges a remote repo's `master` branch into the current repository's directory, not preserving history.


## git psykorebase

Rebase a branch on top of another using a merge commit and only one conflict handling.

```bash
$ git psykorebase master
```

The above rebase the current branch on top of `master` branch .

```bash
$ git psykorebase --continue
```

The above continue the rebase after conflicts have been handled.

```bash
$ git psykorebase master feature
```

The above rebase `feature` branch on top of `master` branch

## git sync

Sync local branch with its remote branch

```bash
$ git sync
```

Sync local branch with origin/master

```bash
$ git sync origin master
```

