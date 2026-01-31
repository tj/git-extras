git-commits-since(1) -- Show commit logs since some date
========================================================

## SYNOPSIS

`git-commits-since` [&lt;date&gt;]

## DESCRIPTION

  List of commits since the given _date_.

## OPTIONS

  &lt;date&gt;

  Show commits more recent than <date>. By default, the command shows the commit logs since "last week".

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


## AUTHOR

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
