git-bug(1) -- Create bug branch
===============================

## SYNOPSIS

`git-bug` [finish] &lt;name&gt;

## DESCRIPTION

  Create the given bug branch

## OPTIONS

  &lt;finish&gt;

  Merge and delete the bug branch.

  &lt;name&gt;

  The name of the bug branch.

## EXAMPLES

    $ git bug bug-123456
    ...
    $ git commit -m "Some changes"
    ...
    $ git checkout master
    $ git bug finish bug-123456

## AUTHOR

Written by Jesús Espino &lt;<jespinog@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
