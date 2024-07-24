git-rename-file(1) -- Rename a file or directory and ensure Git recognizes the change, regardless of filesystem case-sensitivity.
================================================

## SYNOPSIS

`git-rename-file` [OPTIONS] <source> <destination>

## DESCRIPTION

The `git-rename-file` command renames a file or directory and ensures Git recognizes the change, regardless of filesystem case-sensitivity. It combines the functionality of the `mv` command and `git mv`.

This is particularly useful for renaming files or directories to change only their case, which might not be detected by Git on case-insensitive filesystems.

## OPTIONS

-h, --help
    Show usage information.

## EXAMPLES

Rename a file:

```sh
git-rename-file old_filename new_filename
```

Rename a directory:

```sh
git-rename-file old_directory new_directory
```

## AUTHOR

Written by Zachary Miller &lt;<codebyzach@gmail.com>&gt;

## REPORTING BUGS

<https://github.com/tj/git-extras/issues>

## SEE ALSO

<https://github.com/tj/git-extras>
