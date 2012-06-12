How to generate documentation:
================================

## DESCRIPTION

To generate documentation:

1) Start by filling out the 'man-template.md'

2) Then use a program ronn. Get ronn from github.

3) Run ronn:  

   $ronn &lt;filename&gt;.md  

4)  Remember, we use the following naming convention for files:  
    git-&lt;command&gt;.html  
    git-&lt;command&gt;.1  
    git-&lt;command&gt;.md  

    You'll need to rename the html file, as ronn probably inserted a 1 into the filename.  

## EXAMPLE

$ ronn git-effort.md  

     roff: ./git-effort.1  
     html: ./git-effort.1.html                                   +man  

$mv git-effort.1.html git-effort.html  

## AUTHOR

Written by Leila Muhtasib &lt;<muhtasib@gmail.com>&gt;

## REPORTING BUGS

&lt;<http://github.com/visionmedia/git-extras/issues>&gt;

## SEE ALSO

&lt;<http://github.com/visionmedia/git-extras>&gt;
