git-changelog(1) -- Generate the changelog report
=================================================

## SYNOPSIS

`git-changelog` [-l, --list]

## DESCRIPTION

  Populates the file named matching _change|history -i_ with the commits since the previous tag or since the project began when no tags are present. Opens the changelog in **$EDITOR** when set.

## OPTIONS

  -l, --list

  Show commit logs from the current version.

  --no-merges

  Filters out merge commits (commits with more than 1 parent) from generated changelog.

## EXAMPLES

  * Updating changelog file:

    $ git changelog

  * Listing commits from the current version:

    $ git changelog --list

    * Docs for git-ignore. Closes #3
    * Merge branch 'ignore'
    * Added git-ignore
    * Fixed &lt;tag&gt; in docs
    * Install docs
    * Merge branch 'release'
    * Added git-release
    * Passing args to git shortlog
    * Added --all support to git-count
    * Initial commit

## AUTHOR

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
