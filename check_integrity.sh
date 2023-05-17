#!/usr/bin/env bash

err() {
    echo >&2 "$1"
    exit 1
}

make_doc() {
    echo "'touch man/git-$1.md && make man/git-$1.{1,html}'"
}

check_bash_script() {
    local cmd="git-$1"

    test -f "bin/$cmd" \
        || err "bin/$cmd does not exist"

    test -x "bin/$cmd" \
        || err "Run 'chmod +x bin/$cmd' to make it executable"

    shebang=$(head -n1 "bin/$cmd")
    [[ "$shebang" =~ \#![[:space:]]*/usr/bin/env[[:space:]]+bash ]] \
        || err "Start git-$1 with '#!/usr/bin/env bash'"
}

check_git_extras_cmd_list() {
    local whitelist=('extras')
    for cmd in "${whitelist[@]}"; do
        test "$1" == "$cmd" && return
    done

    grep "\- \*\*git\-$1(1)\*\*" man/git-extras.md >/dev/null \
        || err "Add git-$1 in the list of commands in man/git-extras.md via $(make_doc "$1")"
}

check_man_page_index() {
    grep "git\-$1(1) git\-$1" man/index.txt >/dev/null \
        || err "Add git-$1 to index.txt via $(make_doc "$1")"
}

check_documentation() {
    local cmd="git-$1"
    test -f "man/$cmd.md" || err "man/$cmd.md is required for bin/$cmd"

    if [ ! -f "man/$cmd.1" ] || [ ! -f "man/$cmd.html" ]
    then
        err "Create man/$cmd.1 and man/$cmd.html via $(make_doc "$1")"
    fi

    check_git_extras_cmd_list "$@"
    check_man_page_index "$@"
}

check_Commands_page() {
    # These are special cases. All listed together, so we ignore them
    local whitelist=('bug' 'chore' 'feature' 'refactor')
    for cmd in "${whitelist[@]}"; do
        test "$1" == "$cmd" && return
    done

    grep "\- \[\`git $1\`\](#git-$1)" Commands.md >/dev/null \
        || err "Add git-$1 in the list of commands in Commands.md"

    grep "^## git $1" Commands.md >/dev/null \
        || err "Add description of git-$1 in Commands.md"
}

check_completion() {
    grep "$1:" etc/git-extras-completion.zsh > /dev/null || \
        err "Add git-$1 to the completion list at the end of etc/git-extras-completion.zsh"
}

check() {
    check_bash_script "$1"
    check_documentation "$1"
    check_Commands_page "$1"
    check_completion "$1"
}

usage() {
    echo >&2 "Usage: ./check_integrity.sh <command-name> [<command-name2> ...]"
    exit 0
}

test $# == 0 && usage

for name in "$@"; do
    name=${name#git-}
    [[ "$name" == "rscp" ]] && continue
    check "$name"
done

echo 'All done'
