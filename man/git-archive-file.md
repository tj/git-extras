git-archive-file(1) -- Export the current HEAD of the git repository to an archive
===============================================

## SYNOPSIS

`git-archive-file` 

## DESCRIPTION

Export the current HEAD of the repository into an archive with an identifiable and unique name.

## OPTIONS

This command does not take any options.


## EXAMPLES

Archive naming conventions:

On any branch: `git-extras.1.7.0-110-gafefba7.branch-name.zip`

On master branch: `git-extras.1.7.0-110-gafefba7.zip`

On a detached HEAD (e.g. a tag): `git-extras.1.7.0.zip`

The '/' and '\\' in the branch name will be converted into '-'.

## AUTHOR

Written by Philipp Klose &lt;<me@thehippo.de>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
