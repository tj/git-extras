git-review(1) -- Review files changed since branch was created
==============================================================

## SYNOPSIS

`git-review` [&lt;branchname&gt;] [&lt;master&gt;]

## DESCRIPTION
Shows all the file changes thave have happened since a a branch was
created from it's master (parent) branch. This can be useful for code reviews
when you don't want to see the changes that have happened in master since the
branching took place.

## OPTIONS

  &lt;branchname&gt;    

  The branch to compare with the &lt;master branch&gt;. Defaults to the
  current branch.

  &lt;master&gt;

  The branch that the &lt;branchname&gt; was originally branched
  from. Defaults to master.

## EXAMPLES
  
Show changes in current branch since it was branched from master
    $ git review

Show changes in test branch since it was branched from master
    $ git review test

Show changes in hotfix1.1 branch since it was branched from v1.0
    $ git review hotfix1.1 v1.0

## AUTHOR
  
Written by Craig MacGregor &lt;<craigerm@gmail.com>&gt;

## REPORTING BUGS
  
&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;    

