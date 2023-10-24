# Installing git-extras

## Dependencies

Some commands require extra dependencies which are unavailable in some platforms.
You may need to install them manually.

Those dependencies are listed below:

* column
* bash 4.0+

If `bash --version` shows a lower version, you need to update it.
For example, the default bash in Mac is usually too old and you may need to update it via `brew install bash`.

## Installing with a package manager

Note that only the Homebrew package is maintained by the git-extras developers directly.
Other packages are maintained by the distribution's packagers or third-party volunteers.

[![Packaging status](https://repology.org/badge/vertical-allrepos/git-extras.svg)](https://repology.org/project/git-extras/versions)

### Debian

```bash
$ sudo $apt_pref update
$ sudo $apt_pref install git-extras
```

### Fedora

```bash
$ sudo dnf install git-extras
```

### openSUSE

Substitute your openSUSE version in the command below (in this case we are considering openSUSE Leap 15.2):
```bash
$ sudo zypper ar https://download.opensuse.org/repositories/devel:/tools:/scm/openSUSE_Leap_15.2/devel:tools:scm.repo
```

and install it:

```bash
$ sudo zypper in -y git-extras
```

### RHEL/CentOS (requires [EPEL](https://fedoraproject.org/wiki/EPEL))

```bash
$ sudo yum install git-extras
```

### Ubuntu

```bash
$ sudo apt-get install git-extras
```

### Nix/NixOS

```bash
$ nix-env -i git-extras
```

### CRUX

[Abdullah](https://github.com/AWAN) has written a [Pkgfile](https://abdullah.today/ports/git-extras/Pkgfile) for his beloved [distro](https://crux.nu).


### Homebrew

```bash
$ brew install git-extras
```

Installing from Homebrew will not give you the option omit certain `git-extras` if they conflict with existing git aliases. To have this option, build from source.


### Arch Linux

* [git-extras](https://aur.archlinux.org/packages/git-extras/)
* [git-extras-git](https://aur.archlinux.org/packages/git-extras-git/)

### Windows

First, please install `Git for Windows 2.x` from 'https://github.com/git-for-windows/git/releases'.
Second, clone the `git-extras` repo into any folder you like.
```bash
git clone https://github.com/tj/git-extras.git
# checkout the latest tag (optional)
git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
```

After that, execute the `install.cmd` in the command prompt. If you installed
git as admin, you need to run this prompt as admin, too. Per default, it finds
a `Git for Windows 2.x` if it's in the path (first path in `where git.exe` wins)
or installed in the default location `%ProgramFiles%\Git`. The fallback is
`C:\SCM\PortableGit`. If you didn't install git into one of these dirs, you have
to supply the path for the install location, e.g. if git is installed
in `c:\git`:

```batch
install.cmd "C:\git"
```

Last, to use `git summary` and `git ignore-io`, you need to copy
`column.exe` from a [msys2][1] installation from `folder-your-msys2-installed/usr/bin`
to `folder-your-git-installed/usr/bin` or wait for git 2.7.1, which will include column.exe.

### FreeBSD

```bash
$ pkg install git-extras
```

### BSD

Use the instructions to build from source below. Make sure you are using `gmake` (GNU `make`) instead of `make`.

## Building from source

Read [Dependencies](#dependencies) and ensure they are installed.

Obtain the git-extras source by cloning [its GitHub repo](https://github.com/tj/git-extras.git) or downloading a tarball of a [release](https://github.com/tj/git-extras/releases). Then install it by doing `make install` from the source tree.

```bash
$ git clone https://github.com/tj/git-extras.git
$ cd git-extras
# checkout the latest tag
$ git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
$ [sudo] make install
```

By default, git-extras is installed under `/usr/local`. To install it at an
alternate location, specify a `PREFIX` when calling `make`.

```bash
# Non-root users can install under their home directory
make install PREFIX=$HOME/software

# For third-party software kept under /opt
make install PREFIX=/opt
```

If you want to relocate the bulk of the installation but still have configuration
files installed to the system `/etc` dir or other alternate location, you can
specify `SYSCONFDIR` in addition to `PREFIX`.

```
$ sudo make install PREFIX=/usr/local SYSCONFDIR=/etc
```

See the Makefile for details on advanced configuration options.

## Installing from network

One-liner:

```bash
curl -sSL https://raw.githubusercontent.com/tj/git-extras/main/install.sh | sudo bash /dev/stdin
```

## Installing as Zsh plugin

[ZInit](https://github.com/zdharma/zinit) can install git-extras by using:
```zsh
zinit ice as"program" pick"$ZPFX/bin/git-*" src"etc/git-extras-completion.zsh" make"PREFIX=$ZPFX"
zinit light tj/git-extras

# or with the for syntax + async load
zinit lucid wait'0a' for \
as"program" pick"$ZPFX/bin/git-*" src"etc/git-extras-completion.zsh" make"PREFIX=$ZPFX" tj/git-extras

```

`$ZPFX` is `~/.zinit/polaris` by default. Use `zinit update tj/git-extras` to update.
This method installs in `$HOME`, so you don't need to ask administrator to install package.

## Updating

If you installed git-extras with a package manager, use that package manager's tools to update it.

If you installed git-extras from source, you can run `git-extras update` to update it to the latest release. Be aware that this may lose any configuration options you specified during the original installation.

Enjoy `git-extras`!

[1]: https://sourceforge.net/projects/msys2/
