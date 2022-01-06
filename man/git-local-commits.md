git-local-commits(1) -- List local commits
=======================================

## SYNOPSIS

`git-local-commits` &lt;args&gt;

## DESCRIPTION

  Lists commits in the local branch that have not been pushed to the remote tracked branch.
  This requires that HEAD points to a branch which is tracking another branch.

## OPTIONS

  &lt;args&gt;

  All arguments passed to `git-local-commits` will be passed directly to `git-log`.

## EXAMPLES

    $ git local-commits --graph

## AUTHOR

Written by Michael Komitee &lt;<mkomitee@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
