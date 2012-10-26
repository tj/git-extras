git-review(1) -- Review files changed since branch was created
==============================================================

## SYNOPSIS
`git-review` [&lt;branchname&gt;] [&lt;master&gt;] [&lt;diffargs&gt;] 

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

  &lt;diffargs&gt;

  Any options that can be passed into "git diff" can be used here. For
  example to show a diff stat use the argument "--stat". The arguments must
  appear after &lt;branchname&gt; and &lt;master&gt; though.

## EXAMPLES
  
Show changes in current branch since it was branched from master
    $ git review

Show changes in test branch since it was branched from master
    $ git review test

Show changes in hotfix1.1 branch since it was branched from v1.0
    $ git review hotfix1.1 v1.0

Show changes but show as a diff stat
    $ git review --stat

Show changes but with only the file names
    $ git review --name-only

Show changes but with only the file names and status
    $ git review --name-status

## AUTHOR
  
Written by Craig MacGregor &lt;<craigerm@gmail.com>&gt;

## REPORTING BUGS
  
&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;    

