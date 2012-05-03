<git-rebase-patch>(1) -- Rebases a patch
================================

## SYNOPSIS

`git-rebase-patch` &lt;patch-file&gt;

## DESCRIPTION

Given you have a patch that doesn't apply to the current HEAD, but you know it
applied to some commit in the past, `git-rebase-patch` will help you find that
commit and do a rebase.

## OPTIONS

  * &lt;patch-file&gt;:
     The patch to be applied.

## EXAMPLES

  Executing

    $ git rebase-patch test.patch

  could give you something like that:

    Trying to find a commit the patch applies to...
    Patch applied to dbcf408dd26 as 7dc8b23ae1a
    First, rewinding head to replay your work on top of it...
    Applying: test.patch
    Using index info to reconstruct a base tree...
    Falling back to patching base and 3-way merge...
    Auto-merging README.txt

  Then your last commit has the changes of the patch and is named *test.patch*.

## AUTHOR

Written by Niklas Fiekas &lt;<niklas.fiekas@tu-clausthal.de>&gt;

## REPORTING BUGS

&lt;<http://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<http://github.com/visionmedia/git-extras>&gt;
