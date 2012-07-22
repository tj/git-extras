git-undo(1) -- Remove latest commits
====================================

## SYNOPSIS

`git-undo` [&lt;commitcount&gt;] [--hard|-h]

## DESCRIPTION

  Removes the latest commits.

## OPTIONS

  &lt;commitcount&gt;

  Number of commits to remove. Defaults to *1*, thus remove the latest commit.

  --hard or -h

  This option wipes your commit(s), so that your changes cannot be recovered. Use with care.

## EXAMPLES

  Removes the latest commit.

    $ git undo

  Remove the latest 3 commits:

    $ git undo 3

## AUTHOR

Written by Kenneth Reitz &lt;<me@kennethreitz.com>&gt;

## REPORTING BUGS

&lt;<http://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<http://github.com/visionmedia/git-extras>&gt;
