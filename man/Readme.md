How to generate documentation
================================

The man pages for `git-extras` are written in ronn-flavored Markdown files, from which HTML and ROFF formatted files are generated.

To avoid requiring `git-extras` users to install `ronn`, the generated man page files are checked in to the Git repo.

## GENERATION PROCEDURE

To generate documentation:

1) Start by copying 'man-template.md' to `git-<command>.md` and filling it out.

2) Run `./manning-up.sh` to update generated content and generate the HTML and ROFF output files.

3) Check the new files in to the git repo, including the `.html` and `.1` files generated in step 2. Also check in the updated `git-extras.(md|html|1)` and `index.txt` files, which will be modified due to the addition of a new extras command.

### EXAMPLES

Adding a man page for a new command, `git-foo`:

```
$ cp man-template.md git-foo.md
$ vi git-foo.md
$ # After you're finished editing the file:
$ ./manning-up.sh git-foo.md
$ git add git-foo.* git-extras.*
```

Updating files for an existing topic:

```
$ ./manning-up.sh git-effort.md
roff: ./git-effort.1
html: ./git-effort.1.html                +man
$ git add git-effort.*
```

## SHELL SCRIPT

The `manning-up.sh` shell script included in the `man/` folder contains the logic to . The script will recreate the git-extras index based on the list of `git-*.md` files and then run `ronn` against each one to generate the documents, as well as renaming the generated `.html` files to their desired form.

```
$ ./manning-up.sh
```

To only (re)generate a given `.md` manual template, pass the Markdown file name as an argument to `manning-up.sh`.

```
$ ./manning-up.sh git-info.md
```

You can look at the script to see the exact `ronn` command used to build the man page files.

## AUTHOR

Written by Leila Muhtasib &lt;<muhtasib@gmail.com>&gt;

Shell Script by Nick Lombard &lt;<github@jigsoft.co.za>&gt;

## REPORTING BUGS

Please report bugs using the `git-extras` project's GitHub issue tracker at: https://github.com/tj/git-extras/issues
