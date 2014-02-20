git-refactor(1) -- Create refactor branch
=========================================

## SYNOPSIS

`git-refactor` [finish] &lt;name&gt;

## DESCRIPTION

  Manage refactor branch creation, deletion or merging back into integration branch. By default the master branch is considered the integration branch. 

  If the bug branch name is not given, then a list of refactor branches will be displayed. 

## OPTIONS

  &lt;finish, fin, end, complete&gt;

  Merge and delete the refactor branch.

  &lt;delete, del, remove, rm, clear&gt;

  Delete the refactor branch from local and remote repositories.

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
