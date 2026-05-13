# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
	test_util.setup_file
}

setup() {
	test_util.cd_test

	test_util.git_init
	git config --global alias.globalalias status
	git config --global alias.x status
	git config --local alias.localalias status
	git config --local alias.y status
}

@test "list all works" {
	run git alias
	assert_output - <<-'EOF'
	globalalias = status
	localalias = status
	x = status
	y = status
EOF
	assert_success
}

@test "list all globally works" {
	run git alias --global
	assert_output - <<-'EOF'
	globalalias = status
	x = status
EOF
	assert_success
}

@test "list all locally works" {
	run git alias --local
	assert_output - <<-'EOF'
	localalias = status
	y = status
EOF
	assert_success
}

@test "search globally works" {
	run git alias --global global
	assert_output - <<-'EOF'
	globalalias = status
EOF
	assert_success

	run git alias --global local
	assert_output ''
	assert_failure
}

@test "search locally works" {
	run git alias --local local
	assert_output - <<-'EOF'
	localalias = status
EOF
	assert_success

	run git alias --local global
	assert_output ''
	assert_failure
}

@test "get alias globally and defaultly" {
	run git alias globalalias
	assert_output - <<-'EOF'
	globalalias = status
EOF
	assert_success
}

@test "set alias globally and defaultly" {
	git alias globalalias diff
	run git alias diff
	assert_output - <<-'EOF'
	globalalias = diff
EOF
	assert_success
}

@test "get alias locally" {
	run git alias --local localalias
	assert_output - <<-'EOF'
	localalias = status
EOF
	assert_success
}

@test "set alias locally" {
	git alias --local localalias diff
	run git alias
	assert_output - <<-'EOF'
	globalalias = status
	localalias = diff
	x = status
	y = status
EOF
}
