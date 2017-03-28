#!/usr/bin/env bash
invers=`tput rev`
reset=`tput sgr0`
txtbld=$(tput bold)             
bldred=${txtbld}$(tput setaf 1) 

# default option settings
guardedmode=false
singlemode=false
allwsmode=false

#
# print usage message
#
usage() {
  echo 1>&2 "usage: git bulk [-g] ([-a]|[-w <ws-name>]) <git command>"
  echo 1>&2 "       git bulk --addworkspace <ws-name> <ws-root-directory>"
  echo 1>&2 "       git bulk --removeworkspace <ws-name>"
  echo 1>&2 "       git bulk --addcurrent <ws-name>"
  echo 1>&2 "       git bulk --purge"
  echo 1>&2 "       git bulk --listall"
}

# add another workspace to global git config
function addworkspace { git config --global bulkworkspaces.$wsname "$wsdir"; }

# add current directory
function addcurrent { git config --global bulkworkspaces.$wsname "$PWD"; }

# remove workspace from global git config
function removeworkspace { checkWSName && git config --global --unset bulkworkspaces.$wsname; }

# remove workspace from global git config
function purge { git config --global --remove-section bulkworkspaces; }

# list all current workspace locations defined
function listall { git config --global --get-regexp bulkworkspaces; }

# guarded execution of a git command in one specific repository
function guardedExecution () {
  if $guardedmode; then
    echo -n "${invers}git $gitcommand${reset} -> execute here (y/n)? "
    read -n 1 -r </dev/tty; echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then atomicExecution; fi
  else
     atomicExecution
  fi
}

# atomic git command execution with log
function atomicExecution () {
  echo "${bldred}->${reset} executing ${invers}git $gitcommand${reset}" && git $gitcommand
}

# check if the passed command is known as a core git command
function checkGitCommand () {
  if git help -a | grep -o -q "\b${corecommand}\b"; then
    echo "Core command \"$corecommand\" accepted."
  else
    if git config --get-regexp alias | grep -o -q "\.${corecommand} "; then
      echo "Alias ${corecommand} accepted."
    else
      usage && echo "error: unknown GIT command: $corecommand" && exit 1
    fi
  fi
}

# check if workspace name is registered
function checkWSName () {
  while read workspace; do
    rwsname=$(echo $workspace | cut -f1 -d' ' | cut -f2 -d'.')
    if [[ $rwsname == $wsname ]]; then return; fi
  done <<< "$(echo "$(listall)")"
  # when here the ws name was not found
  usage && echo "error: unknown workspace name: $wsname" && exit 1 
}

# detects the wsname of the current directory
function wsnameToCurrent () {
  while read workspace; do
    if [ -z "$workspace" ]; then continue; fi
    rwsdir=${workspace#* }
    rwsname=${workspace#*.} && rwsname=${rwsname% *}
    if echo $PWD | grep -o -q $rwsdir; then wsname=$rwsname && return; fi
  done <<< "$(echo "$(listall)")"
  # when here then not in workspace dir
  echo "error: you are not in a workspace directory. your registered workspaces are:" && \
    wslist="$(echo "$(listall)")" && echo "${wslist:-'<no workspaces defined yet>'}" && exit 1
}

# helper to check number of arguments
function allowedargcount () {
  ( test $paramcount -ne $1 ) && ( usage && echo 1>&2 "error: wrong number of arguments" && exit 1 ) 
}

# execute the bulk operation
function executBulkOp () {
  checkGitCommand
  if ! $allwsmode && ! $singlemode; then wsnameToCurrent; fi # by default git bulk works within the 'current' workspace
  listall | while read workspacespec; do
    cwsname=$(echo $workspacespec | cut -f1 -d' ' | cut -f2 -d'.')
    if [[ -n $wsname ]] && [[ $cwsname != $wsname ]]; then continue; fi
    wslocation=$(echo $workspacespec | cut -f2 -d' ')
    eval cd "$wslocation"
    actual=$(pwd)
    echo "Executing bulk operation in workspace ${invers}$actual${reset}"
    eval find . -name ".git" | while read line; do
      gitrepodir=${line::${#line}-5} # cut the .git part of find results to have the root git directory of that repository
      eval cd "$gitrepodir" # into git repo location
      curdir=$(pwd)
      echo "Current repository: ${actual#${curdir%/*}}/${bldred}${curdir##*/}${reset}"
      guardedExecution
      eval cd "$wslocation" # back to origin location of last find command
    done 
  done 
}

paramcount="${#}"

# if no arguments show usage
if [[ $paramcount -le 0 ]]; then usage; fi

# parse command parameters
while [ "${#}" -ge 1 ] ; do
  case "$1" in
    --listall|--purge)
      butilcommand="${1:2}" && break ;;
    --removeworkspace|--addcurrent|--addworkspace)
      butilcommand="${1:2}" && wsname="$2" && wsdir="$3" && break ;;
    -a) 
      allwsmode=true ;;
    -g) 
      guardedmode=true ;;
    -w) 
      singlemode=true && shift && wsname="$1" && checkWSName ;;
    -*) 
      usage && echo 1>&2 "error: unknown argument $1" && exit 1 ;;
    --*) 
      usage && echo 1>&2 "error: unknown argument $1" && exit 1 ;;
    *) # git core commands
      butilcommand="executBulkOp" && corecommand="$1" && gitcommand="$@" && break ;;
  esac && shift
done

# check option compatability
if $allwsmode && $singlemode; then echo 1>&2 "error: options -w and -a are incompatible" && exit 1; fi

# if single mode check the supplied workspace name
if $singlemode; then echo "Selected single workspace mode in workspace: $wsname" && checkWSName; fi 

# check right number of arguments
case $butilcommand in
  listall|purge) allowedargcount 1;;
  addcurrent|removeworkspace) allowedargcount 2;;
  addworkspace) allowedargcount 3;;
esac

$butilcommand # run user command