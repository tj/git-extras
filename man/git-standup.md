git-standup(1) -- Recall the commit history
=================================

## SYNOPSIS

`git-standup` [-a author] [-m depth] [-d days ago] [-D date format] [-g] [-L] [-f]

`git-standup` -h

## DESCRIPTION

Recall what you did on the last working day ..or be nosy and find what someone else did.

## OPTIONS

-a author

The author of commits. Use "all" means specifying "all authors".
Defaults to `$(git config user.name)`.

-m depth

The depth of recursive directory search. Defaults to 1.

-L

Enable the inclusion of symbolic links in recursive directory search.

-d 1

The start of commit history. Defaults to 1, means "1 days ago".

-D relative

The date format displayed in commit history. Defaults to "relative".

-h

Display help message.

-g

Display if commit is GPG signed (G) or not (N) in commit message.

-f

Fetch the latest commits before showing commit history.

The former version of `git standup` accepted `<author> <since> <until>` as options.
This interface is deprecated now, and please avoid to use it!

## EXAMPLES

This shows your commits since yesterday:

    $ git standup

    a26d1f9 - add profile hook (69 minutes ago) <spacewander>

This shows the author's commits since last week:

    $ git standup -a spacewander -d 7

    a26d1f9 - add profile hook (70 minutes ago) <spacewander>
    4e19859 - fix getTotalSize return value error (6 days ago) <spacewander>
    36da84e - fix rename over bound (7 days ago) <spacewander>
    8e4182a - add watermark.png (7 days ago) <spacewander>
    46fef1d - use tinyXML to configure (7 days ago) <spacewander>

If current directory is not a git repo, git-standup will fetch data from all top-level git repos under it:

    $ cd ..
    $ git standup -a spacewander -d 7

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
