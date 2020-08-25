git-info(1) -- Returns information on current repository
================================

## SYNOPSIS

`git-info` [-c|--color] [--no-config]

## DESCRIPTION

Shows the following information about a repository:

 1. Remote Url(s)
 2. Remote Branches
 3. Local Branches
 4. Submodule(s) (if present)
 5. Most recent commit
 6. Configuration Info

## OPTIONS

  -c, --color

  Use color for information titles.

  --no-config

  Don't show list all variables set in config file, along with their values.

## GIT CONFIGS

  You could customize the Most recent commit and Configuration Info format via git config options

    $ git config --global --add git-extras.info.log "<log-command>"

  the default <log-command> is "git log --max-count=1 --pretty=short"

    $ git config --global --add git-extras.info.config-grep "<config-grep-command>"

  the default <config-grep-command> is "git config --list"

  For example,

   to set global configuration to show last commit subject, without sha1

     $ git config --global --add git-extras.info.log "git log --max-count=1 --format=\"Author: %an%nDate:   %ad (%ar)%n%n    %s\" --date=format:\"%Y-%m-%d %a %H:%M\""

   to set global configuration to show user's name and email

     $ git config --global --add git-extras.info.config-grep "git config --list | grep --color=never -E \"^user.name|^user.email\""

## EXAMPLES

Outputs info about a repo:

    $ git info

    ## Remote URLs:

    origin		git@github.com:sampleAuthor/git-extras.git (fetch)
    origin		git@github.com:sampleAuthor/git-extras.git (push)

    ## Remote Branches:

    origin/HEAD -> origin/master
    origin/myBranch

    ## Local Branches:

    myBranch
    * master

    ## Submodule(s):

      a234567 path2submodule1/submodule1 (branch/tag)
    + b234567 path2submodule2/submodule2 (branch/tag)
    - c234567 path2submodule3/submodule3 (branch/tag)
      e234567 path2submodule4/submodule4 (branch/tag)

    ## Most Recent Commit:

    commit e3952df2c172c6f3eb533d8d0b1a6c77250769a7
    Author: Sample Author <sampleAuthor@gmail.com>

    Added git-info command.

    ## Configuration (.git/config):

    color.diff=auto
    color.status=auto
    color.branch=auto
    user.name=Sample Author
    user.email=sampleAuthor@gmail.com
    core.repositoryformatversion=0
    core.filemode=true
    core.bare=false
    core.logallrefupdates=true
    core.ignorecase=true
    remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
    remote.origin.url=git@github.com:mub/git-extras.git
    branch.master.remote=origin
    branch.master.merge=refs/heads/master


## AUTHOR

Written by Leila Muhtasib &lt;<muhtasib@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
