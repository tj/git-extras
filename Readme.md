# Git Extras

Little git extras.

## Screencasts

Just getting started? Check out these screencasts:

* [introduction](https://vimeo.com/45506445) -- covering git-ignore, git-setup, git-changelog, git-release, git-effort and more

## Installation

See [Installation](Installation.md) page.

## Commands

Go to [Commands](Commands.md) page for basic usage and examples.

__GIT utilities__ -- repo summary, repl, changelog population, author commit percentages and more

## Contributing

Interested in contributing? Awesome!

Please read [Contributing](CONTRIBUTING.md) before you make a PR, thanks!

## The change of the default branch

As of Git Extras 6.4 the assumed default branch name changed from `master` to `main`.
This affects the Git Extras commands `git archive-file`, `git delete-merged-branches`, `git delta`, `git pull-request`, `git show-merged-branches`, `git show-unmerged-branches` and `git squash`.

To change the default branch name to `master`: change either the configuration `git-extras.default-branch` or `init.defaultBranch` to `master`, the former takes precedence.

For example, `git config git-extras.default-branch master`
