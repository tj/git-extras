git-delete-branch(1) -- Delete branches
=======================================

## SYNOPSIS

`git-delete-branch` &lt;branchname&gt;

## DESCRIPTION

  Deletes local and remote branch named &lt;branchname&gt;.
  Note that local deletion fails if the branch is checked out.

## OPTIONS

  &lt;branchname&gt;

  The name of the branch to delete.
  If multiple branches are provided, then they will all be deleted.

## EXAMPLES

    $ git delete-branch integration
    $ git delete-branch integration bug/1234

## AUTHOR

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
