#!/usr/bin/env bash
files=()
for f ; do
  if [ -r "$f" ] ; then
    file --mime-type -r0 "$f" |
    cut -d "" -f 2 |
    grep -q "^: text/x-shellscript$" &&
    files+=("$f")
  fi
done
if [ ${#files[@]} -gt 0 ] ; then
  shellcheck "${files[@]}"
  ret=$?
  if [ $ret -eq 1 ] || [ $ret -eq 2 ] ; then
    exit 1
  fi
fi
