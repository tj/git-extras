git-delete-branch(1) -- Delete branches
=======================================

## SYNOPSIS

`git-delete-branch` &lt;branchname&gt;

## DESCRIPTION

  Deletes local and remote branches named &lt;branchname&gt;. All remote repositories are searched for &lt;branchname&gt; and deleted if found.
  Note that local deletion fails if the branch is checked out.

## OPTIONS

  &lt;branchname&gt;

  The name of the branch to delete.

## EXAMPLES

    $ git delete-branch integration

## AUTHOR

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
