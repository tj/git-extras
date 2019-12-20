git-root(1) -- show path of root
========================================

## SYNOPSIS

`git root` [OPTIONS]

## DESCRIPTION

print the path for the root directory of git repo

## OPTIONS

  -r, --relative

  show the relative path from root directory to current directory

## EXAMPLES


    $ cd .../git-extras/bin
    $ git root -r
    bin/
    $ git root
    /home/.../git-extras
    $ cd `git root`
    $ pwd
    /home/.../git-extras
    # then we can
    $ git add . && git commit

## AUTHOR

Written by spacewander &lt;<spacewanderlzx@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
