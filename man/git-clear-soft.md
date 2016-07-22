git-clear-soft(1) -- Soft clean up a repository
================================================

## SYNOPSIS

`git-clear-soft`

## DESCRIPTION

  Clears the repository to a state that it looks as if it was freshly cloned
  with the current HEAD, however, preserving all changes that are located in files and directories listed in .gitignore. It is a git-reset --hard together with
  deletion of all untracked files that reside inside the working directory, excluding those in .gitignore.

## EXAMPLES

  Clears the repo.

    $ git clear-soft

## AUTHOR

Modified version of script written by Daniel 'grindhold' Brendle &lt;<grindhold@gmx.net>&gt; by Matiss Treinis &lt;<mrtreinis@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
