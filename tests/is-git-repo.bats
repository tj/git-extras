# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file
}

setup() {
	test_util.cd_test
}

@test "is_git_repo succeeds inside a normal (non-bare) repository" {
	test_util.git_init

	run bash "$BATS_TEST_DIRNAME/../helper/is-git-repo"
	assert_success
}

@test "is_git_repo succeeds inside a bare repository (see #1238)" {
	git init --bare --initial-branch main repo.git
	cd repo.git

	run bash "$BATS_TEST_DIRNAME/../helper/is-git-repo"
	assert_success
}

@test "is_git_repo fails outside of a repository" {
	run bash "$BATS_TEST_DIRNAME/../helper/is-git-repo"
	assert_failure
	assert_output 'Not a git repo!'
}
