git-feature(1) -- Create/Merge feature branch
=======================================

## SYNOPSIS

`git-feature` [-a|--alias branch_prefix] [-r|--remote [remote_name]] [finish] &lt;name&gt;

## DESCRIPTION

  Create/Merge the given feature branch

## OPTIONS

  &lt;-a|--alias branch_prefix&gt;

  use `branch_prefix` instead of `feature`

  &lt;-r|--remote [remote_name]&gt;

  Setup a remote tracking branch using `remote_name`. If `remote_name` is not supplied, use `origin` by default.

  &lt;finish&gt;

  Merge and delete the feature branch.

  &lt;name&gt;

  The name of the feature branch.

## EXAMPLES

    $ git feature dependencies
    ...
    $ (feature/dependencies) git commit -m "Some changes"
    ...
    $ (feature/dependencies) git checkout master
    $ git feature finish dependencies

    $ git alias features "feature -a features"
    $ git features dependencies
    $ (features/dependencies) ...
    $ (features/dependencies) git checkout master
    $ git features finish dependencies

	$ git feature dependencies -r upstream

## AUTHOR

Written by Jesús Espino &lt;<jespinog@gmail.com>&gt;  
Modified by Mark Pitman &lt;<mark.pitman@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
