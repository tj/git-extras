git-stamp(1) -- Stamp the last commit message
=============================================

## SYNOPSIS

`git stamp [<options>] <id> [<messages>]`

## DESCRIPTION

Lets you amend the last commit with a stamp message.

The command appends a message with its identifier to the last commit message.  
By default all stamps are appended as a new paragraph to the commit message.  
You can change this behavior by using the --replace flag.  
With this flag, all the related stamps with the same identifier will be removed first before the new one gets appended.

`WARNING!` If a commit message without stamp have a line starting with the same identifier, it will be interpreted as a stamp

## OPTIONS

  -r, --replace

    Replace all previous stamps in the last commit message that have the same identifier  
    The identifier is case insensitive for this replacement

## EXAMPLES

Commit message is

    | Fix timezone bug

Reference the issues numbers from your bug tracker

    $ git stamp Issue FOO-123
    $ git stamp Issue FOO-456 \#close

    | Fix timezone bug
    |
    | Issue FOO-123
    |
    | Issue FOO-456 #close

Link to its review page

    $ git stamp Review https://reviews.foo.org/r/4567/

    | Fix timezone bug
    |
    | Issue FOO-123
    |
    | Issue FOO-456 #close
    |
    | Review https://reviews.foo.org/r/4567/

Replace previous issues with a new one  
(Note that the identifier is case insensitive)

    $ git stamp --replace issue BAR-123

    | Fix timezone bug
    |
    | Review https://reviews.foo.org/r/4567/
    |
    | issue BAR-123

## AUTHOR

Written by Damien Tardy-Panis &lt;<damien@tardypad.me>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
