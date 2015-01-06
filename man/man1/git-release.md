git-release(1) -- Commit, tag and push changes to the repository
================================================================

## SYNOPSIS

`git-release` &lt;tagname&gt; [-r &lt;remote&gt;] [-c]

## DESCRIPTION

  Commits changes with message "Release &lt;tagname&gt;", tags with the given &lt;tagname&gt; and pushes the branch / tags.
  Optionally it generates a changelog (see git-changelog) and a remote can be defined. The order of first -c or -r does not matter.

## OPTIONS

  &lt;tagname&gt;

  The name of the newly created tag. Also used in tag comment.

  -r &lt;remote&gt;

  The "remote" repository that is destination of a push operation: it is passed to git push.
  
  -c
  
  Generates or populates the changelog with all commit message since the last tag. For more info see git-changelog..

## EXAMPLES

  * Release commit with the given &lt;tagname&gt;.

    $ git release 0.1.0

  * Release commit with the given &lt;tagname&gt; and push to specific remote.

    $ git release 0.1.0 -r github
    
  * Release commit with the given &lt;tagname&gt; and populate changelog.

    $ git release 0.1.0 -c
    
  * Release commit with the given &lt;tagname&gt;, populate changelog, and push to specific remote.

    $ git release 0.1.0 -r github -c

## AUTHOR

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt;
Extended by David Hartmann &lt;<dh@tsl.io>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
