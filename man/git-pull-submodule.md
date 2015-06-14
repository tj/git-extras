git-pull-submodule(1) -- Pull submodules
============================================

## SYNOPSIS

`git-pull-submodule` [OPTIONS] [&lt;path&gt;]

## DESCRIPTION

Pull submodule to latest version
    
## OPTIONS

  &lt;path&gt;

  The path of the submodule to pull. If no path is given, all submodules will be pulled.

  -m, --merge

  Merge the submodule. It is the default one if no option is given.

  -c, --checkout

  Checkout the submodule.

  -r, --rebase

  Rebase the submodule.

## EXAMPLES

    # checkout latest version of lib/abc
    $ git pull-submodule --checkout lib/abc 

    # merge latest version of lib/abc
    $ git pull-submodule lib/abc

## AUTHOR

Written by spacewander &lt;<spacewanderlzx@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;

