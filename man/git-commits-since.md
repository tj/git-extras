git-commits-since(1) -- Show commit logs since some date
========================================================

## SYNOPSIS

`git-commits-since` [-r|--ref &lt;ref&gt;] [&lt;date&gt;]

## DESCRIPTION

  List of commits since the given _date_ or _ref_.

## OPTIONS

  &lt;date&gt;

  Show commits more recent than &lt;date&gt;. By default, the command shows the commit logs since "last week".

  -r, --ref &lt;ref&gt;

  Show commits since the given ref (tag, branch, or commit). When specified, the command uses `ref..HEAD` instead of date-based filtering.

## EXAMPLES

  It is really flexible and these are only 3 of the options, go ahead give it a try:

    $ git commits-since yesterday
    aa084d9 TweeKane - Add global gitignore to git-ignore output
    515e94a TJ Holowaychuk - Merge pull request #128 from nickl-/git-extras-html-hyperlinks
    5f86b54 TJ Holowaychuk - Merge pull request #129 from nickl-/develop
    7398d10 nickl- - Fix #127 git-ignore won't add duplicates.

    $ git commits-since 3 o clock pm
    aa084d9 TweeKane - Add global gitignore to git-ignore output

    $ git commits-since 2 hour ago
    aa084d9 TweeKane - Add global gitignore to git-ignore output
    515e94a TJ Holowaychuk - Merge pull request #128 from nickl-/git-extras-html-hyperlinks
    5f86b54 TJ Holowaychuk - Merge pull request #129 from nickl-/develop

    $ git commits-since --ref 7.4.0
    6ed2643 John Bachir - ability to specify command when hitting enter (#1223)
    b9bd309 John Bachir - Improve `git-repl` prompt (#1224)
    6f4cf0c johnpyp - feat: `delete-branch` multiple unique branch names completions (#1221)
    ...
    215382b 罗泽轩 - Bump version to 7.5.0-dev (#1207)

## AUTHOR

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
