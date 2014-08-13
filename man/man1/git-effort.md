git-effort(1) -- Show effort statistics on file(s)
=================================

## SYNOPSIS

`git-effort` [--above &lt;value&gt;] [&lt;filename&gt;]

## DESCRIPTION

  Shows effort statistics about files in the repository.  

  Display includes:  
  - Commits: number of commits per file - highlighting files with most activity.  
  - Active days: total number of days which contributed modifications to this file.  

## OPTIONS

  --above &lt;value&gt;

  Ignore files with commits &lt;= a value.

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


## AUTHOR

Written by Leila Muhtasib &lt;<muhtasib@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;