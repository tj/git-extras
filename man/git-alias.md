git-alias(1) -- Define, search and show aliases
===============================================

## SYNOPSIS

`git-alias` [&lt;alias-name&gt; &lt;command&gt;]|[&lt;search-term&gt;]

## DESCRIPTION


## OPTIONS

  &lt;alias-name&gt;

  The name of the alias to create.

  &lt;command&gt;

  The command for which you are creating an alias.

  &lt;search-term&gt;

  The pattern used for search aliases.


## EXAMPLES

 Defining a new alias:

    $ git alias last "cat-file commit HEAD"

 Providing only one argument, `git-alias` searchs for aliases matching the given value:

    $ git alias ^la
    last = cat-file commit HEAD

 `git-alias` will show all aliases if no argument is given:

    $ git alias
    s = status
    amend = commit --amend
    rank = shortlog -sn --no-merges
    whatis = show -s --pretty='tformat:%h (%s, %ad)' --date=short
    whois = !sh -c 'git log -i -1 --pretty="format:%an <%ae>

## AUTHOR

Written by Jonhnny Weslley &lt;<jw@jonhnnyweslley.net>&gt;

## REPORTING BUGS

&lt;<http://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<http://github.com/visionmedia/git-extras>&gt;
