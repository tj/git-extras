# bash completion support for git-extras.

_git_bug(){
  __git_extras_workflow "bug"
}

_git_changelog(){
  __gitcomp "-l -t --list --tag --no-merges"
}

_git_chore(){
  __git_extras_workflow "chore"
}

_git_contrib(){
# git completion function modified from
# https://github.com/markgandolfo/git-bash-completion/blob/master/git-completion.bash
  contributors="$(git shortlog -s | cut -f2)"
  local all c s=$'\n' IFS=$'\n'
  local cur="${COMP_WORDS[COMP_CWORD]}"
  for c in $contributors; do
    all="$all$c $s"
  done
  COMPREPLY=($(compgen -W "$all" -- "$cur"))
}

_git_count(){
  __gitcomp "--all"
}

_git_delete_branch(){
  __gitcomp "$(__git_heads)"
}

_git_delete_submodule(){
  __gitcomp "$(git submodule status | awk '{print $2}')"
}

_git_delete_tag(){
  __gitcomp "$(__git_tags)"
}

_git_effort(){
  __gitcomp "--above"
}

_git_extras(){
  __gitcomp "--version update"
}

__git_extras_workflow(){
  __gitcomp "$(__git_heads | grep ^$1/ | sed s/^$1\\///g) finish"
}

_git_feature(){
  __git_extras_workflow "feature"
}

_git_graft(){
  __gitcomp "$(__git_heads)"
}

_git_ignore(){
  case "$cur" in
  --*)
    __gitcomp "--global --local"
    return
    ;;
  -*)
    __gitcomp "--global --local -g -l"
    return
    ;;
  esac
}

_git_missing(){
    # Suggest all known refs
    __gitcomp "$(git for-each-ref --format='%(refname:short)')"
}

_git_refactor(){
  __git_extras_workflow "refactor"
}

_git_squash(){
  __gitcomp "$(__git_heads)"
}

_git_undo(){
   __gitcomp "--hard --soft -h -s"
}
