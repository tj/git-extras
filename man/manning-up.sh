#!/bin/bash

# manning-up.sh - generates man pages, including extra
# 
# manning-up.sh <file.md>
# manning-up.sh
#
# With one argument, generates the .1 and .html files from the given .md file
#
# With no arguments, updates all generated document files:
#  - Updates the index inside git-extras.md
#  - Generates index.txt
#  - Regenerates the ROFF and HTML files for all the `git-*.md` files

if [[ $# > 1 ]]; then
  echo >&2 "error: $0 takes 0 or 1 arguments"
  exit 1
fi

# 1-arg form
if [ -n "$1" ]; then
  ronn --manual "Git Extras" $1 && mv -f ${1/.md/}.1.html ${1/.md/}.html && exit 0
  exit 1
fi

# 0-arg form:
# Generate index.txt and update index inside git-extras.md
echo '# manuals' > index.txt.tmp
ln=$(awk '/## COMMANDS/{print NR};'  ./git-extras.md)
awk "NR <= $ln+1" git-extras.md > git-extras.md.tmp
for file in $(ls git*.md); do
  extra=${file/.md/}
  spaced="                           "
  echo "$extra(1)${spaced:${#extra}}$extra" >> index.txt.tmp;
  title=$(grep -m 1 $extra"(1) -- " $file)
  test "$extra" != "git-extras" && echo "   - **"${title/" --"/"**"} >> git-extras.md.tmp
done
ln=$(awk '/## AUTHOR/{print NR};'  ./git-extras.md)
awk "NR >= $ln-1" git-extras.md >> git-extras.md.tmp && mv -f index.txt.tmp index.txt && mv -f git-extras.md.tmp git-extras.md

for file in $(ls git*.md); do
  extra=${file/.md/}
  ronn --manual "Git Extras" $file && mv -f $extra.1.html $extra.html
done
