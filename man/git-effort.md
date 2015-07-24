git-effort(1) -- Show effort statistics on file(s)
=================================

## SYNOPSIS

`git-effort` [--above &lt;value&gt;] [&lt;options&gt;] [&lt;filename&gt;]

## DESCRIPTION

  Shows effort statistics about files in the repository.  

  Display includes:  
  - Commits: number of commits per file - highlighting files with most activity.  
  - Active days: total number of days which contributed modifications to this file.  

## OPTIONS

  --above &lt;value&gt;

  Ignore files with commits &lt;= a value.

  Run  
  man -P 'less +/Commit\ Limiting' git-log  
  to read about options to limit which commits are counted.  

  Note: `git-effort` does not accept commit ranges.  

  &lt;filename&gt;

  Only display effort statistics for a specific filename.

## EXAMPLES

 Displays "effort" statistics:

    $ git effort --above 5

      file                                          commits    active days

      git-extras                                    26         18
      git-release                                   13         13
      git-effort                                    13         2
      git-ignore                                    11         7
      git-changelog                                 11         8
      git-graft                                     9          6
      git-summary                                   8          6
      git-delete-branch                             8          6
      git-repl                                      7          5


    $ git effort --after="one year ago" --above 5 --author="Leila Muhtasib"

      file                                          commits    active days

      git-extras                                    15         12
      git-release                                   6          9
      git-effort                                    6          2
      git-ignore                                    4          4
      git-changelog                                 3          5
      git-graft                                     2          3

## AUTHOR

Written by Leila Muhtasib &lt;<muhtasib@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
