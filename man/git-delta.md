git-delta(1) -- Lists changed files
===================================

## SYNOPSIS

`git-delta` [&lt;branch&gt;] [&lt;filter&gt;]

## DESCRIPTION

Lists all files that differ from a branch. By default, lists files that have been added, copied, or modified as compared to the `master` branch.

## EXAMPLES

  Lists all modified and renamed files vs. `master`:

    $ git delta master MR

  Lists all deleted files vs. `example`:

    $ git delta example D

## AUTHOR

Written by Ivan Malopinsky &lt;<hello@imsky.co>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
