git-changelog(1) -- Generate a changelog report
===============================================

## SYNOPSIS

`git-changelog` [options] [&lt;file&gt;]<br>
`git-changelog` {-h | --help | ?}

## DESCRIPTION

  Generates a changelog from git(1) tags (annotated or lightweight) and commit messages. Existing changelog files with filenames that begin with _Change_ or _History_ will be identified automatically with a case insensitive match pattern and existing content will be appended to the new output generated--this behavior can be disabled by specifying the prune option (-p|--prune-old). The generated file will be opened in **$EDITOR** when set.

  If no tags exist, then all commits are output; if tags exist, then only the most-recent commits are output up to the last identified tag. This behavior can be changed by specifing one or both of the range options (-f|--final-tag and -s|--start-tag).

## OPTIONS

  &lt;file&gt;

  The name of the output file. By default the new file will be _History.md_ unless an existing changelog is detected in which case the existing file will be updated.

  -a, --all

  Retrieve all commits. Ignores -s|--start-tag and -f|--final-tag options (if set).

  -l, --list

  Show commits in list format (without titles, dates).

  -t, --tag

  Specify a tag label to use for most-recent (untagged) commits.

  -f, --final-tag

  When specifying a range, the newest tag at which point commit retrieval will end. Commits will be returned from the very first commit until the final tag unless a start tag is also specified.

  -s, --start-tag

  When specifying a range, the oldest tag to retrieve commits from. Commits will be returned from the start tag to now unless a final tag is also specified.

  -n, --no-merges

  Filters out merge commits (commits with more than 1 parent) from generated changelog.

  -m, --merges-only

  Uses only merge commits (commits with more than 1 parent) for generated changelog. It also changes the default format to include the merge commit messages body, as on github the commits subject line only contains the branch name but no information about the content of the merge. 

  -p, --prune-old

  Replace existing changelog entirely with newly generated content, thereby disabling the default behavior of appending the content of any detected changelog to the end of newly generated content.

  -x, --stdout

  Write output to stdout instead of to a new changelog file.

  -h, --help, ?

  Show a help message with basic usage information.

## EXAMPLES

  * Updating existing file or creating a new _History.md_ file with pretty formatted output:

    $ git changelog

  * Listing commits from the current version:

    $ git changelog --list

  * Listing a range of commits from 2.1.0 to now:

    $ git changelog --list --start-tag 2.1.0

  * Listing a pretty formatted version of the same:

    $ git changelog --start-tag 2.1.0

  * Listing a range of commits from initial commit to 2.1.0:

    $ git changelog --list --final-tag 2.1.0

  * Listing a pretty formatted range of commits between 0.5.0 and 1.0.0:

    $ git changelog --start-tag 0.5.0 --final-tag 1.0.0

  * Specifying a file for output:

    $ git changelog ChangeLog.md

  * And if an existing Changelog exists, replace its contents entirely:

    $ git changelog --prune-old

## AUTHOR

Written by Mark Eissler &lt;<mark@mixtur.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
