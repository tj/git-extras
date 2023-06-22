git-fork(1) -- Fork a repo on github
====================================

## SYNOPSIS

`git-fork` [&lt;github-repo-url&gt;]

## DESCRIPTION

  If a GitHub repo URL is given, the command forks the specified repository. It performs the following actions:

  1. Forks the repo on GitHub.
  2. Clones the repo into the current directory or the one specified with `d` or `--target-dir`.
  3. Adds the original repo as a remote called `upstream`.

  If a URL is not provided and the current directory is a GitHub repository, the command forks the current repo. 
  It performs the following actions:

  1. Forks the current repo
  2. Renames the `origin` remote repo to `upstream`
  3. Adds the forked repo as a remote called `origin`

  Remotes will use SSH if you have it configured with GitHub. Otherwise, HTTPS will be used.

  To create a fork of a project on GitHub via the command line, a personal access token is required. 

  The token is used for making the API call to create the fork on GitHub.

  Refer to the [GitHub API Documentation](https://docs.github.com/en/rest/reference/repos#forks) for more information.

  Make sure that the personal access token has the necessary OAuth scopes for the repository. 

  You can configure the token by issuing the command:

  `git config --global --add git-extras.github-personal-access-token <your-personal-access-token>`. 

  If you have multiple GitHub accounts and need to override the global token for a specific repository, use the command:

  `git config git-extras.github-personal-access-token <other-acc-personal-access-token>`.

## OPTIONS

The following options are available:

- `-h`, `--help`: Print the help message and usage information.
- `-c`, `--current`: Use the URL of the current Git repository as the source.
- `-t`, `--token <token>`: Specify the GitHub personal access token.
- `-d`, `--target-dir <directory>`: Specify the target directory for cloning the forked repository.

## EXAMPLES

  Fork expect.js:

    $ git fork https://github.com/LearnBoost/expect.js

  or just:

    $ git fork LearnBoost/expect.js

  Then, the forked repository will be cloned into the `expect.js` directory locally. You can navigate to the directory and check the remotes:

    $ cd expect.js && git remote -v

      origin          git@github.com:<user>/expect.js (fetch)
      origin          git@github.com:<user>/expect.js (push)
      upstream        git@github.com:LearnBoost/expect.js (fetch)
      upstream        git@github.com:LearnBoost/expect.js (push)

  If the current dir is a clone of expect.js, this has the same effect:

    $ git fork


## AUTHORS

Written by Andrew Griffiths &lt;<mail@andrewgriffithsonline.com>&gt;
Co-authored by Marcelina Hołub &lt;<mholub@tutanota.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
