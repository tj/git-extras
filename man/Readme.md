How to generate documentation:
================================

## DESCRIPTION

To generate documentation:

1) Start by filling out the 'man-template.md'

2) Then install a program ronn. [Get ronn from github.](https://github.com/rtomayko/ronn)

3) Run make:

(Assumed you are under `./man` when running the command below)

```
$ make -C .. man/git-<command>.{1,html}
```

4)  Remember, we use the following naming convention for files:

```
git-<command>.html
git-<command>.1
git-<command>.md
```

## AUTHOR

Written by Leila Muhtasib &lt;<muhtasib@gmail.com>&gt;
Shell Script by Nick Lombard &lt;<github@jigsoft.co.za>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
