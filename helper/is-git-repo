#
# check whether current directory is inside a git repository
#

is_git_repo() {
  git rev-parse --show-toplevel > /dev/null 2>&1
  result=$?
  if test $result != 0; then
    >&2 echo 'Not a git repo!'
    exit $result
  fi
}

is_git_repo
