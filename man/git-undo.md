git-undo(1) -- Remove latest commits
====================================

## SYNOPSIS

`git-undo` [&lt;commitcount&gt;] [-s, --soft, -h, --hard]

## DESCRIPTION

  Removes the latest commits.

## OPTIONS

  --soft or -s

  This is the default, only rolls back the commit but changes remain un-staged.

  --hard or -h

  This option wipes your commit(s), so that your changes cannot be recovered. Use with care.

  &lt;commitcount&gt;

  Number of commits to remove. Defaults to *1*, thus remove the latest commit.

## EXAMPLES

  Removes the latest commit.

    $ git undo

  Remove the latest 3 commits:

    $ git undo 3

## AUTHOR

Written by Kenneth Reitz &lt;<me@kennethreitz.com>&gt; and Nick Lombard &lt;<github@jigsoft.co.za>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
