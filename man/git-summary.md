git-summary(1) -- Show repository summary
=========================================

## SYNOPSIS

 `git-summary` [--dedup-by-email] [--no-merges] [&lt;committish&gt;]  
 `git-summary` --line [&lt;path&gt;]

## DESCRIPTION

Shows a summary of the repository or a path within it.

## OPTIONS

  &lt;committish&gt;

  Summarize only the range of commits included in the &lt;committish&gt;.

  &lt;path&gt;

  Summarize only the range of files included in the &lt;path&gt;.

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

  --no-merges

  Exclude merge commits.

  --line

  Summarize with lines other than commits.
  When `--line` is specified, the last argument is treated as &lt;path&gt;.

  This option can not be used together with `--dedup-by-email` or `--no-merges`.

  --output-style &lt;style&gt;

  Summarizes the repository and print the output accoring to the specified style. 
  Styles:
  * `tabular`: Prints the summary in a tabular form having a header in the 
               first line and the values in the second. Column separator is a `|` 
               sorrounded by at least one space on each side.
  * `oneline`: Prints the summary in a single line. Fields are separated by a `/`
               sorrounded by one space on each side.

  Some information like the authors cannot be displayed in this mode.

## EXAMPLES

  Outputs a repo summary:

    $ git summary

    project     : express
    repo age    : 10 months ago
    branch      : master
    last active : 3 weeks ago
    active on   : 93 days
    commits     : 1893
    files       : 111
    uncommitted : 3
    authors     :
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

  Filter with the path:

    $ git summary --line bin/

    project  : git-extras
    lines    : 4420
    authors  :
      ...

  Tabular summary

    $ git summary --output-style tabular
    # Repo     | Age       | Last active | Active on | Commits | Uncommitted | Branch
    git-extras | 13 years  | 7 hours ago | 807 days  | 1703    | 3           | master

  Oneline summary

    $ git summary --output-style oneline
    git-extras / age: 13 years / last active: 7 hours ago / active on 807 days / commits: 1703 / uncommitted: 3 / branch: master

## AUTHOR

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
