git-standup(1) -- Recall the commit history
=================================

## SYNOPSIS

`git-standup` [&lt;full name&gt;] [&lt;since&gt;] [&lt;until&gt;]

## DESCRIPTION

Recall what you did on the last working day ..or be nosy and find what someone else did.

## OPTIONS

&lt;full name&gt;

The author of commits. Defaults to `$(git config user.name)`.

&lt;since&gt;

The start of commit history. Defaults to `yesterday`.

&lt;until&gt;

The end of commit history. Defaults to `today`.

## EXAMPLES

This shows your commits since yesterday:

    $ git standup

    a26d1f9 - add profile hook (69 minutes ago) <spacewander>

This shows the author's commits since last week:

    $ git standup spacewander "last week"

    a26d1f9 - add profile hook (70 minutes ago) <spacewander>
    4e19859 - fix getTotalSize return value error (6 days ago) <spacewander>
    36da84e - fix rename over bound (7 days ago) <spacewander>
    8e4182a - add watermark.png (7 days ago) <spacewander>
    46fef1d - use tinyXML to configure (7 days ago) <spacewander>

If current directory is not a git repo, git-standup will fetch data from all top-level git repos under it:

    $ cd ..
    $ git standup spacewander "last week" yesterday

    someProject/
    4e19859 - fix getTotalSize return value error (6 days ago) <spacewander>
    36da84e - fix rename over bound (7 days ago) <spacewander>
    8e4182a - add watermark.png (7 days ago) <spacewander>
    46fef1d - use tinyXML to configure (7 days ago) <spacewander>


## AUTHOR

Originally from https://github.com/kamranahmedse/git-standup

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
