git-extras(1) -- Awesome GIT utilities
=================================

## SYNOPSIS

`git-extras` [-v,--version] [-h,--help] [update]

## OPTIONS

  -v, --version

  Show git-extras version number.

  -h, --help

  Show this help. This option can also be used for any of the extras commands.

  update

  Self update.

## ENVIRONMENT AND CONFIGURATION VARIABLES

  `git config --add git-extras.default-branch $BRANCH`

  Change the default branch to `$BRANCH` (defaut to `master`).

## COMMANDS

   - **git-alias(1)** Define, search and show aliases
   - **git-archive-file(1)** Export the current HEAD of the git repository to an archive
   - **git-authors(1)** Generate authors report
   - **git-browse(1)** <View the web page for the current repository>
   - **git-brv(1)** List branches sorted by their last commit date
   - **git-bulk(1)** Run git commands on multiple repositories
   - **git-changelog(1)** Generate a changelog report
   - **git-clear-soft(1)** Soft clean up a repository
   - **git-clear(1)** Rigorously clean up a repository
   - **git-coauthor(1)** Add a co-author to the last commit
   - **git-commits-since(1)** Show commit logs since some date
   - **git-contrib(1)** Show user's contributions
   - **git-count(1)** Show commit count
   - **git-cp(1)** Copy a file keeping its history
   - **git-create-branch(1)** Create branches
   - **git-delete-branch(1)** Delete branches
   - **git-delete-merged-branches(1)** Delete merged branches
   - **git-delete-submodule(1)** Delete submodules
   - **git-delete-tag(1)** Delete tags
   - **git-delta(1)** Lists changed files
   - **git-effort(1)** Show effort statistics on file(s)
   - **git-feature(1)** Create/Merge feature branch
   - **git-force-clone(1)** overwrite local repositories with clone
   - **git-fork(1)** Fork a repo on github
   - **git-fresh-branch(1)** Create fresh branches
   - **git-gh-pages(1)** Create the GitHub Pages branch
   - **git-graft(1)** Merge and destroy a given branch
   - **git-guilt(1)** calculate change between two revisions
   - **git-ignore-io(1)** Get sample gitignore file
   - **git-ignore(1)** Add .gitignore patterns
   - **git-info(1)** Returns information on current repository
   - **git-local-commits(1)** List local commits
   - **git-lock(1)** Lock a file excluded from version control
   - **git-locked(1)** ls files that have been locked
   - **git-merge-into(1)** Merge one branch into another
   - **git-merge-repo(1)** Merge two repo histories
   - **git-missing(1)** Show commits missing from another branch
   - **git-mr(1)** Checks out a merge request locally
   - **git-obliterate(1)** rewrite past commits to remove some files
   - **git-paste(1)** Send patches to pastebin for chat conversations
   - **git-pr(1)** Checks out a pull request locally
   - **git-psykorebase(1)** Rebase a branch with a merge commit
   - **git-pull-request(1)** Create pull request for GitHub project
   - **git-reauthor(1)** Rewrite history to change author's identity
   - **git-rebase-patch(1)** Rebases a patch
   - **git-release(1)** Commit, tag and push changes to the repository
   - **git-rename-branch(1)** rename local branch and push to remote
   - **git-rename-remote(1)** Rename a remote
   - **git-rename-tag(1)** Rename a tag
   - **git-repl(1)** git read-eval-print-loop
   - **git-reset-file(1)** Reset one file
   - **git-root(1)** show path of root
   - **git-scp(1)** Copy files to SSH compatible `git-remote`
   - **git-sed(1)** replace patterns in git-controlled files
   - **git-setup(1)** Set up a git repository
   - **git-show-merged-branches(1)** Show merged branches
   - **git-show-tree(1)** show branch tree of commit history
   - **git-show-unmerged-branches(1)** Show unmerged branches
   - **git-squash(1)** squash N last changes up to a ref'ed commit
   - **git-stamp(1)** Stamp the last commit message
   - **git-standup(1)** Recall the commit history
   - **git-summary(1)** Show repository summary
   - **git-sync(1)** Sync local branch with remote branch
   - **git-touch(1)** Touch and add file to the index
   - **git-undo(1)** Remove latest commits
   - **git-unlock(1)** Unlock a file excluded from version control
   - **git-utimes(1)** Change files modification time to their last commit date

## AUTHOR

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
