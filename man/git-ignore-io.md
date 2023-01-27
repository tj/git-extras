git-ignore-io(1) -- Get sample gitignore file
================================

## SYNOPSIS

`git ignore-io` [&lt;OPTIONS&gt;]

## DESCRIPTION

Get sample gitignore file from [gitignore.io](https://www.toptal.com/developers/gitignore/)

## OPTIONS

  &lt;OPTIONS&gt;

  -a, --append &lt;types&gt;...  
  Append new .gitignore content to .gitignore under the current directory  

  -r, --replace &lt;types&gt;...  
  Export new .gitignore to the current directory (The old one will be replaced)  

  -l, --list-in-table  
  Print available types in table format  

  -L, --list-alphabetically  
  Print available types in alphabetical order  

  -s, --search &lt;word&gt;  
  Search word in available types  

  -t, --show-update-time  
  Show the last modified time of ~/.gi\_list (where the list of available types is stored)  

  -u, --update-list  
  Update ~/.gi\_list  


## EXAMPLES
Show sample gitignore file for vim  

```bash
$ git ignore-io vim

    # Created by https://www.toptal.com/developers/gitignore/api/vim

    ### Vim ###
    [._]*.s[a-w][a-z]
    [._]s[a-w][a-z]
    *.un~
    Session.vim
    .netrwhist
    *~
```

Append sample gitignore for Vim and Python to .gitignore in current directory.

```bash
$ git ignore-io -a vim python
```

Show all available types

```bash
$ git ignore-io -l

    actionscript             ada                      agda                     android                  anjuta
    appceleratortitanium     appcode                  appengine                archives                 archlinuxpackages
    autotools                basercms                 bazel                    bluej                    bower
    bricxcc                  c                        c++                      cakephp                  carthage
    ......
```

Search ja in all available types

```bash
$ git ignore-io -s ja

    django
    jabref
    java
    ninja
```


## AUTHOR

Written by Lee-W <weilee.rx@gmail.com> 

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
