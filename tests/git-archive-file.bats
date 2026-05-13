# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file
}

setup() {
	test_util.cd_test

	test_util.git_init
	printf '%s\n' 'data' > tmpfile
	git add .
	git commit -m 'test: add data'
	git tag 0.1.0 -m 'bump: 0.1.0'
}

@test "archive file on tags branch" {
	git checkout -b tags0.1.0
	run git archive-file
	assert_success

	local describe_output=
	describe_output=$(git describe)
	assert_file_exists "${PWD##*/}.$describe_output.zip"
}

@test "archive file on any not tags branch without default branch" {
	git checkout -b not-tags-branch
	run git archive-file
	assert_success

	local describe_output=
	describe_output=$(git describe --always --long)
	assert_file_exists "${PWD##*/}.$describe_output.not-tags-branch.zip"
}

@test "archive file on any not tags branch with default branch" {
	skip "Not working as expected"

	run git archive-file
	assert_success

	local describe_output=
	describe_output=$(git describe --always --long)
	assert_file_exists "${PWD##*/}.$describe_output.zip"
}

@test "archive file on branch name has slash" {
	git checkout -b feature/slash
	run git archive-file
	assert_success

	local describe_output=
	describe_output=$(git describe --always --long)
	assert_file_exists "${PWD##*/}.$describe_output.feature-slash.zip"
}

@test "archive file on dirname has backslash" {
	skip
}

@test "archive file on tag name has slash" {
	skip
}
