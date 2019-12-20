git-reauthor(1) -- Rewrite history to change author's identity
==============================================================

## SYNOPSIS

`git reauthor [<options>]`

## DESCRIPTION

Lets you replace the author and/or committer identities in commits and tags.

The command goes through all existing commits and tags in all local branches to selectively modify the identities present in those objects. All the other information such as dates, messages,.. are preserved.

You can rewrite all the identities in the commits and tags objects by using the --all flag, or only replace the identities whose email matches the value of the --old-email option. It is also possible to limit the rewrite to a certain type of identity: the author or the committer identity. By default, both of them are affected.  
For each of those identities to update, the command will replace the name and/or email with the new correct values as defined via the options. If the new identity name to set is not defined, the current one will be kept (and vice-versa with the email).

`WARNING!` This command rewrites history and as a result you will not able to push your branch to the remote without using the --force option.  
See more information with `git help filter-branch`.

## OPTIONS

  -a, --all

    Rewrite ALL identities in commits and tags.

  -c, --use-config

    Define correct values from user Git config
    Values of --correct-email and --correct-name options take precedence over the ones from the config if specified as well

  -e, --correct-email &lt;<email>&gt;

    Define the correct email to set
    Empty email '' is allowed

  -n, --correct-name &lt;<name>&gt;

    Define the correct name to set
    Empty name '' is not allowed

  -o, --old-email &lt;<email>&gt;

    Rewrite identities matching old email in commits and tags
    Empty email '' is allowed

  -t, --type &lt;<id>&gt;

    Define the type of identities affected by the rewrite
    Possible type identifiers are: author, committer, both (default)

## EXAMPLES

Replace the personal email and name of Jack to his work ones

    $ git reauthor --old-email jack@perso.me --correct-email jack@work.com --correct-name 'Jack Foobar'

Replace the email and name of Jack to the ones defined in the Git config

    $ git reauthor --old-email jack@perso.me --use-config

Replace only the email of Jack (keep the name already used)

    $ git reauthor --old-email jack@perso --correct-email jack@perso.me

Change only the committer email of Jack (keep the author email already used)

    $ git reauthor --old-email jack@perso.me --correct-email jack@work.com --type committer

Change only the name and keep email to merge one user with multiple pseudonyms.

    $ git reauthor --old-email jack@perso.me --correct-name Jack

Set Jack's identity as the only one of the whole repository

    $ git reauthor --all --correct-email jack@perso.me --correct-name Jack
    
Set Jack as the only committer of the whole repository (keeps authors)

    $ git reauthor --all --correct-email jack@perso.me --correct-name Jack --type committer

## AUTHOR

Written by Damien Tardy-Panis &lt;<damien@tardypad.me>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
