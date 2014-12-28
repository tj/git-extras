git-scp(1) -- Copy files to SSH compatible `git-remote`
=======================================================

## SYNOPSIS

    `git scp` -h|help|?
    `git scp` <remote> [<commits>...|<path>...]
    `git rscp` <remote> <path>

## DESCRIPTION

A convenient way to copy files from the current working tree to the working directory of a remote repository. If a `<commits>...` is provided, only files that has changed within the commit range will be copied.

Internally this script uses `rsync` and not `scp` as the name suggests. 

`git-rscp` - The reverse of `git-scp`. Copies specific files from the working directory of a remote repository to the current working directory.

## OPTIONS

  &lt;remote&gt;

    The git remote where you want to copy your files.

  &lt;commits&gt;...

    Any commit, commit range or tree. Uses `git-diff`(1)

  &lt;path&gt;...

    The <paths> parameters, when given, are used to limit the diff to the named paths (you can give directory names and get diff for all files under them).

## GIT CONFIGS

 To sanitize files using `dos2unix` before copying files

    $ git config --global --add extras.scp.sanitize dos2unix

 You can run the files through PHP lint (i.e. `php -l`) before copying files

    $ git config --global --add extras.scp.sanitize php_lint

## EXAMPLES

 Make sure you have `git-remote`(1) setup

    $ git remote add staging myStagingServer:/var/www/html

 Copy unstaged files to remote. Useful when you want to make quick test without making any commits

    $ git scp staging

 Copy staged and unstaged files to remote

    $ git scp staging HEAD

 Copy files that has been changed in the last commit, plus any staged or unstaged files to remote

    $ git scp staging HEAD~1

 Copy files that has been changed between now and a tag

    $ git scp staging v1.2.3

 Copy specific files

    $ git scp staging index.html .gitignore .htaccess

 Copy specific directory

    $ git scp staging js/vendor/

 Copy files from specific directory to multiple servers

    $ for dest in web1 web2 web3; do
        git diff --name-only 4.8.3 4.8.2 app/code/community app/design skin/ | xargs git scp $dest
    done;

## AUTHOR

Written by Chern Jie &lt;<lim@chernjie.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/chernjie/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
