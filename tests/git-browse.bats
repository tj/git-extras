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

mock_uname() {
	local output=$1
	local mock_bin="$BATS_TEST_TMPDIR/bin"

	mkdir -p "$mock_bin"
	printf '#!/usr/bin/env bash\nprintf "%%s\\n" "%s"\n' "$output" > "$mock_bin/uname"
	chmod +x "$mock_bin/uname"
	PATH="$mock_bin:$PATH"
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

@test "works with WSL and github" {
	get_file_uri github ./browse_this
	local expected_url=$REPLY
	mock_uname microsoft

	git remote add upstream https://github.com/tj/git-extras
	OSTYPE=linux run git browse upstream ./browse_this
	assert_line "powershell.exe -NoProfile start $expected_url"
	assert_success
}

@test "works with WSL and gitlab" {
	get_file_uri gitlab ./browse_this
	local expected_url=$REPLY
	mock_uname microsoft

	git remote add upstream https://gitlab.com/tj/git-extras
	OSTYPE=linux run git browse upstream ./browse_this
	assert_line "powershell.exe -NoProfile start $expected_url"
	assert_success
}

@test "works with WSL and bitbucket" {
	get_file_uri bitbucket ./browse_this
	local expected_url=$REPLY
	mock_uname microsoft

	git remote add upstream https://bitbucket.org/tj/git-extras
	OSTYPE=linux run git browse upstream ./browse_this
	assert_line "powershell.exe -NoProfile start $expected_url"
	assert_success
}

@test "works with linux without Microsoft kernel and github" {
	get_file_uri github ./browse_this
	local expected_url=$REPLY
	mock_uname no-micro-soft

	git remote add upstream https://github.com/tj/git-extras
	OSTYPE=linux run git browse upstream ./browse_this
	assert_output "xdg-open $expected_url"
	assert_success
}

@test "works with linux without Microsoft kernel and gitlab" {
	get_file_uri gitlab ./browse_this
	local expected_url=$REPLY
	mock_uname no-micro-soft

	git remote add upstream https://gitlab.com/tj/git-extras
	OSTYPE=linux run git browse upstream ./browse_this
	assert_output "xdg-open $expected_url"
	assert_success
}

@test "works with linux without Microsoft kernel and bitbucket" {
	get_file_uri bitbucket ./browse_this
	local expected_url=$REPLY
	mock_uname no-micro-soft

	git remote add upstream https://bitbucket.org/tj/git-extras
	OSTYPE=linux run git browse upstream ./browse_this
	assert_output "xdg-open $expected_url"
	assert_success
}

@test "falls back to xdg-open on an unknown OS with github" {
	get_file_uri github ./browse_this
	local expected_url=$REPLY

	git remote add upstream https://github.com/tj/git-extras
	OSTYPE=unique-system run git browse upstream ./browse_this
	assert_output "xdg-open $expected_url"
	assert_success
}

@test "falls back to xdg-open on an unknown OS with gitlab" {
	get_file_uri gitlab ./browse_this
	local expected_url=$REPLY

	git remote add upstream https://gitlab.com/tj/git-extras
	OSTYPE=unique-system run git browse upstream ./browse_this
	assert_output "xdg-open $expected_url"
	assert_success
}

@test "falls back to xdg-open on an unknown OS with bitbucket" {
	get_file_uri bitbucket ./browse_this
	local expected_url=$REPLY

	git remote add upstream https://bitbucket.org/tj/git-extras
	OSTYPE=unique-system run git browse upstream ./browse_this
	assert_output "xdg-open $expected_url"
	assert_success
}

@test "adds github line numbers" {
	get_file_uri github ./browse_this
	local expected_url="$REPLY#L10-L20"

	git remote add upstream https://github.com/tj/git-extras
	OSTYPE=unique-system run git browse upstream ./browse_this 10 20
	assert_output "xdg-open $expected_url"
	assert_success
}

@test "adds gitlab line numbers" {
	get_file_uri gitlab ./browse_this
	local expected_url="$REPLY#L10-20"

	git remote add upstream https://gitlab.com/tj/git-extras
	OSTYPE=unique-system run git browse upstream ./browse_this 10 20
	assert_output "xdg-open $expected_url"
	assert_success
}

@test "adds bitbucket line numbers" {
	get_file_uri bitbucket ./browse_this
	local expected_url="$REPLY#lines-10:20"

	git remote add upstream https://bitbucket.org/tj/git-extras
	OSTYPE=unique-system run git browse upstream ./browse_this 10 20
	assert_output "xdg-open $expected_url"
	assert_success
}

@test "opens an unknown site repository" {
	git remote add upstream https://unknown-site.com/tj/git-extras.git

	OSTYPE=unique-system run git browse upstream
	assert_output "xdg-open https://unknown-site.com/tj/git-extras"
	assert_success
}

@test "does not add file or line information for an unknown site" {
	git remote add upstream https://unknown-site.com/tj/git-extras.git

	OSTYPE=unique-system run git browse upstream ./browse_this 10 20
	assert_output "xdg-open https://unknown-site.com/tj/git-extras"
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
