#!/usr/bin/env bash

err() {
    echo "$1"
    exit 1
}

check_bash_script() {
    local cmd="git-$1"
    test -x "bin/$cmd" || err "bin/$cmd is either non-existent or unexecutable"
    shebang=$(head -n 1 "bin/$cmd")
    test "$shebang" == "#!/usr/bin/env bash" || \
        err "start git-$1 with '#!/usr/bin/env bash'"
}

check_documentation() {
    local cmd="git-$1"
    test -f "man/$cmd.md" || err "man/$cmd.md required"
    test -f "man/$cmd.1" || err "man/$cmd.1 required"
    test -f "man/$cmd.html" || err "man/$cmd.html required"
}

check_Commands_page() {
    local whitelist=('bug' 'chore' 'feature' 'refactor')
    for cmd in ${whitelist[*]}; do
        test "$1" == "$cmd" && return
    done
    grep "\- \[\`git $1\`\](#git-$1)" Commands.md > /dev/null && \
    grep "^## git $1" Commands.md > /dev/null || \
        err "Update Commands.md with git-$1 is required"
}

check_completion() {
    grep "$1:" etc/git-extras-completion.zsh > /dev/null || \
        err "Update git-extras-completion.zsh with git-$1 is required"
}

check() {
    check_bash_script "$1"
    check_documentation "$1"
    check_Commands_page "$1"
    check_completion "$1"
}

test $# == 0 && err "Please give your command name"
for name in "$@"; do
    [[ "$name" == "rscp" || "$name" == "line-summary" ]] && continue
    check "$name"
done
echo 'All is done'
