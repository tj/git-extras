# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file

	PATH="$BATS_TEST_DIRNAME/bin:$PATH"
}

setup() {
	test_util.cd_test

	test_util.git_init
	touch ./browse_this
	git add ./browse_this
	git commit -m 'Add test file'
}

get_file_uri() {
	local mode=$1
	local filename=$2

	local commit_hash=
	commit_hash=$(git rev-parse HEAD)
	if [ "$mode" = 'github' ]; then
		REPLY="https://github.com/tj/git-extras/blob/$commit_hash/${filename}"
	elif [ "$mode" = 'gitlab' ]; then
		REPLY="https://gitlab.com/tj/git-extras/-/blob/${commit_hash}/${filename}"
	elif [ "$mode" = 'bitbucket' ]; then
		REPLY="https://bitbucket.org/tj/git-extras/src/${commit_hash}/${filename}"
	fi
}

@test "works with mac and github" {
	get_file_uri github ./browse_this
	local expected_url=$REPLY

	git remote add upstream https://github.com/tj/git-extras
	OSTYPE=darwin run git browse upstream ./browse_this
	assert_output "open $expected_url"
	assert_success
}

@test "works with mac and gitlab" {
	get_file_uri gitlab ./browse_this
	local expected_url=$REPLY

	git remote add upstream https://gitlab.com/tj/git-extras
	OSTYPE=darwin run git browse upstream ./browse_this
	assert_output "open $expected_url"
	assert_success
}

@test "works with mac and bitbucket" {
	get_file_uri bitbucket ./browse_this
	local expected_url=$REPLY

	git remote add upstream https://bitbucket.org/tj/git-extras
	OSTYPE=darwin run git browse upstream ./browse_this
	assert_output "open $expected_url"
	assert_success
}

@test "works with windows and github" {
	get_file_uri github ./browse_this
	local expected_url=$REPLY

	git remote add upstream https://github.com/tj/git-extras
	OSTYPE=msys run git browse upstream ./browse_this
	assert_output "start $expected_url"
	assert_success
}

@test "works with windows and gitlab" {
	get_file_uri gitlab ./browse_this
	local expected_url=$REPLY

	git remote add upstream https://gitlab.com/tj/git-extras
	OSTYPE=msys run git browse upstream ./browse_this
	assert_output "start $expected_url"
	assert_success
}

@test "works with windows and bitbucket" {
	get_file_uri bitbucket ./browse_this
	local expected_url=$REPLY

	git remote add upstream https://bitbucket.org/tj/git-extras
	OSTYPE=msys run git browse upstream ./browse_this
	assert_output "start $expected_url"
	assert_success
}

@test "works with linux and github" {
	get_file_uri github ./browse_this
	local expected_url=$REPLY

	git remote add upstream https://github.com/tj/git-extras
	OSTYPE=linux-gnu run git browse upstream ./browse_this
	assert_output "xdg-open $expected_url"
	assert_success
}

@test "works with linux and gitlab" {
	get_file_uri gitlab ./browse_this
	local expected_url=$REPLY

	git remote add upstream https://gitlab.com/tj/git-extras
	OSTYPE=linux-gnu run git browse upstream ./browse_this
	assert_output "xdg-open $expected_url"
	assert_success
}

@test "works with linux and bitbucket" {
	get_file_uri bitbucket ./browse_this
	local expected_url=$REPLY

	git remote add upstream https://bitbucket.org/tj/git-extras
	OSTYPE=linux-gnu run git browse upstream ./browse_this
	assert_output "xdg-open $expected_url"
	assert_success
}
