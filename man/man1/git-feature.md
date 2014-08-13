git-feature(1) -- Create feature branch
=======================================

## SYNOPSIS

`git-feature` [finish] &lt;name&gt;

## DESCRIPTION

  Create the given feature branch

## OPTIONS

  &lt;finish&gt;

  Merge and delete the feature branch.

  &lt;name&gt;

  The name of the feature branch.

## EXAMPLES

    $ git feature dependencies
    ...
    $ git commit -m "Some changes"
    ...
    $ git checkout master
    $ git feature finish dependencies

## AUTHOR

Written by Jesús Espino &lt;<jespinog@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
