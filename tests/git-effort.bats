# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file
	test_util.install_command effort
}

setup() {
	test_util.cd_test

	test_util.git_init
	printf '%s\n' 'a' > 'plain.txt'
	printf '%s\n' 'a' > 'ünï.txt'
	git add .
	git commit -m "Initial commit"
}

@test "lists files with non-ASCII names" {
	run git effort
	assert_success
	assert_output --partial 'ünï.txt'
}

@test "lists files with newlines in their names" {
	printf '%s\n' 'a' > $'new\nline.txt'
	git add .
	git commit -m "Add file with newline"
	run git effort
	assert_success
	assert_output --partial $'new\nline.txt'
}
