git-dry-merge(1) -- dry run a merge
================================

## SYNOPSIS

`git-dry-merge` &lt;branchname&gt;

## DESCRIPTION

If an automatic merge would be successful it prints changes that would be made by merging &lt;branchname&gt; into the current branch.
If an automatic merge wouldn't be successful it prints the first file which
needs a manual merge.

## OPTIONS

&lt;branchname&gt;

The name of the branch to merge into the current branch.

## EXAMPLES

	$ git dry-merge master

## AUTHOR

Written by Willi Müller &lt;<willi@jups42.de>&gt;

Inspired by mipaldi's answer on stackoverflow (see: http://stackoverflow.com/questions/501407/).

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
