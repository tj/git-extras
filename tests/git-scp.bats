# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file
}

setup() {
	test_util.cd_test

	test_util.git_init
	printf '%s\n' 'hello' > tracked.txt
	git add tracked.txt
	git commit -m 'Initial commit'

	# never created: neither test below should ever touch it
	git remote add fake "$BATS_TEST_TMPDIR/never-created"

	printf '%s\n' 'world' >> tracked.txt
}

@test "dry-run previews the sync without changing anything" {
	run git scp -n fake
	assert_success
	assert_line -p 'tracked.txt'
	assert_line -p 'DRY RUN'

	run git status --short
	assert_line -p 'M tracked.txt'

	run test -e "$BATS_TEST_TMPDIR/never-created"
	assert_failure
}

@test "interactive mode aborts without syncing when declined" {
	run bash -c 'echo n | git scp -i fake'
	assert_success
	assert_line -p 'Aborted, nothing synced.'

	run git status --short
	assert_line -p 'M tracked.txt'

	run test -e "$BATS_TEST_TMPDIR/never-created"
	assert_failure
}
