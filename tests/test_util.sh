# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/../vendor/bats-all/load.bash"

test_util.setup_file() {
	cd "$BATS_FILE_TMPDIR"

	export GIT_CONFIG_NOSYSTEM=1
	export GIT_CONFIG_GLOBAL="$PWD/git_config"
	export GIT_CONFIG_COUNT=3
	export GIT_CONFIG_KEY_0="user.email"
	export GIT_CONFIG_VALUE_0="name@example.com"
	export GIT_CONFIG_KEY_1="user.name"
	export GIT_CONFIG_VALUE_1="Name"
	# This removes default warning about default "master" branch on some Git versions.
	export GIT_CONFIG_KEY_2="init.defaultBranch"
	export GIT_CONFIG_VALUE_2="main"

	# Append to path so that we can access all commands included from git-extras
	# TODO: This currently breaks with commands that are included in "not_needed_git_repo" etc.
	PATH="$BATS_TEST_DIRNAME/../bin:$PATH"
}

test_util.cd_test() {
	cd "$BATS_TEST_TMPDIR"
}
