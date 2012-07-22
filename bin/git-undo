#!/bin/sh

back="^"

case "$1" in
  -h|--hard)
    test $2 -gt 1 > /dev/null 2>&1 && back="~$2"
    git reset --hard HEAD$back && exit 0;
    ;;
  -s|--soft)
    test $2 -gt 1 > /dev/null 2>&1 && back="~$2"
    ;;
  *)
    test $1 -gt 1 > /dev/null 2>&1 && back="~$1"
    ;;
esac

git reset --soft HEAD$back
git reset
