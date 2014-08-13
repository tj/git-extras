git-refactor(1) -- Create refactor branch
=========================================

## SYNOPSIS

`git-refactor` [finish] &lt;name&gt;

## DESCRIPTION

  Create the given refactor branch

## OPTIONS

  &lt;finish&gt;

  Merge and delete the refactor branch.

  &lt;name&gt;

  The name of the refactor branch.

## EXAMPLES

    $ git refactor mainlib_refactor
    ...
    $ git commit -m "Some changes"
    ...
    $ git checkout master
    $ git refactor finish mainlib_refactor

## AUTHOR

Written by Jesús Espino &lt;<jespinog@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
