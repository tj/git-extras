How to generate documentation:
================================

## DESCRIPTION

To generate documentation:

1) Start by filling out the 'man-template.md'

2) Then use a program ronn. Get ronn from github.

3) Run ronn:

```
$ ronn <filename>.md
```

4)  Remember, we use the following naming convention for files:

```
git-<command>.html
git-<command>.1
git-<command>.md
```

 You'll need to rename the html file, as ronn probably inserted a 1 into the filename.

## EXAMPLE

```
$ ronn git-effort.md

roff: ./git-effort.1
html: ./git-effort.1.html                +man

$ mv git-effort.1.html git-effort.html
```

## SHELL SCRIPT

Alternatively you can run the `manning-up.sh` automated shell script included in the man folder. The script will recreate the git-extras index based on the list of .md files available before it runs `ronn` against each one to generate the documents as well as renaming the generated `.html` files to their desired form.

```
$ ./manning-up.sh
```

To only (re)generate a specific .md manual template and have `.1.html` renamed to `.html` yau may also use manning-up.sh.

```
$ ./manning-up.sh git-info.md
```

## AUTHOR

Written by Leila Muhtasib &lt;<muhtasib@gmail.com>&gt;
Shell Script by Nick Lombard &lt;<github@jigsoft.co.za>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
