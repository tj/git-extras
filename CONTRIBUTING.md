## Your new git-extra command should support

* OSX, Ubuntu, FreeBsd(You may need to browse their man page)
* Bash 3.2+ (If you are not sure, [Bash versions](http://tldp.org/LDP/abs/html/bash2.html))
* Git 2.1+

## To submit a new command, you should

Let's assume your new command is named `foo`.

1. Write a bash script under `./bin` called `git-foo`.
2. Read `./man/Readme.md` and write documentation for `git-foo`.
3. Don't forget to introduce it in `Commands.md`.
4. Update `./etc/git-extras-completion.zsh`. Just follow existing code.
5. (Optional) Update `./etc/bash_completion.sh`.
6. Run `./check_integrity.sh foo` to check if all is done.

You are welcome to open up an issue to discuss new commands or features before opening a pull request.
