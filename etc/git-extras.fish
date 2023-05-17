
set __fish_git_extras_commands \
    "alias:Define, search and show aliases" \
    "archive-file:Export the current HEAD of the git repository to an archive" \
    "authors:Generate authors report" \
    "browse:View the web page for the current repository" \
    "browse-ci:View the CI page for the current repository" \
    "brv:List branches sorted by their last commit date" \
    "bulk:Run git commands on multiple repositories" \
    "changelog:Generate a changelog report" \
    "clear-soft:Soft clean up a repository" \
    "clear:Rigorously clean up a repository" \
    "coauthor:Add a co-author to the last commit" \
    "commits-since:Show commit logs since some date" \
    "contrib:Show user's contributions" \
    "count:Show commit count" \
    "cp:Copy a file keeping its history" \
    "create-branch:Create branches" \
    "delete-branch:Delete branches" \
    "delete-merged-branches:Delete merged branches" \
    "delete-squashed-branches:Delete squashed branches" \
    "delete-submodule:Delete submodules" \
    "delete-tag:Delete tags" \
    "delta:Lists changed files" \
    "effort:Show effort statistics on file(s)" \
    "feature:Create/Merge feature branch" \
    "force-clone:overwrite local repositories with clone" \
    "fork:Fork a repo on github" \
    "fresh-branch:Create fresh branches" \
    "get:Clone a repository in a directory" \
    "gh-pages:Create the GitHub Pages branch" \
    "graft:Merge and destroy a given branch" \
    "guilt:calculate change between two revisions" \
    "ignore-io:Get sample gitignore file" \
    "ignore:Add .gitignore patterns" \
    "info:Returns information on current repository" \
    "local-commits:List local commits" \
    "lock:Lock a file excluded from version control" \
    "locked:ls files that have been locked" \
    "merge-into:Merge one branch into another" \
    "merge-repo:Merge two repo histories" \
    "missing:Show commits missing from another branch" \
    "mr:Checks out a merge request locally" \
    "obliterate:rewrite past commits to remove some files" \
    "paste:Send patches to pastebin for chat conversations" \
    "pr:Checks out a pull request locally" \
    "psykorebase:Rebase a branch with a merge commit" \
    "pull-request:Create pull request for GitHub project" \
    "reauthor:Rewrite history to change author's identity" \
    "rebase-patch:Rebases a patch" \
    "release:Commit, tag and push changes to the repository" \
    "rename-branch:rename local branch and push to remote" \
    "rename-remote:Rename a remote" \
    "rename-tag:Rename a tag" \
    "repl:git read-eval-print-loop" \
    "reset-file:Reset one file" \
    "root:show path of root" \
    "scp:Copy files to SSH compatible git-remote" \
    "sed:replace patterns in git-controlled files" \
    "setup:Set up a git repository" \
    "show-merged-branches:Show merged branches" \
    "show-tree:show branch tree of commit history" \
    "show-unmerged-branches:Show unmerged branches" \
    "squash:Import changes from a branch" \
    "stamp:Stamp the last commit message" \
    "standup:Recall the commit history" \
    "summary:Show repository summary" \
    "sync:Sync local branch with remote branch" \
    "touch:Touch and add file to the index" \
    "undo:Remove latest commits" \
    "unlock:Unlock a file excluded from version control"

# completion for git-extras itself
complete -c git -f -n '__fish_git_needs_command' -a 'extras' -d 'GIT utilities: repo summary, repl, changelog population, and more'
complete -c git -f -n '__fish_git_using_command extras' -s h -l help -d 'Show the help message, can be used for any git-extras commands'
complete -c git -f -n '__fish_git_using_command extras' -s v -l version -d 'Show git-extras version number'
complete -c git -f -n '__fish_git_using_command extras; and not contains -- update (commandline -opc)' -a "update" -d 'Self update'

# completion for git-extras provided commands
set __fish_git_extras_commands (printf -- '%s\n' $__fish_git_extras_commands | sed 's/:/\textras:/' | string collect | string escape)
complete -c git -n '__fish_git_needs_command' -a "$__fish_git_extras_commands"
# authors
complete -c git -f -n '__fish_git_using_command authors' -s l -l list -d 'show authors'
complete -c git -f -n '__fish_git_using_command authors' -l no-email -d 'without email'
# bulk
complete -c git    -n '__fish_git_using_command bulk' -s a -d 'Run a git command on all workspaces and their repositories'
complete -c git    -n '__fish_git_using_command bulk' -s g -d 'Ask the user for confirmation on every execution'
complete -c git -x -n '__fish_git_using_command bulk' -s w -d 'Run on specified workspace'
complete -c git -x -n '__fish_git_using_command bulk' -l addworkspace -d 'Register a workspace for builk operations'
complete -c git -x -n '__fish_git_using_command bulk; and contains addworkspace (commandline -opc)' -l addworkspace -d 'the URL or file with URLs to be added'
complete -c git -x -n '__fish_git_using_command bulk' -l removeworkspace -d 'Remove the workspace with the logical name <ws-name >'
complete -c git -x -n '__fish_git_using_command bulk' -l addcurrent -d 'Add the current directory as a workspace'
complete -c git -x -n '__fish_git_using_command bulk' -l purge -d 'Removes all defined repository locations'
complete -c git -x -n '__fish_git_using_command bulk' -l listall -d 'List all registered repositories'
# changelog
complete -c git -f -n '__fish_git_using_command changelog' -s a -l all -d 'Retrieve all commits'
complete -c git -f -n '__fish_git_using_command changelog' -s l -l list -d 'Show commits in list format (without titles, dates)'
complete -c git -f -n '__fish_git_using_command changelog' -s t -l tag -d 'Specify a tag label to use for most-recent (untagged) commits'
complete -c git -f -n '__fish_git_using_command changelog' -s f -l final-tag -d 'When specifying a range, the newest tag at which point commit retrieval will end'
complete -c git -f -n '__fish_git_using_command changelog' -s s -l start-tag -d 'When specifying a range, the oldest tag to retrieve commits from'
complete -c git -f -n '__fish_git_using_command changelog' -l start-commit -d 'Like the --start-tag but specify the oldest commit instead of tag'
complete -c git -f -n '__fish_git_using_command changelog' -s n -l no-merges -d 'Filters out merge commits (commits with more than 1 parent) from generated changelog'
complete -c git -f -n '__fish_git_using_command changelog' -s m -l merges-only -d 'Uses only merge commits (commits with more than 1 parent) for generated changelog'
complete -c git -f -n '__fish_git_using_command changelog' -s p -l prune-old -d 'Replace existing changelog entirely with newly generated content'
complete -c git -f -n '__fish_git_using_command changelog' -s x -l stdout -d 'Write output to stdout instead of to a new changelog file'
# count
complete -c git -f -n '__fish_git_using_command count' -l all -d 'detailed commit count'
# create-branch
complete -c git -x -n '__fish_git_using_command create-branch' -s r -l remote -a '(__fish_git_unique_remote_branches)' -d 'setup remote tracking branch'
# delete-branch
complete -c git -x -n '__fish_git_using_command delete-branch' -a '(__fish_git_branches)' -d 'branch to delete'
# delete-squashed-branches
complete -c git -x -n '__fish_git_using_command delete-squashed-branches' -a '(__fish_git_branches)' -d 'branch to target for squashed merges'
# delete-submodule
complete -c git -x -n "__fish_git_using_command delete-submodule" -a "(__fish_git submodule status 2>/dev/null | string trim | cut -d ' ' -f 2)" -d 'submodule to delete'
# delete-tag
complete -c git -x -n "__fish_git_using_command delete-tag" -a '(__fish_git for-each-ref --format="%(refname)" refs/tags 2>/dev/null)' -d 'tag to delete'
# effort
complete -c git -f -n '__fish_git_using_command effort' -l above -d 'ignore file with less than x commits'
# feature
complete -c git -x -n '__fish_git_using_command feature' -s a -l alias -d 'use branch_prefix instead of feature'
complete -c git -f -n '__fish_git_using_command feature; and not contains -- finish (commandline -opc)' -a "finish" -d 'merge and delete the feature branch'
complete -c git -f -n '__fish_git_using_command feature; and contains -- finish (commandline -opc)' -l squash -d 'Run a squash merge'
complete -c git -x -n '__fish_git_using_command feature; and contains -- finish (commandline -opc)' -a '(__fish_git for-each-ref --format="%(refname)" 2>/dev/null | grep "refs/heads/feature")' -d 'name of feature branch'
complete -c git -x -n '__fish_git_using_command feature; and not contains -- finish (commandline -opc)' -s r -l remote -a '(__fish_git_unique_remote_branches)' -d 'Setup a remote tracking branch'
# graft
complete -c git -x -n '__fish_git_using_command graft' -s r -l remote -a '(__fish_git_branches)' -d 'src-branch-name'
complete -c git -x -n '__fish_git_using_command graft' -s r -l remote -a '(__fish_git_branches)' -d 'dest-branch-name'
# guilt
complete -c git -f -n '__fish_git_using_command guilt' -s w -l ignore-whitespace -d 'ignore whitespace only changes'
complete -c git -f -n '__fish_git_using_command guilt' -s e -l email -d 'display author emails instead of names'
complete -c git -f -n '__fish_git_using_command guilt' -s d -l debug -d 'output debug information'
complete -c git -f -n '__fish_git_using_command guilt' -s h          -d 'output usage information'
# ignore
complete -c git -f -n '__fish_git_using_command ignore' -s l -l local -d 'show local gitignore'
complete -c git -f -n '__fish_git_using_command ignore' -s g -l global -d 'show global gitignore'
complete -c git -f -n '__fish_git_using_command ignore' -s p -l private -d 'show repo gitignore'
# ignore-io
function __fish_git_extra_get_ignore_io_types
    # we will first remove every tab spaces, and then append `\t` at the end to remove the default description
    git ignore-io -l | string replace -r --all -- "\t+" "\n" | string replace -r -- "\$" "\t"
end
complete -c git -x -n '__fish_git_using_command ignore-io' -a '(__fish_git_extra_get_ignore_io_types)'
complete -c git -x -n '__fish_git_using_command ignore-io' -s a -l append -a '(__fish_git_extra_get_ignore_io_types)' -d 'append .gitignore'
complete -c git -x -n '__fish_git_using_command ignore-io' -s r -l replace -a '(__fish_git_extra_get_ignore_io_types)' -d 'replace .gitignore'
complete -c git -x -n '__fish_git_using_command ignore-io' -s l -l list-in-table -d 'print available types in table format'
complete -c git -x -n '__fish_git_using_command ignore-io' -s L -l list-alphabetically -d 'print available types in alphabetical order'
complete -c git -x -n '__fish_git_using_command ignore-io' -s s -l search -d 'search word in available types'
complete -c git -x -n '__fish_git_using_command ignore-io' -s t -l show-update-time -d 'Show the last modified time of ~/.gi_list'
complete -c git -x -n '__fish_git_using_command ignore-io' -s u -l update -d 'Update ~/.gi_list'
# merge-into
complete -c git    -n '__fish_git_using_command merge-into' -l ff-only -d 'merge only fast-forward'
complete -c git -x -n '__fish_git_using_command merge-into' -a '(__fish_git_branches)'
# missing
complete -c git -x -n '__fish_git_using_command missing' -a '(__fish_git_branches)'
# squash
complete -c git -x -n '__fish_git_using_command squash' -a '(__fish_git_branches)'
complete -c git -x -n '__fish_git_using_command squash' -l squash-msg -d 'commit with the squashed commit messages'
# stamp
complete -c git -x -n '__fish_git_using_command stamp' -s r -l replace -d 'replace stamps with same id'
# standup
complete -c git -x -n '__fish_git_using_command standup' -s a -d 'Specify the author of commits. Use "all" to specify all authors'
complete -c git -x -n '__fish_git_using_command standup' -s m -d 'The depth of recursive directory search'
complete -c git -x -n '__fish_git_using_command standup' -s d -d 'Show history since N days ago'
complete -c git -x -n '__fish_git_using_command standup' -s D -d 'Specify the date format displayed in commit history'
complete -c git    -n '__fish_git_using_command standup' -s f -d 'Fetch commits before showing history'
complete -c git    -n '__fish_git_using_command standup' -s g -d 'Display GPG signed info'
complete -c git    -n '__fish_git_using_command standup' -s h -l help -d 'Display help message'
complete -c git    -n '__fish_git_using_command standup' -s L -d 'Enable the inclusion of symbolic links'
complete -c git    -n '__fish_git_using_command standup' -s B -d 'Display the commits in branch group'
complete -c git -x -n '__fish_git_using_command standup' -s n -d 'Limit the number of commits displayed per group'
# summary
complete -c git    -n '__fish_git_using_command summary' -l line -d 'summarize with lines rather than commits'
complete -c git    -n '__fish_git_using_command summary' -l dedup-by-email -d 'remove duplicate users by the email address'
complete -c git    -n '__fish_git_using_command summary' -l no-merges -d 'exclude merge commits'
# release
complete -c git -x -n '__fish_git_using_command release' -s c -d 'Generates/populates the changelog with all commit message since the last tag'
complete -c git -x -n '__fish_git_using_command release' -s r -d 'The "remote" repository that is destination of a push operation'
complete -c git -x -n '__fish_git_using_command release' -s m -d 'use the custom commit information instead of the default message'
complete -c git -x -n '__fish_git_using_command release' -s s -d 'Create a signed and annotated tag'
complete -c git -x -n '__fish_git_using_command release' -s u -d 'Create a tag, annotated and signed with the given key'
complete -c git -x -n '__fish_git_using_command release' -l semver -d 'If the latest tag matches semver format, increase part of it as the new release tag'
complete -c git -x -n '__fish_git_using_command release' -l no-empty-commit -d 'Avoid creating empty commit if nothing could be committed'
# undo
complete -c git -x -n '__fish_git_using_command undo' -s s -l soft -d 'only rolls back the commit but changes remain un-staged'
complete -c git -x -n '__fish_git_using_command undo' -s h -l hard -d 'wipes your commit(s)'


