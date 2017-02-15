#!/bin/sh

setUp() {
    mkdir -p /tmp/git-extras-tests
    HOME=/tmp/git-extras-tests
}

tearDown() {
    rm -rf /tmp/git-extras-tests
}

testAddOneAlias() {
    git alias testing log
    aliases_list=`git alias`
    assertSame "${aliases_list}" "testing = log"
    aliases_list=`git alias testing`
    assertSame "${aliases_list}" "testing = log"
}

testAddTwoAliases() {
    git alias testing log
    git alias testing2 diff
    aliases_list=`git alias`
    assertSame "${aliases_list}" "testing2 = diff
testing = log"
    aliases_list=`git alias testing2`
    assertSame "${aliases_list}" "testing2 = diff"
}
