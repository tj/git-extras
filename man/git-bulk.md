git-bulk(1) -- Run git commands on multiple repositories
========================================================

## SYNOPSIS

usage: usage: git bulk [-g] ([-a]|[-w &lt;ws-name&gt;]) &lt;git command&gt;
       git bulk --addworkspace &lt;ws-name&gt; &lt;ws-root-directory&gt;
       git bulk --removeworkspace &lt;ws-name&gt;
       git bulk --addcurrent &lt;ws-name&gt;
       git bulk --purge
       git bulk --listall

## DESCRIPTION

git bulk adds covenien support for operations that you want to execute on multiple git repositories.

- simply register workspaces that contain multiple git repos in their directory structure
- run any git command on the repositories of the registered workspaces in one command to `git bulk`
- use the "guarded mode" to check on each execution

## OPTIONS

  -a

  Run a git command on all workspaces and their repositories.

  -g 

  Ask the user for confirmation on every execution.

  -w &lt;ws-name&gt;

  Run the git command on the specified workspace. The workspace must be registered.

  &lt;git command&gt;

  Any git Command you wish to execute on the repositories.

  --addworkspace &lt;ws-name&gt; &lt;ws-root-directory&gt;

  Register a workspace for bulk operations. All repositories in the diretories below &lt;ws-root-directory&gt; get registered under this workspace with the name &lt;ws-name&gt;.

  --removeworkspace &lt;ws-name&gt;

  Remove the workspace with the logical name &lt;ws-name&gt;.

  --addcurrent &lt;ws-name&gt;

  Adds the current directory as workspace to git bulk operations. The workspace is referenced with its logical name &lt;ws-name&gt;.

  git bulk --purge

  Removes all defined repository locations.

  git bulk --listall

  List all registered repositories.

## EXAMPLES

    Register a workspace so that git bulk knows about it:
    
    $ git bulk --addworkspace personal ~/workspaces/personal
    
    Register the current directory as a workspace to git bulk:
    
    $ git bulk --addcurrent personal
    
    List all registered workspaces:
    
    $ git bulk --listall
    
    Run a git command on the repositories of the current workspace:
    
    $ git bulk fetch

    Run a git command on the specified workspace and its repositories:

    $ git bulk -w personal fetch
    
    Run a git command but ask user for confirmation on every execution (guarded mode):
    
    $ git bulk -g fetch
    
    Remove a registered workspace:
    
    $ git bulk --removeworkspace personal

    Remove all registered workspaces:
    
    $ git bulk --purge

## AUTHOR

Written by Niklas Schlimm &lt;<ns103@hotmail.de>&gt;

## REPORTING BUGS

&lt;https://github.com/nschlimm/git-bulk&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
