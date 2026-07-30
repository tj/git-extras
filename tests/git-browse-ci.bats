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

mock_uname() {
	local output=$1
	local mock_bin="$BATS_TEST_TMPDIR/bin"

	mkdir -p "$mock_bin"
	printf '#!/usr/bin/env bash\nprintf "%%s\\n" "%s"\n' "$output" > "$mock_bin/uname"
	chmod +x "$mock_bin/uname"
	PATH="$mock_bin:$PATH"
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

@test "works with WSL and github" {
	get_ci_uri 'github'
	local expected_url=$REPLY
	mock_uname microsoft

	git remote add upstream https://github.com/tj/git-extras
	OSTYPE=linux run git browse-ci upstream
	assert_line "powershell.exe -NoProfile start $expected_url"
	assert_success
}

@test "works with WSL and gitlab" {
	get_ci_uri 'gitlab'
	local expected_url=$REPLY
	mock_uname microsoft

	git remote add upstream https://gitlab.com/tj/git-extras
	OSTYPE=linux run git browse-ci upstream
	assert_line "powershell.exe -NoProfile start $expected_url"
	assert_success
}

@test "works with WSL and bitbucket" {
	get_ci_uri 'bitbucket'
	local expected_url=$REPLY
	mock_uname microsoft

	git remote add upstream https://bitbucket.org/tj/git-extras
	OSTYPE=linux run git browse-ci upstream
	assert_line "powershell.exe -NoProfile start $expected_url"
	assert_success
}

@test "works with linux without Microsoft kernel and github" {
	get_ci_uri 'github'
	local expected_url=$REPLY
	mock_uname no-micro-soft

	git remote add upstream https://github.com/tj/git-extras
	OSTYPE=linux run git browse-ci upstream
	assert_output "xdg-open $expected_url"
	assert_success
}

@test "works with linux without Microsoft kernel and gitlab" {
	get_ci_uri 'gitlab'
	local expected_url=$REPLY
	mock_uname no-micro-soft

	git remote add upstream https://gitlab.com/tj/git-extras
	OSTYPE=linux run git browse-ci upstream
	assert_output "xdg-open $expected_url"
	assert_success
}

@test "works with linux without Microsoft kernel and bitbucket" {
	get_ci_uri 'bitbucket'
	local expected_url=$REPLY
	mock_uname no-micro-soft

	git remote add upstream https://bitbucket.org/tj/git-extras
	OSTYPE=linux run git browse-ci upstream
	assert_output "xdg-open $expected_url"
	assert_success
}

@test "falls back to xdg-open on an unknown OS with github" {
	get_ci_uri 'github'
	local expected_url=$REPLY

	git remote add upstream https://github.com/tj/git-extras
	OSTYPE=unique-system run git browse-ci upstream
	assert_output "xdg-open $expected_url"
	assert_success
}

@test "falls back to xdg-open on an unknown OS with gitlab" {
	get_ci_uri 'gitlab'
	local expected_url=$REPLY

	git remote add upstream https://gitlab.com/tj/git-extras
	OSTYPE=unique-system run git browse-ci upstream
	assert_output "xdg-open $expected_url"
	assert_success
}

@test "falls back to xdg-open on an unknown OS with bitbucket" {
	get_ci_uri 'bitbucket'
	local expected_url=$REPLY

	git remote add upstream https://bitbucket.org/tj/git-extras
	OSTYPE=unique-system run git browse-ci upstream
	assert_output "xdg-open $expected_url"
	assert_success
}

@test "opens an empty URL for an unknown site" {
	git remote add upstream https://unknown-site.com/tj/git-extras.git

	OSTYPE=unique-system run git browse-ci upstream
	assert_output "xdg-open "
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
