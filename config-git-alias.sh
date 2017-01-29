#!/usr/bin/env bash

# from http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-in
SCRIPT_PATH="${BASH_SOURCE[0]}";
if([ -h "${SCRIPT_PATH}" ]) then
  while([ -h "${SCRIPT_PATH}" ]) do SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
pushd . > /dev/null
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;


# Add an alias for each git-* script
for bin in $SCRIPT_PATH/bin/git-*; do
  cmd=$(basename $bin | sed s#git-##g)
  echo git $cmd
  git config --global alias.$cmd "!$bin"
done

# Update git-extras by simply pulling from remote.
git config --global alias.update-extras "!(cd $SCRIPT_PATH && git pull)"
