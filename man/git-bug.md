git-bug(1) -- Create bug branch
===============================

## SYNOPSIS

`git-bug` [-r|--remote [remote_name]] [finish] &lt;name&gt;

## DESCRIPTION

  Create the given bug branch

## OPTIONS

  &lt;-r|--remote [remote_name]&gt;

  Setup a remote tracking branch using `remote_name`. If `remote_name` is not supplied, use `origin` by default.

  &lt;finish&gt;

  Merge and delete the bug branch.

  &lt;-r

  &lt;name&gt;

  The name of the bug branch.

## EXAMPLES

    $ git bug bug-123456
    ...
    $ git commit -m "Some changes"
    ...
    $ git checkout master
    $ git bug finish bug-123456

	$ git bug -r 12345

## AUTHOR

Written by Jesús Espino &lt;<jespinog@gmail.com>&gt;  
Modified by Mark Pitman &lt;<mark.pitman@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
