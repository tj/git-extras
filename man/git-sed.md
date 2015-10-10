git-sed(1) -- replace patterns in git-controlled files
======================================================

## SYNOPSIS

`git-sed` [ -c ] [ -f <flags> ] <search> <replacement>

## DESCRIPTION

Run git grep and then send results to sed for replacement with the
given flags, if -f is provided.

Also runs git commit if -c is provided.

## OPTIONS

  -c

  commit the resulting changes with a standard commit message
  detailing the exact command ran. will fail if there are unstaged
  changes.

  -f &lt;flags&gt;

  will use the given regex flags in the sed command (for example "g"
  replaces multiple times on the same line).

  &lt;search&gt;

  the pattern passed to grep and to the first part of the sed expression.

  &lt;replacement&gt;

  the replacement passed to sed, the second part of the sed expression.

## EXAMPLES

    $ git sed 'my_function' 'do_stuff'
    # ... only does the changes, without committing
    $ git commit -m"use proper function name"
    $ git sed -c 'do_stuff' 'stuff'
    # .. does the changes and a commit
    $ git sed -f g do_stuff stuff
    # .. g is actually pretty important, otherwise you will miss some
    # stuff!

## AUTHOR

Written by Antoine Beaupré &lt;<anarcat@debian.org>&gt; from
inspiration by https://github.com/da-x/git-search-replace and
http://stackoverflow.com/questions/9651898/is-there-a-git-sed-or-equivalent

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
