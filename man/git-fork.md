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
  2. rename the `origin` remote repo to `upstream`
  3. adds the forked repo as a remote called `origin`

  Remotes will use ssh if you have it configured with GitHub, if not, https will be used.

  Your Github settings can not be saved as git config values instead of
  specifying them each time. To enable this you need to execute a few git
  config commands like the following.

    $ git config --global git-extras.github.com.user greatcoder99

  Assuming that your username is 'greatcoder99'. All the configuration
  values are prefixed with 'git-extras.' followed by server hostname and
  then finally by the variable name (defined below).

  In addition, other Github instances may be used other than just
  github.com. So if you have a Github Enterprise instance, then using that
  hostname instead of github.com will work as expected.

  Variables that are currently supported:

    user: The username that the Github instance knows you as

    token: The personal access token that has been generated to allow
        password-less access to the API.

    add-api: In most cases this should be set to true. This adds the 'api'
        hostname to the repo location (i.e. github.com becomes api.github.com)
        to access the Github API. The time you would not set this is when
        your API hostname is the same as Github instance hostname.

    api-prefix: Github Enterprise much of the time uses "/api/v3/" as a
        entry point to the API. Regular Github access does not need to 
        have a prefix specified. Consult your Github administrator for 
        the correct prefix to use.

    use-ssh: Set to true in order to set the upstream remote reference
        to use SSH instead of https.

## EXAMPLE

  Create settings to prevent answering questions:

    $ git config --global git-extras.github.com.user bigdog
    $ git config --global git-extras.github.com.token d149feb47....
    $ git config --global git-extras.github.com.add-api true
    $ git config --global git-extras.github.com.use-ssl true

  Fork expect.js:

    $ git fork https://github.com/LearnBoost/expect.js

  or just:

    $ git fork LearnBoost/expect.js

  Then:

    $ ..<forks into your github profile and clones repo locally to expect.js dir>...

    $ cd expect.js && git remote -v

      origin          git@github.com:<user>/expect.js (fetch)
      origin          git@github.com:<user>/expect.js (push)
      upstream        git@github.com:LearnBoost/expect.js (fetch)
      upstream        git@github.com:LearnBoost/expect.js (push)

  If the current dir is a clone of expect.js, this has the same effect:

    $ git fork


## AUTHOR

Written by Andrew Griffiths &lt;<mail@andrewgriffithsonline.com>&gt;

Github Enterprise support and settings by Gerard Hickey &lt;<hickey@kinetic-compute.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
