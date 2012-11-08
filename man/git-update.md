git-update(1) -- Get to the latest commit of a branch
=====================================================

## SYNOPSIS

`git-update` \[ -d \] \[\[ &lt;remote&gt; \] &lt;branch&gt; \]

## DESCRIPTION

  `update` allows you to quickly get to the latest commit of a branch by switching to it and merging remote changes.

  Any uncommitted local changes will be stashed before switching and merging.

  By default `update` defaults to remote `origin` and branch `master`.

## OPTIONS

  -d, --delete

  Delete uncommitted changes instead of stashing them. (Proceed with caution)

  &lt;remote&gt;

  Remote repository to pull changes from. (Default: `origin`)

  &lt;branch&gt;

  Branch to switch to and update. (Default: `master`)

## EXAMPLES

  $ git update

  Stashes any uncommitted changes, switches to branch `master` and pulls remote commits from `origin`.

  $ git update -d feature/xyz

  Deletes any uncommitted changes, switches to branch `feature/xyz` and pulls remote commits from `origin`.

  $ git update yuki feature/xyz

  Stashes any uncommitted changes, switches to branch `feature/xyz` and pulls remote commits from `yuki`.

## AUTHOR

Written by Marco Aurelio &lt;<thecoreh@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
