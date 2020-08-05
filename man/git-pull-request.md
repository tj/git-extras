git-pull-request(1) -- Create pull request for GitHub project
================================

## SYNOPSIS

`git-pull-request` [&lt;target branch&gt;]

## DESCRIPTION

Create pull request for a project on GitHub via command line.

Uses the email from `git config user.email` to open the pull request.

Personal access token is required for making API call to open the pull request. 

Makre sure the personal access token has the right `OAuth` scopes for the repo(s)

use `git config --global --add git-extras.personal-access-token <your-personal-access-token>`

if using mutiple accounts, override the global value in the specific repo using `git config git-extras.personal-access-token <other-acc-personal-access-token>`

## OPTIONS

&lt;target branch&gt;

The target branch you want to send pull request to.

## EXAMPLES

```
$ git pull-request master
Everything up-to-date

  create pull-request for spacewander/spacewander-toolbox 'master'

  title: test
  body:  
  base [master]: 
  GitHub two-factor authentication code (leave blank if not set up): 

...
```

## AUTHOR

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
