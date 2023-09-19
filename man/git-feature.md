# git-feature(1) -- Create/Merge feature branch

## SYNOPSIS

`git-feature` [-a|--alias <PREFIX>] [-s|--separator <SEPARATOR>] [-r|--remote [REMOTE_NAME]] [--from START_POINT] <NAME>...

`git-feature` [-a|--alias <PREFIX>] [-s|--separator <SEPARATOR>] finish [--squash] <NAME>...

## DESCRIPTION

Create or merge the given feature branch. The feature branch name is made from the <PREFIX>, the <SEPARATOR>, and the <NAME> joined together.

The default <PREFIX> is `feature` and <SEPARATOR> is `/`, which can be changed (see OPTIONS and GIT CONFIG for details).

The branch <NAME> may be specified as multiple words which will be joined with `-`. If the branch name contains the word `finish` or is another OPTION, `--` should be passed to stop OPTION parsing. See the EXAMPLES for details.

## OPTIONS

- `-a` <PREFIX>, `--alias` <PREFIX>:

  The branch prefix to use, or `feature` if not supplied.

- `-s` <SEPARATOR>, `--separator` <SEPARATOR>:

  The separator to use for joining the branch prefix and the branch name, or `/` if not supplied.

- `-r` [REMOTE_NAME], `--remote` [REMOTE_NAME]:

  Setup a remote tracking branch using `remote_name`. If `remote_name` is not supplied, use `origin` by default.

- `--from` START_POINT:

  Setup a start point when the branch created. If `--from` is not supplied, use the current branch by default. This option will be ignored when `finish`ing a branch.

- `finish`:

  Merge and delete the feature branch.

- `--squash`:

  Run a squash merge when `finish`ing the feature branch.

- <NAME>:

  The name of the feature branch.

## GIT CONFIG

You can configure the default branch prefix and separator via git config options.

- `git-extras.feature.prefix`:

    $ git config --global add git-extras.feature.prefix "prefix"

- `git-extras.feature.separator`:

    $ git config --global add git-extras.feature.separator "-"

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

- Use custom branch prefix and separator from git config with multiple words:

  $ git config --global --add git-extras.feature.prefix "features"  
  $ git config --global --add git-extras.feature.separator "."  
  $ git feature dependency tracking  
  $ (features.dependency-tracking) ...  
  $ (features.dependency-tracking) git checkout master  
  $ git feature finish dependency tracking

- Use a `git-feature` option or the `finish` command as part of a branch name:

  $ git feature -- finish remote  
  ...  
  $ (feature/finish-remote) git commit -m "Some changes"
  $ (feature/finish-remote) git checkout main
  $ git feature finish -- finish remote

## AUTHOR

Written by Jesús Espino &lt;<jespinog@gmail.com>&gt;  
Modified by Mark Pitman &lt;<mark.pitman@gmail.com>&gt;  
Modified by Carlos Prado &lt;<carlos.prado@cpradog.com>&gt;  
Modified by Austin Ziegler &lt;<halostatue@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;, git-create-branch(1), git-delete-branch(1)
