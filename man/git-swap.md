git-swap(1) -- Swap the last two commits
========================================

## SYNOPSIS

`git-swap`

## DESCRIPTION

## OPTIONS

No options.

## EXAMPLES

Given the last two commits:

```bash
$ git log -2 --pretty=oneline --abbrev-commit
a8c7fea fix issue with slugification
be5a15c fix issue with signup form not shown
```

Swap the last two commits with `git swap`.

```bash
$ git swap

```

You will obtain

```bash
$ git log -2 --pretty=oneline --abbrev-commit
60ea26e fix issue with signup form not shown
da3ab81 fix issue with slugification
```

## AUTHOR

Adapted by Stephane Bachelier &lt;<stephane.bachelier@gmail.com>&gt;
Gist available here: &lt;<https://gist.github.com/stephanebachelier/8803647#file-git-flip-last-sh>&gt;
 
Original work from Eddie Moya &lt;<http://eddiemoya.com/>&gt;:
&lt;<https://gist.github.com/eddiemoya/5456992#file-git-flip-last-sh>&gt;

## REPORTING BUGS

&lt;<https://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/visionmedia/git-extras>&gt;
