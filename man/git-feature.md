# git-feature(1) -- Create/Merge feature branch

## SYNOPSIS

`git-feature` [-a|--alias branch_prefix] [-s|--separator branch_separator] [-r|--remote [remote_name]] &lt;name&gt;  
`git-feature` [-a|--alias branch_prefix] [-s|--separator branch_separator] finish [--squash] &lt;name&gt;

## DESCRIPTION

Create/Merge the given feature branch

## OPTIONS

&lt;-a|--alias branch_prefix&gt;

The branch prefix to use. If `branch_prefix` is not supplied, use the git configuration `git-extras.feature.prefix` or `feature` by default.

&lt;-s|--separator branch_separator&gt;

The separator to use for joining the branch prefix and the branch name. If `branch_separator` is not supplied, use the git configuration `git-extras.feature.separator` or `/` by default.

&lt;-r|--remote [remote_name]&gt;

Setup a remote tracking branch using `remote_name`. If `remote_name` is not supplied, use `origin` by default.

&lt;--from [start_point]&gt;

Setup a start point when the branch created. If `--from` is not supplied, use the current branch by default.

&lt;finish&gt;

Merge and delete the feature branch.

&lt;--squash&gt;

Run a squash merge.

&lt;name&gt;

The name of the feature branch.

## EXAMPLES

- Start a new feature:

  $ git feature dependencies  
  ...  
  $ (feature/dependencies) git commit -m "Some changes"

- Finish a feature with --no-ff merge:

  $ (feature/dependencies) git checkout master  
  $ git feature finish dependencies

- Finish a feature with --squash merge:

  $ (feature/dependencies) git checkout master  
  $ git feature finish --squash dependencies

- Publish a feature upstream:

  $ git feature dependencies -r upstream

- Use custom branch prefix:

  $ git alias features "feature -a features"  
  $ git features dependencies  
  $ (features/dependencies) ...  
  $ (features/dependencies) git checkout master  
  $ git features finish dependencies

- Use custom branch separator:

  $ git feature -s - dependencies  
  $ (feature-dependencies) ...  
  $ (feature-dependencies) git checkout master  
  $ git feature -s - finish dependencies

## AUTHOR

Written by Jesús Espino &lt;<jespinog@gmail.com>&gt;  
Modified by Mark Pitman &lt;<mark.pitman@gmail.com>&gt;  
Modified by Carlos Prado &lt;<carlos.prado@cpradog.com>&gt;  
Modified by Austin Ziegler &lt;<halostatue@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
