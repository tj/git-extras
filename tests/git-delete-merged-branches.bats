# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file
	test_util.install_command delete-merged-branches
	test_util.install_command show-merged-branches
	test_util.install_command show-unmerged-branches
}

setup() {
	test_util.cd_test

	test_util.git_init
	git commit --allow-empty -m "Initial commit"
	git branch feature-merged
	git branch feature-unmerged
	git checkout feature-unmerged
	git commit --allow-empty -m "Unmerged commit"
	git checkout main
}

@test "show-merged-branches lists merged branches but not default branch" {
	run git show-merged-branches
	assert_output "feature-merged"
	assert_success
}

@test "show-unmerged-branches lists unmerged branches" {
	run git show-unmerged-branches
	assert_output "feature-unmerged"
	assert_success
}

@test "delete-merged-branches deletes merged branches and preserves default and unmerged branches" {
	run git delete-merged-branches
	assert_success

	run git branch --list
	assert_line -p "main"
	assert_line -p "feature-unmerged"
	refute_line -p "feature-merged"
}

@test "delete-merged-branches when checked out on feature branch protects default branch" {
	git branch other-merged
	git checkout feature-unmerged
	run git delete-merged-branches
	assert_success

	run git branch --list
	assert_line -p "main"
	assert_line -p "feature-unmerged"
	refute_line -p "other-merged"
}

@test "delete-merged-branches handles branch names with special characters" {
	git branch "feature/foo+bar"
	run git show-merged-branches
	assert_line -p "feature/foo+bar"
	assert_success

	run git delete-merged-branches
	assert_success

	run git branch --list
	assert_line -p "main"
	refute_line -p "feature/foo+bar"
}
