git-adopt(1) -- Move each file into repo and symlink it back in place
================================

## SYNOPSIS

`git adopt` [-d] &lt;pkg&gt; &lt;files&gt;...

## DESCRIPTION

For each file specified:

1. Move it to the pkg folder inside a repo
2. Create a symlink pointing to that
3. Commit the new files.

Any necessary subfolders will also be created automatically.

## OPTIONS

  -d

   Dry run - output shell commands instead of executing.

## EXAMPLES

```
# Minimal setup
git init -b `whoami`@`hostname` .dotfiles
git adopt -d bash .bashrc
git adopt bash .bashrc
```

## GIT CONFIGS

You can customize the adoption repo and target directories via git config options

    $ git config --global add adopt.repo <repo>

The default repo path is `$HOME/.dotfiles`.

    $ git config --global add adopt.target <target>

The default target is `$HOME`.

Of course, the user's git config is itself a file that can be tracked via `git-adopt`:

    $ git adopt git .config/git/config

## AUTHOR

Written by Neal Fultz <nfultz@gmail.com>.

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
&lt;<https://dotfiles.github.io/>&gt;
stow(8)
