git-rename-remote(1) -- Rename a remote
=================================

## SYNOPSIS

`git-rename-remote` &lt;old-remote-name&gt; &lt;new-remote-name&gt;

## DESCRIPTION

  Rename a git remote regardless of name conflict, and then list current git remotes

## OPTIONS

  &lt;old-remote-name&gt;

  The name of the remote you want to rename.

  &lt;new-remote-name&gt;

  The new name of the remote.

## EXAMPLES

    $ git remote -v
    origin	git@myserver.com:myuser/foo.git (fetch)
    origin	git@myserver.com:myuser/foo.git (push)
    upstream	git@myserver.com:myuser/bar.git (fetch)
    upstream	git@myserver.com:myuser/bar.git (push)
    $ git-rename-remote upstream origin
    origin	git@myserver.com:myuser/bar.git (fetch)
    origin	git@myserver.com:myuser/bar.git (push)

## AUTHOR

Written by timfeirg &lt;<kkcocogogo@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
