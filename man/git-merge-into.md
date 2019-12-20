git-merge-into(1) -- Merge one branch into another
=================================

## SYNOPSIS

`git merge-into` [src] &lt;dest&gt; [--ff-only]

## DESCRIPTION

Merge one branch into another, and keep yourself on current branch. If src branch not given, it will merge current one to dest.

## OPTIONS
  
  &lt;src&gt;

  The name of the branch will be merged into. If this not given, use current branch as default.

  &lt;dest&gt;

  The name of the branch to merge into.

  --ff-only

  Refuse to merge and exit with a non-zero status unless the current HEAD is
  already up-to-date or the merge can be resolved as a fast-forward.


## EXAMPLES

Assume the following history exists and the current branch is src:

                     A---B---C src(current)
                    /
               D---E---F---G dest

After running `git merge-into dest`, it will look like this:

                    A---B---C src(current)
                    /         \
               D---E---F---G---H dest

The `H` commit will record the merge result, just like what `git merge` does.
And `src` is still the current branch.

The default implementation of `merge-into` use `git checkout` and `git merge`, 
which may cause temporary change in the working tree. If you make sure your 
branch can be merged fast-forward, add `--ff-only` to avoid files change.

## AUTHOR

Written by spacewander &lt;<spacewanderlzx@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
