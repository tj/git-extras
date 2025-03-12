# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"


setup_file() {
	test_util.setup_file
}

setup() {
	test_util.cd_test

	git init
	GIT_CONFIG_VALUE_0='test@example.com'
	GIT_CONFIG_VALUE_1='test'
	printf '%s\n' 'A' > tmpfile
	git add .
	git commit -m 'test: add data A'
	GIT_CONFIG_VALUE_0='testagain@example.com'
	GIT_CONFIG_VALUE_1='testagain'
	printf '%s\n' 'B' > tmpfile
	git add .
	git commit -m 'test: add data B'
}

@test "output authors has email without any parameter" {
	run git authors
	assert_success

	local content=$(<AUTHORS)
	assert_equal "$content" $'test <test@example.com>\ntestagain <testagain@example.com>'
}

@test "list authors has email defaultly" {
	run git authors --list
	assert_output $'test <test@example.com>\ntestagain <testagain@example.com>'
	assert_success

	run git authors -l
	assert_output $'test <test@example.com>\ntestagain <testagain@example.com>'
	assert_success
}

@test "list authors has no email" {
	run git authors --list --no-email
	assert_output $'test\ntestagain'
	assert_success

	run git authors -l --no-email
	assert_output $'test\ntestagain'
	assert_success
}
