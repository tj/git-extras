# shellcheck shell=bash

# Bats has some very (official) nifty utility libraries to make testing easier.
# For example, `bats-support` adds `fail()`
# For example, `bats-assert` adds `assert()`, `assert_success`, `assert_output`.
# These helper functions:
# - _Significantly_ improve error messages (this is the main reason why I like to use these)
# - Make the test more semantic and readable (ex. assert_success reads better than [ $? == 0 ])
# I created a repository that combines each of the three Bats utility libraries. This makes testing easier, but separate submodules for each Bats utility library can be crated (ex. vendor/bats-all, vendor/bats-support, vendor/bats-assert)
# This `load.bash` sources all Bats utility libraries
source "$BATS_TEST_DIRNAME/../vendor/bats-all/load.bash"

# Various helper functions. I always prefix them with "test_util" so their intent and
# location of definition (this file) is obvious wherever they are used.

test_util.setup_file() {
    # Bats automatically sets 'set -e', so we don't have to do any "|| exit 1" stuff
    cd "$BATS_FILE_TMPDIR"

    # Export some variables so Git neither reads nor mutates the users' Git config.
    export GIT_CONFIG_NOSYSTEM=1
    export GIT_CONFIG_GLOBAL="$PWD/git_config"
    # This removes default warning about default "master" branch on some Git versions.
    git config --global init.defaultBranch main

    # Append to path so that we can access all commands included from git-extras
    # TODO: This currently breaks with commands that are included in "not_needed_git_repo" etc.
    PATH="$BATS_TEST_DIRNAME/../bin:$PATH"
}

test_util.cd_test() {
    cd "$BATS_TEST_TMPDIR"
}
