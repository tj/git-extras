## Your new git-extra command should support

* OSX, Linux, BSD (You may need to browse their man page)<sup>*</sup>
* Bash 3.2+ (If you aren't sure, see [the Bash changelog](http://tldp.org/LDP/abs/html/bash2.html))
* Git 2.1+

<sup>*</sup>If you aren't able to test your new command on a platform, 
make that clear in your PR and someone else may be able to test it on their system.

## To submit a new command, you should

Let's assume your new command is named `foo`.

1. Write a bash script under `./bin` called `git-foo`.
2. Read `./man/Readme.md` and write documentation for `git-foo`.
3. Don't forget to introduce it in `Commands.md`.
4. Add it in the list of commands in `man/git-extras.md` and `man/index.txt`.
5. Update `./etc/git-extras-completion.zsh`. Just follow existing code.
6. (Optional) Update `./etc/bash_completion.sh`.
7. Run `./check_integrity.sh foo` to check if all done.

You are welcome to open up an issue to discuss new commands or features before opening a pull request.
