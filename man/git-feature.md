git-feature(1) -- Create feature branch
=======================================

## SYNOPSIS

`git-feature` [finish|fin|end|complete] &lt;name&gt;
`git-feature` [delete|del|remove|rm|clear] &lt;name&gt;

## DESCRIPTION

  Create the given feature branch

## OPTIONS

  &lt;finish, fin, end, complete&gt;

  Merge and delete the feature branch.

  &lt;delete, del, remove, rm, clear&gt;

  Delete feature branch from local and remote repositories.

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
