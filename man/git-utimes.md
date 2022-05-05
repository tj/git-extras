git-utimes(1) -- Change files modification time to their last commit date
=========================================================================

## SYNOPSIS

`git-utimes` [--newer]

## DESCRIPTION

  Change files modification time to their last commit date. Does not touch files that are in the working tree or index.

## OPTIONS

  --newer

  Preserves the original modification time of files that were committed from the local repo, by only touching files that are newer than their last commit date.

## EXAMPLES

  * Update all files' modification time to their last commit date, except those in working tree or index:

    $ git utimes

  * As above, but preserve original modification time of files that were committed from local repo:

    $ git utimes --newer

## AUTHOR

Written by Vitaly Chikunov &lt;<vt@altlinux.org>&gt;, inspired by Stackexchange comments. Updated by Bill Wood &lt;<wpwoodjr@gmail.com>&gt; to add `--newer` flag and ignore files in the working tree or index.

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
