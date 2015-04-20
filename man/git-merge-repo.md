git-merge-repo(1) -- Merge two repo histories
=============================================

## SYNOPSIS

`git-merge-repo` &lt;repo&gt; &lt;branch&gt; &lt;directory&gt; [--squash]

## DESCRIPTION

Merges a repository's history with the current repository, inside a specified directory.

Optional `--squash` flag skips the full history and generates only one commit for the merge.

## EXAMPLES

  Merges a local repo's `frontend` branch into the current repo's `web` folder:

    $ git merge-repo ../app/.git frontend web

  Merges a remote repo's `master` branch into the current repo's folder:

    $ git merge-repo git@github.com:tj/git-extras.git master .

## AUTHOR

Written by Ivan Malopinsky &lt;<hello@imsky.co>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
