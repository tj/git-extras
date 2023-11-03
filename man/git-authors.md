git-authors(1) -- Generate authors report
=================================================

## SYNOPSIS

`git-authors`
`git-authors` [-l, --list] [--no-email]
`git-authors` [--output] &lt;filename&gt; [--no-email]

## DESCRIPTION

  Populates the file matching _authors|contributors -i_ with the authors of commits, according to the number of commits per author.

  See the "MAPPING AUTHORS" section of **git-shortlog**(1) to coalesce together commits by the same person.

## OPTIONS

  -l, --list

  Show authors.

  --no-email

  Don't show authors' email.

  --output

  output the authors

  &lt;filename&gt;

  the filename which is letter prefix to save the authors

## EXAMPLES

  Updating AUTHORS file:

    $ git authors

  Listing authors:

    $ git authors --list
    TJ Holowaychuk <tj@vision-media.ca>
    hemanth.hm <hemanth.hm@gmail.com>
    Jonhnny Weslley <jw@jonhnnyweslley.net>
    nickl- <github@jigsoft.co.za>
    Leila Muhtasib <muhtasib@gmail.com>

  Listing authors without email:

    $ git authors --list --no-email
    TJ Holowaychuk
    hemanth.hm
    Jonhnny Weslley
    nickl-
    Leila Muhtasib

  Output authors

    $ git authors --output authors-history || cat authors-history
    TJ Holowaychuk <tj@vision-media.ca>
    hemanth.hm <hemanth.hm@gmail.com>
    Jonhnny Weslley <jw@jonhnnyweslley.net>
    nickl- <github@jigsoft.co.za>
    Leila Muhtasib <muhtasib@gmail.com>

    $ git authors --output authors-history --no-email || cat authors-history
    TJ Holowaychuk
    hemanth.hm
    Jonhnny Weslley
    nickl-
    Leila Muhtasib

## AUTHOR

Written by Titus Wormer &lt;<tituswormer@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
