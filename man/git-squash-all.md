git-squash-all(1) -- Compress changes in a branch
=============================================

## SYNOPSIS

`git-squash-all` &lt;master-branch&gt; [&lt;commit-message&gt;]

## DESCRIPTION

  Take all commits in a branch, compress them into _one_ commit on top of the `master-branch`.

## OPTIONS

  &lt;master-branch&gt;

  Branch to squash-all commits on top of.

  &lt;commit-message&gt;

  If commit-message is given, commit will be executed automatically and message will be prepended to the default summary (all commit summaries of squashed commits).

## EXAMPLES

    $ git squash-all master
    Switched to a new branch 'tmp.1OSwoYazcoc7Df'
    Switched to and reset branch 'dev/my.feature'
    [dev/my.feature 97b70be] Added abc. Added def.
     0 files changed
     create mode 100644 abc
     create mode 100644 def
    Deleted branch tmp.1OSwoYazcoc7Df (was ade0637).

## AUTHOR

Written by Todd Wolfson &lt;<todd@twolfson.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
