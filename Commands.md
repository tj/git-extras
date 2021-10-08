
 - [`git abort`](#git-abort)
 - [`git alias`](#git-alias)
 - [`git archive-file`](#git-archive-file)
 - [`git authors`](#git-authors)
 - [`git browse`](#git-browse)
 - [`git bulk`](#git-bulk)
 - [`git brv`](#git-brv)
 - [`git changelog`](#git-changelog)
 - [`git clear`](#git-clear)
 - [`git clear-soft`](#git-clear-soft)
 - [`git coauthor`](#git-coauthor)
 - [`git commits-since`](#git-commits-since)
 - [`git contrib`](#git-contrib)
 - [`git count`](#git-count)
 - [`git cp`](#git-cp)
 - [`git create-branch`](#git-create-branch)
 - [`git delete-branch`](#git-delete-branch)
 - [`git delete-merged-branches`](#git-delete-merged-branches)
 - [`git delete-squashed-branches`](#git-delete-squashed-branches)
 - [`git delete-submodule`](#git-delete-submodule)
 - [`git delete-tag`](#git-delete-tag)
 - [`git delta`](#git-delta)
 - [`git effort`](#git-effort)
 - [`git extras`](#git-extras)
 - [`git feature`](#git-feature)
 - [`git force-clone`](#git-force-clone)
 - [`git fork`](#git-fork)
 - [`git fresh-branch`](#git-fresh-branch)
 - [`git gh-pages`](#git-gh-pages)
 - [`git graft`](#git-graft)
 - [`git guilt`](#git-guilt)
 - [`git ignore`](#git-ignore)
 - [`git ignore-io`](#git-ignore-io)
 - [`git info`](#git-info)
 - [`git local-commits`](#git-local-commits)
 - [`git lock`](#git-lock)
 - [`git locked`](#git-locked)
 - [`git magic`](#git-magic)
 - [`git merge-into`](#git-merge-into)
 - [`git merge-repo`](#git-merge-repo)
 - [`git missing`](#git-missing)
 - [`git mr`](#git-mr)
 - [`git obliterate`](#git-obliterate)
 - [`git paste`](#git-paste)
 - [`git pr`](#git-pr)
 - [`git psykorebase`](#git-psykorebase)
 - [`git pull-request`](#git-pull-request)
 - [`git reauthor`](#git-reauthor)
 - [`git rebase-patch`](#git-rebase-patch)
 - [`git release`](#git-release)
 - [`git rename-branch`](#git-rename-branch)
 - [`git rename-tag`](#git-rename-tag)
 - [`git rename-remote`](#git-rename-remote)
 - [`git repl`](#git-repl)
 - [`git reset-file`](#git-reset-file)
 - [`git root`](#git-root)
 - [`git rscp`](#git-scp)
 - [`git scp`](#git-scp)
 - [`git sed`](#git-sed)
 - [`git setup`](#git-setup)
 - [`git show-merged-branches`](#git-show-merged-branches)
 - [`git show-tree`](#git-show-tree)
 - [`git show-unmerged-branches`](#git-show-unmerged-branches)
 - [`git stamp`](#git-stamp)
 - [`git squash`](#git-squash)
 - [`git standup`](#git-standup)
 - [`git summary`](#git-summary)
 - [`git sync`](#git-sync)
 - [`git touch`](#git-touch)
 - [`git undo`](#git-undo)
 - [`git unlock`](#git-unlock)
 - [`git utimes`](#git-utimes)

## git extras

The main `git-extras` command.

Output the current `--version`:

```bash
$ git extras --version
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

Sets up the `gh-pages` branch.  (See [GitHub Pages](https://pages.github.com/) documentation.)

## git feature

Create/Merge the given feature branch `name`:

```bash
$ git feature dependencies
```

To Setup a remote tracking branch:

```bash
$ git feature dependencies -r upstream
```
_Note_: If no remote name is passed with the `-r` option, it will push to _origin_.

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

_Note_: If a remote is setup to track the branch, it will be deleted.

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
the commitish range:

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

## git effort

  Displays "effort" statistics, currently just the number of commits per file, showing highlighting where the most activity is. The "active days" column is the total number of days which contributed modifications to this file.

```
node (master): git effort --above 15 {src,lib}/*
```

  If you wish to ignore files with commits `<=` a value you may use `--above`:

```
$ git effort --above 5
```

  If you wish to see only the commits in the last month you may use `--since` (it supports the same syntax like `git log --since`):

```
 $ git effort -- --since='last month'
```

  By default `git ls-files` is used, however you may pass one or more files to `git-effort(1)`, for example:

```
$ git effort bin/* lib/*
```

## git bulk

`git bulk` adds convenient support for operations that you want to execute on multiple git repositories.

  * simply register workspaces that contain multiple git repos in their directory structure
  * run any git command on the repositories of the registered workspaces in one command to `git bulk`
  * use the "guarded mode" to check on each execution

```bash
usage: git bulk [-g] ([-a]|[-w <ws-name>]) <git command>
       git bulk --addworkspace <ws-name> <ws-root-directory> (--from <URL or file>)
       git bulk --removeworkspace <ws-name>
       git bulk --addcurrent <ws-name>
       git bulk --purge
       git bulk --listall
```

  Register a workspace so that `git bulk` knows about it (notice that <ws-root-directory> must be absolute path):

```bash
$ git bulk --addworkspace personal ~/workspaces/personal
```
  With option `--from` the URL to a single repository or a file containing multiple URLs can be added and they will be cloned directly into the workspace. Suitable for the initial setup of a multi-repo project.

```bash
$ git bulk --addworkspace projectX ~/workspaces/projectx --from https://github.com/x/project-x.git

# OR with a file containing many repositories on each line:
$ git bulk --addworkspace projectX ~/workspaces/projectx --from ~/workspaces/repositories.txt
```
with `repositories.txt` be like:
```
https://github.com/x/project-x-1.git
https://github.com/x/project-x-2.git
https://github.com/x/project-x-3.git
```

  Register the current directory as a workspace to `git bulk`

```bash
$ git bulk --addcurrent personal
```

  List all registered workspaces:

```bash
$ git bulk --listall
bulkworkspaces.personal /Users/niklasschlimm/workspaces/personal

```

  Run a git command on the repositories of the current workspace:

```bash
$ git bulk fetch
```

![fetchdemo](https://cloud.githubusercontent.com/assets/876604/23709805/e8178406-041a-11e7-9a0c-01de5fbf8944.png)

  Run a git command on one specific workspace and its repositories:

```bash
$ git bulk -w personal fetch
```

  Run a git command on all workspaces and their repositories:

```bash
$ git bulk -a fetch
```

  Run a git command but ask user for confirmation on every execution (guarded mode):

```bash
$ git bulk -g fetch
```

  Remove a registered workspace:

```bash
$ git bulk --removeworkspace personal
```
  Remove all registered workspaces:

```bash
$ git bulk --purge
```

## git brv

Pretty listing of branches sorted by the date of their last commit.

```bash
$ git brv
2020-01-14 adds-git-brv fork/adds-git-brv 1ca0d76 Fixes #700: Adds git-brv
2020-01-08 master       origin/master     265b03e Merge pull request #816 from spacewander/git-sed-pathspec
```


## git repl

Git read-eval-print-loop. Lets you run `git` commands without typing 'git'.

Commands can be prefixed with an exclamation mark (!) to be interpreted as
a regular command.

Type `exit` or `quit` to end the repl session.

```bash
$ git repl
git version 2.9.2
git-extras version 3.0.0
type 'ls' to ls files below current directory,
'!command' to execute any command or just 'subcommand' to execute any git subcommand

git (master)> ls-files
History.md
Makefile
Readme.md
bin/git-changelog
bin/git-count
bin/git-delete-branch
bin/git-delete-tag
bin/git-ignore
bin/git-release

git (master)> !echo Straight from the shell!
Straight from the shell!

git (master)> quit
```

## git coauthor

Add a co-author to the last commit

```bash
$ git coauthor user user@email.com

[master b62ceae] Add documentation files
 Date: Sat Aug 17 17:33:53 2019 -0500
 2 files changed, 145 insertions(+), 0 deletions(-)
 create mode 100644 README.md
 create mode 100644 CONTRIBUTING.md
 
 $ git log -1
 
commit b62ceae2685e6ece071f3c3754e9b77fd0a35c88 (HEAD -> master)
Author: user person <userperson@email.com>
Date:   Sat Aug 17 17:33:53 2019 -0500

    Add documentation files

    Co-authored-by: user <user@email.com>
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
- all remotes refs use git over ssh if configured, otherwise https will be used


```Shell
$ cd expect.js && git remote -v
origin          git@github.com:<user>/expect.js (fetch)
origin          git@github.com:<user>/expect.js (push)
upstream        git@github.com:LearnBoost/expect.js (fetch)
upstream        git@github.com:LearnBoost/expect.js (push)
```

## git force-clone

If the clone target directory exists and is a git repository, reset its
contents to a clone of the remote.

``` bash
$ git force-clone [-b {branch_name}] {remote_url} {destination_path}
$ git force-clone -b master https://github.com/tj/git-extras ./target-directory
```

**CAUTION**: If the repository exists, this will destroy *all* local changes
to the repository - changed files will be reset and local branches will be
removed.

[More information](man/git-force-clone.md).

## git release

Release commit with the given &lt;tag&gt; and other options:

```bash
$ git release 0.1.0
```

If you are using [semver](https://semver.org) in your project, you could also use the command below:
(Run `git help release` for more information)

```bash
$ git release --semver major/minor/patch
```

Does the following:

  - Executes _.git/hooks/pre-release.sh_ (if present), passing it the given tag and remain arguments
  - Commits changes (to changelog etc) with message "Release &lt;tag&gt;"
  - Tags with the given &lt;tag&gt;
  - Push the branch / tags
  - Executes _.git/hooks/post-release.sh_ (if present), passing it the given tag and remain arguments


## git rename-branch

Rename a branch locally, and sync to remote via `git push`.

```
# renames any branch
$ git rename-branch old-name new-name

# renames current branch
$ git rename-branch new-name
```

## git rename-tag

Rename a tag (locally and remotely).
```
$ git tag test
$ git push --tags
Total 0 (delta 0), reused 0 (delta 0)
To git@myserver.com:myuser/myrepository.git
    * [new tag]         test -> test
$ git tag
test
$ git rename-tag test test2
Deleted tag 'test' (was 1111111)
Total 0 (delta 0), reused 0 (delta 0)
To git@myserver.com:myuser/myrepository.git
    * [new tag]         test2 -> test2
remote: warning: Deleting a non-existent ref.
To git@myserver.com:myuser/myrepository.git
    - [deleted]         refs/tag/test
$ git tag
test2
```

## git rename-remote

Rename a git remote regardless of name conflict, and then list current git remotes.
```
$ git remote -v
origin	git@myserver.com:myuser/foo.git (fetch)
origin	git@myserver.com:myuser/foo.git (push)
upstream	git@myserver.com:myuser/bar.git (fetch)
upstream	git@myserver.com:myuser/bar.git (push)
$ git-rename-remote upstream origin
origin	git@myserver.com:myuser/bar.git (fetch)
origin	git@myserver.com:myuser/bar.git (push)
```

## git reauthor

Rewrite history to change author's identity.

Replace the personal email and name of Jack to his work ones
```bash
$ git reauthor --old-email jack@perso.me --correct-email jack@work.com --correct-name 'Jack Foobar'
```

Replace the email and name of Jack to the ones defined in the Git config
```bash
$ git reauthor --old-email jack@perso.me --use-config
```

Replace only the email of Jack (keep the name already used)
```bash
$ git reauthor --old-email jack@perso --correct-email jack@perso.me
```

Change only the committer email of Jack (keep the author email already used)
```bash
$ git reauthor --old-email jack@perso.me --correct-email jack@work.com --type committer
```

Set Jack's identity as the only one of the whole repository
```bash
$ git reauthor --all --correct-email jack@perso.me --correct-name Jack
```

Set Jack as the only committer of the whole repository (keeps authors)
```bash
$ git reauthor --all --correct-email jack@perso.me --correct-name Jack --type committer
```


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
* `-p` or `--private` to show just the repository's file

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
* `-r` or `--replace` to export `.gitignore` with the result

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

    ## Submodule(s):

      a234567 path2submodule1/submodule1 (branch/tag)
    + b234567 path2submodule2/submodule2 (branch/tag)
    - c234567 path2submodule3/submodule3 (branch/tag)
      e234567 path2submodule4/submodule4 (branch/tag)

    ## Most Recent Commit:

    commit e3952df2c172c6f3eb533d8d0b1a6c77250769a7
    Author: Sample Author <sampleAuthor@gmail.com>

    Added git-info command.

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

## git cp

Copy a file to another one keeping its history and allowing for merge conflicts handling.

```bash
$ git cp README.md README.rst
```

## git create-branch

Create local branch `name`:

```bash
$ git create-branch development
```

Create local branch `name` and setup a remote tracking branch in `origin`:

```bash
$ git create-branch -r development
```

Create local branch `name` and setup a remote tracking branch in `upstream`:

```bash
$ git create-branch -r upstream development
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

## git delete-squashed-branches

Deletes branches that have been "squashed-merged" into a specified branch; this branch will be checked out as a side-effect. If no branch is specified, then it will default to the current checked out branch.

```bash
$ (feature-branch) git delete-squashed-branches main
Deleted branch dependabot/bundler/kramdown-2.3.1 (was 1d3fb00).
Deleted branch dependabot/bundler/rexml-3.2.5 (was a7e4052).
$ (main) git ...
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

See the ["MAPPING AUTHORS" section](https://git-scm.com/docs/git-shortlog#_mapping_authors) of **git-shortlog**(1) to coalesce together commits by the same person.

Updating AUTHORS file:

```bash
$ git authors && cat AUTHORS

TJ Holowaychuk <tj@vision-media.ca>
hemanth.hm <hemanth.hm@gmail.com>
Jonhnny Weslley <jw@jonhnnyweslley.net>
nickl- <github@jigsoft.co.za>
Leila Muhtasib <muhtasib@gmail.com>
```

Listing authors:

```bash
$ git authors --list

TJ Holowaychuk <tj@vision-media.ca>
hemanth.hm <hemanth.hm@gmail.com>
Jonhnny Weslley <jw@jonhnnyweslley.net>
nickl- <github@jigsoft.co.za>
Leila Muhtasib <muhtasib@gmail.com>
```

Listing authors without email:

```bash
$ git authors --list --no-email

TJ Holowaychuk
hemanth.hm
Jonhnny Weslley
nickl-
Leila Muhtasib
```

## git changelog

Generates a changelog from git(1) tags (annotated or lightweight) and commit messages. Existing changelog files with filenames that begin with _Change_ or _History_ will be identified automatically with a case insensitive match pattern and existing content will be appended to the new output generated--this behavior can be disabled by specifying the prune option (-p|--prune-old). The generated file will be opened in **$EDITOR** when set.

If no tags exist, then all commits are output; if tags exist, then only the most-recent commits are output up to the last identified tag. This behavior can be changed by specifying one or both of the range options (-f|--final-tag and -s|--start-tag).

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

For example,
```bash
$ git sed 'this' 'that'
$ git sed 'this' 'that' g
$ git sed 'this' 'that' -- path/ path2/
```

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

## git show-merged-branches

Show all branches merged in to current HEAD.

## git show-unmerged-branches

Show all branches **not** merged in to current HEAD.

## git show-tree

Show the decorated graph view of one liner summarized commits from all branches.
For example, running `git show-tree` will display:
```
*   4b57684 (HEAD, develop) Merge branch upstream master.
|\
| *   515e94a Merge pull request #128 from nickl-/git-extras-html-hyperlinks
| |\
| | * 815db8b (nickl/git-extras-html-hyperlinks, git-extras-html-hyperlinks) help ronn make hyperlinks.
| * | 7398d10 (nickl/develop) Fix #127 git-ignore won't add duplicates.
| |/
| | * ab72c1e (refs/stash) WIP on develop: 5e943f5 Fix #127 git-ignore won't add duplicates.
| |/
|/|
* | 730ca89 (bolshakov) Rebase bolshakov with master
|/
* 60f8371 (origin/master, origin/HEAD, master) Merge pull request #126 from agrimaldi/fix-changelog-last-tag
...
```

Be free to try it for yourself!


## git stamp

Stamp the last commit message

Commit message is

```bash
Fix timezone bug
```

Reference the issues numbers from your bug tracker

```bash
$ git stamp Issue FOO-123

commit 787590e42c9bacd249f3b79faee7aecdc9de28ec
Author: Jack <jack@work.com>
Commit: Jack <jack@work.com>

    Fix timezone bug

    Issue FOO-123

$ git stamp Issue FOO-456 \#close

commit f8d920511e052bea39ce2088d1d723b475aeff87
Author: Jack <jack@work.com>
Commit: Jack <jack@work.com>

    Fix timezone bug

    Issue FOO-123

    Issue FOO-456 #close
```

Link to its review page

```bash
$ git stamp Review https://reviews.foo.org/r/4567/

commit 6c6bcf43bd32a76e37b6fc9708d3ff0ae723c7da
Author: Jack <jack@work.com>
Commit: Jack <jack@work.com>

    Fix timezone bug

    Issue FOO-123

    Issue FOO-456 #close

    Review https://reviews.foo.org/r/4567/
```

Replace previous issues with a new one
(Note that the identifier is case insensitive)

```bash
$ git stamp --replace issue BAR-123

commit 2b93c56b2340578cc3478008e2cadb05a7bcccfa
Author: Jack <jack@work.com>
Commit: Jack <jack@work.com>

    Fix timezone bug

    Review https://reviews.foo.org/r/4567/

    issue BAR-123
```


## git standup

Recall what you did or find what someone else did in a given range of time.
For instance, recall John's commits since last week(7 days ago):
```
git standup -a John -d 7
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

Creates a zip archive of the current git repository. The name of the archive will depend on the current HEAD of your git repository.

## git missing

Print out which commits are on one branch or the other but not both.

```bash
$ git missing master
< d14b8f0 only on current checked out branch
> 97ef387 only on master
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

## git mr

Checks out a merge request from GitLab. Usage: `git mr <ID|URL> [REMOTE]`.
Default remote is `origin`.

``` bash
$ git mr 51
From gitlab.com:owner/repository
 * [new ref]         refs/merge-requests/51/head -> mr/51
Switched to branch 'mr/51'
```

With full URL, the head is fetched from a temporary remote pointing to the base URL.

``` bash
$ git mr https://gitlab.com/owner/repository/merge_requests/51 
From gitlab.com:owner/repository
 * [new ref]         refs/merge-requests/51/head -> mr/51
Switched to branch 'mr/51'
```

Just like [git pr](#git-pr), `git mr` accepts a `clean` argument to trash all
`mr/` branches. Ensure current branch is not one.

## git paste

Sends commits to a pastebin site using pastebinit.

By default it sends the commits between your current branch
and the branch your current branch is based on (the upstream branch).

``` bash
$ git paste
https://paste.debian.net/1234567/
```

All options are passed to `git format-patch --stdout`
so you can also pass options understood by `git-rev-parse(1)`
in order to select a different set of commits.

``` bash
$ git paste @^
https://paste.debian.net/1234567/
```

See the [pastebinit documentation](https://manpages.debian.org/pastebinit)
for information about how to chose a different pastebin site to the default.

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

Does a hard reset and deletes all untracked files from the working directory, including those in .gitignore.

## git clear-soft

Does a hard reset and deletes all untracked files from the working directory, excluding those in .gitignore.

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

## git pull-request

Create pull request via commandline.

## git rebase-patch

Given you have a patch that doesn't apply to the current HEAD, but you know it applied to some commit in the past,
`git rebase-patch` will help you find that commit and do a rebase.

For example,
```
$ git rebase-patch test.patch
Trying to find a commit the patch applies to...
Patch applied to dbcf408dd26 as 7dc8b23ae1a
First, rewinding head to replay your work on top of it...
Applying: test.patch
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Auto-merging README.txt
```

Then your last commit has the changes of the patch and is named `test.patch`.

## git sync

Sync local branch with its remote branch

```bash
$ git sync
```

Sync local branch with origin/master

```bash
$ git sync origin master
```

## git browse

Opens the current git repository website in your default web browser.

```bash
$ git browse
```

## git utimes

Change files modification time to their last commit date.

```bash
git-extras$ ls -l bin | head
total 308
-rwxr-xr-x 1 vt vt   489 Nov  8 13:56 git-alias
-rwxr-xr-x 1 vt vt  1043 Nov  8 13:56 git-archive-file
-rwxr-xr-x 1 vt vt   970 Nov  8 13:56 git-authors
-rwxr-xr-x 1 vt vt   267 Nov  8 13:56 git-back
-rwxr-xr-x 1 vt vt   899 Nov  8 13:56 git-browse
-rwxr-xr-x 1 vt vt  1932 Nov  8 13:56 git-brv
-rwxr-xr-x 1 vt vt  6282 Nov  8 13:56 git-bulk
-rwxr-xr-x 1 vt vt 18561 Nov  8 13:56 git-changelog
-rwxr-xr-x 1 vt vt   215 Nov  8 13:56 git-clear
git-extras$ git utimes
+ touch -d 2015-08-09T19:27:49+08:00 bin/git-alias
+ touch -d 2020-05-22T10:40:29+08:00 bin/git-archive-file
+ touch -d 2017-05-05T16:02:09+08:00 bin/git-authors
+ touch -d 2020-02-23T11:41:54+08:00 bin/git-back
+ touch -d 2020-06-23T09:31:21+10:00 bin/git-browse
+ touch -d 2020-01-15T10:46:19+01:00 bin/git-brv
+ touch -d 2019-12-21T13:35:59+08:00 bin/git-bulk
+ touch -d 2019-09-05T12:41:38+08:00 bin/git-changelog
+ touch -d 2016-11-19T16:41:19+00:00 bin/git-clear
[...]
git-extras$ ls -l bin | head
total 308
-rwxr-xr-x 1 vt vt   489 Aug  9  2015 git-alias
-rwxr-xr-x 1 vt vt  1043 May 22 05:40 git-archive-file
-rwxr-xr-x 1 vt vt   970 May  5  2017 git-authors
-rwxr-xr-x 1 vt vt   267 Feb 23  2020 git-back
-rwxr-xr-x 1 vt vt   899 Jun 23 02:31 git-browse
-rwxr-xr-x 1 vt vt  1932 Jan 15  2020 git-brv
-rwxr-xr-x 1 vt vt  6282 Dec 21  2019 git-bulk
-rwxr-xr-x 1 vt vt 18561 Sep  5  2019 git-changelog
-rwxr-xr-x 1 vt vt   215 Nov 19  2016 git-clear
```

## git abort

Abort current rebase, merge or cherry-pick, without the need to find exact command in history.

## git magic

Commits changes with a generated message.
