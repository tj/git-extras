# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file
	test_util.install_command squash
}

setup() {
	test_util.cd_test

	test_util.git_init
	printf '%s\n' 'a' > file
	printf '%s\n' 'a' > other
	git add .
	git commit -m "Initial commit"
	git checkout -b feature
	printf '%s\n' 'b' >> file
	git commit -am "b"
	printf '%s\n' 'c' >> file
	git commit -am "c"
	printf '%s\n' 'not ready' >> other
}

@test "squashing a branch does not commit unstaged changes" {
	git checkout main
	run git squash feature "squashed"
	assert_success

	run git diff --name-only
	assert_output 'other'
	run git show --name-only --format= HEAD
	assert_output 'file'
}

@test "squashing commits on the current branch does not commit unstaged changes" {
	run git squash HEAD~2 "squashed"
	assert_success

	run git diff --name-only
	assert_output 'other'
	run git show --name-only --format= HEAD
	assert_output 'file'
}
