# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/../vendor/bats-all/load.bash"

test_util.setup_file() {
	cd "$BATS_FILE_TMPDIR"

	export GIT_CONFIG_NOSYSTEM=1
	export GIT_CONFIG_GLOBAL="$PWD/git_config"

	# Append to path so that we can access all commands included from git-extras
	# TODO: This currently breaks with commands that are included in "not_needed_git_repo" etc.
	PATH="$BATS_TEST_DIRNAME/../bin:$PATH"
}

test_util.cd_test() {
	cd "$BATS_TEST_TMPDIR"
}

test_util.git_init() {
	git init --initial-branch main
	git config user.name  'Name'
	git config user.email 'name@example.com'
}
