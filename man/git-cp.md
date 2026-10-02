git-cp(1) -- Copy a file keeping its history
============================================

## SYNOPSIS

`git-cp` [--commit-template &lt;template&gt;] &lt;current_filename&gt; &lt;destination_filename&gt;

## DESCRIPTION

Copy a file keeping its git history. This allows merge conflict handling.

Use `--commit-template` to customize each of the three commits created by the copy. Every `{}` in the template is replaced with the default commit message, so text can be added before or after it. The default template is `{}`, which leaves commit messages unchanged.

## EXAMPLES

  Copy README into README.txt

    $ git cp README README.txt

  Associate the copy commits with issue #1252

    $ git cp --commit-template '#1252 {}' README README.txt

  Append a trailer to the copy commits

    $ git cp --commit-template '{} [skip ci]' README README.txt

## AUTHOR

Written by Rémy Hubscher &lt;<hubscher.remy@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;

&lt;<https://stackoverflow.com/questions/16937359/git-copy-file-preserving-history/44036771#44036771>&gt;
