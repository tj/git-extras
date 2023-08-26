# Git Extras

Little git extras.

## Screencasts

Just getting started? Check out these screencasts:

* [introduction](https://vimeo.com/45506445) ([archive.org link](https://web.archive.org/web/20230219181235id_/vod-progressive.akamaized.net/exp=1676834145~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F4101%2F1%2F45506445%2F107111328.mp4~hmac=065b68f23c4b6a222463097b36d1c346995a9559baa9b819972da95550018471/vimeo-prod-skyfire-std-us/01/4101/1/45506445/107111328.mp4)) -- covers `git-ignore`, `git-setup`, `git-changelog`, `git-release`, `git-effort` and more

## Installation

See the [Installation](Installation.md) page.

## Commands

Go to the [Commands](Commands.md) page for basic usage and examples.

__GIT utilities__ -- repo summary, repl, changelog population, author commit percentages and more

## Contributing

Interested in contributing? Awesome!

Please read [Contributing](CONTRIBUTING.md) before you make a PR, thanks!

## The change of the default branch

As of Git Extras 6.4 the assumed default branch name changed from `master` to `main`.
This affects the Git Extras commands `git archive-file`, `git delete-merged-branches`, `git delta`, `git pull-request`, `git show-merged-branches`, `git show-unmerged-branches`, and `git squash`.

To change the default branch name to `master`: change either the configuration `git-extras.default-branch` or `init.defaultBranch` to `master`; the former takes precedence.

For example, `git config git-extras.default-branch master`.
