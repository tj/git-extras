git-summary(1) -- Show repository summary
=========================================

## SYNOPSIS

`git-summary` [--line] [--dedup-by-email] [&lt;committish&gt;]

## DESCRIPTION

Shows a summary of the repository.

## OPTIONS

  &lt;committish&gt;

  Summarize only the range of commits included in the &lt;committish&gt;.

  --dedup-by-email

  Remove duplicate authors who belong to the same email address.
  For example,

    $ git summary
    ...
    133  TJ Holowaychuk            9.9%
    115  Tj Holowaychuk            8.5%

    $ git summary --dedup-by-email
    ...
    248  TJ Holowaychuk            18.4%

  This option can not be used together with `--line`.

  --line

  Summarize with lines other than commits.
  Any &lt;committish&gt; is ignored when --line is specified.

## EXAMPLES

  Outputs a repo summary:

    $ git summary

    project  : express
    repo age : 10 months ago
    commits  : 1893
    active   : 93 days
    files    : 111
    authors  :
     1285 visionmedia
      478 Tj Holowaychuk
       48 Aaron Heckmann
       34 csausdev
       26 ciaranj
        6 Guillermo Rauch
        3 Nick Poulden
        2 Brian McKinney
        2 Benny Wong
        1 Justin Lilly
        1 James Herdman
        1 Adam Sanderson
        1 Viktor Kelemen
        1 Gregory Ritter
        1 Greg Ritter
        1 ewoudj
        1 isaacs
        1 Matt Colyer

  This command can also take a committish, and will print a summary for the range
  of commits included in the committish:

    $ git summary v42..

  Outputs a repo summary by line:

    $ git summary --line

    project  : git-extras
    lines    : 26820
    authors  :
      ...

  The committish is ignored when --line is specified.

## AUTHOR

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
