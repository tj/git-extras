# bash completion support for git-extras.

_git_changelog(){
  __gitcomp "--list"
}

_git_contrib(){
  __gitcomp "$(git shortlog -s | cut -f2)" # TODO buggy if author's name contains whitespaces :(
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

_git_extras(){
  __gitcomp "--version update"
}

_git_graft(){
  __gitcomp "$(__git_heads)"
}

_git_squash(){
  __gitcomp "$(__git_heads)"
}

__git_extras_workflow(){
  __gitcomp "$(__git_heads | grep ^$1/ | sed s/^$1\\///g) finish"
}

_git_feature(){
  __git_extras_workflow "feature"
}

_git_refactor(){
  __git_extras_workflow "refactor"
}

_git_bug(){
  __git_extras_workflow "bug"
}
