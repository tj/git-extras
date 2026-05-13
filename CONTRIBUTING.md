# Contributing

Thanks for contributing! Please read this document before you make a PR.

## Supported Platforms

Any changes must support the following platforms:

- macOS
- Linux
- OpenBSD (You may need to browse their man page)

Your change must also be compatible with the dependency constraints that we specify in [Installation](./Installation.md). If you aren't sure if a feature is compatible, check the manual or release notes. For example, the Bash changelog is [here](https://git.savannah.gnu.org/cgit/bash.git/tree/NEWS?h=devel).

If you aren't able to test your new command on a platform, make that clear in your PR; someone else may be able to test it on their system.

## Adding a New Command

Let's say you wish to add a new command. Assuming your new command is named `foo`:

1. Write a bash script under `./bin` called `git-foo`. The script should be started with `#!/usr/bin/env bash`.
2. Read `./man/Readme.md` and write documentation for `git-foo`.
3. Don't forget to introduce it in `Commands.md`.
4. Update `./etc/git-extras-completion.zsh`. Just follow existing code.
5. (Optional) Update `./etc/bash_completion.sh`.
6. (Optional) Update `./etc/git-extras.fish`.
7. (Optional) Add a test under `./tests`.
8. Run `./check_integrity.sh foo` to check if all done. (You may also run `./check_integrity.sh` to check all commands.)

You are welcome to open up an issue to discuss new commands or features before opening a pull request.

## Submitting a pull request

Please follow the suggestion in `./.github/PULL_REQUEST_TEMPLATE.md`.
