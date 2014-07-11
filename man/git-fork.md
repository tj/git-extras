git-fork(1) -- Fork a repo on github
====================================

## SYNOPSIS

`git-fork` [&lt;github-repo-url&gt;]

## DESCRIPTION

  Fork the given github repo. Like clone but forks first.

  1. forks the repo on github
  2. clones the repo into the current dir
  3. adds the original repo as a remote

## EXAMPLE

  Fork expect.js:

    $ git fork https://github.com/LearnBoost/expect.js

  or just:

    $ git fork LearnBoost/expect.js

  Then:

    $ ..<forks into your github profile and clones repo locally to expect.js dir>...

    $ cd expect.js && git remote -v

      origin          git@github.com:<user>/expect.js (fetch)
      origin          git@github.com:<user>/expect.js (push)
      original        git@github.com:LearnBoost/expect.js (fetch)
      original        git@github.com:LearnBoost/expect.js (push)


## AUTHOR

Written by Andrew Griffiths &lt;<mail@andrewgriffithsonline.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
