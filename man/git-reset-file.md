git-reset-file(1) -- Reset one file
================================

## SYNOPSIS

`git-reset-file` [&lt;filename&gt;] commit-hash

## DESCRIPTION

  Reset one file to HEAD or certain commit-hash

## OPTIONS

  &lt;filename&gt;

  The name of the file to reset.

  &lt;commit-hash&gt;

  (Optional) Hash of commit to reset the file to. Defaults to HEAD.

## EXAMPLES

  Reset one file to HEAD

	$ git reset-file .htaccess

  or reset one file to certain commit

	$ git reset-file .htaccess dc82b19

## AUTHOR

Written by Sasha Khamkov &lt;<sanusart@gmail.com>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
