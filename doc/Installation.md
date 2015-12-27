# Installing git-extras

## Installing with a package manager

The simplest way to install git-extras is with your system's package manager, if it has git-extras available.

### Debian

```bash
$ sudo $apt_pref update
$ sudo $apt_pref install git-extras
```

### Mac OS X with Homebrew

```bash
$ brew install git-extras
```

## Installing from network

One-liner to download and install git-extras from source:

```bash
sudo bash -c "$(curl -fsSL https://git.io/git-extras-setup)"
```

## Updating

If you installed git-extras with a package manager, use that package manager's tools to update it.

If you installed git-extras from source, you can run `git-extras update` to update it to the latest release. Be aware that this may lose any configuration options you specified during the original installation.

## Building from source

If git-extras is not available through a package manager for your system, or if you want to customize your installation, you can build git-extras from source.

Obtain the git-extras source by cloning [its GitHub repo](https://github.com/tj/git-extras.git) or downloading a tarball of a [release](https://github.com/tj/git-extras/releases). Then install it by doing `make install` from the source tree.

```bash
$ git clone https://github.com/tj/git-extras.git
$ cd git-extras
# checkout the latest tag
$ git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
$ [sudo] make install
```

### Customizing the installation

You can customize your installation using options to `make`. If you do separate `make build` and `make install` steps, be sure to pass the same options to both invocations of `make`.

#### Installation location

By default, git-extras is installed under `/usr/local`. To install it at an
alternate location, specify a `PREFIX` when calling `make`.

```bash
# Non-root users can install under their home directory
make install PREFIX=$HOME/software

# For third-party software kept under /opt
make install PREFIX=/opt
```

If you want to relocate the bulk of the installation but still have configuration files installed to the system `/etc` dir or other alternate location, you can specify `SYSCONFDIR` in addition to `PREFIX`.

```
$ sudo make install PREFIX=/usr/local SYSCONFDIR=/etc
```

#### Disabling commands

If the installation process detects a `git` alias with the same name as a command in git-extras, it will prompt the user for whether it should be disabled. Alternately, you can have it skip or install all conflicting commands with the `ALIASCONFLICT=skip` or `ALIASCONFLICT=install` options to `make`. This will get you a non-interactive installation process.

You can also unconditionally disable selected commands with the `DISABLECMDS` option. It takes a comma-separated list of commands to disable.

```bash
# A noninteractive installation with some excluded commands that
# ignores alias conflicts
make install ALIASCONFLICT=install DISABLECMDS=git-scp,git-sed,git-psykorebase
```

#### Disabling update

The `git extras update` self-update feature can be disabled with the `SELFUPDATE=disable` option. This is useful for external package managers like Homebrew.

See the Makefile for details on advanced configuration options.

### Hacking on the source

When you do a `make build`, the `build/` directory in the source tree will contain functional versions of the git-extras commands which can be run directly from there. This lets you test code without having to go through a full installation process.

If you make changes to the source code, you must manually do a `make build` or `make clean` to get those changes to be reflected in the `build/` directory before doing additional testing or a `make install`. The Makefile is not fully aware of all the file dependencies, so will not automatically update the built commands when doing a `make install`.

## Windows (use at your own risk)

First, please install Git for Windows 2.x from 'https://github.com/git-for-windows/git/releases' and the basic [msys2][1].
Second, clone the `git-extras` repo into any folder you like.

```bash
git clone https://github.com/tj/git-extras.git
cd git-extras
# checkout the latest tag (optional)
git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
```

After that, execute the `install.cmd` in the command prompt, with the path your Git for Windows 2.x is installed.
For example, I install it in the folder called `C:\SCM\PortableGit` and
the `PREFIX` should be `C:\SCM\PortableGit\mingw64` (for 64-bit release)
or `C:\SCM\PortableGit\mingw32` (for 32-bit release). So I will execute the `install.cmd` like this:

```batch
install.cmd "C:\SCM\PortableGit\mingw64"
```

Last, please copy `colrm.exe` and `column.exe` from `folder-your-msys2-installed/usr/bin` to
`folder-your-git-installed/usr/bin`.

Enjoy `git-extras`!

[1]: http://sourceforge.net/projects/msys2/
