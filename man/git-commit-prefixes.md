git-commit-prefixes(1) -- Show standard prefixes to commit messages
====================================================================

## SYNOPSIS

`git-commit-prefixes`

## DESCRIPTION

  Show standard prefixes to commit messages.

## EXAMPLES

     $ git commit-prefixes
      Prefix        Description
      [api]         New apis / changes to apis
      [test]        Update test/* files
      [dist]        Changes to submodules, version bumps
      [minor]       Small changes such as lint
      [doc]         Updates to documentation
      [ux]          Updates to UI
      [fix]         Bug fixes
      [bin]         Update binary scripts associated with the project
      [merge]       Resolved git merge from upstream or otherwise
      [refactor]    Refactor of existing code with no external API changes
      [{{feat}}]    Updates {{ feature }}, e.g. [prefixes] Message

## AUTHOR

Written by Nuno Job &lt;<nunojobpinto@gmail.com>&gt;

## REPORTING BUGS

&lt;<http://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<http://github.com/visionmedia/git-extras>&gt;
