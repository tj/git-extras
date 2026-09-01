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
	git branch merged-branch
	git branch unmerged-branch
	git checkout unmerged-branch
	git commit --allow-empty -m "Unmerged commit"
	git checkout main
}

@test "show-merged-branches lists merged branches but not default branch" {
	run git show-merged-branches
	assert_output "merged-branch"
	assert_success
}

@test "show-unmerged-branches lists unmerged branches" {
	run git show-unmerged-branches
	assert_output "unmerged-branch"
	assert_success
}

@test "delete-merged-branches deletes merged branches and preserves default and unmerged branches" {
	run git delete-merged-branches
	assert_success

	run git branch --list
	assert_line -p "main"
	assert_line -p "unmerged-branch"
	refute_line -p "merged-branch"
}

@test "delete-merged-branches when checked out on feature branch protects default branch" {
	git branch merged-feature
	git checkout unmerged-branch
	run git delete-merged-branches
	assert_success

	run git branch --list
	assert_line -p "main"
	assert_line -p "unmerged-branch"
	refute_line -p "merged-feature"
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
