# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file

	PATH="$BATS_TEST_DIRNAME/bin:$PATH"
}

setup() {
	test_util.cd_test

	test_util.git_init
}

get_ci_uri() {
	local mode=$1

	if [ "$mode" = 'github' ]; then
		REPLY="https://github.com/tj/git-extras/actions"
	elif [ "$mode" = 'gitlab' ]; then
		REPLY="https://gitlab.com/tj/git-extras/-/pipelines"
	elif [ "$mode" = 'bitbucket' ]; then
		REPLY="https://bitbucket.org/tj/git-extras/addon/pipelines/home"
	fi
}

@test "works with mac and github" {
	get_ci_uri 'github'
	local expected_url=$REPLY

	git remote add upstream https://github.com/tj/git-extras
	OSTYPE=darwin run git browse-ci upstream
	assert_output "open $expected_url"
	assert_success
}

@test "works with mac and gitlab" {
	get_ci_uri 'gitlab'
	local expected_url=$REPLY

	git remote add upstream https://gitlab.com/tj/git-extras
	OSTYPE=darwin run git browse-ci upstream
	assert_output "open $expected_url"
	assert_success
}

@test "works with mac and bitbucket" {
	get_ci_uri 'bitbucket'
	local expected_url=$REPLY

	git remote add upstream https://bitbucket.org/tj/git-extras
	OSTYPE=darwin run git browse-ci upstream
	assert_output "open $expected_url"
	assert_success
}

@test "works with windows and github" {
	get_ci_uri 'github'
	local expected_url=$REPLY

	git remote add upstream https://github.com/tj/git-extras
	OSTYPE=msys run git browse-ci upstream
	assert_output "start $expected_url"
	assert_success
}

@test "works with windows and gitlab" {
	get_ci_uri 'gitlab'
	local expected_url=$REPLY

	git remote add upstream https://gitlab.com/tj/git-extras
	OSTYPE=msys run git browse-ci upstream
	assert_output "start $expected_url"
	assert_success
}

@test "works with windows and bitbucket" {
	get_ci_uri 'bitbucket'
	local expected_url=$REPLY

	git remote add upstream https://bitbucket.org/tj/git-extras
	OSTYPE=msys run git browse-ci upstream
	assert_output "start $expected_url"
	assert_success
}

@test "works with linux and github" {
	get_ci_uri 'github'
	local expected_url=$REPLY

	git remote add upstream https://github.com/tj/git-extras
	OSTYPE=linux-gnu run git browse-ci upstream
	assert_output "xdg-open $expected_url"
	assert_success
}

@test "works with linux and gitlab" {
	get_ci_uri 'gitlab'
	local expected_url=$REPLY

	git remote add upstream https://gitlab.com/tj/git-extras
	OSTYPE=linux-gnu run git browse-ci upstream
	assert_output "xdg-open $expected_url"
	assert_success
}

@test "works with linux and bitbucket" {
	get_ci_uri 'bitbucket'
	local expected_url=$REPLY

	git remote add upstream https://bitbucket.org/tj/git-extras
	OSTYPE=linux-gnu run git browse-ci upstream
	assert_output "xdg-open $expected_url"
	assert_success
}
