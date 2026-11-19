# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file
	test_util.install_command unwip
	test_util.install_command undo
}

setup() {
	test_util.cd_test

	test_util.git_init
	git commit --allow-empty -m "Initial commit"
}

@test "undoes a WIP commit" {
	printf '%s\n' 'a' > file
	git add file
	git commit -m "WIP"

	run git unwip
	assert_success

	run git log -1 --pretty=%s
	assert_output "Initial commit"
}

@test "keeps a commit that is not a WIP commit" {
	git commit --allow-empty -m "Not WIP"

	run git unwip
	assert_failure

	run git log -1 --pretty=%s
	assert_output "Not WIP"
}

@test "keeps a commit with an empty message" {
	git commit --allow-empty --allow-empty-message -m ""

	run git unwip
	assert_failure

	run git rev-list --count HEAD
	assert_output "2"
}
