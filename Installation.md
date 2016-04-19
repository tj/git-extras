# Installing git-extras

## Installing with a package manager

### Debian

```bash
$ sudo $apt_pref update
$ sudo $apt_pref install git-extras
```

### Fedora

```bash
$ sudo dnf install git-extras
```

### Ubuntu

```bash
$ sudo apt-get install git-extras
```

### Mac OS X with Homebrew

```bash
$ brew install git-extras
```

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

Last, to use `git line-summary`, `git summary` and `git ignore-io`, you need to copy
`column.exe` from a [msys2][1] installation from `folder-your-msys2-installed/usr/bin`
to `folder-your-git-installed/usr/bin` or wait for git 2.7.1, which will include column.exe.

### BSD

Use the instructions to build from source below. Make sure you are using `gmake` (GNU `make`) instead of `make`.

## Building from source

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
curl -sSL http://git.io/git-extras-setup | sudo bash /dev/stdin
```

## Updating

If you installed git-extras with a package manager, use that package manager's tools to update it.

If you installed git-extras from source, you can run `git-extras update` to update it to the latest release. Be aware that this may lose any configuration options you specified during the original installation.

Enjoy `git-extras`!

[1]: http://sourceforge.net/projects/msys2/
