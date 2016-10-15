git-obliterate(1) -- rewrite past commits to remove some files
===============================

## SYNOPSIS

git obliterate &lt;files...&gt; [-- &lt;rev-list options...&gt;]

## DESCRIPTION

Completely remove some files from the repository, including past commits and tags. 
WARNING! This command will rewrite the history similar to `git rebase`(though it affects more). The rewritten history will have different object names for all the objects and will not converge with the original branch. So **avoid using it on commits that you shared**.
And it will mess up stash, so **don't have stash when you run `git obliterate`**.

## OPTIONS

You can pass rev-list options to indicate the range of commits affected. Those options need to be separated with '--' before them. Run `git help rev-list` to see the acceptable options.

## Examples

  Remove .secret from the repository:

    $ git obliterate .secret

  Remove .secret from commits between origin and feature:

    $ git obliterate .secret -- feature ^origin

  Remove .secret from commit abcdefg to commit 1234567

    $ git obliterate .secret -- abcdefg..1234567

## AUTHOR

Written by &lt;<brianloveswords@gmail.com>&gt;

## REPORTING BUG

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
