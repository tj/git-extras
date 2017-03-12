#!/usr/bin/env bash
invers=`tput rev`
reset=`tput sgr0`
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) #  red
shopt -s extglob
guarded=false
singlemode=false

#
# print usage message
#
usage() {
  echo 1>&2 "usage: git bulk [-g] [-w <ws-name>] <git command>"
  echo 1>&2 "       git bulk --addworkspace <ws-name> <ws-root-directory>"
  echo 1>&2 "       git bulk --removeworkspace <ws-name>"
  echo 1>&2 "       git bulk --addcurrent <ws-name>"
  echo 1>&2 "       git bulk --purge"
  echo 1>&2 "       git bulk --listall"
}

# add another workspace to global git config
function addworkspace () {
  git config --global bulkworkspaces.$wsname "$wsdir"
}

# add current directory
function addcurrent () {
  git config --global bulkworkspaces.$wsname "$PWD"
}

# remove workspace from global git config
function removeworkspace () {
  checkWSName
  git config --global --unset bulkworkspaces.$wsname
}

# remove workspace from global git config
function purge () {
  git config --global --remove-section bulkworkspaces
}

# list all current workspace locations defined
function listall () {
  git config --global --get-regexp bulkworkspaces
}

# guarded execution of a git command in one specific repository
function guardedExecution () {
  if $guarded; then
    echo -n "${invers}git $gitcommand${reset} -> execute here (y/n)? "
    read -n 1 -r </dev/tty; echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      atomicExecution
    fi
  else
     atomicExecution
  fi
}

# atomic git command execution with log
function atomicExecution () {
  echo "${bldred}->${reset} executing ${invers}git $gitcommand${reset}"
  git $gitcommand
}

# check if the passed command is known as a core git command
function checkGitCommand () {
  if git help -a | cat | grep -o -q "$corecommand"; then
    echo "Core command \"$corecommand\" accepted."
  else
    usage
    echo "error: unknown GIT command: $corecommand"
    exit 1
  fi
}

# check if workspace name is registered
function checkWSName () {
  found=0
  while read workspace; do
    cwsname=$(echo $workspace | cut -f1 -d' ' | cut -f2 -d'.')
    if [[ $cwsname == $wsname ]]; then return; fi
  done <<< "$(echo "$(listall)")"
  # when here the ws name was not found
  usage
  echo "error: unknown workspace name: $wsname"
  exit 1 
}

# helper to check number of arguments
function allowedargcount () {
  if [[ $initialcount -ne $1 ]]; then
    usage
    echo 1>&2 "error: wrong number of arguments"
    exit 1
  fi 
}

# execute the bulk operation
function executBulkOp () {
  checkGitCommand
  if $singlemode; then
    echo "Selected single workspace mode in workspace: $wsname"
    checkWSName
  fi
  listall | while read workspacespec; do
    cwsname=$(echo $workspacespec | cut -f1 -d' ' | cut -f2 -d'.')
    if $singlemode && [[ $cwsname != $wsname ]]; then continue; fi
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

initialcount="${#}"
initialarguments="${@}"

# if no arguments show usage
if [[ $initialcount -le 0 ]]; then
  usage
fi

# parse command parameters
while [ "${#}" -ge 1 ] ; do

  case "$1" in
    --listall|--purge|--removeworkspace|--addcurrent|--addworkspace)
      butilcommand="${1:2}"
      shift 
      wsname="$1"
      shift
      wsdir="$1"
      break
      ;;
    -g) 
      guarded=true
      ;;
    -w) 
      singlemode=true
      shift
      wsname="$1"
      checkWSName
      ;;
    -*) 
      usage
      echo 1>&2 "error: unknown argument $1"
      exit 1
      ;;
    --*) 
      usage
      echo 1>&2 "error: unknown argument $1"
      exit 1
      ;;
    *) # git core commands
      butilcommand="executBulkOp"
      corecommand="$1"
      gitcommand="$@"
      break
      ;;
  esac
  shift
done

# check right number of arguments
case $butilcommand in
  @(listall|purge) ) allowedargcount 1;;
  @(addcurrent|removeworkspace)) allowedargcount 2;;
  addworkspace) allowedargcount 3;;
esac

$butilcommand # run user command