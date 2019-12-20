git-effort(1) -- Show effort statistics on file(s)
=================================

## SYNOPSIS

`git-effort` [--above &lt;value&gt;]  [&lt;path&gt;...] [-- [&lt;log options&gt;...]]

## DESCRIPTION

  Shows effort statistics about files in the repository.  

  Display includes:  
  - Commits: number of commits per file - highlighting files with most activity.  
  - Active days: total number of days which contributed modifications to this file.  

## OPTIONS

  --above &lt;value&gt;

  Ignore files with commits &lt;= a value.

  &lt;path&gt;...

  Only count commits that touches the given paths.

  Note: `git-effort` does not accept revision ranges, but the underlying `git log` does (See the examples).  

  &lt;log options&gt;...

  Options for `git log`. Note that you must use `--` to separate options to `git log`
  from options to `git effort`.
  This makes it possible to only count commits you are interested in.
  Not all options are relevant in the context of `git-effort`, but those that are is listed under the "Commit Limiting" section on the `git-log` manpages.

## EXAMPLES

 Note: Output will first appear unsorted, then the screen is cleared and the sorted
 list is output. The initial unsorted list is not shown in the examples for brevity.

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


    $ git effort --above 5 bin/* -- --after="one year ago" --author="Leila Muhtasib"

      file                                          commits    active days

      git-extras                                    15         12
      git-release                                   6          4
      git-effort                                    6          2
      git-ignore                                    4          4
      git-changelog                                 3          2
      git-graft                                     2          2

 Showing statistics on directories is also possible:

    $ git effort bin man -- --after="one year ago"

      file                                          commits    active days

      bin.......................................... 406        232
      man.......................................... 118        80

 Only count commits in the specified revision range:

   $ git effort -- master..feature

      file                                          commits    active days

      bin/git-effort............................... 3          2
      man/git-effort.md............................ 1          1


## AUTHOR

Written by Leila Muhtasib &lt;<muhtasib@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
