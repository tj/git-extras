git-repl(1) -- git read-eval-print-loop
=======================================

## SYNOPSIS

`git-repl`

## DESCRIPTION

  Git read-eval-print-loop. Let's you run `git` commands without typing 'git'.

  Commands can be prefixed with an exclamation mark (!) to be interpreted as
  a regular command.

  Type `exit` or `quit` to end the repl session.

## COMMANDS

  &lt;command&gt;

  Interpreted as `git <command>`.

  !&lt;command&gt;

  Interpreted as `<command>` (not through `git`).

  ls

  Equivalent of 'git ls-files'.

  exit|quit

  Ends the repl session.


## EXAMPLES

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

## AUTHOR

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
