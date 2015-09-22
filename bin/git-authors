#!/usr/bin/env bash

LIST=false
FILE=""
EDITOR=$(git var GIT_EDITOR)

if test "$1" = "-l" || test "$1" = "--list"; then
  LIST=true
else
  FILE=$1
  if test "$FILE" = ""; then
    FILE=`ls | egrep 'authors|contributors' -i|head -n1`
    if test "$FILE" = ""; then
      FILE='AUTHORS'
    fi
  fi
fi

#
# list authors sorted by number of commits (descending).
#

authors() {
  git shortlog -sne | awk '{$1=""; sub(" ", ""); print}' | awk -F'<' '!x[$1]++' | awk -F'<' '!x[$2]++'
}

#
# authors.
#

if $LIST; then
  echo "$(authors)"
else
  authors >> $FILE
  test -n "$EDITOR" && $EDITOR $FILE
fi
