git-refactor(1) -- Create refactor branch
=========================================

## SYNOPSIS

`git-refactor` [-r|--remote [remote_name]] [finish] &lt;name&gt;

## DESCRIPTION

  Create the given refactor branch

## OPTIONS

  &lt;-r|--remote [remote_name]&gt;

  Setup a remote tracking branch using `remote_name`. If `remote_name` is not supplied, use `origin` by default.

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

	$ $ git refactor -r upstream mainlib_refactor

## AUTHOR

Written by Jesús Espino &lt;<jespinog@gmail.com>&gt;  
Modified by Mark Pitman &lt;<mark.pitman@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
