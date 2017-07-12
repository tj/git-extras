git-create-branch(1) -- Create branches
=======================================

## SYNOPSIS

`git-create-branch` [-r|--remote [remote_name]] &lt;branchname&gt;

## DESCRIPTION

  Creates local branch named &lt;branchname&gt; and optionally sets up a remote tracking branch.

## OPTIONS

  &lt;-r|--remote [remote_name]&gt;

  Setup a remote tracking branch using `remote_name`. If `remote_name` is not supplied, use `origin` by default.

  &lt;branchname&gt;

  The name of the branch to create.

## EXAMPLES

    $ git create-branch integration

    $ git create-branch -r integration

    $ git create-branch -r upstream integration

## AUTHOR

Written by Jonhnny Weslley &lt;<jw@jonhnnyweslley.net>&gt;  
Modified by Mark Pitman &lt;<mark.pitman@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
