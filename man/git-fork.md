git-fork(1) -- Fork a repo on github
====================================

## SYNOPSIS

`git-fork` [&lt;github-repo-url&gt;]

## DESCRIPTION

  If a github repo url is given, fork the repo. Like clone but forks first.

  1. forks the repo on github
  2. clones the repo into the current dir
  3. adds the original repo as a remote called `upstream`

  If a url is not given and the current dir is a github repo, fork the repo.

  1. forks the current repo
  3. rename the `origin` remote repo to `upstream`
  3. adds the forked repo as a remote called `origin`

## EXAMPLE

  Fork expect.js:

    $ git fork https://github.com/LearnBoost/expect.js

  or just:

    $ git fork LearnBoost/expect.js

  Then:

    $ ..<forks into your github profile and clones repo locally to expect.js dir>...

    $ cd expect.js && git remote -v

      origin          https://github.com/<user>/expect.js (fetch)
      origin          https://github.com/<user>/expect.js (push)
      upstream        https://github.com/LearnBoost/expect.js (fetch)
      upstream        https://github.com/LearnBoost/expect.js (push)

  If the current dir is a clone of expect.js, this has the same effect:

    $ git fork


## AUTHOR

Written by Andrew Griffiths &lt;<mail@andrewgriffithsonline.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
