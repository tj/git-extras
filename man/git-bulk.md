git-bulk(1) -- Run git commands on multiple repositories
========================================================

## SYNOPSIS

    git-bulk [-q|--quiet] [-g] [--no-follow-symlinks] [--no-follow-hidden] ([-a]|[-w WS-NAME]) GIT-COMMAND
    git-bulk --addworkspace WS-NAME WS-ROOT-DIRECTORY (--from URL-OR-FILE)
    git-bulk --removeworkspace WS-NAME
    git-bulk --addcurrent WS-NAME
    git-bulk --purge
    git-bulk --listall

## DESCRIPTION

git bulk adds convenient support for operations that you want to execute on multiple git repositories.

- simply register workspaces that contain multiple git repos in their directory structure
- run any git command on the repositories of the registered workspaces in one command to `git bulk`
- use the "guarded mode" to check on each execution

## OPTIONS

  -a

  Run a git command on all workspaces and their repositories.

  -g

  Ask the user for confirmation on every execution.

  --no-follow-symlinks

  Do not traverse symbolic links under the workspace when searching for git repositories.

  --no-follow-hidden

  Do not traverse hidden (dotted) directories under the workspace when searching for git repositories.

  -w WS-NAME

  Run the git command on the specified workspace. The workspace must be registered.

  GIT-COMMAND

  Any git Command you wish to execute on the repositories.

  --addworkspace WS-NAME WS-ROOT-DIRECTORY (--from URL-OR-FILE)

  Register a workspace for bulk operations. All repositories in the directories below WS-ROOT-DIRECTORY get registered under this workspace with the name WS-NAME. WS-ROOT-DIRECTORY must be an absolute path.

  With option '--from' the URL to a single repository or a file containing multiple URLs can be added and they will be cloned directly into the workspace. Suitable for the initial setup of a multi-repo project.

  --removeworkspace WS-NAME

  Remove the workspace with the logical name WS-NAME.

  --addcurrent WS-NAME

  Adds the current directory as workspace to git bulk operations. The workspace is referenced with its logical name WS-NAME.

  git bulk --purge

  Removes all defined repository locations.

  git bulk --listall

  List all registered repositories.

## EXAMPLES

    Register a workspace so that git bulk knows about it using an absolute path:

    $ git bulk --addworkspace personal ~/workspaces/personal

    Or register a workspace using an environment variable pointing to an absolute path:

    $ git bulk --addworkspace personal '$PERSONAL_WORKSPACE'

    Use option --from in order to directly clone a repository or multiple repositories 

    $ git bulk --addworkspace personal ~/workspaces/personal --from https://github.com/tj/git-extras.git
    $ git bulk --addworkspace personal ~/workspaces/personal --from ~/repositories.txt

    repositories.txt
    ----------------------------------
    https://host-of-git/repo-1.git
    https://host-of-git/repo-2.git
    https://host-of-git/repo-3.git


    Register the current directory as a workspace to git bulk:

    $ git bulk --addcurrent personal

    List all registered workspaces:

    $ git bulk --listall

    Run a git command on the repositories of the current workspace:

    $ git bulk fetch

    Run a git command on the specified workspace and its repositories:

    $ git bulk -w personal fetch

    Run a git command but ask the user for confirmation on every execution (guarded mode):

    $ git bulk -g fetch

    Remove a registered workspace:

    $ git bulk --removeworkspace personal

    Remove all registered workspaces:

    $ git bulk --purge

## FILES

- `.gitconfig`: Store the `git-bulk` registered workspaces under the `bulkworkspaces` key.

## AUTHOR

Written by Niklas Schlimm &lt;<ns103@hotmail.de>&gt;

## REPORTING BUGS

&lt;https://github.com/nschlimm/git-bulk&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
