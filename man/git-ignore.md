git-ignore(1) -- Add .gitignore patterns
=======================================

## SYNOPSIS

`git-ignore` [&lt;pattern&gt;...]

## DESCRIPTION

Adds the given _pattern_s to a gitignore file.

## OPTIONS

## EXAMPLES

 To lazy to open up _.gitignore_? me too! simply pass some patterns:

    $ git ignore build "*.o" "*.log"
  	... added 'build'
	  ... added '*.o'
  	... added '*.log'

 Running `git-ignore` without a pattern will display the current patterns:

    $ git ignore
    build
    *.o
    *.log 

## AUTHOR

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt;

## REPORTING BUGS

&lt;<http://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<http://github.com/visionmedia/git-extras>&gt;
