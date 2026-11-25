# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file
	test_util.install_command missing
}

setup() {
	test_util.cd_test

	test_util.git_init
	git commit --allow-empty -m "Initial commit"
	git switch -c feature
	mkdir feature src
	printf '%s\n' 'a' > feature/file
	git add feature/file
	git commit -m "Change feature dir"
	printf '%s\n' 'b' > src/file
	git add src/file
	git commit -m "Change src dir"
	git switch main
}

@test "lists commits missing from either branch" {
	run git missing main feature
	assert_success
	assert_line -p "Change feature dir"
	assert_line -p "Change src dir"
}

@test "limits commits to the given pathspec" {
	run git missing main feature -- src
	assert_success
	assert_line -p "Change src dir"
	refute_line -p "Change feature dir"
}

@test "does not treat branch names as pathspec" {
	run git missing main feature -- does-not-exist
	assert_success
	assert_output ""
}
