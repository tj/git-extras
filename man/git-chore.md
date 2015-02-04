git-chore(1) -- Create chore branch
===============================

## SYNOPSIS

`git-chore` [finish] &lt;name&gt;

## DESCRIPTION

  Create the given chore branch

## OPTIONS

  &lt;finish&gt;

  Merge and delete the chore branch.

  &lt;name&gt;

  The name of the chore branch.

## EXAMPLES

    $ git chore chore-123456
    ...
    $ git commit -m "Some changes"
    ...
    $ git checkout master
    $ git chore finish chore-123456

## AUTHOR

Written by Chris Hall &lt;<christopher.k.hall@gmail.com>&gt; from bug/feature/refactor comamnds originally written by Jesús Espino &lt;<jespinog@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
