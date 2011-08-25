
# Git Extras

 Little git extras.

## Installation

Clone / Tarball:

     $ make install

One-liner:

    $ curl https://raw.github.com/visionmedia/git-extras/master/bin/git-extras | INSTALL=y sh

Brew (buggy):

     $ brew install git-extras

## Commands

 - git extras
 - git summary
 - git changelog
 - git commits-since
 - git pull-request
 - git count
 - git create-branch
 - git delete-branch
 - git delete-submodule
 - git delete-tag
 - git fresh-branch
 - git graft
 - git alias
 - git ignore
 - git release
 - git contrib
 - git repl
 - git undo
 - git gh-pages
 - git setup
 - git touch
 - git feature
 - git refactor
 - git bug

## extras

 The main `git-extras` command, outputting the current `--version`, or listing the commands available via `--help`, or `updating` to the latest release.

For example if you wish to update to the latest version of git-extras simply execute:

      $ git extras update 

## gh-pages

 Sets up the `gh-pages` branch.

## git-[feature|refactor|bug] [finish] &lt;name&gt;

  Creates the given feature, refactor, or bug branch `name`:
  
      $ git feature dependencies
  
  Later we can check it out by issuing the same command:
  
      $ git checkout master
      $ git feature dependencies

  Finally when finished, we can add `finish`, merging it into the current branch:
  
      $ git checkout master
      $ git feature finish dependencies

   `feature` can be replaced with `bug`, or `refactor`.

## git-pull-request &lt;number&gt;

   Pulls the given request `number` from github, and applies it
   via `git am`. The git config `github.user` must be present, and
   the dirname must map to `https://github.com/<github.user>/<dirname>`

      git pull-request 604

## git-contrib

Output a user's contributions to a project, based on the author name:

    $ git contrib visionmedia
    visionmedia (18):
      Export STATUS_CODES
      Replaced several Array.prototype.slice.call() calls with Array.prototype.unshift.call()
      Moved help msg to node-repl
      Added multiple arg support for sys.puts(), print(), etc.
      Fix stack output on socket error
      ...

## git-summary

Outputs a repo summary:

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

This command can also take a commitish, and will print a summary for the range
of commits included in the commitish:

  $ git summary v42..

## git-repl

 GIT read-eval-print-loop:

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

## git-commits-since [date]

 List of commits since the given _date_, defaulting to "last week":

    $ git commits-since
    ... changes since last week
    TJ Holowaychuk - Fixed readme
    TJ Holowaychuk - Added git-repl
    TJ Holowaychuk - Added git-delete-tag
    TJ Holowaychuk - Added git-delete-branch

    $ git commits-since yesterday
    ... changes since yesterday
    TJ Holowaychuk - Fixed readme

## git-count

 Output commit total:

    $ git count

    total 1844

 Output verbose commit count details:

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

## git-release

 Release commit with the given &lt;tag&gt;.

	$ git release 0.1.0

 Does the following:

   - Commits changes (to changelog etc) with message "Release &lt;tag&gt;"
   - Tags with the given &lt;tag&gt;
   - Pushes the branch / tags

## git-alias

  Define, search and show aliases.

  Defining a new alias:

    $ git alias last "cat-file commit HEAD"

  Providing only one argument, `git-alias` searchs for aliases matching the given value:

    $ git alias ^la
    last = cat-file commit HEAD

  `git-alias` will show all aliases if no argument is given:

    $ git alias
    s = status
    amend = commit --amend
    rank = shortlog -sn --no-merges
    whatis = show -s --pretty='tformat:%h (%s, %ad)' --date=short
    whois = !sh -c 'git log -i -1 --pretty="format:%an <%ae>

## git-ignore [pattern ...]

 To lazy to open up _.gitignore_? me too! simply pass some patterns:

    $ git ignore build "*.o" "*.log"
	... added 'build'
	... added '*.o'
	... added '*.log'

 Running `git-ignore` without a pattern will display the current patterns:
   $ git ignore
   build
   *.o
   *.log

## git-create-branch &lt;name&gt;

 Creates local and remote branch _name_.

    $ git create-branch development

  Adding patterns from an existing template:
    $ git ignore -t rails

## git-delete-branch &lt;name&gt;

 Deletes local and remote branch _name_.

    $ git delete-branch integration

## git-delete-submodule &lt;name&gt;

  Deletes submodule _name_.

    $ git delete-submodule lib/foo

## git-delete-tag &lt;name&gt;

 Deletes local and remote tag _name_.

    $ git delete-tag 0.0.1

## git-fresh-branch &lt;name&gt;

 Creates empty local branch _name_.

    $ git fresh-branch docs

## git-graft &lt;src-branch&gt; &lt;dest-branch&gt;

 Merge commits from _src-branch_ into _dest-branch_ which defaults to _master_.

    $ git graft new_feature dev
    $ git graft new_feature

## git-changelog

  Populates the file named matching _change|history -i_ with the commits
since the previous tag or since the project began when no tags are present. Opens the changelog in **$EDITOR** when set.

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

Listing commits:

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

## git-undo

Removes the latest commit

    git undo

Remove the latest 3 commits:

    git undo 3


## git-setup [dir]

Set up a git repository if one doesn't exist, add all files and make an initial commit. _dir_ defaults to the current working directory.

## git-touch [filename]

Call `touch` on the given file and add it to the current index. Used one-step creating new files.
