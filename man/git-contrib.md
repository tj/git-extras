git-contrib(1) -- Show user's contributions
===========================================

## SYNOPSIS

`git-contrib` &lt;username&gt;

## DESCRIPTION

  Output a user's contributions to a project, based on the author name.

## OPTIONS

  &lt;username&gt;

  The name of the user who owns the contributions.

## EXAMPLES

    $ git contrib visionmedia
    visionmedia (18):
      Export STATUS_CODES
      Replaced several Array.prototype.slice.call() calls with Array.prototype.unshift.call()
      Moved help msg to node-repl
      Added multiple arg support for sys.puts(), print(), etc.
      Fix stack output on socket error
      ...

## AUTHOR

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
