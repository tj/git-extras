#!/bin/sh

setUp() {
    working_dir=`pwd`
    repository_dir=/tmp/git-extras-tests
    mkdir -p $repository_dir
    git init $repository_dir > /dev/null
    cd $repository_dir
}

tearDown() {
    cd $working_dir
    rm -rf /tmp/git-extras-tests
}

testNoFilename() {
    result=`git touch 2>&1`
    assertSame "${result}" "filename required"
}

testOneFile() {
    result=`git touch testfile.txt`
    assertSame "${result}" ""
    result=`git status -s`
    assertSame "${result}" "A  testfile.txt"
}

testTwoFiles() {
    # TODO: Check if this is the correct behavior
    result=`git touch testfile1.txt testfile2.txt`
    assertSame "${result}" ""
    result=`git status -s`
    assertSame "${result}" "A  \"testfile1.txt testfile2.txt\""
}
