# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file
	test_util.install_command changelog
}

setup() {
	test_util.cd_test
	test_util.git_init
}

@test "excludes commits matching a pathspec" {
	mkdir src docs
	touch src/keep
	git add .
	git commit -m 'keep commit'
	touch docs/exclude
	git add .
	git commit -m 'exclude commit'

	run git changelog --all --list --stdout --exclude docs
	assert_success
	assert_output '  * keep commit'
}
