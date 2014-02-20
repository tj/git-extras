git-bug(1) -- Create bug branch
===============================

## SYNOPSIS

`git-bug` [&lt;name&gt;]
`git-bug` [finish|fin|end|complete] &lt;name&gt;
`git-bug` [delete|del|remove|rm|clear] &lt;name&gt;

## DESCRIPTION

  Manage bug branch creation, deletion or merging back into integration branch. By default the master branch is considered the integration branch. 

  If the bug branch name is not given, then a list of bug branches will be displayed. 

## OPTIONS

  &lt;finish, fin, end, complete&gt;

  Merge and delete the bug branch.

  &lt;delete, del, remove, rm, clear&gt;

  Delete the bug branch from local and remote repositories.

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
