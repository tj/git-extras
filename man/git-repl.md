git-repl(1) -- git read-eval-print-loop
=======================================

## SYNOPSIS

`git-repl`

`git-repl` [command...]

## DESCRIPTION

  Git read-eval-print-loop. Lets you run `git` commands without typing 'git'.

  Commands can be prefixed with an exclamation mark (!) to be interpreted as
  a regular shell command.

  Any arguments to git repl will be taken collectively as the first command
  to execute in the repl.

  Type `exit`, `quit`, or `q` to end the repl session. Ctrl-D and Ctrl-C
  will also work.

## COMMANDS

  &lt;command&gt;

  Interpreted as `git <command>`.

  !&lt;command&gt;

  Interpreted as `<command>` (not through `git`).

  ls

  Equivalent of 'git ls-files'.

  exit\|quit\|q

  Ends the repl session.

## CONFIGURATION

  Commands entered in a repl session will be saved to a history file and be available in
  future sessions, similar to a shell or programming language repl. By default,
  there is one global history file, ~/.git_repl_history. You can specify that your projects
  each have their own independent history file. This file will be saved in .git_repl_history
  at the top level of the repo, and will need to be added to the repo or global .gitignore.

  ```bash
  # remove the --global flag to configure only an individual project to have its own history file
  git config --global git-extras.repl.use-local-history "true"
  ```

## EXAMPLES

    $ git repl
    git version 2.34.1
    git-extras version 7.3.0
    Type 'ls' to ls files below current directory; '!command' to execute any command or just 'subcommand' to execute any git subcommand; 'quit', 'exit', 'q', ^D, or ^C to exit the git repl.

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

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt;. Updated by Wyatt S Carpenter to add display of the previous command's exit status, 'q', and the ability to pass in the initial command as arguments.

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
