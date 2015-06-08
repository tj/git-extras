#!/bin/bash

make_install() {
    if [ -n "$PREFIX" ]
    then
        PREFIX="$PREFIX" make install
    else
        sudo make install
    fi
}

cd /tmp \
    && rm -rf ./git-extras \
    && echo "Setting up 'git-exras'...." \
    && git clone https://github.com/tj/git-extras.git &> /dev/null \
    && cd git-extras \
    && git checkout \
        $(git describe --tags $(git rev-list --tags --max-count=1)) \
        &> /dev/null \
    && make_install

