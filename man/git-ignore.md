git-ignore(1) -- Add .gitignore patterns
========================================

## SYNOPSIS

`git-ignore` [&lt;context&gt;] [&lt;pattern&gt; [&lt;pattern&gt;]...]

## DESCRIPTION

Adds the given _pattern_s to a .gitignore file if it doesn't already exist.

## OPTIONS

  &lt;context&gt;

  -l, --local

  Sets the context to the .gitignore file in the current working directory. (default)

  -g, --global

  Sets the context to the global gitignore file for the current user.

  &lt;pattern&gt;

  A space delimited list of patterns to append to the file in context.

### PATTERN FORMAT

Pattern format as described in the git manual

 * A blank line matches no files, so it can serve as a separator for readability. To append a blank line use empty quotes "".

 * A line starting with # serves as a comment. For example, "# This is a comment"

 * An optional prefix ! which negates the pattern; any matching file excluded by a previous pattern will become included again. If a negated pattern matches, this will override lower precedence patterns sources. To use an exclamation ! as command line argument it is best placed between single quotes ''. For example, '!src'

 * If the pattern ends with a slash, it is removed for the purpose of the following description, but it would only find a match with a directory. In other words, foo/ will match a directory foo and paths underneath it, but will not match a regular file or a symbolic link foo (this is consistent with the way how pathspec works in general in git).

 * If the pattern does not contain a slash /, git treats it as a shell glob pattern and checks for a match against the pathname relative to the location of the .gitignore file (relative to the toplevel of the work tree if not from a .gitignore file).

 * Otherwise, git treats the pattern as a shell glob suitable for consumption by fnmatch(3) with the FNM_PATHNAME flag: wildcards in the pattern will not match a / in the pathname. For example, "Documentation/*.html" matches "Documentation/git.html" but not "Documentation/ppc/ppc.html" or "tools/perf/Documentation/perf.html".

 * A leading slash matches the beginning of the pathname. For example, "/*.c" matches "cat-file.c" but not "mozilla-sha1/sha1.c".


## EXAMPLES

  All arguments are optional so calling git-ignore alone will display first the global then the local gitignore files:

    $ git ignore
    Global gitignore: /home/alice/.gitignore
    # Numerous always-ignore extensions
    *.diff
    *.err
    *.orig
    *.rej
    *.swo
    *.swp
    *.vi
    *~
    *.sass-cache

    # OS or Editor folders
    .DS_Store
    .Trashes
    ._*
    Thumbs.db
    ---------------------------------
    Local gitignore: .gitignore
    .cache
    .project
    .settings
    .tmproj
    nbproject

If you only want to see the global context use the --global argument (for local use --local):

    $ git ignore
    Global gitignore: /home/alice/.gitignore
    .DS_Store
    .Trashes
    ._*
    Thumbs.db

To quickly append a new pattern to the default/local context simply:

    $ git ignore *.log
    Adding pattern(s) to: .gitignore
    ... adding '*.log'

You can now configure any patterns without ever using an editor, with a context and pattern arguments:
The resulting configuration is also returned for your convenience.

    $ git ignore --local "" "# Temporary files" *.tmp "*.log" tmp/*  "" "# Files I'd like to keep" '!work'  ""
    Adding pattern(s) to: .gitignore
    ... adding ''
    ... adding '# Temporary files'
    ... adding 'index.tmp'
    ... adding '*.log'
    ... adding 'tmp/*'
    ... adding ''
    ... adding '# Files I'd like to keep'
    ... adding '!work'
    ... adding ''

    Local gitignore: .gitignore

    # Temporary files
    index.tmp
    *.log

    # Files I'd like to keep
    !work

## AUTHOR

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt; and Tema Bolshakov &lt;<tweekane@gmail.com>&gt;
and Nick Lombard &lt;<github@jigsoft.co.za>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
