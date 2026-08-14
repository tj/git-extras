# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file
	test_util.install_command archive-file
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
	git config git-extras.default-branch main

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
	local repo_dir="$BATS_TEST_TMPDIR/backslash\\dir"
	mkdir "$repo_dir"
	cd "$repo_dir"

	test_util.git_init
	printf '%s\n' 'data' > tmpfile
	git add .
	git commit -m 'test: add data'
	git checkout -b default

	run git archive-file
	assert_success

	local describe_output=
	describe_output=$(git describe --always --long)
	assert_file_exists "backslash-dir.$describe_output.default.zip"
}

@test "archive file on tag name has slash" {
	git tag --delete 0.1.0
	git tag 0.1.0/slash -m 'bump: 0.1.0'

	run git archive-file
	assert_success

	local describe_output=
	describe_output=$(git describe --always --long)
	assert_file_exists "${PWD##*/}.${describe_output//\//-}.zip"
}
