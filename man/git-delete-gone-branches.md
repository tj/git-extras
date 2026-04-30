git-delete-gone-branches(1) -- Delete branches whose remote is gone
====================================================================

## SYNOPSIS

`git-delete-gone-branches` [-n|--dry-run] [-f|--force] [-p|--prune]

## DESCRIPTION

  Deletes all local branches whose remote-tracking branch has been deleted.
  This commonly happens after a pull request is merged and the remote branch
  is removed. By default, lists the branches and prompts for confirmation
  before deleting.

## OPTIONS

  -n, --dry-run

  Show the branches that would be deleted without actually deleting them.

  -f, --force

  Skip the confirmation prompt and delete branches immediately.

  -p, --prune

  Run `git fetch --prune` before checking for gone branches, to ensure
  remote-tracking refs are up to date.

## EXAMPLES

    $ git delete-gone-branches

    $ git delete-gone-branches --dry-run

    $ git delete-gone-branches --force

    $ git delete-gone-branches --prune

## AUTHOR

Written by Utsav Sabharwal &lt;<https://github.com/codersofthedark>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
