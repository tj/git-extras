#!/usr/bin/env bash
set -e

update_git_extras_index() {
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
  awk "NR >= $ln-1" git-extras.md >> git-extras.md.tmp
  mv -f index.txt.tmp index.txt
  mv -f git-extras.md.tmp git-extras.md
}

if [ -n "$1" ]
then
  if [[ "$1" == git-extras.md ]]
  then
    update_git_extras_index
  fi

  ronn $1
  mv -f ${1/.md/}.1.html ${1/.md/}.html
else

  update_git_extras_index
  for file in $(ls git*.md); do
    extra=${file/.md/}
    ronn $file && mv -f $extra.1.html $extra.html
  done
fi
