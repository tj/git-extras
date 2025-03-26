#!/usr/bin/env bats

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file
}

setup() {
	test_util.cd_test

	test_util.git_init
	git commit -m 'Initial commit' --allow-empty

	git switch -c A main
	printf '%s\n' 'a' >> ./tmp_file
	git add ./tmp_file
	git commit -m 'A'

	git switch -c B main
	printf '%s\n' 'b' >> ./tmp_file
	git add ./tmp_file
	git commit -m 'B'
}

@test "works with cherry pick" {
	run git cherry-pick A
	assert_failure

	run git status
	assert_line -p 'Unmerged paths:'
	assert_success

	git add .
	GIT_EDITOR=cat run git continue
	assert_success

	run git status
	assert_line -p 'nothing to commit, working tree clean'
	assert_success
}

@test "works with merge" {
	run git merge A
	assert_failure

	run git status
	assert_line -p 'Unmerged paths:'
	assert_success

	git add .
	GIT_EDITOR=cat run git continue
	assert_success

	run git status
	assert_line -p 'nothing to commit, working tree clean'
	assert_success
}

@test "works with rebase" {
	run git rebase A
	assert_failure

	run git status
	assert_line -p 'Unmerged paths:'
	assert_success

	git add .
	GIT_EDITOR=cat run git continue
	assert_success

	run git status
	assert_line -p 'nothing to commit, working tree clean'
	assert_success
}

@test "works with revert" {
	run git revert A
	assert_failure

	run git status
	assert_line -p 'Unmerged paths:'
	assert_success

	git add .
	GIT_EDITOR=cat run git continue
	assert_failure # TODO: Git seems to do nothing and error out?

	run git status
	assert_line -p 'nothing to commit, working tree clean'
	assert_success
}
