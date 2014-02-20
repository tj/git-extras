git-feature(1) -- Create feature branch
=======================================

## SYNOPSIS

`git-feature` [&lt;name&gt;]
`git-feature` [finish|fin|end|complete] &lt;name&gt;
`git-feature` [delete|del|remove|rm|clear] &lt;name&gt;

## DESCRIPTION

  Manage feature branch creation, deletion or merging back into integration branch. By default the master branch is considered the integration branch. 

  If the feature name is not given, then a list of feature branches will be displayed. 

## OPTIONS

  &lt;finish, fin, end, complete&gt;

  Merge and delete the feature branch.

  &lt;delete, del, remove, rm, clear&gt;

  Delete the feature branch from local and remote repositories.

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
