# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file

	PATH="$BATS_TEST_DIRNAME/bin:$PATH"
}

setup() {
	test_util.cd_test

	test_util.git_init
	touch ./tracked
	git add ./tracked
	git commit -m 'Initial commit'

	# Local bare "remote" standing in for a real GitLab/Forgejo instance,
	# with a merge-requests ref and a pull ref pointing at the same commit.
	remote_dir="$BATS_TEST_TMPDIR/remote.git"
	git init --bare --initial-branch main "$remote_dir"
	git push "$remote_dir" HEAD:refs/merge-requests/51/head
	git push "$remote_dir" HEAD:refs/pull/51/head

	git remote add origin "$remote_dir"
}

@test "checks out a merge request by numeric id" {
	run git mr 51
	assert_success
	assert_output --partial "refs/merge-requests/51/head"

	run git rev-parse --abbrev-ref HEAD
	assert_output 'mr/51'

	run git config --get branch.mr/51.merge
	assert_output 'refs/merge-requests/51/head'
}

@test "checks out a merge request by numeric id and explicit remote" {
	run git mr 51 "$remote_dir"
	assert_success
	assert_output --partial "refs/merge-requests/51/head"

	run git rev-parse --abbrev-ref HEAD
	assert_output 'mr/51'
}

@test "checks out a Forgejo/Codeberg pull request by URL" {
	# git-mr only recognizes http(s) URLs, so rewrite the fake Codeberg URL
	# to our local bare "remote" via insteadOf rather than needing a real
	# HTTP(S) endpoint.
	git config --local url."$remote_dir".insteadOf "https://codeberg.org/owner/repository.git"

	run git mr "https://codeberg.org/owner/repository/pulls/51"
	assert_success
	assert_output --partial "refs/pull/51/head"

	run git rev-parse --abbrev-ref HEAD
	assert_output 'mr/51'

	run git config --get branch.mr/51.merge
	assert_output 'refs/pull/51/head'

	run git config --get branch.mr/51.remote
	assert_output 'https://codeberg.org/owner/repository.git'
}
