git-magic(1) -- Automate add/commit/push routines
================================

## SYNOPSIS

`git-magic` [-a] [-m <msg>] [-e] [-p] [-f]

## DESCRIPTION

Produces summary of changes for commit message from `git status --porcelain` output.
Commits staged changes with the generated commit message and
opens editor to modify generated commit message optionally.
Also staging and pushing can be automated optionally.

## OPTIONS

-a

Adds everything including untracked files.

-m <msg>

Use the given <msg> as the commit message. If multiple -m options are given, their values are concatenated as separate paragraphs.
Passed to git commit command. The generated is appended to user-given messages.

-e

This option lets you further edit the generated message.
Passed to git commit command.

-p

Runs `git push` after commit.

-f

Adds `-f` option to `git push` command.

-h

Prints synopsis.

## EXAMPLES

This example stages all changes then commits with automatic commit message.

```
$ git magic -a
[feature/magic dc2a11e] A  man/git-magic.md
 1 file changed, 37 insertions(+)
 create mode 100644 man/git-auto.md
# git log
Author: overengineer <54alpersaid@gmail.com>
Date:   Thu Sep 30 20:14:22 2021 +0300

    M  man/git-magic.md
```

`-m` option PREPENDS generated message.

```
$ git magic -am "Added documentation for git magic"
[feature/magic dc2a11e] Added documentation for git magic
 1 file changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 A man/git-auto.md
$ git log
Author: overengineer <54alpersaid@gmail.com>
Date:   Thu Sep 30 20:14:22 2021 +0300

    Added documentation for git magic
    
    M  man/git-magic.md
```

## AUTHOR

Written by Alper S. Soylu <54alpersaid@gmail.com>

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
