git-missing(1) -- Show commits missing from another branch
=========================================================

## SYNOPSIS

`git-missing` [&lt;first branch&gt;] &lt;second branch&gt; [&lt;git log options&gt;]

## DESCRIPTION

  Shows commits that are in either of two branches but not both.  Useful for
  seeing what would come across in a merge or push.

## OPTIONS

  [&lt;first branch&gt;]

  First branch to compare.  If not specified, defaults to currently checked out branch.

  &lt;second branch&gt;

  Second branch to compare.

  [&lt;git log options&gt;]

  Any flags that should be passed to 'git log', such as --no-merges.

## EXAMPLES

  Show commits on either my current branch or master but not both:

    $ git missing master
    < d14b8f0 only on current checked out branch
    > 97ef387 only on master

  Show commits on either branch foo or branch bar but not both:

    $ git missing foo bar
    < b8f0d14 only on foo
    > f38797e only on bar

## AUTHOR

Written by Nate Jones &lt;<nate@endot.org>&gt;

## REPORTING BUGS

&lt;<http://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<http://github.com/visionmedia/git-extras>&gt;
