# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file
	test_util.install_command merge-into
}

setup() {
	test_util.cd_test

	test_util.git_init
	printf '%s\n' 'a' > file
	git add .
	git commit -m "Initial commit"
	git branch dest
}

@test "merging with only untracked files leaves an older stash alone" {
	printf '%s\n' 'old work' >> file
	git stash
	printf '%s\n' 'new' > untracked

	run git merge-into dest
	assert_success

	run git stash list
	assert_output --partial 'WIP on main'
	run cat file
	assert_output 'a'
}
