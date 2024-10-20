# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
    test_util.setup_file
}

setup() {
    test_util.cd_test

    # Any extra setup goes here.
}

@test "blah 1" {
    :
}

@test "blah 2" {
    :
}
