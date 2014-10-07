git-pr(1) -- Checks out a pull request locally
=================================

## SYNOPSIS

`git-pr` &lt;number&gt; [&lt;remote&gt;]<br>
`git-pr clean`

## DESCRIPTION

  Creates a local branch based on a GitHub pull request number, and switch to 
  that branch afterwards.

## OPTIONS
  
  &lt;remote&gt;

  The name of the remote to fetch from. Defaults to `origin`.

## EXAMPLES

This checks out the pull request `226` from `origin`:

    $ git pr 226

    remote: Counting objects: 12, done.
    remote: Compressing objects: 100% (9/9), done.
    remote: Total 12 (delta 3), reused 9 (delta 3)
    Unpacking objects: 100% (12/12), done.
    From https://github.com/visionmedia/git-extras
     * [new ref]         refs/pull/226/head -> pr/226

    Switched to branch 'pr/226'

This pulls from a different remote:

    $ git pr 226 upstream

To clean up old branches:

    $ git pr clean
  
    Deleted branch pr/226 (was b96a8c2).
    Deleted branch pr/220 (was d34dc0f).

## AUTHOR

Originally from https://gist.github.com/gnarf/5406589

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
