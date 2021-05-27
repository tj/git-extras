git-delete-squashed-branches(1) -- Delete branches that were squashed
=====================================================================

## SYNOPSIS

`git-delete-squashed-branches` [&lt;branch-name&gt;]

## DESCRIPTION

Deletes all git branches that have been "squash-merged" into `branch-name`.

## OPTIONS

  &lt;branch-name&gt;

  The target branch were the "squashed-merged" branches were committed to. If no value is given, then the current checked out branch will be used.

## EXAMPLES

  Delete all branches that were "squash-merged" into the current checked out branch.

    $ git delete-squashed-branches

  Delete all branches that were "squash-merged" into the `main` branch. This will checkout the target branch and leave you on said branch after the command has completed.

    $ git delete-squashed-branches main

## AUTHOR

Written by Teddy Katz &lt;<teddy.katz@gmail.com>&gt; and Vladimir Jimenez &lt;<me@allejo.io>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
