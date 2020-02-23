git-back(1) -- Undo and Stage latest commits
============================================

## SYNOPSIS

`git-back` [&lt;commitcount&gt;]

## DESCRIPTION

  Deprecated. Use 'git undo --soft [commitcount]' instead.

  Removes the latest commits, and add their changes to your staging area.

## OPTIONS

  &lt;commitcount&gt;

  Number of commits to remove. Defaults to *1*, thus remove the latest commit.

## EXAMPLES

  Removes the latest commit.

    $ git back

  Remove the latest 3 commits:

    $ git back 3

## AUTHOR

Written by Kenneth Reitz &lt;<me@kennethreitz.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
