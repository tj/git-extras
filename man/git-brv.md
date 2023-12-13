git-brv(1) -- List branches sorted by their last commit date
========================================================

## SYNOPSIS

`git-brv` [-r|--reverse]

## DESCRIPTION

  Pretty listing of branches sorted by the date of their last commit.

## OPTIONS

  -r | --reverse

  Reverses the output to put the most recent branch at the bottom of the list. This is useful when there are large amount of branches as the most recent branch is shown just above the next prompt. This can be configured as the default by setting `git-extras.brv.reverse` to true in your git options.

## EXAMPLES

  Simply run `git brv`

    $ git brv
    2020-01-14 adds-git-brv fork/adds-git-brv 1ca0d76 Fixes #700: Adds git-brv
    2020-01-08 master       origin/master     265b03e Merge pull request #816 from spacewander/git-sed-pathspec

  To display the rows in reverse order: `git brv --reverse`

    $ git brv --reverse
    2020-01-08 master       origin/master     265b03e Merge pull request #816 from spacewander/git-sed-pathspec
    2020-01-14 adds-git-brv fork/adds-git-brv 1ca0d76 Fixes #700: Adds git-brv

## AUTHOR

Written by Øsse &lt;<https://github.com/Osse>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
