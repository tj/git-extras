# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"


## Dry run does not need actual files etc
@test "works with -d" {
	run git adopt -d foo foo bar/baz

	assert_line -n 1 -e 'mkdir -p'
	assert_line -n 2 -e 'mv foo'
	assert_line -n 3 -e 'ln -rs'
	assert_line -n 4 -e 'git -C .* add'
	assert_line -n 5 -e 'mkdir -p'
	assert_line -n 6 -e 'mv bar/baz'
	assert_line -n 7 -e 'ln -rs'
	assert_line -n 8 -e 'git -C .* add'
	assert_line -n 9 -e 'git -C .* commit -e -m adopt: foo'
	assert_success

}

