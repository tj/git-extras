git-rename-tag(1) -- Rename a tag
=================================

## SYNOPSIS

`git-rename-tag` &lt;old-tag-name&gt; &lt;new-tag-name&gt;

## DESCRIPTION

  Rename a tag (locally and remotely)

## OPTIONS

  &lt;old-tag-name&gt;

  The name of the tag you want to rename.

  &lt;new-tag-name&gt;

  The new name of the tag.

## EXAMPLES

    $ git tag test
    $ git push --tags
    Total 0 (delta 0), reused 0 (delta 0)
    To git@myserver.com:myuser/myrepository.git
     * [new tag]         test -> test
    $ git tag
    test
    $ git rename-tag test test2
    Deleted tag 'test' (was 1111111)
    Total 0 (delta 0), reused 0 (delta 0)
    To git@myserver.com:myuser/myrepository.git
     * [new tag]         test2 -> test2
    remote: warning: Deleting a non-existent ref.
    To git@myserver.com:myuser/myrepository.git
     - [deleted]         refs/tag/test
    $ git tag
    test2

## AUTHOR

Written by Jesús Espino &lt;<jespinog@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
