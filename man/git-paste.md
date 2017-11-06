git-paste(1) -- Send patches to pastebin for chat conversations
===============================================================

## SYNOPSIS

`git-paste` &lt;git format-patch options&gt;

## DESCRIPTION

  Send patches to pastebin for chat conversations using pastebinit.
  The syntax highlighting will be set to 'diff'.

## OPTIONS

  &lt;git format-patch options&gt;

  All options are passed directly to `git format-patch`.
  Given no arguments, `git-paste` passes `@{u}` to `git format-patch`.

## CONFIGURATION

  The pastebinit software chooses the most appropriate pastebin site
  for your operating system and the [pastebinit documentation](https://manpages.debian.org/pastebinit)
  contains details of how to configure it to use a different site.

## EXAMPLES

 Pastebin the patches between the current branch and its upstream:

    $ git paste
    $ git paste @{u}

 Pastebin the latest commit:

    $ git paste -1

 Pastebin the latest three commits:

    $ git paste -3

## AUTHOR

Written by Paul Wise &lt;<pabs3@bonedaddy.net>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
