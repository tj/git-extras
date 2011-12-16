git-commit-message(1) -- Builds commit message incrementally
====================================

## SYNOPSIS

`git commit-message` add <message>...<br>
`git commit-message` edit<br>
`git commit-message` clear<br>
`git commit-message` [show]

## DESCRIPTION

**git commit-message** allows building a commit message incrementally during
development instead of writing it all at once at the end.  When
committing, the commit message will be prepopulated with all of your
notes.  After committing, the commit message will be cleared to empty.

## EXAMPLES

Add a note to the commit message:

      $ git commit-message add Updated return value of my_function

Edit the commit message so far:

      $ git commit-message edit

See the commit message so far:

      $ git commit-message
      Updated return value of my_function
      Changed the blargleflatz implementation
      Added 6 new unit tests

Clear the commit message:  (This is done automatically after every commit.)

      $ git commit-message clear

## AUTHOR

Written by Russell Belfer &lt;<arr2bee2@gmail.com>&gt;

## REPORTING BUGS

&lt;<http://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<http://github.com/visionmedia/git-extras>&gt;
