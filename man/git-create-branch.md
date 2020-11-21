git-create-branch(1) -- Create branches
=======================================

## SYNOPSIS

`git-create-branch` [-r|--remote [remote_name]] &lt;branchname&gt;

## DESCRIPTION

Creates local branch named &lt;branchname&gt; and optionally sets up a remote tracking branch.

## OPTIONS

&lt;-r|--remote [remote_name]&gt;

Setup a remote tracking branch using `remote_name`. If `remote_name` is not supplied, use `origin` by default.

&lt;--from [start_point]&gt;

Setup a start point when the branch created. If `--from` is not supplied, use the current branch by default.

&lt;branchname&gt;

The name of the branch to create.

## PREFERENCES

You may save your default preference for the `remote` option above by using `git config` with the key `git-extras.create-branch.remote` whose value will be the default remote when `[-r|--remote]` is not specified.

    $ git config git-extras.create-branch.remote lucinda

The command line option `-r|--remote` will override this preference.

## EXAMPLES

With no remote preference set:

    # creates local branch 'integration'
    $ git create-branch integration

    # creates local & remote branch 'integration' (on default 'origin')
    $ git create-branch -r integration

    # creates local & remote branch 'integration' on 'upstream'
    $ git create-branch -r upstream integration

With `git-extras.create-branch.remote` preference set to 'lucinda':

    # creates local & remote branch 'integration' (on preference 'lucinda')
    $ git create-branch integration

    # overriding preference, using default `-r` of 'origin'
    # creates local & remote branch 'integration' on default 'origin'
    $ git create-branch -r integration

    # overriding preference, using specified `-r` of 'upstream'
    # creates local & remote branch 'integration' on 'upstream'
    $ git create-branch -r upstream integration

## NOTES

* As of 4.4.0, the default behavior has changed. `git-create-branch` will no longer automatically setup a remote tracking branch unless the `-r|-remote` option is specified.  See additional note on preference feature in 4.8.0-dev below.

* As of 4.8.0-dev, the `remote` option can be set via `git config` preference as described in [Preferences](#PREFERENCES) section.

## AUTHOR

Written by Jonhnny Weslley &lt;<jw@jonhnnyweslley.net>&gt;
Modified by Mark Pitman &lt;<mark.pitman@gmail.com>&gt;, Brian Murrell &lt;<btmurrell@gmail.com>&gt;.

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
