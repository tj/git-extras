#!/bin/bash
#
# install.sh - install latest release from the network
#
# This will download the git-extras source tree from the GitHub repo and install
# the latest tagged release. This is intended to be run over the network
# with something like `bash -c $(curl -fsSl .../install.sh)`. If you have
# already downloaded the source tree and are looking at this file, don't run
# this; just use `make install` instead.
#
# Variables used:
#   PREFIX - As with make; the root of the installation hierarchy

make_install() {
    if [ -n "$PREFIX" ]
    then
        PREFIX="$PREFIX" make install
    else
        sudo make install
    fi
}

set -e

local orig_pwd=$PWD


tmproot=${TMPDIR:-/tmp}
tempdir=$tmproot/git-extras/$$

echo "Setting up 'git-extras'..."

rm -rf "$tempdir"
mkdir -p "$tempdir"
cd "$tempdir"

echo "Downloading source code..."
git clone https://github.com/tj/git-extras.git &> /dev/null
cd git-extras
git checkout \
        $(git describe --tags $(git rev-list --tags --max-count=1)) \
        &> /dev/null

echo "Installing..."
if [ $(expr substr "$platform" 1 9) = "CYGWIN_NT" ] || \
  [ $(expr substr "$platform" 1 10) = "MINGW32_NT" ] || \
  [ $(expr substr "$platform" 1 10) = "MINGW64_NT" ]; then
  ./install.cmd "$PREFIX"
else
  make_install
end

cd $orig_pwd
rm -rf "$tempdir" &>/dev/null

