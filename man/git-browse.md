git-browse(1) -- View the web page for the current repository
================================

## SYNOPSIS

`git-browse` [REMOTE-NAME] [FILE-NAME] [LINE-1] [LINE-2]

## DESCRIPTION

Opens the current git repository website in your default web browser.

## OPTIONS

REMOTE-NAME

The name of the remote you wish to browse to. Defaults to
the first remote if not specified.

FILE-NAME

The name of the file you wish to browse to.

LINE-1

The line number of the file you wish to browse to.

LINE-2

The line range (from LINE-1 to LINE-2) of the file you wish to
browse to.

## EXAMPLES

  $ git browse

  $ git browse upstream

  $ git browse upstream bin/git-browse

  $ git browse upstream bin/git-browse 42

  $ git browse upstream bin/git-browse 1 42

## AUTHOR

Written by Mark Pitman &lt;<https://github.com/mapitman>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
