git-force-clone(1) -- overwrite local repositories with clone
===

## SYNOPSIS

`force-clone --help`  
`force-clone {remote_url} {destination_path}`  
`force-clone --branch {branch_name} {remote_url} {destination_path}`  

## DESCRIPTION

Provides the basic functionality of `git clone`, but if the destination git
repository already exists it will force-reset it to resemble a clone of the
remote.

Because it doesn't actually delete the directory, it is usually significantly
faster than the alternative of deleting the directory and cloning the
repository from scratch.

**CAUTION**: If the repository exists, this will destroy *all* local work:
changed files will be reset, local branches and other remotes will be removed.

## PROCESS

If `target-directory` doesn't exist or isn't a git repository then the
arguments will simply be passed through to `git clone`.

If `target-directory` exists and is a git repository then this will:

- Remove all remotes
- Set the origin remote to `{remote_url}` and fetch the remote
- Discover the default branch, if no branch was specified
- Check out the selected branch
- Delete all other local branches

## OPTIONS

`{remote_url}` - The URL for a git remote repository of which to make a clone.
`{destination_path}` - A path to the local git repository location to clone into.
`--branch {branch_name}` - After cloning, checkout this branch.

## EXAMPLES

`git-force-clone -b master git@github.com:me/repo.git ./repo_dir`

## AUTHOR

Written by Robin Winslow <robin@robinwinslow.co.uk>.

## REPORTING BUGS

<https://github.com/tj/git-extras/issues>

## SEE ALSO

<https://github.com/tj/git-extras>
