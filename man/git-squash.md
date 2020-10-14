git-squash(1) -- squash N last changes up to a ref'ed commit
=============================================

## SYNOPSIS

`git-squash` [&lt;--squash-msg&gt;] &lt;source-branch|commit ref&gt; [&lt;commit-message&gt;]

## DESCRIPTION

  Squash the N last changes in the current branch, where N is the range of commits from the given ref up to HEAD.

## OPTIONS

  &lt;source-branch&gt;

  Branch to squash on the current branch.

  &lt;commit reference&gt;
  A commit reference (has to be from the current branch) can also be used as the
  first argument. A range of commits <sha>..HEAD will be squashed.

  &lt;--squash-msg&gt;

  Commit the squash result with the concatenated squashed committed messages.
  This option can not be used together with &lt;commit-message&gt;.

  &lt;commit-message&gt;

  If commit-message is given, commit the squashed result, otherwise the squash remains just added to the index and is not committed.

## EXAMPLES

    # squash changes and follow up with separate commit step
    $ git squash my-other-branch
    Updating a2740f5..533b19c
    Fast-forward
    Squash commit -- not updating HEAD
     my-changed-file | 1 +
     1 file changed, 1 insertion(+)
    $ git commit -m "New commit without a real merge"

    # squash and commit with given message
    $ git squash HEAD~3 "Commit message"

    # squash and commit and concatenate all messages
    $ git squash --squash-msg @~3

## AUTHOR

Written by Jesús Espino &lt;<jespinog@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
