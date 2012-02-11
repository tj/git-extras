git-pull-all(1) -- Keep your repositories up to date, in bulk 
============================================================

## SYNOPSIS

 `git-pull-all` [add [&lt;directory&gt;] [&lt;name&gt;] | rm [&lt;pattern&gt;] | ls | pull [&lt;pullargs&gt;...] ]

## DESCRIPTION

 A small helper to keep multiple git repositories up to date.

## OPTIONS

 &lt;directory&gt;
 
 The directory to point to. Defaults to the current working directory.
 
 &lt;name&gt;
 
 The name of the entry - this will default to the absolute path of the entry when adding.
 
 &lt;pattern&gt;
 
 Regular expression to match. When deleting, searches by name.
 
 &lt;pullargs&gt;
 
 Append any additional arguments to each pull.

## EXAMPLES

  Clone a repository and start tracking it.

    $ git clone git@github.com:visionmedia/git-extras.git
    $ cd git-extras
    $ git pull-all add

  `git pull` in each tracked directory

    $ git pull-all

  List currently tracked directories:

    $ git pull-all ls

  Untrack every directory

    $ git pull-all rm .

  Pull "master" from every repository's "origin" remote

    $ git pull-all pull origin master

## AUTHOR

Written by Hugh Kennedy &lt;<hughskennedy@gmail.com>&gt;

## REPORTING BUGS

&lt;<http://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<http://github.com/visionmedia/git-extras>&gt;