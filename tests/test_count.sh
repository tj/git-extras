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

testCountTotalCommit() {
    touch file.txt 
    git add file.txt
    git commit --author="testing author <testing@author.com>" -m "Adding an empty file" > /dev/null
    result=`git count`
    assertSame "${result}" "total 1"
}

testCountUserCommits() {
    touch file.txt 
    git add file.txt
    git commit --author="testing author <testing@author.com>"  -m "Adding an empty file" > /dev/null
    result=`git count --all`
    assertSame "${result}" "testing author (1)

total 1"

    echo "line1" >> file.txt 
    git add file.txt
    git commit --author="testing author <testing@author.com>"  -m "Adding line1" > /dev/null
    result=`git count --all`
    assertSame "${result}" "testing author (2)

total 2"

    echo "line2" >> file.txt 
    git add file.txt
    git commit --author="other testing author <other.testing@author.com>"  -m "Adding line2" > /dev/null
    result=`git count --all`
    assertSame "${result}" "testing author (2)
other testing author (1)

total 3"

    echo "other" >> file2.txt 
    git add file2.txt
    git commit --author="testing author <testing@author.com>"  -m "Adding other file" > /dev/null
    result=`git count --all`
    assertSame "${result}" "testing author (3)
other testing author (1)

total 4"

    result=`git count --all file2.txt`
    assertSame "${result}" "testing author (1)

total 4"
}
