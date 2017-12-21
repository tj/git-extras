git-delete-branch(1) -- Delete branches
=======================================

## SYNOPSIS

`git-delete-branch` [-r &lt;remote[:remote branch name]&gt;] &lt;branchname&gt;

## DESCRIPTION

Delete local and remote branches. If the remote switch (-r) is provided, then
use the given remote and remote branch. Otherwise, the remote branch is found
by first trying the upstream tracking branch. If there is no tracking branch
configured, then deletion will not succeed unless provided explicitly. If the
remote branch and local branch do not share a name, the remote branch name can
be included with the remote switch.

Local deletion will fail if the branch is currently checked out. If the local
operation fails, then the remote operation will not run.

## OPTIONS

-r

Specify a remote name and a remote branch name to use during the remote
branch deletion.

## EXAMPLES

Delete the branch "ex1", the upstream tracking information is used.

$ git delete-branch ex1

Delete the local branch "ex2", and the remote branch "ex2-1" at remote
"upstream".

$ git delete-branch -r upstream:ext2-1 ex2

## AUTHOR

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt;

Extended by Ben Turrubiates &lt;ben@turrubiat.es&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
