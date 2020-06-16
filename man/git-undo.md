git-undo(1) -- Remove latest commits
====================================

## SYNOPSIS

`git-undo` [-s, --soft, -h, --hard] [&lt;commitcount&gt;]

## DESCRIPTION

  Removes the latest commits.

## OPTIONS

  --soft or -s

  Rolls back the commit(s) but leaves the changes in the staging area.

  --hard or -h

  This option wipes your commit(s), so that your changes cannot be recovered. Use with care.
  To avoid being confused with `--help`, there will be a confirmation when `-h` is specified.

  &lt;commitcount&gt;

  Number of commits to remove. Defaults to *1*, thus remove the latest commit.

## EXAMPLES

  Removes the latest commit.

    $ git undo

  Removes the latest commit, restoring the staging area.

    $ git undo -s

  Remove the latest 3 commits:

    $ git undo 3

## AUTHOR

Written by Kenneth Reitz &lt;<me@kennethreitz.com>&gt; and Nick Lombard &lt;<github@jigsoft.co.za>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
