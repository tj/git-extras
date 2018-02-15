git-mr(1) -- Checks out a merge request locally
========================================

## SYNOPSIS

`git-mr` &lt;number&gt; [&lt;remote&gt;]<br>
`git-mr` &lt;url&gt;<br>
`git-mr clean`

## DESCRIPTION

  Fetches merge request head by its number or URl and check it out in a branch
  named with merge request number.

## OPTIONS

  &lt;remote&gt;

  The name of the remote to fetch from. Defaults to `origin`.

  &lt;url&gt;

  GitLab merge request URL in the format
  `https://gitlab.tld/owner/repository/merge_requests/453`.


## EXAMPLES

This checks out merge request `!51` from remote `origin` to branch `mr/51`.

    $ git mr 51
    From gitlab.com:owner/repository
     * [new ref]         refs/merge-requests/51/head -> mr/51
    Switched to branch 'mr/51'

## AUTHOR

Written by Étienne BERSAC <bersace03@gmail.com> from git-pr(1).

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
