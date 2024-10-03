# shellcheck shell=bash

source "$BATS_TEST_DIRNAME/test_util.sh"

setup_file() {
    test_util.setup_file
}

# This is ran before each "@test".
setup() {
    # cd's to a temporary directory that is unique for each "@test".
    test_util.cd_test

    # Do initialization (this code is copied from test_git_alias.py)
    git init
    git config --global alias.globalalias status
    git config --global alias.x status
    git config --local alias.localalias status
    git config --local alias.y status
}

@test "list all works" {
    run git alias

    # This is one way to do it, most similar to the "test_list_all" test in
    # test_git_alias.py. It's slightly more accurate because each substring
    # must match a particular line of output (rather than matching any part of the output)
    assert_line 'globalalias = status'
    assert_line 'x = status'
    assert_line 'localalias = status'
    assert_line 'y = status'

    # To test the full output, this is one way:
    assert_output 'globalalias = status
localalias = status
x = status
y = status'

    # One can use heredocs to also achieve this, which makes the test look a little nicer. Note that the indentation MUST BE DONE WITH TABS.
    assert_output - <<-"EOF"
		globalalias = status
		localalias = status
		x = status
		y = status
EOF

    # I tend to put 'assert_success' at the bottom. This usually makes debugging easier because an "assert_output" written above will usuall fail first. This will cause the the output of the run command to be printed (instead of just the exit code).
    # The downside to this is that sometimes there is a bug: An error "lines: parameter not set" will be shown instead (which is a Bats issue).
    assert_success
}

@test "list all global works" {
    run git alias --global

    # One debugging technique for bats test I've found useful is to redirect to
    # fd3. The variable "$output" is set by Bats, and it is the output of the previous "run" command (in this case, `git alias --global`). Here, we are printing it to fd3 for debugging. Naturally, be sure to run `exec 3>&1` (assuming you are running Bash or Zsh shell) in the terminal before running Bats.
#     echo "$output" >&3


    assert_output 'globalalias = status
x = status'
    assert_success
}
