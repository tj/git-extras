git-get(1) -- Clone a Git repository under a configured directory
=================================================

## SYNOPSIS

`git get` [--nested] &lt;url&gt;

## DESCRIPTION

  Clones a Git repository under the directory specified by the Git configuration `git-extras.get.clone-path`

  By default, the repository is cloned under `<clone-path>/<repo-name>`. With the `--nested` option, the repository URL is parsed and the repository is cloned under `<clone-path>/<host>/<owner>/<repo>` instead. Supported URL formats for `--nested`:

      https://github.com/owner/repo
      git@github.com:owner/repo

  If `--nested` is given and the URL cannot be parsed, an error is printed and the command exits.

  When parsing the URL, userinfo (`user@`) and the port are stripped from the host, so `https://user:secret@example.com:8443/owner/repo` is cloned under `<clone-path>/example.com/owner/repo`. Note that this means repositories served from the same host on different ports map to the same directory.

## OPTIONS

  * `--nested`:
    Clone the repository under `<clone-path>/<host>/<owner>/<repo>`, derived from the structure of the repository URL.

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

    $ git get --nested 'https://github.com/hyperupcall/bake'
    Cloning into '/home/<user>/some-dir/github.com/hyperupcall/bake'...
    ...

## AUTHOR

Written by Edwin Kofler &lt;<edwin@kofler.dev>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
