git-standup(1) -- Recall the commit history
=================================

## SYNOPSIS

`git-standup` [-a author] [-m depth] [-d days ago] [-D date format] [-g] [-L] [-f] [-B] [-n number of commits]  
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

-B

Display the commits in branch groups.

-n number-of-commits

Limit the number of commits displayed per group.
By default, the limitation is applied in the repository level. For example, if you
have 3 repositories under the current directory, `git standup ... -n 1` will
show you 3 commits at most.
When `-B` is  specific, the limitation is applied in the branch level. For instance,
if each of your 3 repositories have 2 branches, `git standup ... -B -n 1` will
display 6 commits at most.

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

By specifying the `-B` option, git-standuo will group the commits in branches:

    $ git standup -B -a spacewander -d 7

    git-summary-cleanup
    f788c78 - git-summary: clean up other shellcheck warnings (23 hours ago) <spacewander>
    3e8c3ab - git-summary: fix incorrect active days when commits range is given (23 hours ago) <spacewander>
    ff991ac - git-summary: remove useless result function. (23 hours ago) <spacewander>
    203f5b4 - git-summary: add --dedup-by-email to remove duplicate users (5 days ago) <spacewander>

    master
    203f5b4 - git-summary: add --dedup-by-email to remove duplicate users (5 days ago) <spacewander>

Note that the same commit can be seen in different branches.

## AUTHOR

Originally from https://github.com/kamranahmedse/git-standup

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
