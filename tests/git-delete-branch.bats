# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file
	test_util.install_command delete-branch
}

setup() {
	test_util.cd_test

	git init -q --bare remote.git
	git clone -q remote.git work
	cd work
	git config user.name 'Name'
	git config user.email 'name@example.com'
	git commit --allow-empty -m "Initial commit"
	git push -q origin HEAD:main
	git fetch -q
}

@test "delete-branch deletes the remote branch, not the upstream it was created from" {
	git checkout -q -b feat origin/main
	git commit --allow-empty -m "Feature commit"
	git push -q origin feat
	git checkout -q --detach

	run git delete-branch feat
	assert_success

	run git ls-remote --heads origin
	assert_output -p "refs/heads/main"
	refute_output -p "refs/heads/feat"
}
