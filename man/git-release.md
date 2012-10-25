git-release(1) -- Commit, tag and push changes to the repository
================================================================

## SYNOPSIS

`git-release` &lt;tagname&gt; [&lt;remote&gt;]

## DESCRIPTION

  Commits changes with message "Release &lt;tagname&gt;", tags with the given &lt;tagname&gt; and pushes the branch / tags.

## OPTIONS

  &lt;tagname&gt;

  The name of the newly created tag. Also used in tag comment.

  &lt;remote&gt;

  The "remote" repository that is destination of a push operation: it is passed to git push.

## EXAMPLES

  * Release commit with the given &lt;tagname&gt;.

    $ git release 0.1.0

  * Release commit with the given &lt;tagname&gt; and push to specific remote.

    $ git release 0.1.0 github

## AUTHOR

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
