git-sync(1) -- Sync local branch with remote branch
=================================================================

## SYNOPSIS

  `git sync` [--soft] [--force] [ &lt;remote&gt; &lt;branch&gt; ]

## DESCRIPTION

  Sync local branch with &lt;remote&gt;/&lt;branch&gt;.
  
  When &lt;remote&gt; and &lt;branch&gt; are not specified on the command line, upstream of local branch will be used by default.
  
  All changes and untracked files and directories will be removed unless you add -s(--soft).

## OPTIONS

  --soft or -s

  Add this flag if you want to preserve untracked files.

  --force or -f

  Add this flag to disable interaction.


## EXAMPLES

  Sync local branch with its upstream

    $ git sync

  Sync local branch with origin/master

    $ git sync origin master

  Sync without cleaning untracked files:

    $ git sync -s origin master

  Sync without interaction:

    $ git sync -f

## AUTHOR

Written by Takuma Yamaguchi &lt;<kumon0587@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
