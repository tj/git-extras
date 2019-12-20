git-clear(1) -- Rigorously clean up a repository
================================================

## SYNOPSIS

`git-clear`

## DESCRIPTION

  Clears the repository to a state that it looks as if it was freshly cloned
  with the current HEAD. Basically it is a git-reset --hard together with
  deletion of all untracked files that reside inside the working directory, including those in .gitignore.

## EXAMPLES

  Clears the repo.

    $ git clear

## AUTHOR

Written by Daniel 'grindhold' Brendle &lt;<grindhold@gmx.net>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
