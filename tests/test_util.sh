# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/../vendor/bats-all/load.bash"

test_util.setup_file() {
	cd "$BATS_FILE_TMPDIR"

	export GIT_CONFIG_NOSYSTEM=1
	export GIT_CONFIG_GLOBAL="$PWD/git_config"

	# Append to path so that we can access all commands included from git-extras
	# TODO: This currently breaks with commands that are included in "not_needed_git_repo" etc.
	PATH="$BATS_TEST_DIRNAME/../bin:$PATH"
}

test_util.install_command() {
	local command_name="git-$1"
	local install_dir="$BATS_FILE_TMPDIR/bin"
	local target="$install_dir/$command_name"

	mkdir -p "$install_dir"
	{
		head -n 1 "$BATS_TEST_DIRNAME/../bin/$command_name"
		cat "$BATS_TEST_DIRNAME/../helper/reset-env"
		cat "$BATS_TEST_DIRNAME/../helper/git-extra-utility"
		if ! grep -qx "$command_name" "$BATS_TEST_DIRNAME/../not_need_git_repo"; then
			cat "$BATS_TEST_DIRNAME/../helper/is-git-repo"
		fi
		if grep -qx "$command_name" "$BATS_TEST_DIRNAME/../need_git_commit"; then
			cat "$BATS_TEST_DIRNAME/../helper/has-git-commit"
		fi
		tail -n +2 "$BATS_TEST_DIRNAME/../bin/$command_name"
	} > "$target"
	chmod 775 "$target"

	PATH="$install_dir:$PATH"
}

test_util.cd_test() {
	cd "$BATS_TEST_TMPDIR"
}

test_util.git_init() {
	git init --initial-branch main
	git config user.name  'Name'
	git config user.email 'name@example.com'
}
