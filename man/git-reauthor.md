git-reauthor(1) -- Rewrite history to change author's identity
==============================================================

## SYNOPSIS

`git reauthor [<options>]`

## DESCRIPTION

Rewrite history to change author's identity.

Goes through all existing commits and tags to selectively modify the identities:  
- modify name and/or email  
- affect author and/or committer identities  
- specify the new name/email as parameters or use the ones from the Git config  
- change all objects or only replace those from a specific identity (defined by its email)

## OPTIONS

  -A, --all

    Rewrite all commits and tags.

  -C, --config

    Define correct values from user Git config
    Parameters of --correct-email and --correct-name options take precedence
    over the ones from the config if specified as well

  -e, --correct-email &lt;<email>&gt;

    Define the correct email to set
    Empty email '' is allowed

  -n, --correct-name &lt;<name>&gt;

    Define the correct name to set
    Empty name '' is not allowed

  -o, --old-email &lt;<email>&gt;

    Rewrite only commits and tags from old email
    Empty email '' is allowed
    If the --all flag is specified as well, it takes precedence over this option

  -t, --type &lt;<id>&gt;

    Define the type of the rewrite to choose which identities to affect
    Possible type identifiers are: author, committer, full (default)

## EXAMPLES

Change manually the personal email and name of Jack to his work ones

    $ git reauthor --old-email jack@perso.me --correct-email jack@work.com --correct-name 'Jack Foobar'

Change automatically the email and name of Jack to the ones defined in the Git config

    $ git reauthor --old-email jack@perso.me --config

Fix only the email of Jack (keep the name already used)

    $ git reauthor --old-email jack@perso --correct-email jack@perso.me

Change only the committer email of Jack (keep the author email already used)

    $ git reauthor --old-email jack@perso.me --correct-email jack@work.com --type committer

Set Jack as the only author of the whole repository

    $ git reauthor --all --correct-email jack@perso.me --correct-name Jack

## AUTHOR

Written by Damien Tardy-Panis &lt;<damien@tardypad.me>&gt;

## REPORTING BUGS

&lt;<http://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
