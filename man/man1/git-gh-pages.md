git-gh-pages(1) -- Create the GitHub Pages branch
=================================================

## SYNOPSIS

`git-gh-pages`

## DESCRIPTION

  Create the GitHub Pages branch (gh-pages) with an initial dummy index.html file.

## EXAMPLES

    $ git gh-pages
    setting up gh-pages
    Removing ...
    [gh-pages (root-commit) 94f4b26] Initial commit
     1 file changed, 1 insertion(+)
     create mode 100644 index.html
    Counting objects: 3, done.
    Writing objects: 100% (3/3), 232 bytes, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To git@github.com:myuser/myrepository.git
     * [new branch]      gh-pages -> gh-pages
    Branch gh-pages set up to track remote branch gh-pages from origin.
    complete
    $


## AUTHOR

Written by Jesús Espino &lt;<jespinog@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
