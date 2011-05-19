git-pull-request(1) -- Pulls a github request
====================================

## SYNOPSIS

`git-pull-request` [number]

## DESCRIPTION

  Pulls the given request number the project in the __CWD__ and applies it via `git am`.

## EXAMPLES

  Pull https://github.com/visionmedia/express/pull/604.

    $ cd projects/express
    $ git pull-request 604

## AUTHOR

Written by TJ Holowaychuk &lt;<tj@vision-media.ca>&gt;

## REPORTING BUGS

&lt;<http://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<http://github.com/visionmedia/git-extras>&gt;
