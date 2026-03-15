git-delete-gone-branches(1) -- Delete branches whose remote is gone
====================================================================

## SYNOPSIS

`git-delete-gone-branches` [-n|--dry-run]

## DESCRIPTION

  Deletes all local branches whose remote-tracking branch has been deleted
  (i.e. branches marked as `[gone]` in `git branch -vv`). This commonly
  happens after a pull request is merged and the remote branch is removed.

## OPTIONS

  -n, --dry-run

  Show the branches that would be deleted without actually deleting them.

## EXAMPLES

    $ git delete-gone-branches

    $ git delete-gone-branches --dry-run

## AUTHOR

Written by Utsav Sabharwal &lt;<utsav.sabharwal@sysdig.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
