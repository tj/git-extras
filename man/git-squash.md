git-squash(1) -- Import changes form a branch
=============================================

## SYNOPSIS

`git-squash` &lt;source-branch&gt; [&lt;commit-message&gt;] 

## DESCRIPTION

  Produce the working tree and index state as if a real merge happened without
  the commit or merge marks.

## OPTIONS

  &lt;source-branch&gt;

  Branch to squash on the actual branch.

  &lt;commit-message&gt;

  If commit-message is given, commit the squash result and delete the source-branch.

## EXAMPLES

    $ git squash my-other-branch
    Updating a2740f5..533b19c
    Fast-forward
    Squash commit -- not updating HEAD
     my-changed-file | 1 +
     1 file changed, 1 insertion(+)
    $ git commit -m "New commit without a real merge"

## AUTHOR

Written by Jesús Espino &lt;<jespinog@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
