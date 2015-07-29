git-pstash(1) -- public stash
=============================

## SYNOPSIS

- `git-pstash` [save [&lt;stash-name&gt;]]
- `git-pstash` apply &lt;stash-name&gt;
- `git-pstash` drop &lt;stash-name&gt;
- `git-pstash` pop &lt;stash-name&gt;
- `git-pstash` show &lt;stash-name&gt;
- `git-pstash` list [search-substring]

## DESCRIPTION

  Stashes your changes using built-in 'git stash create' and pushes it to remote.
  In contrast to 'git stash' it keeps your working directory untouched upon stashing.
  Its stash namespace doesn't clash anyhow with built-in 'git stash', all references are kept under refs/pstash/.

## OPTIONS

  &lt;stash-name&gt;

  Custom stash name. It's set to ${USER}_${branch_name}_wip by default.

## EXAMPLES

    $ git pstash
    $ git pstash save
    $ git pstash save jack_master_wip
    $ git pstash apply jack_master_wip
    $ git pstash drop jack_master_wip
    $ git pstash pop jack_master_wip
    $ git pstash show jack_master_wip
    $ git pstash list
    $ git pstash list jack

## AUTHOR

Written by Igor Ostapenko &lt;<igor.ostapenko@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
