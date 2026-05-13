# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file
}

setup() {
	test_util.cd_test

	test_util.git_init
	git commit --allow-empty -m "Initial commit"
	git branch A
	git branch B
	git checkout A
	printf '%s\n' 'a' > tmpfile
	git add .
	git commit -m A
	git checkout B
	printf '%s\n' 'b' > tmpfile
	git add .
	git commit -m B
	git status
}

@test "works with cherry pick" {
	run git cherry-pick A
	assert_failure

	run git status
	assert_line -p 'You are currently cherry-picking commit'
	assert_line -p 'Unmerged paths:'
	assert_success

	run git abort
	assert_success

	run git status
	assert_line -p 'nothing to commit, working tree clean'
	assert_success
}

@test "works with merge" {
	run git merge A
	assert_failure

	run git status
	assert_line -p 'You have unmerged paths'
	assert_line -p 'Unmerged paths:'
	assert_success

	run git abort
	assert_success

	run git status
	assert_line -p 'nothing to commit, working tree clean'
	assert_success
}

@test "works with rebase" {
	run git rebase A
	assert_failure

	run git status
	assert_line -p 'You are currently rebasing branch'
	assert_line -p 'Unmerged paths:'
	assert_success

	run git abort
	assert_success

	run git status
	assert_line -p 'nothing to commit, working tree clean'
	assert_success
}

@test "works with revert" {
	run git revert A
	assert_failure

	run git status
	assert_line -p 'You are currently reverting commit'
	assert_line -p 'Unmerged paths:'
	assert_success

	run git abort
	assert_success

	run git status
	assert_line -p 'nothing to commit, working tree clean'
	assert_success
}
