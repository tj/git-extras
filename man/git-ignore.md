git-ignore(1) -- Modify or display .gitignore files
========================================

## SYNOPSIS

`git-ignore` [&lt;context&gt;] [&lt;action&gt;] [--] [&lt;pattern&gt; [&lt;pattern&gt;]...]

## DESCRIPTION

Modifies or shows .gitignore of selected *context*.

Possible actions are: addition of new *pattern*s, removal of existing *pattern*s from gitignore files, opening these files in text editor or simply displaying their contents in current terminal (for details see flags/usage).

Contexts are global (e.g. $HOME/.gitignore or $HOME/.local/.git/.gitignore), private (e.g. .../project/.git/info/exclude) and local (e.g. .../project/.gitignore)

Adding only happens for *pattern*s that don't already exist in the file; removing *pattern*s that are not present does not do anything; editing fails if the file is not yet present.

At most 1 *context* and 1 *action* matter for the program, the ones selected are the latest encountered in the flag list.

Default behavior:

* If no flags or arguments are passed, prints gitignores of all 3 *context*s.

* Passing arguments with no *action* implies addition of *pattern*s to gitignore.

* If an *action* is chosen, but not *context*, *action* is performed on local gitignore.

* If *context* is chosen but not action (not even implied), gitignore of chosen *context* is printed.

## OPTIONS

  &lt;context&gt;

  -l, --local

  Sets the context to the .gitignore file in the current working directory. (default)

  -g, --global

  Sets the context to the global gitignore file for the current user.

  -p, --private

  Sets the context to the private exclude file for the repository (`.git/info/exclude`).

  &lt;action&gt;

  -e, --edit

  Sets action to edit. This will open gitignore in a text editor (editor selection is the same as for git commit). If no *context* is provided local is assumed. Any *pattern*; provided in additional arguments is silently omitted.

  -r, --remove

  Sets action to remove. This will look for *pattern*s in gitignore of selected *context* and remove if finds them. If no *pattern* is provided does nothing. All characters in *pattern* are treated literally, no interpretation of metacharacters is performed as would be, for example, for a regex pattern.

  &lt;pattern&gt;

  A space delimited list of patterns to append to the file in context.

  --

  End of options delimiter. Everything to the right of it is treated as positional arguments or more precisely a *pattern*.

  -h, --help

  Print a brief usage summary.

### PATTERN FORMAT

Pattern format as described in the git manual

 * A blank line matches no files, so it can serve as a separator for readability. To append a blank line use empty quotes "".

 * A line starting with # serves as a comment. For example, "# This is a comment"

 * An optional prefix ! which negates the pattern; any matching file excluded by a previous pattern will become included again. If a negated pattern matches, this will override lower precedence patterns sources. To use an exclamation ! as command line argument it is best placed between single quotes ''. For example, '!src'

 * If the pattern ends with a slash, it is removed for the purpose of the following description, but it would only find a match with a directory. In other words, foo/ will match a directory foo and paths underneath it, but will not match a regular file or a symbolic link foo (this is consistent with the way how pathspec works in general in git).

 * If the pattern does not contain a slash /, git treats it as a shell glob pattern and checks for a match against the pathname relative to the location of the .gitignore file (relative to the top level of the work tree if not from a .gitignore file).

 * Otherwise, git treats the pattern as a shell glob suitable for consumption by fnmatch(3) with the FNM\_PATHNAME flag: wildcards in the pattern will not match a / in the pathname. For example, "Documentation/\*.html" matches "Documentation/git.html" but not "Documentation/ppc/ppc.html" or "tools/perf/Documentation/perf.html".

 * A leading slash matches the beginning of the pathname. For example, "/\*.c" matches "cat-file.c" but not "mozilla-sha1/sha1.c".


## EXAMPLES

  All arguments are optional so calling git-ignore alone will display global, local and private gitignore files in order:

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
    ---------------------------------
    Private gitignore: .git/info/exclude
    notes.txt
    test.sh
    .env.local
    config.json

If you only want to see the global context use the --global argument (for local use --local, for private use --private):

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

You can now configure any patterns without ever using an editor (or use a shortcut to open file in editor when needed), with a context and pattern arguments:
The resulting configuration is also returned for your convenience.

    $ git ignore --local "" "# Temporary files" *.tmp "*.log" tmp/*  "" "# Files I'd like to keep" '!work'  ""
    Adding pattern(s) to: .gitignore
    ... adding ''
    ... adding '# Temporary files'
    ... adding '*.tmp'
    ... adding '*.log'
    ... adding 'tmp/*'
    ... adding ''
    ... adding '# Files I'd like to keep'
    ... adding '!work'
    ... adding ''
    
    Local gitignore: .gitignore
    
    # Temporary files
    *.tmp
    *.log
    tmp/*

    # Files I'd like to keep
    !work

Removing patterns works in a similar way. Select context and pass patterns to be removed from the gitignore file.

    $ git ignore -l -r "*.log"
    Removing patterns from local gitignore: .gitignore
    ... removing '*.log'

    Local gitignore: .gitignore

    # Temporary files
    *.tmp
    tmp/*
    
    # Files I'd like to keep
    !work

If you want to open gitignore in an editor and do changes manually pass -e flag:

    $ git ignore -p -e


## AUTHOR

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt; and Tema Bolshakov &lt;<tweekane@gmail.com>&gt;
and Nick Lombard &lt;<github@jigsoft.co.za>&gt and Kirill Dergachev &lt;<kdergachev1062@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
