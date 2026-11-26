# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file
	test_util.install_command merge-repo
	test_util.install_command undo
}

setup() {
	test_util.cd_test

	mkdir other
	(
		cd other
		test_util.git_init
		printf '%s\n' 'lib' > lib.txt
		printf '%s\n' 'build/' > .gitignore
		git add .
		git commit -m "lib"
	)

	mkdir main
	cd main
	test_util.git_init
	printf '%s\n' 'app' > app.txt
	git add .
	git commit -m "app"
}

@test "merging into the current folder keeps dotfiles at the root" {
	run git merge-repo ../other main .
	assert_success

	run git ls-tree -r --name-only HEAD
	assert_output $'.gitignore\napp.txt\nlib.txt'
	run git status --porcelain
	assert_output ''
}

@test "merging into the current folder leaves an older stash alone" {
	printf '%s\n' 'old work' >> app.txt
	git stash

	run git merge-repo ../other main .
	assert_success

	run cat app.txt
	assert_output 'app'
	run git stash list
	assert_output --partial 'WIP on main'
}
