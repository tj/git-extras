git-from(1) -- create a new repo based on a template repo
=========================================================

## SYNOPSIS

`git-from` &lt;repo&gt; &lt;dir&gt;

## DESCRIPTION

`git-from` is an extension of git clone,
allowing you to create a new repo based on a template repo.


You can provide your `.git-from` file in the template repo and it will 
be runned once and deleted. `<dir>` will be passed as param.

## OPTIONS

  &lt;repo&gt;

  The (possibly remote) repository to clone from. 
  See this (section)[https://git-scm.com/docs/git-clone#URLS] for more information on specifying repositories.

  &lt;dir&gt;

  The name of a new directory to clone into.

## EXAMPLES

Example `.git-from`:

```
#!/bin/bash
git sed -f g template-repo $1
```

## AUTHOR

Written by Etay Cohen-Solal &lt;<dev@etcs.me>&gt; and Adam Mallul &lt;<ravemaker@hotmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;

