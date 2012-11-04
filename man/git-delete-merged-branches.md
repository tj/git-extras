git-delete-merged-branches(1) -- Delete merged branches
=====================================================

## SYNOPSIS

`git-delete-merged-branches` [-f|--force]

## DESCRIPTION

  Deletes all branches merged into current HEAD. Does not delete *master*, even if ran from a branch that is
  *master* descendant. Asks before deleting anything, unless it is run with _--force_ option.

## OPTIONS

  -f, --force

  Delete merged branches without asking user for confirmation.

## EXAMPLES

    $ git delete-merged-branches

## AUTHOR

Written by Jesús Espino &lt;<jespinog@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
