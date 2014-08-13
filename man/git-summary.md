git-summary(1) -- Show repository summary
=========================================

## SYNOPSIS

`git-summary` [&lt;commitish&gt;] [--line]

## DESCRIPTION

Shows a summary of the repository.

## OPTIONS

  &lt;commitish&gt;
  
  Summarize only the range of commits included in the &lt;commitish&gt;.

  --line

  Summarize with lines other than commits

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

  This command can also take a commitish, and will print a summary for the range
  of commits included in the commitish:

    $ git summary v42..

## AUTHOR

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
