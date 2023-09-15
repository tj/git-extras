complete -e blah

function __fish_git_arg_number -a number
    set -l cmd (commandline -opc)
    test (count $cmd) -eq $number
end

function __fish_git_extra_coauthor_name
    printf '%s\n' 'a' 'apple' 'ann'
end

function __fish_git_extra_coauthor_email
    set -l cmd (commandline -opc)

    set -l value $cmd[3]
    printf '%s\n' 'n' 'n1' 'n2' "$value"
end

complete -c blah -f -n '__fish_git_using_command coauthor; and __fish_git_arg_number 2' -a '(__fish_git_extra_coauthor_name)'
complete -c blah -f -n '__fish_git_using_command coauthor; and __fish_git_arg_number 3' -a '(__fish_git_extra_coauthor_email)'
