git-psykorebase(1) -- Rebase a branch with a merge commit
=========================================================

## SYNOPSIS

`git-psykorebase` &lt;target_branch&gt; [&lt;feature_branch&gt;] [--no-ff]  
`git-psykorebase` --continue

## DESCRIPTION

Rebase the `feature_branch` on top of the `target_branch`, the
`feature_branch` defaults to the current one.

## OPTIONS

  `--no-ff` Force a commit message even if there are no conflicts.

  `--continue` Continue the rebase after conflicts have been resolved.

## EXAMPLES

  Rebase current branch on top of master:

    $ git psykorebase master --no-ff

  Handle conflicts:

    $ git add README.md

  Continue rebase:

    $ git psykorebase --continue

## AUTHOR

Written by Rémy Hubscher &lt;<hubscher.remy@gmail.com>&gt;

Based on Benoît Bryon &lt;<benoit@marmelune.net>&gt; implementation in
Python.

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;

&lt;<https://github.com/benoitbryon/psykorebase>&gt;
