git-pr(1) -- Checks out a pull request locally
=================================

## SYNOPSIS

`git-pr` [-m|--merge] &lt;number&gt; [&lt;remote&gt;]<br>
`git-pr` [-m|--merge] &lt;[remote]:number&gt;...<br>
`git-pr` [-m|--merge] &lt;url&gt;...<br>
`git-pr clean`

## DESCRIPTION

  Creates a local branch based on a GitHub pull request number or URL, and
  switch to that branch afterwards.

## OPTIONS

  &lt;remote&gt;

  The name of the remote to fetch from. Defaults to `origin`.

  &lt;url&gt;

  GitHub pull request URL in the format `https://github.com/tj/git-extras/pull/453`.

  -m | --merge

  Checkout a merge commit against the branch the pull request is targeting.
  Because this feature uses a private API with which GitHub checks the pull
  request's mergeability, it only works with the opened pull request. If the merge
  commit is not up-to-date, please visit the pull request web page to trigger the
  rebuild.

## EXAMPLES

This checks out the pull request `226` from `origin`:

    $ git pr 226

    remote: Counting objects: 12, done.
    remote: Compressing objects: 100% (9/9), done.
    remote: Total 12 (delta 3), reused 9 (delta 3)
    Unpacking objects: 100% (12/12), done.
    From https://github.com/tj/git-extras
     * [new ref]         refs/pull/226/head -> pr/226

    Switched to branch 'pr/226'

This pulls from a different remote:

    $ git pr 226 upstream

This does the same thing as the command above:

    $ git pr upstream:226

You can also checkout a pull request based on a GitHub URL:

    $ git pr https://github.com/tj/git-extras/pull/453

    From https://github.com/tj/git-extras
     * [new ref]         refs/pull/453/head -> pr/453
    Switched to branch 'pr/453'

You could even pull multiple pull requests via the GitHub URL or the ID **with remote specified**:

    $ git pr upstream:226 upstream:443
    $ git pr upstream:443 https://github.com/tj/git-extras/pull/453

Note that `git pr PR-A PR-B` is equal to:

    $ git pr PR-A
    $ git pr PR-B

Therefore, if one of the pull request is failed to pull, this command will still go ahead and pull
the others. The final exit code will be decided by the result of the final pulling.

With `--merge` option, you could check out a merge commit:

    $ git pr origin:755 --merge
    remote: Enumerating objects: 3, done.
    remote: Counting objects: 100% (3/3), done.
    remote: Compressing objects: 100% (3/3), done.
    remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
    Unpacking objects: 100% (3/3), done.
    From github.com:tj/git-extras
    bf7dd69..de6e51c  refs/pull/755/merge -> pr/755
    Switched to branch 'pr/775'

    $ git log pr/775 --oneline
    de6e51c (pr/755) Merge bf7dd6...

To clean up old branches:

    $ git pr clean

    Deleted branch pr/226 (was b96a8c2).
    Deleted branch pr/220 (was d34dc0f).
    Deleted branch pr/775 (was de6e51c).

## AUTHOR

Originally from https://gist.github.com/gnarf/5406589

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
