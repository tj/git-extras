#!/usr/bin/env bats
# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file
}

setup() {
	test_util.cd_test
	test_util.git_init

	# Source the utility file
	source "$BATS_TEST_DIRNAME/../helper/git-extra-utility"
}

# Tests for git_extra_mktemp
@test "git_extra_mktemp: creates a temporary file" {
	local temp_file
	temp_file=$(git_extra_mktemp)

	# Check that file was created
	[[ -e "$temp_file" ]]

	# Cleanup
	rm -f "$temp_file"
}

@test "git_extra_mktemp: creates files with unique names" {
	local temp_file1 temp_file2
	temp_file1=$(git_extra_mktemp)
	temp_file2=$(git_extra_mktemp)

	# Check that files are different
	[[ "$temp_file1" != "$temp_file2" ]]

	# Cleanup
	rm -f "$temp_file1" "$temp_file2"
}

@test "git_extra_mktemp: temp files are writable" {
	local temp_file
	temp_file=$(git_extra_mktemp)

	# Write to the file
	echo "test content" > "$temp_file"

	# Verify content
	[[ "$(cat "$temp_file")" == "test content" ]]

	# Cleanup
	rm -f "$temp_file"
}

# Tests for git_extra_default_branch
@test "git_extra_default_branch: respects git-extras.default-branch config" {
	git config git-extras.default-branch "custom-branch"

	result=$(git_extra_default_branch)

	[[ "$result" == "custom-branch" ]]
}

@test "git_extra_default_branch: detects from remote HEAD when origin exists" {
	# Setup a remote with main branch (we're already on main from setup)
	echo "content" > file.txt
	git add file.txt
	git commit -m "initial commit"

	# Create a bare repo to act as remote
	local remote_dir="$BATS_TEST_TMPDIR/remote.git"
	git init --bare "$remote_dir"
	git remote add origin "$remote_dir"
	git push -u origin main
	git remote set-head origin main

	result=$(git_extra_default_branch)

	[[ "$result" == "main" ]]
}

@test "git_extra_default_branch: respects init.defaultBranch config when no remote" {
	git config init.defaultBranch "develop"

	result=$(git_extra_default_branch)

	[[ "$result" == "develop" ]]
}

@test "git_extra_default_branch: detects 'main' branch when it exists locally" {
	# We're already on main from setup
	result=$(git_extra_default_branch)

	[[ "$result" == "main" ]]
}

@test "git_extra_default_branch: detects 'master' branch when it exists locally" {
	# Create a new repo with master branch
	cd "$BATS_TEST_TMPDIR"
	rm -rf test_master
	mkdir test_master
	cd test_master
	git init --initial-branch master
	git config user.name 'Name'
	git config user.email 'name@example.com'
	# Need to create a commit so the branch actually exists
	echo "content" > file.txt
	git add file.txt
	git commit -m "initial commit"

	source "$BATS_TEST_DIRNAME/../helper/git-extra-utility"
	result=$(git_extra_default_branch)

	[[ "$result" == "master" ]]
}

@test "git_extra_default_branch: prefers 'main' over 'master' when both exist" {
	# First commit to establish main branch
	echo "content" > file.txt
	git add file.txt
	git commit -m "initial commit"

	# Create master branch
	git checkout -b master
	echo "content2" > file2.txt
	git add file2.txt
	git commit -m "master commit"

	# Switch back to main
	git checkout main

	result=$(git_extra_default_branch)

	[[ "$result" == "main" ]]
}

@test "git_extra_default_branch: detects 'trunk' branch" {
	# Create a new repo with trunk branch
	cd "$BATS_TEST_TMPDIR"
	rm -rf test_trunk
	mkdir test_trunk
	cd test_trunk
	git init --initial-branch trunk
	git config user.name 'Name'
	git config user.email 'name@example.com'
	# Need to create a commit so the branch actually exists
	echo "content" > file.txt
	git add file.txt
	git commit -m "initial commit"

	source "$BATS_TEST_DIRNAME/../helper/git-extra-utility"
	result=$(git_extra_default_branch)

	[[ "$result" == "trunk" ]]
}

@test "git_extra_default_branch: detects 'development' branch" {
	# Create a new repo with development branch
	cd "$BATS_TEST_TMPDIR"
	rm -rf test_dev
	mkdir test_dev
	cd test_dev
	git init --initial-branch development
	git config user.name 'Name'
	git config user.email 'name@example.com'
	# Need to create a commit so the branch actually exists
	echo "content" > file.txt
	git add file.txt
	git commit -m "initial commit"

	source "$BATS_TEST_DIRNAME/../helper/git-extra-utility"
	result=$(git_extra_default_branch)

	[[ "$result" == "development" ]]
}

@test "git_extra_default_branch: falls back to 'main' when no branches exist" {
	# Create a completely empty repo
	cd "$BATS_TEST_TMPDIR"
	rm -rf test_empty
	mkdir test_empty
	cd test_empty
	git init
	git config user.name 'Name'
	git config user.email 'name@example.com'

	source "$BATS_TEST_DIRNAME/../helper/git-extra-utility"
	result=$(git_extra_default_branch)

	[[ "$result" == "main" ]]
}

@test "git_extra_default_branch: git-extras.default-branch takes precedence over remote HEAD" {
	# Setup a remote with main branch (we're already on main from setup)
	echo "content" > file.txt
	git add file.txt
	git commit -m "initial commit"

	local remote_dir="$BATS_TEST_TMPDIR/remote.git"
	git init --bare "$remote_dir"
	git remote add origin "$remote_dir"
	git push -u origin main
	git remote set-head origin main

	# Set a different default in config
	git config git-extras.default-branch "custom"

	result=$(git_extra_default_branch)

	# Should use config value, not remote HEAD
	[[ "$result" == "custom" ]]
}

@test "git_extra_default_branch: git-extras.default-branch takes precedence over init.defaultBranch" {
	git config init.defaultBranch "develop"
	git config git-extras.default-branch "custom"

	result=$(git_extra_default_branch)

	[[ "$result" == "custom" ]]
}

@test "git_extra_default_branch: remote HEAD takes precedence over init.defaultBranch" {
	# Setup a remote with main branch
	echo "content" > file.txt
	git add file.txt
	git commit -m "initial commit"

	local remote_dir="$BATS_TEST_TMPDIR/remote.git"
	git init --bare "$remote_dir"
	git remote add origin "$remote_dir"
	git push -u origin main
	git remote set-head origin main

	# Set a different default in init config
	git config init.defaultBranch "develop"

	result=$(git_extra_default_branch)

	# Should use remote HEAD, not init.defaultBranch
	[[ "$result" == "main" ]]
}
