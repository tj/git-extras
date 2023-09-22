# shellcheck shell=bash
# bash completion support for git-extras.

_git_changelog(){
  local s_opts=( '-a' '-l' '-t' '-f' '-s' '-n' '-p' '-x' '-h' '?' )
  local l_opts=(
    '--all'
    '--list'
    '--tag'
    '--final-tag'
    '--start-tag'
    '--start-commit'
    '--no-merges'
    '--prune-old'
    '--stdout'
    '--help'
  )
  local merged_opts_str=""
  merged_opts_str+="$(printf "%s " "${s_opts[@]}")"
  merged_opts_str+="$(printf "%s " "${l_opts[@]}")"

  __gitcomp "$merged_opts_str"
}

_git_authors(){
  __gitcomp "-l --list --no-email"
}

_git_coauthor(){
  local oldIfs=$IFS
  IFS=$'\n'
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local selection=
  if ((COMP_CWORD == 2)); then
    for line in $(git authors --list); do
      selection+="${line% *}"$'\n'
    done
  elif ((COMP_CWORD == 3)); then
    local chosen_name="${COMP_WORDS[COMP_CWORD-1]}"
    for line in $(git authors --list); do
      if [ "$chosen_name" = "${line% *}" ]; then
        local email=${line#*<}
        email=${email%>*}
        selection+="$email"$'\n'
      fi
    done
  fi
  compopt +o default
  compopt -o filenames
  COMPREPLY=($(compgen -W "$selection" -- "$cur"))
  IFS=$oldIfs
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

__git_cp(){
  __git_complete_file
}

_git_delete_branch(){
  __gitcomp "$(__git_heads)"
}

_git_delete_squashed_branches(){
  __gitcomp "$(__git_heads)"
}

_git_delete_submodule(){
  __gitcomp "$(git submodule status | awk '{print $2}')"
}

_git_delete_tag(){
  __gitcomp "$(__git_tags)"
}

_git_effort(){
  __git_has_doubledash && return

  case "$cur" in
  --*)
    # shellcheck disable=SC2154
    __gitcomp "
      --above
      $__git_log_common_options
      $__git_log_shortlog_options
      "
    return
    ;;
  esac
}

_git_extras(){
  __gitcomp "--version update"
}

__git_extras_workflow(){
  __gitcomp "$(__git_heads | grep -- "^$1/" | sed s/^"$1"\\///g) finish"
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
    __gitcomp "--global --local --private"
    return
    ;;
  -*)
    __gitcomp "--global --local --private -g -l -p"
    return
    ;;
  esac
}

_git_missing(){
    # Suggest all known refs
    __gitcomp "$(git for-each-ref --format='%(refname:short)')"
}

_git_psykorebase(){
  __gitcomp "$(__git_heads) --continue --no-ff"
}

_git_reauthor(){
  local prev="${COMP_WORDS[COMP_CWORD-1]}"
  local comp

  if [[ "${prev}" == '--type' ]] || [[ "${prev}" == '-t' ]]; then
    comp='author committer full'
  else
    comp='--all --correct-email --correct-name --old-email --type --use-config'
  fi

   __gitcomp "${comp}"
}

_git_scp(){
  __git_complete_remote_or_refspec
}

_git_stamp(){
  __gitcomp '--replace -r'
}

_git_rscp(){
  __git_complete_remote_or_refspec
}

_git_squash(){
  __gitcomp "$(__git_heads)"
}

_git_undo(){
   __gitcomp "--hard --soft -h -s"
}

_git_info(){
  __gitcomp "--color -c --no-config"
}

_git_browse(){
  __git_complete_remote_or_refspec
}

_git_browse_ci(){
  __git_complete_remote_or_refspec
}
