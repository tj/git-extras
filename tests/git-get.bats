# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file
	test_util.install_command get
}

setup() {
	test_util.cd_test

	test_util.git_init
	git commit --allow-empty -m "Initial commit"

	clone_path="$BATS_TEST_TMPDIR/clone-path"
	git config --global git-extras.get.clone-path "$clone_path"

	origin_path="$BATS_TEST_TMPDIR/origin"
	git clone -q "$PWD" "$origin_path"
}

@test "clones into flat directory by default" {
	run git get "$origin_path"
	assert_success

	assert [ -d "$clone_path/origin/.git" ]
}

@test "passes extra arguments to git clone" {
	run git get "$origin_path" --depth 1
	assert_success

	assert [ -d "$clone_path/origin/.git" ]
}

@test "--nested errors on unparsable URL" {
	run git get --nested "not-a-url"
	assert_failure
	assert_line -p 'ERROR: Could not parse repository URL: not-a-url'
	assert_line -p '- https://github.com/owner/repo'
	assert_line -p '- git@github.com:owner/repo'
}

@test "--nested parses https URLs" {
	# Rewrite the URL to the local origin so the clone succeeds
	git config --global url."$origin_path".insteadOf "https://example.com/owner/repo.git"

	run git get --nested "https://example.com/owner/repo.git"
	assert_success

	assert [ -d "$clone_path/example.com/owner/repo/.git" ]
}

@test "--nested parses ssh URLs" {
	# Rewrite the URL to the local origin so no ssh is needed
	git config --global url."$origin_path".insteadOf "git@example.com:owner/repo.git"

	run git get --nested "git@example.com:owner/repo.git"
	assert_success

	assert [ -d "$clone_path/example.com/owner/repo/.git" ]
}
