# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file
	test_util.install_command cp
}

setup() {
	test_util.cd_test
	test_util.git_init
	printf 'original\n' > original.txt
	git add original.txt
	git commit -m 'initial'
}

@test "prefixes all three copy commits when requested" {
	run git cp --message-prefix '#1252 ' original.txt duplicate.txt
	assert_success
	run git log --format=%s
	assert_success
	assert_line '#1252 Copy original.txt into duplicate.txt'
	assert_line '#1252 --Restore original.txt'
	assert_line '#1252 --Duplicate original.txt history into duplicate.txt'
	[ -f original.txt ]
	[ -f duplicate.txt ]
}

@test "rejects a missing prefix without changing the repository" {
	run git cp original.txt duplicate.txt --message-prefix
	assert_failure 30
	[ ! -e duplicate.txt ]
	[ "$(git rev-list --count HEAD)" -eq 1 ]
}

@test "keeps existing commit messages without the option" {
	run git cp original.txt duplicate.txt
	assert_success
	run git log --format=%s
	assert_success
	assert_line 'Copy original.txt into duplicate.txt'
	assert_line '--Restore original.txt'
	assert_line '--Duplicate original.txt history into duplicate.txt'
}
