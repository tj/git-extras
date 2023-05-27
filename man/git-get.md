git-get(1) -- Clone a Git repository under a configured directory
=================================================

## SYNOPSIS

`git-get`

## DESCRIPTION

  Clones a Git repository under the directory specified by the Git configuration `git-extras.get.clone-path`

## EXAMPLES

    $ git config --add git-extras.get.clone-path "$HOME/some-dir"
    $ git get 'https://github.com/hyperupcall/bake'
    Cloning into '/home/<user>/some-dir/bake'...
    remote: Enumerating objects: 1199, done.
    remote: Counting objects: 100% (378/378), done.
    remote: Compressing objects: 100% (174/174), done.
    remote: Total 1199 (delta 163), reused 357 (delta 146), pack-reused 821
    Receiving objects: 100% (1199/1199), 3.05 MiB | 9.85 MiB/s, done.
    Resolving deltas: 100% (515/515), done.
    $

## AUTHOR

Written by Edwin Kofler &lt;<edwin@kofler.dev>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
