git-browse(1) -- <View the web page for the current repository>
================================

## SYNOPSIS

`git-browse` [remote_name] [file_name] [line_1] [line_2]

## DESCRIPTION

Opens the current git repository website in your default web browser.

## OPTIONS

&lt;remote_name&gt;

The name of the remote you wish to browse to. Defaults to
the first remote if not specified.

&lt;file_name&gt;

The name of the file you wish to browse to.

&lt;line_1&gt;

The line number of the file you wish to browse to.

&lt;line_2&gt;

The line range (from &lt;line_1&gt; to &lt;line_2&gt;) of the file you wish to
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
